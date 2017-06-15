# Tips:   
    Looking for compile instructions?  Read the file "INSTALL.txt" instead...  
    哈～The tial of this file, recoder some trouble when i use cups.(FAQ)
# CUPS INTRODUCTION
  
    CUPS(CommonUnixPrinterSystem) is a standards-based, open source printing system developed by Apple
    Inc. for OS® X and other UNIX®-like operating systems.  CUPS uses the
    Internet Printing Protocol ("IPP") and provides System V and Berkeley
    command-line interfaces, a web interface, and a C API to manage printers and
    print jobs.  It supports printing to both local (parallel, serial, USB) and
    networked printers, and printers can be shared from one computer to another,
    even over the Internet!

    Internally, CUPS uses PostScript Printer Description ("PPD") files to
    describe printer capabilities and features and a wide variety of generic
    and device-specific programs to convert and print many types of files.
    Sample drivers are included with CUPS to support many Dymo, EPSON, HP,
    Intellitech, OKIDATA, and Zebra printers.  Many more drivers are available
    online and (in some cases) on the driver CD-ROM that came with your printer.

    CUPS is licensed under the GNU General Public License and GNU Library
    General Public License versions 2.  See the file "LICENSE.txt" for more
    information.


# READING THE DOCUMENTATION

    Once you have installed the software you can access the documentation (and
    a bunch of other stuff) online at:

	http://localhost:631/

    If you are having trouble getting that far, the documentation is located
    under the "doc/help" directory.

    Please read the documentation before asking questions.


