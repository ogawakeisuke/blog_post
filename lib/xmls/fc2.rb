module Xmls

  require "xmlrpc/client"
  require "rubygems"
  require "xmlsimple"

  module SetConst
    HOST = "http://blog.fc2.com/xmlrpc.php"
    APIID = "shibulunch"
    APINAME = "syoukaro@gmail.com"
    APIPASS = "super123super"
  end

  class Fc2

    def self.blogpost(title, description, blogid = SetConst::APIID, user = SetConst::APINAME, passwd = SetConst::APIPASS)
      content = {
        "title" => title, 
        "description" => description
        # "mt_tb_ping_urls" => tburls, 
        # "mt_excerpt" => excerpt 
      }
      #TODO ここは独立させるべき
      client = XMLRPC::Client.new("blog.fc2.com", "/xmlrpc.php")
      begin 
        r = client.call("metaWeblog.newPost", blogid, user, passwd, content, true)
      rescue XMLRPC::FaultException => error
        # p  error.faultCode
        # p  error.faultString
        return false
      end

      return true
    end

    def self.imagepost(image, blogid = SetConst::APIID, user = SetConst::APINAME, passwd = SetConst::APIPASS)

      # open("public/images#{filename}", 'wb') do |file|
      #   open(file_path) do |data|
      #     file.write(data.read)
      #   end
      # end

      base64 = XMLRPC::Base64.new(image)
      fileHash = {
        :name => "#{Time.now.to_i}.png",
        :bits => base64
      }
      
      client = XMLRPC::Client.new("blog.fc2.com", "/xmlrpc.php")

      begin 
        r = client.call("metaWeblog.newMediaObject",blogid, user, passwd,fileHash)
      rescue XMLRPC::FaultException => error
        # p  error.faultCode
        # p  error.faultString
        return false
      end
    
      return r["url"]
    end

  end
end