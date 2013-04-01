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

    # client = XMLRPC::Client.new2(FLICKR_SERVER)
    # begin
    #   result = client.call("flickr.photos.getRecent",{"api_key"=>API_KEY,"page"=>1,"per_page"=>5})
    #   xml = XmlSimple.xml_in(result)
    #   xml["photo"].each { |photo|
    #     puts "http://farm#{photo["farm"]}.static.flickr.com/#{photo["server"]}/#{photo["id"]}_#{photo["secret"]}.jpg"
    #   }

    # rescue XMLRPC::FaultException => error
    # p  error.faultCode
    # p  error.faultString
    # end



    def self.blogpost(title, description, blogid = SetConst::APIID, user = SetConst::APINAME, passwd = SetConst::APIPASS)
      content = {
        "title" => title, 
        "description" => description
        # "mt_tb_ping_urls" => tburls, 
        # "mt_excerpt" => excerpt 
      }
      client = XMLRPC::Client.new("blog.fc2.com", "/xmlrpc.php")
      begin 
        r = client.call("metaWeblog.newPost", blogid, user, passwd, content, true)
        p r
      rescue XMLRPC::FaultException => error
        p  error.faultCode
        p  error.faultString
      end
    end



  end
end