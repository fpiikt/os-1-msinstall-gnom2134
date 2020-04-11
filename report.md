### Отчет

Весь код для установки программ разбит на несколько скриптов - для каждой программы отдельно. Одновременно все может быть установленно с помощью скрипта ```install_all.bat```.

Все установщики программ имели расширение ```.msi```(кроме Paint.net и JRE которые exe-шники). Для красоты и краткости установщик программы был переименован в более короткую версию.

Собственно код для установки:

        # устанавливаем 7z
        msiexec /i 7z.msi /le "7zip-log.txt" /passive /norestart TARGETDIR="C:\Program Files\7-Zip"
        # устанавливаем Paint.net
        msiexec paint.net.exe /auto TARGETDIR="C:\Program Files\Graphics\Paint" DESKTOPSHORTCUT=1
        # устанавливаем inkscape
        msiexec /i inkscape.msi /le "inkscape-log.txt" /qr /norestart TARGETDIR="C:\Program Files\Graphics\Inkscape"
        # устанавливаем libreOffice с пакетом для русского языка 
        msiexec /i LibreOffice.msi /le "libreoffice-install-log.txt"  /passive /norestart
        msiexec /i LibreOffice_helppack_ru.msi /le+ "libreoffice-install-log.txt" /passive /forcerestart
        # устанавливаем Notepad++ 
        msiexec /i Notepad++.msi /quiet
        
        # создаем конфигурационный файл для установки jre
        (
        echo INSTALLDIR=C:\Java\JRE
        echo WEB_JAVA=1
        echo WEB_ANALYTICS=0
        echo INSTALL_SILENT = 1
        ) > "configuration.cfg"
        # собственно сама установка jre
        jre.exe INSTALLCFG="%cd%\configuration.cfg" /L "%cd%\jre-log.log" /s
        # удаляем за собой файл с конфигурацией
        rm -f "configuration.cfg"


