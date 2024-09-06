class TrendsController < ApplicationController
  require 'csv'

  def index
    @trends = Trend.limit(20)
  end

  def import
    file = params[:file]
    return redirect_to trends_path, notice: "Please select a file" unless file.present? && file.content_type == 'text/csv'

    file_content = File.open(file, "r:ISO-8859-1")
    csv = CSV.parse(file_content, headers: true)

    Trend.transaction do
      # Limiting row count to 20
      csv.first(20).each do |row|
        trends_hash = {
          idTag: row['idTag'],
          tag: row['tag'],
          idType: row['idType'],
          tagType: row['tagType'],
          articles: row['articles']
        }
        Trend.create!(trends_hash)
      end
    end
    redirect_to trends_path, notice: "Trends imported successfully"
  end
end
