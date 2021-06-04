# Convert OpenVibe to EEGLab

Openvibe is great, EEGLAB is also great but it's not easy to get an OpenViBE file into EEGlab.

Here is code to get started with your EEGLab analysis.

(Matlab is only required if you want to modify events)

## Openvibe to GDF 

Please refer to my [conversion tutorial here](https://github.com/lokinou/openvibe_to_gdf_tutorial)

## Read GDF via EEGLAB

### Without matlab (*only signal and event display*)

- Download EEGLAB standalone
- Open the gdf file via the BIOSIG toolbox
- apply a FIR filter to compensate the lack of drift correction
- plot data

### With matlab (*for event renaming, filtering or using ERPLab*)

- Modify and execute [gdf_eeglab_display.m](gdf_eeglab_display.m)
  - set the EEGLAB path
  - check the EEG.event variable for the stimuli needed
  - tweak the stimuli rename and filtering lines

