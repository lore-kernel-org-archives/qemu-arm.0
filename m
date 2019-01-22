Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7122790wrt;
        Tue, 22 Jan 2019 03:42:09 -0800 (PST)
X-Received: by 2002:a9d:7e87:: with SMTP id m7mr23611940otp.225.1548157329785;
        Tue, 22 Jan 2019 03:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548157329; cv=none;
        d=google.com; s=arc-20160816;
        b=IudNZCzNpdaERJdw/7rdpv2hVLoFofUm+bD1ZiQk4VWsXPVCp9NjrEURGs0DkVO3JS
         wlptR3KVymPJ4ARaMOW3ETDLcNV08I7gC9cGCmy9eDJZf+IM9hIBIR0+inj3V0pHhADo
         vdIGz9diNUyK/Yu6KUswlTYYvzFMlEe6Uj0/3VKScA+l6TUBZADz62M3YVIwztN2KHO5
         USP9hvmHMS6ooaZb0espe4pKlI/K+nvY0KPGKqwrjslmMgfAIm+vlrklRMHTsSzwMnhv
         9Gga9rFOcWNKT1rN3+ECv7iboZtdUH5wS881LTcldU01/2ptY2gM6AKeuK4uMB6NCl/i
         JX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j1EUYZ6Gc7Pxh9FS2/7LoKH2JUlZ4H4npGh6+VcZK/I=;
        b=lUiSjUKCbeGFjQG7ZOHgmU4togGrMhQRMdlOIHX5SQav5u+iuAekB5L4rCRxZMSL6y
         H6epgTCJdwXLaSoXjN3JcYtvHyiL9O0UzrmfH34oIsepQTr0KSCrxw82gJAF4h9P1FCm
         hQtXpQ4RhtNssC+zy3KYJhUejAAh/vZY94hNe+Qo+iu93E0T4Mjnyn7qjYcpJFAllH6K
         2yZTQ9szs4K//v5aG55quhvoxTcxaxlzqIqB5WNViiUch4lhKZ+Vtj7fE9IpdTV9mtjX
         gXSeDf2b4jsWsj8aDvVOkfCjxj75iuRVR8sRgW5/bpJvOqfgByF/baaoafWjAgfWXJxe
         crGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4KaEebP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l82sor4406941oib.164.2019.01.22.03.42.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Jan 2019 03:42:09 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V4KaEebP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j1EUYZ6Gc7Pxh9FS2/7LoKH2JUlZ4H4npGh6+VcZK/I=;
        b=V4KaEebPo2Bs/imhNcHAiiIJkw/H3rfjfSGqEBD0rIabvPX834uorsNJFXb4L4RN2h
         ZLDQdG0QZpLz+rRZ6wj1s5IWrK9/z81E9buCX0sChBSNMUJ1H0tpTl/w0auTZelchpOw
         X6/t9BT+v4SwSyld/QD0IPIrsM2ZavzxN/s9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j1EUYZ6Gc7Pxh9FS2/7LoKH2JUlZ4H4npGh6+VcZK/I=;
        b=SH92NvOyCY1gz3Hp/QIDrg2/SJA5fJX+bHHFagd0jJ/e/nJipRH22SQaU8GtEuDgv3
         9BbzgJPkJmikYLciLCQryUZBiu44OGeL1pwpU+lMcuCb1nD/k7aIxdGEE8USpOVYcANO
         jgtaImVTSrX45GIZnxB7d6iPt4gMAwPdqKBri/68+F2mMaV7vC/EQoN8QsZKNF3p/k+M
         n7fGD+CTEEmoR792yUCnJE6xhXEYD2Sn3zOXIyRsqpklZxaTGBJNVVz3nbUYgGOFefN2
         dZSfTwELDZeLDpXv0mNHn2lEh8QeQFWkxBS8SdNrqE3c5TnzcvRBdCBiwbFwAI7drsNB
         RUJA==
X-Gm-Message-State: AJcUukdso+llNDl06PmPoyMKvV0K+SYHsj9CjQdlsZ5SgF/pvzM2v01+
	I8RU9oamPXMu0+jhjsHQDi9GHRA+0zkQAb73sgRlh0nG
X-Google-Smtp-Source: ALg8bN5vr3yLIdFVqbsGAhKWl527+c8eNvl4G1T0kEyeQizjrxy8d7PzHRMWho/5muPloYuPQMY9IvcSTvYh7C+vCPo=
X-Received: by 2002:aca:b58b:: with SMTP id e133mr8306263oif.25.1548157329290;
 Tue, 22 Jan 2019 03:42:09 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org> <1544173675-14217-2-git-send-email-hongbo.zhang@linaro.org>
In-Reply-To: <1544173675-14217-2-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Jan 2019 11:41:57 +0000
Message-ID: <CAFEAcA8WF1nKfgQWZ11GgMzgLxOtGwoJS9zyeFQkm5ii5GLrpw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] hw/arm: Add arm SBSA reference machine, skeleton part
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: tjPi/ZAxZcW8

