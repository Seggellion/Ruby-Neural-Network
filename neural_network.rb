require 'nmatrix'

class NeuralNetwork
  attr_accessor :weights_input_hidden, :weights_hidden_output
  def initialize(input_size, hidden_neurons)
    @input_size = input_size
    @hidden_neurons = hidden_neurons
    @output_neurons = 1 # Assuming binary output

    # Initialize weights with small random values
    @weights_input_hidden = NMatrix.random([hidden_neurons, input_size]) * 2 - 1
    @weights_hidden_output = NMatrix.random([@output_neurons, hidden_neurons]) * 2 - 1
  end

  # Activation functions
  def sigmoid(x)
    x.map { |e| 1.0 / (1.0 + Math.exp(-e)) }
  end

  def sigmoid_derivative(x)
    x * (1 - x)
  end

  def forward_propagate(inputs)
    inputs_matrix = NMatrix.new([inputs.size, 1], inputs)

    # Calculate hidden layer activation
    hidden_inputs = @weights_input_hidden.dot(inputs_matrix)
    hidden_outputs = sigmoid(hidden_inputs)

    # Calculate output layer activation
    final_inputs = @weights_hidden_output.dot(hidden_outputs)
    final_outputs = sigmoid(final_inputs)

    final_outputs
  end


  def train(inputs_array, targets_array, epochs, learning_rate)
    epochs.times do |epoch|
      inputs_array.each_with_index do |inputs, index|
        # Convert inputs and targets to NMatrix objects
        inputs_matrix = NMatrix.new([inputs.size, 1], inputs.flatten, dtype: :float64)
        targets_matrix = NMatrix.new([1, 1], targets_array[index].flatten, dtype: :float64)
          
        # Forward Propagation
        hidden_inputs = @weights_input_hidden.dot(inputs_matrix)
        hidden_outputs = sigmoid(hidden_inputs)
  
        final_inputs = @weights_hidden_output.dot(hidden_outputs)
        final_outputs = sigmoid(final_inputs)
  
        # Calculate error (MSE)
        output_errors = targets_matrix - final_outputs
  
        # Backward Propagation
        # If final_outputs is an NMatrix, ensure compatible operations
        one_matrix = NMatrix.ones([@output_neurons, 1], dtype: :float64) # Adjust dimensions as necessary
        final_gradients = output_errors * final_outputs * (one_matrix - final_outputs)
  
        # Calculate errors for hidden layer
        hidden_errors = @weights_hidden_output.transpose.dot(final_gradients)
  
        # Assuming hidden_outputs is an NMatrix of shape [hidden_neurons, 1]
        # Create an NMatrix of ones with the same shape as hidden_outputs
        ones_matrix = NMatrix.ones(hidden_outputs.shape, dtype: :float64)
        # Adjust the operation to use the ones_matrix
        hidden_gradients = hidden_errors * hidden_outputs * (ones_matrix - hidden_outputs)
  
        # Update the weights
        @weights_hidden_output += (final_gradients.dot(hidden_outputs.transpose)) * learning_rate
        @weights_input_hidden += (hidden_gradients.dot(inputs_matrix.transpose)) * learning_rate
      end
  
      puts "Epoch #{epoch + 1} complete." if (epoch + 1) % 10 == 0 # Feedback every 10 epochs
    end
  end
  



end

# Example usage
if __FILE__ == $0
  # Initialize the neural network
  nn = NeuralNetwork.new(4, 5) # Example: 4 input neurons, 5 hidden neurons

  # Example input and output
  inputs = [0.5, 0.1, 0.4, 0.6]
  target = [1] # Assuming a binary classification problem

  # Placeholder call to train method - you need to implement this
  nn.train(inputs, target, 1000, 0.1) # Example: 1000 epochs, learning rate of 0.1

  # Example of forward propagation with dummy data
  output = nn.forward_propagate(inputs)
  puts "Predicted output: #{output}"
end

