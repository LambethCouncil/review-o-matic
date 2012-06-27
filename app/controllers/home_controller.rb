require 'migratorator_api'
class HomeController < ApplicationController
  def index
    @users = User.all
    @open_tags = ::MigratoratorApi::Mapping.all_by_tag('status:open') 
    @closed_tags = ::MigratoratorApi::Mapping.all_by_tag('status:closed') 
  end
end
