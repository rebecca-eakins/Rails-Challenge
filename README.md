## Ellevate Rails Blog Challenge

### Setup
Please pull this repository locally and run these commands to get the application up and running.

1. `bundle` to install all required gems.
2. Set the username of your postgres user in `config/database.yml`.
3. Use these commands to create, setup and seed the database: `rake db:create db:migrate db:seed`

### Structure
The application is a relatively straightforward Rails app built around a blog.

#### Models
There are three main models in this application:

1. `Posts` which contain the blog posts.
2. `Authors` which contains the authors of the posts.
3. `Tags` which contains the tags for the posts.

There is an additional table `Posts_Tags` that contains the connection between a `post` and `tag`.

This is the relationship of the tables:

![](https://raw.githubusercontent.com/EllevateFinancial/Rails-Challenge/master/public/db_schema.png)

### Tasks

These are the tasks we'd like you to complete:

1. On the posts index and individual post page there is a static block of content in a `<p class="lead"></p>`. We'd like you to replace the static lead paragraph and replace it with the first paragraph from each post and have it structured and styled in the same way.
2. The date for each post says "Posted on August 24, 2013 at 9:00 PM". We'd like you to update the date to show the proper date and time that the post was made in the Eastern timezone.
3. Currently, to show the first and last name together in the views we had to use some pretty gnarly code (`<%= [post.author.first_name, post.author.last_name].join(' ') %>`). We'd like you to refactor that view code (and any other code that needs to be rewritten/written) to make this view a bit more clear, without logic in the template. Additionally, on the new post page, instead of just showing the last name in the list of authors, please update the code to show the list of names in this format: "Michael Smith".
4. Currently there is no subhead field on the input form on the new posts page. Please add a form field for that database field. Additionally, please make an update to the view to showcase the subhead in a semantic way.
5. We have a real SEO problem! The SEO on the index page is fine, but on the individual post pages we want the page title to be updated using the format: `Rails Based Blog - #{POST_TITLE}`. Additionally, we want to update the `description` meta value and `keywords` meta value to be the first two lines of the body and list of tags (comma-separated), respectively.

### Assumptions

- We're expecting you to work on this alone without help from friends, colleagues and/or mentors. But we expect you to work on this in the same way that you'd work if you came to work for us. That means resources like Google, Stack Overflow, Rails Guides, etc., are totally at your disposal.
- We don't expect this to take more than an hour or two. If it feels like you're getting stuck or not able to make progress, reach out and we'll see if we can send you in the right direction. Don't hesitate to ask questions!
- When you've completed the tasks, please commit your code, rebase/clean up your commits as needed and send us over a pull request.
- Most importantly: Leave the code as well as or better than you found it. We're looking at this in a comprehensive way that is both objective ("Did the engineer do what was asked?", "Does it work?") and subjective ("Did the engineer improve the codebase for their team, leave it at a good level of cleanliness, or make it worse?").

### Good Luck! We hope that you enjoy what we hope is a relatively "real world" challenge!
