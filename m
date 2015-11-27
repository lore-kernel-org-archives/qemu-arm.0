Received: by 10.182.158.201 with SMTP id ww9csp132965obb;
        Fri, 27 Nov 2015 12:26:58 -0800 (PST)
X-Received: by 10.140.168.8 with SMTP id o8mr59568203qho.28.1448656018235;
        Fri, 27 Nov 2015 12:26:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y69si32859852qka.73.2015.11.27.12.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Nov 2015 12:26:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2Pbd-0007FD-Tb
	for alex.bennee@linaro.org; Fri, 27 Nov 2015 15:26:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a2Pba-0007Az-94
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 15:26:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a2PbZ-0005SD-18
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 15:26:54 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:37158)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a2PbW-0005Rr-F5; Fri, 27 Nov 2015 15:26:50 -0500
Received: by wmww144 with SMTP id w144so70074778wmw.0;
	Fri, 27 Nov 2015 12:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=1Oy49xevrNr8mZTbQ2vAG4cVqcsbCxrC+KdlXvtSArA=;
	b=EhpQ3uK5BMHqvj7YcsRd/X6+q/TQ6V5VW1mqw2YXEvxA4ySd5+qUsksaoJVqedo1xv
	zFNa5tCmf3VmvqcpAURBx1Vvn6V5BxkdjgGFVFi2LgzXjZh8AHcXX8un9nciRT54f2HD
	LrNGWgcS5xtH+rSuWUkZrWq9zi/YIgNHwzaKO1oDpunWGa7y3VsnOVWFYDeNoMPUrDU7
	QTjOfC5gdBjO3ybQ41bfs2e79TGNuNwlCb6JR2P9D2pfQziTt1j6dn5gJ765p1d35y9y
	Aqrbc8vw98r13saCmxvyva7KRHjQoDa1K7YrduGXLiXZUvVUMn5OT9HhEfX7BBoeFhRW
	GErQ==
MIME-Version: 1.0
X-Received: by 10.28.18.9 with SMTP id 9mr12407733wms.96.1448656009884; Fri,
	27 Nov 2015 12:26:49 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Fri, 27 Nov 2015 12:26:49 -0800 (PST)
In-Reply-To: <5658B4EA.8070005@tribudubois.net>
References: <cover.1448521064.git.jcd@tribudubois.net>
	<d53f34e3cf05dde424b6eab7d51cef6f244ef80a.1448521065.git.jcd@tribudubois.net>
	<CAPokK=pUqOnccS-jSqm6ai4iG5v4+Zr+F-LyJwCGZQv-BjkPpQ@mail.gmail.com>
	<5658B4EA.8070005@tribudubois.net>
Date: Fri, 27 Nov 2015 12:26:49 -0800
Message-ID: <CAPokK=p5UF7z4PtoNukVc4rAOv1Tw6oEkFSwvBFm=TVz=Oo_BQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>,
	Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::231
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
X-TUID: 98rYVLMs/sET

