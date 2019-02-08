require 'rqrcode'
require 'rqrcode_png'
require 'base64'

txtfile = 'a.txt'
imgfile = "a.png"

# exit
data = File.open(txtfile, 'r', {encoding: 'utf-8'}).read()
qr   = RQRCode::QRCode.new(data, {size: 40, level: :l})
png = qr.to_img
png.save(imgfile)

# qr.to_img.to_data_url # base64 output
