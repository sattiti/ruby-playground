# coding: utf-8
require 'time'
require 'rqrcode'
require 'rqrcode_png'

def fileSplit(doc)
  strary  = []
  docs    = []

  strlen  = doc.length
  limited = 2000

  j = (strlen / limited).floor.round
  j += 1 unless strlen % limited == 0

  first = 0
  last  = limited

  (0...j).each do |i|
    first = limited * i
    last  = limited * (i + 1)

    (first..last).each do |k|
      if doc[k] != nil
        strary.push(doc[k])
      end
    end

    docs.push(strary.join(''))
    strary = []
  end

  docs
end

def attachQRCode(data, filename)
  data.size.times do |i|
    d   = data[i]
    qr  = RQRCode::QRCode.new(d, {size: 40, level: :l})
    img = qr.to_img
    img.save("./#{filename}-#{i}.png")
    File.write("./#{filename}-#{i}.txt", img.to_data_url)
  end
end

file  = File.expand_path(ARGV[0])
files = fileSplit(File.open(file, 'r', encoding: 'utf-8').read())
attachQRCode(files, "a")
