# From: https://github.com/sci-visus/OpenVisus/blob/master/docs/compilation.md

# Dependencies
    sudo apt update
    #sudo apt install -y build-essential
    sudo apt install -y patchelf
    #sudo apt install -y git
    sudo apt install -y swig
    #sudo apt install -y cmake
    #sudo apt install -y python3 
    sudo apt install -y python3-dev
    #sudo apt install -y python3-pip
    sudo apt install -y mesa-common-dev
    #sudo apt install -y libglu1-mesa-dev

    python3 -m pip install numpy

# Install Qt Note:If this installation is acomplished, the cmake flag below needs to be changed to -DQt5_DIR=~/Qt5/5.15.2 ...
    mkdir ~/Qt
    python3 -m aqt install-qt --outputdir ~/Qt linux desktop 5.15.2 gcc_64

# Get the repo and compile OpenVisus
    git clone https://github.com/sci-visus/OpenVisus
    cd OpenVisus
    mkdir build
    cd build

    cmake -DPython_EXECUTABLE=$(which python3) -DQt5_DIR=~/Qt/5.15.2/gcc_64/lib/cmake -DVISUS_GUI=1 _DVISUS_MODVISUS=0 ../
    cmake --build ./ --target all     --config Release -j 16 
    cmake --build ./ --target install --config Release

# Configure for OpenVisus
    PYTHONPATH=$(pwd)/Release python3 -m OpenVisus configure

# Run OpenVisus viewer - execute this command manually
    #PYTHONPATH=$(pwd)/Release python3 -m OpenVisus viewer #from the /home/kj/OpenVisus/build directory
    #or
    #PYTHONPATH=/home/kj/OpenVisus/build/Release python3 -m OpenVisus viewer #from anywhere
    #or
    #PYTHONPATH=~/OpenVisus/build/Release python3 -m OpenVisus viewer #from anywhere

# Set up the desktop launcher
    cd ~/
    sudo cp support/SCIRun_4.png /usr/share/icons
    cp support/Visus_Viewer.desktop ~/Desktop
    chmod +rwx ~/Desktop/Visus_Viewer.desktop
    cp support/launch_visus.sh ~/

