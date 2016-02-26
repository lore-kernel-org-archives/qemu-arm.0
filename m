Received: by 10.25.208.211 with SMTP id h202csp3470204lfg;
        Fri, 26 Feb 2016 09:23:54 -0800 (PST)
X-Received: by 10.141.1.2 with SMTP id c2mr3672089qhd.32.1456507434730;
        Fri, 26 Feb 2016 09:23:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x64si14003707qhx.22.2016.02.26.09.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 09:23:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:51307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZM7O-0005vt-27
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 12:23:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZM7K-0005vj-JU
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 12:23:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZM7G-0007hj-Gn
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 12:23:50 -0500
Received: from mail-by2on0106.outbound.protection.outlook.com
	([207.46.100.106]:36864
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aZM7F-0007h3-UU; Fri, 26 Feb 2016 12:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7DDrYNCnAcCFU/6ocPJ2xhkNGDL+kbEApgWiHY6pIok=;
	b=MpG3pv7UPz8tFOhJJRNX8fAJpZYvYBKzoBSYwZPLhVsb5FK4Ex4bMoPNFsbh5KdVk9xjJWoE3Wq0khm1MwDVk9Dh7Jv4eKgfNYECA9Ux8CO9yjVTzbVKpLRcNf24YZHAe6pGmu6VrRqw26tVoMYvWLDtLwx4U4zhSvDA6dtPpZE=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2035.namprd03.prod.outlook.com (10.164.22.25) with Microsoft
	SMTP Server (TLS) id 15.1.409.15; Fri, 26 Feb 2016 17:23:43 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0409.024; Fri, 26 Feb 2016 17:23:43 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: John Snow <jsnow@redhat.com>, Mats Malmberg <mats.malmberg@tritech.se>,
	Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [Qemu-arm] help on how to emulate rasbperry pi 2
Thread-Index: AQHRbyuhTtcp6DFdR0aZb1Ld0rYnj587fCNggAAHpQCAAAYYoIACiHMAgACBTYCAAAGGAA==
Date: Fri, 26 Feb 2016 17:23:42 +0000
Message-ID: <BLUPR0301MB20345BC8FEA7B3A86AB1926B9EA70@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <605392182193B84A99A143D9DA347B52FB8AA7@post>
	<CAFEAcA9xvDiHAc6Tu-PLbjd=RruX1c+vpfZg+ZvtH5t3DSyUOw@mail.gmail.com>
	<BLUPR0301MB2034905DFE5B0135A1BE897A9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<56CDF624.6050104@redhat.com>
	<BLUPR0301MB2034F3C40B01A1A3536A837C9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<605392182193B84A99A143D9DA347B52FB8B57@post>
	<56D087AD.3040001@redhat.com>
In-Reply-To: <56D087AD.3040001@redhat.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none; redhat.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:a::724]
x-ms-office365-filtering-correlation-id: 4902de99-df46-4088-c5a5-08d33ed1937e
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2035;
	5:2NwMld7E9MnMW4XUT6V8A5guAFLOGF9GogzYcLe+rO2c0Pb6uyDASkBQySgqufN6ey71qUzy01qOCUqIRw8Vbijj8g88zIAdiAlZl++bPpmjR9vqDdU/ZJsTDfYtjMnyH7Nww5mCGbnux6pvQKLFDA==;
	24:mTc8h04VygiKMO4szZX0np12cv3R4gdZKr3B+xtmRw0koDoVrDbSLobbkMTIF84IAyDldAoEvAkL5Q3NsrmVAlYgpjgKCPcKkR2QfsZWj20=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2035;
