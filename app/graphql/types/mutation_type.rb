module Types
  class MutationType < Types::BaseObject
    field :create_movie, mutation: Mutations::CreateMovie
    field :create_review, mutation: Mutations::CreateReview
  end
end
