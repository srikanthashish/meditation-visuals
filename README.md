# meditation-visuals
This repository comprises R scripts for visualizing electroencephalogram (EEG) recordings acquired via the [BrainCo Inc. FocusCalm Headband](https://focuscalm.com/products/focuscalm-eeg-headband), a non-invasive neuroimaging device. EEG signals are sampled at a frequency of 1 Hz using the [NeuroMaker BCI Connect](https://bci-connect.neuromakerstem.com/) web application and saved in [Microsoft Excel](https://en.wikipedia.org/wiki/Microsoft_Excel) file format. The EEG recordings consist of 5-minute-long deep meditation sessions, including columns for raw EEG scores, alpha, delta, gamma, low beta, high beta, and theta values, as well as pre-calculated attention and meditation scores (see Figure 1.1). These pre-calculated scores exist on 0-100 indeces, representing the corresponding cognitive states' levels.

## Contents
This open-access repository provides two R scripts for visualizing nine successive days of Hindu Vedic meditation:

1. [meditation-visuals_complete.R]() - generates 1 frame(s)-per-second (fps) and 6 fps animations for complete 5-minute-long deep meditation sessions for all nine sessions
2. [meditation-visuals_minute-splits.R]() - generates 1 fps and 6 fps animations for minute splits for all nine sessions

Each script is executed to generate a sequence of single frame images, with each frame corresponding to a second of activity recorded. The frames were annotated with various recording metrics, including frame number, as well as an inverse visual representation of pre-calculated meditation scores. Specifically, squares are drawn within each frame, with larger squares corresponding to lower scores and smaller squares to higher scores. These frames were subsequently arranged in sequential order and used to create animations in MP4 format. 

In the final step of this data visualization exercise, the animations generated for each of the nine days of meditation were tiled into a 3✕3 grid. This visualization technique enabled a comprehensive view of participants' meditation performance, facilitating the side-by side comparison of sessions and identification of trends and patterns over time. By employing this method, we were able to examine the duration and frequency of specific states (e.g., time spent in a given session with a score above 60, labelled with the annotation _Dhyana_, the Sanskrit word for meditation, loosely defined as "one pointedness of the mind").

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
