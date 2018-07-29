<%= link_to('Log in with Facebook!', '/auth/facebook') %>
For Omniauth in welcome view

get '/auth/facebook/callback' => 'sessions#create'
in routes

class SessionsController < ApplicationController
  def create
    @ user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end



<% if session[:user_id] %>
  <h1><%= @ user.name %></h1>
  <h2>Email: <%= @ user.email %></h2>
  <h2>Facebook UID: <%= @ user.uid %></h2>
  <img src="<%= @ user.image %>">
<% else %>
  <%= link_to('Log in with Facebook!', '/auth/facebook') %>
<% end %>
