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
| ----------- | ----------- | ----------- |
| article_list | / | / |
| shop_list | / | / |
| article_group | / | / |
| corpo_buyers_list | / | / |
| access_level_accounts | / | / |
| retail_costs | / | / |

<br/>

- **GL_article_list** -  articles present in the retail system
- **GL_shop_list** - retail shops consisting inside company that is using software
- **GL_article_group** - grouping articles for the sake of easier internal organization
- **GL_corpo_buyers_list** - *shop client* companies 
- **GL_access_level_accounts** - contains various information about users, admins and workers
- **GL_retail_costs** - consists of costs retail may come across (electrical power, water, internet, supplier invoices)

<hr>
<br />

#### `Invertory tables - EVERY TABLE IN INVERTORY SCOPE HAS PREFIX 'INV_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| ----------- | ----------- | ----------- |
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
| ----------- | ----------- | ----------- |
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
