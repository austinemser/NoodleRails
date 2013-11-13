#Basic DB

Zombie.create
Zombie.last
z = Zombie.find(3)
z.graveyard = "This is a GY"
z.save
z.destroy

class Zombie < ActiveRecord::Base
  has_many :weapons
  validates :name, :presence => true, :uniqueness => true
end

class Weapon < ActiveRecord::Base
  belongs_to :zombie
end

z = Zombie.where(:name=>"Ash")
w = Weapon.where(:zombie_id=>z[:id])

<% zombie = Zombie.first %>
<h1><%= zombie.name %></h1>
<p>
  <%= zombie.graveyard %>
  <%= link_to zombie.name, zombie %>
</p>

<% zombies = Zombie.all %>
<ul>
<% zombies.each do |zombie| %>
  <li><%= zombie.name %></li>
  #makes the name link to the edit path.
  <%= link_to zombie.name, edit_zombie_path(zombie) %>
  <% if zombie.tweets.size > 1 %>
    SMART ZOMBIE
  <% end %>
<% end %>
</ul>



#actions
#show.html.erb
<h1><%= @zombie.name %></h1>

class ZombiesController < ApplicationController
  def show
    @zombie = Zombie.find(params[:id])
    
    responds_to do |format|
      format.html #show.html.erb
      format.xml  { render :xml => @tweet }
      format.json { render :json => @tweet }
  end
end

#notice on validation

def edit
  if session[:zombie_id] != @tweet.zombie_id
    redirect_to(tweets_path :notice => "sorry, you cant edit this tweet")
  end
end

<% if flash[:notice] %>
  <div id="notice"><%= flash[:notice] %></div>
<% end %>

before_filter :get_tweet, :only => [:edit, :udpate, :destroy]
before_filter :check_auth, :only => [:edit, :update, :destroy]

def get_tweet
  @tweet = Tweet.find(params[:id])
end

def check_auth
  if session[:zombie_id] != @tweet.zombie_id
    redirect_to(tweets_path :notice => "sorry, you cant edit this tweet")
  end
end

#### routes

this will make localhost/all go to localhost/menus
match '/all' => 'menus#index', :as => 'all_menus'
<%= link_to "All Menus", all_menus_path %>

root :to => "menus#index"

match ':title' => 'menus#index', :as => 'menus_path'
def index
  if params[:title]
    @menu = Menu.where(:title => params[:title]).first
  else
    @menu = Menu.all
  end
  
end
