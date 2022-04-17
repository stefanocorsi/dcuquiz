# README

This is a repository dedicated to Assignment 3 for CA course at DCU Connected.

The following are the requirement for Assignment 3:

> You have to design and build a database that could be used in a real
> world situation, ideally it should be useful in your workplace, but if
> this is not possible, then consider designing something for a charity,
> or perhaps a club that you are a member of. You can use a MySQL or
> MongoDB based solution.
> 
> Do not use real data in your solution. Sites like
> https://www.mockaroo.com/ will generate realistic looking pseudo data
> for your needs. If you are developing a database for work, ensure that
> your employer is comfortable with everything included in your
> submission.
> 
>  - Your design should have: multiple (more than four) tables/collections
>  - Use drop downs where possible to limit users inputting poor data.
>  - Try to use a variety of relationships in your design, e.g. weak, Ternary, Mulitvalued etc.
>  - Appearance can be improved by the use of Cascading Style Sheets (CSS). 
>  - Be brave in your approach, for example maybe even consider generating a real time dashboard of the data.
> 
> If you want, you can use reflect.dcu.ie to store your project work.
> This site is your eportfolio and will be available to you even after
> you leave DCU. It has a limitation of just 5MB of storage, but you can
> use Google Drive and Youtube to store any large files and videos, with
> links from your project. Make sure to share your portfolio/Google
> Drive folders with your tutors.
> 
> Deliverables for the project should include:
> 
>  - Entity diagrams 
>  - Relationship Matrix 
>  - Entity Relationship Diagram
>  -  All code used: SQL, PHP, Python, Java, Javascript, HTML etc. 
>  - Any CSS used
>  - A short (less than 10 minute) Video explaining the project (press Windows G in windows 10 to record). 
>  - Any relevant documents such as    spreadsheets, powerpoint
> 
> Include any relevant references and citations

## The idea and project requirement

For the assignment the idea is to create a new application "DCU Test"

DCUQuiz is an application that allows users to log in and answer a defined set of questions for a DCU's exam or assignment.

It also allows a tutor to create a test and enter a set of questions. 

Questions are multiple-choice. 

Each question can have a number of points assigned to the student.

Each test has a pass threshold.

Students log in with their username and password (registering on the website) and must complete a test in a given time.

If a student doesn't complete the test in time, the test is considered failed.

Tutors can check the results of the tests created by them.

## Technology stack

For this project I will use:

 - The ruby on rails framework
 - The mysql database
 - Rails migrations as the database DML
 - Bootstrap 4.0 as CSS framework
 - Jquery 3.2.1
 - Devise authentication framework
 - Faker data mocking solution

## Entity diagram

![dcutest-entities drawio](https://user-images.githubusercontent.com/6546984/163733929-07443c5d-8e36-4ef5-a450-5728683227b2.png)

## Relationship matrix

![immagine](https://user-images.githubusercontent.com/6546984/163734191-359f1381-e2d0-4cbe-a1cf-ec921a6d6766.png)

## Entity-relationship diagram

![dcutest-er drawio](https://user-images.githubusercontent.com/6546984/163734253-69b2d142-7952-4a4c-9b10-e18b9caaa1f3.png)

## References

**Authentication**
 - https://guides.railsgirls.com/devise

**Rails CRUD and Scaffold**
 - https://medium.com/@nancydo7/ruby-on-rails-crud-tutorial-899117710c7a
 
 **Images (from from Unsplash.com)**
 - https://unsplash.com/photos/-uHVRvDr7pg (https://unsplash.com/@brookecagle)
 - https://unsplash.com/photos/QckxruozjRg (https://unsplash.com/@anniespratt)
 - https://unsplash.com/photos/iQPr1XkF5F0 (https://unsplash.com/@javotrueba)
