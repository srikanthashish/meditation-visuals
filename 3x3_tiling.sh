# Create 3x3 tiling of the nine 6 fps animated visuals
ffmpeg -i "figs/med_rec_complete_ses-01_animated_6_fps.mp4" \
-i "figs/med_rec_complete_ses-02_animated_6_fps.mp4" \
-i "figs/med_rec_complete_ses-03_animated_6_fps.mp4" \
-i "figs/med_rec_complete_ses-04_animated_6_fps.mp4" \
-i "figs/med_rec_complete_ses-05_animated_6_fps.mp4" \
-i "figs/med_rec_complete_ses-06_animated_6_fps.mp4" \
-i "figs/med_rec_complete_ses-07_animated_6_fps.mp4" \
-i "figs/med_rec_complete_ses-08_animated_6_fps.mp4" \
-i "figs/med_rec_complete_ses-09_animated_6_fps.mp4" \
-filter_complex "[0:v][1:v][2:v][3:v][4:v][5:v][6:v][7:v][8:v]xstack=inputs=9:layout=0_0|w0_0|w0+w3_0|0_h0|w0_h0|w0+w3_h0|0_h0+h1|w0_h0+h1|w0+w3_h0+h1[v]" \
-map "[v]" "figs/med_rec_complete_animated_6_fps.mp4"

# Convert the 3x3 tiling of the nine 6 fps animated visuals to GIF format
ffmpeg -ss 0 -t 6 -i "figs/med_rec_complete_animated_6_fps.mp4" \
    -vf "fps=6,scale=3840:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 "figs/med_rec_complete_animated_6_fps.gif"

# Create 3x3 tiling of the nine 1 fps animated visuals
ffmpeg -i "figs/med_rec_complete_ses-01_animated_1_fps.mp4" \
-i "figs/med_rec_complete_ses-02_animated_1_fps.mp4" \
-i "figs/med_rec_complete_ses-03_animated_1_fps.mp4" \
-i "figs/med_rec_complete_ses-04_animated_1_fps.mp4" \
-i "figs/med_rec_complete_ses-05_animated_1_fps.mp4" \
-i "figs/med_rec_complete_ses-06_animated_1_fps.mp4" \
-i "figs/med_rec_complete_ses-07_animated_1_fps.mp4" \
-i "figs/med_rec_complete_ses-08_animated_1_fps.mp4" \
-i "figs/med_rec_complete_ses-09_animated_1_fps.mp4" \
-filter_complex "[0:v][1:v][2:v][3:v][4:v][5:v][6:v][7:v][8:v]xstack=inputs=9:layout=0_0|w0_0|w0+w3_0|0_h0|w0_h0|w0+w3_h0|0_h0+h1|w0_h0+h1|w0+w3_h0+h1[v]" \
-map "[v]" "figs/med_rec_complete_animated_1_fps.mp4"

# Stitch the 432Hz_Om-chanting.mp3 audio file with the 3x3 tiling of the nine 1 fps animated visuals
ffmpeg -i "figs/med_rec_complete_animated_1_fps.mp4" -i "stimuli/vedic-meditation/432Hz_Om-chanting.mp3" -shortest "figs/med_rec_complete_animated_1_fps_with_audio.mp4"