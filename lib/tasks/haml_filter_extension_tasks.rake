namespace :radiant do
  namespace :extensions do
    namespace :haml_filter do
      
      desc "Runs the migration of the Haml Filter extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          HamlFilterExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          HamlFilterExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Haml Filter to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from HamlFilterExtension"
        Dir[HamlFilterExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(HamlFilterExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
