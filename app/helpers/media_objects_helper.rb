module MediaObjectsHelper
  def record_name(record)
    dc_file_name = record.datastreams["dublin_core"].file_name_values.first
    if !record.file_streams.empty? && (dc_file_name == nil || dc_file_name.empty?)
      return record.file_streams.first.dsid.gsub(".wav", "").gsub(".mp3", "")
    elsif dc_file_name
      return dc_file_name
    else
      return record.pid
    end
  end
end