import pandas as pd

# Load the data
file_path = 'freesurface_case1_120.txt'
data = pd.read_csv(file_path, delim_whitespace=True, header=None)

# Function to generate files based on time range
def generate_files(data, column, time_ranges):
    for t in time_ranges:
        filtered_data = data[data[column] <= t]
        output_file = f'freesurface_case1_120_time_0_to_{t}.txt'
        filtered_data.to_csv(output_file, sep=' ', index=False, header=False)
        print(f"File generated: {output_file}")

# Define time ranges from 0 to 110 with a step of 5
time_ranges = [t for t in range(30, 120, 1)]

# Generate the files for the new time ranges
generate_files(data, 3, time_ranges)
