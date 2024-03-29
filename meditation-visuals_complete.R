# Author: Ashish Srikanth
# Title: Meditation Visuals (Complete)
# Description: This repository contains R scripts that replicate the animated figures
# generated in a personal project focused on processing electroencephalographic (EEG)
# recording files acquired via the BrainCo Inc. FocusCalm Headband, a non-invasive
# neuroimaging device.

# The primary objective of the project was to improve understanding of the neural
# underpinnings of meditation practices, as applied to the personal experiences of the author.
# The scripts enable replication of the analysis methods employed in generating the animated
# figures, facilitating future efforts for visualizing surface-level brain activity during meditation.

# View the project on GitHub: https://github.com/srikanthashish/meditation-visuals

# Import libraries --------------------------------------------------------
# For reading Excel files
library(readxl)
# For data manipulation
library(dplyr)
# For working with audio & video
library(av)
# For working with Google fonts
library(gfonts)

# Create folder called 'figs' if it does not already exist
dir.create("figs")

# Read XLSX file from list of file names ----------------------------------
# Make sure to update this path!
med_fn_file = "input/meditation-visuals_filenames.xlsx"
med_fn <- data.frame(read_excel(med_fn_file))
med_fn_list = as.list(med_fn)

# Use 'Poppins' font
setup_font(id = "poppins",
           output_dir = "fonts/",
           variants = "regular")

# Set path to 'Poppins' font
use_font("poppins", "fonts/css/poppins.css")

