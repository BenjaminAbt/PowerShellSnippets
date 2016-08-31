[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

function ConvertTo-Png
{
    [cmdletbinding()]
    param([Parameter(Mandatory=$true, ValueFromPipeline = $true)] $Path)

    process{
        if ($Path -is [string])
        { $Path = get-childitem $Path }

        $Path | foreach {
            $image = [System.Drawing.Image]::FromFile($($_.FullName))
            $FilePath =  "{0}\{1}.jpg" -f $($_.DirectoryName), $($_.BaseName)
            $image.Save($FilePath, [System.Drawing.Imaging.ImageFormat]::Png)
            $image.Dispose()
        }
    }

 }

 Get-ChildItem *.jpeg | ConvertTo-Png
