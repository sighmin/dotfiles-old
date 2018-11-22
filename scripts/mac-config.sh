defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write com.apple.finder CreateDesktop false
killall Finder
echo "You need to restart for the changes to take effect"
