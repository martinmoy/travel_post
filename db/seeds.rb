martin = User.create(name: "Martin", email: "martin@martin.com", password: "password")
apple = User.create(name: "Apple", email: "apple@martin.com", password: "password")

a = Post.create(title: "New York City is cool", content: "4th of July", country: "USA", user_id: martin.id)
b = Post.create(title: "Medoc, France is cool", content: "Medoc Marathon", country: "USA", user_id: apple.id)
c = Post.create(title: "Toronto, Canada is cool", content: "CNY", country: "USA", user_id: martin.id)