# meditation-visuals
This repository comprises R scripts for visualizing electroencephalogram (EEG) recordings acquired via the [BrainCo Inc. FocusCalm Headband](https://focuscalm.com/products/focuscalm-eeg-headband), a non-invasive neuroimaging device. EEG signals are sampled at a frequency of 1 Hz using the [NeuroMaker BCI Connect](https://bci-connect.neuromakerstem.com/) web application and saved in Excel format. The EEG recordings consist of 5-minute-long deep meditation sessions, including columns for raw EEG scores, alpha, delta, gamma, low beta, high beta, and theta values, as well as pre-calculated attention and meditation scores (see Figure 1.1). These scores are rated on a scale of 0-100, representing the corresponding cognitive states' levels.

## Contents
This open-access repository provides two R scripts for visualizing nine successive days of Hindu Vedic meditation:

1. [meditation-visuals_complete.R]() - generates 1 frame(s)-per-second (fps) and 6 fps animations for complete 5-minute-long deep meditation sessions for all nine sessions
2. [meditation-visuals_minute-splits.R]() - generates 1 fps and 6 fps animations for minute splits for all nine sessions

In this project, each script is executed to generate a sequence of single frame images, with each frame corresponding to a second of activity recorded. The frames were annotated with various recording metrics, including frame number, as well as an inverse visual representation of pre-calculated meditation scores. Specifically, squares are drawn within each frame, with larger squares corresponding to lower scores and smaller squares to higher scores. These frames were subsequently arranged in sequential order and used to create animations in MP4 format, which facilitated the identification of notable trends and patterns in participants' meditation practice over time.

## Requirements
Users must pre-install R software on their local computer. The necessary packages may be installed through the execution of the following terminal commands:

```R
install.packages("readxl") 
install.packages("dplyr") 
install.packages("av")
```

It is also recommended that the repository be cloned using the command:

```bash
git clone https://github.com/srikanthashish/meditation-visuals.git
```
