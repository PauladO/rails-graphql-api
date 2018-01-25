class Mutations::UpVote < GraphQL::Function
  # define the required input arguments for this mutation
  argument :post_id, !types.Int

  # define what the return type will be
  type Types::PostType

  # resolve the field, perfoming the mutation and its response
  def call(obj, args, ctx)


    post = Post.find(args[:post_id])

    post.votes += 1
    post.save

    post
  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new("No Post with ID #{args[:post_id]} found.")
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end
