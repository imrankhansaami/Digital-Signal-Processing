"""Generate README preview plots for the DSP labs.

These are matplotlib renderings of the same signals the MATLAB scripts
produce. They are illustrative previews, not screenshots from MATLAB.

Run from the repository root:  python docs/previews/generate_previews.py
"""

import os

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from scipy import signal

OUT = os.path.dirname(os.path.abspath(__file__))

plt.rcParams.update(
    {
        "figure.facecolor": "white",
        "axes.facecolor": "white",
        "axes.edgecolor": "#333333",
        "axes.grid": True,
        "grid.color": "#d9d9d9",
        "grid.linewidth": 0.8,
        "axes.titlesize": 11,
        "axes.titleweight": "bold",
        "axes.labelsize": 10,
        "font.size": 9,
        "legend.fontsize": 8,
        "figure.dpi": 130,
    }
)


def save(fig, name):
    fig.tight_layout()
    fig.savefig(os.path.join(OUT, name), facecolor="white")
    plt.close(fig)
    print("wrote", name)


# --- 01_basics -------------------------------------------------------------

def sin_cos():
    t = np.arange(0, 2 * np.pi + 0.01, 0.01)
    fig, ax = plt.subplots(figsize=(6.4, 3.6))
    ax.plot(t, np.sin(t), label="sin(t)")
    ax.plot(t, np.cos(t), label="cos(t)")
    ax.set_title("Sine and Cosine Waves")
    ax.set_xlabel("t (rad)")
    ax.set_ylabel("Amplitude")
    ax.set_xlim(0, 2 * np.pi)
    ax.legend(loc="upper right")
    save(fig, "basics_sin_cos.png")


def sequences():
    n = np.arange(-5, 11)
    fig, axes = plt.subplots(3, 1, figsize=(6.4, 6.4))
    for ax, title, y, marker in [
        (axes[0], "Unit Step u[n]", (n >= 0).astype(float), "filled"),
        (axes[1], "Unit Sample δ[n]", (n == 0).astype(float), "filled"),
        (axes[2], "Unit Ramp r[n]", np.where(n >= 0, n, 0).astype(float), "filled"),
    ]:
        ax.stem(n, y, linefmt="b-", markerfmt="bo" if marker == "filled" else "bo")
        ax.set_title(title)
        ax.set_xlabel("n")
        ax.set_ylabel("Amplitude")
        ax.set_xlim(-5, 10)
    save(fig, "basics_sequences.png")


def exponential():
    n = np.arange(0, 21)
    fig, ax = plt.subplots(figsize=(6.4, 3.6))
    ax.stem(n, 0.7 ** n, linefmt="b-", markerfmt="bo")
    ax.set_title("Exponential Signal x[n] = 0.7^n")
    ax.set_xlabel("n")
    ax.set_ylabel("x[n]")
    save(fig, "basics_exponential.png")


# --- 02_transforms ---------------------------------------------------------

def dft():
    N = 16
    n = np.arange(N)
    x = np.sin(2 * np.pi * 2 * n / N) + 0.5 * np.sin(2 * np.pi * 5 * n / N)
    X = np.fft.fft(x)
    fig, axes = plt.subplots(2, 1, figsize=(6.4, 5.4))
    axes[0].stem(np.arange(N), np.abs(X), linefmt="b-", markerfmt="bo")
    axes[0].set_title("DFT Magnitude |X[k]|")
    axes[0].set_xlabel("k")
    axes[0].set_ylabel("|X[k]|")
    axes[1].stem(np.arange(N), np.angle(X), linefmt="b-", markerfmt="bo")
    axes[1].set_title("DFT Phase ∠X[k]")
    axes[1].set_xlabel("k")
    axes[1].set_ylabel("Phase (rad)")
    save(fig, "transforms_dft.png")


def convolution():
    x = np.array([1, 2, 3, 4], dtype=float)
    h = np.array([1, 1, 1], dtype=float)
    y = np.convolve(x, h)
    fig, axes = plt.subplots(3, 1, figsize=(6.4, 6.0))
    for ax, sig, title in [
        (axes[0], x, "x[n]"),
        (axes[1], h, "h[n]"),
        (axes[2], y, "y[n] = x[n] * h[n]"),
    ]:
        ax.stem(np.arange(len(sig)), sig, linefmt="b-", markerfmt="bo")
        ax.set_title(title)
        ax.set_xlabel("n")
        ax.set_ylabel("Amplitude")
    save(fig, "transforms_convolution.png")


# --- 03_filters ------------------------------------------------------------

def fir():
    N = 31
    fc = 0.3
    M = N - 1
    n = np.arange(N)
    h = fc * np.sinc(fc * (n - M / 2)) * np.hamming(N)
    h /= h.sum()
    w, H = signal.freqz(h, worN=1024)
    fig, axes = plt.subplots(2, 1, figsize=(6.4, 5.4))
    axes[0].stem(n, h, linefmt="b-", markerfmt="bo")
    axes[0].set_title("FIR Low-Pass Impulse Response h[n]")
    axes[0].set_xlabel("n")
    axes[0].set_ylabel("h[n]")
    axes[1].plot(w / np.pi, 20 * np.log10(np.abs(H) + 1e-12))
    axes[1].set_title("Magnitude Response")
    axes[1].set_xlabel("Normalized Frequency (×π rad/sample)")
    axes[1].set_ylabel("Magnitude (dB)")
    axes[1].set_ylim(-80, 5)
    save(fig, "filters_fir.png")


