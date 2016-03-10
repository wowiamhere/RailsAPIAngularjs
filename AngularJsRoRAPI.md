[my-github-account]: <https://github.com/wowiamhere/RailsAPIAngularjs>
[Rails]: <http://guides.rubyonrails.org/getting_started.html>
[rails-initial-directory]:<http://guides.rubyonrails.org/getting_started.html#creating-the-blog-application>
[rails-scaffolding]: <http://guides.rubyonrails.org/command_line.html#command-line-basics>
[ORM-language]: <http://guides.rubyonrails.org/active_record_basics.html#object-relational-mapping>
[Active-Record-object]: <http://guides.rubyonrails.org/active_record_basics.html#crud-reading-and-writing-data>
[Bootstrap]: <http://getbootstrap.com/css>
[ruby-gems]: <https://rubygems.org/gems/bootstrap-sass>
[Sass]: <http://sass-lang.com/guide>
[asset-pipeline]: <http://guides.rubyonrails.org/v3.2.8/asset_pipeline.html#what-is-the-asset-pipeline>
[Bower]: <http://bower.io/>
[Node, npm]: <https://nodejs.org/en/>
[Bower-components]: <http://bower.io/search/>
[AngularJs]: <https://docs.angularjs.org/guide>
[Sublime]: <https://www.sublimetext.com/>
[module]: <https://docs.angularjs.org/guide/module>
[ng-if]: <https://docs.angularjs.org/api/ng/directive/ngIf>
[ng-bind]: <https://docs.angularjs.org/api/ng/directive/ngBind>
[ng-model]: <https://docs.angularjs.org/api/ng/directive/ngModel>

[folder-structure-png]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/master/projectData/images/railsAPIAngularjsFolders.png "website logo .png"
[rails-generate-command-png]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/apiController/projectData/images/railsGenerate.png "rails generate command .png"
[rails-scaffold-output]: <https://github.com/wowiamhere/RailsAPIAngularjs/raw/appScaffold/projectData/images/railsObjectScaffold.png> "rails generate scaffold output .png"
[migration-pending-error]: https://github.com/wowiamhere/RailsAPIAngularjs/blob/appScaffold/projectData/images/migrationsPendingError.png?raw=true "migragrions pending error .png"
[migration]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/appScaffold/projectData/images/migration.png "migration .png"
[rails-default-home]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/master/projectData/images/railsDefaultHome.png "rails default home page .png"
[rails-api-scaffold]: https://github.com/wowiamhere/RailsAPIAngularjs/blob/apiController/projectData/images/apiScaffoldFolders.png?raw=true "api scaffold dir .png"
[rails-routes1]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/apiController/projectData/images/routes1.png "routes.rb from scaffold .png"
[index-view]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/apiController/projectData/images/viewIndex.png "index code .png"
[home-index]: https://raw.githubusercontent.com/wowiamhere/RailsAPIAngularjs/css/projectData/images/homeIndex.png "home index .png"


# Serve [AngularJs] via Ruby on [Rails] Backend

We will be working with:
+ [Rails] 4.2.5
+ [Bower]
+ [Bootstrap]
+ [AngularJs]

The purpose of this tutorial is to show you how to:

