#! /bin/bash
echo "creating dir"
sudo mkdir /home/chronos/user/Downloads/musescoretmp/
cd home/chronos/user/Downloads/musescoretmp/
echo "downloading"
wget https://github.com/musescore/MuseScore/releases/download/v4.1.0/MuseScore-4.1.0.231921359-x86_64.AppImage
echo "unpacking"
7z x MuseScore-4.1.0.231921359-x86_64.AppImage
echo "coping files"
sudo cp -r * /usr/local
echo "remove some file"
sudo rm -rf /usr/local/MuseScore-4.1.0.231921359-x86_64.AppImage /usr/local/AppRun /usr/local/install_manifest.txt /usr/local/AppRun
echo "install fallback libs "
sudo cp /usr/local/fallback/* /usr/local/lib
sudo rm -rf /usr/local/fallback
echo "install plugins"
sudo cp -rf /usr/local/plugins/*/*.so /usr/local/lib
sudo rm -rf /usr/local/plugins
echo "installing qt"
sudo cp -rf /usr/local/qml /usr/local/share/Qt-5/
sudo rm -rf /usr/local/qml
echo "insalling apps"
sudo chmod a+x /usr/local/bin/*
echo "cleanup"
sudo rm -rf home/chronos/user/Downloads/musescoretmp/
echo "adding app to launcher"
yes | crew install crew-launcher
crew-launcher add /usr/local/share/application/org.musescore.MuseScore4portable.desktop

