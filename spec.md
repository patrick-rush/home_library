# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Used Sinatra along with Corneal to build the app
- [x] Use ActiveRecord for storing information in a database - ActiveRecord was used
- [x] Include more than one model class (e.g. User, Post, Category) - I have User, Book, Genre, and Note classes
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has_many Books, Book has_many Notes, Genre has_many Books, User has_many Notes through Books
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Book belongs_to both User and Genre and Note belongs_to Book
- [x] Include user accounts with unique login attribute (username or email) - User validates email presence and uniqueness as well as the presence to a first name
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - A user can Create, Read, Update, and Destroy Books as well as Notes
- [x] Ensure that users can't modify content created by other users - The controllers varify that the user trying to modify/edit content is both signed in and the owner of that content
- [x] Include user input validations - Book, Note, and User all validate input
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - Used Sinatra Flash to display errors and success messages to the user
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - Check!

Confirm
- [x] You have a large number of small Git commits - I commited often and also made better use of branches on this project than on the previous one
- [x] Your commit messages are meaningful - I made my commit messages as meaningful and straightforward as possible
- [x] You made the changes in a commit that relate to the commit message - I tried to only commit one or two changes at a time
- [x] You don't include changes in a commit that aren't related to the commit message - Yep!