(
echo INSTALLDIR=C:\Java\JRE
echo WEB_JAVA=1
echo WEB_ANALYTICS=0
echo INSTALL_SILENT = 1
) > "configuration.cfg"
jre.exe INSTALLCFG="%cd%\configuration.cfg" /L "%cd%\jre-log.log" /s
