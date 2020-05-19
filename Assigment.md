# CitizenLab Full-Stack Engineer Assignment

## Introduction

The goal of this assignment is to develop a functioning web application that allows citizens to browse through participation projects. Administrators can define and edit these projects.

## Assignment

### The model

The app displays participation projects. A project can optionally be contained in a folder. A folder can also be contained in a folder. Projects can have associated topics, folders can't.

There's some sample data in `sample_data.json`, which you can use to seed your database, if you want. The sample data is there to save you some time, not to influence you on how to structure your data models. Feel free to model it the best way you see fit.

### Homepage

The homepage shows a single listing containing a mix of both projects and folders. Projects and folders that are in a folder themselves, are not shown on the homepage. Newer projects/folders appear above older projects/folders. If a project has topics, these are also displayed on the project in the listing.

A user can filter the projects by topic. If the filter is used, only projects that have the selected topic are shown in the list. Folders, having no topics, always stay in the list. Using the filter does not refresh the webpage, but updates the DOM. As there can be many projects, the filtering operation should happen on the server.

### Folder info page (nice to have)

When the user clicks a folder, she goes to a page that displays the folder title and description. It also lists the folders and projects contained in that folder. Folders in this listing can be clicked to go to their respective info page.

### Admin section (nice to have)

In the admin section, new projects can be added. The title, description, topics and folder of existing projects can be modified.

## Things you shouldn't do

Your time is very limited, so here are some things you explicitly **don't** have to do.

- Info page for projects
- Authentication or authorization, even for admins
- Admin interface to manage folders, but do provide us with a way to load them into the database
- Dealing with responsiveness, we'll check it on desktop

## Checklist

Issues and blockers can't always be predicted and writing software under time pressure is hard. It's okay if you don't get everything done. Include the following section in your own README file and cross (`[x]`) the things you were able to do.

### Must have

- [ ] Data model that fully represents the described system
- [ ] Homepage listing projects and folders
- [ ] Topics filter on the homepage

### Nice to have

- [ ] Info page for a folder
- [ ] Admin interface to create new projects
- [ ] Admin interface to edit existing projects

### Bonus

We prefer that you focus on covering the base requirements. Quality over quantity. In case you'd have time left, here are some bonus things you could amaze us with.

- [ ] Make the topic filter on the homepage also apply to folders, by looking at the projects within the folder
- [ ] Add breadcrumbs to the project/folder info pages
- [ ] Support images for projects/folders
- [ ] Let admins define the order of projects and folders themselves
- [ ] ... Surprise us!

## Rules

- You have **3 hours** to get as far as you can.
- You can use **any mix of languages, libraries or frameworks** you want. Pick whatever you're comfortable with, it won't affect your evaluation. When in doubt, at CitizenLab we love Ruby and React ;)
- If you base some of your work on **specific code snippets**, StackOverflow answers, gists or tutorials, add a link to them in your code comments. We don't consider this a weakness.
- You've **written** all code that doesn't include such a comment **yourself**.
- We'll only take commits within the 3 hour limit into account.

## Getting started

1. Click [here](https://github.com/CitizenLabDotCo/cl-assignment-full-stack/generate) or click the green `Use this template` button on top to make a private copy of this repository on your own account.

2. Git clone your own repository on your machine.

3. Put all your code in there

4. When you're done make sure to update the README, push it all and share your repository with github user `kogre`

## Evaluation

We will evaluate your solution over these axis:

- **Requirements** Does the solution conform to our description?
- **Engineering** Does your architecture make sense? Is the data model sane? Is it fast enough? How does it scale?
- **Maintainability** Is your code simple enough? How did you name things? Have you written any tests? Are you correctly applying dependencies?
- **Usability** How nice is your solution for the end user? Does it work well? Does it look nice?

If you've impressed us with your work, we'll invite you for a discussion with our engineering team. The conversation about the way you've got there will be at least as important as the result of the assignment itself.

Thank you and good luck!
