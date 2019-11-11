
from textgenrnn import textgenrnn

# Train Model
textgen = textgenrnn()
textgen.train_from_file('mtbeers.txt', num_epochs = 10)

# Save Model
textgen.save('mtbeers.hd5')

# Generate files 
textgen_mt.generate_to_file("predictions/outrageous-1.txt", n = 10000, temperature = .5) 
textgen_mt.generate_to_file("predictions/outrageous-2.txt", n = 10000, temperature = .5) 
textgen_mt.generate_to_file("predictions/outrageous-3.txt", n = 10000, temperature = .8) 
textgen_mt.generate_to_file("predictions/outrageous-4.txt", n = 10000, temperature = 1.1) 
textgen_mt.generate_to_file("predictions/outrageous-5.txt", n = 10000, temperature = 1.5)
