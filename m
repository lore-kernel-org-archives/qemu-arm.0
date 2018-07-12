Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1452590wrq;
        Thu, 12 Jul 2018 07:43:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe5GpDclbbvTmxWHBmFkcRjxsDDYoOd0oJ2pJOFuvQjtzdMaRcGS6JHl1CQnHX8nw0/uaOn
X-Received: by 2002:ac8:35c8:: with SMTP id l8-v6mr2171412qtb.409.1531406617413;
        Thu, 12 Jul 2018 07:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531406617; cv=none;
        d=google.com; s=arc-20160816;
        b=A6AaWzpSFykOK7JpNynv2KMIBc2EaaTOS04uoAdHRiH5YKZVS1LNX/QJ81Wk3yT+9Y
         LY4kuYIWjpaiZze8DZMV+VQHhBVfRQVxHsNwurHHf0/Ss3EfYPQQd5viRCGSk/3fhvXT
         b74CeyI+3JH5fJCBC1Pjt/zaWQmG9WcwYH4W9k2u70xFtTfbAlhmTAiostITy2MiAtQH
         B2YXcRaf30xanJru4VlqrTrZNOb7KwlmOvuKIOYmH/DezSKtVElrdoUX0fp5/HSPJdOA
         KwWkZ73n78pEQNPFSkBIbGq+zMSJ5x3ySkhUCKIX8uIe5PowAxUkb9RaoVyYRw8vdaan
         3Low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ARNb8T2kykYCwU2ViBxWblg10vVtSSkjvVJAhqxTpgk=;
        b=BhXgOjYHOsNOkx4M04iZwmKGf0TuVqXspVxN9FBfJuuDIqPItyxc61cDnNnTmQ0X8F
         yLM9u26C+tKNG1n2DRqTAPpcYSNgMeVJV3xYwc0tL59wqu0/IeV0VHBuei7Yju43w0n6
         A49y1nBllTbP6frrXO3UTwtoNXFHYkTtp+C9qDu/LtTglZMDWCJZZMBnFSXYxoz60QJN
         mUkPw2/RRjmDz0p71rrIDYue4DISVx6AN2aepLE2NAjLIpqhjShIvYIMjZF3u0Nti0Ci
         8jZtj2gXn/xNTZOkydLhHmRz+USQZpTJFGIzK+OzxLbWepajGXvmGjAn5jrbGhXm3v4r
         EfaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HU0aRBun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d62-v6si9938303qkg.74.2018.07.12.07.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 07:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HU0aRBun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdcoi-00066S-VB
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 10:43:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdcoY-00066H-MB
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 10:43:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdcoX-0004xd-IV
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 10:43:26 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:40159)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdcoX-0004xE-BJ
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 10:43:25 -0400
Received: by mail-oi0-x241.google.com with SMTP id w126-v6so56220088oie.7
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 07:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ARNb8T2kykYCwU2ViBxWblg10vVtSSkjvVJAhqxTpgk=;
	b=HU0aRBun6IjyoUiiRCgyNUius9aPJFxPkbMcXaBHt/CjsZZipD57vh+KQk+rpkVEbt
	BSxLIqnxxXQ8OFkeNQ/QfT6p8PXCLM2Xc0/Cj3yP+fBjosyyR53n6mclRUCzChc06Urr
	MckDp5BGUEe/LHTmz4rz122fuHiLz0DDMxw0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ARNb8T2kykYCwU2ViBxWblg10vVtSSkjvVJAhqxTpgk=;
	b=iCwzV1aPU0hdS1xuJHzVuy1q4q1A2VRylrzv6aq0bxbodZGIrvnL5WTCCeIO+a78ts
	msKXcor44i9sAW9xAaGnDnPderjtnwG2KaYPlJS/0BLED+sKC0DUviVBbujtyuFEbx8a
	FAUc5aAbIwfqMZQj2glq/ozJ0mtt1DjJa7ssIl3KHt/s+Q+NbHPKSfteV12ms7dN8pMl
	Kx2nLCxlcVRD0feiSo19FhNAbDfXlga6h+sTqksa1BZycp6Q5vJVm4EolCAHSk7YJz6z
	eA213NRGTOHNDV2PfCv3GO6uSnpEo4p+bEnHO3xcLi+UJE0vymO76iMJa/3sNLeFHmS2
	4CEg==
