require 'rubygems'
require 'httparty'
require 'json'

require 'uwapi/version'
require 'uwapi/service/course'
require 'uwapi/service/event'
require 'uwapi/service/exam_info'
require 'uwapi/service/experimental'
require 'uwapi/service/faculty_info'
require 'uwapi/service/food_services'
require 'uwapi/service/geolocation'
require 'uwapi/service/other'
require 'uwapi/service/professor'
require 'uwapi/service/schedule'
require 'uwapi/service/weather'
require 'uwapi/service/wireless_data'

module UWAPI
  class Result
    def initialize(args)
      if args.is_a?(Hash) && args.has_key?('response')
        @result = args
      else
        raise ArgumentError, 'args is not a UWAPI returned result'
      end
    end

    def result
      @result ||= {}
      @result
    end

    def meta
      @result['response']['meta']
    end

    def success?
      Integer.new(@result['response']['meta']['Status']) == 200
    end

    def failure?
      !success?
    end
  end

  class API
    include Course, Event, ExamInfo, Experimental, FacultyInfo, FoodServices, Geolocation
    include Other, Professor, Schedule, Weather, WirelessData

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
      request = HTTParty.get(api_url, :query => {:key => api_key, :output => api_format}.merge(opt))
      UWAPI::Result.new(request)
    end
  end
end