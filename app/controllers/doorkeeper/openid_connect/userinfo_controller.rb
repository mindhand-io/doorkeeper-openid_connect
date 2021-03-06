# frozen_string_literal: true

module Doorkeeper
  module OpenidConnect
    class UserinfoController < ::Doorkeeper::ApplicationController
      skip_before_action :verify_authenticity_token, raise: false
      before_action -> { doorkeeper_authorize! :openid }

      def show
        render json: Doorkeeper::OpenidConnect::UserInfo.new(doorkeeper_token), status: :ok
      end
    end
  end
end
