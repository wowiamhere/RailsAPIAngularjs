Serve AngularJs via Ruby on Rails Backend
=

We will be working with:
+ Rails 4.2.5
+ Bower
+ Bootstrap
+ AngularJs

The purpose of this tutorial is to show you how to:

1. CREATE a RoR application
    + set up the application's controller, views and model
    + in the views 
        * AngularJs will live and call to the API
        * will do some styling to set-up for out CRUD functions via AngularJS 
     + the model
        + dictates what is the information squema in the database (we'll get to that) 
2. set up the API module
     * this basically requires a quick command line trip and *viola!*
     * write some methods to retrieve information

* HOOK up AngularJs (using BOWER to handle front end dependencies)
* SET UP an API to serve data in JSON format
* MAKE AngularJs CALLS to the API, and
* touch upon some relevant AngularJs powerfull features

All source code available at: [my-github-account]. 

Lets begin

1.0 Create Rails Project
=

```rails
$ bin/rails new RailsAPIAngularjs
```
This will get you set up with:
+ rails project directory
   + when you create a rails  application, the Rails Framwork automaticall creates a directory with folders and files that set up the most basic project for you: [rails-initial-directory]
   * for more advanced features, there is more on "scaffolding" at [rails-scaffolding]

Here is the end result in Sublime Text Editor

![rails folder structure][folder-structure-png]

We will be working within (at least) the following folders:

+ app/assets
   * javascripts
   * css
+ app/controllers
+ app/models (just a bit to set up the class for the database)
+ app/views
+ vendor (for all the font-end dependencies)

1.1 Set up the controller, views and model
--
   
[rails-scaffolding] is a powerful command line tool that lets you generate files/folders/code to minimazie all boring/repetitive coding.

From the command line you can explore various options for generation for your app
```rails
$ rails generate
```
will give you a list of options to choose from and their respective optional parameters, 

![rails-generate-command-png]

this is only available from the home directory of your app after you have created it via the 
```rails
$ rails new [app-name]
```
command.

Let's run the generation command 
```rails
rails generate scaffold RailsObject firstName:string lastName:string
```
The 'scaffold' option of the command sets you up with 
+ controller
+ views
+ migration
+ test suite

The name "RailsObject" is convenient because the generation command uses this name for the controller, migration, views, etc..
Since we are dealing with an [ORM-language] (Object Relational Mapping) 

![rails-scaffold-output]

All that an application needs to interact with a database has been set in place
+ the controllers that run the show
+ the routing file, which directs requests to the appropriate action/method within the controller
+ the set of views for each action/method within the controller
   - index -- to list all database information (as objects with a 1-to-1 relationship with table columns/rows, etc..) 
   - edit -- to update database
   - show -- view a specific record
   - new -- create a new entry
+ the migration
   - the file that will define the database
+ helpers
   - these modules are available to aid the controllers. You may code any functions/methods that fit your needs.  They are automatically available in all views
   - assets -- all javascript, css, etc.

If you run 
```rails
rails server
```
to  check if the Application runs on a web browser you will see this following error:

![migration-pending-error]

to fix this you must run the rails command
```rails
$ bundle exec rake db:migrate
```
bundle exec makes sure that the version of the rake command being run corresponds to the version within the Gemfile of the application, which is located in the root directory without a file extension

![migration]

Now we have an app up and running with:
* CRUD capabilities (create, read, update, delete)

Run
```rails
$ rails server
```
to view the default Rails home screen.

![rails-default-home]

This is where our Angular application will be hard coded.  It is from here that:

+ Angular will make calls via an API module to the database
+ Display that response on this main view within your applciation

On to creating our backend API.

1.2 Setting the routes
--
The default routes created by the scaffolding system looks as follows in `~/config/routes.rb` 

![rails-routes1]

to redefine the application's home page, open routes.rb and type

```rails
get '/' => 'rails_objects#index'
```
Now a request to `localhost:3000` or to `http://www.yourWebsite.com` is handled by the `index` method` of the `angular_data` controller within the `api module`.
Some refractoring within the `~/app/views` and we'll launch the server to take a look.

1.3 Preparing ~/app/controllers
--


1.4 Preparing ~/app/views
--

Setting up some stylying to prepare the Front End where our AngularJs app will live.
Let's start with `~/app/views/rails_objects/index.html.erb`. Copy the code from below into your project:

![index-view]

The `<% @rails_objects.each do |rails_object| %> <% end %>` block loops through the object from the `index` controller, `rails_object` in this case, and renders each attibute of the Active Record Object within a table via the `<%= %>` erb syntax.

2.0 Set Up the API module (rails for namespace)
=

We will run the `generate command` but we will not be using the views part of the API. We will use the controllers to fetch information for us.

```rails
$ rails generate scaffold_controller api/AngularData --model-name=rails_objet
```
the `--model-name=rails_object` option lets you pass in the model name that the scaffolding system is going to use to generate the code within the methods of the controller.

This is the output in the command line:

![rails-api-scaffold]

`$ rails generate scaffold_controller` has generated a module based on the name passed for the controller, in this case `api/AngularData`, for both the app/controllers and app/views folders, amongst others.




[my-github-account]: <https://github.com/wowiamhere/RailsAPIAngularjs>
[rails-initial-directory]:<http://guides.rubyonrails.org/getting_started.html#creating-the-blog-application>
[rails-scaffolding]: <http://guides.rubyonrails.org/command_line.html#command-line-basics>
[ORM-language]: <http://guides.rubyonrails.org/active_record_basics.html#object-relational-mapping>

[folder-structure-png]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/master/projectData/images/railsAPIAngularjsFolders.png "website logo .png"
[rails-generate-command-png]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/apiController/projectData/images/railsGenerate.png "rails generate command .png"
[rails-scaffold-output]: <https://github.com/wowiamhere/RailsAPIAngularjs/raw/appScaffold/projectData/images/railsObjectScaffold.png> "rails generate scaffold output .png"
[migration-pending-error]: https://github.com/wowiamhere/RailsAPIAngularjs/blob/appScaffold/projectData/images/migrationsPendingError.png?raw=true "migragrions pending error .png"
[migration]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/appScaffold/projectData/images/migration.png "migration .png"
[rails-default-home]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/master/projectData/images/railsDefaultHome.png "rails default home page .png"
[rails-api-scaffold]: https://github.com/wowiamhere/RailsAPIAngularjs/blob/apiController/projectData/images/apiScaffoldFolders.png?raw=true "api scaffold dir .png"
[rails-routes1]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/apiController/projectData/images/routes1.png "routes.rb from scaffold .png"
[index-view]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/apiController/projectData/images/viewIndex.png "index code .png"