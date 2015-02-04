json.array!(@parents) do |parent|
  json.extract! parent, :id, :parent_name, :child_name, :email, :teacher_id
  json.url parent_url(parent, format: :json)
end
