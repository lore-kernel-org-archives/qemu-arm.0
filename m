Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6860588wrt;
        Thu, 31 Jan 2019 05:21:19 -0800 (PST)
X-Received: by 2002:a0d:cc51:: with SMTP id o78mr33343294ywd.33.1548940879326;
        Thu, 31 Jan 2019 05:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548940879; cv=none;
        d=google.com; s=arc-20160816;
        b=l+/D6Jqn+d9LfUtF40lHW/6TeJ4Epg1rFY2KX3VFUo28b///FomlvoRWA03pn03aAf
         h7wMbsE7+W9X9i/yXlRf15qQubR5Gp6zM6+17NYGZIdGyOuJndMLrs8ckosiA5ICd7Pg
         GY5SOKLun1YdCGJx/ZAg7hjsmUdXRPjlg+n3LQuBmMJPbnzpMOCSfNfXkC/MLmD0yBRi
         ukXO/ImMx0XbAZ2SYRu1fCwaF72WzdXRacsXbWXFkUYOkZnBwOYu6rQbSOlH5ip+lckt
         7Qpxws0WVvCTmYiQ79ck1wVGmOdZXImf6ujWTj5DVzUMlCyeMIXvuw5piJhqm/a8IrB4
         CV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zPYzdes4eFbDjNYSQHbFFQeMEAYq/kEE8zvq7XRyvfY=;
        b=Xm+DxJoFOPh3BhStuDzl1Hgqp8/qOZyc0I58dwwkJNLFNCaO1fLv7mQlfLedHpp0nD
         f+2+iikeZjLphiqh9voDY/Yh9SjNIFjJwBcBIlTn6XySv0tFARU7GxJUHXTpsZl8VbqY
         bDDvD4oMKmQT3BoQlSXliWlZJVEYm6HA6ppTbIOuWsn8OcobopRie+M4/g8jGNFmWpkj
         L6Y2UhjmYkTVcVNaYUVgBNDSY88dqMALMzWSGlpba3JT6pBIy4YooKIzFyvByKnxRVRX
         RGLmoq98CTtIl0EVH8lzx0Yz758TTFaSgNiqrULS/1ZOtBR46wxRhD8B5Ueujbj23yJ5
         pcRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPgQzuMT;
       spf=pass (google.com: domain of radoslaw.biernacki@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=radoslaw.biernacki@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <radoslaw.biernacki@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d4sor614261ywg.133.2019.01.31.05.21.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Jan 2019 05:21:19 -0800 (PST)
Received-SPF: pass (google.com: domain of radoslaw.biernacki@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPgQzuMT;
       spf=pass (google.com: domain of radoslaw.biernacki@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=radoslaw.biernacki@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zPYzdes4eFbDjNYSQHbFFQeMEAYq/kEE8zvq7XRyvfY=;
        b=dPgQzuMT+9njTgC60soz1tILPLWDsNCIMlKRXhZbcsujDYNo//m9T0jRUL4u8dnBU5
         mwS9UGEjcE4QvY+SViqibJuqktYfJgtWDAaHR7d0UDC8e6iO5t/zSMfuZeKYSjXKailP
         QNI0YtZd1v5HZgABMTSbemdhm9bUbY8TxJn68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zPYzdes4eFbDjNYSQHbFFQeMEAYq/kEE8zvq7XRyvfY=;
        b=WMgyJLxu0TNcQZ5Ijw8OtjLebS009gqN20TV7EXojoWVCqZ2U1L2Dl/NVSYZAun6zt
         tYypAwjWLnf+019dJ4QZd8l5oygVCO1pgCEmD4ox+sHf8aT79LfaIE0sAzmQXooh9e0Y
         3PnH9R96f8khi+n5Zt1N0xTPI/GHpr4AkEC9kfPNh56Go/+6MPxx9gASI/+A97UXw+7A
         rdvdcfMkXPOGF/jk/IBNCyMZqy6DcvhMzhf0s/HdUz5Z+8U1cwwDJ7ahyQybq1VGMsfU
         DTOVm2yt3VN6tUWYDoWOKZfChCokwpPjbwVwMfxhKw0fjyBxNw06okznhRbZuZKKFh/8
         biRQ==
X-Gm-Message-State: AJcUukdPNhasT7hSBrXBM8N8n/VNwKRbEVciF7SQdpCqACUubn7gavUD
	gemI4LRKeisGqJbSfbTrDQi3yuTlCz2ez57CDOb8+ikk
X-Google-Smtp-Source: ALg8bN7rPClEEwTTaoCCNRVKrNMgmLnqc88R8selF9zB6blXXhpDbevy64IxyfX8rSGrZTnT9Os0ezLLaGFmHBdZOac=
X-Received: by 2002:a0d:fcc6:: with SMTP id m189mr34101423ywf.71.1548940878430;
 Thu, 31 Jan 2019 05:21:18 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAKv+Gu-cd46e=+kKttkeTuprj8Y_jHfVwsiNceqtGfbsR=JEnA@mail.gmail.com>
 <CAHmQWvCHV-X2P2UORRurdg+JOCC0MOz9KsnjgA2cK7spbnZ-vQ@mail.gmail.com> <CAKv+Gu_EXP5NDQmmMCRw5vEa2=hm+89RsCHCx4yE53Ae-0Xa=w@mail.gmail.com>
In-Reply-To: <CAKv+Gu_EXP5NDQmmMCRw5vEa2=hm+89RsCHCx4yE53Ae-0Xa=w@mail.gmail.com>
From: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Date: Thu, 31 Jan 2019 14:21:07 +0100
Message-ID: <CAEK-wKnWAOtfTKffvj1xuoj0iXTmnn4sQ20ooV9a+0+OsrWmuA@mail.gmail.com>
Subject: Re: [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, Graeme Gregory <graeme.gregory@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d662210580c0e642"
X-TUID: 0Z3FVXEcnv7h

--000000000000d662210580c0e642
Content-Type: text/plain; charset="UTF-8"

Hongbo,

Take a look at last patch in: ssh://
git@git.linaro.org/people/radoslaw.biernacki/qemu.git
branch wip_rad_new_memmap

On Wed, 30 Jan 2019 at 09:37, Ard Biesheuvel <ard.biesheuvel@linaro.org>
wrote:

> On Wed, 30 Jan 2019 at 09:34, Hongbo Zhang <hongbo.zhang@linaro.org>
> wrote:
> >
> > On Tue, 29 Jan 2019 at 19:29, Ard Biesheuvel <ard.biesheuvel@linaro.org>
> wrote:
> > >
> > > Responding to an old thread ...
> > >
> > > On Thu, 15 Nov 2018 at 17:05, Peter Maydell <peter.maydell@linaro.org>
> wrote:
> > > >
> > > > On 19 October 2018 at 09:55, Hongbo Zhang <hongbo.zhang@linaro.org>
> wrote:
> > > > > For the Aarch64, there is one machine 'virt', it is primarily
> meant to
> > > > > run on KVM and execute virtualization workloads, but we need an
> > > > > environment as faithful as possible to physical hardware, for
> supporting
> > > > > firmware and OS development for pysical Aarch64 machines.
> > > > >
> > > > > This patch introduces new machine type 'sbsa-ref' with main
> features:
> > > > >  - Based on 'virt' machine type.
> > > > >  - CPU type cortex-a57.
> > > > >  - EL2 and EL3 are enabled by default.
> > > > >  - GIC version 3 only.
> > > > >  - Re-designed memory map.
> > > > >  - AHCI controller attached to system bus.
> > > > >  - EHCI controller attached to system bus.
> > > > >  - CDROM and hard disc on AHCI bus.
> > > > >  - USB mouse and key board.
> > > > >  - E1000E ethernet card on PCIE bus.
> > > > >  - VGA display adaptor on PCIE bus.
> > > > >  - No virtio deivces.
> > > > >  - No paravirtualized fw_cfg device.
> > > > >  - No ACPI table supplied.
> > > > >  - Only minimal device tree nodes.
> > > > >
> > > > > Arm Trusted Firmware and UEFI porting to this are done accordingly.
> > > > >
> > > > > Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> > > >
> > > > Hi; I've had a quick run through this patch. My comments
> > > > below are mostly about there still being a lot of code
> > > > here which has been copied from virt.c but which you do
> > > > not need.
> > > >
> > > > If after you've done that this patch is still more than
> > > > about 500 lines long, I would recommend that you split it
> > > > up into coherent pieces, to make it easier to review.
> > > >
> > > > > ---
> > > > >  hw/arm/Makefile.objs  |   2 +-
> > > > >  hw/arm/sbsa-ref.c     | 937
> ++++++++++++++++++++++++++++++++++++++++++++++++++
> > > > >  include/hw/arm/virt.h |   2 +
> > > > >  3 files changed, 940 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 hw/arm/sbsa-ref.c
> > > > >
> > > > > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > > > > index d51fcec..a8895eb 100644
> > > > > --- a/hw/arm/Makefile.objs
> > > > > +++ b/hw/arm/Makefile.objs
> > > > > @@ -1,4 +1,4 @@
> > > > > -obj-y += boot.o virt.o sysbus-fdt.o
> > > > > +obj-y += boot.o virt.o sbsa-ref.o sysbus-fdt.o
> > > > >  obj-$(CONFIG_ACPI) += virt-acpi-build.o
> > > > >  obj-$(CONFIG_DIGIC) += digic_boards.o
> > > > >  obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
> > > > > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > > > > new file mode 100644
> > > > > index 0000000..28ebb3a
> > > > > --- /dev/null
> > > > > +++ b/hw/arm/sbsa-ref.c
> > > > > @@ -0,0 +1,937 @@
> > > > > +/*
> > > > > + * ARM SBSA Reference Platform emulation
> > > > > + *
> > > > > + * Copyright (c) 2018 Linaro Limited
> > > > > + * Written by Hongbo Zhang <hongbo.zhang@linaro.org>
> > > > > + *
> > > > > + * Based on hw/arm/virt.c
> > > > > + *
> > > > > + * This program is free software; you can redistribute it and/or
> modify it
> > > > > + * under the terms and conditions of the GNU General Public
> License,
> > > > > + * version 2 or later, as published by the Free Software
> Foundation.
> > > > > + *
> > > > > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > > > > + * ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or
> > > > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > > > > + * more details.
> > > > > + *
> > > > > + * You should have received a copy of the GNU General Public
> License along with
> > > > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > > > + */
> > > > > +
> > > > > +#include "qemu/osdep.h"
> > > > > +#include "qapi/error.h"
> > > > > +#include "hw/arm/virt.h"
> > > > > +#include "hw/devices.h"
> > > > > +#include "net/net.h"
> > > > > +#include "sysemu/device_tree.h"
> > > > > +#include "sysemu/numa.h"
> > > > > +#include "hw/loader.h"
> > > > > +#include "qemu/error-report.h"
> > > > > +#include "hw/pci-host/gpex.h"
> > > > > +#include "hw/arm/sysbus-fdt.h"
> > > > > +#include "hw/arm/fdt.h"
> > > > > +#include "hw/intc/arm_gic.h"
> > > > > +#include "hw/intc/arm_gicv3_common.h"
> > > > > +#include "kvm_arm.h"
> > > > > +#include "hw/ide/internal.h"
> > > > > +#include "hw/ide/ahci_internal.h"
> > > > > +#include "hw/usb.h"
> > > > > +#include "qemu/units.h"
> > > > > +
> > > > > +#define NUM_IRQS 256
> > > > > +
> > > > > +#define SATA_NUM_PORTS 6
> > > > > +
> > > > > +#define RAMLIMIT_GB 255
> > > > > +#define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
> > > >
> > > > You probably don't want to stick yourself with the same
> > > > ram limits that the virt board has, especially since you
> > > > don't need to care about AArch32. Strongly consider
> > > > putting the RAM somwhere that lets you get up to a
> > > > maximum value that matches what we might expect in
> > > > server-class hardware.
> > > >
> > > > > +
> > > > > +static const MemMapEntry sbsa_ref_memmap[] = {
> > > > > +    /* Space up to 0x8000000 is reserved for a boot ROM */
> > > > > +    [VIRT_FLASH] =              {          0, 0x08000000 },
> > > > > +    [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
> > > > > +    /* GIC distributor and CPU interfaces sit inside the CPU
> peripheral space */
> > > > > +    [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
> > > > > +    [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
> > > > > +    /* The space in between here is reserved for GICv3
> CPU/vCPU/HYP */
> > > > > +    /* This redistributor space allows up to 2*64kB*123 CPUs */
> > > >
> > > > You don't need to do the split-redistributor layout that
> > > > "virt" does because you have no backwards compatibility
> > > > concerns. So make the space for redistributors big enough
> > > > to fit more CPUs in (at least 512, or more if you expect
> > > > this board to be used in future for development of a
> > > > software stack that handles more).
> > > >
> > > > > +    [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
> > > > > +    [VIRT_UART] =               { 0x09000000, 0x00001000 },
> > > > > +    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
> > > > > +    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> > > > > +    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> > > > > +    [VIRT_AHCI] =               { 0x09050000, 0x00010000 },
> > > > > +    [VIRT_EHCI] =               { 0x09060000, 0x00010000 },
> > > > > +    [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
> > > > > +    [VIRT_PCIE_MMIO] =          { 0x10000000, 0x7fff0000 },
> > > > > +    [VIRT_PCIE_PIO] =           { 0x8fff0000, 0x00010000 },
> > > > > +    [VIRT_PCIE_ECAM] =          { 0x90000000, 0x10000000 },
> > > > > +    /* Second PCIe window, 508GB wide at the 4GB boundary */
> > > > > +    [VIRT_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0x7F00000000ULL
> },
> > > >
> > > > Again, you don't need the layout that "virt" has to
> > > > satisfy 32-bit guests and backwards compatibility. You
> > > > can just have a single large MMIO window.
> > > >
> > >
> > > Apologies for not spotting this at the time this was posted.
> > >
> > > The MMIO32 window is not there for the benefit of 32-bit only CPUs. It
> > > is there for the benefit of PCIe devices with 32-bit memory BARs
> > > which, given that our PCI MMIO is 1:1 mapped between the CPU and PCI
> > > address spaces, require a 32-bit addressable CPU mapping. (PCIe
> > > permits so-called 'legacy' endpoints to have 32-bit MMIO BARs)
> > >
> > > So please, reinstate the MMIO32 window, but keep the other one as well.
> > >
> > So we still use the old VIRT_PCIE_MMIO starting from fixed address
> > 0x10000000, or anywhere within 4G is OK?
> >
>
> Anywhere in the 32-bit addressable area is fine, but please align the
> window to its own size.
>
> > > Thanks,
> > > Ard.
> > >
> > > >
> > > > > +    [VIRT_MEM] =                { 0x8000000000ULL, RAMLIMIT_BYTES
> },
> > > > > +};
> > > > > +
> > > > > +static const int sbsa_ref_irqmap[] = {
> > > > > +    [VIRT_UART] = 1,
> > > > > +    [VIRT_RTC] = 2,
> > > > > +    [VIRT_PCIE] = 3, /* ... to 6 */
> > > > > +    [VIRT_GPIO] = 7,
> > > > > +    [VIRT_SECURE_UART] = 8,
> > > > > +    [VIRT_AHCI] = 9,
> > > > > +    [VIRT_EHCI] = 10,
> > > > > +};
> > > > > +
> > > > > +static void create_fdt(VirtMachineState *vms)
> > > > > +{
> > > > > +    void *fdt = create_device_tree(&vms->fdt_size);
> > > > > +
> > > > > +    if (!fdt) {
> > > > > +        error_report("create_device_tree() failed");
> > > > > +        exit(1);
> > > > > +    }
> > > > > +
> > > > > +    vms->fdt = fdt;
> > > > > +
> > > > > +    /* Header */
> > > > > +    qemu_fdt_setprop_string(fdt, "/", "compatible",
> "linux,dummy-virt");
> > > > > +    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> > > > > +    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> > > > > +
> > > > > +    /* /chosen must exist for load_dtb to fill in necessary
> properties later */
> > > > > +    qemu_fdt_add_subnode(fdt, "/chosen");
> > > > > +
> > > > > +    if (have_numa_distance) {
> > > > > +        int size = nb_numa_nodes * nb_numa_nodes * 3 *
> sizeof(uint32_t);
> > > > > +        uint32_t *matrix = g_malloc0(size);
> > > > > +        int idx, i, j;
> > > > > +
> > > > > +        for (i = 0; i < nb_numa_nodes; i++) {
> > > > > +            for (j = 0; j < nb_numa_nodes; j++) {
> > > > > +                idx = (i * nb_numa_nodes + j) * 3;
> > > > > +                matrix[idx + 0] = cpu_to_be32(i);
> > > > > +                matrix[idx + 1] = cpu_to_be32(j);
> > > > > +                matrix[idx + 2] =
> cpu_to_be32(numa_info[i].distance[j]);
> > > > > +            }
> > > > > +        }
> > > > > +
> > > > > +        qemu_fdt_add_subnode(fdt, "/distance-map");
> > > > > +        qemu_fdt_setprop_string(fdt, "/distance-map",
> "compatible",
> > > > > +                                "numa-distance-map-v1");
> > > > > +        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
> > > > > +                         matrix, size);
> > > > > +        g_free(matrix);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > > > > +{
> > > > > +    int cpu;
> > > > > +    const MachineState *ms = MACHINE(vms);
> > > > > +
> > > > > +    qemu_fdt_add_subnode(vms->fdt, "/cpus");
> > > > > +    /* #address-cells should be 2 for Arm v8 64-bit systems */
> > > > > +    qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", 2);
> > > > > +    qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
> > > > > +
> > > > > +    for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
> > > > > +        char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> > > > > +        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
> > > > > +        CPUState *cs = CPU(armcpu);
> > > > > +
> > > > > +        qemu_fdt_add_subnode(vms->fdt, nodename);
> > > > > +        qemu_fdt_setprop_string(vms->fdt, nodename,
> "device_type", "cpu");
> > > > > +        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
> > > > > +                                    armcpu->dtb_compatible);
> > > > > +
> > > > > +        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED
> > > > > +            && vms->smp_cpus > 1) {
> > > > > +            qemu_fdt_setprop_string(vms->fdt, nodename,
> > > > > +                                        "enable-method", "psci");
> > > > > +        }
> > > > > +
> > > > > +        qemu_fdt_setprop_u64(vms->fdt, nodename, "reg",
> armcpu->mp_affinity);
> > > > > +
> > > > > +        if
> (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
> > > > > +            qemu_fdt_setprop_cell(vms->fdt, nodename,
> "numa-node-id",
> > > > > +
> ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
> > > > > +        }
> > > > > +
> > > > > +        g_free(nodename);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void fdt_add_gic_node(VirtMachineState *vms)
> > > > > +{
> > > > > +    char *nodename;
> > > > > +    int nb_redist_regions = virt_gicv3_redist_region_count(vms);
> > > > > +
> > > > > +    vms->gic_phandle = qemu_fdt_alloc_phandle(vms->fdt);
> > > > > +    qemu_fdt_setprop_cell(vms->fdt, "/", "interrupt-parent",
> vms->gic_phandle);
> > > > > +
> > > > > +    nodename = g_strdup_printf("/intc@%" PRIx64,
> > > > > +                               vms->memmap[VIRT_GIC_DIST].base);
> > > > > +    qemu_fdt_add_subnode(vms->fdt, nodename);
> > > > > +    qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells",
> 3);
> > > > > +    qemu_fdt_setprop(vms->fdt, nodename, "interrupt-controller",
> NULL, 0);
> > > > > +    qemu_fdt_setprop_cell(vms->fdt, nodename, "#address-cells",
> 0x2);
> > > > > +    qemu_fdt_setprop_cell(vms->fdt, nodename, "#size-cells", 0x2);
> > > > > +    qemu_fdt_setprop(vms->fdt, nodename, "ranges", NULL, 0);
> > > > > +
> > > > > +    /* Only GICv3 created */
> > > > > +    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
> > > > > +                            "arm,gic-v3");
> > > > > +
> > > > > +    qemu_fdt_setprop_cell(vms->fdt, nodename,
> > > > > +                          "#redistributor-regions",
> nb_redist_regions);
> > > > > +
> > > > > +    if (nb_redist_regions == 1) {
> > > > > +        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_DIST].base,
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_DIST].size,
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_REDIST].base,
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_REDIST].size);
> > > > > +    } else {
> > > > > +        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_DIST].base,
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_DIST].size,
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_REDIST].base,
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_REDIST].size,
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_REDIST2].base,
> > > > > +                                     2,
> vms->memmap[VIRT_GIC_REDIST2].size);
> > > > > +    }
> > > > > +
> > > > > +    if (vms->virt) {
> > > > > +        qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
> > > > > +                               GIC_FDT_IRQ_TYPE_PPI,
> ARCH_GICV3_MAINT_IRQ,
> > > > > +                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> > > > > +    }
> > > > > +
> > > > > +    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle",
> vms->gic_phandle);
> > > > > +    g_free(nodename);
> > > > > +}
> > > >
> > > > This is still generating a lot of device tree nodes.
> > > > I thought we had agreed that we were going to just have
> > > > a minimal device tree that says "here is the RAM" and nothing
> > > > else ?
> > > >
> > > > > +
> > > > > +static void create_gic(VirtMachineState *vms, qemu_irq *pic)
> > > > > +{
> > > > > +    /* We create a standalone GIC */
> > > > > +    DeviceState *gicdev;
> > > > > +    SysBusDevice *gicbusdev;
> > > > > +    const char *gictype;
> > > > > +    int i;
> > > > > +    uint32_t nb_redist_regions = 0;
> > > > > +    uint32_t redist0_capacity, redist0_count;
> > > > > +
> > > > > +    /* Only GICv3 created */
> > > > > +    gictype = gicv3_class_name();
> > > > > +
> > > > > +    gicdev = qdev_create(NULL, gictype);
> > > > > +    qdev_prop_set_uint32(gicdev, "revision", 3);
> > > > > +    qdev_prop_set_uint32(gicdev, "num-cpu", smp_cpus);
> > > > > +    /* Note that the num-irq property counts both internal and
> external
> > > > > +     * interrupts; there are always 32 of the former (mandated by
> GIC spec).
> > > > > +     */
> > > > > +    qdev_prop_set_uint32(gicdev, "num-irq", NUM_IRQS + 32);
> > > > > +    if (!kvm_irqchip_in_kernel()) {
> > > > > +        qdev_prop_set_bit(gicdev, "has-security-extensions",
> vms->secure);
> > > > > +    }
> > > > > +
> > > > > +    redist0_capacity =
> > > > > +                vms->memmap[VIRT_GIC_REDIST].size /
> GICV3_REDIST_SIZE;
> > > > > +    redist0_count = MIN(smp_cpus, redist0_capacity);
> > > > > +
> > > > > +    nb_redist_regions = virt_gicv3_redist_region_count(vms);
> > > > > +
> > > > > +    qdev_prop_set_uint32(gicdev, "len-redist-region-count",
> > > > > +                         nb_redist_regions);
> > > > > +    qdev_prop_set_uint32(gicdev, "redist-region-count[0]",
> redist0_count);
> > > > > +
> > > > > +    if (nb_redist_regions == 2) {
> > > > > +        uint32_t redist1_capacity =
> > > > > +                    vms->memmap[VIRT_GIC_REDIST2].size /
> GICV3_REDIST_SIZE;
> > > > > +
> > > > > +        qdev_prop_set_uint32(gicdev, "redist-region-count[1]",
> > > > > +            MIN(smp_cpus - redist0_count, redist1_capacity));
> > > > > +    }
> > > > > +
> > > > > +    qdev_init_nofail(gicdev);
> > > > > +    gicbusdev = SYS_BUS_DEVICE(gicdev);
> > > > > +    sysbus_mmio_map(gicbusdev, 0,
> vms->memmap[VIRT_GIC_DIST].base);
> > > > > +    sysbus_mmio_map(gicbusdev, 1,
> vms->memmap[VIRT_GIC_REDIST].base);
> > > > > +    if (nb_redist_regions == 2) {
> > > > > +        sysbus_mmio_map(gicbusdev, 2,
> vms->memmap[VIRT_GIC_REDIST2].base);
> > > > > +    }
> > > > > +
> > > > > +    /* Wire the outputs from each CPU's generic timer and the
> GICv3
> > > > > +     * maintenance interrupt signal to the appropriate GIC PPI
> inputs,
> > > > > +     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the
> CPU's inputs.
> > > > > +     */
> > > > > +    for (i = 0; i < smp_cpus; i++) {
> > > > > +        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
> > > > > +        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
> > > > > +        int irq;
> > > > > +        /* Mapping from the output timer irq lines from the CPU
> to the
> > > > > +         * GIC PPI inputs we use for the virt board.
> > > > > +         */
> > > > > +        const int timer_irq[] = {
> > > > > +            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
> > > > > +            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
> > > > > +            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
> > > > > +            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
> > > > > +        };
> > > > > +
> > > > > +        for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
> > > > > +            qdev_connect_gpio_out(cpudev, irq,
> > > > > +                                  qdev_get_gpio_in(gicdev,
> > > > > +                                                   ppibase +
> timer_irq[irq]));
> > > > > +        }
> > > > > +
> > > > > +        qdev_connect_gpio_out_named(cpudev,
> "gicv3-maintenance-interrupt", 0,
> > > > > +                                    qdev_get_gpio_in(gicdev,
> ppibase
> > > > > +                                                     +
> ARCH_GICV3_MAINT_IRQ));
> > > > > +        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> > > > > +                                    qdev_get_gpio_in(gicdev,
> ppibase
> > > > > +                                                     +
> VIRTUAL_PMU_IRQ));
> > > > > +
> > > > > +        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev,
> ARM_CPU_IRQ));
> > > > > +        sysbus_connect_irq(gicbusdev, i + smp_cpus,
> > > > > +                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> > > > > +        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
> > > > > +                           qdev_get_gpio_in(cpudev,
> ARM_CPU_VIRQ));
> > > > > +        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
> > > > > +                           qdev_get_gpio_in(cpudev,
> ARM_CPU_VFIQ));
> > > > > +    }
> > > > > +
> > > > > +    for (i = 0; i < NUM_IRQS; i++) {
> > > > > +        pic[i] = qdev_get_gpio_in(gicdev, i);
> > > > > +    }
> > > > > +
> > > > > +    fdt_add_gic_node(vms);
> > > > > +}
> > > > > +
> > > > > +static void create_uart(const VirtMachineState *vms, qemu_irq
> *pic, int uart,
> > > > > +                        MemoryRegion *mem, Chardev *chr)
> > > > > +{
> > > > > +    hwaddr base = vms->memmap[uart].base;
> > > > > +    int irq = vms->irqmap[uart];
> > > > > +    DeviceState *dev = qdev_create(NULL, "pl011");
> > > > > +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> > > > > +
> > > > > +    qdev_prop_set_chr(dev, "chardev", chr);
> > > > > +    qdev_init_nofail(dev);
> > > > > +    memory_region_add_subregion(mem, base,
> > > > > +                                sysbus_mmio_get_region(s, 0));
> > > > > +    sysbus_connect_irq(s, 0, pic[irq]);
> > > > > +}
> > > > > +
> > > > > +static void create_rtc(const VirtMachineState *vms, qemu_irq *pic)
> > > > > +{
> > > > > +    hwaddr base = vms->memmap[VIRT_RTC].base;
> > > > > +    int irq = vms->irqmap[VIRT_RTC];
> > > > > +
> > > > > +    sysbus_create_simple("pl031", base, pic[irq]);
> > > > > +}
> > > > > +
> > > > > +static void create_ahci(const VirtMachineState *vms, qemu_irq
> *pic)
> > > > > +{
> > > > > +    hwaddr base = vms->memmap[VIRT_AHCI].base;
> > > > > +    int irq = vms->irqmap[VIRT_AHCI];
> > > > > +    DeviceState *dev;
> > > > > +    DriveInfo *hd[SATA_NUM_PORTS];
> > > > > +    SysbusAHCIState *sysahci;
> > > > > +    AHCIState *ahci;
> > > > > +    int i;
> > > > > +
> > > > > +    dev = qdev_create(NULL, "sysbus-ahci");
> > > > > +    qdev_prop_set_uint32(dev, "num-ports", SATA_NUM_PORTS);
> > > > > +    qdev_init_nofail(dev);
> > > > > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> > > > > +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
> > > > > +
> > > > > +    sysahci = SYSBUS_AHCI(dev);
> > > > > +    ahci = &sysahci->ahci;
> > > > > +    ide_drive_get(hd, ARRAY_SIZE(hd));
> > > > > +    for (i = 0; i < ahci->ports; i++) {
> > > > > +        if (hd[i] == NULL) {
> > > > > +            continue;
> > > > > +        }
> > > > > +        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void create_ehci(const VirtMachineState *vms, qemu_irq
> *pic)
> > > > > +{
> > > > > +    hwaddr base = vms->memmap[VIRT_EHCI].base;
> > > > > +    int irq = vms->irqmap[VIRT_EHCI];
> > > > > +    USBBus *usb_bus;
> > > > > +
> > > > > +    sysbus_create_simple("exynos4210-ehci-usb", base, pic[irq]);
> > > >
> > > > What is this using the exynos4210 USB device for? That
> > > > is definitely not correct for a generic board.
> > > >
> > > > > +
> > > > > +    usb_bus = usb_bus_find(-1);
> > > > > +    usb_create_simple(usb_bus, "usb-kbd");
> > > > > +    usb_create_simple(usb_bus, "usb-mouse");
> > > >
> > > > Don't create USB devices by default -- let the user do it on
> > > > the command line.
> > > >
> > > > > +}
> > > > > +
> > > > > +static DeviceState *gpio_key_dev;
> > > > > +static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
> > > > > +{
> > > > > +    /* use gpio Pin 3 for power button event */
> > > > > +    qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
> > > > > +}
> > > > > +
> > > > > +static Notifier sbsa_ref_powerdown_notifier = {
> > > > > +    .notify = sbsa_ref_powerdown_req
> > > > > +};
> > > > > +
> > > > > +static void create_gpio(const VirtMachineState *vms, qemu_irq
> *pic)
> > > > > +{
> > > > > +    DeviceState *pl061_dev;
> > > > > +    hwaddr base = vms->memmap[VIRT_GPIO].base;
> > > > > +    int irq = vms->irqmap[VIRT_GPIO];
> > > > > +
> > > > > +    pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
> > > > > +
> > > > > +    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
> > > > > +
> qdev_get_gpio_in(pl061_dev, 3));
> > > > > +
> > > > > +    /* connect powerdown request */
> > > > > +
> qemu_register_powerdown_notifier(&sbsa_ref_powerdown_notifier);
> > > > > +}
> > > > > +
> > > > > +static void create_one_flash(const char *name, hwaddr flashbase,
> > > > > +                             hwaddr flashsize, const char *file,
> > > > > +                             MemoryRegion *sysmem)
> > > > > +{
> > > > > +    /* Create and map a single flash device. We use the same
> > > > > +     * parameters as the flash devices on the Versatile Express
> board.
> > > > > +     */
> > > > > +    DriveInfo *dinfo = drive_get_next(IF_PFLASH);
> > > > > +    DeviceState *dev = qdev_create(NULL, "cfi.pflash01");
> > > > > +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> > > > > +    const uint64_t sectorlength = 256 * 1024;
> > > > > +
> > > > > +    if (dinfo) {
> > > > > +        qdev_prop_set_drive(dev, "drive",
> blk_by_legacy_dinfo(dinfo),
> > > > > +                            &error_abort);
> > > > > +    }
> > > > > +
> > > > > +    qdev_prop_set_uint32(dev, "num-blocks", flashsize /
> sectorlength);
> > > > > +    qdev_prop_set_uint64(dev, "sector-length", sectorlength);
> > > > > +    qdev_prop_set_uint8(dev, "width", 4);
> > > > > +    qdev_prop_set_uint8(dev, "device-width", 2);
> > > > > +    qdev_prop_set_bit(dev, "big-endian", false);
> > > > > +    qdev_prop_set_uint16(dev, "id0", 0x89);
> > > > > +    qdev_prop_set_uint16(dev, "id1", 0x18);
> > > > > +    qdev_prop_set_uint16(dev, "id2", 0x00);
> > > > > +    qdev_prop_set_uint16(dev, "id3", 0x00);
> > > > > +    qdev_prop_set_string(dev, "name", name);
> > > > > +    qdev_init_nofail(dev);
> > > > > +
> > > > > +    memory_region_add_subregion(sysmem, flashbase,
> > > > > +
> sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
> > > > > +
> > > > > +    if (file) {
> > > > > +        char *fn;
> > > > > +        int image_size;
> > > > > +
> > > > > +        if (drive_get(IF_PFLASH, 0, 0)) {
> > > > > +            error_report("The contents of the first flash device
> may be "
> > > > > +                         "specified with -bios or with -drive
> if=pflash... "
> > > > > +                         "but you cannot use both options at
> once");
> > > > > +            exit(1);
> > > > > +        }
> > > > > +        fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, file);
> > > > > +        if (!fn) {
> > > > > +            error_report("Could not find ROM image '%s'", file);
> > > > > +            exit(1);
> > > > > +        }
> > > > > +        image_size = load_image_mr(fn,
> sysbus_mmio_get_region(sbd, 0));
> > > > > +        g_free(fn);
> > > > > +        if (image_size < 0) {
> > > > > +            error_report("Could not load ROM image '%s'", file);
> > > > > +            exit(1);
> > > > > +        }
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void create_flash(const VirtMachineState *vms,
> > > > > +                         MemoryRegion *sysmem,
> > > > > +                         MemoryRegion *secure_sysmem)
> > > > > +{
> > > > > +    /* Create two flash devices to fill the VIRT_FLASH space in
> the memmap.
> > > > > +     * Any file passed via -bios goes in the first of these.
> > > > > +     * sysmem is the system memory space. secure_sysmem is the
> secure view
> > > > > +     * of the system, and the first flash device should be made
> visible only
> > > > > +     * there. The second flash device is visible to both secure
> and nonsecure.
> > > > > +     * If sysmem == secure_sysmem this means there is no separate
> Secure
> > > > > +     * address space and both flash devices are generally visible.
> > > > > +     */
> > > > > +    hwaddr flashsize = vms->memmap[VIRT_FLASH].size / 2;
> > > > > +    hwaddr flashbase = vms->memmap[VIRT_FLASH].base;
> > > > > +
> > > > > +    create_one_flash("sbsa-ref.flash0", flashbase, flashsize,
> > > > > +                     bios_name, secure_sysmem);
> > > > > +    create_one_flash("sbsa-ref.flash1", flashbase + flashsize,
> flashsize,
> > > > > +                     NULL, sysmem);
> > > > > +}
> > > > > +
> > > > > +static void create_smmu(const VirtMachineState *vms, qemu_irq
> *pic,
> > > > > +                        PCIBus *bus)
> > > > > +{
> > > > > +    int irq =  vms->irqmap[VIRT_SMMU];
> > > > > +    int i;
> > > > > +    hwaddr base = vms->memmap[VIRT_SMMU].base;
> > > > > +    DeviceState *dev;
> > > > > +
> > > > > +    if (vms->iommu != VIRT_IOMMU_SMMUV3) {
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > > +    dev = qdev_create(NULL, "arm-smmuv3");
> > > > > +
> > > > > +    object_property_set_link(OBJECT(dev), OBJECT(bus),
> "primary-bus",
> > > > > +                             &error_abort);
> > > > > +    qdev_init_nofail(dev);
> > > > > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> > > > > +    for (i = 0; i < NUM_SMMU_IRQS; i++) {
> > > > > +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
> > > > > +{
> > > > > +    hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
> > > > > +    hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
> > > > > +    hwaddr base_mmio_high = vms->memmap[VIRT_PCIE_MMIO_HIGH].base;
> > > > > +    hwaddr size_mmio_high = vms->memmap[VIRT_PCIE_MMIO_HIGH].size;
> > > > > +    hwaddr base_pio = vms->memmap[VIRT_PCIE_PIO].base;
> > > > > +    hwaddr base_ecam, size_ecam;
> > > > > +    int irq = vms->irqmap[VIRT_PCIE];
> > > > > +    MemoryRegion *mmio_alias;
> > > > > +    MemoryRegion *mmio_reg;
> > > > > +    MemoryRegion *ecam_alias;
> > > > > +    MemoryRegion *ecam_reg;
> > > > > +    DeviceState *dev;
> > > > > +    int i, ecam_id;
> > > > > +    PCIHostState *pci;
> > > > > +
> > > > > +    dev = qdev_create(NULL, TYPE_GPEX_HOST);
> > > > > +    qdev_init_nofail(dev);
> > > > > +
> > > > > +    ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
> > > > > +    base_ecam = vms->memmap[ecam_id].base;
> > > > > +    size_ecam = vms->memmap[ecam_id].size;
> > > > > +    /* Map only the first size_ecam bytes of ECAM space */
> > > > > +    ecam_alias = g_new0(MemoryRegion, 1);
> > > > > +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> > > > > +    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
> > > > > +                             ecam_reg, 0, size_ecam);
> > > > > +    memory_region_add_subregion(get_system_memory(), base_ecam,
> ecam_alias);
> > > > > +
> > > > > +    /* Map the MMIO window into system address space so as to
> expose
> > > > > +     * the section of PCI MMIO space which starts at the same
> base address
> > > > > +     * (ie 1:1 mapping for that part of PCI MMIO space visible
> through
> > > > > +     * the window).
> > > > > +     */
> > > > > +    mmio_alias = g_new0(MemoryRegion, 1);
> > > > > +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> > > > > +    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
> > > > > +                             mmio_reg, base_mmio, size_mmio);
> > > > > +    memory_region_add_subregion(get_system_memory(), base_mmio,
> mmio_alias);
> > > > > +
> > > > > +    if (vms->highmem) {
> > > > > +        /* Map high MMIO space */
> > > > > +        MemoryRegion *high_mmio_alias = g_new0(MemoryRegion, 1);
> > > > > +
> > > > > +        memory_region_init_alias(high_mmio_alias, OBJECT(dev),
> "pcie-mmio-high",
> > > > > +                                 mmio_reg, base_mmio_high,
> size_mmio_high);
> > > > > +        memory_region_add_subregion(get_system_memory(),
> base_mmio_high,
> > > > > +                                    high_mmio_alias);
> > > > > +    }
> > > > > +
> > > > > +    /* Map IO port space */
> > > > > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
> > > > > +
> > > > > +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> > > > > +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
> > > > > +        gpex_set_irq_num(GPEX_HOST(dev), i, irq + i);
> > > > > +    }
> > > > > +
> > > > > +    pci = PCI_HOST_BRIDGE(dev);
> > > > > +    if (pci->bus) {
> > > > > +        for (i = 0; i < nb_nics; i++) {
> > > > > +            NICInfo *nd = &nd_table[i];
> > > > > +
> > > > > +            if (!nd->model) {
> > > > > +                nd->model = g_strdup("e1000e");
> > > > > +            }
> > > > > +
> > > > > +            pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
> > > > > +        }
> > > > > +    }
> > > > > +
> > > > > +    pci_create_simple(pci->bus, -1, "VGA");
> > > > > +
> > > > > +    if (vms->iommu) {
> > > > > +        create_smmu(vms, pic, pci->bus);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > > +static void create_secure_ram(VirtMachineState *vms,
> > > > > +                              MemoryRegion *secure_sysmem)
> > > > > +{
> > > > > +    MemoryRegion *secram = g_new(MemoryRegion, 1);
> > > > > +    hwaddr base = vms->memmap[VIRT_SECURE_MEM].base;
> > > > > +    hwaddr size = vms->memmap[VIRT_SECURE_MEM].size;
> > > > > +
> > > > > +    memory_region_init_ram(secram, NULL, "sbsa-ref.secure-ram",
> size,
> > > > > +                           &error_fatal);
> > > > > +    memory_region_add_subregion(secure_sysmem, base, secram);
> > > > > +}
> > > > > +
> > > > > +static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int
> *fdt_size)
> > > > > +{
> > > > > +    const VirtMachineState *board = container_of(binfo,
> VirtMachineState,
> > > > > +                                                 bootinfo);
> > > > > +
> > > > > +    *fdt_size = board->fdt_size;
> > > > > +    return board->fdt;
> > > > > +}
> > > > > +
> > > > > +static
> > > > > +void sbsa_ref_machine_done(Notifier *notifier, void *data)
> > > > > +{
> > > > > +    VirtMachineState *vms = container_of(notifier,
> VirtMachineState,
> > > > > +                                         machine_done);
> > > > > +    ARMCPU *cpu = ARM_CPU(first_cpu);
> > > > > +    struct arm_boot_info *info = &vms->bootinfo;
> > > > > +    AddressSpace *as = arm_boot_address_space(cpu, info);
> > > > > +
> > > > > +    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as)
> < 0) {
> > > > > +        exit(1);
> > > > > +    }
> > > > > +}
> > > >
> > > > The virt board needs a machine-done notifier because it has
> > > > to add extra things to the DTB here. You don't, so you don't
> > > > need one. Don't set bootinfo.skip_dtb_autoload to true, and
> > > > then the boot.c code will do the arm_load_dtb() call for you.
> > > >
> > > > > +
> > > > > +static void sbsa_ref_init(MachineState *machine)
> > > > > +{
> > > > > +    VirtMachineState *vms = VIRT_MACHINE(machine);
> > > > > +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
> > > > > +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> > > > > +    const CPUArchIdList *possible_cpus;
> > > > > +    qemu_irq pic[NUM_IRQS];
> > > > > +    MemoryRegion *sysmem = get_system_memory();
> > > > > +    MemoryRegion *secure_sysmem = NULL;
> > > > > +    int n, sbsa_max_cpus;
> > > > > +    MemoryRegion *ram = g_new(MemoryRegion, 1);
> > > > > +    bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0,
> 0);
> > > > > +    bool aarch64 = true;
> > > > > +
> > > > > +    if (strcmp(machine->cpu_type,
> ARM_CPU_TYPE_NAME("cortex-a57"))) {
> > > > > +        error_report("sbsa-ref: CPU type %s not supported",
> machine->cpu_type);
> > > > > +        exit(1);
> > > > > +    }
> > > > > +
> > > > > +    if (kvm_enabled()) {
> > > > > +        error_report("sbsa-ref: KVM is not supported at this
> machine");
> > > > > +        exit(1);
> > > > > +    }
> > > > > +
> > > > > +    if (machine->kernel_filename && firmware_loaded) {
> > > > > +        error_report("sbsa-ref: No fw_cfg device on this machine,
> "
> > > > > +                     "so -kernel option is not supported when
> firmware loaded, "
> > > > > +                     "please load hard disk instead");
> > > > > +        exit(1);
> > > > > +    }
> > > >
> > > > If ther is no fw_cfg device, why does your memory map datastructure
> > > > have an entry for it earlier ?
> > > > > +    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
> > > >
> > > > > +
> > > > > +    /* If we have an EL3 boot ROM then the assumption is that it
> will
> > > > > +     * implement PSCI itself, so disable QEMU's internal
> implementation
> > > > > +     * so it doesn't get in the way. Instead of starting secondary
> > > > > +     * CPUs in PSCI powerdown state we will start them all
> running and
> > > > > +     * let the boot ROM sort them out.
> > > > > +     * The usual case is that we do use QEMU's PSCI
> implementation;
> > > > > +     * if the guest has EL2 then we will use SMC as the conduit,
> > > > > +     * and otherwise we will use HVC (for backwards compatibility
> and
> > > > > +     * because if we're using KVM then we must use HVC).
> > > > > +     */
> > > > > +    if (vms->secure && firmware_loaded) {
> > > > > +        vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
> > > > > +    } else if (vms->virt) {
> > > > > +        vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
> > > > > +    } else {
> > > > > +        vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
> > > > > +    }
> > > >
> > > > Do you actually intend this to work in all these cases? I
> > > > thought the intention was "always start the boot rom in EL3"
> > > > for this board, like the real hardware would. In that case, most
> > > > of these if clauses are dead code.
> > > >
> > > > > +
> > > > > +    /* Only GICv3 is uesd in this machine */
> > > > > +    sbsa_max_cpus = vms->memmap[VIRT_GIC_REDIST].size /
> GICV3_REDIST_SIZE;
> > > > > +    sbsa_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size /
> GICV3_REDIST_SIZE;
> > > > > +
> > > > > +    if (max_cpus > sbsa_max_cpus) {
> > > > > +        error_report("Number of SMP CPUs requested (%d) exceeds
> max CPUs "
> > > > > +                     "supported by machine 'sbsa-ref' (%d)",
> > > > > +                     max_cpus, sbsa_max_cpus);
> > > > > +        exit(1);
> > > > > +    }
> > > > > +
> > > > > +    vms->smp_cpus = smp_cpus;
> > > > > +
> > > > > +    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
> > > > > +        error_report("sbsa-ref: cannot model more than %dGB RAM",
> RAMLIMIT_GB);
> > > > > +        exit(1);
> > > > > +    }
> > > > > +
> > > > > +    if (vms->secure) {
> > > > > +        /* The Secure view of the world is the same as the
> NonSecure,
> > > > > +         * but with a few extra devices. Create it as a container
> region
> > > > > +         * containing the system memory at low priority; any
> secure-only
> > > > > +         * devices go in at higher priority and take precedence.
> > > > > +         */
> > > > > +        secure_sysmem = g_new(MemoryRegion, 1);
> > > > > +        memory_region_init(secure_sysmem, OBJECT(machine),
> "secure-memory",
> > > > > +                           UINT64_MAX);
> > > > > +        memory_region_add_subregion_overlap(secure_sysmem, 0,
> sysmem, -1);
> > > > > +    }
> > > >
> > > > Again, unless you intentionally want to support both "has EL3"
> > > > and "does not have EL3" configs for this board, you don't need
> > > > to do this conditionally.
> > > >
> > > > > +
> > > > > +    create_fdt(vms);
> > > > > +
> > > > > +    possible_cpus = mc->possible_cpu_arch_ids(machine);
> > > > > +    for (n = 0; n < possible_cpus->len; n++) {
> > > > > +        Object *cpuobj;
> > > > > +        CPUState *cs;
> > > > > +
> > > > > +        if (n >= smp_cpus) {
> > > > > +            break;
> > > > > +        }
> > > > > +
> > > > > +        cpuobj = object_new(possible_cpus->cpus[n].type);
> > > > > +        object_property_set_int(cpuobj,
> possible_cpus->cpus[n].arch_id,
> > > > > +                                "mp-affinity", NULL);
> > > > > +
> > > > > +        cs = CPU(cpuobj);
> > > > > +        cs->cpu_index = n;
> > > > > +
> > > > > +        numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index],
> DEVICE(cpuobj),
> > > > > +                          &error_fatal);
> > > > > +
> > > > > +        aarch64 &= object_property_get_bool(cpuobj, "aarch64",
> NULL);
> > > > > +
> > > > > +        if (!vms->secure) {
> > > > > +            object_property_set_bool(cpuobj, false, "has_el3",
> NULL);
> > > > > +        }
> > > > > +
> > > > > +        if (!vms->virt && object_property_find(cpuobj, "has_el2",
> NULL)) {
> > > > > +            object_property_set_bool(cpuobj, false, "has_el2",
> NULL);
> > > > > +        }
> > > > > +
> > > > > +        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
> > > > > +            object_property_set_int(cpuobj, vms->psci_conduit,
> > > > > +                                    "psci-conduit", NULL);
> > > > > +
> > > > > +            /* Secondary CPUs start in PSCI powered-down state */
> > > > > +            if (n > 0) {
> > > > > +                object_property_set_bool(cpuobj, true,
> > > > > +                                         "start-powered-off",
> NULL);
> > > > > +            }
> > > > > +        }
> > > > > +
> > > > > +        if (vmc->no_pmu && object_property_find(cpuobj, "pmu",
> NULL)) {
> > > > > +            object_property_set_bool(cpuobj, false, "pmu", NULL);
> > > > > +        }
> > > > > +
> > > > > +        if (object_property_find(cpuobj, "reset-cbar", NULL)) {
> > > > > +            object_property_set_int(cpuobj,
> vms->memmap[VIRT_CPUPERIPHS].base,
> > > > > +                                    "reset-cbar", &error_abort);
> > > > > +        }
> > > > > +
> > > > > +        object_property_set_link(cpuobj, OBJECT(sysmem), "memory",
> > > > > +                                 &error_abort);
> > > > > +        if (vms->secure) {
> > > > > +            object_property_set_link(cpuobj,
> OBJECT(secure_sysmem),
> > > > > +                                     "secure-memory",
> &error_abort);
> > > > > +        }
> > > > > +
> > > > > +        object_property_set_bool(cpuobj, true, "realized",
> &error_fatal);
> > > > > +        object_unref(cpuobj);
> > > > > +    }
> > > > > +    fdt_add_cpu_nodes(vms);
> > > > > +
> > > > > +    memory_region_allocate_system_memory(ram, NULL,
> "sbsa-ref.ram",
> > > > > +                                         machine->ram_size);
> > > > > +    memory_region_add_subregion(sysmem,
> vms->memmap[VIRT_MEM].base, ram);
> > > > > +
> > > > > +    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem :
> sysmem);
> > > > > +
> > > > > +    create_gic(vms, pic);
> > > > > +
> > > > > +    create_uart(vms, pic, VIRT_UART, sysmem, serial_hd(0));
> > > > > +
> > > > > +    if (vms->secure) {
> > > > > +        create_secure_ram(vms, secure_sysmem);
> > > > > +        create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem,
> serial_hd(1));
> > > > > +    }
> > > > > +
> > > > > +    vms->highmem_ecam &= vms->highmem && (!firmware_loaded ||
> aarch64);
> > > > > +
> > > > > +    create_rtc(vms, pic);
> > > > > +
> > > > > +    create_pcie(vms, pic);
> > > > > +
> > > > > +    create_gpio(vms, pic);
> > > > > +
> > > > > +    create_ahci(vms, pic);
> > > > > +
> > > > > +    create_ehci(vms, pic);
> > > > > +
> > > > > +    vms->bootinfo.ram_size = machine->ram_size;
> > > > > +    vms->bootinfo.kernel_filename = machine->kernel_filename;
> > > > > +    vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
> > > > > +    vms->bootinfo.initrd_filename = machine->initrd_filename;
> > > > > +    vms->bootinfo.nb_cpus = smp_cpus;
> > > > > +    vms->bootinfo.board_id = -1;
> > > > > +    vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
> > > > > +    vms->bootinfo.get_dtb = sbsa_ref_dtb;
> > > > > +    vms->bootinfo.skip_dtb_autoload = true;
> > > > > +    vms->bootinfo.firmware_loaded = firmware_loaded;
> > > > > +    arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
> > > > > +
> > > > > +    vms->machine_done.notify = sbsa_ref_machine_done;
> > > > > +    qemu_add_machine_init_done_notifier(&vms->machine_done);
> > > > > +}
> > > > > +
> > > > > +static bool sbsa_ref_get_secure(Object *obj, Error **errp)
> > > > > +{
> > > > > +    VirtMachineState *vms = VIRT_MACHINE(obj);
> > > > > +
> > > > > +    return vms->secure;
> > > > > +}
> > > > > +
> > > > > +static void sbsa_ref_set_secure(Object *obj, bool value, Error
> **errp)
> > > > > +{
> > > > > +    VirtMachineState *vms = VIRT_MACHINE(obj);
> > > > > +
> > > > > +    vms->secure = value;
> > > > > +}
> > > > > +
> > > > > +static bool sbsa_ref_get_virt(Object *obj, Error **errp)
> > > > > +{
> > > > > +    VirtMachineState *vms = VIRT_MACHINE(obj);
> > > > > +
> > > > > +    return vms->virt;
> > > > > +}
> > > > > +
> > > > > +static void sbsa_ref_set_virt(Object *obj, bool value, Error
> **errp)
> > > > > +{
> > > > > +    VirtMachineState *vms = VIRT_MACHINE(obj);
> > > > > +
> > > > > +    vms->virt = value;
> > > > > +}
> > > > > +
> > > > > +static CpuInstanceProperties
> > > > > +sbsa_ref_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> > > > > +{
> > > > > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > > > > +    const CPUArchIdList *possible_cpus =
> mc->possible_cpu_arch_ids(ms);
> > > > > +
> > > > > +    assert(cpu_index < possible_cpus->len);
> > > > > +    return possible_cpus->cpus[cpu_index].props;
> > > > > +}
> > > > > +
> > > > > +static int64_t
> > > > > +sbsa_ref_get_default_cpu_node_id(const MachineState *ms, int idx)
> > > > > +{
> > > > > +    return idx % nb_numa_nodes;
> > > > > +}
> > > > > +
> > > > > +static uint64_t sbsa_ref_cpu_mp_affinity(VirtMachineState *vms,
> int idx)
> > > > > +{
> > > > > +    uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
> > > > > +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> > > > > +
> > > > > +    if (!vmc->disallow_affinity_adjustment) {
> > > > > +        /* Only GICv3 is used in this machine */
> > > > > +        clustersz = GICV3_TARGETLIST_BITS;
> > > > > +    }
> > > > > +    return arm_cpu_mp_affinity(idx, clustersz);
> > > > > +}
> > > > > +
> > > > > +static const CPUArchIdList
> *sbsa_ref_possible_cpu_arch_ids(MachineState *ms)
> > > > > +{
> > > > > +    int n;
> > > > > +    VirtMachineState *vms = VIRT_MACHINE(ms);
> > > > > +
> > > > > +    if (ms->possible_cpus) {
> > > > > +        assert(ms->possible_cpus->len == max_cpus);
> > > > > +        return ms->possible_cpus;
> > > > > +    }
> > > > > +
> > > > > +    ms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
> > > > > +                                  sizeof(CPUArchId) * max_cpus);
> > > > > +    ms->possible_cpus->len = max_cpus;
> > > > > +    for (n = 0; n < ms->possible_cpus->len; n++) {
> > > > > +        ms->possible_cpus->cpus[n].type = ms->cpu_type;
> > > > > +        ms->possible_cpus->cpus[n].arch_id =
> > > > > +            sbsa_ref_cpu_mp_affinity(vms, n);
> > > > > +        ms->possible_cpus->cpus[n].props.has_thread_id = true;
> > > > > +        ms->possible_cpus->cpus[n].props.thread_id = n;
> > > > > +    }
> > > > > +    return ms->possible_cpus;
> > > > > +}
> > > > > +
> > > > > +static void sbsa_ref_instance_init(Object *obj)
> > > > > +{
> > > > > +    VirtMachineState *vms = VIRT_MACHINE(obj);
> > > > > +
> > > > > +    vms->secure = true;
> > > > > +    object_property_add_bool(obj, "secure", sbsa_ref_get_secure,
> > > > > +                             sbsa_ref_set_secure, NULL);
> > > > > +    object_property_set_description(obj, "secure",
> > > > > +                                    "Set on/off to enable/disable
> the ARM "
> > > > > +                                    "Security Extensions
> (TrustZone)",
> > > > > +                                    NULL);
> > > > > +
> > > > > +    vms->virt = true;
> > > > > +    object_property_add_bool(obj, "virtualization",
> sbsa_ref_get_virt,
> > > > > +                             sbsa_ref_set_virt, NULL);
> > > > > +    object_property_set_description(obj, "virtualization",
> > > > > +                                    "Set on/off to enable/disable
> emulating a "
> > > > > +                                    "guest CPU which implements
> the ARM "
> > > > > +                                    "Virtualization Extensions",
> > > > > +                                    NULL);
> > > >
> > > > Drop the properties unless you need to actually support
> > > > all the different variations.
> > > >
> > > > > +
> > > > > +    vms->highmem = true;
> > > > > +    vms->iommu = VIRT_IOMMU_NONE;
> > > > > +    vms->gic_version = 3;
> > > > > +    vms->memmap = sbsa_ref_memmap;
> > > > > +    vms->irqmap = sbsa_ref_irqmap;
> > > > > +}
> > > > > +
> > > > > +static void sbsa_ref_class_init(ObjectClass *oc, void *data)
> > > > > +{
> > > > > +    MachineClass *mc = MACHINE_CLASS(oc);
> > > > > +
> > > > > +    mc->init = sbsa_ref_init;
> > > > > +    mc->max_cpus = 246;
> > > > > +    mc->block_default_type = IF_IDE;
> > > > > +    mc->no_cdrom = 1;
> > > > > +    mc->pci_allow_0_address = true;
> > > > > +    mc->minimum_page_bits = 12;
> > > > > +    mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
> > > > > +    mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
> > > > > +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
> > > > > +    mc->get_default_cpu_node_id =
> sbsa_ref_get_default_cpu_node_id;
> > > > > +    mc->default_ram_size = 1 * GiB;
> > > > > +    mc->default_cpus = 4;
> > > > > +    mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
> > > > > +}
> > > > > +
> > > > > +static const TypeInfo sbsa_ref_info = {
> > > > > +    .name          = MACHINE_TYPE_NAME("sbsa-ref"),
> > > > > +    .parent        = TYPE_VIRT_MACHINE,
> > > > > +    .instance_init = sbsa_ref_instance_init,
> > > > > +    .class_init    = sbsa_ref_class_init,
> > > > > +};
> > > > > +
> > > > > +static void sbsa_ref_machine_init(void)
> > > > > +{
> > > > > +    type_register_static(&sbsa_ref_info);
> > > > > +}
> > > > > +
> > > > > +type_init(sbsa_ref_machine_init);
> > > > > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > > > > index 9a870cc..f6c48be 100644
> > > > > --- a/include/hw/arm/virt.h
> > > > > +++ b/include/hw/arm/virt.h
> > > > > @@ -78,6 +78,8 @@ enum {
> > > > >      VIRT_GPIO,
> > > > >      VIRT_SECURE_UART,
> > > > >      VIRT_SECURE_MEM,
> > > > > +    VIRT_AHCI,
> > > > > +    VIRT_EHCI,
> > > > >  };
> > > > >
> > > > >  typedef enum VirtIOMMUType {
> > > > > --
> > > >
> > > > thanks
> > > > -- PMM
>

--000000000000d662210580c0e642
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hongbo,=C2=A0<div><br></=
div><div>Take a look at last patch in:=C2=A0ssh://<a href=3D"http://git@git=
.linaro.org/people/radoslaw.biernacki/qemu.git">git@git.linaro.org/people/r=
adoslaw.biernacki/qemu.git</a></div><div>branch=C2=A0wip_rad_new_memmap</di=
v></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 30 Jan 2019 at 09:37, Ard Biesheuvel &lt;<a href=3D=
"mailto:ard.biesheuvel@linaro.org">ard.biesheuvel@linaro.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 30 Jan =
2019 at 09:34, Hongbo Zhang &lt;<a href=3D"mailto:hongbo.zhang@linaro.org" =
target=3D"_blank">hongbo.zhang@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 29 Jan 2019 at 19:29, Ard Biesheuvel &lt;<a href=3D"mailto:ard=
.biesheuvel@linaro.org" target=3D"_blank">ard.biesheuvel@linaro.org</a>&gt;=
 wrote:<br>
&gt; &gt;<br>
&gt; &gt; Responding to an old thread ...<br>
&gt; &gt;<br>
&gt; &gt; On Thu, 15 Nov 2018 at 17:05, Peter Maydell &lt;<a href=3D"mailto=
:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&g=
t; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 19 October 2018 at 09:55, Hongbo Zhang &lt;<a href=3D"mai=
lto:hongbo.zhang@linaro.org" target=3D"_blank">hongbo.zhang@linaro.org</a>&=
gt; wrote:<br>
&gt; &gt; &gt; &gt; For the Aarch64, there is one machine &#39;virt&#39;, i=
t is primarily meant to<br>
&gt; &gt; &gt; &gt; run on KVM and execute virtualization workloads, but we=
 need an<br>
&gt; &gt; &gt; &gt; environment as faithful as possible to physical hardwar=
e, for supporting<br>
&gt; &gt; &gt; &gt; firmware and OS development for pysical Aarch64 machine=
s.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This patch introduces new machine type &#39;sbsa-ref&#3=
9; with main features:<br>
&gt; &gt; &gt; &gt;=C2=A0 - Based on &#39;virt&#39; machine type.<br>
&gt; &gt; &gt; &gt;=C2=A0 - CPU type cortex-a57.<br>
&gt; &gt; &gt; &gt;=C2=A0 - EL2 and EL3 are enabled by default.<br>
&gt; &gt; &gt; &gt;=C2=A0 - GIC version 3 only.<br>
&gt; &gt; &gt; &gt;=C2=A0 - Re-designed memory map.<br>
&gt; &gt; &gt; &gt;=C2=A0 - AHCI controller attached to system bus.<br>
&gt; &gt; &gt; &gt;=C2=A0 - EHCI controller attached to system bus.<br>
&gt; &gt; &gt; &gt;=C2=A0 - CDROM and hard disc on AHCI bus.<br>
&gt; &gt; &gt; &gt;=C2=A0 - USB mouse and key board.<br>
&gt; &gt; &gt; &gt;=C2=A0 - E1000E ethernet card on PCIE bus.<br>
&gt; &gt; &gt; &gt;=C2=A0 - VGA display adaptor on PCIE bus.<br>
&gt; &gt; &gt; &gt;=C2=A0 - No virtio deivces.<br>
&gt; &gt; &gt; &gt;=C2=A0 - No paravirtualized fw_cfg device.<br>
&gt; &gt; &gt; &gt;=C2=A0 - No ACPI table supplied.<br>
&gt; &gt; &gt; &gt;=C2=A0 - Only minimal device tree nodes.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Arm Trusted Firmware and UEFI porting to this are done =
accordingly.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Hongbo Zhang &lt;<a href=3D"mailto:hongb=
o.zhang@linaro.org" target=3D"_blank">hongbo.zhang@linaro.org</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hi; I&#39;ve had a quick run through this patch. My comments=
<br>
&gt; &gt; &gt; below are mostly about there still being a lot of code<br>
&gt; &gt; &gt; here which has been copied from virt.c but which you do<br>
&gt; &gt; &gt; not need.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If after you&#39;ve done that this patch is still more than<=
br>
&gt; &gt; &gt; about 500 lines long, I would recommend that you split it<br=
>
&gt; &gt; &gt; up into coherent pieces, to make it easier to review.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 hw/arm/Makefile.objs=C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 hw/arm/sbsa-ref.c=C2=A0 =C2=A0 =C2=A0| 937 ++++++=
++++++++++++++++++++++++++++++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 include/hw/arm/virt.h |=C2=A0 =C2=A02 +<br>
&gt; &gt; &gt; &gt;=C2=A0 3 files changed, 940 insertions(+), 1 deletion(-)=
<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 hw/arm/sbsa-ref.c<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.obj=
s<br>
&gt; &gt; &gt; &gt; index d51fcec..a8895eb 100644<br>
&gt; &gt; &gt; &gt; --- a/hw/arm/Makefile.objs<br>
&gt; &gt; &gt; &gt; +++ b/hw/arm/Makefile.objs<br>
&gt; &gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; &gt; -obj-y +=3D boot.o virt.o sysbus-fdt.o<br>
&gt; &gt; &gt; &gt; +obj-y +=3D boot.o virt.o sbsa-ref.o sysbus-fdt.o<br>
&gt; &gt; &gt; &gt;=C2=A0 obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o<br>
&gt; &gt; &gt; &gt;=C2=A0 obj-$(CONFIG_DIGIC) +=3D digic_boards.o<br>
&gt; &gt; &gt; &gt;=C2=A0 obj-$(CONFIG_EXYNOS4) +=3D exynos4_boards.o<br>
&gt; &gt; &gt; &gt; diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c<br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000..28ebb3a<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/hw/arm/sbsa-ref.c<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,937 @@<br>
&gt; &gt; &gt; &gt; +/*<br>
&gt; &gt; &gt; &gt; + * ARM SBSA Reference Platform emulation<br>
&gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; + * Copyright (c) 2018 Linaro Limited<br>
&gt; &gt; &gt; &gt; + * Written by Hongbo Zhang &lt;<a href=3D"mailto:hongb=
o.zhang@linaro.org" target=3D"_blank">hongbo.zhang@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; + * Based on hw/arm/virt.c<br>
&gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; + * This program is free software; you can redistribute=
 it and/or modify it<br>
&gt; &gt; &gt; &gt; + * under the terms and conditions of the GNU General P=
ublic License,<br>
&gt; &gt; &gt; &gt; + * version 2 or later, as published by the Free Softwa=
re Foundation.<br>
&gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; + * This program is distributed in the hope it will be =
useful, but WITHOUT<br>
&gt; &gt; &gt; &gt; + * ANY WARRANTY; without even the implied warranty of =
MERCHANTABILITY or<br>
&gt; &gt; &gt; &gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU=
 General Public License for<br>
&gt; &gt; &gt; &gt; + * more details.<br>
&gt; &gt; &gt; &gt; + *<br>
&gt; &gt; &gt; &gt; + * You should have received a copy of the GNU General =
Public License along with<br>
&gt; &gt; &gt; &gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http=
://www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.g=
nu.org/licenses/</a>&gt;.<br>
&gt; &gt; &gt; &gt; + */<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/arm/virt.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/devices.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;net/net.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;sysemu/device_tree.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;sysemu/numa.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/loader.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/pci-host/gpex.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/arm/sysbus-fdt.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/arm/fdt.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/intc/arm_gic.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/intc/arm_gicv3_common.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;kvm_arm.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/ide/internal.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/ide/ahci_internal.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;hw/usb.h&quot;<br>
&gt; &gt; &gt; &gt; +#include &quot;qemu/units.h&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +#define NUM_IRQS 256<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +#define SATA_NUM_PORTS 6<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +#define RAMLIMIT_GB 255<br>
&gt; &gt; &gt; &gt; +#define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You probably don&#39;t want to stick yourself with the same<=
br>
&gt; &gt; &gt; ram limits that the virt board has, especially since you<br>
&gt; &gt; &gt; don&#39;t need to care about AArch32. Strongly consider<br>
&gt; &gt; &gt; putting the RAM somwhere that lets you get up to a<br>
&gt; &gt; &gt; maximum value that matches what we might expect in<br>
&gt; &gt; &gt; server-class hardware.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static const MemMapEntry sbsa_ref_memmap[] =3D {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Space up to 0x8000000 is reserved for=
 a boot ROM */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_FLASH] =3D=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0x08000000 =
},<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_CPUPERIPHS] =3D=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0{ 0x08000000, 0x00020000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* GIC distributor and CPU interfaces si=
t inside the CPU peripheral space */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_GIC_DIST] =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{ 0x08000000, 0x00010000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_GIC_CPU] =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 { 0x08010000, 0x00010000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* The space in between here is reserved=
 for GICv3 CPU/vCPU/HYP */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* This redistributor space allows up to=
 2*64kB*123 CPUs */<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You don&#39;t need to do the split-redistributor layout that=
<br>
&gt; &gt; &gt; &quot;virt&quot; does because you have no backwards compatib=
ility<br>
&gt; &gt; &gt; concerns. So make the space for redistributors big enough<br=
>
&gt; &gt; &gt; to fit more CPUs in (at least 512, or more if you expect<br>
&gt; &gt; &gt; this board to be used in future for development of a<br>
&gt; &gt; &gt; software stack that handles more).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_GIC_REDIST] =3D=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0{ 0x080A0000, 0x00F60000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_UART] =3D=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x09000000, 0x00001000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_RTC] =3D=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0x09010000, 0x00001000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_GPIO] =3D=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x09030000, 0x00001000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_SECURE_UART] =3D=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 { 0x09040000, 0x00001000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_AHCI] =3D=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x09050000, 0x00010000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_EHCI] =3D=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x09060000, 0x00010000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_SECURE_MEM] =3D=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0{ 0x0e000000, 0x01000000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_PCIE_MMIO] =3D=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 { 0x10000000, 0x7fff0000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_PCIE_PIO] =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{ 0x8fff0000, 0x00010000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_PCIE_ECAM] =3D=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 { 0x90000000, 0x10000000 },<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Second PCIe window, 508GB wide at the=
 4GB boundary */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_PCIE_MMIO_HIGH] =3D=C2=A0 =C2=A0 =
