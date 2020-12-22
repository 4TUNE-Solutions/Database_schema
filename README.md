
## Main design:

- https://dbdiagram.io/d/5fe245a59a6c525a03bc0703
<br />

### Table segments:
- global
- invertory
- store
<br />

#### `Global tables - EVERY TABLE IN GLOBAL SCOPE HAS PREFIX 'GL_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| :-----------: | :-----------: | :-----------: |
| article_list | id | group, suplier_id |
| shops_list | id | / |
| inventory_list | id | / |
| working_hours | id | shop_id |
| article_group | id | group_name |
| article_sub_group | id | group_id, sub_group_id |
| corpo_buyers_list | id | / |
| access_level_accounts | id | / |
| retail_costs | id | shop_id, type_of_pay |
| retail_costs_types | id | / |

<br/>

- **GL_article_list** -  articles present in the retail system
- **GL_shops_list** - retail shops consisting inside company that is using software
- **GL_inventory_list** - inventories consisting inside company that is using software
- **GL_working_hours** - shop working hours 
- **GL_article_group** - grouping articles for the sake of easier internal organization
- **GL_article_sub_group** - another level of grouping (related article group) 
- **GL_corpo_buyers_list** - *shop client* companies 
- **GL_access_level_accounts** - contains various information about users, admins and workers
- **GL_retail_costs** - consists of costs (bills ,invoices) retail may come across 
- **GL_retail_costs_types** - types of retail costs (electrical power, water, internet, supplier invoices)

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

#### `Shops tables - EVERY TABLE IN SHOP SCOPE HAS PREFIX 'RT_'`

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

- **RT_state** - items/goods present in shop/market
- **RT_fiscal_bills** - contains information about fiscal billing
- **RT_sold_goods** - contains information about goods sold
- **RT_need_order** - contains information about need order to the inventory (shortage of items in shop)
- **RT_need_order_items** - contains information about items needed in shop (related to **RT_need_order**)
- **RT_corpo_sell_invoice** - contains information about selling items to companies over invoices
- **RT_corpo_fiscal_bill** - contains information about selling items to companies over cash (fiscal bills)
- **RT_crde_cards_info** - contains information about all *credit* and *debit* cards used to purchase items/goods

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
| group| int | ❌ | ✅ | ✅ | Grouping articles by certain filter ,(Reference to group) |
| measure_unit| varchar | ❌ | ❌ | ✅ | Measure unit of an item (kg, m...) |
| tax_id| int | ❌ | ❌ | ❌ | Controls TAX % in cash register **(DEFAULT 0)** |
| description| text | ❌ | ❌ | ✅ | Description of an article |
| article_note| text | ❌ | ❌ | ✅ | Additional info about product |
| exp_date| date | ❌ | ❌ | ✅ | Expiration date of an article |
| supplier_id| int | ❌ | ✅ | ✅ | Unique identification value for suppliers , (Reference to supplier) |
| service| boolean | ❌ | ❌ | ❌ | Either service or selling point |
| discount | int | ❌ | ❌ | ✅ | Article discount |

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

`GL_inventory_list`
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
| shop_id| int | ❌ | ✅ | ❌ | Reference to working hours |
| day| varchar | ❌ | ❌ | ❌ | Day in a week |
| opening_hours| time| ❌ | ❌ | ✅ | Defines starting hours |
| closing_hours| time | ❌ | ❌ | ✅ | Defines closing hours |
| working | boolean | ❌ | ❌ | ❌ | Defines if place is open or not |

`GL_article_group`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| group_name| varchar | ❌ | ✅ | ❌ | Referencing name of the group |
| group_color| varchar | ❌ | ❌ | ✅ | OPTIONAL: sorting articles by color |
| discount_amount| int | ❌ | ❌ | ✅ | Amount of discount on article price |

`GL_article_sub_group`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| group_id | int | ❌ | ✅ | ❌ | Referencing group it belongs to |
| sub_group_id | int | ❌ | ✅ | ✅ | OPTIONAL: If sub-group belongs to another sub-group |
| sub_group_name| varchar | ❌ | ❌ | ❌ | Name of the sub-group |
| sub_group_color| varchar | ❌ | ❌ | ✅ | OPTIONAL: sorting articles by color |
| discount_amount| int | ❌ | ❌ | ✅ | Amount of discount on article price |

`GL_article_grouping_connection`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| group_id| int | ❌ | ✅ | ✅ | Referencing group |
| sub_group_id | int | ❌ | ✅ | ✅ | Referencing sub-group |
| article_id | int | ❌ | ✅ | ❌ | Referencing article |

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

