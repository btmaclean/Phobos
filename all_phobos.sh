#!/bin/bash

echo -e '\nWelcome to ALL_PHOBOS'

echo -e "\nWhich cluster [m4][6397][2808][47tuc][m55][ngc288]?\n"
read cluster
if [[ $cluster = "m4" ]]; then
	location=/Users/macleanb/data/m4/m4_members/analysis/
	echo "#!/usr/local/bin/python

#--------------- USER VARIABLES ------------------#

#-------------------------------------------------#
#--------------- USER TO DEFINE ------------------#
#-- Define location of analysis directory.
location = '/Users/macleanb/data/m4/m4_members/analysis'
#-- Define the two linelist files.
linelist_fe = '/Users/macleanb/data/line_lists/fe_short.lines'
linelist_elements = '/Users/macleanb/data/line_lists/naomgal.lines'
#-- Choose prefered text editor launch command (e.g. gedit)
texteditor = 'mate'
#-- Set initial estimate for metallicity ([Fe/H])
fe_h = -1.15
#-- Define distance modulus of cluster
dist_mod = 12.82
#-- Define colour scale in photometry (options: BV, VJ, VK, VH, by)
colour_scale = 'VK'
#--------------- USER TO DEFINE ------------------#
#-------------------------------------------------#" > /Users/macleanb/observational_software/scripts/phobos/user_variables.py
elif [[ $cluster = "6397" ]]; then
	location=/Users/macleanb/data/ngc6397/analysis/
	echo "#!/usr/local/bin/python

#--------------- USER VARIABLES ------------------#

#-------------------------------------------------#
#--------------- USER TO DEFINE ------------------#
#-- Define location of analysis directory.
location = '/Users/macleanb/data/ngc6397/analysis'
#-- Define the two linelist files.
linelist_fe = '/Users/macleanb/data/line_lists/fe_short.lines'
linelist_elements = '/Users/macleanb/data/line_lists/naomgal.lines'
#-- Choose prefered text editor launch command (e.g. gedit)
texteditor = 'mate'
#-- Set initial estimate for metallicity ([Fe/H])
fe_h = -2.02
#-- Define distance modulus of cluster
dist_mod = 12.37
#-- Define colour scale in photometry (options: BV, VJ, VK, VH, by)
colour_scale = 'VK'
#--------------- USER TO DEFINE ------------------#
#-------------------------------------------------#" > /Users/macleanb/observational_software/scripts/phobos/user_variables.py


elif [[ $cluster = "ngc288" ]]; then
	location=/home/osboxes/summer2018-19/phobos/analysis
	echo "#!/usr/local/bin/python

#--------------- USER VARIABLES ------------------#

#-------------------------------------------------#
#--------------- USER TO DEFINE ------------------#
#-- Define location of analysis directory.
location = '/home/osboxes/summer2018-19/phobos/analysis'
#-- Define the two linelist files.
linelist_fe = '/home/osboxes/summer2018-19/phobos/line_lists/fe_short.lines'
linelist_elements = '/home/osboxes/summer2018-19/phobos/line_lists/naomgal.lines'
#-- Choose prefered text editor launch command (e.g. gedit)
texteditor = 'emacs'
#-- Set initial estimate for metallicity ([Fe/H])
fe_h = -1.26
#-- Define distance modulus of cluster
dist_mod = 14.79
#-- Define colour scale in photometry (options: BV, VJ, VK, VH, by)
colour_scale = 'VKgonz'
#--------------- USER TO DEFINE ------------------#
#-------------------------------------------------#" > /home/osboxes/software/phobos/user_variables.py


elif [[ $cluster = "2808" ]]; then
	location=/Users/macleanb/data/ngc2808/analysis/
	echo "#!/usr/local/bin/python

#--------------- USER VARIABLES ------------------#

