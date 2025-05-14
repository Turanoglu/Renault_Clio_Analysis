#!/bin/bash
repo_path="/c/Users/turan/ML_Calismalari/Clio"
default_commit_msg="Otomatik güncelleme: $(date '+%Y-%m-%d %H:%M:%S')"

cd "$repo_path" || { echo "Hedef dizin bulunamadı: $repo_path"; exit 1; }

if [[ -n $(git status --porcelain) ]]; then
	echo "Değişikliklere rastlandı."

	git add .
	
	echo "Commit mesajı girin: "
	read commit_msg
	commit_message=${commit_msg:-$default_commit_msg}
	
	git commit -m "$commit_message"

	git push origin master


	echo "Değişiklikler Github'a gönderildi."
else
	echo "Herhangi bir değişiklik bulunamadı."

fi


