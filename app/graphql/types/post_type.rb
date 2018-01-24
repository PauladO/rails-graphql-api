Types::PostType = GraphQL::ObjectType.define do
  name "Post"
  field :id, !types.ID
  field :title, types.String
  field :author, Types::AuthorType
  field :votes, types.Int
end
