$:.unshift File.expand_path('../lib', __FILE__)

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'yaml'
require 'fileutils'
require 'holidays'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/test*.rb']
end

task default: :test

namespace :generate do
  DATA_PATH = 'data'

  desc 'Generate the holiday definition files'
  task :definitions do
    # load the index
    def_index = YAML.load_file("#{DATA_PATH}/index.yaml")

    # create a dir for the generated tests
    FileUtils.mkdir_p('test/defs')

    def_index['defs'].each do |region, files|
      puts "Building #{region} definition module:"
      files = files.collect { |f| "#{DATA_PATH}/#{f}" }.uniq

      module_src, test_src = Holidays.parse_definition_files_and_return_source(region, files)
      File.open("lib/holidays/#{region.downcase}.rb", "w") do |file|
        file.puts module_src
      end
      unless test_src.empty?
        File.open("test/defs/test_defs_#{region.downcase}.rb", "w") do |file|
          file.puts test_src
        end
      end
      puts "Done.\n\n"
    end
  end

  desc 'Build the definition manifest'
  task :manifest do
    File.open("lib/holidays/MANIFEST", "w") do |file|
      file.puts <<-EOH
        ==== Regional definitions
        The following definition files are included in this installation:

      EOH
      FileList.new('lib/holidays/*.rb').exclude(/version/).each do |str|
        file.puts('* ' + str.gsub(%r(/^lib\/|\.rb$/), ''))
      end
    end
    puts "Updated manifest file."
  end
end

task generate: ['generate:definitions', 'generate:manifest']
