mkdir ~/.local/share/fonts
cd ~/.local/share/fonts
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
git sparse-checkout add patched-fonts
bash install.sh
cd ..
sudo rm -rf nerd-fonts

# Refresh the font cache
fc-cache -fv
