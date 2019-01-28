Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3106361wrt;
        Mon, 28 Jan 2019 02:16:30 -0800 (PST)
X-Received: by 2002:a19:c396:: with SMTP id t144mr15798878lff.110.1548670590732;
        Mon, 28 Jan 2019 02:16:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548670590; cv=none;
        d=google.com; s=arc-20160816;
        b=r9VpZ2rBZ5DAPCV1lWFZExz8Vskm/hWgFkywg1tXFajM7+sccxGykbxSD2gGeuhQWf
         25No6U78difWA3riSCzJUeEvXjSKeCsJVNcF+NnbILNihyBfkAXCuhuSD1DC9EgDU0Et
         kIEz62WozT/ZegU7GCrIfKdvXVqWT80Br2KpSojnf/xdGYsRL0F3gAk4KOECPq3DV/QI
         jCkYRfz1sDe6n6z5KxVgBi18rhWdymuJ2Pe2xIoufb/wq8/sUigqKmBPslodzaUbPf6i
         Ho1zX5Gf7iVZgCaWNk2x+zyRJwT14PupTBU2YvjAxhJqL9zWwyvSsuUdG0+fQXdYix+J
         f7Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9rwvsE2a4ArzC5Jifuk+usO9EQdOK5vX0GwVL9FwpaY=;
        b=Xc5qIFqJ9uYqhH0xuucIW7NE1sJS9xgCPr6cD51lAhqE7ft/qF2GVnIFIKK9VuDSa/
         jFGwmlNis18dnADrB5/oZpP6YXcAOYLZYtJ6qnXxQsta6H1FIjsDZ4kFf7Fj/pq9Z6yb
         YiIUEAccCxyqYKIfUT+FJlMojm88nYmEUfysx+cLmX9HgvfYRwj+nLYO388c0pUX87KO
         4QhdDz58TqZTgXBuM63IgK6/sSZfJigLDKbdxD4Q5U2jImcnkej8pW8eBHkHW4kMiOxE
         BN7bn4WAfVJ8o9Hj197JwrtvVIZmSb/9MWeQpTT2WtDPnCvTStj4wa3+M3gErwpS3hEq
         LKYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iXtyI1S3;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v12-v6sor8688152ljg.30.2019.01.28.02.16.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Jan 2019 02:16:30 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iXtyI1S3;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9rwvsE2a4ArzC5Jifuk+usO9EQdOK5vX0GwVL9FwpaY=;
        b=iXtyI1S3CqvLp2UFg1ohS//VbFkVaj4Sn3Qn3WdMCN57L0voTOQDptdz4AyiWGbWfw
         0r7r7u9wmN0TKtSf2aXw/GE48xzVOiHAo2rQKZpLR4GRnyi7F3pxhRB9v/lK2NdesvYy
         pkrn9/IVYSJasVzbPja7Sp+0UoyijyghowGgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9rwvsE2a4ArzC5Jifuk+usO9EQdOK5vX0GwVL9FwpaY=;
        b=oEpp0rr84ddgNK4FHuzfcU2EZBJbc/0tZOGYWTnBny9uBa0bpiDXGuKEn4khZhl+XM
         lgT9ScQIidxRvyN3NsWmfTJDuBFyTq62kkpkA7NQdRWsfdFQmwwM4aR1997pdVNij6LT
         NVwIJtetl1+T4ZePa/3OfhU8/CXLPn3QEY0Sciks2uUiP8aM+uswo7CEVD9XXwmtPDHU
         RTmRq+G4sGzbRdvogzvES/bFXjf9wq75y5BLjFLdPSObfY2QoxnqWeGF7/iP+he9o8tq
         ZGa/6XDLv49u2YmM/XqeZKYpUvatQc4zixTtwDhAxB41LcVuvxCmt6wU84cOMCLzRUsN
         zrNQ==
X-Gm-Message-State: AJcUukePC0QQ7RELiIqDwGY57YGq4T+dR9Wcbq9OggGk1HlI77LFFAfr
	2A8XZhjHcOPheOkCu3h5bc4zmtSzX8MK78N6eJlaVrtj
X-Google-Smtp-Source: ALg8bN4Vrmos+ShTi+BAKz/Ph3fzp50vJkPp9Sz5qba1gRj9JbqvZKngraL4DHq/YYSixXR+dQM6QLsIVtGLWFBdif4=
X-Received: by 2002:a2e:9747:: with SMTP id f7-v6mr11592504ljj.70.1548670590207;
 Mon, 28 Jan 2019 02:16:30 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
 <1544173675-14217-2-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA8WF1nKfgQWZ11GgMzgLxOtGwoJS9zyeFQkm5ii5GLrpw@mail.gmail.com>
In-Reply-To: <CAFEAcA8WF1nKfgQWZ11GgMzgLxOtGwoJS9zyeFQkm5ii5GLrpw@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Mon, 28 Jan 2019 18:16:18 +0800
Message-ID: <CAHmQWvD-gqxR+7dOG3BKA-5cGA-JBb4SAfJWpRAtqrOkfRw-kw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] hw/arm: Add arm SBSA reference machine, skeleton part
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5WXMpZZCOjb+

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
Understand, it is OK, thanks for review.

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
Oops :(

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
Yes, this can be removed.

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
I calculated, 256M should be 0x10000000, 7 zeros.

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
Just wanted to save code lines since this board derives from virt.
It is fine to have its own header file, will do that.

> thanks
> -- PMM
