# Rails 3.1
Include BootstrapHelper in Gemfile:

``` ruby
gem 'bootstrap-helper',git: 'git://github.com/niedhui/bootstrap-helper.git'
```

# modal
``` ruby
- modal id: "my_modal" do |m| 
  = m.header "修改备注"
  = m.body do
    %textarea#remark_field{style:"width: 95%"}
  = m.footer do
    = primary_link_to "确定","#"
```

# table
```ruby
  - bt_table users do |table|
    = table.ths "email","name"
    = table.tds :email, ->(user) { user.first_name+ user.last_name}
```

# buttons
```ruby
  - bt_button_group "Actions" do
    %li= link_to "hello",   hello_path
    %li= link_to "bye",     bye_path
    %li.divider
    %li= link_to "nihao"
```

# tabs
```ruby
  <% tabs do |tab| %>
    <%= tab.item "Tabs 1", { :active => true } do %>
      <h1>Title 1</h1>
      <p>Content 1</p>
    <% end %>
    <%= tab.item "Tabs 2" do %>
      <h1>Title 2</h1>
      <p>Content 2</p>
    <% end %>
  <% end %>
```

# navbar

Simple use :

```ruby
  <% topbar do |bar| %>

    <%= bar.brand_name "YourBrandName", root_path %>
    
    <%= bar.nav do %>
      <%= bar.item 'item', '#' %>
      <%= bar.divider( :vertical => true ) %>
      <%= bar.dropdown 'Title 1' do %>
        <%= bar.header "Items a" %>
        <%= bar.item 'item 1', '#' %>
        <%= bar.divider %>
        <%= bar.item 'item 2', '#' %>
        <%= bar.item 'item 2', '#' %>
        <%= bar.header "Items b" %>
        <%= bar.item 'item 2', '#' %>
        <%= bar.item 'item 2', '#' %>
      <% end %>
    <% end %>
    
  <% end %>
```

Or you can use like this :


```ruby
  <% topbar( :inverse => true, :id => 'topBar' ) do |bar| %>

    <%= bar.collapse %>
    <%= bar.brand_name "YourBrandName", root_path %>

    <%= bar.nav( :right => true ) do %>
    
      <%= bar.dropdown( :class => 'highlight' ) do %>
        <%= bar.dropdown_title do %>
          <span class="count">10</span>
          <span class="title">Title 2</span>
        <% end %>
        <%= bar.dropdown_menu( :right => true ) do %>
          <%= bar.header do %>
            <span class="title">Items a</span>
          <% end %>
          <%= bar.item do %>
            <span class="title">Item 3</span>
          <% end %>
          <%= bar.item 'item 4', '#' %>
          <%= bar.header "Items b" %>
          <%= bar.item '/link' do %>
            <span class="title">Item 5</span>
            <span class="count">15</span>
          <% end %>
        <% end %>
      <% end %>
      
    <% end %>
  
  <% end %>
```