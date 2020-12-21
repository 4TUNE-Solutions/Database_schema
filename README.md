
## Main design:

- https://dbdiagram.io/d/5fe0b0929a6c525a03bbddcb
<br />

### Table segments:
- global
- invertory
- store
<br />

#### `Global tables - EVERY TABLE IN GLOBAL SCOPE HAS PREFIX 'GL_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| :-----------: | :-----------: | :-----------: |
| article_list | / | / |
| shops_list | / | / |
| article_group | / | / |
| corpo_buyers_list | / | / |
| access_level_accounts | / | / |
| retail_costs | / | / |

<br/>

- **GL_article_list** -  articles present in the retail system
- **GL_shops_list** - retail shops consisting inside company that is using software
- **GL_article_group** - grouping articles for the sake of easier internal organization
- **GL_corpo_buyers_list** - *shop client* companies 
- **GL_access_level_accounts** - contains various information about users, admins and workers
- **GL_retail_costs** - consists of costs retail may come across (electrical power, water, internet, supplier invoices)

<hr>
<br />

#### `Invertory tables - EVERY TABLE IN INVERTORY SCOPE HAS PREFIX 'INV_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| :-----------: | :-----------: | :-----------: |
| state | / | / |
| procurement | / | / |
| sent_goods | / | / |
| suppliers_list | / | / |

<br/>

- **INV_state** - items/goods present in invertory
- **INV_procurement** - every procurement request
- **INV_sent_goods** - contains information about sending goods from inventory to store(s)
- **INV_suppliers_list** - contains information about all suppliers

<hr>
<br />

#### `Global tables - EVERY TABLE IN SHOP SCOPE HAS PREFIX 'SR_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| :-----------: | :-----------: | :-----------: |
| state | / | / |
| fiscal_bills | / | / |
| sold_goods | / | / |
| need_order | / | / |
| need_order_items | / | / |
| corpo_sell_invoice | / | / |
| corpo_fiscal_bill | / | / |.
| crde_cards_info | / | / |

<br/>

- **SR_state** - items/goods present in shop/market
- **SR_fiscal_bills** - contains information about fiscal billing
- **SR_sold_goods** - contains information about goods sold
- **SR_need_order** - contains information about need order to the inventory (shortage of items in shop)
- **SR_need_order_items** - contains information about items needed in shop (related to **SR_need_order**)
- **SR_corpo_sell_invoice** - contains information about selling items to companies over invoices
- **SR_corpo_fiscal_bill** - contains information about selling items to companies over cash (fiscal bills)
- **SR_crde_cards_info** - contains information about all *credit* and *debit* cards used to purchase items/goods

<hr>
<br/>

# Table description

## Global tables

`GL_article_list`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| barcode*| varchar | ❌ | ❌ | ✅ | Barcode of an item, can be multiple referencing |
| article_name| varchar | ❌ | ❌ | ❌ | Full article name |
| group| int | ❌ | ✅ | ✅ | Grouping articles by certain filter |
| measure_unit| varchar | ❌ | ❌ | ✅ | Measure unit of an item (kg, m...) |
| tax_id| int | ❌ | ❌ | ❌ | Controls TAX % in cash register **(DEFAULT 0)** |
| description| text | ❌ | ❌ | ✅ | Description of an article |
| article_note| text | ❌ | ❌ | ✅ | Additional info about product |
| exp_date| date | ❌ | ❌ | ✅ | Expiration date of an article |
| supplier_id| int | ❌ | ✅ | ✅ | Unique identification value for suppliers  |
| service| boolean | ❌ | ❌ | ❌ | Either service or selling point |

`GL_shops_list`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| name| varchar | ❌ | ❌ | ❌ | Name of workplace |
| address| varchar | ❌ | ❌ | ✅ | Address of workplace |
| city| varchar| ❌ | ❌ | ✅ | City where workplace is located |
| postal_code| varchar | ❌ | ❌ | ✅ | Postal code for workplace |
| email| varchar| ❌ | ❌ | ✅ | Email address for workplace |
| mobile*| varchar | ❌ | ❌ | ✅ | Mobile number for workplace |
| operating| boolean | ❌ | ❌ | ❌ | Shop working or not |

