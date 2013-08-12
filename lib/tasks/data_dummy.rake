# encoding: utf-8

require 'faker'

DATA_DIRECTORY = File.join(Rails.root, "lib", "tasks", "sample_data")

namespace :db do
  namespace :data_dummy do
    desc 'Load data'
    task :load => :environment do |t|
      create_data_materials
      create_data_galleries
      create_data_artifacts
    end

    desc 'Remove data'
    task :remove => :environment do |t|
      Rake::Task["db:migrate:reset"].invoke
      #Remove images to avoid accumulation.
      system("rm -rf public/system")
    end

    desc 'Reload data'
    task :reload => :environment do |t|
      Rake::Task["db:data_dummy:remove"].invoke
      Rake::Task["db:migrate"].invoke
      Rake::Task["db:data_dummy:load"].invoke
    end
  end
end

def create_data_materials
  images = Dir.glob("lib/tasks/sample_data/bt_photos/*.jpg").shuffle
  audios = Dir.glob("lib/tasks/sample_data/bt_audios/*.mp3").shuffle
  videos = Dir.glob("lib/tasks/sample_data/bt_videos/*.*").shuffle
  100.times do
    material = Material.new
    material.name = Faker::Lorem.sentence
    material.language = "vn"
    material.save
  end
end

def create_data_galleries
  images = Dir.glob("lib/tasks/sample_data/bt_photos/*.jpg").shuffle
  audios = Dir.glob("lib/tasks/sample_data/bt_audios/*.mp3").shuffle
  videos = Dir.glob("lib/tasks/sample_data/bt_videos/*.*").shuffle
  100.times do
    gallery = Gallery.new
    gallery.name = Faker::Lorem.sentence
    gallery.language = "vn"
    gallery.save
  end
end

def create_data_artifacts

  images = Dir.glob("lib/tasks/sample_data/bt_photos/*.jpg").shuffle
  videos = Dir.glob("lib/tasks/sample_data/bt_videos/*.*").shuffle
  audios = Dir.glob("lib/tasks/sample_data/bt_audios/*.mp3").shuffle
  100.times do
    material = Material.offset(rand(Material.count)).first
    gallery = Gallery.offset(rand(Gallery.count)).first

    artifact = Artifact.new
    artifact.name = Faker::Lorem.sentence
    artifact.dating = Faker::Name.name
    artifact.description = Faker::Lorem.paragraphs
    artifact.code = Faker::PhoneNumber.phone_number
    artifact.place = Faker::Address.street_address
    artifact.size = Random.new.rand(50..150).to_s + "m"
    artifact.language = "vn"
    artifact.material = material
    artifact.gallery = gallery
    artifact.save

    #Photo
    5.times do
      Photo.create do |p|
        p.artifact = artifact
        p.title = Faker::Lorem.sentence
        p.avatar = uploaded_file(images[rand(images.size)])
      end
    end

    #Audio
    1.times do
      Audio.create do |a|
        a.artifact = artifact
        a.title = Faker::Lorem.sentence
        a.mp3 = uploaded_file(audios[rand(audios.size)])
      end
    end

    #Video
    1.times do
      Video.create do |v|
        v.artifact = artifact
        v.title = Faker::Lorem.sentence
        v.description = Faker::Lorem.paragraphs
        v.language = "vn"
        v.clip = uploaded_file(videos[rand(videos.size)])
      end
    end
  end
end

def uploaded_file(filename)
  f = File.new(File.join(Rails.root, filename))
  return f
end