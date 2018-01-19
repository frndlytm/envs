$path = "c:\workspace\python\envs"
cd $path
$source = $path+"\requirements"
Get-ChildItem $source | ForEach-Object {
    # set-up the target
    $file = $_.name
    $name = $file.replace(".txt", "")
    $target = "$path\$name"
    
    # remove the target.
    Write-Host $target;
    Remove-Item -Recurse $target;
    
    # replace the target from requirements
    python -m virtualenv $name
    $activate = $target+"\Scripts\activate"
    iex $activate   
    pip install -r "$source\$file";
}
