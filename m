Received: by 10.182.158.201 with SMTP id ww9csp1198979obb;
        Tue, 17 Nov 2015 23:51:44 -0800 (PST)
X-Received: by 10.129.33.11 with SMTP id h11mr117194ywh.119.1447833104121;
        Tue, 17 Nov 2015 23:51:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g65si1602990ywa.294.2015.11.17.23.51.43
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 23:51:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyxWp-00049n-LY
	for alex.bennee@linaro.org; Wed, 18 Nov 2015 02:51:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZyxWX-0003iz-Nm
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 02:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZyxWV-000788-T3
	for qemu-arm@nongnu.org; Wed, 18 Nov 2015 02:51:25 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:33216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZyxWS-000760-1P; Wed, 18 Nov 2015 02:51:20 -0500
Received: by wmec201 with SMTP id c201so264660388wme.0;
	Tue, 17 Nov 2015 23:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ZVlSkFk6i69hoVmxYlObgb77RCSQ3JjkKtUcyF0xi30=;
	b=dZqe47lN/z18hijBJs7Lbco9owHWPNeI49A5xHXJphft26xaIdYRPpkaExpXQvPfi5
	GUCmT+InHNy2Uo3YyOnTgOwxsgk8ECZdfv9muOXVq1EZKL/1ZZzu2SoEFM3JsfvJ/PHG
	j9r0dEguC3Hft4QcX7dgd2+ER+4n1dV9Llqlt4wXMeFTrIrfndCdLJhI6TExSV+hqHLh
	Etm5tn7jbyU9MTdF+6Y7HdUggiILT/rQt9GLw9XwH1qRMpgo41sj26L0zArVu25uH1qm
	Dyy9wAqRPANAe8aS5xiuMLrKIq3Zb74z9YDCgejCsSLK4+2Eb7zkh/YYxVFNtWZe/c+V
	yqeQ==
MIME-Version: 1.0
X-Received: by 10.28.158.198 with SMTP id h189mr7095026wme.15.1447833079146;
	Tue, 17 Nov 2015 23:51:19 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Tue, 17 Nov 2015 23:51:19 -0800 (PST)
In-Reply-To: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Tue, 17 Nov 2015 23:51:19 -0800
Message-ID: <CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22c
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?UTF-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] RFC: raspberry pi / pi2 /
	Windows-on-ARM support
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
X-TUID: SRMDZ0TsWU+s

On Mon, Nov 16, 2015 at 2:22 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Hi all,
>
> I have been working on Raspberry Pi 2 emulation, building on the previous=
 work of Gregory Estrade, Stefan Weil and others on the original Raspberry =
Pi target. My current working tree (based off a recent master) is here:
>     https://github.com/0xabu/qemu/tree/raspi
>
> The present status is:
>  * The original Raspberry Pi (-M raspi) support works only with older ker=
nels from Raspbian releases up to 2014-09-09, for unknown reasons that I ha=
ven't investigated. [1]
>  * Pi 2 (-M raspi2) supports both Raspbian and Windows.
>  * Raspbian boots on pi2, but fails on an implemented SETEND instruction =
in early userspace. I'm told there are patches/workarounds for this floatin=
g around, but have not tried them.
>  * The Windows IoT image [2] boots completely, but the USB emulation is b=
roken, so the only IO devices are framebuffer and serial console (which can=
 be used for a kernel debugger).
>  * All four Pi2 cores must be enabled for Windows, since the bootloader p=
anics if the expected cores are not present. Conversely, Raspbian fails to =
boot if multiple cores are enabled, but I haven't debugged this, since qemu=
 is faster with a single-core guest.
>
> I realise that getting this code integrated will require a series of smal=
ler patches, but wanted to solicit any early feedback before I start doing =
that. I've verified that checkpatch.pl is happy, but if there are other sty=
listic or general problems with the code it would be helpful to know about =
them sooner rather than later :) If anyone has specific suggestions for how=
 to split up the patch, that would also be welcome. If not, I will start su=
bmitting patches for the individual pieces, probably starting with the mach=
ine definition and then the larger devices, followed by the Windows-specifi=
c fixes described below.
>

For splitting, there are some good examples in any of the recent ARM
SoC+Board bringups. The most recent full bringup from scratch would
probably be the STM/Netduino board. Myself and Jean-Christophe added
Xilinx ZynqMP and i.MX25 respectively, although in both those works we
used existing peripheral IP (with patches) rather than fresh.

https://lists.nongnu.org/archive/html/qemu-devel/2015-02/msg03398.html
https://lists.nongnu.org/archive/html/qemu-devel/2015-08/msg01194.html
https://lists.nongnu.org/archive/html/qemu-devel/2015-03/msg04683.html