x-microsoft-antispam-prvs: <BLUPR0301MB20354F65C1583AB9CE51F6D59EA70@BLUPR0301MB2035.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2035; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2035; 
x-forefront-prvs: 0864A36BBF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(51444003)(377454003)(479174004)(40764003)(24454002)(40100003)(87936001)(76576001)(122556002)(93886004)(10090500001)(106116001)(50986999)(575784001)(54356999)(189998001)(86362001)(76176999)(3660700001)(99286002)(8990500004)(3280700002)(5005710100001)(10400500002)(5004730100002)(5008740100001)(102836003)(6116002)(345774005)(92566002)(33656002)(586003)(1220700001)(1096002)(10290500002)(74316001)(15975445007)(4326007)(5001960100002)(5003600100002)(19580405001)(11100500001)(77096005)(2950100001)(2900100001)(5002640100001)(2906002)(19580395003)(5001770100001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2035;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2016 17:23:42.9892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2035
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.106
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
X-TUID: m8ykIzoCGj+J

> From: John Snow [mailto:jsnow@redhat.com]
> Sent: Friday, 26 February 2016 9:13 AM
>=20
> On 02/26/2016 04:30 AM, Mats Malmberg wrote:
> > Hello, thank you for your quick response!
> >
> > It helped me to get a little bit further, but unfortunately the problem
> persists.
> > I now get some output from the kernel startup, but I think that it is u=
nable
> to find the provided sd-card image.
> >
> > Here's what I've tried (the most successful setup):
> > 1. download and deflate jessie/jessie-lite image (I tried both distros)
> > 2. mount the boot partition and copy the following files to host:
> kernel7.img, kernel.img and bcm2709-rpi-2-b.dtb
> > 3. mount the rootfs partition. Open the file /etc/ld.so.preload and
> comment out the line /usr/lib/arm-linux-gnueabihf/libarmmem.so (which is
> the only line present in the file.)
> > 4. execute the command
> > qemu-system-arm -M raspi2  -kernel kernel7.img -sd 2016-02-09-raspbian-
> jessie.img -append "rw earlyprintk loglevel=3D8 console=3DttyAMA0,115200
> dwc_otg.lpm_enable=3D0 root=3D/dev/mmcblk0p2" -dtb bcm2709-rpi-2-b.dtb -
> serial stdio
> >
> > the resulting terminal printout :
> >
> > WARNING: Image format was not specified for '2016-02-09-raspbian-
> jessie.img' and probing guessed raw.
> >          Automatically detecting the format is dangerous for raw images=
, write
> operations on block 0 will be restricted.
> >          Specify the 'raw' format explicitly to remove the restrictions=
.
> > Warning: Orphaned drive without device: id=3Dsd0,file=3D2016-02-09-rasp=
bian-
> jessie.img,if=3Dsd,bus=3D0,unit=3D0
> > VNC server running on '127.0.0.1;5900'
> > Uncompressing Linux... done, booting the kernel.
> > ...
> > lots of kernel output
> > ...
> > [    6.306894] sdhci-pltfm: SDHCI platform and OF driver helper
> > [    6.335521] ledtrig-cpu: registered to indicate activity on CPUs
> > [    6.338465] hidraw: raw HID events driver (C) Jiri Kosina
> > [    6.341004] usbcore: registered new interface driver usbhid
> > [    6.341768] usbhid: USB HID core driver
> > [    6.346873] Initializing XFRM netlink socket
> > [    6.348012] NET: Registered protocol family 17
> > [    6.350974] Key type dns_resolver registered
> > [    6.352810] Registering SWP/SWPB emulation handler
> > [    6.360245] registered taskstats version 1
> > [    6.374999] vc-sm: Videocore shared memory driver
> > [    6.397370] uart-pl011 3f201000.uart: no DMA platform data
> > [    6.428165] VFS: Cannot open root device "mmcblk0p2" or unknown-
> block(0,0): error -6
> > [    6.429208] Please append a correct "root=3D" boot option; here are =
the
> available partitions:
> > [    6.430848] 0100            4096 ram0  (driver?)
> > [    6.431718] 0101            4096 ram1  (driver?)
> > [    6.432348] 0102            4096 ram2  (driver?)
> > [    6.433101] 0103            4096 ram3  (driver?)
> > [    6.434627] 0104            4096 ram4  (driver?)
> > [    6.435317] 0105            4096 ram5  (driver?)
> > [    6.435995] 0106            4096 ram6  (driver?)
> > [    6.436749] 0107            4096 ram7  (driver?)
> > [    6.437507] 0108            4096 ram8  (driver?)
> > [    6.438159] 0109            4096 ram9  (driver?)
> > [    6.438853] 010a            4096 ram10  (driver?)
> > [    6.439562] 010b            4096 ram11  (driver?)
> > [    6.440193] 010c            4096 ram12  (driver?)
> > [    6.440815] 010d            4096 ram13  (driver?)
> > [    6.441439] 010e            4096 ram14  (driver?)
> > [    6.442065] 010f            4096 ram15  (driver?)
> > [    6.443003] Kernel panic - not syncing: VFS: Unable to mount root fs=
 on
> unknown-block(0,0)
> > [    6.444949] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.1.17-v7+ #83=
8
> > [    6.445837] Hardware name: BCM2709
> > [    6.448200] [<800180c0>] (unwind_backtrace) from [<80013b88>]
> (show_stack+0x20/0x24)
> > [    6.449477] [<80013b88>] (show_stack) from [<80555028>]
> (dump_stack+0x80/0x98)
> > [    6.450490] [<80555028>] (dump_stack) from [<80551540>]
> (panic+0xa4/0x204)
> > [    6.451641] [<80551540>] (panic) from [<80777384>]
> (mount_block_root+0x1a8/0x260)
> > [    6.452802] [<80777384>] (mount_block_root) from [<80777614>]
> (mount_root+0xec/0x110)
> > [    6.453878] [<80777614>] (mount_root) from [<807777a0>]
> (prepare_namespace+0x168/0x1c8)
> > [    6.454982] [<807777a0>] (prepare_namespace) from [<80776f90>]
> (kernel_init_freeable+0x270/0x2bc)
> > [    6.456243] [<80776f90>] (kernel_init_freeable) from [<80550968>]
> (kernel_init+0x18/0xfc)
> > [    6.457378] [<80550968>] (kernel_init) from [<8000f858>]
> (ret_from_fork+0x14/0x3c)
> > [    6.459706] ---[ end Kernel panic - not syncing: VFS: Unable to moun=
t root
> fs on unknown-block(0,0)
> >
> > I know that in some of my previous attempts (before I contacted you
> guys), I was able to get similar result. At that time an mmcblk device wa=
s
> listed among the available partitions, but the kernel was unable to mount=
 it.
> >
> > I'm having problem to identify the cause (since as I mentioned earlier =
this is
> not really my domain).
> > I've also tried (without any positive results)
> > - mark the boot partition as bootable with fdisk (does not seem to make
> any difference)
> > - use kernel.img instead of kernel7.img (does not provide any kernel
> printout, but still says that it has an orphaned drive and hangs indefine=
tly
> after saying VNC server running)
> > - create a image with 'qemu-img create raw jessie.img 4G' and use dd to
> copy original image into jessie.img file, and the provide qemu with
> format=3Draw.
> > - make the above qemu-system-arm invocation with -hda 2016-02-09-
> raspbian-jessie.img instead of -sd
> > - make the above qemu-system-arm invocation with -drive file=3D2016-02-
> 09-raspbian-jessie.img,format=3Draw,if=3Dsd instead of -sd
> >
> >
> > Do you have any suggestions on how to proceed with my troubleshooting?
> > Are you able to explain what seems to be the problem (and possible
> cause)?
> >
> > Thank you for your help, really appreciated!
> >
> > Best regards
> > Mats
> >
>=20
> Andrew, you might want to update the examples on that wiki: it looks
> like with recent changes that "-sd" was temporarily insufficient for
> getting a proper instance running.
>=20
> Maybe you should also add some examples that use the -drive/-device
> combo that we canonically support in addition to the sugared -sd/-hda.
>
> Mats: for now, try grabbing the latest qemu master, it fixed a bug with
> -sd. :)

Yes, John's right, please try now and this bug should be fixed.

There was a regression in qemu-master for about a week, fixed by:
https://lists.nongnu.org/archive/html/qemu-devel/2016-02/msg05733.html

John, AFAIK there was no way to have working SD without this patch (the cod=
e to hook up the block device didn't exist), so I don't think there's much =
point updating the wiki.

Cheers,
Andrew
