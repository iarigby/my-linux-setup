cd ~/my-linux-setup
xargs -I _ -ra <(cat .wget-list) update_teacher_website.sh _