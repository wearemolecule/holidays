# encoding: utf-8
require File.expand_path(File.dirname(__FILE__)) + '/../test_helper'

# This file is generated by the Ruby Holiday gem.
#
# Definitions loaded: data/sk.yaml
class SkDefinitionTests < Test::Unit::TestCase  # :nodoc:

  def test_sk
{Date.civil(2013,1,1) => 'Nový rok',
 Date.civil(2013,3,29) => 'Veľký piatok',
 Date.civil(2013,4,1) => 'Veľkonočný pondelok',
 Date.civil(2013,5,1) => 'Sviatok práce',
 Date.civil(2013,5,8) => 'Deň víťazstva',
 Date.civil(2013,7,5) => 'Sviatok svätého Cyrila a svätého Metoda',
 Date.civil(2013,8,29) => 'Výročie Slovenského národného povstania',
 Date.civil(2013,9,1) => 'Deň Ústavy Slovenskej republiky',
 Date.civil(2013,9,15) => 'Sedembolestná Panna Mária',
 Date.civil(2013,11,1) => 'Sviatok všetkých svätých',
 Date.civil(2013,11,17) => 'Deň boja za slobodu a demokraciu',
 Date.civil(2013,12,24) => 'Štedrý deň',
 Date.civil(2013,12,25) => '1. sviatok vianočný',
 Date.civil(2013,12,26) => '2. sviatek vianočný'}.each do |date, name|
  assert_equal name, (Holidays.on(date, :sk, :informal)[0] || {})[:name]
end

  end
end
