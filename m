Received: by 10.25.208.211 with SMTP id h202csp3257086lfg;
        Fri, 26 Feb 2016 01:31:07 -0800 (PST)
X-Received: by 10.140.161.198 with SMTP id h189mr653268qhh.24.1456479067589;
        Fri, 26 Feb 2016 01:31:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j106si12404180qge.40.2016.02.26.01.31.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 01:31:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZEjr-0000Wz-40
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 04:31:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mats.malmberg@tritech.se>) id 1aZEjm-0000Wh-5t
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 04:31:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mats.malmberg@tritech.se>) id 1aZEjh-0002Zl-IK
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 04:31:02 -0500
Received: from tritech.se ([46.59.120.190]:62413 helo=nic.tritech.se)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mats.malmberg@tritech.se>)
	id 1aZEja-0002Ll-GI; Fri, 26 Feb 2016 04:30:50 -0500
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by nic.tritech.se (8.14.4/8.14.4/Debian-4) with ESMTP id u1Q9UbEr016441;
	Fri, 26 Feb 2016 10:30:37 +0100
Received: from POST.tritech.se ([10.75.60.100]) by post ([10.75.60.100]) with
	mapi id 14.03.0279.002; Fri, 26 Feb 2016 10:30:31 +0100
From: Mats Malmberg <mats.malmberg@tritech.se>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>, John Snow
	<jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [Qemu-arm] help on how to emulate rasbperry pi 2
Thread-Index: AdFvD5ywZQzpz/W/SvS9NRf/arflfAAE5R+AAACSCIAAAM0wAAAA1PCAAFA0tvM=
Date: Fri, 26 Feb 2016 09:30:30 +0000
Message-ID: <605392182193B84A99A143D9DA347B52FB8B57@post>
References: <605392182193B84A99A143D9DA347B52FB8AA7@post>
	<CAFEAcA9xvDiHAc6Tu-PLbjd=RruX1c+vpfZg+ZvtH5t3DSyUOw@mail.gmail.com>
	<BLUPR0301MB2034905DFE5B0135A1BE897A9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<56CDF624.6050104@redhat.com>,
	<BLUPR0301MB2034F3C40B01A1A3536A837C9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
In-Reply-To: <BLUPR0301MB2034F3C40B01A1A3536A837C9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.220.60.189]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 46.59.120.190
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel]  help on how to emulate rasbperry pi 2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ONuVTXX0NCoN

Hello, thank you for your quick response!=0A=
=0A=
It helped me to get a little bit further, but unfortunately the problem per=
sists. =0A=
I now get some output from the kernel startup, but I think that it is unabl=
e to find the provided sd-card image.=0A=
=0A=
Here's what I've tried (the most successful setup):=0A=
1. download and deflate jessie/jessie-lite image (I tried both distros)=0A=
2. mount the boot partition and copy the following files to host: kernel7.i=
mg, kernel.img and bcm2709-rpi-2-b.dtb=0A=
3. mount the rootfs partition. Open the file /etc/ld.so.preload and comment=
 out the line /usr/lib/arm-linux-gnueabihf/libarmmem.so (which is the only =
line present in the file.)=0A=
4. execute the command =0A=
qemu-system-arm -M raspi2  -kernel kernel7.img -sd 2016-02-09-raspbian-jess=
ie.img -append "rw earlyprintk loglevel=3D8 console=3DttyAMA0,115200 dwc_ot=
g.lpm_enable=3D0 root=3D/dev/mmcblk0p2" -dtb bcm2709-rpi-2-b.dtb -serial st=
dio=0A=
=0A=
the resulting terminal printout : =0A=
=0A=
WARNING: Image format was not specified for '2016-02-09-raspbian-jessie.img=
' and probing guessed raw.=0A=
         Automatically detecting the format is dangerous for raw images, wr=
ite operations on block 0 will be restricted.=0A=
         Specify the 'raw' format explicitly to remove the restrictions.=0A=
