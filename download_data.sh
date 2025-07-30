#!/bin/bash

# Download the ds004100 dataset from OpenNeuro
echo "Cloning the OpenNeuro EEG dataset..."
git clone https://github.com/OpenNeuroDatasets/ds004100.git data/ds004100

# Optional: Checkout a specific Git hash
cd data/ds004100
git checkout da07f99
cd ../..

echo "Download complete. Data is in: data/ds004100"