Received: by 10.182.105.169 with SMTP id gn9csp808660obb;
        Thu, 29 Oct 2015 17:11:23 -0700 (PDT)
X-Received: by 10.141.23.82 with SMTP id z79mr6529071qhd.39.1446163883032;
        Thu, 29 Oct 2015 17:11:23 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f84si2552017qhf.105.2015.10.29.17.11.22
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 29 Oct 2015 17:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZrxHu-0004SO-R1
	for alex.bennee@linaro.org; Thu, 29 Oct 2015 20:11:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ZrxHX-0004BI-Rt
	for qemu-devel@nongnu.org; Thu, 29 Oct 2015 20:11:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ZrxHW-0007xB-G7
	for qemu-devel@nongnu.org; Thu, 29 Oct 2015 20:10:59 -0400
Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231]:34572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1ZrxHW-0007x7-9P; Thu, 29 Oct 2015 20:10:58 -0400
Received: by obbza9 with SMTP id za9so31376910obb.1;
	Thu, 29 Oct 2015 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FndXV1kLgVavHbXFBrGhnnRMFeU34mIyo7Ptvh1fbmw=;
	b=eL5Q1SIIGR0SGr7Rey1sSWyL97mzlu0IK/aoTqpeTrwH2Q+XgQnNpayLBLstFGTuuR
	eSNTF9XirEORCFiqE/HFydTiZ+7egOoIOLgMNdFP8e+EGtr9UEJMI9vQZwsPj+I5QrAo
	DDtzMmw/rNIyXwd5tcXObAwznbDaBh7HZfD71Kkhk3mSOVlv0i3YWzwTLivqdbrugZCn
	Ztbn+1qwWmwA9TjIe0qUe62EyDVK/jlnPgi89LfACqbq4mx45CsgXhWaCmfPLopi4tps
	Jvf3gtJAMDwAxoURIsCjd+PCLaLBSMlcec3B0OgJfdYe1WOT4OCX2J5warQ7XkxeCUmZ
	KKDA==
X-Received: by 10.60.232.231 with SMTP id tr7mr3608735oec.69.1446163857707;
	Thu, 29 Oct 2015 17:10:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.49.228 with HTTP; Thu, 29 Oct 2015 17:10:28 -0700 (PDT)
In-Reply-To: <1446129661-5239-1-git-send-email-peter.maydell@linaro.org>
References: <1446129661-5239-1-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 29 Oct 2015 17:10:28 -0700
Message-ID: <CAKmqyKOWPvDSECfeY=us8Z9gga-8ZaweNRfbof9dkyTeqFVevA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::231
Cc: qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
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
X-TUID: 0I8jLo7bPPn+

On Thu, Oct 29, 2015 at 7:41 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> We now have a qemu-arm mailing list for ARM patches and discussion,
> so add an L: entry for it to the various ARM related entries in
> MAINTAINERS.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Looks fine to me

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

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
> --
> 1.9.1
>
>
