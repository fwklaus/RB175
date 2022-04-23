require "pry"
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "psych"

before do 
  @all_users = Psych.load_file("users.yaml")
end

get "/:name" do
  @current_user = params['name'].to_sym
  erb :user_page
end

get "/" do
  erb :list_users
end

helpers do
  def parse_for_names(document)
    document.keys
  end

  def display_user_info(user)
    personal_info = @all_users[user]
    @email = personal_info[:email]
    @interests = personal_info[:interests]
  end

  def format_interests(arr)
    last = arr[-1].prepend(" and ")
    arr[0,2].join(", ") + last
  end

  def other_users(crnt_user)
    @all_users.keys.reject {|user| user == crnt_user}
  end

  def total_users
    num = @all_users.keys.size
    "#{num} users"
  end

  def count_interests
    count = 0
    @all_users.keys.each do |user|
      count += @all_users[user][:interests].size
    end
    "#{count} interests"
  end
end


