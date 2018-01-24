Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.
  require 'graphql/query_resolver'
  field :authors do
    type !types[Types::AuthorType]
    argument :limit, types.Int, default_value: 20, prepare: -> (limit) { [limit, 30].min }
    resolve -> (obj, args, ctx) {
      Author.limit(args[:limit]).order(id: :desc)
    }
  end

  field :posts, !types[Types::PostType] do
    argument :limit, types.Int, default_value: 20, prepare: -> (limit) { [limit, 30].min }
    resolve -> (obj, args, ctx) {
      Post.limit(args[:limit]).order(id: :desc)
    }
  end

  field :author, !types[Types::AuthorType] do
    argument :id, !types.ID
     resolve -> (obj, args, ctx) {
       GraphQL::QueryResolver.run(Author, ctx, Types::AuthorType) do
         [Author.find(args[:id])]
       end
    }
  end

  field :post, !types[Types::PostType] do
    argument :id, !types.ID
     resolve -> (obj, args, ctx) {
       GraphQL::QueryResolver.run(Post, ctx, Types::PostType) do
         [Post.find(args[:id])]
       end
    }
  end
end
