class ProjectQuery
  attr_reader :projects

  def initialize(folder_id)
    @projects = Project.where(parent_id: folder_id)
  end

  def with_title(title)
    @projects = projects.where('title ~* ?', title) if title.present?
    self
  end

  def with_topics(topics)
    return self unless topics.present?

    project_ids = ProjectsTopic.where(topic_id: topics.map(&:to_i)).map(&:project_id)
    @projects = projects.where(id: project_ids)
    self
  end

  def order(order_str)
    @projects = projects.order('projects.' + order_str) if order_str.present?
    self
  end

  def limit(limit)
    @projects = projects.last(limit) if limit.present?
    self
  end

  def call
    @projects
  end
end
