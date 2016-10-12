Received: by 10.80.166.35 with SMTP id d32csp537458edc;
        Wed, 12 Oct 2016 06:38:35 -0700 (PDT)
X-Received: by 10.55.183.6 with SMTP id h6mr1125514qkf.0.1476279514918;
        Wed, 12 Oct 2016 06:38:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o63si3865802qkb.89.2016.10.12.06.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 06:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33648 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buJju-0007WQ-8B
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 09:38:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1buJgq-0004xm-Gq
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 09:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1buJgm-0003DY-FI
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 09:35:24 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1buJgg-000395-3n; Wed, 12 Oct 2016 09:35:14 -0400
Received: by mail-oi0-x243.google.com with SMTP id p136so3369084oic.1;
	Wed, 12 Oct 2016 06:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=JPistWMxQxwK1GF+WeOjzW6v9e2OTFGsp1VpZjR9xuo=;
	b=NnOCpHvrCxl9qH3O2qba+cBEroXCi9TfZILLCQ2rEvz+nzwlKepj87CoAtHv9e08ZJ
	nPY2YFc8HiKE1s8rJ36hBMgMPrsXtO074CPNxVvYtzLLZEQvCYMBHMlk14VF9yQjvgqs
	3V67yPHDD3bMmD+mYNA7DH7a0hQZSbXEWH44tgTLlZfGHaJ6QKQHpif79jMjQP93314l
	yEfAg6LCLXHU+w11RaZUO9+5G0Q0cJHPOsMuxB6H36zmNpuBQR040g4HG424uhyFgADf
	53rpRpQqOv4yl1TaUR3fqp0j0Wi5i8N56Ap3IorDt2Jrg8CFhNIHY83oWlNtGaJNw9zq
	NQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=JPistWMxQxwK1GF+WeOjzW6v9e2OTFGsp1VpZjR9xuo=;
	b=cPVTkuM4lxRkkVlO4mZT8s9xrwd1gxzEalw0bumtvPP9XfAVsiti5ikSTREBmGHzL5
	AZhDlLsAxMN+U37bcIP22eokFMdUn9GvxyBzrJj23CWyUzSAyVW3BYF5nOB9LTybizI+
	/g0PX65GsDTVzEogsjgSxr8FR2ukr2m9td16dWlNtEcDzw6VquGUBOMy06Cenr7mdb0k
	X0sKhA/H/iwfxwaF2c6WvitiwenVGPT/ME5huIWhE8leKkCMSBgOhPPgSFiPiS7Lcecy
	y1es7/Ix+YK6hG8zi/Wa4TJchFgQmCFTsjnUNQTcgdj4PK2J3CZ02c6wdPKukVvMDSvL
	GhcA==
X-Gm-Message-State: AA6/9RnbnV/lZZsGOY3fwjZ/lvsp6t9CvuVgZjJ3yzU0i+aycvHqhPEE/UbHmJgjpV3Tie9/oW7NX/6OWA1esQ==
X-Received: by 10.157.9.209 with SMTP id 17mr545533otz.87.1476279313122; Wed,
	12 Oct 2016 06:35:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.78.198 with HTTP; Wed, 12 Oct 2016 06:34:42 -0700 (PDT)
In-Reply-To: <1476266275-11155-1-git-send-email-thuth@redhat.com>
References: <1476266275-11155-1-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 12 Oct 2016 15:34:42 +0200
X-Google-Sender-Auth: Zthes_Xqd0eo1tVlOjhC82nIm3U
Message-ID: <CAKmqyKMkt5ii21KqUV_J8=oNqsqXaYH9dUkxCy1+u4+P-Uqthg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] MAINTAINERS: Add some ARM
 related files to the corresponding sections
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xs5BnvAgcUax

On Wed, Oct 12, 2016 at 11:57 AM, Thomas Huth <thuth@redhat.com> wrote:
> The files w/cpu/a*mpcore.c are already assigned to the ARM CPU
> section, but the corresponding headers include/hw/cpu/a*mpcore.h
> are still missing.
>
> The file hw/*/imx* are already assigned to the i.MX31 machine, but
> the corresponding header files include/hw/*/imx* are still missing.
>
> The file hw/misc/arm_integrator_debug.c seems to belong to Integrator
> CP, hw/cpu/realview_mpcore.c seems to belong to Real View, and
> hw/misc/mst_fpga.c seems to belong to PXA2XX.
>
> And the files hw/misc/zynq* and include/hw/misc/zynq* seem to belong
> to the Xilinx Zynq machine.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2:
>  - Added some more file
>  - Dropped hw/misc/arm_sysctl.c since it's unclear right now how to
>    represent a file that belong to multiple machines
>
>  MAINTAINERS | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8c1c0a1..7fc5c9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -107,6 +107,7 @@ S: Maintained
>  F: target-arm/
>  F: hw/arm/
>  F: hw/cpu/a*mpcore.c
> +F: include/hw/cpu/a*mpcore.h
>  F: disas/arm.c
>  F: disas/arm-a64.cc
>  F: disas/libvixl/
> @@ -408,6 +409,7 @@ M: Peter Chubb <peter.chubb@nicta.com.au>
>  L: qemu-arm@nongnu.org
>  S: Odd fixes
>  F: hw/*/imx*
> +F: include/hw/*/imx*
>  F: hw/arm/kzm.c
>  F: include/hw/arm/fsl-imx31.h
>
> @@ -416,6 +418,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/integratorcp.c
> +F: hw/misc/arm_integrator_debug.c
>
>  Musicpal
>  M: Jan Kiszka <jan.kiszka@web.de>
> @@ -440,6 +443,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/realview*
> +F: hw/cpu/realview_mpcore.c
>  F: hw/intc/realview_gic.c
>  F: include/hw/intc/realview_gic.h
>
> @@ -452,6 +456,7 @@ F: hw/arm/spitz.c
>  F: hw/arm/tosa.c
>  F: hw/arm/z2.c
>  F: hw/*/pxa2xx*
> +F: hw/misc/mst_fpga.c
>  F: include/hw/arm/pxa.h
>
>  Stellaris
> @@ -473,7 +478,8 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/xilinx_*
>  F: hw/*/cadence_*
> -F: hw/misc/zynq_slcr.c
> +F: hw/misc/zynq*
> +F: include/hw/misc/zynq*
>  X: hw/ssi/xilinx_*

For the Zynq/Xilinx part:

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

Thanks,

Alistair


>
>  Xilinx ZynqMP
> --
> 1.8.3.1
>
>
