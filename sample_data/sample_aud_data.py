import numpy as np
import polars as pl
import time

# Constants for data generation
LOCATION_SET = ['India', 'USA', 'China', 'Russia', 'Israel', 'UK', 'Germany', 'UAE', "Poland", 'Nepal', 'Nigeria',
                'Vietnam', 'Australia']
DEVICE_CAT = ['Web', 'Mobile', 'TV', 'Others']
VIDEO_CAT_SET = ["TV", "Movies", "Trailer", "Music", "Tech", "Review", "Drama"]
NUM_ROWS = 10000
SEED = 47


# Function to generate data
def generate_data(num_rows):
    rng = np.random.default_rng(seed=SEED)
    data = {
        "aud_id": rng.integers(low=1, high=num_rows, size=num_rows),
        "age": rng.integers(low=10, high=80, size=num_rows),
        "location": rng.choice(LOCATION_SET, size=num_rows),
        "dev_cat": rng.choice(DEVICE_CAT, size=num_rows),
        "video_cat": rng.choice(VIDEO_CAT_SET, size=num_rows),
    }
    return pl.DataFrame(data)


# Save data to CSV
def save_data(df, file_path):
    df.write_csv(file_path)
    df.write_parquet(file_path)
    print(f"Data saved to {file_path}")


if __name__ == "__main__":
    file_path = f"../data/aud_data{time.strftime('%Y%m%d_%H%M%S')}.csv"
    aud_data = generate_data(NUM_ROWS)
    save_data(aud_data, file_path)
    print(aud_data)
