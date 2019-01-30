Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5413814wrt;
        Wed, 30 Jan 2019 00:59:36 -0800 (PST)
X-Received: by 2002:ac2:4116:: with SMTP id b22mr22220743lfi.19.1548838776476;
        Wed, 30 Jan 2019 00:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548838776; cv=none;
        d=google.com; s=arc-20160816;
        b=OzrC2ZC3O7JHbTU7z7mHUFUPSky8iYgjdfDFv8dhJd29dG62RzSP9eeTl7wIZKDA7z
         tw4DtwO8Iv1mOyUkOUt2T1kcZTxOJjkKTwEWV3bermkGfZ1911YOgS+XvvAxayvvXeIX
         ZRyUV5kzhOTb4HCrwMKXWPapboB95vZos+sWTu7HiSeTFEBlomNo8fdUL0yue5gJmQWl
         d2AU5oj94VYVMcJihrdn0JFz9P1EjeQZRPfvcz4M3V6NK3kIlZv6GEdlpxwYgBugwQam
         8KBSrGn+6OOFJyP/wQ+Asy0cO2yVKUSuMEG64wApC8FzeKS6x4cT51CPgoBnBxSPrr9n
         s0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U0gKqsk39N2Oqf6dSWTFD5JOFNKblKEC78umBW4RXFU=;
        b=odsrR4Q6EyUqSOa0uptr8JaNcVMgZBtqmd8zN5zhZx4yT62Y/0FEvheFG1o/k4m5Tm
         jdPvg3XBWpMhJTwySAB1SnF+skhGk5sJHdj/mjV5B0+D5J5K6uWiw6aVf9lQPTW//Amr
         YkLZNa+AUnjjR3UnWOy+zmdH/LKyzvS9c7A2BxqrF/Km6wyCv3uTLF8I9y7eFMlJk1+w
         YgBtzYktYLN1iYmI2QOIYjMEQKWHZGayJwEABB6/GCwgcP4p96GYRgc8tVMFWSM/N+no
         ibtOtWMzYlPWDi+dBKbP+Ygq0UFY9l8NOe9BYYGw52EttTH+VgZ9UsX0DTLMIeP/w0LC
         4csw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FHO5QYVs;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c82sor246214lfg.7.2019.01.30.00.59.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Jan 2019 00:59:36 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FHO5QYVs;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U0gKqsk39N2Oqf6dSWTFD5JOFNKblKEC78umBW4RXFU=;
        b=FHO5QYVsB6FxtRXsEdQ2gmG9mtSDJetzXL3t8jvFujksJl47iwrw/pmQN+ajdlSKrs
         gGOOLOiKg4EXMFGnwjF1Ej6u6kJ6IJJXb1J1NUxN+DRA54k5E+LLPCI6nd3iruyEV9VT
         dvtcxpg1zjtcOgvg4a72A5YB1fyRUXBHHU6D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U0gKqsk39N2Oqf6dSWTFD5JOFNKblKEC78umBW4RXFU=;
        b=fJxmq4ydSRTLgf/MaQO7zsns9iatA1++Xn7/gnUJSY61GPJowRF726vyoIW8lACd/3
         bEJxhgvEwj1VYsLTQ8vB6P/aZ4qAla19EmEOJ+bvswZoXYEQgCYLi6TggKk5Mg6ZLDQh
         G8p1T93Hhi74rlNt1SISa+ZFH0tyLIB3uVTG0Akt1o7unt2RYeSCSZHHtBztpfppL30T
         5pdcr6/URcN3EKyjT3Hr3aEw6PESrgSheFlG+Qdem9CZc8rcPZ3lIRBiu8cxKNlmEsWO
         lNOM/UgAuZX3oUQUX4/n/wxTaQAvdJJWluSQ6paR3deLxI0yk1K9qhNaH5jw/wFuWnDd
         uD2Q==
X-Gm-Message-State: AJcUukeDFekfi6ZfQ6Snga2A71CL7MyuR9yNcGB1334VWF+ECdLKehew
	BquZGUTMMnRCl1iKFfMl2w3L9wAI77pBTG4T/t8Yua5q9xSeALzN