1. CREATE a RoR application
    + set up the application's controller, views and model
        + in the views 
            * [AngularJs] will live and call to the API
            * will do some styling to set-up for out CRUD functions via [AngularJS]
        + the model
            + dictates what is the information squema in the database (we'll get to that)
    + configure [Rails] routes
    + inspect [Rails] controller
    + set up [Rails] views
        + set up [Bootstrap] 
    + set up [Bower] for front end dependencies
2. set up the API module
     * this basically requires a quick command line trip and *viola!*
     * write some methods to retrieve information

* HOOK up [AngularJs] (using [BOWER] to handle front end dependencies)
* SET UP an API to serve data in JSON format
* MAKE [AngularJs] CALLS to the API, and
* touch upon some relevant [AngularJs] powerfull features

All source code available at: [my-github-account]. 

Lets begin.

# 1.0 Create [Rails] Project

```rails
$ bin/rails new RailsAPIAngularjs
```
This will get you set up with:
+ [rails] project directory
   + when you create a rails  application, the Rails Framwork automaticall creates a directory with folders and files that set up the most basic project for you: [rails-initial-directory]
   * for more advanced features, there is more on "scaffolding" at [rails-scaffolding]

Here is the end result in [Sublime] Text Editor

![rails folder structure][folder-structure-png]

We will be working within (at least) the following folders:

+ app/assets
   * javascripts
   * css
+ app/controllers
+ app/models (just a bit to set up the class for the database)
+ app/views
+ vendor (for all the font-end dependencies)

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
`bundle exec` makes sure that the version of the rake command being run corresponds to the version within the Gemfile of the application, which is located in the root directory without a file extension

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

## 1.2 Setting the routes

The default routes created by the scaffolding system looks as follows in `~/config/routes.rb` 

![rails-routes1]

to redefine the application's home page, open routes.rb and type

```rails
get '/' => 'rails_objects#index'
```
Now a request to `localhost:3000` or to `http://www.yourWebsite.com` is handled by the `index` method` of the `angular_data` controller within the `api module`.
Some refractoring within the `~/app/views` and we'll launch the server to take a look.

## 1.3 controller at `~/app/controllers/rails_objects_controller.rb`

With this code, [Rails] makes the backend call to the database.  We will not be using this code, but rather have [AngularJs] make it's own front end calls via it's own API within a module (below)

## 1.4 Preparing ~/app/views

For this tutorial, we will be leaving the scaffolded code provided by [Rails] and lay AngularJs next to it for contrast.
We will be displaying the data fetched by [AngularJs] next to the rendering of an [Active-Record-object] to give an idea of the versatility of AngulaJs.

### 1.4.1 Set Up [Bootstrap] 

For css tweeking the main view of the application, thanks to [ruby-gems] like bootstrap-sass, in `~/gemfile`
```rails
# always be mindful of dependencies
gem 'bootstrap-sass'
```
then, to update, run
```rails
$ bundle install
```
After that, go to `~/app/assets/application.css.scss`, and add the following 2 @import lines at the end of the directives,

```rails
 *= require_tree .
 *= require_self
 */
@import "bootstrap-sprockets";
@import "bootstrap";
```
You may need to restart your server to get the [asset-pipeline] up to date;but, this should give your the power of [bootstrap].

If by any chance all the files in this directory do not have a `.css` right after the file name, go ahead and add it;it should go before the `.scss`.  The first extension refers to the style sheet while the second has to do with the scripting language [Sass] that is embedded into stylesheets and makes them more powerfull.

Got to `~/app/views/index.html.erb` and include `class="table"` to view the benefits
```rails
<table class="table">
  <thead>
```
run
```rails
$ rails server
```
and  here's the view served configured in routes.rb earlier

![home-index]

Now onto [Bower] to manage frontend dependencies.

#### 1.5 Set Up [Bower] 
[Bower] is a powerful tool to maintain your frontend packages and their dependencies.  Be aware that [Node, npm] and Git are required to install [Bower] -make sure your path is updated.
In ~/
```rails
# ~/
$ npm install -g bower
```
You can check the version of bower installed
```rails
$ bower -v
```

##### 1.5.1  `~/Gemfile`
In the Gemfile include the [Bower] gem found at [ruby-gems]:
```rails
# ~/Gemfile
gem 'bower-rails'
```
Then run
```rails
$ bundle install
```
to update the gems.

##### 1.4.2.2 ~/[Bower]file
[Bower] makes it very simple to get up and running via a Gem-like-file in `~/' named Bowerfile (no extension); list the assets [Bower] will be handling
```rails
# ~/Bowerfile
asset 'angular'
asset 'angular-route'
asset 'angular-resource'
asset 'angular-mocks'
asset 'angular-ui-bootstrap-bower'
asset 'bootstrap-sass-official'
```
then run 
```rails
$ rake bower:install
```
In `~/vendor/assets`, [Bower] places the components and a few other files:
+ `.bowerrc` : tells [Bower] where the assets live
   * default : ~/vendor/assets/bower_components
+ `bower.json` : lists the dependencies [Bower] will be maintaining

#### 1.2.4.3 Configure Rails' [asset-pipeline]
The [asset-pipeline] needs to know about the new stuff it has to include.  In `~/config/application.rb` tell Rails where the new stuff is:
```rails
# ~/config/application.rb
config.assets.paths << Rails.root.join("vendor", "assets", "bower_components")
```

And finally, add the new Frontend dependencies to the manifest files  in `~/app/assets/javascripts/application.js.coffee`.

*by the way, we will be changing the extensions on these files as we will be relying on pure Javascript to write our AngularJs code and not Coffeescript.*

 Make sure your code matches below:
```rails
/* ~/app/assets/javascripts */
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require angular/angular
//= require angular-ui-bootstrap-bower/ui-bootstrap.js
//= require angular-ui-bootstrap-bower/ui-bootstrap-tpls.js
```
and that's it! Angular is ready to go.

#### 1.2.4.4 First [AngularJs] module
In angular a [module] is like a container for the frontend application. In `~/app/assets/javascripts/application.js` code:
```rails
/* ~/app/assets/javascripts/application.js */
var angularApiApp = angular.module("angularApiApp",[]).
run(console.log("angularApiApp loaded!"));
```
this will create an [AngularJs][] [module] `angularApiApp` within a Javascript variable named `angularApiApp` in addition it runs a command on the frontend console outputting a success message `angularApiApp loaded!` which can be viewed using
browser tools.

In `~/app/views/layouts/application.html.erb`, mount the [AngularJs] application onto your [Rails] app:
```rails
# `~/app/views/layouts/application.html.erb`
</head>
<body ng-app="angularApiApp">
...
</body>
```
It's possible to do this within a `<html>, <body> or <div>` tag. 

In `~/app/views/index.html.erb`
```rails
<div class="angularExample">
  <div class="scopeVariable">
    Hello
    <span ng-if="name" ng-bind="name"></span> !!!
  </div>
Enter your name: <input type="text" ng-model="name"><br/>
View the result Instantly! above. 
</div>
```
+ [ng-if]
   + boolean for a set/unset value
+ [ng-bind]
    + binds a scope variable to a DOM elememt
+ [ng-model]
    + binds input to scope in [AngularJs]
    
Now run `$ rails server` and  visit `localhost:3000` on a browser and type anything in the input box and view the results instantly! No trip through the server! .... well, there isn't anythuing [AngularJs] is getting from a database just yet.
This is simply a sample of how amazing it is.
Now that it is up and running, let's configure the database, and then we'll comeback to retouch the index page to load all the database information for us.

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
