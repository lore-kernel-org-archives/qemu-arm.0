Received: by 10.25.15.197 with SMTP id 66csp1477666lfp;
        Mon, 26 Jun 2017 09:13:58 -0700 (PDT)
X-Received: by 10.55.20.95 with SMTP id e92mr1227633qkh.74.1498493638096;
        Mon, 26 Jun 2017 09:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498493638; cv=none;
        d=google.com; s=arc-20160816;
        b=KvUBRMfAiUB0u9LdXa/IBvMR5ex9mdJUDRFJoETGbIFKw8ViMD760nKRUTBJcIrGOS
         AK9kJISjDZYuwm00XMcRV+IjPne0BJS5x+8L40UJD6gj7gL2LRtRW6kc4vlgfZXUQcBT
         HmJCrUnRH0w3xLn7bpLurUp90jlkg9wK5K7Ta6or81yJYf8b5YN+XYPICQOU1nqi1xOH
         6ffoXmud13BtEtGfRn63AwrB1Y7Rbc1Ej1qNYDzDTPu363n5zJ2eOeqJ2U8MZkTIe5gc
         hh5lwKKjPq6NwWnzco561sr2m+eMaf0SZKJY4Aw1CUujJ8YNhpITz66Fo7ZqPISy5Ivr
         YNYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=C4RxOCIR11VN7aJoLIDZ4GOKTVNeF4hDcpvVtwdukIo=;
        b=IYXMZq0olJGvc6UbAfulYN5RZpey0ILFeflasg5RKFLWDN/hqTooWN31GfLZC7e/8q
         CoOWh+psXOFzIKEupXaw9S8BmFpiQIJ4awUl4K30zMgIglrAMwlarg0Q8ndUjX1LfUzG
         kA0ZTJHXTiUED05j6CYyPZJCFsu2QMTiZ4Wc3hn7Vyk9fCQLgA2ozYXeE/p+IMs1TjqI
         GulrBAyKeRaFFuauoCYepocPIWL55sIdSPEL9nldiO78GOo6n+JJR0KuG5NevAmARM5i
         m9bdxDLnDNAZNQb0ugTZ4YAR5cEISIGhR9l/ExAgBEYgcbmMlfhCJdhSoApcX/FsAP2z
         /CmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.b=C3E9JmkA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k16si391059qkk.171.2017.06.26.09.13.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Jun 2017 09:13:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.b=C3E9JmkA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPWeB-0004qM-BN
	for alex.bennee@linaro.org; Mon, 26 Jun 2017 12:13:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dPWcD-0002uk-B2
	for qemu-devel@nongnu.org; Mon, 26 Jun 2017 12:11:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dPWcB-0003nr-18
	for qemu-devel@nongnu.org; Mon, 26 Jun 2017 12:11:53 -0400
Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244]:35735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dPWcA-0003ng-Pp; Mon, 26 Jun 2017 12:11:50 -0400
Received: by mail-yw0-x244.google.com with SMTP id z21so326093ywz.2;
	Mon, 26 Jun 2017 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qRnqx4DGTFlJ8GS6o1ipUbA1ejbtpaxodD+CjBegA14=;
	b=C3E9JmkAmEEHQPSVWArKpGLiCzmy4oF6ACGks7X5BzCnV1xmI+iOfRE1xtjZEZydi8
	NfR1P1xwJ/cFO7nR1OThZmIY6jjg6TpOMlYRBIL38aKHjnSPKGWXVn02UHMPUfQ6NeUx
	He3kJPrEZHW2bVF/JMd48AaCeYqBUIy90G0dPMoHKBvBtIrZxJoUMmLQ7baV0YBfV7Uj
	2q+48hg5nlRurRIk1RZP/rylnKs6PNSpdHqCz7iXkzJvJ1ElNVvlzw9LbsGodmRYeLUL
	g6UraToWKHXLnS6XieEUr+Q+P49vOxWBhMjihy60NVtZ+akf7T5hOUFS3xA8RxrT//wk
	4aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qRnqx4DGTFlJ8GS6o1ipUbA1ejbtpaxodD+CjBegA14=;
	b=AnLuJdwQlPvOsJk1h678l8j7i9OcDaY7ESBpU6LSAnYH4dk47EMhnDyBK/COKWlrQZ
	3UtGRhx9llokBXr+roDDxUgD3f1qLPVNk3/pXC8CJVjPy+yqC60OvFIIMCGE3WDO/I1v
	az3cHxE/bI4f3qWcl/rbUeI8vixhCteG7uqkm+U92rFgfdE/OPpw1RycArN19Toi22xT
	hR43R9KKQoM1yolP3IqwUK+YYb90t0usnbutuYNPmeby54DNkbnGZ2ZsUSoyg9C1n0JP
	PRTXFiXj5UILML2V3V+xXH3g0kYRdwY5nJkKv6Fl6aiRwfOWxyRRiMJeHzYlfYVf6+i9
	+BSQ==
