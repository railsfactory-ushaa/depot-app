ActiveAdmin.register Product do
 config.filters =false
 config.per_page = 5
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
   permit_params :list, :of, :attributes, :on, :model, :title, :description, :image, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
index do
    selectable_column
    id_column
    column :title
    column :description
    column :image_url
    column :price
    column :created_at
    actions
  end
form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Product ", :multipart => true do
      f.input :title
      f.input :description
      f.input :image
      f.input :price
    end
    f.actions
  end

end
