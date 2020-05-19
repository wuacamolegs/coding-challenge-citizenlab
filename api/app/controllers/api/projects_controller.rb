module Api
  class ProjectsController < ApiController
    def index
      projects = filter_projects
      folders = filter_folders
      render json: { projects: projects, folders: folders }
    end

    def show
      render json: Project.find(params[:id])
    end

    private

    def filter_projects
      ProjectQuery.new(params[:folder_id])
            .with_topics(params[:topics_ids])
            .with_title(params[:title])
            .order('created_at DESC')
            .limit(params[:limit])
            .call
    end

    def filter_folders
      Folder.where(parent_id: params[:folder_id]).map { |f| FolderSerializer.new(f).as_json }
    end
  end
end
