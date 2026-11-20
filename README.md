# Digital Signal Processing — MATLAB Labs

A collection of MATLAB scripts covering fundamental and intermediate Digital Signal Processing (DSP) topics. Each lab is a standalone script with comments and plots.

## Basics and Signal Generation

| Lab | File | Topic |
|-----|------|-------|
| 1 | `lab_one_plotting_a_sin_and_cos_wave_as_a_basic.m` | Plotting sine and cosine waves |
| 2 | `lab_two_unit_step.m` | Unit step sequence |
| 3 | `lab_three_unit_sample_sequence.m` | Unit sample (impulse) sequence |
| 4 | `lab_four_unit_ramp_sequence.m` | Unit ramp sequence |
| 5 | `lab_five_exponential_signal.m` | Exponential signal |
| 6 | `lab_six_sampling_of_an_anlog_signal.m` | Sampling of an analog signal |
| 7 | `lab_seven_converting_an_even_signal.m` | Converting an even signal |
| 8 | `lab_eight_converting_an_odd_signal.m` | Converting an odd signal |
| 9 | `lab_nine_user_input_signal_and_advance_it_by_3_units_of_time.m` | Advancing a signal by 3 units |
| 10 | `lab_ten_user_input_signal_and_dekay_it_by_three_units_of_time.m` | Delaying a signal by 3 units |
| 11 | `lab_eleven_folding_a_discrete_time_signal.m` | Folding a discrete-time signal |

## Transforms and Convolution

| Lab | File | Topic |
|-----|------|-------|
| 12 | `lab_twelve_z_transform_of_a_signal.m` | Z-transform of a signal |
| 13 | `lab_tharteen_crosscorrealtion_of_two_given_signals.m` | Cross-correlation of two signals |
| 12/13 | `lab_twielve_convolution_of_two_given_signal.m` | Convolution of two signals |
| 14 | `lab_fourteen_discrete_fourier_transform.m` | DFT (manual) vs. FFT |
| 15 | `lab_fifteen_inverse_discrete_fourier_transform.m` | IDFT (manual) vs. IFFT |
| 16 | `lab_sixteen_circular_convolution.m` | Circular convolution |
| 17 | `lab_seventeen_linear_convolution_using_fft.m` | Linear convolution via FFT |
| 18 | `lab_twenty_one_autocorrelation_of_a_signal.m` | Autocorrelation |

## Filters and Frequency Response

| Lab | File | Topic |
|-----|------|-------|
| 19 | `lab_eighteen_fir_lowpass_filter_design.m` | FIR low-pass filter (window method) |
| 20 | `lab_nineteen_iir_butterworth_filter_design.m` | IIR Butterworth low-pass filter |
| 21 | `lab_twenty_frequency_response_of_an_lsi_system.m` | Frequency response of an LSI system |
| 22 | `lab_twenty_five_pole_zero_plot_and_stability.m` | Pole-zero plot and stability |

## Sampling, Spectra and Applications

| Lab | File | Topic |
|-----|------|-------|
| 23 | `lab_twenty_two_sampling_and_aliasing.m` | Sampling and aliasing |
| 24 | `lab_twenty_three_spectral_analysis_using_fft.m` | Spectral analysis with FFT |
| 25 | `lab_twenty_four_downsampling_and_upsampling.m` | Downsampling and upsampling |
| 26 | `lab_twenty_six_quantization_and_snr.m` | Quantization and SNR |
| 27 | `lab_twenty_seven_chirp_signal_and_spectrogram.m` | Chirp signal and spectrogram |

## Requirements

- MATLAB (R2016b or newer recommended)
- Signal Processing Toolbox for `fir1`, `butter`, `freqz`, `filter`, `xcorr`, `zplane`, `spectrogram`, and `chirp`

## Usage

Run any script directly in MATLAB, for example:

```matlab
lab_fourteen_discrete_fourier_transform
```

Some scripts prompt for input values from the command window.
