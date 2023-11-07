from rembg import remove
from PIL import Image

input_path = 'input.jpg'
output_path = 'output.png'

input = Image.open(input_path)
output = remove(input)

background = Image.new('RGB', output.size, (255, 255, 255))
background.paste(output, mask=output.split()[3])
background.save('output.jpg')
