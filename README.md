# polymer_twist

###################################
REPOSITORY STRUCTURE
###################################


This repository contains the basic data that supports the results of the paper "Heat Transport with a Twist," which studies the effect of mechanical twist on the thermal conduction of a thin polymer wire. The two main folders ("N98" and "N36") correspond to two different chain lengths. Inside each of these folders are sub-folders that specify a specific of numbers of twists (i.e "4-twist"), and one sub-folder labeled "gen_twist." The former contain coordinate files for twisted configurations and the scripts designed to compute the thermal codunctance of these configurations. The latter contains the scripts designed to generate the twisted configurations by starting with an untwisted wire and applying torque at one end. All scripts in this repository use two-stranded polyethelene with the TraPPE-UA force field as our model wire.


###################################
RUNNING MOLECULAR DYNAMICS SIMULATIONS
###################################

To run the molecular dynamics simulations, simply navigate to the desired folder and run:

1) lammps < in.PEequil > Outequil

2) mv FINALCONFIG RESTART

3) lammps < in.PEprod > Outprod

where lammps is the executable of the LAMMMPS software program. Note that we use the version of LAMMPS released on March 16, 2018.


###################################
ANALYZING OUTPUT FILES
###################################

The output file file "log.lammps" contains the data for computing the thermal conductance. To obtain the thermal conductance from the output of a simulation, simply run "bash get_conductance.sh" from the appropriate folder containing the output file. 

The output file "profile.langevin" contains the data for the temperature profiles.


###########################################################
QUESTIONS

If questions arise when trying to run these scripts, please contact the author Ethan Abraham who can be reached at abrahame@sas.upenn.edu. Also note that this repository only includes some of the scripts used in our study. If the data for other force fields, chain numbers, or numbers of twist are desired, please contact the author. 