def iir():
    b, a = signal.butter(4, 0.3)
    w, H = signal.freqz(b, a, worN=1024)
    fig, axes = plt.subplots(2, 1, figsize=(6.4, 5.4))
    axes[0].plot(w / np.pi, 20 * np.log10(np.abs(H)))
    axes[0].set_title("Butterworth Low-Pass Magnitude Response")
    axes[0].set_xlabel("Normalized Frequency (×π rad/sample)")
    axes[0].set_ylabel("Magnitude (dB)")
    axes[1].plot(w / np.pi, np.angle(H))
    axes[1].set_title("Phase Response")
    axes[1].set_xlabel("Normalized Frequency (×π rad/sample)")
    axes[1].set_ylabel("Phase (rad)")
    save(fig, "filters_iir.png")


def pole_zero():
    b = np.array([1.0, 0.5])
    a = np.array([1.0, -0.8, 0.15])
    z = np.roots(b)
    p = np.roots(a)
    theta = np.linspace(0, 2 * np.pi, 400)
    fig, ax = plt.subplots(figsize=(4.6, 4.6))
    ax.plot(np.cos(theta), np.sin(theta), "k--", linewidth=1)
    ax.plot(z.real, z.imag, "bo", markersize=9, markerfacecolor="none", label="Zeros")
    ax.plot(p.real, p.imag, "rx", markersize=11, markeredgewidth=2, label="Poles")
    ax.axhline(0, color="#999999", linewidth=0.8)
    ax.axvline(0, color="#999999", linewidth=0.8)
    ax.set_aspect("equal")
    ax.set_title("Pole-Zero Plot")
    ax.set_xlabel("Real")
    ax.set_ylabel("Imaginary")
    ax.legend(loc="upper right")
    save(fig, "filters_pole_zero.png")


# --- 04_sampling_and_spectra ----------------------------------------------

def aliasing():
    f0 = 5
    t = np.arange(0, 1.001, 0.001)
    x_cont = np.sin(2 * np.pi * f0 * t)
    t1 = np.arange(0, 1.001, 1 / 100)
    x1 = np.sin(2 * np.pi * f0 * t1)
    t2 = np.arange(0, 1.001, 1 / 8)
    x2 = np.sin(2 * np.pi * f0 * t2)
    fig, axes = plt.subplots(3, 1, figsize=(6.4, 6.4))
    axes[0].plot(t, x_cont, "b")
    axes[0].set_title("Continuous Signal, f0 = 5 Hz")
    axes[0].set_xlabel("Time (s)")
    axes[0].set_ylabel("Amplitude")
    axes[1].plot(t, x_cont, "b", alpha=0.5)
    axes[1].plot(t1, x1, "ro-", markersize=3)
    axes[1].set_title("Sampled at fs = 100 Hz (No Aliasing)")
    axes[1].set_xlabel("Time (s)")
    axes[1].set_ylabel("Amplitude")
    axes[2].plot(t, x_cont, "b", alpha=0.5)
    axes[2].plot(t2, x2, "ro-", markersize=4)
    axes[2].set_title("Sampled at fs = 8 Hz (Aliasing)")
    axes[2].set_xlabel("Time (s)")
    axes[2].set_ylabel("Amplitude")
    save(fig, "sampling_aliasing.png")


def spectrum():
    fs = 1000
    T = 1
    t = np.arange(0, T, 1 / fs)
    x = (
        np.sin(2 * np.pi * 50 * t)
        + 0.5 * np.sin(2 * np.pi * 120 * t)
        + 0.2 * np.sin(2 * np.pi * 300 * t)
    )
    N = len(x)
    X = np.fft.fft(x)
    f = np.arange(N) * fs / N
    half = N // 2 + 1
    fig, axes = plt.subplots(2, 1, figsize=(6.4, 5.4))
    axes[0].plot(t, x)
    axes[0].set_title("Time-Domain Signal")
    axes[0].set_xlabel("Time (s)")
    axes[0].set_ylabel("Amplitude")
    axes[1].stem(f[:half], np.abs(X[:half]) / N, linefmt="b-", markerfmt="bo")
    axes[1].set_title("Single-Sided Amplitude Spectrum")
    axes[1].set_xlabel("Frequency (Hz)")
    axes[1].set_ylabel("|X(f)|")
    axes[1].set_xlim(0, 400)
    save(fig, "sampling_spectrum.png")


def chirp():
    fs = 1000
    T = 2
    t = np.arange(0, T, 1 / fs)
    x = signal.chirp(t, 20, T, 200)
    fig, axes = plt.subplots(2, 1, figsize=(6.4, 5.4))
    axes[0].plot(t, x)
    axes[0].set_title("Chirp Signal (Linear Frequency Sweep)")
    axes[0].set_xlabel("Time (s)")
    axes[0].set_ylabel("Amplitude")
    f, tt, Sxx = signal.spectrogram(x, fs, nperseg=128, noverlap=120)
    axes[1].pcolormesh(tt, f, 10 * np.log10(Sxx + 1e-12), shading="auto", cmap="viridis")
    axes[1].set_title("Spectrogram")
    axes[1].set_xlabel("Time (s)")
    axes[1].set_ylabel("Frequency (Hz)")
    save(fig, "sampling_chirp.png")


if __name__ == "__main__":
    sin_cos()
    sequences()
    exponential()
    dft()
    convolution()
    fir()
    iir()
    pole_zero()
    aliasing()
    spectrum()
    chirp()
