#line

##Database creation

##tables

###users
| column | type   |
|:------:|:------:|
|  name  | string |
| idname | string |

###messages
| column | type  |foreign_key|
|:------:|:-----:|:---------:|
| body   | text  |           |
| image  | string|           |
| group_id | references |true|
| user_id  | references |true|

###groups
| column | type | unique | null |
|:------:|:----:|:------:|:----:|
|  name  | string| true  | false|

###users_groups
| column | type     | foreign_key  |
|:------:|:--------:|:------------:|
|user_id |references| true         |
|group_id|references| true         |


##association

###User
- has_many :users_groups
- has_many :groups, through: :users_groups
- has_many :messages

###Message
- belongs_to :user
- belongs_to :group

###Group
- has_many :users_groups
- has_many :users, through: :users_groups
- has_many :messages

###User_Group
- belongs_to :user
- belongs_to :group

