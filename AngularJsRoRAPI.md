# Serve AngularJs via Ruby on Rails Backend
Combing the internet for the right forum/discussion etc can be challenging when it comes to finding exactly what you want.
Some are too advanced, some miss certain key steps or some are just too obscure to understand.

The purpose of this tutorial is to show you how to:

   1. CREATE a RoR application
      * set up the application's controller, views and model
         * in the views 
            * AngularJs will live and call to the API
         * the model
            * dictates what is the information squema in the database (we'll get to that) 
      * set up the API module
         * this basically requires a quick command line trip and *viola!*
         * write some methods to retrieve information
    
   * HOOK up AngularJs (using BOWER to handle front end dependencies)
   * SET UP an API to serve data in JSON format
   * MAKE AngularJs CALLS to the API, and
   * touch upon some relevant AngularJs powerfull features

All source code available at: [my-github-account]. 

Lets begin

## 1. Create Rails Project

```rails
$ bin/rails new RailsAPIAngularjs
```

This will get you set up with:
* rails project directory
   * when you create a rails  application, the Rails Framwork automaticall creates a directory with folders and files that set up the most basic project for you: [rails-initial-directory]
   * for more advanced features, there is more on "scaffolding" at [rails-scaffolding]

      Here is the end result in Sublime Text Editor

![rails folder structure][folder-structure-png]

We will be working within (at least) the following folders:
* app/assets
   * javascripts
   * css
* app/controllers
* app/models (just a bit to set up the class for the database)
* app/views
* vendor (for all the font-end dependencies)

## 1.1 Set up the controller, views and model
   
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
* controller
* views
* model
* test suite

The name "RailsObject" is convenient because the generation command uses this name for the controller, model, views, etc..
Since we are dealing with an [ORM-language] (Object Relational Mapping) 

![rails-scaffold-output]




[my-github-account]: <https://github.com/wowiamhere/RailsAPIAngularjs>
[rails-initial-directory]:<http://guides.rubyonrails.org/getting_started.html#creating-the-blog-application>
[rails-scaffolding]: <http://guides.rubyonrails.org/command_line.html#command-line-basics>
[ORM-language]: <http://guides.rubyonrails.org/active_record_basics.html#object-relational-mapping>

[folder-structure-png]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/master/projectData/images/railsAPIAngularjsFolders.png "website logo .png"
[rails-generate-command-png]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/apiController/projectData/images/railsGenerate.png "rails generate command .png"
[rails-scaffold-output]: <https://github.com/wowiamhere/RailsAPIAngularjs/raw/appScaffold/projectData/images/railsObjectScaffold.png> "rails generate scaffold output .png"