X-Google-Smtp-Source: ALg8bN5LUh/DUuR9xyTBs7Lsx/v+xNdMmgH//B1+vHzxcMNXimyajpZlPsT3EF5zcoY+a8rGRjfdVxvkw9LmAjjM8VI=
X-Received: by 2002:a19:d486:: with SMTP id l128mr22945071lfg.114.1548838776023;
 Wed, 30 Jan 2019 00:59:36 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
 <1544173675-14217-2-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA8WF1nKfgQWZ11GgMzgLxOtGwoJS9zyeFQkm5ii5GLrpw@mail.gmail.com>
In-Reply-To: <CAFEAcA8WF1nKfgQWZ11GgMzgLxOtGwoJS9zyeFQkm5ii5GLrpw@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 30 Jan 2019 16:59:24 +0800
Message-ID: <CAHmQWvCRfcP1z01OD4_EWVz6nYoYgvDiQKiQJ0puxGGreJchHA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] hw/arm: Add arm SBSA reference machine, skeleton part
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: DzGGezvHNDgZ

On Tue, 22 Jan 2019 at 19:42, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 7 Dec 2018 at 09:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > run on KVM and execute virtualization workloads, but we need an
> > environment as faithful as possible to physical hardware, for supporting
> > firmware and OS development for pysical Aarch64 machines.
> >
> > This patch introduces new machine type 'sbsa-ref' with main features:
> >  - Based on 'virt' machine type.
> >  - Re-designed memory map.
> >  - CPU type cortex-a57.
> >  - EL2 and EL3 are enabled.
> >  - GIC version 3.
> >  - System bus AHCI controller.
> >  - System bus XHCI controller(TBD).
> >  - CDROM and hard disc on AHCI bus.
> >  - E1000E ethernet card on PCIE bus.
> >  - VGA display adaptor on PCIE bus.
> >  - No virtio deivces.
> >  - No fw_cfg device.
> >  - No ACPI table supplied.
> >  - Only minimal device tree nodes.
> >
> > Arm Trusted Firmware and UEFI porting to this are done accordingly, and
> > it should supply ACPI tables to load OS, the minimal device tree nodes
> > supplied from this platform are only to pass the dynamic info reflecting
> > command line input to firmware, not for loading OS.
> >
> > To make the review easier, this task is split into two patches, the
> > fundamental sceleton part and the peripheral devices part, this patch is
> > the first part.
>
> Firstly, apologies for this having sat on my to-review queue for
> so long...
>
> > Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> > ---
> >  hw/arm/Makefile.objs  |   2 +-
> >  hw/arm/sbsa-ref.c     | 277 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/hw/arm/virt.h |   1 +
> >  3 files changed, 279 insertions(+), 1 deletion(-)
> >  create mode 100644 hw/arm/sbsa-ref.c
> >
> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > index d51fcec..a8895eb 100644
> > --- a/hw/arm/Makefile.objs
> > +++ b/hw/arm/Makefile.objs
> > @@ -1,4 +1,4 @@
> > -obj-y += boot.o virt.o sysbus-fdt.o
> > +obj-y += boot.o virt.o sbsa-ref.o sysbus-fdt.o
> >  obj-$(CONFIG_ACPI) += virt-acpi-build.o
> >  obj-$(CONFIG_DIGIC) += digic_boards.o
> >  obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > new file mode 100644
> > index 0000000..1d6252b
> > --- /dev/null
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -0,0 +1,277 @@
> > +/*
> > + * ARM SBSA Reference Platform emulation
> > + *
> > + * Copyright (c) 2018 Linaro Limited
> > + * Written by Hongbo Zhang <hongbo.zhang@linaro.org>
> > + *
> > + * Based on hw/arm/virt.c
> > + *
> > + * This program is free software; you can redistribute it and/or modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "hw/arm/arm.h"
> > +#include "hw/arm/virt.h"
>
> This isn't the virt board, so I think it would be better if it did
> not include the virt.h header or use structures/classes that are
> private to the virt board. It should be its own thing.
>
> > +#include "hw/devices.h"
> > +#include "net/net.h"
> > +#include "sysemu/device_tree.h"
> > +#include "sysemu/numa.h"
> > +#include "sysemu/sysemu.h"
> > +#include "hw/loader.h"
> > +#include "exec/address-spaces.h"
> > +#include "qemu/error-report.h"
> > +#include "hw/pci-host/gpex.h"
> > +#include "hw/arm/sysbus-fdt.h"
> > +#include "hw/arm/fdt.h"
> > +#include "hw/intc/arm_gic.h"
> > +#include "hw/intc/arm_gicv3_common.h"
> > +#include "kvm_arm.h"
> > +#include "hw/ide/internal.h"
> > +#include "hw/ide/ahci_internal.h"
> > +#include "qemu/units.h"
> > +
> > +#define NUM_IRQS 256
> > +
> > +#define RAMLIMIT_GB 8192
> > +#define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
> > +
> > +static const MemMapEntry sbsa_ref_memmap[] = {
> > +    /* 512M boot ROM */
> > +    [VIRT_FLASH] =              {          0, 0x20000000 },
> > +    /* 512M secure memery */
>
> "memory"
>
> > +    [VIRT_SECURE_MEM] =         { 0x20000000, 0x20000000 },
> > +    [VIRT_CPUPERIPHS] =         { 0x40000000, 0x00080000 },
> > +    /* GIC distributor and CPU interface expansion spaces reserved */
> > +    [VIRT_GIC_DIST] =           { 0x40000000, 0x00010000 },
> > +    [VIRT_GIC_CPU] =            { 0x40040000, 0x00010000 },
>
> If they're just reserved you don't really need to list them here,
> as they're covered by the VIRT_CPUPERIPHS space anyway. (You
> don't list the VIRT_GIC_HYP registers or VIRT_GIC_VCPU.)
>
We need more consideration here.
Why CPUPERIPHS is used to cover DIST and CPU interface? is this from
some old platform? I don't see the term in GICv3 memory map in the
user manual, so do we still need it for this Arm64 GICv3?
If we only list CPUPERIPHS but without DIST, I am afraid firmware or
driver developer still looking for the term of DIST for base address.