# GETTING SUPPORT AND OTHER RESOURCES

    If you have problems, READ THE DOCUMENTATION FIRST!  We also provide many
    discussion forums which are available at:

	[http://www.cups.org/newsgroups.php](http://www.cups.org/newsgroups.php)

    See the CUPS web site at "http://www.cups.org/" for other resources.


# SETTING UP PRINTER QUEUES USING YOUR WEB BROWSER

    CUPS includes a web-based administration tool that allows you to manage
    printers, classes, and jobs on your server.  Open the following URL in your
    browser to access the printer administration tools:

	http://localhost:631/admin/

    DO NOT use the hostname for your machine - it will not work with the default
    CUPS configuration.  To enable administration access on other addresses,
    check the "Allow Remote Administration" box and click on the "Change
    Settings" button.

    You will be asked for the administration password (root or any other user in
    the sys/system/root/admin/lpadmin group on your system) when performing any
    administrative function.


# SETTING UP PRINTER QUEUES FROM THE COMMAND-LINE

    CUPS works best with PPD (PostScript Printer Description) files.  In a pinch
    you can also use System V style printer interface scripts.

    CUPS includes several sample PPD files you can use:

	Driver                         PPD Name
	-----------------------------  ------------------------------
	Dymo Label Printers            drv:///sample.drv/dymo.ppd
	Intellitech Intellibar         drv:///sample.drv/intelbar.ppd
	EPSON Stylus Color Series      drv:///sample.drv/stcolor.ppd
	EPSON Stylus Photo Series      drv:///sample.drv/stphoto.ppd
	EPSON Stylus New Color Series  drv:///sample.drv/stcolor2.ppd
	EPSON Stylus New Photo Series  drv:///sample.drv/stphoto2.ppd
	EPSON 9-pin Series             drv:///sample.drv/epson9.ppd
	EPSON 24-pin Series            drv:///sample.drv/epson24.ppd
	Generic PCL Laser Printer      drv:///sample.drv/generpcl.ppd
	Generic PostScript Printer     drv:///sample.drv/generic.ppd
	HP DeskJet Series              drv:///sample.drv/deskjet.ppd
	HP LaserJet Series             drv:///sample.drv/laserjet.ppd
	OKIDATA 9-Pin Series           drv:///sample.drv/okidata9.ppd
	OKIDATA 24-Pin Series          drv:///sample.drv/okidat24.ppd
	Zebra CPCL Label Printer       drv:///sample.drv/zebracpl.ppd
	Zebra EPL1 Label Printer       drv:///sample.drv/zebraep1.ppd
	Zebra EPL2 Label Printer       drv:///sample.drv/zebraep2.ppd
	Zebra ZPL Label Printer        drv:///sample.drv/zebra.ppd

    Run the "lpinfo -m" command to list the available drivers:

        lpinfo -m

    Run the "lpinfo -v" command to list the available printers:

        lpinfo -v

    Then use the correct URI to add the printer using the "lpadmin" command:

        lpadmin -p printername -E -v device-uri -m ppd-name

    Network printers typically use "socket" or "lpd" URIs:

        lpadmin -p printername -E -v socket://11.22.33.44 -m ppd-name
        lpadmin -p printername -E -v lpd://11.22.33.44/ -m ppd-name

    The sample drivers provide basic printing capabilities, but generally do not
    exercise the full potential of the printers or CUPS.  The CUPS web site
    provides links and drivers:

        http://www.cups.org/ppd.php      PPD files
	http://www.cups.org/links.php    Links to other drivers


# PRINTING FILES

    CUPS provides both the System V "lp" and Berkeley "lpr" commands for
    printing:

	lp filename
	lpr filename

    Both the "lp" and "lpr" commands support printing options for the driver:

	lp -o media=A4 -o resolution=600dpi filename
	lpr -o media=A4 -o resolution=600dpi filename

    CUPS recognizes many types of images files as well as PDF, PostScript,
    HP-GL/2, and text files, so you can print those files directly rather than
    through an application.

    If you have an application that generates output specifically for your
    printer then you need to use the "-oraw" or "-l" options:

	lp -o raw filename
	lpr -l filename

    This will prevent the filters from misinterpreting your print
    file.
# FAQ:
- cups是做啥的？  
        cups用来管理配置系统可以连接或者扫描到的打印机,并且可以作为一个server将所管理的打印机共享出去    
    从而供windos和unix系统访问.支持IPP，AppSOCKET，USB, LPD打印协议。    
- cups如何共享打印机    
    访问localhost:631，在administration的server栏勾选共享，并在添加打印机的时候勾选 shared this printer.    
- cups添加本地直连打印机.    
        以我的hp1106打印机为例。接上USB的hp1106打印机后，访问http://localhost:631,在添加界面就可以看    
    到改型号的打印机，一路狂点下去，选对对应型号的ppd，并且勾选共享。    
    或者使用lpadmin -p hp1106 -v "usb://xxxxx" -P xxx.ppd    
- 打印时报错：required plugin    
        hp1160型号的驱动ppd文件后面会显示required plugin，此时如果没有 plugin，则    
    添加后的打印机打印时会报错required plugin,并在打印状态栏显示STOP filter failed，    
    解决方法：运行hp-setup，添加改打印机，过程中会 自动补齐plugin）    
- 如何cups添加windows共享的打印机    
       NFS,是unix-like之间的共享，CIFS用于windows间的共享（如网络邻居），而SAMBA用于windows和unix-like间    
    共享文件和打印机。所以在确保samba服务的正常以及权限后，在添加打印机时选择Window via of samba。然后输入    
    共享的打印机连接，选择合适的驱动，需要共享的则勾选共享(共享后别的系统可以通过这台机子访问该打印机，而不必    
    去访问windos上)。    
    eg1. 连接市场销售部门的HP-M1530,     
        1.选择window via of samba。     
        2.再uri处要填写正确，特比注意用户权限以及路径空格问题
        smb://usrname:passowrd@Ipaddress/PRINTER-VENDOR ,勾选共享。    
        3.没找到对应的驱动，也懒得下载，于是就使用2727驱动，竟然可以诶。哈哈。    
    command line:     
    smbcilent -L 192.168.0.9 //用来搜寻改ip下的共享    
    lpadmin -p HP-MP1530 -v "smb:/usrname:passowrd@192.168.0.223/HP-LaserJet-M1530-MFP-Series-PCL-6" -E -P /usr/share/ppd/HP/hp-laserjet_m2727_mfp_series-ps.ppd.gz -o printer-is-shared=true
    tips： -E == cupsenable 和 cupsaccpte;没有-E 则打印机状态显示PAUSE    
- Session setup failed: NT_STATUS_LOGON_FAILURE    
    这个是samba连接中的usrname:password权限问题。使用合适的usrname和password    
- Tree connect Failed NT_STATUS_ACCESS_DENIED    
    这个是samba连接中的路径写错了，或者共享打印机名字没输入对。（尽量避免空格)    
# 实例：
## 在我的192.168.0.9的fedrao系统上添加：
    windows的HP-M1530
    lpadmin -p HP-M1530 -v "smb:/usrname:passowrd@192.168.0.223/HP-LaserJet-M1530-MFP-Series-PCL-6" -E -P /usr/share/ppd/HP/hp-laserjet_m2727_mfp_series-ps.ppd.gz
     -o printer-is-shared=true
    添加直连的hp1106,因为plugin的问题，于是使用hp-setup来添加hp1106.
## 在192.168.0.135的开发板上，使用192.168.0.9共享出来的windows HP-M1530和linux hp1106打印机。
    lp -h 192.168.0.9:631 -p hp1106 xxx.ps
    lp -h 192.168.0.9:631 -p HP-M1530 xxx.ps
    好爽，可以直接通过192.168.0.9来直接使用局域网内的linux和windows打印机啦～～～～
