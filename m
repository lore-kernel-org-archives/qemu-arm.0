Received: by 10.182.158.201 with SMTP id ww9csp991505obb;
        Thu, 26 Nov 2015 18:39:37 -0800 (PST)
X-Received: by 10.55.75.8 with SMTP id y8mr40487022qka.2.1448591977192;
        Thu, 26 Nov 2015 18:39:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z203si29299514qka.44.2015.11.26.18.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Nov 2015 18:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a28wi-000301-RP
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 21:39:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a28wg-0002wb-Bf
	for qemu-arm@nongnu.org; Thu, 26 Nov 2015 21:39:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a28wf-0002yf-42
	for qemu-arm@nongnu.org; Thu, 26 Nov 2015 21:39:34 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:36381)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a28wc-0002xZ-M6; Thu, 26 Nov 2015 21:39:30 -0500
Received: by wmww144 with SMTP id w144so39525017wmw.1;
	Thu, 26 Nov 2015 18:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uj/d1mmk/0d7QC/ca+/ReckcnHzDFSxofvPOpcdqnQE=;
	b=oRc20so2PgSkwlUk5s+yFLIdSK4HXWmB7Wkwy093HtHEYMR/sk+e9nfPkTanzzGLnx
	j0olIUKaCCEiQlis7QbMnp1agMVJXJq59QKyXyvx4bwMX09YlYJts842v8toHFyJQMBB
	U94s+By+7tZKeUBQbSOrTfsUdKO8VaPBWJm/qggOVryavpN610mQvn41Pg7vjvXDoMik
	1c7eBBPieB2cWACChdILaL4ZvlxjEJAnIXB3OMIPdFcMB8GVpNC3QkA39mA4/5oYPd1g
	QOMIKbq0D1zLEb9yL4Gsk/+SW8FlA0vTfFenSJjHXKTloHOyWaxROfkfdFq19DCRa2/1
	Gi/A==
MIME-Version: 1.0
X-Received: by 10.194.114.105 with SMTP id jf9mr51537735wjb.102.1448591970087; 
	Thu, 26 Nov 2015 18:39:30 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Thu, 26 Nov 2015 18:39:30 -0800 (PST)
In-Reply-To: <d53f34e3cf05dde424b6eab7d51cef6f244ef80a.1448521065.git.jcd@tribudubois.net>
References: <cover.1448521064.git.jcd@tribudubois.net>
	<d53f34e3cf05dde424b6eab7d51cef6f244ef80a.1448521065.git.jcd@tribudubois.net>
Date: Thu, 26 Nov 2015 18:39:30 -0800
Message-ID: <CAPokK=pUqOnccS-jSqm6ai4iG5v4+Zr+F-LyJwCGZQv-BjkPpQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22e
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
X-TUID: 4M69ZC9CZaP/

On Wed, Nov 25, 2015 at 11:16 PM, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>

This seems to slow down boot performance for i.MX25 Linux. Admittedly,
the issue looks to be in timeout code for an unmodelled periph (NAND):

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at
/home/pcrost/poky/build/tmp/work-shared/qemuarmv5imx/kernel-source/drivers/mtd/nand/mxc_nand.c:464
wait_op_done+0xf0/0x114()
timeout! useirq=0
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.1 #1
Hardware name: Freescale i.MX25 (Device Tree Support)
[<c000eec8>] (unwind_backtrace) from [<c000d2b0>] (show_stack+0x10/0x14)
[<c000d2b0>] (show_stack) from [<c0019154>] (warn_slowpath_common+0x74/0xac)
[<c0019154>] (warn_slowpath_common) from [<c00191bc>]
(warn_slowpath_fmt+0x30/0x40)
[<c00191bc>] (warn_slowpath_fmt) from [<c036eaa0>] (wait_op_done+0xf0/0x114)
[<c036eaa0>] (wait_op_done) from [<c0369698>] (nand_scan_ident+0xdc/0x1560)
[<c0369698>] (nand_scan_ident) from [<c036e6a8>] (mxcnd_probe+0x378/0x5c0)
[<c036e6a8>] (mxcnd_probe) from [<c03081a4>] (platform_drv_probe+0x44/0xac)
[<c03081a4>] (platform_drv_probe) from [<c0306654>]
(driver_probe_device+0x180/0x2c4)
[<c0306654>] (driver_probe_device) from [<c0306824>] (__driver_attach+0x8c/0x90)
[<c0306824>] (__driver_attach) from [<c0304a80>] (bus_for_each_dev+0x70/0xa0)
[<c0304a80>] (bus_for_each_dev) from [<c0305d08>] (bus_add_driver+0x188/0x210)
[<c0305d08>] (bus_add_driver) from [<c03071d4>] (driver_register+0x78/0xf8)
[<c03071d4>] (driver_register) from [<c00095e0>] (do_one_initcall+0x84/0x1f0)
[<c00095e0>] (do_one_initcall) from [<c071bd24>]
(kernel_init_freeable+0x108/0x1c8)
[<c071bd24>] (kernel_init_freeable) from [<c0541a0c>] (kernel_init+0x8/0xec)
[<c0541a0c>] (kernel_init) from [<c000a340>] (ret_from_fork+0x14/0x34)
---[ end trace 13248cb1a1bbcb9c ]---

<<Delay happens here>>

nand: No NAND device found
...

Without this patch, the delay is around 2 seconds, with this patch it
is 10+. Any idea what would cause it? Are you removing the NAND from
DTS for your testing and do we not care about these errors paths?

Regards,
Peter


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
>  hw/misc/imx25_ccm.c         | 276 ++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/fsl-imx25.h  |   4 +-
>  include/hw/misc/imx25_ccm.h |  59 ++++++++++
>  5 files changed, 339 insertions(+), 3 deletions(-)
>  create mode 100644 hw/misc/imx25_ccm.c
>  create mode 100644 include/hw/misc/imx25_ccm.h
>
