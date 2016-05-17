# Seed Application



![plant](https://cloud.githubusercontent.com/assets/1239497/11179383/941c81cc-8c5b-11e5-9607-2ba96405f406.png) A seed application is a small fully functional application that you can grow and adjust easily.

## The problem

Have you ever had an idea for an application or arrived at a Hackathon energized to get going? Then reality hits, all the work you need to do just to start working on your latest and greatest application idea. Energy levels are going down fast... 4 hours later you are still trawling your GitHub account for all the things you need from applications you did in the past.

## The solution

Create a seed application!

A seed application is a **small fully functional application** you can easily grow and adjust. An application that does **all the basic things you need**, without any of the clutter of the business logic of your previous killer application.

It's a small spark that **sets your application development alight**. It's important that you understand it well. You should own it. It should **reflect your style and choices**, and you should maintain it. As you learn new things you should remember to **update your seed application**.

## Your Seed Application

### First Version

Create a first version of your Express Seed Application in a new git repository. It should support:

* Using an environment variable for the port number
* Basic CRUD using MySQL
  * include a basic MySQL database script
  * 2-3 database tables linked with foreign keys
  * examples of how to create database(s) and username/password
* Error handling
* HTTP sessions
* Handlebars templates
* Forms
* using the [Bootstrap framework](http://getbootstrap.com/)
  * Basic navigation
  * Responsive layout support

It should have:
  * a `README.md` that shows the user how to get the application running.
  * a `package.json` to handle the dependencies of your application.
  * a `.gitignore` file and ensure that the `node_modules` folder is not committed to GitHub.

You can add a `package.json` using `npm init`. Add packages to your application using `npm install <packagename> --save`.

### Later Versions

Later versions of your Seed Application should have:

* Authentication using middleware
* Password encryption using bcrypt
* A basic user registration example

## Clear instructions

Your Seed Application should have clear instructions for **installing** and **running** your application so that you (and other people) can use it more easily. **All of your tests should pass** so that we can be sure that the application is in a good state.

Add instructions in the `README.md` that show the user how to get the application running. The steps should look something like this:

* Clone the repository
* Set up the database
* Install the dependencies
* Run the application

Each step should give an example command, like this:

> Install the dependencies by running:
>
> `npm install`

## Maintain it

It's important that you **keep your seed application up to date** with the latest things you have learned. And also to create **new Seed Applications** as you learn **new languages and technologies**.

Have Fun! :)