`GL_working_hours`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| shop_id| int | ❌ | ✅ | ❌ | Connecting shop with daily working hours |
| day| varchar | ❌ | ❌ | ❌ | Day in a week |
| opening_hours| time| ❌ | ❌ | ✅ | Defines starting hours |
| closing_hours| time | ❌ | ❌ | ✅ | Defines closing hours |
| working | boolean | ❌ | ❌ | ❌ | Defines if place is open or not |

`GL_article_group`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| group_name| varchar | ❌ | ✅ | ❌ | Name of the group |
| group_color| varchar | ❌ | ❌ | ✅ | OPTIONAL: sorting articles by color |

`GL_article_sub_group`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| group_id | int | ❌ | ✅ | ❌ | Referencing group it belongs to |
| sub_group_id | int | ❌ | ✅ | ✅ | OPTIONAL: If sub-group belongs to another sub-group |
| sub_group_name| varchar | ❌ | ❌ | ❌ | Name of the sub-group |
| sub_group_color| varchar | ❌ | ❌ | ✅ | OPTIONAL: sorting articles by color |

`GL_corpo_buyers_list`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| name| varchar | ❌ | ❌ | ❌ | Name of company |
| address| varchar | ❌ | ❌ | ✅ | Address of company |
| city| varchar| ❌ | ❌ | ✅ | City where company is located |
| postal_code| varchar | ❌ | ❌ | ✅ | Postal code for company |
| email| varchar| ❌ | ❌ | ✅ | Email address for company |
| telephone| varchar | ❌ | ❌ | ✅ | Mobile number for company |
| mobile| varchar | ❌ | ❌ | ✅ | Mobile number for company |
| fax | varchar | ❌ | ❌ | ✅ | Fax number for company |
| website | varchar | ❌ | ❌ | ✅ | Website of the company |
| contact_person | varchar | ❌ | ❌ | ✅ | Company's contact person |
| bank_account_number* | varchar | ❌ | ❌ | ✅ | Company's bank account number |
| TIN | varchar | ❌ | ❌ | ❌ | TAX Identification Number (PIB) |
| UCID | varchar | ❌ | ❌ | ❌ | Unique Company Identification Number (MB) |
| taxpayer | boolean | ❌ | ❌ | ❌ | Wether company is in tax system |

`GL_access_level_accounts`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| worker_name | varchar | ❌ | ❌ | ✅ | Worker's full name |
| visible_name | varchar | ❌ | ❌ | ❌ | Nickname in software |
| username | varchar | ❌ | ❌ | ❌ | Worker's username, LOGIN |
| password | varchar | ❌ | ❌ | ❌ | Worker's password, LOGIN |
| is_admin | boolean | ❌ | ❌ | ❌ | Defines if user has admin privileges |
| is_manager | boolean | ❌ | ❌ | ❌ | Defines if user has manager privileges |

`GL_retail_costs`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| shop_id | int | ❌ | ✅ | ❌ | Reference to shop/workplace |
| type_of_pay | int | ❌ | ✅ | ❌ | Type of bill, references to bill type |
| issuance_day | date | ❌ | ❌ | ❌ | Day of bill issuance |
| due_month | int | ❌ | ❌ | ❌ | Month of debt towards issuer |
| due_year | int | ❌ | ❌ | ❌ | Year of debt towards issuer |
| cost | double | ❌ | ❌ | ❌ | Amount of due money on bill |
| payment_code | int | ❌ | ❌ | ✅ | Payment code |
| reference_number | varchar | ❌ | ❌ | ✅ | Unique number connecting payer and issuer |
| payer_name | varchar | ❌ | ❌ | ❌ | Name of payer |

`GL_retail_costs_types`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| service_name | varchar | ❌ | ❌ | ❌ | Name of the service that bill is referencing to |
| service_bank_account_number | varchar | ❌ | ❌ | ✅ | Bank account of bill issuer |
