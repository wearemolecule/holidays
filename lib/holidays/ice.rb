# encoding: utf-8
module Holidays
  # This file is generated by the Ruby Holidays gem.
  #
  # Definitions loaded: data/ice.yaml
  #
  # To use the definitions in this file, load it right after you load the
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'holidays/ice'
  #
  # All the definitions are available at https://github.com/alexdunae/holidays
  module ICE # :nodoc:
    def self.defined_regions
      [:ice]
    end

    def self.holidays_by_month
      {
              0 => [{:function => lambda { |year| Holidays.easter(year)-2 }, :function_id => "easter(year)-2", :name => "Good Friday", :regions => [:ice]}],
      1 => [{:function => lambda { |year| Holidays.ice_new_year(year) }, :function_id => "ice_new_year(year)", :name => "New Year's Day", :regions => [:ice]}],
      12 => [{:mday => 25, :observed => lambda { |date| Holidays.to_monday_if_sunday_to_friday_if_saturday(date) }, :observed_id => "to_monday_if_sunday_to_friday_if_saturday", :name => "Christmas Day", :regions => [:ice]}]
      }
    end
  end

# January 1st on M-F, January 2nd on January 1st falls on Sunday, NA if January 1st falls on Saturday
def self.ice_new_year(year)
  ny = Date.new(year, 1, 1)
  ny += 1  if ny.wday == 0
  ny = nil if ny.wday == 6
  ny
end



end

defined_regions = Holidays::ICE.defined_regions
holidays_by_month = Holidays::ICE.holidays_by_month
Holidays.merge_defs(defined_regions, holidays_by_month)
