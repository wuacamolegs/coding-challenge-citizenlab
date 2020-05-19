require 'rails_helper'
describe Api::ProjectsController do
  describe 'GET #index' do
    context 'when the folder is empty' do
      before do
        get :index
      end

      it 'returns an empty array' do
        expect(JSON.parse(response.body)['projects']).to eq([])
        expect(JSON.parse(response.body)['folders']).to eq([])
      end

      it 'returns ok status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when one or more projects' do
      before do
        folder = Folder.create!(title: 'folder', description: 'description')
        Folder.create!(title: 'folder', description: 'description', parent_id: folder.id)
        Project.create!(title: Faker::Lorem.sentence,description: Faker::Lorem.sentence, parent_id: folder.id)
        Project.create!(title: Faker::Lorem.sentence,description: Faker::Lorem.sentence, parent_id: folder.id)
        Project.create!(title: Faker::Lorem.sentence,description: Faker::Lorem.sentence, parent_id: folder.id)
        Project.create!(title: Faker::Lorem.sentence,description: Faker::Lorem.sentence, parent_id: folder.id)
        get :index, params: { folder_id: folder.id }
      end

      it 'returns ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns projects inside the folder' do
        expect(JSON.parse(response.body)['projects'].length).to eq(4)
      end

      it 'returns empty folders' do
        expect(JSON.parse(response.body)['folders'].length).to eq(1)
      end
    end

    context 'when filter by topics' do
      before do
        folder = Folder.create!(title: 'folder', description: 'description')
        Folder.create!(title: 'folder', description: 'description', parent_id: folder.id)
        project1 = Project.create!(title: Faker::Lorem.sentence,description: Faker::Lorem.sentence, parent_id: folder.id)
        project2 = Project.create!(title: Faker::Lorem.sentence,description: Faker::Lorem.sentence, parent_id: folder.id)
        Project.create!(title: Faker::Lorem.sentence,description: Faker::Lorem.sentence, parent_id: folder.id)
        Project.create!(title: Faker::Lorem.sentence,description: Faker::Lorem.sentence, parent_id: folder.id)
        topic = Topic.create!(name: Faker::Lorem.word)
        ProjectsTopic.create!(project: project1, topic: topic)
        ProjectsTopic.create!(project: project2, topic: topic)
        get :index, params: { folder_id: folder.id, topics_ids: [topic.id] }
      end

      it 'returns ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns projects inside the folder' do
        expect(JSON.parse(response.body)['projects'].length).to eq(2)
      end

      it 'returns empty folders' do
        expect(JSON.parse(response.body)['folders'].length).to eq(1)
      end
    end
  end
end
