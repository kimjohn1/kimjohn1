# Install Dependencies
    #previously accomplished during the Qt5 installation
    sudo apt install -y qt5-qmake
    sudo apt install -y qtbase5-dev

# Install Qt5.15.2
    #see the install_Qt5.sh or Viewer_from_source.sh script

# Install ImageVis3D
    git clone --recurse-submodules https://github.com/SCIInstitute/ImageVis3D.git
    #git clone submodule update --init --recurse-submodules https://github.com/SCIInstitute/ImageVis3D.git
    #git submodule update --init --recursive
    cd ImageVis3D
    git checkout --track origin/v4.0.0_import
    cd Tuvok
    git checkout IV3D-4.0.0-import
    cd ~/

#possible issues with this installation.  the application installs and runs, but does not render a visual fro a uvf file -kj
    cd ImageVis3D/ImageVis3D
    qmake -recursive
    cd ..
    qmake
    make

# Set up the desktop launcher
    cd ~/
    sudo cp support/Paraview.png /usr/share/icons
    cp support/IV3D.desktop ~/Desktop
    chmod +rwx ~/Desktop/IV3D.desktop
