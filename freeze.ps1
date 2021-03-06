$path = "C:\workspace\python\envs"
cd $path
Get-ChildItem -Exclude requirements,*.ps1,*.md,.gitignore | ForEach-Object {
    Write-Host $_.fullname
    $target = $path+"/requirements/"+$_.name+".txt"
    cd $_.fullname
    .\scripts\activate
    python -m pip freeze > $target
    deactivate
}
cd $path