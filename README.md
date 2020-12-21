# Database_schema

## Main design:

- https://dbdiagram.io/d/5fe08d4a9a6c525a03bbd7d3

### Table segments:
- global
- invertory
- store

#### `Global tables - EVERY TABLE IN GLOBAL SCOPE HAS SUFIX 'GL_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| ----------- | ----------- | ----------- |
| article_list | / | / |
| shop_list | / | / |
| article_group | / | / |
| corpo_buyers_list | / | / |
| access_level_accounts | / | / |
| retail_costs | / | / |

#### `Invertory tables - EVERY TABLE IN INVERTORY SCOPE HAS SUFIX 'INV_'`

| Table Name | Primary Key(s) | Foreign key(s) |
| ----------- | ----------- | ----------- |
| state | / | / |
| procurement | / | / |
| sent_goods | / | / |
| suppliers_list | / | / |

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
