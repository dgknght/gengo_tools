module GengoTools
  class Railetie < Rails::Railtie
    rake_tasks do
      load 'tasks/gengo_tools.rake'
    end
  end
end