=C2=A0{ 0x100000000ULL, 0x7F00000000ULL },<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Again, you don&#39;t need the layout that &quot;virt&quot; h=
as to<br>
&gt; &gt; &gt; satisfy 32-bit guests and backwards compatibility. You<br>
&gt; &gt; &gt; can just have a single large MMIO window.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Apologies for not spotting this at the time this was posted.<br>
&gt; &gt;<br>
&gt; &gt; The MMIO32 window is not there for the benefit of 32-bit only CPU=
s. It<br>
&gt; &gt; is there for the benefit of PCIe devices with 32-bit memory BARs<=
br>
&gt; &gt; which, given that our PCI MMIO is 1:1 mapped between the CPU and =
PCI<br>
&gt; &gt; address spaces, require a 32-bit addressable CPU mapping. (PCIe<b=
r>
&gt; &gt; permits so-called &#39;legacy&#39; endpoints to have 32-bit MMIO =
BARs)<br>
&gt; &gt;<br>
&gt; &gt; So please, reinstate the MMIO32 window, but keep the other one as=
 well.<br>
&gt; &gt;<br>
&gt; So we still use the old VIRT_PCIE_MMIO starting from fixed address<br>
&gt; 0x10000000, or anywhere within 4G is OK?<br>
&gt;<br>
<br>
Anywhere in the 32-bit addressable area is fine, but please align the<br>
window to its own size.<br>
<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Ard.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_MEM] =3D=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0x8000000000ULL, RAMLIMIT_BYTES },<br>
&gt; &gt; &gt; &gt; +};<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static const int sbsa_ref_irqmap[] =3D {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_UART] =3D 1,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_RTC] =3D 2,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_PCIE] =3D 3, /* ... to 6 */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_GPIO] =3D 7,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_SECURE_UART] =3D 8,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_AHCI] =3D 9,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_EHCI] =3D 10,<br>
&gt; &gt; &gt; &gt; +};<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_fdt(VirtMachineState *vms)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 void *fdt =3D create_device_tree(&amp;vm=
s-&gt;fdt_size);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (!fdt) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;create_=
device_tree() failed&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;fdt =3D fdt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Header */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_string(fdt, &quot;/&quo=
t;, &quot;compatible&quot;, &quot;linux,dummy-virt&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/&quot;=
, &quot;#address-cells&quot;, 0x2);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(fdt, &quot;/&quot;=
, &quot;#size-cells&quot;, 0x2);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* /chosen must exist for load_dtb to fi=
ll in necessary properties later */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_add_subnode(fdt, &quot;/chosen&=
quot;);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (have_numa_distance) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int size =3D nb_numa_nodes=
 * nb_numa_nodes * 3 * sizeof(uint32_t);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *matrix =3D g_mal=
loc0(size);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int idx, i, j;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nb_nu=
ma_nodes; i++) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (j =3D 0=
; j &lt; nb_numa_nodes; j++) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 idx =3D (i * nb_numa_nodes + j) * 3;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 matrix[idx + 0] =3D cpu_to_be32(i);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 matrix[idx + 1] =3D cpu_to_be32(j);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 matrix[idx + 2] =3D cpu_to_be32(numa_info[i].distance[j]);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_add_subnode(fdt, =
&quot;/distance-map&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(fd=
t, &quot;/distance-map&quot;, &quot;compatible&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;numa-dist=
ance-map-v1&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop(fdt, &quo=
t;/distance-map&quot;, &quot;distance-matrix&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0matrix, size);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(matrix);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void fdt_add_cpu_nodes(const VirtMachineState *=
vms)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int cpu;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 const MachineState *ms =3D MACHINE(vms);=
<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_add_subnode(vms-&gt;fdt, &quot;=
/cpus&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* #address-cells should be 2 for Arm v8=
 64-bit systems */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(vms-&gt;fdt, &quot=
;/cpus&quot;, &quot;#address-cells&quot;, 2);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(vms-&gt;fdt, &quot=
;/cpus&quot;, &quot;#size-cells&quot;, 0x0);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for (cpu =3D vms-&gt;smp_cpus - 1; cpu &=
gt;=3D 0; cpu--) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *nodename =3D g_strdu=
p_printf(&quot;/cpus/cpu@%d&quot;, cpu);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARMCPU *armcpu =3D ARM_CPU=
(qemu_get_cpu(cpu));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cs =3D CPU(armcp=
u);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_add_subnode(vms-&=
gt;fdt, nodename);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(vm=
s-&gt;fdt, nodename, &quot;device_type&quot;, &quot;cpu&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_string(vm=
s-&gt;fdt, nodename, &quot;compatible&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a=
rmcpu-&gt;dtb_compatible);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vms-&gt;psci_conduit !=
=3D QEMU_PSCI_CONDUIT_DISABLED<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; v=
ms-&gt;smp_cpus &gt; 1) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_set=
prop_string(vms-&gt;fdt, nodename,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;enable-method&quot;, &quot;psci&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_u64(vms-&=
gt;fdt, nodename, &quot;reg&quot;, armcpu-&gt;mp_affinity);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ms-&gt;possible_cpus-&=
gt;cpus[cs-&gt;cpu_index].props.has_node_id) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_set=
prop_cell(vms-&gt;fdt, nodename, &quot;numa-node-id&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ms-&gt;possible_cpus-&gt;cpus[cs-&gt;cpu_index].props.node_id);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(nodename);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void fdt_add_gic_node(VirtMachineState *vms)<br=
>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 char *nodename;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int nb_redist_regions =3D virt_gicv3_red=
ist_region_count(vms);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;gic_phandle =3D qemu_fdt_alloc_p=
handle(vms-&gt;fdt);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(vms-&gt;fdt, &quot=
;/&quot;, &quot;interrupt-parent&quot;, vms-&gt;gic_phandle);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 nodename =3D g_strdup_printf(&quot;/intc=
@%&quot; PRIx64,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vms-&gt;memmap[V=
IRT_GIC_DIST].base);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_add_subnode(vms-&gt;fdt, nodena=
me);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(vms-&gt;fdt, noden=
ame, &quot;#interrupt-cells&quot;, 3);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop(vms-&gt;fdt, nodename, =
&quot;interrupt-controller&quot;, NULL, 0);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(vms-&gt;fdt, noden=
ame, &quot;#address-cells&quot;, 0x2);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(vms-&gt;fdt, noden=
ame, &quot;#size-cells&quot;, 0x2);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop(vms-&gt;fdt, nodename, =
&quot;ranges&quot;, NULL, 0);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Only GICv3 created */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_string(vms-&gt;fdt, nod=
ename, &quot;compatible&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;arm,gic-v3&quot;);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(vms-&gt;fdt, noden=
ame,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;#redistributor-regions&quot;, =
nb_redist_regions);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (nb_redist_regions =3D=3D 1) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_sized_cel=
ls(vms-&gt;fdt, nodename, &quot;reg&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_DIST].base,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_DIST].size,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_REDIST].base,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_REDIST].size);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 } else {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_sized_cel=
ls(vms-&gt;fdt, nodename, &quot;reg&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_DIST].base,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_DIST].size,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_REDIST].base,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_REDIST].size,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_REDIST2].base,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A02, vms-&gt;memmap[VIRT_GIC_REDIST2].size);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (vms-&gt;virt) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_fdt_setprop_cells(vms=
-&gt;fdt, nodename, &quot;interrupts&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIC_FDT_IRQ_TYPE=
_PPI, ARCH_GICV3_MAINT_IRQ,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GIC_FDT_IRQ_FLAG=
S_LEVEL_HI);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_cell(vms-&gt;fdt, noden=
ame, &quot;phandle&quot;, vms-&gt;gic_phandle);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 g_free(nodename);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This is still generating a lot of device tree nodes.<br>
&gt; &gt; &gt; I thought we had agreed that we were going to just have<br>
&gt; &gt; &gt; a minimal device tree that says &quot;here is the RAM&quot; =
and nothing<br>
&gt; &gt; &gt; else ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_gic(VirtMachineState *vms, qemu_irq=
 *pic)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* We create a standalone GIC */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 DeviceState *gicdev;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 SysBusDevice *gicbusdev;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 const char *gictype;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int i;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 uint32_t nb_redist_regions =3D 0;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 uint32_t redist0_capacity, redist0_count=