X-Gm-Message-State: AKS2vOxGXzrcW3ThNsyXAHpWOrS05p97eH8Fc2OCig6WdOOyf5xhykvo
	kNe/T0BjRrAbti13xMgGwAa286f9Vg==
X-Received: by 10.129.44.130 with SMTP id s124mr710646yws.2.1498493509682;
	Mon, 26 Jun 2017 09:11:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.65 with HTTP; Mon, 26 Jun 2017 09:11:49 -0700 (PDT)
In-Reply-To: <CALHRZuoihb2Oiu9adm=2gPUf-LFdkBR9qw1iV+ohL6kp0t5d=A@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
	<CALHRZur8Uh0JCnOoY-_mUU_fyzbUgxbmWKtfOoB-GTYR5UcEnQ@mail.gmail.com>
	<CALHRZuoVHFOYV345JmvSkfJHsVjS7Wv_ySzAUtwo1D7eyoS_XQ@mail.gmail.com>
	<648515bf-ba1e-3d7f-d5bd-51b243f8c29f@amsat.org>
	<CALHRZuoihb2Oiu9adm=2gPUf-LFdkBR9qw1iV+ohL6kp0t5d=A@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 26 Jun 2017 21:41:49 +0530
Message-ID: <CALHRZuoFU6vmnEBobVEqesApB6qm6cmNQfm9oVMG2RaooNEh7Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::244
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu devel v5 PATCH 0/5] Add support for
 Smartfusion2 SoC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KdEBBbr345bm

Hi Philippe,

On Fri, Jun 9, 2017 at 12:51 PM, sundeep subbaraya <sundeep.lkml@gmail.com>
wrote:

> Hi Philippe,
>
> On Wed, May 31, 2017 at 11:06 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org>
> wrote:
>
>> Hi Sundeep,
>>
>> On 05/29/2017 02:28 AM, sundeep subbaraya wrote:
>>
>>> Hi Philippe,
>>>
>>> Any update on this? I will wait for your comments too
>>> and send next iteration fixing Alistair comments.
>>>
>>
>> Sorry I'm supposed to be in holidays ;)
>>
>
> Ohh sorry currently am in vacation :)
>
>>
>>
>>> Thanks,
>>> Sundeep
>>>
>>> On Wed, May 17, 2017 at 3:09 PM, sundeep subbaraya
>>> <sundeep.lkml@gmail.com <mailto:sundeep.lkml@gmail.com>> wrote:
>>>
>>>     Hi Philippe,
>>>
>>>     On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daud=C3=A9
>>>     <f4bug@amsat.org <mailto:f4bug@amsat.org>> wrote:
>>>
>>>         Hi Sundeep,
>>>
>>>         This patchset is way cleaner!
>>>         I had a fast look and I like it, I'll try to make some time soo=
n
>>>         to review details and test it.
>>>
>>>
>>>     Thank you
>>>
>>>
>>>
>>>
>>>         Is your work interested on U-Boot or more focused in Linux
>>> kernel?
>>>
>>>
>>>     I am interested more in kernel. I had to look into u-boot for first
>>>     time for Qemu only.
>>>     I worked only on FPGAs(load kernel with debugger) till now so never
>>>     got a chance to look into u-boot.
>>>
>>>
>>>         If you compile QEMU with libfdt support you can use the -dtb
>>>         option to pass the blob to the kernel directly, bypassing the
>>>         bootloader.
>>>
>>>     Yeah for armv7m I could not find any thing like that in tree.
>>>
>>>
>>>         If you need a bootloader you may give a look at coreboot which
>>>         supports dts well, see how Vladimir Serbinenko used Linux's dt
>>>         to boot a QEMU Versatile Express board:
>>>         https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-Feb
>>> ruary/040899.html
>>>         <https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-Fe
>>> bruary/040899.html>
>>>
>>>     Cool. I will look into it.
>>>
>>>     Thanks,
>>>     Sundeep
>>>
>>>
>>>         Regards,
>>>
>>>         Phil.
>>>
>>>
>>>         On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>>>
>>>             Hi Qemu-devel,
>>>
>>>             I am trying to add Smartfusion2 SoC.
>>>             SoC is from Microsemi and System on Module(SOM)
>>>             board is from Emcraft systems. Smartfusion2 has hardened
>>>             Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
>>>             At the moment only system timer, sysreg and SPI
>>>             controller are modelled.
>>>
>>>             Testing:
>>>             ./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial
>>>             mon:stdio \
>>>             -kernel u-boot.bin -display none -drive
>>>             file=3Dspi.bin,if=3Dmtd,format=3Draw
>>>
>>
>> I'm not sure the timer is working correctly, U-Boot loops with this
>> pattern:
>>
>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000220
>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000220
>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000220
>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000020
>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000020
>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000000
>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000000
>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000020
>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000020
>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000220
>>
>> I checked the images and Linux is booting. But as you mentioned I change=
d
u-boot
for boot delay and have seen this issue. Actually it is taking too long for
a second.
Smartfusion2 timer is working fine(Linux) whereas u-boot is using Systick
for auto-boot
timer. I did not understand quite correctly about ARM Systick in Qemu. How
do we
specify frequency of the Systick timer? How Systick is configured to use
CPU frequency
since qemu cpu speed is not constant? How frequency has to be specified for
using external clock as Systick input?

