Received: by 10.182.105.169 with SMTP id gn9csp972732obb;
        Fri, 30 Oct 2015 01:29:13 -0700 (PDT)
X-Received: by 10.140.42.166 with SMTP id c35mr8223736qga.66.1446193753765;
        Fri, 30 Oct 2015 01:29:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p88si4950209qkh.25.2015.10.30.01.29.13
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 01:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zs53h-0005U2-EJ
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 04:29:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Zs53K-0005CF-PX
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 04:28:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Zs53J-0000oE-5M
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 04:28:50 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:36377)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Zs53B-0000ma-I5; Fri, 30 Oct 2015 04:28:43 -0400
Received: from 172.24.1.49 (EHLO SZXEML423-HUB.china.huawei.com)
	([172.24.1.49])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BPZ50893; Fri, 30 Oct 2015 16:28:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML423-HUB.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 30 Oct 2015 16:27:51 +0800
Message-ID: <56332A05.2020805@huawei.com>
Date: Fri, 30 Oct 2015 16:27:49 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>
References: <1446129661-5239-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1446129661-5239-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.56332A14.00B6, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: c8ebec4e68d6c396d9e8ddcf1a027f6c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH for-2.5] MAINTAINERS: Add new qemu-arm
 mailing list to ARM related entries
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
X-TUID: AqcQheN7TUFx



On 2015/10/29 22:41, Peter Maydell wrote:
> We now have a qemu-arm mailing list for ARM patches and discussion,
> so add an L: entry for it to the various ARM related entries in
> MAINTAINERS.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
> I basically just added an L: entry for everything that was vaguely
> ARM-ish...it's a shame the MAINTAINERS format doesn't let you say
> "and cc this list for any of the sub-entries under this subsection".
> 
>  MAINTAINERS | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3144113..fc8abe8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -81,6 +81,7 @@ F: disas/alpha.c
>  
>  ARM
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: target-arm/
>  F: hw/arm/
> @@ -216,6 +217,7 @@ F: */kvm.*
>  
>  ARM
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: target-arm/kvm.c
>  
> @@ -287,6 +289,7 @@ ARM Machines
>  ------------
>  Allwinner-a10
>  M: Beniamino Galvani <b.galvani@gmail.com>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/allwinner*
>  F: include/hw/*/allwinner*
> @@ -294,6 +297,7 @@ F: hw/arm/cubieboard.c
>  
>  ARM PrimeCell
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/char/pl011.c
>  F: hw/display/pl110*
> @@ -308,6 +312,7 @@ F: include/hw/arm/primecell.h
>  
>  ARM cores
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/intc/arm*
>  F: hw/intc/gic_internal.h
> @@ -327,54 +332,64 @@ M: Evgeny Voevodin <e.voevodin@samsung.com>
>  M: Maksim Kozlov <m.kozlov@samsung.com>
>  M: Igor Mitsyanko <i.mitsyanko@gmail.com>
>  M: Dmitry Solodkiy <d.solodkiy@samsung.com>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/exynos*
>  
>  Calxeda Highbank
>  M: Rob Herring <robh@kernel.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/highbank.c
>  F: hw/net/xgmac.c
>  
>  Canon DIGIC
>  M: Antony Pavlov <antonynpavlov@gmail.com>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: include/hw/arm/digic.h
>  F: hw/*/digic*
>  
>  Gumstix
>  L: qemu-devel@nongnu.org
> +L: qemu-arm@nongnu.org
>  S: Orphan
>  F: hw/arm/gumstix.c
>  
>  i.MX31
>  M: Peter Chubb <peter.chubb@nicta.com.au>
> +L: qemu-arm@nongnu.org
>  S: Odd fixes
>  F: hw/*/imx*
>  F: hw/arm/kzm.c
>  
>  Integrator CP
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/integratorcp.c
>  
>  Musicpal
>  M: Jan Kiszka <jan.kiszka@web.de>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/musicpal.c
>  
>  nSeries
>  M: Andrzej Zaborowski <balrogg@gmail.com>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/nseries.c
>  
>  Palm
>  M: Andrzej Zaborowski <balrogg@gmail.com>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/palm.c
>  
>  Real View
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/realview*
>  F: hw/intc/realview_gic.c
> @@ -382,6 +397,7 @@ F: include/hw/intc/realview_gic.h
>  
>  PXA2XX
>  M: Andrzej Zaborowski <balrogg@gmail.com>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/mainstone.c
>  F: hw/arm/spitz.c
> @@ -391,17 +407,20 @@ F: hw/*/pxa2xx*
>  
>  Stellaris
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/stellaris*
>  
>  Versatile PB
>  M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/versatile*
>  
>  Xilinx Zynq
>  M: Alistair Francis <alistair.francis@xilinx.com>
>  M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/xilinx_zynq.c
>  F: hw/misc/zynq_slcr.c
> @@ -411,6 +430,7 @@ F: hw/ssi/xilinx_spips.c
>  Xilinx ZynqMP
>  M: Alistair Francis <alistair.francis@xilinx.com>
>  M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/xlnx-zynqmp.c
>  F: hw/arm/xlnx-ep108.c
> @@ -419,6 +439,7 @@ F: include/hw/arm/xlnx-zynqmp.h
>  ARM ACPI Subsystem
>  M: Shannon Zhao <zhaoshenglong@huawei.com>
>  M: Shannon Zhao <shannon.zhao@linaro.org>
> +L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/virt-acpi-build.c
>  F: include/hw/arm/virt-acpi-build.h
> @@ -1235,6 +1256,7 @@ AArch64 target
>  M: Claudio Fontana <claudio.fontana@huawei.com>
>  M: Claudio Fontana <claudio.fontana@gmail.com>
>  S: Maintained
> +L: qemu-arm@nongnu.org
>  F: tcg/aarch64/
>  F: disas/arm-a64.cc
>  F: disas/libvixl/
> @@ -1242,6 +1264,7 @@ F: disas/libvixl/
>  ARM target
>  M: Andrzej Zaborowski <balrogg@gmail.com>
>  S: Maintained
> +L: qemu-arm@nongnu.org
>  F: tcg/arm/
>  F: disas/arm.c
>  
> 

-- 
Shannon