`INV_state`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| article_id | int | ❌ | ✅ | ❌ | The reference to article |
|count_number | double | ❌ | ❌ | ❌  | Amount of specific article in inventory |
|purchase_price| double | ❌ | ❌ | ❌  | The price for which is that article paid |
|selling_margin| double | ❌ | ❌ | ❌ | The percent that increases the price of specific article |

`INV_procurement`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| suplier_id| int | ❌ | ✅ | ❌ | The reference to supplier |
| inventory_id| int| ❌ | ✅ | ❌  | The reference to specific inventory  |
| creation_date| date| ❌ | ❌ | ❌  | Date when we created procurement |
| realized| bool | ❌ | ❌ | ❌  | If procurement is done or still filling |

`INV_procurement_items`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
|procurement_id| int | ❌ | ✅ | ❌ | The reference to procurement |
|article_id| int| ❌ | ✅ | ❌  | The reference to specific article  |
|amount_number| double | ❌ | ❌ | ❌  | Order Amount |

`INV_delivery`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
|shop_id| int | ❌ | ✅ | ❌ | The reference to procurement |
|inventory_id| int| ❌ | ✅ | ❌  | Referencing to inventory |
|delivery_date| date | ❌ | ❌ | ❌  | Date when will be delivered |
| realized| bool | ❌ | ❌ | ❌  | If delivery is done or still pending |

`INV_delivery_items`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
|shop_id| int | ❌ | ✅ | ❌ | The reference to procurement |
|article_id| int| ❌ | ✅ | ❌  | Date when will be delivered |
|amount_number| double | ❌ | ❌ | ❌  | Delivery amount  |

`INV_suppliers_list`
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

`RT_state`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| shop_id | int | ❌ | ✅ | ❌ | Reference to shop |
| article_id| int | ❌ | ✅ | ❌  | The reference to specific article  |
| count_number | double | ❌ | ❌ | ❌ | Amount of present articles |
| selling_price | double | ❌ | ❌ | ❌ | Price of article per unit |
| discount | int | ❌ | ❌ | ✅ | Discount for article price (%) |
| expiration_date | date | ❌ | ❌ | ✅ | Expiration date for article |

`RT_fiscal_bills`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id| int | ✅ | ❌ | ❌ | Auto-increment value |
| worker_id | int | ❌ | ✅ | ✅ | Worker which issued a bill |
| shop_id | int | ❌ | ✅ | ❌ | Shop which issued a bill |
| buyer_id | int | ❌ | ✅ | ✅ | Referencing to corpo buyer |
| reference_number | int | ❌ | ❌ | ❌ | Unique number for a bill |
| sum_cash | double | ❌ | ❌ | ✅ | Amount of bill paid with cash |
| sum_card | double | ❌ | ❌ | ✅ | Amount of bill paid with a card |
| final_sum | double | ❌ | ❌ | ❌ | Final amount of a bill |
| money_given | double | ❌ | ❌ | ❌ | Amount of money customer has given |
| cash_back | double | ❌ | ❌ | ❌ | Difference between amount due and amount given  |
| date_time_issued | datetime | ❌ | ❌ | ❌ | Date and time for issued bill |
| TAX_amount | double | ❌ | ❌ | ❌ | Amount of money for TAX |
| discount_amount | double | ❌ | ❌ | ✅ | Amount of money discounted |

`RT_sold_goods`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id | int | ✅ | ❌ | ❌ | Auto-increment value |
| fiscall_bill_id | int | ❌ | ✅ | ❌ | Reference to bill |
| article_id | int | ❌ | ✅ | ❌ | Reference to the article |
| amount | double | ❌ | ❌ | ❌ | Amount of article sold |
| article_cost | double | ❌ | ❌ | ❌ | Cost of article (after discount, if applicable) |
| article_TAX | double | ❌ | ❌ | ❌ | Amount of TAX |
| article_discount | double | ❌ | ❌ | ✅ | Amount of discount (in currency) |

`RT_order_request`
-
| Attribute Name | Data Type | Primary Key | Foreign Key | NULL | Description |
| :-----------: | :-----------: | :-----------: | :-----------: | :-----------: | :-----------: |
| id | int | ✅ | ❌ | ❌ | Auto-increment value |
| inventory_id | int | ❌ | ✅ | ❌ | Referencing to inventory delivering |
| shop_id | int | ❌ | ✅ | ❌ | Referencing to shop ordering |
| creation_date | date | ❌ | ❌ | ✅ | Date order has been created |
| realized | bool | ❌ | ❌ | ❌ | If order request is ready or still in progress |