# Loop through code to process data for all sessions in a list ------------
for (d in 1:length(med_fn_list[["session"]])) {
  # Note: 'Day' number corresponds to the 'session' number, since
  # each recording was obtained once a day during the morning hours
  day_label = paste0("DAY ", med_fn_list[["session"]][d], "/", length(med_fn_list[["session"]]))
  
  # Read XLSX file for meditation data --------------------------------------
  med_data_file = paste0(# Make sure to update this path!
    "input/",
    gsub("UTC", "_", med_fn_list[["filename"]][d]),
    ".xlsx")
  # Read the meditation data
  med_data <- data.frame(read_excel(med_data_file))
  # Convert meditation data to list format
  med_data_list = as.list(med_data)
  

  # Set frame counter for a complete 5-min recording ------------------------
  b = 1
    
    # Generate and compile frames for complete recording (300 frames per animation)
    while (b < length(med_data_list[["Meditation"]]) + 1) {
      if (b > 0 & b < 10) {
        png(
          file = paste0(
            "med_rec_00",
            b,
            "_ses-0",
            d,
            ".png",
            sep = ""
          ),
          width = 1.5,
          height = 1.5,
          units = "in",
          res = 600
        )
      }
      if (b == 10) {
        png(
          file = paste0(
            "med_rec_0",
            b,
            "_ses-0",
            d,
            ".png",
            sep = ""
          ),
          width = 1.5,
          height = 1.5,
          units = "in",
          res = 600
        )
      }
      if (b > 10 & b < 100) {
        png(
          file = paste0(
            "med_rec_0",
            b,
            "_ses-0",
            d,
            ".png",
            sep = ""
          ),
          width = 1.5,
          height = 1.5,
          units = "in",
          res = 600
        )
      }
      if (b == 100) {
        png(
          file = paste0(
            "med_rec_",
            b,
            "_ses-0",
            d,
            ".png",
            sep = ""
          ),
          width = 1.5,
          height = 1.5,
          units = "in",
          res = 600
        )
      }
      if (b > 100) {
        png(
          file = paste0(
            "med_rec_",
            b,
            "_ses-0",
            d,
            ".png",
            sep = ""
          ),
          width = 1.5,
          height = 1.5,
          units = "in",
          res = 600
        )
      }
      
      # Code for 'square' function ------------------------------------------------
      square <- function(xSize, ySize, grout, hFactor) {
        xWave <- seq.int(1:xSize)
        yWave <- seq.int(1:ySize)
        axMin <- min(min(xWave) - 1, min(yWave) - 1)
        axMax <- max(max(xWave) + 1, max(yWave) + 1)
        nSquares <- length(xWave) * length(yWave)
        x <- 0
        halfGrout <- (1 - grout) / 2
        
        for (i in seq_along(yWave)) {
          yCentre <- yWave[i]
          for (j in seq_along(xWave)) {
            if (hFactor < 1) {
              hyst <- rnorm(8, halfGrout, 0)
            }
            else {
              hyst <- rnorm(8, halfGrout, sin(x / (nSquares - 1) * pi) / hFactor)
            }
            xCentre <- xWave[j]
            lt <- c(xCentre - hyst[1], yCentre - hyst[2])
            rt <- c(xCentre + hyst[3], yCentre - hyst[4])
            rb <- c(xCentre + hyst[5], yCentre + hyst[6])
            lb <- c(xCentre - hyst[7], yCentre + hyst[8])
            new_shape_start <- rbind(lt, rt, rb, lb)
            new_shape_end <- rbind(rt, rb, lb, lt)
            new_shape <- cbind(new_shape_start, new_shape_end)
            if (i == 1 && j == 1) {
              multiple_segments <- new_shape
            } else {
              multiple_segments <- rbind(multiple_segments, new_shape)
            }
            x <- x + 1
          }
        }
        
        # Change background color to purple if meditation score is high (>60)
        if (as.numeric(med_data_list[["Meditation"]][b]) > 60) {
          par(bg = "#462B78", mar = c(0, 0, 0, 0))
          plot(
            0,
            0,
            xlim = c(axMin, axMax),
            ylim = c(axMax, axMin),
            col = NA,
            lend = 2,
            xlab = "",
            ylab = "",
            axes = F,
            asp = 1
          )
          grid(
            nx = NULL,
            ny = NULL,
            col = "#6941B4",
            lwd = 1
          )
          title(
            main = paste0("MED. SCORE: ", format(round(
              as.numeric(med_data_list[["Meditation"]][b]), 2
            ), nsmall = 2)),
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -1.5,
            family = "Poppins"
          )
          # Labelling instances of Dhyana, a Sanskrit word meaning "meditation"
          title(
            main = "[DHYĀNA]",
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -2,
            family = "Poppins"
          )
        }
        # Change background color to black if meditation score is low (<60)
        if (as.numeric(med_data_list[["Meditation"]][b]) < 60) {
          par(bg = "#0D1117", mar = c(0, 0, 0, 0))
          plot(
            0,
            0,
            xlim = c(axMin, axMax),
            ylim = c(axMax, axMin),
            col = NA,
            lend = 2,
            xlab = "",
            ylab = "",
            axes = F,
            asp = 1
          )
          grid(
            nx = NULL,
            ny = NULL,
            col = "#21262D",
            lwd = 1
          )
          title(
            main = paste0("MED. SCORE: ", format(round(
              as.numeric(med_data_list[["Meditation"]][b]), 2
            ), nsmall = 2)),
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -1.5,
            family = "Poppins"
          )
        }
        
        # Trend label for whether scores are decreasing or increasing -------------
        # If current frame has a lower med. score compared to the last
        if (!isTRUE(as.numeric(med_data_list[["Meditation"]][b - 1]) < as.numeric(med_data_list[["Meditation"]][b]))) {
          title(
            main = "DECR. [-]",
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -6.5,
            family = "Poppins"
          )
        }
        # If current frame has a higher med. score compared to the last
        else {
          title(
            main = "INCR. [+]",
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -6.5,
            family = "Poppins"
          )
        }
        
        if (b > 0 & b < 10) {
          title(
            main = paste0(
              "SEC. ",
              "00",
              b,
              "/",
              length(med_data_list[["Meditation"]]),
              " ",
              "| SES. ",
              d,
              sep = ""
            ),
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -1,
            family = "Poppins"
          )
        }
        if (b == 10) {
          title(
            main = paste0(
              "SEC. ",
              "0",
              b,
              "/",
              length(med_data_list[["Meditation"]]),
              " ",
              "| SES. ",
              d,
              sep = ""
            ),
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -1,
            family = "Poppins"
          )
        }
        if (b > 10 & b < 100) {
          title(
            main = paste0(
              "SEC. ",
              "0",
              b,
              "/",
              length(med_data_list[["Meditation"]]),
              " ",
              "| SES. ",
              d,
              sep = ""
            ),
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -1,
            family = "Poppins"
          )
        }
        if (b == 100) {
          title(
            main = paste0(
              "SEC. ",
              b,
              "/",
              length(med_data_list[["Meditation"]]),
              " ",
              "| SES. ",
              d,
              sep = ""
            ),
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -1,
            family = "Poppins"
          )
        }
        if (b > 100) {
          title(
            main = paste0(
              "SEC. ",
              b,
              "/",
              length(med_data_list[["Meditation"]]),
              " ",
              "| SES. ",
              d,
              sep = ""
            ),
            cex.main = 0.45,
            font.main = 2,
            col.main = "#FFFFFF",
            line = -1,
            family = "Poppins"
          )
        }
        segments(
          x0 = multiple_segments[, 1],
          y0 = multiple_segments[, 2],
          x1 = multiple_segments[, 3],
          y1 = multiple_segments[, 4],
          col = "#FFFFFF",
          lwd = 2
        )
      }
      square(1, 1, (as.numeric(med_data_list[["Meditation"]][b])) / 100, 0)
      dev.off()
      if (b > 0 & b < 10) {
        print(paste0(
          "Created frame for second... 00",
          b,
          paste0(
            "/",
            length(med_data_list[["Meditation"]]),
            " (file: med_rec_",
            b,
            "_ses-0",
            d,
            ".png | session: ",
            d,
            ").",
            sep = ""
          )
        ))
      }
      if (b == 10) {
        print(
          paste0(
            "Created frame for second... 0",
            b,
            "/",
            length(med_data_list[["Meditation"]]),
            " (file: med_rec_",
            b,
            "_ses-0",
            d,
            ".png | session: ",
            d,
            ").",
            sep = ""
          )
        )
      }
      if (b > 10 & b < 100) {
        print(
          paste0(
            "Created frame for second... 0",
            b,
            "/",
            length(med_data_list[["Meditation"]]),
            " (file: med_rec_",
            b,
            "_ses-0",
            d,
            ".png | session: ",
            d,
            ").",
            sep = ""
          )
        )
      }
      if (b == 100) {
        print(
          paste0(
            "Created frame for second... ",
            b,
            "/",
            length(med_data_list[["Meditation"]]),
            " (file: med_rec_",
            b,
            "_ses-0",
            d,
            ".png | session: ",
            d,
            ").",
            sep = ""
          )
        )
      }
      if (b > 100) {
        print(
          paste0(
            "Created frame for second... ",
            b,
            "/",
            length(med_data_list[["Meditation"]]),
            " (file: med_rec_",
            b,
            "_ses-0",
            d,
            ".png | session: ",
            d,
            ").",
            sep = ""
          )
        )
      }
      b = b + 1
    }
    
    
    # Save frames in MP4 format -----------------------------------------------
    # Define desired FPS encoding #1
    fps_01 = 6
    # Define desired FPS encoding #2
    fps_02 = 1
    print(
      paste0(
        "Compiling frames for animated visual of session ",
        d,
        "...",
        sep = ""
      )
    )
    av::av_encode_video(
      list.files(pattern = "\\.png$"),
      framerate = fps_01,
      output = paste0(
        "figs/med_rec_complete_ses-0",
        d,
        "_animated_",
        fps_01,
        "_fps.mp4",
        sep = ""
      )
    )
    av::av_encode_video(
      list.files(pattern = "\\.png$"),
      framerate = fps_02,
      output = paste0(
        "figs/med_rec_complete_ses-0",
        d,
        "_animated_",
        fps_02,
        "_fps.mp4",
        sep = ""
      )
    )
    
    # Delete frames (PNG) after saving MP4
    print(
      paste0(
        "Deleting frames for animated visual of session ",
        d,
        ".",
        sep = ""
      )
    )
    file.remove(list.files(pattern = ".png"))
    print(
      paste0(
        "Saved frames for animated visual of session ",
        d,
        ".",
        sep = ""
      )
    )
}