#-------------------------------------------------#
#--------------- USER TO DEFINE ------------------#
#-- Define location of analysis directory.
location = '/Users/macleanb/data/ngc2808/analysis'
#-- Define the two linelist files.
linelist_fe = '/Users/macleanb/data/line_lists/fe_short.lines'
linelist_elements = '/Users/macleanb/data/line_lists/naomgal.lines'
#-- Choose prefered text editor launch command (e.g. gedit)
texteditor = 'mate'
#-- Set initial estimate for metallicity ([Fe/H])
fe_h = -1.14
#-- Define distance modulus of cluster
dist_mod = 15.59
#-- Define colour scale in photometry (options: BV, VJ, VK, VH, by)
colour_scale = 'VK'
#--------------- USER TO DEFINE ------------------#
#-------------------------------------------------#" > /Users/macleanb/observational_software/scripts/phobos/user_variables.py
elif [[ $cluster = "47tuc" ]]; then
	location=/Users/macleanb/data/47tuc/analysis/
	echo "#!/usr/local/bin/python

#--------------- USER VARIABLES ------------------#

#-------------------------------------------------#
#--------------- USER TO DEFINE ------------------#
#-- Define location of analysis directory.
location = '/Users/macleanb/data/47tuc/analysis'
#-- Define the two linelist files.
linelist_fe = '/Users/macleanb/data/line_lists/fe_short.lines'
linelist_elements = '/Users/macleanb/data/line_lists/naomgal.lines'
#-- Choose prefered text editor launch command (e.g. gedit)
texteditor = 'gedit'
#-- Set initial estimate for metallicity ([Fe/H])
fe_h = -0.72
#-- Define distance modulus of cluster
dist_mod = 13.41
#-- Define colour scale in photometry (options: BV, VJ, VK, VH, by)
colour_scale = 'VKgonz'
#--------------- USER TO DEFINE ------------------#
#-------------------------------------------------#" > /Users/macleanb/observational_software/scripts/phobos/user_variables.py
elif [[ $cluster = "m55" ]]; then
	location=/Users/macleanb/data/m55/analysis/
	echo "#!/usr/local/bin/python

#--------------- USER VARIABLES ------------------#

#-------------------------------------------------#
#--------------- USER TO DEFINE ------------------#
#-- Define location of analysis directory.
location = '/Users/macleanb/data/47tuc/analysis'
#-- Define the two linelist files.
linelist_fe = '/Users/macleanb/data/line_lists/fe_short.lines'
linelist_elements = '/Users/macleanb/data/line_lists/naomgal.lines'
#-- Choose prefered text editor launch command (e.g. gedit)
texteditor = 'mate'
#-- Set initial estimate for metallicity ([Fe/H])
fe_h = -1.94
#-- Define distance modulus of cluster
dist_mod = 13.95
#-- Define colour scale in photometry (options: BV, VJ, VK, VH, by)
colour_scale = 'VK'
#--------------- USER TO DEFINE ------------------#
#-------------------------------------------------#" > /Users/macleanb/observational_software/scripts/phobos/user_variables.py
fi

cd $location

