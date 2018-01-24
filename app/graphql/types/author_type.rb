Types::AuthorType = GraphQL::ObjectType.define do
  name "Author"
  field :id, !types.ID
  field :first_name, !types.String
  field :last_name, !types.String
end