X-Gm-Message-State: AOUpUlEiqWp3ABfq6NDjQbsBQBaK7Vz7Ot097/vG1aAk3GmHLsfChfMg
	6SdmWSXpOd8Gsm7/OSgcepb9W0E90DLbN06z70955A==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr2851327oih.102.1531406604454; 
	Thu, 12 Jul 2018 07:43:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 07:43:04
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-21-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-21-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 15:43:04 +0100
Message-ID: <CAFEAcA-=nMs7NeVSkCzcs-Wp=nVr9kDrApoKHK7FT--vZQM82A@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 20/20] arm/virt: Add support for GICv2
 virtualization extensions
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PvT7vbzyuAPo

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Add support for GICv2 virtualization extensions by mapping the necessary
> I/O regions and connecting the maintenance IRQ lines.
>
> Declare those additions in the device tree and in the ACPI tables.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  hw/arm/virt-acpi-build.c |  4 ++++
>  hw/arm/virt.c            | 50 +++++++++++++++++++++++++++++++++-------
>  include/hw/arm/virt.h    |  3 +++
>  3 files changed, 49 insertions(+), 8 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6ea47e2588..3b74bf0372 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -659,6 +659,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          gicc->length = sizeof(*gicc);
>          if (vms->gic_version == 2) {
>              gicc->base_address = cpu_to_le64(memmap[VIRT_GIC_CPU].base);
> +            gicc->gich_base_address = cpu_to_le64(memmap[VIRT_GIC_HYP].base);
> +            gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
>          }
>          gicc->cpu_interface_number = cpu_to_le32(i);
>          gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
> @@ -670,6 +672,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          }
>          if (vms->virt && vms->gic_version == 3) {
>              gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV3_MAINT_IRQ));
> +        } else if (vms->virt && vms->gic_version == 2) {
> +            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV2_MAINT_IRQ));

The maintenance interrupt number is the same for GICv2 and v3, so
this seems a bit unnecessary -- we can just rename the constant to
ARCH_GIC_MAINT_IRQ and not condition it on the GIC version at all.

>          }
>      }
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 742f68afca..e45b9de3be 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -131,6 +131,8 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
>      [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
>      [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
> +    [VIRT_GIC_HYP] =            { 0x08030000, 0x00001000 },
> +    [VIRT_GIC_VCPU] =           { 0x08040000, 0x00001000 },

This is too small a size -- it doesn't include the GICV_DIR.
I would recommend making both of these sized 0x10000, ie a full
64K page. We don't want to have anything else in there for the
case where we're using 64K pages on a 64-bit guest CPU.

>      /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
>      [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
>      /* This redistributor space allows up to 2*64kB*123 CPUs */
> @@ -438,11 +440,26 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>          /* 'cortex-a15-gic' means 'GIC v2' */
>          qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
>                                  "arm,cortex-a15-gic");
> -        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
> -                                      2, vms->memmap[VIRT_GIC_DIST].base,
> -                                      2, vms->memmap[VIRT_GIC_DIST].size,
> -                                      2, vms->memmap[VIRT_GIC_CPU].base,
> -                                      2, vms->memmap[VIRT_GIC_CPU].size);
> +        if (!vms->virt) {
> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
> +                                         2, vms->memmap[VIRT_GIC_CPU].base,
> +                                         2, vms->memmap[VIRT_GIC_CPU].size);
> +        } else {
> +            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
> +                                         2, vms->memmap[VIRT_GIC_DIST].base,
> +                                         2, vms->memmap[VIRT_GIC_DIST].size,
> +                                         2, vms->memmap[VIRT_GIC_CPU].base,
> +                                         2, vms->memmap[VIRT_GIC_CPU].size,
> +                                         2, vms->memmap[VIRT_GIC_HYP].base,
> +                                         2, vms->memmap[VIRT_GIC_HYP].size,
> +                                         2, vms->memmap[VIRT_GIC_VCPU].base,
> +                                         2, vms->memmap[VIRT_GIC_VCPU].size);
> +            qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
> +                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV2_MAINT_IRQ,
> +                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);

You'll find this needs to be fixed up a bit when rebased on current master.

> +        }
>      }

thanks
-- PMM
