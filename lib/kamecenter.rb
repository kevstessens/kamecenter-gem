require "kamecenter/version"
require 'net/http'
require "uri"
require "json"
require 'base64'
require 'digest'


class Response
  def initialize(status, message)
    @status = status
    @message = message
  end

  def status
    @status
  end

  def message
    @message
  end
end


class User
  def initialize(uid, name,achievements)
    @uid = uid
    @name = name
    @achievements = achievements
  end

  def name
    @name
  end

  def achievements
    @achievements
  end

  def uid
    @uid
  end
end

class Achievement
  def initialize(id, points, name)
    @id = id
    @points = points
    @name = name
  end

  def name
    @name
  end

  def points
    @points
  end

  def id
    @id
  end

end


module Kamecenter
  def self.post_achievement(game_id,achievement_id,user_id,secret_key)

    signature = Digest::MD5.hexdigest("/app/"+ game_id+"/user/"+ user_id+"/achievement/"+ achievement_id+"/"+secret_key+"/")
    uri = URI.parse("http://localhost:3000/app/"+ game_id+"/user/"+ user_id+"/achievement/"+ achievement_id+"/"+signature)

    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    response_object = Response.new(data["status"],data["message"])
    return response_object
  end

  def self.get_user_data(game_id,user_id,secret_key)

    signature = Digest::MD5.hexdigest("/app/"+ game_id+"/user/"+ user_id+"/achievements/"+secret_key+"/")
    uri = URI.parse("http://localhost:3000/app/"+ game_id+ "/user/" + user_id +"/achievements/"+signature)
    achievements=Array.new
    response = Net::HTTP.get_response(uri)
    data = JSON.parse(response.body)
    i=0
    JSON.parse(data["user"])["achievements"].each do |ac|
      achievements[i]=Achievement.new(ac["id"],ac["points"],ac["name"])
      i=i+1
    end
    user = User.new(JSON.parse(data["user"])["uid"],JSON.parse(data["user"])["name"],achievements)
    return user

  end

end