;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Only GICv3 created */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 gictype =3D gicv3_class_name();<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 gicdev =3D qdev_create(NULL, gictype);<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(gicdev, &quot;revis=
ion&quot;, 3);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(gicdev, &quot;num-c=
pu&quot;, smp_cpus);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Note that the num-irq property counts=
 both internal and external<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* interrupts; there are always 32 =
of the former (mandated by GIC spec).<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(gicdev, &quot;num-i=
rq&quot;, NUM_IRQS + 32);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (!kvm_irqchip_in_kernel()) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_bit(gicdev, =
&quot;has-security-extensions&quot;, vms-&gt;secure);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 redist0_capacity =3D<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vms-&gt;memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 redist0_count =3D MIN(smp_cpus, redist0_=
capacity);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 nb_redist_regions =3D virt_gicv3_redist_=
region_count(vms);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(gicdev, &quot;len-r=
edist-region-count&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nb_redist_regions);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(gicdev, &quot;redis=
t-region-count[0]&quot;, redist0_count);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (nb_redist_regions =3D=3D 2) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t redist1_capacity =
=3D<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 vms-&gt;memmap[VIRT_GIC_REDIST2].size / GICV3_REDIST_SIZE=
;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_uint32(gicde=
v, &quot;redist-region-count[1]&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIN(smp_cpus=
 - redist0_count, redist1_capacity));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_init_nofail(gicdev);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 gicbusdev =3D SYS_BUS_DEVICE(gicdev);<br=
