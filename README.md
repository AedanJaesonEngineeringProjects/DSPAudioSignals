# Digital Signal Processing of Audio Signals Project

This project, part of the ENGN4537/6537 Digital Signal Processing course at the Australian National University, involves various tasks related to digital signal processing (DSP) of audio signals using MATLAB. The project covers reading and writing audio files, analyzing their properties, applying Fourier Transforms, filtering signals, and more.

## Project Overview

### 1. Introduction to MATLAB: Audio File Handling
- **Reading and Writing `.wav` Files:** Using `audioread()`, `audiowrite()`.
- **Extracting Audio Information:** Using `audioinfo()` to obtain bit-depth, sampling rate, number of channels, duration, and total samples.
- **Segmenting Audio Clips:** Using `audioread()` to chop audio from a specific time range.
- **Playing Audio:** Using `audioplayer()` to play audio segments.

### 2. Collecting Voice Data
- **Recording Voice Samples:** Using `audiorecorder()` to record a 12-second voice sample with background noise.
- **Saving and Validating Audio:** Saving the recorded audio in `.wav` format and checking quality with `audioplayer()`.

### 3. Discrete Fourier Transform (DFT)
- **Generating and Plotting Signals:** Creating a signal composed of multiple frequencies.
- **Manual DFT Calculation:** Implementing a DFT function from scratch.
- **Using FFT:** Applying MATLAB's built-in `fft()` function.
- **Running Time Comparison:** Comparing the performance of manual DFT and `fft()`.
- **Frequency Analysis:** Analyzing frequency content using DFT and FFT.

### 4. Convolution
- **Linear Convolution Using DFT:** Calculating convolution of signals via DFT and comparing with MATLAB's `conv()` function.
- **Binaural Audio Processing:** Combining HRIR data with speech signals to create binaural audio.

### 5. Short-Time Fourier Transform (STFT)
- **Spectrogram Analysis:** Using `spectrogram()` to analyze time-varying frequency content.
- **Voice and Noise Frequency Separation:** Identifying and distinguishing frequency contributions of voice and background noise.
- **Automated Signal Processing:** Implementing functions to detect start and end of speech in recordings.

### 6. Filtering
- **Filter Design and Analysis:** Using `fvtool` to analyze filter responses.
- **Filtering Voice Recordings:** Applying designed filters to voice recordings to remove noise.
- **Pole-Zero Analysis:** Understanding filter characteristics through pole-zero plots.
- **Designing Low-Pass and Band-Pass Filters:** Creating filters to isolate desired signal components.

### 7. Music Modulation and Filter Design
- **Amplitude Modulation:** Modulating a music signal with a high-frequency carrier.
- **Demodulation and Filtering:** Restoring the original music signal using demodulation and FIR low-pass filters.
- **Filter Design Constraints:** Ensuring the designed filters meet specific requirements for transition width and stopband attenuation.

## Technologies and Concepts
- **MATLAB:** Primary tool for implementing DSP algorithms.
- **Fourier Transforms:** Understanding and applying DFT and FFT for frequency analysis.
- **Filtering:** Designing and applying various filters to process audio signals.
- **Convolution:** Implementing convolution using both time-domain and frequency-domain methods.
- **Spectrograms:** Visualizing the time-varying frequency content of signals.
- **Modulation:** Applying amplitude modulation and demodulation techniques.

## Files and Submission
- **Report:** A comprehensive report detailing the approach, implementation, and results for each task.
- **MATLAB Code:** Scripts and functions used for processing audio signals.
- **Generated Audio Files:** Processed audio files demonstrating the applied DSP techniques.

## Usage
Clone the repository and run the MATLAB scripts to explore the different DSP techniques applied in this project. Ensure you have the provided audio files in the same directory as the scripts.

