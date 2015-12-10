# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      logger.debug "User ID is #{cookies.signed["user.id"]}"
      User.find(cookies.signed["user.id"]) or reject_unauthorized_connection
    end
  end
end
