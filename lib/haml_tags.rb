module HamlTags
  include Radiant::Taggable

  desc %{
    Filters its contents with the Haml filter.
  }

  tag 'haml' do |tag|
    HamlFilter.filter(tag.expand)
  end

end
