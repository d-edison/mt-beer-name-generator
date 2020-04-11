# import library
from textgenrnn import textgenrnn

# Train Model
textgen_mt = textgenrnn()
textgen_mt.train_from_file('mtbeers.txt', num_epochs = 25)

# Save Model
textgen_mt.save('mtbeers.hd5')

# Generate files 
textgen_mt.generate_to_file("predictions/outrageous-1.txt", n = 3000, temperature = .4) 
textgen_mt.generate_to_file("predictions/outrageous-2.txt", n = 3000, temperature = .6) 
textgen_mt.generate_to_file("predictions/outrageous-3.txt", n = 3000, temperature = .8) 
textgen_mt.generate_to_file("predictions/outrageous-4.txt", n = 3000, temperature = 1) 
