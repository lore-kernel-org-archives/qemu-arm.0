Received: by 10.182.158.201 with SMTP id ww9csp527745obb;
        Mon, 16 Nov 2015 22:02:14 -0800 (PST)
X-Received: by 10.31.11.16 with SMTP id 16mr1803089vkl.28.1447740134921;
        Mon, 16 Nov 2015 22:02:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l81si1521995vke.123.2015.11.16.22.02.14
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 22:02:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyZLK-0000qN-Kb
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 01:02:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZyZL0-0000V9-FS
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 01:01:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZyZKz-0007Ul-5X
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 01:01:54 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:49154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZyZKs-0007TM-MH; Tue, 17 Nov 2015 01:01:46 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2AA5C11810A9; Tue, 17 Nov 2015 07:01:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 2jntURNXLTdA; Tue, 17 Nov 2015 07:01:38 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC84C1.dip0.t-ipconnect.de
	[84.172.132.193])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	6CAC311810A3; Tue, 17 Nov 2015 07:01:38 +0100 (CET)
Message-ID: <564AC2C2.5040708@weilnetz.de>
Date: Tue, 17 Nov 2015 07:01:38 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
In-Reply-To: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?ISO-8859-2?Q?Jan_Petrou=B9?= <jan.petrous@tieto.com>,
	=?ISO-8859-2?Q?Gr=E9gory?= =?ISO-8859-2?Q?_ESTRADE?=
	<gregory.estrade@gmail.com>
Subject: Re: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /TLJVnZls98e

Am 16.11.2015 um 23:22 schrieb Andrew Baumann:
> Hi all,
>=20
> I have been working on Raspberry Pi 2 emulation, building on the previo=
us work of Gregory Estrade, Stefan Weil and others on the original Raspbe=
rry Pi target. My current working tree (based off a recent master) is her=
e:
>     https://github.com/0xabu/qemu/tree/raspi
>=20
> The present status is:
>  * The original Raspberry Pi (-M raspi) support works only with older k=
ernels from Raspbian releases up to 2014-09-09, for unknown reasons that =
I haven't investigated. [1]
>  * Pi 2 (-M raspi2) supports both Raspbian and Windows.
>  * Raspbian boots on pi2, but fails on an implemented SETEND instructio=
n in early userspace. I'm told there are patches/workarounds for this flo=
ating around, but have not tried them.
>  * The Windows IoT image [2] boots completely, but the USB emulation is=
 broken, so the only IO devices are framebuffer and serial console (which=
 can be used for a kernel debugger).
>  * All four Pi2 cores must be enabled for Windows, since the bootloader=
 panics if the expected cores are not present. Conversely, Raspbian fails=
 to boot if multiple cores are enabled, but I haven't debugged this, sinc=
e qemu is faster with a single-core guest.
>=20
> I realise that getting this code integrated will require a series of sm=
aller patches, but wanted to solicit any early feedback before I start do=
ing that. I've verified that checkpatch.pl is happy, but if there are oth=
er stylistic or general problems with the code it would be helpful to kno=
w about them sooner rather than later :) If anyone has specific suggestio=
ns for how to split up the patch, that would also be welcome. If not, I w=
ill start submitting patches for the individual pieces, probably starting=
 with the machine definition and then the larger devices, followed by the=
 Windows-specific fixes described below.
>=20
> There are also a couple of significant (non Pi-specific) changes that I=
 made in order to boot a Windows on ARM guest, which also I plan to submi=
