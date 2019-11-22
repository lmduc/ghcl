class RepositoriesController < ApplicationController
  BASE_URL = 'https://api.github.com'
  SEARCH_PATH = '/search/repositories'

  ##
  # Sample params
  # {
  #   query: 'rails',
  #   page: 1
  # }
  #
  # Success response: Status code 200
  # {
  #   'items' => [
  #     {
  #       'id'        => '',
  #       'full_name' => '',
  #       'html_url'  => ''
  #     }
  #   ]
  # }
  #
  # Too many requests response: Status code 429
  # {
  #   'error' => 'Too many requests'
  # }
  #
  # Service unavailable: HTML error returned
  def index
    @error = nil
    response = HTTParty.get(
      "#{BASE_URL}#{SEARCH_PATH}",
      query: {
        q: 'rails',
        page: 1,
        per_page: 10
      }
    )
    @repositories = JSON.parse(response.body)['items']
  end
end