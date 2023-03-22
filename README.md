# meditation-visuals
This repository comprises R scripts for visualizing electroencephalogram (EEG) recordings acquired via the [BrainCo Inc. FocusCalm Headband](https://focuscalm.com/products/focuscalm-eeg-headband), a non-invasive neuroimaging device. EEG signals are sampled at a frequency of 1 Hz using the [NeuroMaker BCI Connect](https://bci-connect.neuromakerstem.com/) web application and saved in [Microsoft Excel](https://en.wikipedia.org/wiki/Microsoft_Excel) file format. The EEG recordings consist of 5-minute-long deep meditation sessions, including columns for raw EEG scores, alpha, delta, gamma, low beta, high beta, and theta values, as well as pre-calculated attention and meditation scores (refer to Figure 1.1). These pre-calculated scores exist on separate 0-100 indeces (0 = _very_ low and 100 = _very_ high), representing the corresponding cognitive states' levels.

| EEG	          | Alpha	        | delta	        | gamma	        | low_beta	    | high_beta	    | theta	        | Attention	    | Meditation	  |
| ------------- |:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|
| 1.146239999	  | 0.015283274	  | 0.024484048	  | 0.084297918	  | 0.036253523	  | 0.046067506	  | 0.019881314	  | 43.52077484	  | 17.93772888   |
| 0.507805784	  | 0.014061769	  | 0.025153827	  | 0.083200559	  | 0.036253903	  | 0.043886386	  | 0.019836726	  | 45.45545197	  | 19.30454063   |
| 6.685718764	  | 0.013708833	  | 0.028171061   | 0.078883693	  | 0.035306495	  | 0.045100532	  | 0.020680064	  | 45.45545197	  | 19.30454063   |

## Contents
This open-access repository provides two R scripts for visualizing nine successive days of Hindu Vedic meditation:

1. [meditation-visuals_complete.R]() - generates 1 frame(s)-per-second (fps) and 6 fps animations for complete 5-minute-long deep meditation sessions for all nine sessions
2. [meditation-visuals_minute-splits.R]() - generates 1 fps and 6 fps animations for minute splits for all nine sessions

Each script is executed to generate a sequence of single frame images, with each frame corresponding to a second of activity recorded. The frames were annotated with various recording metrics, including frame number, as well as an inverse visual representation of pre-calculated meditation scores. Specifically, squares are drawn within each frame, with larger squares corresponding to lower scores and smaller squares to higher scores (refer to Figure 1.2). These frames were subsequently arranged in sequential order and used to create animations in MP4 format. 

In the final step of this data visualization exercise, the animations generated for each of the nine days of meditation were tiled into a 3✕3 grid (refer to Figure 1.3). This visualization technique enabled a comprehensive view of participants' meditation performance, facilitating the side-by side comparison of sessions and identification of trends and patterns over time. By employing this method, we were able to examine the duration and frequency of specific states (e.g., time spent in a given session with a score above 60, labelled with the annotation _Dhyana_, the Sanskrit word for meditation, loosely defined as "one pointedness of the mind").

## Requirements
Users must pre-install R software on their local computer. The necessary packages may be installed through the execution of the following terminal commands:

```R
# For reading Excel files
install.packages("readxl") 

# For data manipulation
install.packages("dplyr") 

# For working with audio & video
install.packages("av")
```

It is also recommended that the repository be cloned using the command:

```bash
git clone https://github.com/srikanthashish/meditation-visuals.git
```
