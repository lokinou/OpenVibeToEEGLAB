% specify the path to the most recent EEGLAB
EEGLAB_DIR = 'C:\BCI\dev\eeglab2020_0'

addpath(EEGLAB_DIR);

% Start EEGLAB
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

% Load the file converted file from OpenVibe (gdf is fine)
EEG = pop_biosig('.\data\converted_gdf.gdf');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 
eeglab redraw;

% Select a few events (Check EEG.event to find type names)
EEG = pop_selectevent( EEG, 'type',{'class1, Left hand	- cue onset (BCI experiment)'},'renametype','T1','deleteevents','off');
EEG = pop_selectevent( EEG, 'type',{'class2, Right hand	- cue onset (BCI experiment)'},'renametype','T2','deleteevents','off');
EEG = pop_selectevent( EEG, 'type',{'Feedback (continuous) - onset (BCI experiment)'},'renametype','Feedback','deleteevents','off');

% this statement selects the renamed types and delete all other events
EEG = pop_selectevent( EEG, 'type',{'T1', 'T2', 'Feedback'}, 'deleteevents','on');
%  check event types in EEG.event to find the type names
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off', 'setname', 'events_filt'); 
eeglab redraw;

% OpenVibe does not correct drift, so signals will be completely off until
% you apply a bandpass
EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',40,'plotfreqz',1);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'gui','off', 'setname', 'bandpassed'); 
eeglab redraw;


