require_relative 'neural_network'
require 'csv'

# Load and prepare your training data
def load_data(file_path)
  data = CSV.read(file_path, headers: true).map(&:to_h)
  inputs = data.map { |row| row.values[0...-1].map(&:to_f) }
  targets = data.map { |row| [row.values.last.to_f] }
  [inputs, targets]
end

# Function to predict from CSV file and print results
def predict_from_csv(model, input_file)
  puts "Predictions:"
  CSV.foreach(input_file, headers: false) do |row|
    features = row.map(&:to_f)
    output = model.forward_propagate(features)
    predicted = output.to_a.flatten.first.round
    puts "Predicted: #{predicted == 1 ? 'Sale Likely' : 'Sale Unlikely'}"
  end
end

# Assuming load_data, split_data, and NeuralNetwork class are defined correctly above

# Paths to your data files
training_data_file = 'preprocessed_sales_data.csv'
real_world_input_file = 'real_world_input.csv'

# Load and prepare data
inputs, targets = load_data(training_data_file)

# Initialize the neural network
input_size = inputs.first.size
hidden_neurons = 5 # Example configuration
nn = NeuralNetwork.new(input_size, hidden_neurons)

# Training parameters
epochs = 1000
learning_rate = 0.1

# Training loop
epochs.times do |epoch|
  inputs.each_with_index do |input, index|
    nn.train([input], [targets[index]], 1, learning_rate)
  end
  puts "Epoch #{epoch + 1}/#{epochs} complete." if (epoch + 1) % 100 == 0
end

# After training, use the model for predictions on new data
predict_from_csv(nn, real_world_input_file)