t:
> 1. UEFI (TianoCore / EDK2) has a couple of bugs in its MMC support -- i=
t assumes support for CMD23 (set multiple block count, which is supposed =
to be optional), and also fails to initialise correctly if the card is re=
ady immediately upon issuing ACMD41. My tree includes workarounds for bot=
h issues -- I implemented CMD23, and modelled a small delay when initiali=
sing the SD card.
> 2. For better or worse, Windows relies on taking alignment faults on a =
misaligned LDREX, however qemu doesn't perform any alignment checks, lead=
ing to a bluescreen very early in boot. The changes in target-arm impleme=
nt a generic infrastructure for testing/raising alignment exceptions, and=
 add a suitable check to LDREX. (This is almost certainly applicable to a=
rm64 as well, but I don't have a means to test it.)
>=20
> Here's the current diffstat (ignore the minor unrelated bugfixes in lan=
9118 and tap-win32):
>  default-configs/arm-softmmu.mak      |    1 +
>  hw/arm/Makefile.objs                 |    1 +
>  hw/arm/raspi.c                       |  514 ++++++++++++++++
>  hw/char/Makefile.objs                |    1 +
>  hw/char/bcm2835_aux.c                |  250 ++++++++
>  hw/display/Makefile.objs             |    1 +
>  hw/display/bcm2835_fb.c              |  384 ++++++++++++
>  hw/dma/Makefile.objs                 |    1 +
>  hw/dma/bcm2835_dma.c                 |  352 +++++++++++
>  hw/intc/Makefile.objs                |    1 +
>  hw/intc/bcm2835_ic.c                 |  248 ++++++++
>  hw/intc/bcm2836_control.c            |  373 ++++++++++++
>  hw/misc/Makefile.objs                |    5 +
>  hw/misc/bcm2835_mphi.c               |  176 ++++++
>  hw/misc/bcm2835_power.c              |  113 ++++
>  hw/misc/bcm2835_property.c           |  409 +++++++++++++
>  hw/misc/bcm2835_sbm.c                |  294 ++++++++++
>  hw/misc/bcm2835_vchiq.c              |  113 ++++
>  hw/net/lan9118.c                     |   18 +-
>  hw/sd/Makefile.objs                  |    1 +
>  hw/sd/bcm2835_emmc.c                 |  844 ++++++++++++++++++++++++++=
+
>  hw/sd/sd.c                           |   78 ++-
>  hw/timer/Makefile.objs               |    2 +
>  hw/timer/arm_timer.c                 |   39 ++
>  hw/timer/bcm2835_st.c                |  201 +++++++
>  hw/timer/bcm2835_timer.c             |  242 ++++++++
>  hw/usb/Makefile.objs                 |    2 +
>  hw/usb/bcm2835_usb.c                 |  655 +++++++++++++++++++++
>  hw/usb/bcm2835_usb_regs.h            | 1061 ++++++++++++++++++++++++++=
++++++++
>  include/hw/arm/bcm2835_arm_control.h |  481 +++++++++++++++
>  include/hw/arm/bcm2835_common.h      |   35 ++
>  include/hw/arm/raspi_platform.h      |  155 +++++
>  net/tap-win32.c                      |   51 +-
>  target-arm/helper.c                  |    8 +
>  target-arm/helper.h                  |    1 +
>  target-arm/internals.h               |    3 +
>  target-arm/op_helper.c               |   21 +
>  target-arm/translate.c               |   29 +
>  38 files changed, 7141 insertions(+), 23 deletions(-)
>=20
> The command line I've used for Raspbian is:
> qemu-system-arm -M raspi2 -m 1024 -kernel kernel7.img -sd 2015-09-24-ra=
spbian-jessie.img -append "rw earlyprintk loglevel=3D8 bcm2708_fb.fbwidth=
=3D1024 bcm2708_fb.fbheight=3D768 bcm2708.boardrev=3D0xf bcm2708.serial=3D=
0xcad0eedf vc_mem.mem_base=3D0x1c000000 vc_mem.mem_size=3D0x20000000 dwc_=
otg.lpm_enable=3D0 root=3D/dev/mmcblk0p2"
>=20
> The command line for Windows is:
> qemu-system-arm -M raspi2 -smp 4 -m 1024 -bios kernel.img -sd th2previe=
w_pi2_iot.vhd
> (where kernel.img is the EDK2 bootloader from the first partition of th=
e Windows image).
>=20
> Cheers,
> Andrew
>=20
> [1] https://www.raspberrypi.org/forums/viewtopic.php?f=3D72&t=3D26561&s=
tart=3D125
> [2] http://ms-iot.github.io/content/en-US/Downloads.htm
>=20


Hi Andrew,

thanks for this great overview of your activities regarding QEMU with
Raspberry Pi 2 support.

The QEMU development is currently preparing the new version 2.5 (see
http://wiki.qemu.org/Planning/2.5, http://wiki.qemu.org/ChangeLog/2.5).
This should be finished until 2015-12-10 (maybe a little later).
New patches for RPi can be discussed earlier, but won't be applied
to Git master before version 2.5 is finished.

I wish you good luck and hope RPi will be available to all QEMU users
soon. This target should be added to http://wiki.qemu.org/Planning/2.6
(or will it be http://wiki.qemu.org/Planning/3.0?), so nobody forgets
it. :-)

Kind regards,
Stefan