On Fri, Nov 27, 2015 at 11:54 AM, Jean-Christophe DUBOIS
<jcd@tribudubois.net> wrote:
> Le 27/11/2015 03:39, Peter Crosthwaite a =C3=A9crit :
>
> On Wed, Nov 25, 2015 at 11:16 PM, Jean-Christophe Dubois
> <jcd@tribudubois.net> wrote:
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
>
> This seems to slow down boot performance for i.MX25 Linux. Admittedly,
> the issue looks to be in timeout code for an unmodelled periph (NAND):
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at
> /home/pcrost/poky/build/tmp/work-shared/qemuarmv5imx/kernel-source/driver=
s/mtd/nand/mxc_nand.c:464
> wait_op_done+0xf0/0x114()
> timeout! useirq=3D0
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.1 #1
> Hardware name: Freescale i.MX25 (Device Tree Support)
> [<c000eec8>] (unwind_backtrace) from [<c000d2b0>] (show_stack+0x10/0x14)
> [<c000d2b0>] (show_stack) from [<c0019154>] (warn_slowpath_common+0x74/0x=
ac)
> [<c0019154>] (warn_slowpath_common) from [<c00191bc>]
> (warn_slowpath_fmt+0x30/0x40)
> [<c00191bc>] (warn_slowpath_fmt) from [<c036eaa0>] (wait_op_done+0xf0/0x1=
14)
> [<c036eaa0>] (wait_op_done) from [<c0369698>] (nand_scan_ident+0xdc/0x156=
0)
> [<c0369698>] (nand_scan_ident) from [<c036e6a8>] (mxcnd_probe+0x378/0x5c0=
)
> [<c036e6a8>] (mxcnd_probe) from [<c03081a4>] (platform_drv_probe+0x44/0xa=
c)
> [<c03081a4>] (platform_drv_probe) from [<c0306654>]
> (driver_probe_device+0x180/0x2c4)
> [<c0306654>] (driver_probe_device) from [<c0306824>]
> (__driver_attach+0x8c/0x90)
> [<c0306824>] (__driver_attach) from [<c0304a80>]
> (bus_for_each_dev+0x70/0xa0)
> [<c0304a80>] (bus_for_each_dev) from [<c0305d08>]
> (bus_add_driver+0x188/0x210)
> [<c0305d08>] (bus_add_driver) from [<c03071d4>] (driver_register+0x78/0xf=
8)
> [<c03071d4>] (driver_register) from [<c00095e0>]
> (do_one_initcall+0x84/0x1f0)
> [<c00095e0>] (do_one_initcall) from [<c071bd24>]
> (kernel_init_freeable+0x108/0x1c8)
> [<c071bd24>] (kernel_init_freeable) from [<c0541a0c>] (kernel_init+0x8/0x=
ec)
> [<c0541a0c>] (kernel_init) from [<c000a340>] (ret_from_fork+0x14/0x34)
> ---[ end trace 13248cb1a1bbcb9c ]---
>
> <<Delay happens here>>
>
> nand: No NAND device found
> ...
>
> Without this patch, the delay is around 2 seconds, with this patch it
> is 10+. Any idea what would cause it? Are you removing the NAND from
> DTS for your testing and do we not care about these errors paths?
>
> Regards,
> Peter
>
> The kernel I am testing with is 3.19.0 but without without DTS tree.
> Linux version 3.19.0 (jcd@jcd-U31SG) (gcc version 4.6.3 (GCC) ) #2 Mon Ju=
n
> 22 00:32:04 CEST 2015
>
> So I am not up to date on this side and I might not test the same devices=
 as
> you do as I generated a "minimal" kernel for my test.
>

So the DTB+defconfig boot is actually in pretty good shape. That NAND
thing is the only real bootlog issue. All other missing peripherals
fail gracefully.

> Anyway, testing the timer code I found that running "sleep 60" on both PT=
F
> doesn't give the expected 60 seconds in "real world time":
>
> On i.MX31 (using i.MX31 CCM) =3D> 47 seconds

> On i.MX25 (using i.MX31 CCM) =3D> 52 seconds (before change. close enough=
?)

Confirmed this result, exactly the same here.

> On i.MX25 (using i.MX25 CCM) =3D> 80 seconds
>
> Another indication, the bogomips:
>
> On i.MX31 (using i.MX31 CCM) =3D> 78
> On i.MX25 (using i.MX31 CCM) =3D> 87 (before change. close enough?)
> On i.MX25 (using i.MX25 CCM) =3D> 133
>

I wouldn't worry about this, this is rarely accurate in QEMU.

Regards,
Peter

> So, yes, for some reason "time goes slower" after switching to i.MX25 CCM
> ... (but it was also going too fast before with i.MX31 CCM)
>
> As the CCM doesn't really provide any clock (just a clock value) somethin=
g
> must not be right in the way the i.MX GPT timer is computing time.
>
> I need to look after this.
>
> JC
>
> ---
>
> Changes since v1:
>  * rework loging to match other i.MX drivers
>
> Changes since v2:
>  * We moved to an inheritance QOM scheme
>
> Changes since v3:
>  * Rework logging based on comments.
>
>  hw/arm/fsl-imx25.c          |   2 +-
>  hw/misc/Makefile.objs       |   1 +
>  hw/misc/imx25_ccm.c         | 276
> ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/fsl-imx25.h  |   4 +-
>  include/hw/misc/imx25_ccm.h |  59 ++++++++++
>  5 files changed, 339 insertions(+), 3 deletions(-)
>  create mode 100644 hw/misc/imx25_ccm.c
>  create mode 100644 include/hw/misc/imx25_ccm.h
>
>
