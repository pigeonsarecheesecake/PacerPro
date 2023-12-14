# README

Hi, my name is William Ryuputra, and this is my submission for PacerPro's Coding Test #1. This program includes a model named Item that has record soft deletion and restoration features.

I apologize for the late submission. I'm very familiar with JavaScript, Next.js, and Tailwind, and this was my first time experimenting with both Ruby and Rails. I had to follow the official documentation and some tutorials, so it took me longer than expected. I also attended Google's developer group event over the weekend.

I've been wanting to try Rails, so thank you for this opportunity. It allowed me to learn something new and potentially be useful for my upcoming projects.

You may notice a strange git commit history (such as defining the methods directly under actions, then moving it to the model) in this repository, which reflects my inexperience with this framework. However, I've learned a lot, and I've been very curious about the MVC design pattern.

Please do make sure you have these installed to run the program.

* Ruby version
- 3.2.2

* SQLite version 
- 3.44.2

* Rails
- 7.1.2

* How to run the program 
- Run "bin/rails server" to start the development server

* How to run the test suite
- Run "bundle exec rspec"

* All items :
- Every item defined by the default scope, items that were not soft deleted. Click item to soft delete or permanently delete.

* Unscoped Results :
- Recycle Bin includes items that were soft deleted. Click the item to restore or permanently delete.
- All Items includes every item in the database.

