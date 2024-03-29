# Sales Prediction Neural Network in Ruby

This repository contains a Ruby application designed to predict sales outcomes based on various features using a simple neural network. The project demonstrates how to construct, train, and utilize a neural network for binary classification tasks, specifically focusing on predicting whether a sale will likely occur. This README provides an overview of the project, including setup instructions, usage, and an explanation of the core components.

## Project Overview

The sales prediction model is built with Ruby and utilizes the `nmatrix` library for efficient numerical computations. The neural network implemented in this project is a basic feedforward network with a single hidden layer, capable of binary classification (predicting sales as likely or not likely).

### Core Components

- `neural_network.rb`: Defines the NeuralNetwork class, including methods for initializing the network, forward propagation, and training (backpropagation).
- `predict_sales.rb`: A script that utilizes the trained model to make predictions on new data, showcasing the model's applicability to real-world scenarios.
- `preprocessed_sales_data.csv`: An example dataset used for training the neural network, containing features related to sales opportunities and their outcomes (sale made or not).
- `real_world_input.csv`: Sample input data for making predictions using the trained neural network model.

## Getting Started

### Prerequisites

- Ruby (version 2.6 or later)
- `nmatrix` gem

### Installation

1. Clone this repository to your local machine:
   ```ruby
   git clone https://github.com/Seggellion/Ruby-Neural-Network.git
   ```
2. Navigate to the project directory:
   ```ruby
   cd sales-prediction-nn
   ```
3. Install the `nmatrix` gem (if you haven't already):
   ```ruby
   gem install nmatrix
   ```

### Making Predictions

1. Prepare your real-world input data in `real_world_input.csv` following the same format as your training data but without the target outcomes.
2. Run the prediction script:
   ```ruby
   ruby predict_sales.rb
   ```

## Understanding the Neural Network

The neural network used in this project includes an input layer, one hidden layer, and an output layer. The size of the input layer corresponds to the number of features in the dataset, and the output layer is a single neuron, as the task is binary classification. The hidden layer's size (number of neurons) can be adjusted based on the complexity of the dataset and task.

### Why Use a Neural Network for Sales Prediction?

Neural networks are powerful tools for modeling complex, non-linear relationships in data. By learning from historical sales data, the neural network in this project can identify patterns and factors contributing to sales outcomes, aiding in the prediction of future sales opportunities.

## Contributing

Contributions to improve the project are welcome. Please feel free to fork the repository, make your changes, and submit a pull request.

## License

This project is open-sourced under the MIT License. See the LICENSE file for more details.

## Acknowledgments

- Thanks to the Ruby community for the valuable resources and documentation.
- Special thanks to those who have contributed to the development of the `nmatrix` gem, facilitating numerical computing in Ruby.
