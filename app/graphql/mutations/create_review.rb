class Mutations::CreateReview < Mutations::BaseMutation
    argument :movie_id, ID, required: true
    argument :stars, Int, required: true
    argument :title, String, required: true
    argument :body, String, required: true

    field :review, Types::ReviewType, null: false
    field :errors, [String], null: false

    def resolve(movie_id:, stars:, title:, body:)
        movie = Movie.find(movie_id)
        if movie.nil?
            return {
                review: nil,
                errors: ["Movie not found"]
            }
        end
        review = movie.reviews.create(
            movie_id: movie_id,
            stars: stars,
            title: title,
            body: body
        )

        if review.save
            {
                review: review,
                errors: []
            }
        else
            {
                review: nil,
                errors: review.errors.full_messages
            }
        end
    end
end