Warning: Orphaned drive without device: id=3Dsd0,file=3D2016-02-09-raspbian=
-jessie.img,if=3Dsd,bus=3D0,unit=3D0=0A=
VNC server running on '127.0.0.1;5900'=0A=
Uncompressing Linux... done, booting the kernel.=0A=
...=0A=
lots of kernel output=0A=
...=0A=
[    6.306894] sdhci-pltfm: SDHCI platform and OF driver helper=0A=
[    6.335521] ledtrig-cpu: registered to indicate activity on CPUs=0A=
[    6.338465] hidraw: raw HID events driver (C) Jiri Kosina=0A=
[    6.341004] usbcore: registered new interface driver usbhid=0A=
[    6.341768] usbhid: USB HID core driver=0A=
[    6.346873] Initializing XFRM netlink socket=0A=
[    6.348012] NET: Registered protocol family 17=0A=
[    6.350974] Key type dns_resolver registered=0A=
[    6.352810] Registering SWP/SWPB emulation handler=0A=
[    6.360245] registered taskstats version 1=0A=
[    6.374999] vc-sm: Videocore shared memory driver=0A=
[    6.397370] uart-pl011 3f201000.uart: no DMA platform data=0A=
[    6.428165] VFS: Cannot open root device "mmcblk0p2" or unknown-block(0,=
0): error -6=0A=
[    6.429208] Please append a correct "root=3D" boot option; here are the =
available partitions:=0A=
[    6.430848] 0100            4096 ram0  (driver?)=0A=
[    6.431718] 0101            4096 ram1  (driver?)=0A=
[    6.432348] 0102            4096 ram2  (driver?)=0A=
[    6.433101] 0103            4096 ram3  (driver?)=0A=
[    6.434627] 0104            4096 ram4  (driver?)=0A=
[    6.435317] 0105            4096 ram5  (driver?)=0A=
[    6.435995] 0106            4096 ram6  (driver?)=0A=
[    6.436749] 0107            4096 ram7  (driver?)=0A=
[    6.437507] 0108            4096 ram8  (driver?)=0A=
[    6.438159] 0109            4096 ram9  (driver?)=0A=
[    6.438853] 010a            4096 ram10  (driver?)=0A=
[    6.439562] 010b            4096 ram11  (driver?)=0A=
[    6.440193] 010c            4096 ram12  (driver?)=0A=
[    6.440815] 010d            4096 ram13  (driver?)=0A=
[    6.441439] 010e            4096 ram14  (driver?)=0A=
[    6.442065] 010f            4096 ram15  (driver?)=0A=
[    6.443003] Kernel panic - not syncing: VFS: Unable to mount root fs on =
unknown-block(0,0)=0A=
[    6.444949] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1.17-v7+ #838=0A=
[    6.445837] Hardware name: BCM2709=0A=
[    6.448200] [<800180c0>] (unwind_backtrace) from [<80013b88>] (show_stac=
k+0x20/0x24)=0A=
[    6.449477] [<80013b88>] (show_stack) from [<80555028>] (dump_stack+0x80=
/0x98)=0A=
[    6.450490] [<80555028>] (dump_stack) from [<80551540>] (panic+0xa4/0x20=
4)=0A=
[    6.451641] [<80551540>] (panic) from [<80777384>] (mount_block_root+0x1=
a8/0x260)=0A=
[    6.452802] [<80777384>] (mount_block_root) from [<80777614>] (mount_roo=
t+0xec/0x110)=0A=
[    6.453878] [<80777614>] (mount_root) from [<807777a0>] (prepare_namespa=
ce+0x168/0x1c8)=0A=
[    6.454982] [<807777a0>] (prepare_namespace) from [<80776f90>] (kernel_i=
nit_freeable+0x270/0x2bc)=0A=
[    6.456243] [<80776f90>] (kernel_init_freeable) from [<80550968>] (kerne=
l_init+0x18/0xfc)=0A=
[    6.457378] [<80550968>] (kernel_init) from [<8000f858>] (ret_from_fork+=
0x14/0x3c)=0A=
[    6.459706] ---[ end Kernel panic - not syncing: VFS: Unable to mount ro=
ot fs on unknown-block(0,0)=0A=
=0A=
I know that in some of my previous attempts (before I contacted you guys), =
I was able to get similar result. At that time an mmcblk device was listed =
among the available partitions, but the kernel was unable to mount it.=0A=
=0A=
I'm having problem to identify the cause (since as I mentioned earlier this=
 is not really my domain).=0A=
