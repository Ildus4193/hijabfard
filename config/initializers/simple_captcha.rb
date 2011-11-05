SimpleCaptcha.setup do |sc|
  sc.image_size = '111x46'
  sc.image_style = 'mycaptha'
  sc.add_image_style('mycaptha', [
    "-background '#fff'",
    "-fill '#993399'",
    "-border 1",
    "-bordercolor '#E0E2E3'"])
end
