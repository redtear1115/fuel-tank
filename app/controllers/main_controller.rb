require 'csv'

class MainController < ApplicationController
  before_action :valify_event_key, only: [:save_data, :download_data]

  def home
    head :ok
  end

  def new_event_key
    @event_key = SecureRandom.hex
    File.open(data_path, "w+")
    render json: { event_key: @event_key}
  end

  def save_data
    hash = params.as_json.except('controller', 'action', 'event_key')
    CSV.open(data_path, 'ab') do |csv|
      return if hash.blank?
      csv << hash.keys if first_row?
      csv << hash.values
    end
    head :ok
  end

  def download_data
    send_file(data_path, filename: "#{@event_key}.csv", type: 'text/csv; charset=utf-8; header=present')
  end

  private

  def valify_event_key
    @event_key = params[:event_key]
    if @event_key.nil?
      head :forbidden && return
    elsif Dir.glob(data_path).blank?
      head :forbidden && return
    end
  end

  def first_row?
    File.size(data_path) == 0
  end

  def data_path
    @data_path ||= Rails.root.join("storage/#{@event_key}.csv")
  end
end