namelist=($(awk '{print $1}' spectro.params))
array_element=$((${#namelist[@]} - 1))

echo -e "\nMetallicity [f], Spectro Params [p], or Elemental [e]?\n "
read operation
if [[ $operation = "f" ]]; then
	rm X_line_abundance_summaries/Fe_results.txt
	for ((i=0; i<=array_element; i++)); do
		echo -e "$cluster\n$(($i + 1))\nf" | phobos
	done
	mate X_line_abundance_summaries/Fe_results.txt
elif [[ $operation = "p" ]]; then
	rm X_line_abundance_summaries/Fe_results.txt
	rm phobos_iterations/*
	for ((i=0; i<=array_element; i++)); do
		echo -e "$cluster\n$(($i + 1))\np" | phobos
		#echo -e "$cluster\n$(($i + 1))\np" | phobos
		#echo -e "$cluster\n$(($i + 1))\np" | phobos
	done
	mate X_line_abundance_summaries/Fe_results.txt	
elif [[ $operation = "e" ]]; then
	rm X_line_abundance_summaries/EWs_*.txt
	rm X_line_abundance_summaries/Fe_results.txt
	for ((i=0; i<=array_element; i++)); do
		echo -e "$cluster\n$(($i + 1))\ne" | phobos
	    #grep '7771' X_line_abundance_summaries/${namelist[$i]}/O_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_7771_O.txt
		#grep '7774' X_line_abundance_summaries/${namelist[$i]}/O_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_7774_O.txt
		#grep '7775' X_line_abundance_summaries/${namelist[$i]}/O_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_7775_O.txt
		
		grep '5682' X_line_abundance_summaries/${namelist[$i]}/Na_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5682_Na.txt
		grep '5688' X_line_abundance_summaries/${namelist[$i]}/Na_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5688_Na.txt
		#grep '6154' X_line_abundance_summaries/${namelist[$i]}/Na_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6154_Na.txt
		#grep '6160' X_line_abundance_summaries/${namelist[$i]}/Na_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6160_Na.txt
	    
	    grep '4730' X_line_abundance_summaries/${namelist[$i]}/Mg_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4730_Mg.txt
		grep '5711' X_line_abundance_summaries/${namelist[$i]}/Mg_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5711_Mg.txt
		#grep '7691' X_line_abundance_summaries/${namelist[$i]}/Mg_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_7691_Mg.txt
		
		grep '6698' X_line_abundance_summaries/${namelist[$i]}/Al_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6698_Al.txt
		grep '6696' X_line_abundance_summaries/${namelist[$i]}/Al_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6696_Al.txt

		grep '5857' X_line_abundance_summaries/${namelist[$i]}/Ca_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5857_Ca.txt
		grep '6493' X_line_abundance_summaries/${namelist[$i]}/Ca_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6493_Ca.txt
		grep '6499' X_line_abundance_summaries/${namelist[$i]}/Ca_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6499_Ca.txt
		grep '6572' X_line_abundance_summaries/${namelist[$i]}/Ca_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6572_Ca.txt
		grep '6717' X_line_abundance_summaries/${namelist[$i]}/Ca_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6717_Ca.txt

		grep '4801' X_line_abundance_summaries/${namelist[$i]}/CrI_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4801_CrI.txt
		grep '5783' X_line_abundance_summaries/${namelist[$i]}/CrI_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5783_CrI.txt
		grep '5784' X_line_abundance_summaries/${namelist[$i]}/CrI_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5784_CrI.txt

		grep '4812' X_line_abundance_summaries/${namelist[$i]}/CrII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4812_CrII.txt
		grep '4848' X_line_abundance_summaries/${namelist[$i]}/CrII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4848_CrII.txt				
		grep '4876' X_line_abundance_summaries/${namelist[$i]}/CrII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4876_CrII.txt
		grep '4884' X_line_abundance_summaries/${namelist[$i]}/CrII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4884_CrII.txt

		grep '6707.7' X_line_abundance_summaries/${namelist[$i]}/L_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6707.7_L.txt
		grep '6707.9' X_line_abundance_summaries/${namelist[$i]}/L_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6707.9_L.txt

		grep '4823' X_line_abundance_summaries/${namelist[$i]}/Mn_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4823_Mn.txt
		grep '4761' X_line_abundance_summaries/${namelist[$i]}/Mn_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4761_Mn.txt
		
		grep '5709' X_line_abundance_summaries/${namelist[$i]}/Ni_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5709_Ni.txt
		grep '5748' X_line_abundance_summaries/${namelist[$i]}/Ni_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5748_Ni.txt
		grep '5760' X_line_abundance_summaries/${namelist[$i]}/Ni_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5760_Ni.txt
		grep '5847' X_line_abundance_summaries/${namelist[$i]}/Ni_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5847_Ni.txt
		grep '6482' X_line_abundance_summaries/${namelist[$i]}/Ni_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6482_Ni.txt
		grep '6532' X_line_abundance_summaries/${namelist[$i]}/Ni_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6532_Ni.txt
		grep '6586' X_line_abundance_summaries/${namelist[$i]}/Ni_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6586_Ni.txt

		grep '5667' X_line_abundance_summaries/${namelist[$i]}/ScII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5667_ScII.txt
		grep '5669' X_line_abundance_summaries/${namelist[$i]}/ScII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5669_ScII.txt
		grep '6604' X_line_abundance_summaries/${namelist[$i]}/ScII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6604_ScII.txt

		grep '4810' X_line_abundance_summaries/${namelist[$i]}/Zn_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4810_Zn.txt
		grep '4722' X_line_abundance_summaries/${namelist[$i]}/Zn_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4722_Zn.txt



		grep '4864' X_line_abundance_summaries/${namelist[$i]}/V_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4864_V.txt
		grep '4875' X_line_abundance_summaries/${namelist[$i]}/V_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4875_V.txt
		grep '4881' X_line_abundance_summaries/${namelist[$i]}/V_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4881_V.txt
		grep '5703' X_line_abundance_summaries/${namelist[$i]}/V_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5703_V.txt
		grep '5727' X_line_abundance_summaries/${namelist[$i]}/V_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5727_V.txt

		#grep '7835' X_line_abundance_summaries/${namelist[$i]}/Al_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_7835_Al.txt
		#grep '7836' X_line_abundance_summaries/${namelist[$i]}/Al_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_7836_Al.txt

		#grep '7698' X_line_abundance_summaries/${namelist[$i]}/K_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_7698_K.txt

		grep '5793' X_line_abundance_summaries/${namelist[$i]}/Si_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5793_Si.txt
		grep '5690' X_line_abundance_summaries/${namelist[$i]}/Si_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5690_Si.txt
		grep '5772' X_line_abundance_summaries/${namelist[$i]}/Si_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5772_Si.txt
		grep '5780' X_line_abundance_summaries/${namelist[$i]}/Si_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5780_Si.txt
		grep '5708' X_line_abundance_summaries/${namelist[$i]}/Si_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5708_Si.txt
		grep '6721' X_line_abundance_summaries/${namelist[$i]}/Si_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6721_Si.txt
		grep '5665' X_line_abundance_summaries/${namelist[$i]}/Si_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5665_Si.txt
		grep '5684' X_line_abundance_summaries/${namelist[$i]}/Si_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5684_Si.txt
		
		grep '5866' X_line_abundance_summaries/${namelist[$i]}/TiI_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5866_TiI.txt
		grep '4820' X_line_abundance_summaries/${namelist[$i]}/TiI_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4820_TiI.txt
		grep '4758' X_line_abundance_summaries/${namelist[$i]}/TiI_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4758_TiI.txt		
		grep '4759' X_line_abundance_summaries/${namelist[$i]}/TiI_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4759_TiI.txt
		grep '4840' X_line_abundance_summaries/${namelist[$i]}/TiI_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4840_TiI.txt
		grep '6556' X_line_abundance_summaries/${namelist[$i]}/TiI_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6556_TiI.txt

		grep '4798' X_line_abundance_summaries/${namelist[$i]}/TiII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4798_TiII.txt
		grep '6606' X_line_abundance_summaries/${namelist[$i]}/TiII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6606_TiII.txt
		grep '4865' X_line_abundance_summaries/${namelist[$i]}/TiII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4865_TiII.txt
		grep '4874' X_line_abundance_summaries/${namelist[$i]}/TiII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4874_TiII.txt
		grep '6680' X_line_abundance_summaries/${namelist[$i]}/TiII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6680_TiII.txt
	
		grep '4883' X_line_abundance_summaries/${namelist[$i]}/YII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4883_YII.txt
		grep '4398' X_line_abundance_summaries/${namelist[$i]}/YII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4398_YII.txt
		grep '4900' X_line_abundance_summaries/${namelist[$i]}/YII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_4900_YII.txt
		grep '5200' X_line_abundance_summaries/${namelist[$i]}/YII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5200_YII.txt

		grep '6496' X_line_abundance_summaries/${namelist[$i]}/BaII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5200_BaII.txt
		grep '5853' X_line_abundance_summaries/${namelist[$i]}/YII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_5853_BaII.txt

		grep '6645' X_line_abundance_summaries/${namelist[$i]}/EuII_lines.summary | echo $(awk '{print $2} {print $3}') >> X_line_abundance_summaries/EWs_6645_EuII.txt

	done
	mate X_line_abundance_summaries/EWs_*.txt
	#mate X_line_abundance_summaries/Fe_results.txt
fi
