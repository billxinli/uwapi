module Abstraction
  module ClassMethods
    def call_with_q(methods)
      return unless methods.is_a?(Array)
      methods.each do |m|
        define_method(m) do |args|
          opt = {:service => __method__}
          if args.include?(:q)
            opt[:q] = args[:q]
          else
            raise ArgumentError, ':q is required'
          end

          opt[:term] = args[:term] if args.include?(:term)
          get(opt)
        end
      end
    end

    def call_without_q(methods)
      return unless methods.is_a?(Array)
      methods.each do |m|
        define_method(m) do
          opt = {:service => __method__}
          get(opt)
        end
      end
    end
  end
  extend ClassMethods

  def self.included(other)
    other.extend(ClassMethods)
  end
end