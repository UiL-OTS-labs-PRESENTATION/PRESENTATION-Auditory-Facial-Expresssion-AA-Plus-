# Scenario for playing .wav files and sending markers defined in a text file using PCL
# 2005 Petra van Alphen (p.m.vanalphen@uva.nl).
# 2012 Anne van Leeuwen (a.r.vanleeuwen1@uu.nl), created in Presentation version 14.9

scenario = "AA Plus";
pcl_file = "AA Plus.pcl";
no_logfile = false ;

# write_codes = true;               
# pulse_width= 10;
  
active_buttons = 4;    
button_codes = 1,2,3,4;
response_matching = simple_matching;

default_font_size=30;
default_font = "Arial";
default_text_color = 255,255,255;

begin;

# First we define several displays
picture {} default;
picture { text {caption = "+"; font_size = 60;};   x=0; y=0;} fix1;
picture { text {caption = "- - -"; font_size = 60;};   x=0; y=0;} knipper;
picture { text {caption = "Druk op Enter om met de oefensessie te beginnen. \n
Druk op Enter nadat het kruisje van het scherm is verdwenen, \n je gaat dan naar de volgende zin."; font_size = 22;}; x=0; y=0;} beginexp;   
picture { text {caption = "Einde Oefensessie \n Druk op Enter om verder te gaan";}; x=0; y=0;} eindoefen;
picture { text {caption = "BEGIN EXPERIMENT \n \n Druk op Enter om met het experiment te beginnen"; font_size = 22;}; x=0; y=0;} begintest; 
picture { text {caption = "LUISTER AANDACHTIG \n Geef bij iedere zin aan of de zin uitgesproken is met een frons of een glimlach."; font_size = 22;}; x=0; y=0;} aandacht; 
picture { text {caption = "EINDE EXPERIMENT \n Dank je wel voor het meedoen";}; x=0; y=0;} eindexp;    


picture { text {caption = " WELKOM en hartelijk bedankt voor je deelname.
\n
Jouw taak in dit onderzoek is als volgt. Zometeen krijg je stukjes van zinnen te horen.
De zinnen zijn bewerkt met de computer. 
Jouw taak is om van ieder zinsfragment aan te geven 
of het is uitgesproken met een frons of met een glimlach ☺. 
Je moet dat zo snel mogelijk en zo nauwkeurig
mogelijk doen, door te drukken op de knopjes op het knoppenkastje.
\n 
Om te beginnen moet je de wijsvinger van je schrijfhand op de punt in het
MIDDEN van de twee knoppen leggen. Na ieder antwoord moet je je vinger weer 
terugleggen op dit punt in het midden."; font_size = 24;}; x=0; y=0;} uitlegval; 

picture { text {caption = "
Als je vindt dat het zinsfragment dat je hoorde is uitgesproken met een
frons, druk dan zo snel mogelijk met je wijsvinger op de
LINKER knop, gemerkt FRONS. Als je vindt dat het zinsfragment
is uitgesproken met een glimlach ☺, druk dan zo snel mogelijk op de
RECHTER knop, gemerkt GLIMLACH.
\n
Wees zo snel en zo nauwkeurig mogelijk, en leg je wijsvinger tussendoor
steeds weer op de punt in het midden van de knoppen.
\n
Je krijgt overigens niet de hele zinnen te horen, maar alleen een
fragment daarvan. De zinsfragmenten zijn daardoor soms slecht
verstaanbaar. Toch moet je altijd antwoord geven, ook als je het
fragment niet goed hebt verstaan.
\n
Alvast hartelijk dank voor je deelname!"; font_size = 24;}; x=0; y=0;} uitleg2; 

#pictures for the breaks
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze1;
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze2;
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze3;
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze4;
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze5;
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze6;
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze7;
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze8;
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze9;
picture { bitmap {filename = "M:\\jvbproject\\presentation database\\AA-Anne\\Stimuli\\pauze1.jpg";};x=0; y=0;}pauze10;

# We define a sound and name it
sound { wavefile { filename = ""; preload = false;} s; } snd;

# Warning before the start

trial {
   trial_type = first_response;
	trial_duration = forever; 
   picture uitlegval;
   target_button = 1;
   response_active = true;
}uitlegexp;

trial {
   trial_type = first_response;
	trial_duration = forever; 
   picture uitleg2;
   target_button = 1;
   response_active = true;
}uitlegexp2;

# End of Practice
trial {
   start_delay = 1000;
	trial_type = first_response;
	trial_duration = forever; 
   picture eindoefen;
   target_button = 1;
   response_active = true;
}endpractice;

# Begin of Testitems
trial {
   trial_type = first_response;
	trial_duration = forever; 
   picture begintest;
   target_button = 1;
   response_active = true;
}starttest;

# End of Testitems
trial {
   start_delay = 1000;
	trial_type = first_response;
	trial_duration = forever; 
   picture eindexp;
   target_button = 1;
   response_active = true;
}endexp;

# End of Testitems
trial {
   start_delay = 500;
	trial_duration = 1500; 
   picture aandacht;
}payattention;

# Main trial definition. Play wav sound and send marker at the beginning of each sentence plus one critical marker,
# namely the onset of the CW = critical marker1 (portcode 200). No critical marker 2 and 3 anymore. 

trial { 
	trial_duration = 1000;                        
	trial_type = fixed;

#show fixation cross, direct when trail starts time = 0
	stimulus_event {
   picture fix1;
	time = 0;
	} event0;
} fixatiekr;

trial {
   monitor_sounds = false; 
   trial_type = first_response;
   trial_duration = forever;
	stimulus_event {
   picture fix1;
	} fixatiekruis;
	
#play sound 1000ms after start picture, sends out code 'onset' for the beginning of the sentence
	stimulus_event {
   sound snd; 
	target_button = 1,2;
#  port_code = 100;
   code = "onset";							 
	} wavevent;
	
#critical marker1
	stimulus_event {
	nothing {};
	target_button = 1,2;
	deltat = 0; 
   code = "onsetcw";
#  port_code = 200;
   } eventlab1;

#critical marker2		
   stimulus_event {
	nothing {};
   target_button = 1,2;
	deltat = 0;
   code = "offsetcw";
#  port_code = 210;
	} eventlab2;
} playsent;

# Time to press for the next item after fixation cross disappears. 
trial {
	trial_duration = 1000;                    # De tijd van het zwarte scherm na het drukken van de reactie; voordat het volgende item begint.  
   picture default;
   target_button = 1,2;                     
	stimulus_event { 
   picture default;
	code = "itemnr";			
	} eventblok;
}blink;

# Small breaks, show picture of monsters
trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break1a;

trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break1b;

trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break2a;

trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break2b;

trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break3a;

trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break3b;

trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break4a;

trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break4b;

trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break5a;

trial {
   trial_duration = forever;
	trial_type = first_response;
   picture pauze1;
   target_button = 4;
   response_active = true;
} break5b;