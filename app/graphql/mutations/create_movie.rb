class Mutations::CreateMovie < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :image, String, required: true

    field :movie, Types::MovieType, null: true

    field :errors, [String], null: false


    def resolve(title:, description:, image:)
        movie = Movie.new(title: title, description: description, image: image)
        if movie.save
            {
                movie: movie,
                errors: []
            }
        else
            {
                movie: nil,
                errors: movie.errors.full_messages
            }
        end
    end
end