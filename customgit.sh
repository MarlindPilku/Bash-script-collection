
echo -n "Name of file: "
read file
echo -n "Commit message: "
read msg

git add "$file"
git commit -m "$msg"
git branch -M "main"
git push origin main
