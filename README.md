## Main design:

- https://dbdiagram.io/d/5fe0b0929a6c525a03bbddcb

<br />

### Table segments:
- global
- invertory
- store

<br />

#### `Global tables - EVERY TABLE IN GLOBAL SCOPE HAS SUFIX 'GL_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| ----------- | ----------- | ----------- |
| article_list | / | / |
| shop_list | / | / |
| article_group | / | / |
| corpo_buyers_list | / | / |
| access_level_accounts | / | / |
| retail_costs | / | / |

<br />

#### `Invertory tables - EVERY TABLE IN INVERTORY SCOPE HAS SUFIX 'INV_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| ----------- | ----------- | ----------- |
| state | / | / |
| procurement | / | / |
| sent_goods | / | / |
| suppliers_list | / | / |

<br />

#### `Global tables - EVERY TABLE IN SHOP SCOPE HAS SUFIX 'SR_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| ----------- | ----------- | ----------- |
| state | / | / |
| fiscal_bills | / | / |
| sold_goods | / | / |
| purchase_order | / | / |
| purchase_order_items | / | / |
| corpo_sell_invoice | / | / |
| corpo_fiscal_bill | / | / |.
| crde_cards_info | / | / |

</center>