For GICv3, what we can have are DIST, CPU, REDIST, VCPU and HYP.
CPU, VCPU and HYP are not simulated for GICv3 (curious it still works
without CPU interface emulated), so we only have DIST and REDIST.
Can we only list the DIST and REDIST without CPUPERIPHS?

> > +    /* 64M redistributor space allows up to 512 CPUs */
> > +    [VIRT_GIC_REDIST] =         { 0x40080000, 0x04000000 },
> > +    /* Space here reserved for redistributor and vCPU/HYP expansion */
> > +    [VIRT_UART] =               { 0x60000000, 0x00001000 },
> > +    [VIRT_RTC] =                { 0x60010000, 0x00001000 },
> > +    [VIRT_GPIO] =               { 0x60020000, 0x00001000 },
> > +    [VIRT_SECURE_UART] =        { 0x60030000, 0x00001000 },
> > +    [VIRT_SMMU] =               { 0x60040000, 0x00020000 },
> > +    /* Space here reserved for more SMMUs */
> > +    [VIRT_AHCI] =               { 0x60100000, 0x00010000 },
> > +    /* Space here reserved for other devices */
> > +    [VIRT_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
> > +    /* 256M PCIE ECAM space */
> > +    [VIRT_PCIE_ECAM] =          { 0x80000000, 0x10000000 },
>
> Comment says 256M but the size field says it's larger...
>
> > +    /* ~1TB for PCIE MMIO (4GB to 1024GB boundary) */
> > +    [VIRT_PCIE_MMIO] =          { 0x100000000ULL, 0xFF00000000ULL },
> > +    [VIRT_MEM] =                { 0x10000000000ULL, RAMLIMIT_BYTES },
> > +};
> > +
> > +static const int sbsa_ref_irqmap[] = {
> > +    [VIRT_UART] = 1,
> > +    [VIRT_RTC] = 2,
> > +    [VIRT_PCIE] = 3, /* ... to 6 */
> > +    [VIRT_GPIO] = 7,
> > +    [VIRT_SECURE_UART] = 8,
> > +    [VIRT_AHCI] = 9,
> > +};
> > +
> > +static void sbsa_ref_init(MachineState *machine)
> > +{
> > +    VirtMachineState *vms = VIRT_MACHINE(machine);
>
> As noted above, I think it would be better to be your own
> subclass of MachineState, rather than being a subclass of
> the virt board. Is there anything that becomes particularly
> awkward if you do it that way?
>
> thanks
> -- PMM
