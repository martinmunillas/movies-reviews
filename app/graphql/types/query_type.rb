module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :movies, [MovieType], null: false

    def movies
      Movie.all
    end

    field :movie, MovieType, null: true do
      argument :id, ID, required: true
    end

    def movie(id:)
      Movie.find(id)
    end

    field :reviews, [ReviewType], null: false

    def reviews
      Review.all
    end

    field :review, ReviewType, null: true do
      argument :id, ID, required: true
    end

    def review(id:)
      Review.find(id)
    end
  end
end
