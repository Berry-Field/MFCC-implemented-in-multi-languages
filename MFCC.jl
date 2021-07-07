# -*- coding: utf-8 -*-
"""
Created on Sun Fir 24 15:02:27 2021
@author: JIA HB
"""
using MFCC
using WAV
using SpecialFunctions
using Statistics
using Plots
y, sr = wavread("C:\\Users\\12610\\Downloads\\Music\\OSR_us_000_0010_8k.wav")
y=y[1:28000]#截取
a,b,c=mfcc(y::Vector, sr; wintime=0.025, steptime=0.01, numcep=15, lifterexp=-22, sumpower=false, preemph=0.97, dither=false, minfreq=0.0, maxfreq=sr/2, nbands=40, bwidth=1.0, dcttype=3, fbtype=:htkmel, usecmp=false, modelorder=0)
GR()
heatmap(a)