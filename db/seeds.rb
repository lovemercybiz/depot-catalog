# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
Product.create!(title: 'Roses', 
    description:
    %{<p>
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. At exercitationem hic suscipit? Error necessitatibus dignissimos blanditiis quas consequuntur quam totam vel corporis illo. Autem, magni atque facilis repellendus doloremque laboriosam! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Veritatis consectetur vitae modi temporibus exercitationem sequi possimus ipsum commodi itaque provident. Quo aut dolore ratione mollitia molestias exercitationem, expedita placeat voluptate? 
            </p>},
    image_url: 'roses.jpg',
    price: 29.99)