>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysbus_mmio_map(gicbusdev, 0, vms-&gt;me=
mmap[VIRT_GIC_DIST].base);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysbus_mmio_map(gicbusdev, 1, vms-&gt;me=
mmap[VIRT_GIC_REDIST].base);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (nb_redist_regions =3D=3D 2) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_map(gicbusdev,=
 2, vms-&gt;memmap[VIRT_GIC_REDIST2].base);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Wire the outputs from each CPU&#39;s =
generic timer and the GICv3<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* maintenance interrupt signal to =
the appropriate GIC PPI inputs,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* and the GIC&#39;s IRQ/FIQ/VIRQ/V=
FIQ interrupt outputs to the CPU&#39;s inputs.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; smp_cpus; i++) {<br=
>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceState *cpudev =3D DE=
VICE(qemu_get_cpu(i));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ppibase =3D NUM_IRQS +=
 i * GIC_INTERNAL + GIC_NR_SGIS;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int irq;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Mapping from the output=
 timer irq lines from the CPU to the<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* GIC PPI inputs we =
use for the virt board.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const int timer_irq[] =3D =
{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GTIMER_PHYS=
] =3D ARCH_TIMER_NS_EL1_IRQ,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GTIMER_VIRT=
] =3D ARCH_TIMER_VIRT_IRQ,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GTIMER_HYP]=
=C2=A0 =3D ARCH_TIMER_NS_EL2_IRQ,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [GTIMER_SEC]=
=C2=A0 =3D ARCH_TIMER_S_EL1_IRQ,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (irq =3D 0; irq &lt; A=
RRAY_SIZE(timer_irq); irq++) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect=
_gpio_out(cpudev, irq,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_get=
_gpio_in(gicdev,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ppibase + timer_irq[=
irq]));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out_name=
d(cpudev, &quot;gicv3-maintenance-interrupt&quot;, 0,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q=
dev_get_gpio_in(gicdev, ppibase<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ ARCH_GICV3_=
MAINT_IRQ));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_connect_gpio_out_name=
d(cpudev, &quot;pmu-interrupt&quot;, 0,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q=
dev_get_gpio_in(gicdev, ppibase<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ VIRTUAL_PMU=
_IRQ));<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(gicbusd=
ev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(gicbusd=
ev, i + smp_cpus,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(cpudev, ARM_C=
PU_FIQ));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(gicbusd=
ev, i + 2 * smp_cpus,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(cpudev, ARM_C=
PU_VIRQ));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(gicbusd=
ev, i + 3 * smp_cpus,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_get_gpio_in(cpudev, ARM_C=
PU_VFIQ));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; NUM_IRQS; i++) {<br=
>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pic[i] =3D qdev_get_gpio_i=
n(gicdev, i);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 fdt_add_gic_node(vms);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_uart(const VirtMachineState *vms, q=
emu_irq *pic, int uart,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegion *mem, Chardev *chr)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base =3D vms-&gt;memmap[uart].bas=
e;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int irq =3D vms-&gt;irqmap[uart];<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 DeviceState *dev =3D qdev_create(NULL, &=
quot;pl011&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 SysBusDevice *s =3D SYS_BUS_DEVICE(dev);=
<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_chr(dev, &quot;chardev&quo=
t;, chr);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_init_nofail(dev);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_add_subregion(mem, base,<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_get=
_region(s, 0));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysbus_connect_irq(s, 0, pic[irq]);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_rtc(const VirtMachineState *vms, qe=
mu_irq *pic)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base =3D vms-&gt;memmap[VIRT_RTC]=
.base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int irq =3D vms-&gt;irqmap[VIRT_RTC];<br=
>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysbus_create_simple(&quot;pl031&quot;, =
base, pic[irq]);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_ahci(const VirtMachineState *vms, q=
emu_irq *pic)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base =3D vms-&gt;memmap[VIRT_AHCI=
].base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int irq =3D vms-&gt;irqmap[VIRT_AHCI];<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 DriveInfo *hd[SATA_NUM_PORTS];<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 SysbusAHCIState *sysahci;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 AHCIState *ahci;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int i;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 dev =3D qdev_create(NULL, &quot;sysbus-a=
hci&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-port=
s&quot;, SATA_NUM_PORTS);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_init_nofail(dev);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, =
base);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(dev), =
0, pic[irq]);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysahci =3D SYSBUS_AHCI(dev);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 ahci =3D &amp;sysahci-&gt;ahci;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 ide_drive_get(hd, ARRAY_SIZE(hd));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; ahci-&gt;ports; i++=
) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hd[i] =3D=3D NULL) {<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ide_create_drive(&amp;ahci=
-&gt;dev[i].port, 0, hd[i]);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_ehci(const VirtMachineState *vms, q=
emu_irq *pic)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base =3D vms-&gt;memmap[VIRT_EHCI=
].base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int irq =3D vms-&gt;irqmap[VIRT_EHCI];<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 USBBus *usb_bus;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysbus_create_simple(&quot;exynos4210-eh=
ci-usb&quot;, base, pic[irq]);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What is this using the exynos4210 USB device for? That<br>
&gt; &gt; &gt; is definitely not correct for a generic board.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 usb_bus =3D usb_bus_find(-1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 usb_create_simple(usb_bus, &quot;usb-kbd=
&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 usb_create_simple(usb_bus, &quot;usb-mou=
se&quot;);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Don&#39;t create USB devices by default -- let the user do i=
t on<br>
&gt; &gt; &gt; the command line.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static DeviceState *gpio_key_dev;<br>
&gt; &gt; &gt; &gt; +static void sbsa_ref_powerdown_req(Notifier *n, void *=
opaque)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* use gpio Pin 3 for power button event=
 */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_set_irq(qdev_get_gpio_in(gpio_key_d=
ev, 0), 1);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static Notifier sbsa_ref_powerdown_notifier =3D {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 .notify =3D sbsa_ref_powerdown_req<br>
&gt; &gt; &gt; &gt; +};<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_gpio(const VirtMachineState *vms, q=
emu_irq *pic)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 DeviceState *pl061_dev;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base =3D vms-&gt;memmap[VIRT_GPIO=
].base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int irq =3D vms-&gt;irqmap[VIRT_GPIO];<b=
r>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 pl061_dev =3D sysbus_create_simple(&quot=
;pl061&quot;, base, pic[irq]);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 gpio_key_dev =3D sysbus_create_simple(&q=
uot;gpio-key&quot;, -1,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 qdev_get_gpio_in(pl061_dev, 3));<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* connect powerdown request */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_register_powerdown_notifier(&amp;sb=
sa_ref_powerdown_notifier);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_one_flash(const char *name, hwaddr =
flashbase,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr flashsize, const=
 char *file,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion *sysmem)<b=
r>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Create and map a single flash device.=
 We use the same<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* parameters as the flash devices =
on the Versatile Express board.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 DriveInfo *dinfo =3D drive_get_next(IF_P=
FLASH);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 DeviceState *dev =3D qdev_create(NULL, &=
quot;cfi.pflash01&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev=
);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 const uint64_t sectorlength =3D 256 * 10=
24;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (dinfo) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_drive(dev, &=
quot;drive&quot;, blk_by_legacy_dinfo(dinfo),<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;num-bloc=
ks&quot;, flashsize / sectorlength);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint64(dev, &quot;sector-l=
ength&quot;, sectorlength);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint8(dev, &quot;width&quo=
t;, 4);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint8(dev, &quot;device-wi=
dth&quot;, 2);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_bit(dev, &quot;big-endian&=
quot;, false);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint16(dev, &quot;id0&quot=
;, 0x89);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint16(dev, &quot;id1&quot=
;, 0x18);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint16(dev, &quot;id2&quot=
;, 0x00);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_uint16(dev, &quot;id3&quot=
;, 0x00);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_prop_set_string(dev, &quot;name&quo=
t;, name);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_init_nofail(dev);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_add_subregion(sysmem, flas=
hbase,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_get=
_region(SYS_BUS_DEVICE(dev), 0));<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (file) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *fn;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int image_size;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (drive_get(IF_PFLASH, 0=
, 0)) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report=
(&quot;The contents of the first flash device may be &quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;specified with -bios or with -d=
rive if=3Dpflash... &quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;but you cannot use both options=
 at once&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D qemu_find_file(QEMU=
_FILE_TYPE_BIOS, file);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!fn) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report=
(&quot;Could not find ROM image &#39;%s&#39;&quot;, file);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_size =3D load_image_=
mr(fn, sysbus_mmio_get_region(sbd, 0));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(fn);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (image_size &lt; 0) {<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report=
(&quot;Could not load ROM image &#39;%s&#39;&quot;, file);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_flash(const VirtMachineState *vms,<=
br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion *sysmem,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemoryRegion *secure_sysmem)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Create two flash devices to fill the =
VIRT_FLASH space in the memmap.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* Any file passed via -bios goes i=
n the first of these.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* sysmem is the system memory spac=
e. secure_sysmem is the secure view<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* of the system, and the first fla=
sh device should be made visible only<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* there. The second flash device i=
s visible to both secure and nonsecure.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* If sysmem =3D=3D secure_sysmem t=
his means there is no separate Secure<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* address space and both flash dev=
ices are generally visible.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr flashsize =3D vms-&gt;memmap[VIRT=
_FLASH].size / 2;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr flashbase =3D vms-&gt;memmap[VIRT=
_FLASH].base;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_one_flash(&quot;sbsa-ref.flash0&q=
uot;, flashbase, flashsize,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bios_name, secure_sysmem);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_one_flash(&quot;sbsa-ref.flash1&q=
uot;, flashbase + flashsize, flashsize,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0NULL, sysmem);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_smmu(const VirtMachineState *vms, q=
emu_irq *pic,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PCIBus *bus)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int irq =3D=C2=A0 vms-&gt;irqmap[VIRT_SM=
MU];<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int i;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base =3D vms-&gt;memmap[VIRT_SMMU=
].base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (vms-&gt;iommu !=3D VIRT_IOMMU_SMMUV3=
) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 dev =3D qdev_create(NULL, &quot;arm-smmu=
v3&quot;);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 object_property_set_link(OBJECT(dev), OB=
JECT(bus), &quot;primary-bus&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_init_nofail(dev);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, =
base);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; NUM_SMMU_IRQS; i++)=
 {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS=
_DEVICE(dev), i, pic[irq + i]);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_pcie(VirtMachineState *vms, qemu_ir=
q *pic)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base_mmio =3D vms-&gt;memmap[VIRT=
_PCIE_MMIO].base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr size_mmio =3D vms-&gt;memmap[VIRT=
_PCIE_MMIO].size;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base_mmio_high =3D vms-&gt;memmap=
[VIRT_PCIE_MMIO_HIGH].base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr size_mmio_high =3D vms-&gt;memmap=
[VIRT_PCIE_MMIO_HIGH].size;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base_pio =3D vms-&gt;memmap[VIRT_=
PCIE_PIO].base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base_ecam, size_ecam;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int irq =3D vms-&gt;irqmap[VIRT_PCIE];<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *mmio_alias;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *mmio_reg;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *ecam_alias;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *ecam_reg;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int i, ecam_id;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 PCIHostState *pci;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 dev =3D qdev_create(NULL, TYPE_GPEX_HOST=
);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_init_nofail(dev);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 ecam_id =3D VIRT_ECAM_ID(vms-&gt;highmem=
_ecam);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 base_ecam =3D vms-&gt;memmap[ecam_id].ba=
se;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 size_ecam =3D vms-&gt;memmap[ecam_id].si=
ze;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Map only the first size_ecam bytes of=
 ECAM space */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 ecam_alias =3D g_new0(MemoryRegion, 1);<=
br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 ecam_reg =3D sysbus_mmio_get_region(SYS_=
BUS_DEVICE(dev), 0);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_init_alias(ecam_alias, OBJ=
ECT(dev), &quot;pcie-ecam&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ecam_reg, 0, size_ecam)=
;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_add_subregion(get_system_m=
emory(), base_ecam, ecam_alias);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Map the MMIO window into system addre=
ss space so as to expose<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* the section of PCI MMIO space wh=
ich starts at the same base address<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* (ie 1:1 mapping for that part of=
 PCI MMIO space visible through<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* the window).<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mmio_alias =3D g_new0(MemoryRegion, 1);<=
br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mmio_reg =3D sysbus_mmio_get_region(SYS_=
BUS_DEVICE(dev), 1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_init_alias(mmio_alias, OBJ=
ECT(dev), &quot;pcie-mmio&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmio_reg, base_mmio, si=
ze_mmio);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_add_subregion(get_system_m=
emory(), base_mmio, mmio_alias);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (vms-&gt;highmem) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Map high MMIO space */<=
br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegion *high_mmio_al=
ias =3D g_new0(MemoryRegion, 1);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_init_alias(h=
igh_mmio_alias, OBJECT(dev), &quot;pcie-mmio-high&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmio_reg,=
 base_mmio_high, size_mmio_high);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregio=
n(get_system_memory(), base_mmio_high,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h=
igh_mmio_alias);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Map IO port space */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, =
base_pio);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; GPEX_NUM_IRQS; i++)=
 {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS=
_DEVICE(dev), i, pic[irq + i]);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gpex_set_irq_num(GPEX_HOST=
(dev), i, irq + i);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 pci =3D PCI_HOST_BRIDGE(dev);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (pci-&gt;bus) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nb_ni=
cs; i++) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NICInfo *nd =
=3D &amp;nd_table[i];<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!nd-&gt;=
model) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 nd-&gt;model =3D g_strdup(&quot;e1000e&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_nic_init=
_nofail(nd, pci-&gt;bus, nd-&gt;model, NULL);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 pci_create_simple(pci-&gt;bus, -1, &quot=
;VGA&quot;);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (vms-&gt;iommu) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_smmu(vms, pic, pci-=
&gt;bus);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void create_secure_ram(VirtMachineState *vms,<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegion *secure_s=
ysmem)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *secram =3D g_new(MemoryReg=
ion, 1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr base =3D vms-&gt;memmap[VIRT_SECU=
RE_MEM].base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 hwaddr size =3D vms-&gt;memmap[VIRT_SECU=
RE_MEM].size;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_init_ram(secram, NULL, &qu=
ot;sbsa-ref.secure-ram&quot;, size,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_add_subregion(secure_sysme=
m, base, secram);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void *sbsa_ref_dtb(const struct arm_boot_info *=
binfo, int *fdt_size)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 const VirtMachineState *board =3D contai=
ner_of(binfo, VirtMachineState,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootinfo);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 *fdt_size =3D board-&gt;fdt_size;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return board-&gt;fdt;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static<br>
&gt; &gt; &gt; &gt; +void sbsa_ref_machine_done(Notifier *notifier, void *d=
ata)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D container_of(n=
otifier, VirtMachineState,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0machine_done);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 ARMCPU *cpu =3D ARM_CPU(first_cpu);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 struct arm_boot_info *info =3D &amp;vms-=
&gt;bootinfo;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 AddressSpace *as =3D arm_boot_address_sp=
ace(cpu, info);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (arm_load_dtb(info-&gt;dtb_start, inf=
o, info-&gt;dtb_limit, as) &lt; 0) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The virt board needs a machine-done notifier because it has<=
br>
&gt; &gt; &gt; to add extra things to the DTB here. You don&#39;t, so you d=
on&#39;t<br>
&gt; &gt; &gt; need one. Don&#39;t set bootinfo.skip_dtb_autoload to true, =
and<br>
&gt; &gt; &gt; then the boot.c code will do the arm_load_dtb() call for you=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void sbsa_ref_init(MachineState *machine)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(m=
achine);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineClass *vmc =3D VIRT_MACHINE_G=
ET_CLASS(machine);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_GET_CLASS(m=
achine);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 const CPUArchIdList *possible_cpus;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_irq pic[NUM_IRQS];<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *sysmem =3D get_system_memo=
ry();<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *secure_sysmem =3D NULL;<br=
>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int n, sbsa_max_cpus;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *ram =3D g_new(MemoryRegion=
, 1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 bool firmware_loaded =3D bios_name || dr=
ive_get(IF_PFLASH, 0, 0);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 bool aarch64 =3D true;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (strcmp(machine-&gt;cpu_type, ARM_CPU=
_TYPE_NAME(&quot;cortex-a57&quot;))) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;sbsa-re=
f: CPU type %s not supported&quot;, machine-&gt;cpu_type);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (kvm_enabled()) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;sbsa-re=
f: KVM is not supported at this machine&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (machine-&gt;kernel_filename &amp;&am=
p; firmware_loaded) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;sbsa-re=
f: No fw_cfg device on this machine, &quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;so -kernel option is not supported when firmw=
are loaded, &quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;please load hard disk instead&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If ther is no fw_cfg device, why does your memory map datast=
ructure<br>
&gt; &gt; &gt; have an entry for it earlier ?<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 [VIRT_FW_CFG] =3D=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x09020000, 0x00000018 },<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* If we have an EL3 boot ROM then the a=
ssumption is that it will<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* implement PSCI itself, so disabl=
e QEMU&#39;s internal implementation<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* so it doesn&#39;t get in the way=
. Instead of starting secondary<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* CPUs in PSCI powerdown state we =
will start them all running and<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* let the boot ROM sort them out.<=
br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* The usual case is that we do use=
 QEMU&#39;s PSCI implementation;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* if the guest has EL2 then we wil=
l use SMC as the conduit,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* and otherwise we will use HVC (f=
or backwards compatibility and<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0* because if we&#39;re using KVM t=
hen we must use HVC).<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (vms-&gt;secure &amp;&amp; firmware_l=
oaded) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vms-&gt;psci_conduit =3D Q=
EMU_PSCI_CONDUIT_DISABLED;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 } else if (vms-&gt;virt) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vms-&gt;psci_conduit =3D Q=
EMU_PSCI_CONDUIT_SMC;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 } else {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vms-&gt;psci_conduit =3D Q=
EMU_PSCI_CONDUIT_HVC;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Do you actually intend this to work in all these cases? I<br=
>
&gt; &gt; &gt; thought the intention was &quot;always start the boot rom in=
 EL3&quot;<br>
&gt; &gt; &gt; for this board, like the real hardware would. In that case, =
most<br>
&gt; &gt; &gt; of these if clauses are dead code.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* Only GICv3 is uesd in this machine */=
<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sbsa_max_cpus =3D vms-&gt;memmap[VIRT_GI=
C_REDIST].size / GICV3_REDIST_SIZE;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 sbsa_max_cpus +=3D vms-&gt;memmap[VIRT_G=
IC_REDIST2].size / GICV3_REDIST_SIZE;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (max_cpus &gt; sbsa_max_cpus) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Number =
of SMP CPUs requested (%d) exceeds max CPUs &quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;supported by machine &#39;sbsa-ref&#39; (%d)&=
quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0max_cpus, sbsa_max_cpus);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;smp_cpus =3D smp_cpus;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (machine-&gt;ram_size &gt; vms-&gt;me=
mmap[VIRT_MEM].size) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;sbsa-re=
f: cannot model more than %dGB RAM&quot;, RAMLIMIT_GB);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (vms-&gt;secure) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The Secure view of the =
world is the same as the NonSecure,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* but with a few ext=
ra devices. Create it as a container region<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* containing the sys=
tem memory at low priority; any secure-only<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* devices go in at h=
igher priority and take precedence.<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 secure_sysmem =3D g_new(Me=
moryRegion, 1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_init(secure_=
sysmem, OBJECT(machine), &quot;secure-memory&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UINT64_MAX);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregio=
n_overlap(secure_sysmem, 0, sysmem, -1);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Again, unless you intentionally want to support both &quot;h=
as EL3&quot;<br>
&gt; &gt; &gt; and &quot;does not have EL3&quot; configs for this board, yo=
u don&#39;t need<br>
&gt; &gt; &gt; to do this conditionally.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_fdt(vms);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 possible_cpus =3D mc-&gt;possible_cpu_ar=
ch_ids(machine);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for (n =3D 0; n &lt; possible_cpus-&gt;l=
en; n++) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Object *cpuobj;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CPUState *cs;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n &gt;=3D smp_cpus) {<=
br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpuobj =3D object_new(poss=
ible_cpus-&gt;cpus[n].type);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_int(cp=
uobj, possible_cpus-&gt;cpus[n].arch_id,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mp-affini=
ty&quot;, NULL);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs =3D CPU(cpuobj);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;cpu_index =3D n;<br=
>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 numa_cpu_pre_plug(&amp;pos=
sible_cpus-&gt;cpus[cs-&gt;cpu_index], DEVICE(cpuobj),<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_fatal);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 aarch64 &amp;=3D object_pr=
operty_get_bool(cpuobj, &quot;aarch64&quot;, NULL);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vms-&gt;secure) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_prope=
rty_set_bool(cpuobj, false, &quot;has_el3&quot;, NULL);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vms-&gt;virt &amp;&am=
p; object_property_find(cpuobj, &quot;has_el2&quot;, NULL)) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_prope=
rty_set_bool(cpuobj, false, &quot;has_el2&quot;, NULL);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vms-&gt;psci_conduit !=
=3D QEMU_PSCI_CONDUIT_DISABLED) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_prope=
rty_set_int(cpuobj, vms-&gt;psci_conduit,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;psci-conduit&quot;, NULL);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Secondary=
 CPUs start in PSCI powered-down state */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n &gt; 0=
) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 object_property_set_bool(cpuobj, true,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;start-powered-off&quot;, NULL);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vmc-&gt;no_pmu &amp;&a=
mp; object_property_find(cpuobj, &quot;pmu&quot;, NULL)) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_prope=
rty_set_bool(cpuobj, false, &quot;pmu&quot;, NULL);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (object_property_find(c=
puobj, &quot;reset-cbar&quot;, NULL)) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_prope=
rty_set_int(cpuobj, vms-&gt;memmap[VIRT_CPUPERIPHS].base,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;reset-cbar&quot;, &amp;error_abort);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_link(c=
puobj, OBJECT(sysmem), &quot;memory&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;erro=
r_abort);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vms-&gt;secure) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_prope=
rty_set_link(cpuobj, OBJECT(secure_sysmem),<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;secure-memory&quot;, &amp;error_abort);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_bool(c=
puobj, true, &quot;realized&quot;, &amp;error_fatal);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_unref(cpuobj);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 fdt_add_cpu_nodes(vms);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_allocate_system_memory(ram=
, NULL, &quot;sbsa-ref.ram&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0machine-&gt;ram_size);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 memory_region_add_subregion(sysmem, vms-=
&gt;memmap[VIRT_MEM].base, ram);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_flash(vms, sysmem, secure_sysmem =
? secure_sysmem : sysmem);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_gic(vms, pic);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_uart(vms, pic, VIRT_UART, sysmem,=
 serial_hd(0));<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (vms-&gt;secure) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_secure_ram(vms, sec=
ure_sysmem);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_uart(vms, pic, VIRT=
_SECURE_UART, secure_sysmem, serial_hd(1));<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;highmem_ecam &amp;=3D vms-&gt;hi=
ghmem &amp;&amp; (!firmware_loaded || aarch64);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_rtc(vms, pic);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_pcie(vms, pic);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_gpio(vms, pic);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_ahci(vms, pic);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 create_ehci(vms, pic);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.ram_size =3D machine-&g=
t;ram_size;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.kernel_filename =3D mac=
hine-&gt;kernel_filename;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.kernel_cmdline =3D mach=
ine-&gt;kernel_cmdline;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.initrd_filename =3D mac=
hine-&gt;initrd_filename;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.nb_cpus =3D smp_cpus;<b=
r>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.board_id =3D -1;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.loader_start =3D vms-&g=
t;memmap[VIRT_MEM].base;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.get_dtb =3D sbsa_ref_dt=
b;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.skip_dtb_autoload =3D t=
rue;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;bootinfo.firmware_loaded =3D fir=
mware_loaded;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 arm_load_kernel(ARM_CPU(first_cpu), &amp=
;vms-&gt;bootinfo);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;machine_done.notify =3D sbsa_ref=
_machine_done;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_add_machine_init_done_notifier(&amp=
;vms-&gt;machine_done);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static bool sbsa_ref_get_secure(Object *obj, Error **e=
rrp)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(o=
bj);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return vms-&gt;secure;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void sbsa_ref_set_secure(Object *obj, bool valu=
e, Error **errp)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(o=
bj);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;secure =3D value;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static bool sbsa_ref_get_virt(Object *obj, Error **err=
p)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(o=
bj);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return vms-&gt;virt;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void sbsa_ref_set_virt(Object *obj, bool value,=
 Error **errp)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(o=
bj);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;virt =3D value;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static CpuInstanceProperties<br>
&gt; &gt; &gt; &gt; +sbsa_ref_cpu_index_to_props(MachineState *ms, unsigned=
 cpu_index)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_GET_CLASS(m=
s);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 const CPUArchIdList *possible_cpus =3D m=
c-&gt;possible_cpu_arch_ids(ms);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 assert(cpu_index &lt; possible_cpus-&gt;=
len);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return possible_cpus-&gt;cpus[cpu_index]=
.props;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static int64_t<br>
&gt; &gt; &gt; &gt; +sbsa_ref_get_default_cpu_node_id(const MachineState *m=
s, int idx)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return idx % nb_numa_nodes;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static uint64_t sbsa_ref_cpu_mp_affinity(VirtMachineSt=
ate *vms, int idx)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t clustersz =3D ARM_DEFAULT_CPUS_P=
ER_CLUSTER;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineClass *vmc =3D VIRT_MACHINE_G=
ET_CLASS(vms);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (!vmc-&gt;disallow_affinity_adjustmen=
t) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Only GICv3 is used in t=
his machine */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 clustersz =3D GICV3_TARGET=
LIST_BITS;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return arm_cpu_mp_affinity(idx, clusters=
z);<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static const CPUArchIdList *sbsa_ref_possible_cpu_arch=
_ids(MachineState *ms)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 int n;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(m=
s);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 if (ms-&gt;possible_cpus) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(ms-&gt;possible_cpu=
s-&gt;len =3D=3D max_cpus);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ms-&gt;possible_cpu=
s;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 ms-&gt;possible_cpus =3D g_malloc0(sizeo=
f(CPUArchIdList) +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(C=
PUArchId) * max_cpus);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 ms-&gt;possible_cpus-&gt;len =3D max_cpu=
s;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for (n =3D 0; n &lt; ms-&gt;possible_cpu=
s-&gt;len; n++) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ms-&gt;possible_cpus-&gt;c=
pus[n].type =3D ms-&gt;cpu_type;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ms-&gt;possible_cpus-&gt;c=
pus[n].arch_id =3D<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sbsa_ref_cpu=
_mp_affinity(vms, n);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ms-&gt;possible_cpus-&gt;c=
pus[n].props.has_thread_id =3D true;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ms-&gt;possible_cpus-&gt;c=
pus[n].props.thread_id =3D n;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 return ms-&gt;possible_cpus;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void sbsa_ref_instance_init(Object *obj)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VirtMachineState *vms =3D VIRT_MACHINE(o=
bj);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;secure =3D true;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 object_property_add_bool(obj, &quot;secu=
re&quot;, sbsa_ref_get_secure,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sbsa_ref_set_secure, NU=
LL);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 object_property_set_description(obj, &qu=
ot;secure&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;Set on/off to enable/disable the ARM &quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;Security Extensions (TrustZone)&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 N=
ULL);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;virt =3D true;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 object_property_add_bool(obj, &quot;virt=
ualization&quot;, sbsa_ref_get_virt,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sbsa_ref_set_virt, NULL=
);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 object_property_set_description(obj, &qu=
ot;virtualization&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;Set on/off to enable/disable emulating a &quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;guest CPU which implements the ARM &quot;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
quot;Virtualization Extensions&quot;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 N=
ULL);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Drop the properties unless you need to actually support<br>
&gt; &gt; &gt; all the different variations.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;highmem =3D true;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;iommu =3D VIRT_IOMMU_NONE;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;gic_version =3D 3;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;memmap =3D sbsa_ref_memmap;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 vms-&gt;irqmap =3D sbsa_ref_irqmap;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void sbsa_ref_class_init(ObjectClass *oc, void =
*data)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<=
br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;init =3D sbsa_ref_init;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;max_cpus =3D 246;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;block_default_type =3D IF_IDE;<br=
>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;no_cdrom =3D 1;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;pci_allow_0_address =3D true;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;minimum_page_bits =3D 12;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;possible_cpu_arch_ids =3D sbsa_re=
f_possible_cpu_arch_ids;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;cpu_index_to_instance_props =3D s=
bsa_ref_cpu_index_to_props;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;default_cpu_type =3D ARM_CPU_TYPE=
_NAME(&quot;cortex-a57&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;get_default_cpu_node_id =3D sbsa_=
ref_get_default_cpu_node_id;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;default_ram_size =3D 1 * GiB;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;default_cpus =3D 4;<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;QEMU &#39;SBSA Ref=
erence&#39; ARM Virtual Machine&quot;;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static const TypeInfo sbsa_ref_info =3D {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D MACHINE_TYPE_NAME(&quot;sbsa-ref&quot;),<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D T=
YPE_VIRT_MACHINE,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 .instance_init =3D sbsa_ref_instance_ini=
t,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D sbsa_ref_cl=
ass_init,<br>
&gt; &gt; &gt; &gt; +};<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +static void sbsa_ref_machine_init(void)<br>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 type_register_static(&amp;sbsa_ref_info)=
;<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +type_init(sbsa_ref_machine_init);<br>
&gt; &gt; &gt; &gt; diff --git a/include/hw/arm/virt.h b/include/hw/arm/vir=
t.h<br>
&gt; &gt; &gt; &gt; index 9a870cc..f6c48be 100644<br>
&gt; &gt; &gt; &gt; --- a/include/hw/arm/virt.h<br>
&gt; &gt; &gt; &gt; +++ b/include/hw/arm/virt.h<br>
&gt; &gt; &gt; &gt; @@ -78,6 +78,8 @@ enum {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 VIRT_GPIO,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 VIRT_SECURE_UART,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 VIRT_SECURE_MEM,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VIRT_AHCI,<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 VIRT_EHCI,<br>
&gt; &gt; &gt; &gt;=C2=A0 };<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 typedef enum VirtIOMMUType {<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; thanks<br>
&gt; &gt; &gt; -- PMM<br>
</blockquote></div>

--000000000000d662210580c0e642--
