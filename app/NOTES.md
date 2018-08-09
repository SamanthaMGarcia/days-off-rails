To run https.... thin start --ssl

To do:

Delete days
Authorization

Display Days in an order/by month?
Make sure other users can't touch edit link on another's page


<%= form_for @ title do |f| %>
  <%= f.hidden_field :user_id, value: current_user.id %>
  <%= f.label :title %>
  <%= f.text_field :title %>
  <%= f.submit "Add Title" %>
<% end %>

<%= form_for :restaurant, :url => url_for(:controller => 'restaurants', :action => 'create'), method: :post do |f| %>
