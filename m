Received: by 10.182.158.201 with SMTP id ww9csp175694obb;
        Fri, 27 Nov 2015 14:05:44 -0800 (PST)
X-Received: by 10.140.136.134 with SMTP id 128mr30122873qhi.16.1448661944278;
        Fri, 27 Nov 2015 14:05:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q64si33167242qha.51.2015.11.27.14.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Nov 2015 14:05:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2R9D-00007v-Ok
	for alex.bennee@linaro.org; Fri, 27 Nov 2015 17:05:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a2R9A-00007N-Gs
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 17:05:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a2R94-0003Xq-UY
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 17:05:40 -0500
Received: from zose-mta03.web4all.fr ([185.49.20.44]:39575)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a2R94-0003XX-Iv; Fri, 27 Nov 2015 17:05:34 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta03.web4all.fr (Postfix) with ESMTP id EAD5B4163A;
	Fri, 27 Nov 2015 23:05:32 +0100 (CET)
Received: from zose-mta03.web4all.fr ([127.0.0.1])
	by localhost (zose-mta03.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 1Sc3WW774mwl; Fri, 27 Nov 2015 23:05:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta03.web4all.fr (Postfix) with ESMTP id 0FB9641640;
	Fri, 27 Nov 2015 23:05:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-03.w4a.fr
Received: from zose-mta03.web4all.fr ([127.0.0.1])
	by localhost (zose-mta03.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id 0AkCfQsf0Fov; Fri, 27 Nov 2015 23:05:31 +0100 (CET)
Received: from [192.168.1.128] (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta03.web4all.fr (Postfix) with ESMTPSA id 9F27A4163A;
	Fri, 27 Nov 2015 23:05:31 +0100 (CET)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
References: <cover.1448521064.git.jcd@tribudubois.net>
	<d53f34e3cf05dde424b6eab7d51cef6f244ef80a.1448521065.git.jcd@tribudubois.net>
	<CAPokK=pUqOnccS-jSqm6ai4iG5v4+Zr+F-LyJwCGZQv-BjkPpQ@mail.gmail.com>
	<5658B4EA.8070005@tribudubois.net>
	<CAPokK=p5UF7z4PtoNukVc4rAOv1Tw6oEkFSwvBFm=TVz=Oo_BQ@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <5658D3AA.9040305@tribudubois.net>
Date: Fri, 27 Nov 2015 23:05:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=p5UF7z4PtoNukVc4rAOv1Tw6oEkFSwvBFm=TVz=Oo_BQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.44
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v4 3/3] i.MX: Add an i.MX25 specific CCM
	class/instance.
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
X-TUID: 7v4znmBnRX54

Le 27/11/2015 21:26, Peter Crosthwaite a =C3=A9crit :
> On Fri, Nov 27, 2015 at 11:54 AM, Jean-Christophe DUBOIS
> <jcd@tribudubois.net> wrote:
>> Le 27/11/2015 03:39, Peter Crosthwaite a =C3=A9crit :
>>
>> On Wed, Nov 25, 2015 at 11:16 PM, Jean-Christophe Dubois
>> <jcd@tribudubois.net> wrote:
>>
>> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
>>
>> This seems to slow down boot performance for i.MX25 Linux. Admittedly,
>> the issue looks to be in timeout code for an unmodelled periph (NAND):
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 1 at
>> /home/pcrost/poky/build/tmp/work-shared/qemuarmv5imx/kernel-source/dri=
vers/mtd/nand/mxc_nand.c:464
>> wait_op_done+0xf0/0x114()
>> timeout! useirq=3D0
>> Modules linked in:
>> CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.1 #1
>> Hardware name: Freescale i.MX25 (Device Tree Support)
>> [<c000eec8>] (unwind_backtrace) from [<c000d2b0>] (show_stack+0x10/0x1=
4)
>> [<c000d2b0>] (show_stack) from [<c0019154>] (warn_slowpath_common+0x74=
/0xac)
>> [<c0019154>] (warn_slowpath_common) from [<c00191bc>]
>> (warn_slowpath_fmt+0x30/0x40)
>> [<c00191bc>] (warn_slowpath_fmt) from [<c036eaa0>] (wait_op_done+0xf0/=
0x114)
>> [<c036eaa0>] (wait_op_done) from [<c0369698>] (nand_scan_ident+0xdc/0x=
1560)
>> [<c0369698>] (nand_scan_ident) from [<c036e6a8>] (mxcnd_probe+0x378/0x=
5c0)
>> [<c036e6a8>] (mxcnd_probe) from [<c03081a4>] (platform_drv_probe+0x44/=
0xac)
>> [<c03081a4>] (platform_drv_probe) from [<c0306654>]
>> (driver_probe_device+0x180/0x2c4)
>> [<c0306654>] (driver_probe_device) from [<c0306824>]
>> (__driver_attach+0x8c/0x90)
>> [<c0306824>] (__driver_attach) from [<c0304a80>]
>> (bus_for_each_dev+0x70/0xa0)
>> [<c0304a80>] (bus_for_each_dev) from [<c0305d08>]
>> (bus_add_driver+0x188/0x210)
>> [<c0305d08>] (bus_add_driver) from [<c03071d4>] (driver_register+0x78/=
0xf8)
>> [<c03071d4>] (driver_register) from [<c00095e0>]
>> (do_one_initcall+0x84/0x1f0)
>> [<c00095e0>] (do_one_initcall) from [<c071bd24>]
>> (kernel_init_freeable+0x108/0x1c8)
>> [<c071bd24>] (kernel_init_freeable) from [<c0541a0c>] (kernel_init+0x8=
/0xec)
>> [<c0541a0c>] (kernel_init) from [<c000a340>] (ret_from_fork+0x14/0x34)
>> ---[ end trace 13248cb1a1bbcb9c ]---
>>
>> <<Delay happens here>>
>>
>> nand: No NAND device found
>> ...
>>
>> Without this patch, the delay is around 2 seconds, with this patch it
>> is 10+. Any idea what would cause it? Are you removing the NAND from
>> DTS for your testing and do we not care about these errors paths?
>>
>> Regards,
>> Peter
>>
>> The kernel I am testing with is 3.19.0 but without without DTS tree.
>> Linux version 3.19.0 (jcd@jcd-U31SG) (gcc version 4.6.3 (GCC) ) #2 Mon=
 Jun
>> 22 00:32:04 CEST 2015
>>
>> So I am not up to date on this side and I might not test the same devi=
ces as
>> you do as I generated a "minimal" kernel for my test.
>>
> So the DTB+defconfig boot is actually in pretty good shape. That NAND
> thing is the only real bootlog issue. All other missing peripherals
> fail gracefully.

I tried the latest kernel (4.4.0 rc2) with full defconfig and dtb and I=20
am getting the same timeout issue even with the i.MX31 CCM module.

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/mxc_nand.c:464=20
wait_op_done+0xe0/0x104()
timeout! useirq=3D0
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.4.0-rc2-00118-g1724734 #1
Hardware name: Freescale i.MX25 (Device Tree Support)
[<c000eb8c>] (unwind_backtrace) from [<c000d014>] (show_stack+0x10/0x14)
[<c000d014>] (show_stack) from [<c0018c10>] (warn_slowpath_common+0x78/0x=
b0)
[<c0018c10>] (warn_slowpath_common) from [<c0018cdc>]=20
(warn_slowpath_fmt+0x30/0x40)
[<c0018cdc>] (warn_slowpath_fmt) from [<c035ace4>] (wait_op_done+0xe0/0x1=
04)
[<c035ace4>] (wait_op_done) from [<c035a86c>] (mxc_nand_command+0x150/0x4=
a8)
[<c035a86c>] (mxc_nand_command) from [<c03546d8>]=20
(nand_scan_ident+0xe4/0x1580)
[<c03546d8>] (nand_scan_ident) from [<c035a25c>] (mxcnd_probe+0x370/0x5a0=
)
[<c035a25c>] (mxcnd_probe) from [<c02f0698>] (platform_drv_probe+0x54/0xa=
4)
[<c02f0698>] (platform_drv_probe) from [<c02eec08>]=20
(driver_probe_device+0x1e4/0x2a8)
[<c02eec08>] (driver_probe_device) from [<c02eed58>]=20
(__driver_attach+0x8c/0x90)
[<c02eed58>] (__driver_attach) from [<c02ed484>]=20
(bus_for_each_dev+0x5c/0x8c)
[<c02ed484>] (bus_for_each_dev) from [<c02ee380>]=20
(bus_add_driver+0x160/0x1f8)
[<c02ee380>] (bus_add_driver) from [<c02ef814>] (driver_register+0x78/0xf=
4)
[<c02ef814>] (driver_register) from [<c0009600>]=20
(do_one_initcall+0x84/0x1f4)
[<c0009600>] (do_one_initcall) from [<c0708cf0>]=20
(kernel_init_freeable+0xf8/0x1bc)
[<c0708cf0>] (kernel_init_freeable) from [<c05373d8>] (kernel_init+0x8/0x=
e4)
[<c05373d8>] (kernel_init) from [<c000a370>] (ret_from_fork+0x14/0x24)
---[ end trace 03bc7274bbc34493 ]---
nand: No NAND device found

I tried it with mainline qemu (so without any of my changes) and I still=20
run in the problem.

So not sure it is related to the change in the i.MX25 CCM device.

JC


>
>> Anyway, testing the timer code I found that running "sleep 60" on both=
 PTF
>> doesn't give the expected 60 seconds in "real world time":
>>
>> On i.MX31 (using i.MX31 CCM) =3D> 47 seconds
>> On i.MX25 (using i.MX31 CCM) =3D> 52 seconds (before change. close eno=
ugh?)
> Confirmed this result, exactly the same here.
>
>> On i.MX25 (using i.MX25 CCM) =3D> 80 seconds
>>
>> Another indication, the bogomips:
>>
>> On i.MX31 (using i.MX31 CCM) =3D> 78
>> On i.MX25 (using i.MX31 CCM) =3D> 87 (before change. close enough?)
>> On i.MX25 (using i.MX25 CCM) =3D> 133
>>
> I wouldn't worry about this, this is rarely accurate in QEMU.
>
> Regards,
> Peter
>
>> So, yes, for some reason "time goes slower" after switching to i.MX25 =
CCM
>> ... (but it was also going too fast before with i.MX31 CCM)
>>
>> As the CCM doesn't really provide any clock (just a clock value) somet=
hing
>> must not be right in the way the i.MX GPT timer is computing time.
>>
>> I need to look after this.
>>
>> JC
>>
>> ---
>>
>> Changes since v1:
>>   * rework loging to match other i.MX drivers
>>
>> Changes since v2:
>>   * We moved to an inheritance QOM scheme
>>
>> Changes since v3:
>>   * Rework logging based on comments.
>>
>>   hw/arm/fsl-imx25.c          |   2 +-
>>   hw/misc/Makefile.objs       |   1 +
>>   hw/misc/imx25_ccm.c         | 276
>> ++++++++++++++++++++++++++++++++++++++++++++
>>   include/hw/arm/fsl-imx25.h  |   4 +-
>>   include/hw/misc/imx25_ccm.h |  59 ++++++++++
>>   5 files changed, 339 insertions(+), 3 deletions(-)
>>   create mode 100644 hw/misc/imx25_ccm.c
>>   create mode 100644 include/hw/misc/imx25_ccm.h
>>
>>

