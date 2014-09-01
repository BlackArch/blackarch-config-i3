i3-blackarch
============
#ABOUT
This project aims to provide the user with an i3wm desktop on a clean netinstall of BlackArch linux net-install.  

Installation
============
#INSTALLATION
1. Follow installation instructions for either the x86_64 or i686 net-install on http://www.blackarch.org/download.html
2. Reboot machine to ensure successful installation
3. wget http://7.ly/setupX 

	**********************************************************************************************************
	** IF THE ABOVE LINK RETURNS NOTHING	... USE THIS													**
	**																										**
	**	wget https://raw.githubusercontent.com/BlackArch/i3-blackarch/master/.scripts-for-setup/setupX		**
	**********************************************************************************************************

4. Run 'source setupX'
	
	5. +OPTIONAL+    Once X has started ; open a terminal and run 'source pacaur'
		
			Option 5 will setup custom zsh config and set up your background (for good)

							If you wouldnt like the zsh config 

	  ::: If you dont run pacaur ; Run 'source background-ASAP' to let the i3 config recognize the wallpaper ! :::

			-={ You may want to edit .zshrc :: To help with local completion }=- 
						-={  TIP : SEARCH FOR 'cocky'  in .zshrc }=-
