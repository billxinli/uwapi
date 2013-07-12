require 'rubygems'
require 'httparty'
require 'json'

require 'uwapi/version'

require 'uwapi/course'
require 'uwapi/event'
require 'uwapi/exam_info'
require 'uwapi/experimental'
require 'uwapi/faculty_info'
require 'uwapi/food_services'
require 'uwapi/geolocation'
require 'uwapi/other'
require 'uwapi/professor'
require 'uwapi/schedule'
require 'uwapi/weather'
require 'uwapi/wireless_data'
module UWAPI
  class API
    include Course
    include Event
    include ExamInfo
    include Experimental
    include FacultyInfo
    include FoodServices
    include Geolocation
    include Other
    include Professor
    include Schedule
    include Weather
    include WirelessData

    def initialize(args)
      if args.include?(:api_key)
        @api_key = args[:api_key]
      else
        raise ArgumentError, ':api_key is required. See http://api.uwaterloo.ca/'
      end
      @api_format = args[:api_format] if args.include?(:api_format)
      raise ArgumentError, ':api_format must be one of [json, xml]' unless ['json', 'xml'].include?(api_format)
    end

    def api_format
      @api_format ||= 'json'
    end

    def api_url
      'http://api.uwaterloo.ca/public/v1/'
    end

    def api_key
      @api_key
    end

    private
    def get(opt)
      HTTParty.get(api_url, :query => {:key => api_key, :output => api_format}.merge(opt))
    end
  end
end