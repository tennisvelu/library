# app/controllers/api/v1/libraries_controller.rb
# frozen_string_literal: true

module Api
  module V1
    # Controller for handling API requests related to books.
    class LibrariesController < ApplicationController
      before_action :authorize
      before_action :set_library
      
      def books
        books = @library.books
        render json: { library: @library.name, books: books }
      end
      
      private

      def set_library
          @library = Library.find(params[:id])
      end    
    end
  end
end