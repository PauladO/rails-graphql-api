Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :upvote, function: Mutations::UpVote.new

end