I've also tried (without any positive results)=0A=
- mark the boot partition as bootable with fdisk (does not seem to make any=
 difference)=0A=
- use kernel.img instead of kernel7.img (does not provide any kernel printo=
ut, but still says that it has an orphaned drive and hangs indefinetly afte=
r saying VNC server running)=0A=
- create a image with 'qemu-img create raw jessie.img 4G' and use dd to cop=
y original image into jessie.img file, and the provide qemu with format=3Dr=
aw.=0A=
- make the above qemu-system-arm invocation with -hda 2016-02-09-raspbian-j=
essie.img instead of -sd=0A=
- make the above qemu-system-arm invocation with -drive file=3D2016-02-09-r=
aspbian-jessie.img,format=3Draw,if=3Dsd instead of -sd=0A=
=0A=
=0A=
Do you have any suggestions on how to proceed with my troubleshooting?=0A=
Are you able to explain what seems to be the problem (and possible cause)?=
=0A=
=0A=
Thank you for your help, really appreciated!=0A=
=0A=
Best regards=0A=
Mats=0A=
=0A=
=0A=
________________________________________=0A=
From: Andrew Baumann [Andrew.Baumann@microsoft.com]=0A=
Sent: Wednesday, February 24, 2016 7:51 PM=0A=
To: John Snow; Peter Maydell; Mats Malmberg=0A=
Cc: qemu-arm@nongnu.org; QEMU Developers=0A=
Subject: RE: [Qemu-devel] [Qemu-arm] help on how to emulate rasbperry pi 2=
=0A=
=0A=
> From: John Snow [mailto:jsnow@redhat.com]=0A=
> Sent: Wednesday, 24 February 2016 10:28 AM=0A=
> On 02/24/2016 01:04 PM, Andrew Baumann wrote:=0A=
> >> From: Peter Maydell [mailto:peter.maydell@linaro.org]=0A=
> >> Sent: Wednesday, 24 February 2016 9:49 AM=0A=
> >>=0A=
> >> On 24 February 2016 at 15:40, Mats Malmberg=0A=
> <mats.malmberg@tritech.se>=0A=
> >> wrote:=0A=
> >>>=0A=
> >>> Hello all!=0A=
> >>>=0A=
> >>> TL;DR : Is the raspi2 machine ready to use? If yes, how do I use it w=
ith=0A=
> >>> ordinary rpi distros? If not, what is the best way to emulate raspber=
ry=0A=
> >>> pi 2 via Qemu?=0A=
> >>=0A=
> >> Hi; I've cc'd the main qemu-devel list and Andrew Baumann who=0A=
> contributed=0A=
> >> the rpi2 support. I know there are still some missing pieces to be=0A=
> >> added later but I forget the details.=0A=
> >=0A=
> > There are still a number of missing pieces (including display and USB) =
which=0A=
> I hope to submit soon, but you should be able to boot Linux with a serial=
=0A=
> console. Brief instructions are at the end of this page:=0A=
> https://github.com/0xabu/qemu/wiki=0A=
> >=0A=
> > BTW, instead of -hda you need to pass -sd for the image file.=0A=
> >=0A=
> > Cheers,=0A=
> > Andrew=0A=
> >=0A=
>=0A=
> Is it worth changing the default interface for the "raspi2" board to be=
=0A=
> SD so that "-hda xxxxx" mounts an SD card?=0A=
>=0A=
> Or do we support using that for an imagined S/ATA interface? (BCM2836=0A=
> doesn't have SATA, right?)=0A=
=0A=
Oh, in fact I am already setting that, so perhaps -hda does already work. M=
ats' problem is most likely just that he's not seeing/enabling the serial c=
onsole.=0A=
=0A=
Andrew=0A=