On Fri, 7 Dec 2018 at 09:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware, for supporting
> firmware and OS development for pysical Aarch64 machines.
>
> This patch introduces new machine type 'sbsa-ref' with main features:
>  - Based on 'virt' machine type.
>  - Re-designed memory map.
>  - CPU type cortex-a57.
>  - EL2 and EL3 are enabled.
>  - GIC version 3.
>  - System bus AHCI controller.
>  - System bus XHCI controller(TBD).
>  - CDROM and hard disc on AHCI bus.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - No virtio deivces.
>  - No fw_cfg device.
>  - No ACPI table supplied.
>  - Only minimal device tree nodes.
>
> Arm Trusted Firmware and UEFI porting to this are done accordingly, and
> it should supply ACPI tables to load OS, the minimal device tree nodes
> supplied from this platform are only to pass the dynamic info reflecting
> command line input to firmware, not for loading OS.
>
> To make the review easier, this task is split into two patches, the
> fundamental sceleton part and the peripheral devices part, this patch is
> the first part.

Firstly, apologies for this having sat on my to-review queue for
so long...

> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
>  hw/arm/Makefile.objs  |   2 +-
>  hw/arm/sbsa-ref.c     | 277 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |   1 +
>  3 files changed, 279 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/sbsa-ref.c
>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index d51fcec..a8895eb 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -1,4 +1,4 @@
> -obj-y += boot.o virt.o sysbus-fdt.o
> +obj-y += boot.o virt.o sbsa-ref.o sysbus-fdt.o
>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>  obj-$(CONFIG_DIGIC) += digic_boards.o
>  obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> new file mode 100644
> index 0000000..1d6252b
> --- /dev/null
> +++ b/hw/arm/sbsa-ref.c
> @@ -0,0 +1,277 @@
> +/*
> + * ARM SBSA Reference Platform emulation
> + *
> + * Copyright (c) 2018 Linaro Limited
> + * Written by Hongbo Zhang <hongbo.zhang@linaro.org>
> + *
> + * Based on hw/arm/virt.c
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/arm/arm.h"
> +#include "hw/arm/virt.h"

This isn't the virt board, so I think it would be better if it did
not include the virt.h header or use structures/classes that are
private to the virt board. It should be its own thing.

> +#include "hw/devices.h"
> +#include "net/net.h"
> +#include "sysemu/device_tree.h"
> +#include "sysemu/numa.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/loader.h"
> +#include "exec/address-spaces.h"
> +#include "qemu/error-report.h"
> +#include "hw/pci-host/gpex.h"
> +#include "hw/arm/sysbus-fdt.h"
> +#include "hw/arm/fdt.h"
> +#include "hw/intc/arm_gic.h"
> +#include "hw/intc/arm_gicv3_common.h"
> +#include "kvm_arm.h"
> +#include "hw/ide/internal.h"
> +#include "hw/ide/ahci_internal.h"
> +#include "qemu/units.h"
> +
> +#define NUM_IRQS 256
> +
> +#define RAMLIMIT_GB 8192
> +#define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
> +
> +static const MemMapEntry sbsa_ref_memmap[] = {
> +    /* 512M boot ROM */
> +    [VIRT_FLASH] =              {          0, 0x20000000 },
> +    /* 512M secure memery */

"memory"

> +    [VIRT_SECURE_MEM] =         { 0x20000000, 0x20000000 },
> +    [VIRT_CPUPERIPHS] =         { 0x40000000, 0x00080000 },
> +    /* GIC distributor and CPU interface expansion spaces reserved */
> +    [VIRT_GIC_DIST] =           { 0x40000000, 0x00010000 },
> +    [VIRT_GIC_CPU] =            { 0x40040000, 0x00010000 },

If they're just reserved you don't really need to list them here,
as they're covered by the VIRT_CPUPERIPHS space anyway. (You
don't list the VIRT_GIC_HYP registers or VIRT_GIC_VCPU.)

> +    /* 64M redistributor space allows up to 512 CPUs */
> +    [VIRT_GIC_REDIST] =         { 0x40080000, 0x04000000 },
> +    /* Space here reserved for redistributor and vCPU/HYP expansion */
> +    [VIRT_UART] =               { 0x60000000, 0x00001000 },
> +    [VIRT_RTC] =                { 0x60010000, 0x00001000 },
> +    [VIRT_GPIO] =               { 0x60020000, 0x00001000 },
> +    [VIRT_SECURE_UART] =        { 0x60030000, 0x00001000 },
> +    [VIRT_SMMU] =               { 0x60040000, 0x00020000 },
> +    /* Space here reserved for more SMMUs */
> +    [VIRT_AHCI] =               { 0x60100000, 0x00010000 },
> +    /* Space here reserved for other devices */
> +    [VIRT_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
> +    /* 256M PCIE ECAM space */
> +    [VIRT_PCIE_ECAM] =          { 0x80000000, 0x10000000 },

Comment says 256M but the size field says it's larger...

> +    /* ~1TB for PCIE MMIO (4GB to 1024GB boundary) */
> +    [VIRT_PCIE_MMIO] =          { 0x100000000ULL, 0xFF00000000ULL },
> +    [VIRT_MEM] =                { 0x10000000000ULL, RAMLIMIT_BYTES },
> +};
> +
> +static const int sbsa_ref_irqmap[] = {
> +    [VIRT_UART] = 1,
> +    [VIRT_RTC] = 2,
> +    [VIRT_PCIE] = 3, /* ... to 6 */
> +    [VIRT_GPIO] = 7,
> +    [VIRT_SECURE_UART] = 8,
> +    [VIRT_AHCI] = 9,
> +};
> +
> +static void sbsa_ref_init(MachineState *machine)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(machine);

As noted above, I think it would be better to be your own
subclass of MachineState, rather than being a subclass of
the virt board. Is there anything that becomes particularly
awkward if you do it that way?

thanks
-- PMM
