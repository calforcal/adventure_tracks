class MapsController < ApplicationController
  def new

  end

  def parse_file
    doc = Nokogiri::XML(open(params[:avatar]))
    map_arr = []

    trackpoints = doc.xpath('//xmlns:trkpt')

    trackpoints.each do |trkpt|
      nil_time = trkpt.at("time")
      time = nil_time.nil? ? nil : trkpt.at("time").children.to_s
      map_arr << {
        :points => [trkpt.xpath('@lat').to_s.to_f, trkpt.xpath('@lon').to_s.to_f, trkpt.at("ele").children.to_s.to_f],
        :time => time
      }
    end

    whole_map = {
      :name => doc.at("trk").at("name").children.to_s,
      :activity => doc.at("trk").at("type").children.to_s,
      :coordinates => map_arr
    }
  end

  def create
    whole_map = parse_file

    map = Map.create!(name: whole_map[:name], activity: whole_map[:activity], avatar: params[:avatar])
    coordinates = whole_map[:coordinates].map do |coord|
      Coordinate.create!(x_axis: coord[:points][0], y_axis: coord[:points][1], z_axis: coord[:points][2], time: coord[:time])
    end
    map_coordinates = coordinates.each do |coord|
      MapCoordinate.create!(map_id: map.id, coordinate_id: coord.id)
    end

    redirect_to map_path(map)
  end

  def show
    map = Map.find(params[:id])
  end
end