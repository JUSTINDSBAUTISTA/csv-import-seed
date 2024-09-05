class TrendsController < ApplicationController
  require 'csv'

  def import
    file = params[:file]
    return redirect_to trends_path, notice: 'Only CSV file is allowed' unless file.content_type == "text/csv"

    file = File.open(file)
    csv = CSV.parse(file, headers: true)
    csv.each do |row|
      trend_hash = {
        idTag: row['idTag'],
        tag: row['tag'],
        idType: row['idType'],
        tagType: row['tagType'],
        articles: row['articles']
      }
      Trend.create(trend_hash)

      binding.b
      p row
    end

    redirect_to trends_path, notice: 'File imported successfully'
  end

  def index
    @trends = Trend.limit(20)
  end
end
