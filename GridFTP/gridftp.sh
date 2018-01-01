wget http://downloads.globus.org/toolkit/gt6/stable/installers/repo/deb/globus-toolkit-repo_latest_all.deb
sudo dpkg -i globus-toolkit-repo_latest_all.deb
sudo apt-get update
sudo apt-get install globus-gridftp globus-data-management-client globus-data-management-servers
