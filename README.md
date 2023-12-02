![header01](https://user-images.githubusercontent.com/29677962/231225422-6b1dc0db-1423-43cf-bf13-41c8b657acaa.png)

# Meditation Visuals
This repository comprises R scripts for visualizing electroencephalogram (EEG) recordings acquired via the [BrainCo Inc. FocusCalm Headband](https://focuscalm.com/products/focuscalm-eeg-headband), a non-invasive neuroimaging device. EEG signals were sampled at a frequency of 1 Hz using the [NeuroMaker BCI Connect](https://bci-connect.neuromakerstem.com/) web application and saved in [Microsoft Excel](https://en.wikipedia.org/wiki/Microsoft_Excel) file format. During the data collection process, a [guided meditation audio track](stimuli/vedic-meditation/432Hz_Om-chanting.mp3) in [MP3](https://en.wikipedia.org/wiki/MP3) coding format was played for the wearer of the FocusCalm Headband via wireless [Bluetooth](https://en.wikipedia.org/wiki/Bluetooth) headphones. 

Default 'output.xlsx' files were renamed according to a convention with the format <code>YYYY-MM-DD_ses-XX</code>, to capture the date information, the session number, and permit easier file referencing (refer to _**Table 1.**_ for an example of a completed table). <code>YYYY</code> corresponds to the year, <code>MM</code> corresponds to the month, and <code>DD</code> corresponds to the day. <code>XX</code> is the session number (e.g., session 1 would be <code>ses-01</code>).

<tabcaption>

<i>**Table 1.** Example filenames recorded in the [meditation-visuals_filenames.xlsx](input/meditation-visuals_filenames.xlsx) file. All nine recordings were obtained on Friday, April 14, 2023.</i>

</tabcaption>

session	      | filename
:-------------|:-------------
1	            | 2023-04-14_ses-01
2	            | 2023-04-14_ses-02
3	            | 2023-04-14_ses-03
4	            | 2023-04-14_ses-04
5	            | 2023-04-14_ses-05
6	            | 2023-04-14_ses-06
7	            | 2023-04-14_ses-07
8	            | 2023-04-14_ses-08
9	            | 2023-04-14_ses-09

The EEG recordings consist of 5-minute-long deep meditation sessions, including columns for raw EEG scores, alpha, delta, gamma, low beta, high beta, and theta values, as well as pre-calculated attention and meditation scores (refer to **Table 2.**). These pre-calculated scores exist on separate 0-100 indices (0 = _very_ low and 100 = _very_ high), representing the corresponding cognitive states' levels.

<tabcaption>

<i>**Table 2.** This table presents sample single-channel EEG recordings obtained from a healthy adult participant during a meditation session. The recordings are shown in the first three (of 300) rows and represent a subset of the full dataset. Of particular interest are the pre-calculated attention and meditation scores, which are displayed in the eighth and ninth columns, respectively (both are marked with an asterisk, '__*__').</i>

</tabcaption>

EEG	          | alpha	       | delta	      | gamma	       | low_beta	    | high_beta	   | theta	      | *attention	 | *meditation
:-------------|:-------------|:-------------|:-------------|:-------------|:-------------|:-------------|:-------------|:-------------
1.146239999	  | 0.015283274	 | 0.024484048	| 0.084297918	 | 0.036253523	| 0.046067506	 | 0.019881314	| 43.52077484	 | 17.93772888
0.507805784	  | 0.014061769	 | 0.025153827	| 0.083200559	 | 0.036253903	| 0.043886386	 | 0.019836726	| 45.45545197	 | 19.30454063
6.685718764	  | 0.013708833	 | 0.028171061  | 0.078883693	 | 0.035306495	| 0.045100532	 | 0.020680064	| 45.45545197	 | 19.30454063
. . .	        | . . .	       | . . .	      | . . .	       | . . .	      | . . .	       | . . .	      | . . .	       | . . .

## Contents
This open-access repository provides two R scripts for visualizing nine sessions of Hindu Vedic meditation:

1. [meditation-visuals_complete.R](meditation-visuals_complete.R) - generates a 1 Frame(s)-Per-Second (FPS) and a 6 FPS **complete** 300-frame-long animation for the complete duration of a 5-minute-long deep meditation session
2. [meditation-visuals_minute-splits.R](meditation-visuals_minute-splits.R) - generates a 1 FPS and 6 FPS **minute splits** 60-frame-long animation for every minute of a 5-minute-long deep meditation session

Note that both scripts loop through the predefined list of filenames to process all nine 5-minute-long deep meditation sessions in one run. As a result, 18 [MP4](https://en.wikipedia.org/wiki/MP4_file_format) files are produced in the [meditation-visuals_complete.R](meditation-visuals_complete.R) script (2 videos/session × 9 sessions) and 90 [MP4](https://en.wikipedia.org/wiki/MP4_file_format) files are produced in the [meditation-visuals_minute-splits.R](meditation-visuals_minute-splits.R) script (10 videos/session × 9 sessions).

Each script is executed to generate a sequence of single frame images, with each frame corresponding to a second of activity recorded. The frames were annotated with various recording metrics, including frame number, as well as an inverse visual representation of pre-calculated meditation scores. Specifically, squares are drawn within each frame, with larger squares corresponding to lower scores and smaller squares to higher scores (refer to **Figure 1.**). These frames were subsequently arranged in sequential order and used to create animations in [MP4](https://en.wikipedia.org/wiki/MP4_file_format) coding format. 

<p align="center">
  <img src="demo_figs/med_rec_complete_ses-01_animated_6_fps_DEMO.gif" alt="" width=250 height=250/>
</p>

<i>**Figure 1.** 6 FPS GIF animation of minute 1 of a meditation visual, generated using demo data. View the [demo_figs/](demo_figs) folder for more example GIF animations.</i>

In the final step of this data visualization exercise, the animations generated for each of the nine sessions of meditation were tiled into a 3 × 3 grid. This visualization technique enabled a comprehensive view of participants' meditation performance, facilitating the side-by side comparison of sessions and identification of trends and patterns over time. By employing this method, we were able to examine the duration and frequency of specific states (e.g., time spent in a given session with a score above 60, labelled with the annotation _Dhyāna_, the Sanskrit word for meditation, loosely defined as "one pointedness of the mind").

## Requirements
Users must pre-install R software on their local computer. The necessary packages may be installed through the execution of the following terminal commands in the _RStudio_ programming interface:

```R
# For reading Excel files
install.packages("readxl") 

# For data manipulation
install.packages("dplyr") 

# For working with audio & video
install.packages("av")

# For working with Google fonts
install.packages("gfonts")
```

The <code>ffmpeg</code> library and overlaying <code>ffmpeg-python</code> wrapper is used to stitch the 6 fps animated visuals in a 3 × 3 tiled video mosaic MP4 file. 

You can install the library using the following command in bash:

```bash
pip install ffmpeg
```

To download the wrapper for more advanced filtering functions:

```bash
pip install ffmpeg-python
```

For ease of use, it is also recommended that the repository be cloned using the following bash command:

```bash
git clone https://github.com/srikanthashish/meditation-visuals.git
```

## Post-Processing

Once the dynamic visuals are generated for each of the nine sessions, it can be exciting to look at them side by side! 

After navigating to the <code>meditation-visuals/</code> on your computer, run the <code>3x3_tiling.sh</code> bash script:

```bash
bash 3x3_tiling.sh
```

This will produce four (4) additional files in the following order (examples of each can be found in the [figs/](figs) folder): 
1. A 3 × 3 tiling of the nine 6 fps animated visuals (in MP4 format), 
2. A 3 × 3 tiling of the nine 6 fps animated visuals (in GIF format; refer to **Figure 2.**), 
3. A 3 × 3 tiling of the nine 1 fps animated visuals __WITHOUT__ the 5-minute-long meditation audio track (in MP4 format), and
4. A 3 × 3 tiling of the nine 1 fps animated visuals __WITH__ the 5-minute-long meditation audio track (in MP4 format) 

<p align="center">
  <img src="demo_figs/med_rec_complete_animated_6_fps_DEMO.gif" alt="" width=250 height=250/>
</p>

<i>**Figure 2.** 6 FPS GIF animation of the first 36 seconds of a 3 × 3 tiling meditation visual, generated using demo data.</i>

## Concluding Thoughts

To conclude, this activty is intended to be a valuable exercise in the processing and visualization of EEG data. By leveraging various libraries in R and bash programming, we can load data recorded in Microsoft Excel format, create frames for second-by-second meditation activity, and compile them into a fun animated visual!

If you have any questions or comments, please feel free to [reach out to me](https://cirvmwr2x1o.typeform.com/to/iYZbtN9F).

![footer02](https://user-images.githubusercontent.com/29677962/231235142-65a6eadb-0b17-4daf-bc56-bd31934acf67.png)