I haven't looked beyond the diffstat yet, but a top level
architectural comment, I only see the one file in hw/arm. We are
promoting the split of board and SoC now as two separate objects. Each
of the patch series linked above demonstrates this. The BCM SoC would
be an object in its own right, then the board instantiates the SoC as
a composite device.

> There are also a couple of significant (non Pi-specific) changes that I m=
ade in order to boot a Windows on ARM guest, which also I plan to submit:
> 1. UEFI (TianoCore / EDK2) has a couple of bugs in its MMC support -- it =
assumes support for CMD23 (set multiple block count, which is supposed to b=
e optional), and also fails to initialise correctly if the card is ready im=
mediately upon issuing ACMD41. My tree includes workarounds for both issues=
 -- I implemented CMD23, and modelled a small delay when initialising the S=
D card.
> 2. For better or worse, Windows relies on taking alignment faults on a mi=
saligned LDREX, however qemu doesn't perform any alignment checks, leading =
to a bluescreen very early in boot. The changes in target-arm implement a g=
eneric infrastructure for testing/raising alignment exceptions, and add a s=
uitable check to LDREX. (This is almost certainly applicable to arm64 as we=
ll, but I don't have a means to test it.)
>

I would send that as a single, and you would be able to do that
without any thing else as prerequisite.

> Here's the current diffstat (ignore the minor unrelated bugfixes in lan91=
18 and tap-win32):
>  default-configs/arm-softmmu.mak      |    1 +
>  hw/arm/Makefile.objs                 |    1 +
>  hw/arm/raspi.c                       |  514 ++++++++++++++++
>  hw/char/Makefile.objs                |    1 +
>  hw/char/bcm2835_aux.c                |  250 ++++++++
>  hw/display/Makefile.objs             |    1 +
>  hw/display/bcm2835_fb.c              |  384 ++++++++++++
>  hw/dma/Makefile.objs                 |    1 +
>  hw/dma/bcm2835_dma.c                 |  352 +++++++++++

New devices should have the state struct in a header file, the
referenced work gives an example on this.

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
>  hw/sd/bcm2835_emmc.c                 |  844 +++++++++++++++++++++++++++
>  hw/sd/sd.c                           |   78 ++-
>  hw/timer/Makefile.objs               |    2 +
>  hw/timer/arm_timer.c                 |   39 ++
>  hw/timer/bcm2835_st.c                |  201 +++++++
>  hw/timer/bcm2835_timer.c             |  242 ++++++++
>  hw/usb/Makefile.objs                 |    2 +
>  hw/usb/bcm2835_usb.c                 |  655 +++++++++++++++++++++
>  hw/usb/bcm2835_usb_regs.h            | 1061 ++++++++++++++++++++++++++++=
++++++
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

It is big. Work of this magnitude is generally better managed as
multiple series (each of multiple patches). A general approach with
new ARM boards is the first series is the bare minimum needed to get a
linux boot over the UART console. This usually means any CPU
customisations, timer, UART, intc, SoC and boards, maybe the
system/power controllers (if the kernel touches them in boot) and
optionally network or emmc. With network you can do an NFS root (this
was the only option on Allwinner/cubieboard for quite some time) and
with emmc you can do your root=3D/dev/mmcblk0p2 style boot as normal. If
you are using existing lan9118, network first might be a clear win,
although emmc is more realistic. Can always do both.

The you can follow up with the USB, DMA, AUX, ... each independently
or as a follow up series'.

Any core code and ARM CPU work that is a bugfix or stands in its own
right, you should send straight up as a separate work.

>
> The command line I've used for Raspbian is:
> qemu-system-arm -M raspi2 -m 1024 -kernel kernel7.img -sd 2015-09-24-rasp=
bian-jessie.img -append "rw earlyprintk loglevel=3D8 bcm2708_fb.fbwidth=3D1=
024 bcm2708_fb.fbheight=3D768 bcm2708.boardrev=3D0xf bcm2708.serial=3D0xcad=
0eedf vc_mem.mem_base=3D0x1c000000 vc_mem.mem_size=3D0x20000000 dwc_otg.lpm=
_enable=3D0 root=3D/dev/mmcblk0p2"
>

Curious, does rPi kernel support device tree boot? This would be nice
for testing with a generic kernel.

Regards,
Peter

> The command line for Windows is:
> qemu-system-arm -M raspi2 -smp 4 -m 1024 -bios kernel.img -sd th2preview_=
pi2_iot.vhd
> (where kernel.img is the EDK2 bootloader from the first partition of the =
Windows image).
>
> Cheers,
> Andrew
>
> [1] https://www.raspberrypi.org/forums/viewtopic.php?f=3D72&t=3D26561&sta=
rt=3D125
> [2] http://ms-iot.github.io/content/en-US/Downloads.htm
>
