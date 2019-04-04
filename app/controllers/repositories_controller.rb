class RepositoriesController < ApplicationController
  def index
    hash = {}
    hash["name"] = "index"
    hash["html_url"] = "stub"
    repo = GithubRepo.new(hash)
    @repos_array = repo.index()
  end

  def create
    response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end
end