Please help me understand this.

Thanks,
Sundeep


>
>>>             Binaries u-boot.bin and spi.bin are at:
>>>
>>
>> you can compress spi.bin!
>>
>> can you share u-boot.elf with debug symbols too?
>>
>
> Sure. I have tested binaries before pushing. Did you compile the u-boot
> again?
> Please wait for a few days I will check and provide once am back.
>
> Thanks,
> Sundeep
>
>>
>> Regards,
>>
>> Phil.
>>
>>             https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
>>>
>>>             <https://github.com/Subbaraya-Sundeep/qemu-test-binaries.gi=
t
>>> >
>>>
>>>             U-boot is from Emcraft with modified
>>>                 - SPI driver not to use PDMA.
>>>                 - ugly hack to pass dtb to kernel in r1.
>>>             @
>>>             https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git
>>>             <https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git=
>
>>>
>>>             Linux is 4.5 linux with Smartfusion2 SoC dts and clocksourc=
e
>>>             driver added by myself @
>>>             https://github.com/Subbaraya-Sundeep/linux.git
>>>             <https://github.com/Subbaraya-Sundeep/linux.git>
>>>
>>>             v5
>>>                 As per Philippe comments:
>>>                     Added abort in Sysreg if guest tries to remap memor=
y
>>>                     other than default mapping.
>>>                     Use of CONFIG_MSF2 in Makefile for soc.c
>>>                     Fixed incorrect logic in timer model.
>>>                     Renamed msf2-timer.c -> mss-timer.c
>>>                             msf2-spi.c -> mss-spi.c also type names
>>>                     Renamed function msf2_init->emcraft_sf2_init in
>>>             msf2-som.c
>>>                     Added part-name,eNVM-size,eSRAM-size,pclk0 and pclk=
1
>>>                         properties to soc.
>>>                     Pass soc part-name,memory size and clock rate
>>>             properties from som.
>>>             v4:
>>>                 Fixed build failure by using PRIx macros.
>>>             v3:
>>>                 Added SoC file and board file as per Alistair comments.
>>>             v2:
>>>                 Added SPI controller so that u-boot loads kernel from
>>>             spi flash.
>>>             v1:
>>>                 Initial patch set with timer and sysreg
>>>
>>>             Thanks,
>>>             Sundeep
>>>
>>>             Subbaraya Sundeep (5):
>>>               msf2: Add Smartfusion2 System timer
>>>               msf2: Microsemi Smartfusion2 System Register block.
>>>               msf2: Add Smartfusion2 SPI controller
>>>               msf2: Add Smartfusion2 SoC.
>>>               msf2: Add Emcraft's Smartfusion2 SOM kit.
>>>
>>>              default-configs/arm-softmmu.mak |   1 +
>>>              hw/arm/Makefile.objs            |   2 +
>>>              hw/arm/msf2-soc.c               | 201 ++++++++++++++++++++=
+
>>>              hw/arm/msf2-som.c               |  89 ++++++++++
>>>              hw/misc/Makefile.objs           |   1 +
>>>              hw/misc/msf2-sysreg.c           | 161 +++++++++++++++++
>>>              hw/ssi/Makefile.objs            |   1 +
>>>              hw/ssi/mss-spi.c                | 378
>>>             ++++++++++++++++++++++++++++++++++++++++
>>>              hw/timer/Makefile.objs          |   1 +
>>>              hw/timer/mss-timer.c            | 249
>>>             ++++++++++++++++++++++++++
>>>              include/hw/arm/msf2-soc.h       |  69 ++++++++
>>>              include/hw/misc/msf2-sysreg.h   |  80 +++++++++
>>>              include/hw/ssi/mss-spi.h        | 104 +++++++++++
>>>              include/hw/timer/mss-timer.h    |  80 +++++++++
>>>              14 files changed, 1417 insertions(+)
>>>              create mode 100644 hw/arm/msf2-soc.c
>>>              create mode 100644 hw/arm/msf2-som.c
>>>              create mode 100644 hw/misc/msf2-sysreg.c
>>>              create mode 100644 hw/ssi/mss-spi.c
>>>              create mode 100644 hw/timer/mss-timer.c
>>>              create mode 100644 include/hw/arm/msf2-soc.h
>>>              create mode 100644 include/hw/misc/msf2-sysreg.h
>>>              create mode 100644 include/hw/ssi/mss-spi.h
>>>              create mode 100644 include/hw/timer/mss-timer.h
>>>
>>>
>>>
>>>
>
