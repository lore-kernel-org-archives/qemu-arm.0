Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp5622771wrd;
        Tue, 18 Sep 2018 12:44:40 -0700 (PDT)
X-Received: by 2002:a9d:4507:: with SMTP id w7-v6mr16462510ote.105.1537299880540;
        Tue, 18 Sep 2018 12:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537299880; cv=none;
        d=google.com; s=arc-20160816;
        b=fMS0tbsRoUcHM0g5f9mGdRB1NbgUrizJE9EB+9J5FK4kBaszGkkeh8dsBe50B4W3un
         D6piAsGFGr/Ch76NkVQwzj0LHKKPuP60P3nmOQY2GE9bv0+hXJ9iqFhD7iQXSOWk6eQX
         FQYHPMj7lgROdMGrnDrg3xMiPg2TNXag3qj4slLAMpoEWNx8AVcipwOTDxHwpEpab5xv
         gwDiz9iG3JQ0Azp7TK8V/vzBoNnTNQwRW6wO3qgAc13HSh7p7NTtJaoICdg4rdRW/I8G
         fFeMaBI5m9F+K33ppFtlDy3y2VPX35hHWGrzsPJblV7RYLIxdxTaOUxEZXlJZz8xZGlx
         OpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=GR5q8ZeciU2/U4CuSIwUcpI0PTB2sT+pc/HNuhODOzM=;
        b=hMjBQX+fiVy720Brppxbf2cb5PJShMG2evyXCT0iREa1Z/qDUlZOxGbRjFSGOOrydU
         0vtDxiqbiDDI0lVsGOBQ6bj2Ab+q8lDX8rIFBBcJHoyVsV0236rseeI7yfQwtq+QnzGI
         wNsEpD9t5OccA/xP67511GKtaRrPJDOFED8xwehxY9z5TtNFaMpIg5jVe/l0UBsruSi0
         3YiPH5TU0RAa8sgMHFU7rBlUbJR+pVAHR/bfPoX4RiAHjcT5CC4tzCKkQ3FY5a/Ji4fH
         /9FIJ3vekSne4JAW53KHVQerTc/E4KxuXKWgnPMYwcbkcxl47STCWyVzjPYVIRrHti5d
         4xMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hsLydqq0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 1-v6sor10532154oto.55.2018.09.18.12.44.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Sep 2018 12:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hsLydqq0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=GR5q8ZeciU2/U4CuSIwUcpI0PTB2sT+pc/HNuhODOzM=;
        b=hsLydqq0kCfsELqUFBznNJ92uRyW2sV0tXI8NvYRBiLaKzJFcDOJtN5qmwAv1X4UeW
         Pj5NJ3EqlG7qF278bVdd+3qymk7pKAS/Rb8Q9lP6n0lmqX+e3KdmrFcB+25XI1/TAc9g
         CTM3krANwcOBiTmhifHNWUZq3RRAF8ZGqGBS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=GR5q8ZeciU2/U4CuSIwUcpI0PTB2sT+pc/HNuhODOzM=;
        b=Pe18aLLFrWJf4YrRITCusXYJashAzv8h90cCnpg44PLCGsTx037Ak9vWLqzcL/885p
         CK3nHB2ERPOGBuWOjpDq1/ESsSE49/qXdzEBlvvMreoen+VKHngezidM6IF4iGFG59KW
         hfhrRbVwf+plPC0yi5s+V6f/V+R11g4w/dr/qJu9SIauT8Zgpq0IsnQC6F+wf7L6MSnr
         rXM2G1OaRWA1S1RwCEP1KGFAJfCv8NgYoKAok8cwEPkevpjRuysXIbs94Uqqvpe36aug
         UC8mi5y+VrVDsl69XUt5fVC3uApNXceDfJBzS2v6ZqvlpHoKnOM5tiHe0CHl3dc7fu4z
         mclw==
X-Gm-Message-State: APzg51DeFGWfJvxuMhGdqcL8I9vkkq+Ws2SQbyduK4KIC1Hq/B71XpZm
	oRw+JeQFkAWEhKna9l8YRWHywDK7Qaw5zqur8LTvB8Ao
X-Google-Smtp-Source: ANB0VdbmOWkj4RGPaECjZEGugZW8QV6bvKLqS0hpFc7C97388ynECb7s8zuU0KNiOsrQd8/rHrLTnjXghDC1krSeaJQ=
X-Received: by 2002:a9d:cb7:: with SMTP id b52-v6mr5259411otb.98.1537299875403;
 Tue, 18 Sep 2018 12:44:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 18 Sep 2018 12:44:14
 -0700 (PDT)
In-Reply-To: <1536488638-29326-1-git-send-email-hongbo.zhang@linaro.org>
References: <1536488638-29326-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Sep 2018 12:44:14 -0700
Message-ID: <CAFEAcA-vg88gJKHKa8xOVdNvTp_dk3THwhY+eFdxvPtrXq8CjQ@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm: Add arm SBSA reference machine
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: RTWJxHabPy/u

On 9 September 2018 at 03:23, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware, for supporting
> firmware and OS development for pysical Aarch64 machines.
>
> This patch introduces new machine type 'sbsa-ref' with main features:
>  - Based on 'virt' machine type.
>  - Re-designed memory map.
>  - EL2 and EL3 are enabled by default.
>  - GIC version 3 only.
>  - AHCI controller attached to system bus, and then CDROM and hard disc
>    can be added to it.
>  - EHCI controller attached to system bus, with USB mouse and key board
>    installed by default.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>  - No virtio functions enabled, since this is to emulate real hardware.
>  - No paravirtualized fw_cfg devicei either.
>  - No ACPI table, it should be supplied by firmware.
>
> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
> Changes since v2:
>  - rename the platform 'sbsa-ref'
>  - move all the codes to a separate file sbsa-ref.c
>  - remove paravirtualized fw_cfg device
>  - do not supply ACPI tables, since firmware will do it
>  - supply only necessary DT nodes
>  - and other minor code clean up
>
>  hw/arm/Makefile.objs  |    2 +-
>  hw/arm/sbsa-ref.c     | 1184 +++++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |    2 +
>  3 files changed, 1187 insertions(+), 1 deletion(-)
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
> index 0000000..b5e19f4
> --- /dev/null
> +++ b/hw/arm/sbsa-ref.c
> @@ -0,0 +1,1184 @@
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
> +#include "hw/sysbus.h"
> +#include "hw/arm/arm.h"
> +#include "hw/arm/primecell.h"
> +#include "hw/arm/virt.h"Please remove all the code you don't need, rather than
just copin


> +#include "hw/devices.h"
> +#include "net/net.h"
> +#include "sysemu/device_tree.h"
> +#include "sysemu/numa.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/compat.h"
> +#include "hw/loader.h"
> +#include "exec/address-spaces.h"
> +#include "qemu/bitops.h"
> +#include "qemu/error-report.h"
> +#include "hw/pci-host/gpex.h"
> +#include "hw/arm/sysbus-fdt.h"
> +#include "hw/platform-bus.h"
> +#include "hw/arm/fdt.h"
> +#include "hw/intc/arm_gic.h"
> +#include "hw/intc/arm_gicv3_common.h"
> +#include "kvm_arm.h"
> +#include "hw/smbios/smbios.h"
> +#include "qapi/visitor.h"
> +#include "standard-headers/linux/input.h"
> +#include "hw/arm/smmuv3.h"
> +#include "hw/ide/internal.h"
> +#include "hw/ide/ahci_internal.h"
> +#include "hw/usb.h"
> +#include "qemu/units.h"
> +
> +/* Number of external interrupt lines to configure the GIC with */
> +#define NUM_IRQS 256
> +
> +#define PLATFORM_BUS_NUM_IRQS 64
> +
> +#define SATA_NUM_PORTS 6
> +
> +#define RAMLIMIT_GB 255
> +#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
> +
> +static const MemMapEntry sbsa_ref_memmap[] = {
> +    /* Space up to 0x8000000 is reserved for a boot ROM */
> +    [VIRT_FLASH] =              {          0, 0x08000000 },
> +    [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
> +    /* GIC distributor and CPU interfaces sit inside the CPU peripheral space */
> +    [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
> +    [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
> +    [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
> +    /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
> +    [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
> +    /* This redistributor space allows up to 2*64kB*123 CPUs */
> +    [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
> +    [VIRT_UART] =               { 0x09000000, 0x00001000 },
> +    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
> +    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
> +    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
> +    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> +    [VIRT_AHCI] =               { 0x09050000, 0x00010000 },
> +    [VIRT_EHCI] =               { 0x09060000, 0x00010000 },
> +    [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> +    [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
> +    [VIRT_PCIE_MMIO] =          { 0x10000000, 0x7fff0000 },
> +    [VIRT_PCIE_PIO] =           { 0x8fff0000, 0x00010000 },
> +    [VIRT_PCIE_ECAM] =          { 0x90000000, 0x10000000 },
> +    /* Second PCIe window, 508GB wide at the 4GB boundary */
> +    [VIRT_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0x7F00000000ULL },
> +    [VIRT_MEM] =                { 0x8000000000ULL, RAMLIMIT_BYTES },
> +};
> +
> +static const int sbsa_ref_irqmap[] = {
> +    [VIRT_UART] = 1,
> +    [VIRT_RTC] = 2,
> +    [VIRT_PCIE] = 3, /* ... to 6 */
> +    [VIRT_GPIO] = 7,
> +    [VIRT_SECURE_UART] = 8,
> +    [VIRT_AHCI] = 9,
> +    [VIRT_EHCI] = 10,
> +    [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
> +    [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
> +};
> +
> +static const char *valid_cpus[] = {
> +    ARM_CPU_TYPE_NAME("cortex-a53"),
> +    ARM_CPU_TYPE_NAME("cortex-a57"),
> +    ARM_CPU_TYPE_NAME("max"),

I don't think you need or want to support multiple CPU types.

> +};
> +
> +static bool cpu_type_valid(const char *cpu)
> +{
> +    int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
> +        if (strcmp(cpu, valid_cpus[i]) == 0) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +static void create_fdt(VirtMachineState *vms)
> +{
> +    void *fdt = create_device_tree(&vms->fdt_size);
> +
> +    if (!fdt) {
> +        error_report("create_device_tree() failed");
> +        exit(1);
> +    }
> +
> +    vms->fdt = fdt;
> +
> +    /* Header */
> +    qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
> +    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> +    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> +
> +    /* /chosen must exist for load_dtb to fill in necessary properties later */
> +    qemu_fdt_add_subnode(fdt, "/chosen");
> +
> +    /* Clock node, for the benefit of the UART. The kernel device tree
> +     * binding documentation claims the PL011 node clock properties are
> +     * optional but in practice if you omit them the kernel refuses to
> +     * probe for the device.
> +     */
> +    vms->clock_phandle = qemu_fdt_alloc_phandle(fdt);
> +    qemu_fdt_add_subnode(fdt, "/apb-pclk");
> +    qemu_fdt_setprop_string(fdt, "/apb-pclk", "compatible", "fixed-clock");
> +    qemu_fdt_setprop_cell(fdt, "/apb-pclk", "#clock-cells", 0x0);
> +    qemu_fdt_setprop_cell(fdt, "/apb-pclk", "clock-frequency", 24000000);
> +    qemu_fdt_setprop_string(fdt, "/apb-pclk", "clock-output-names",
> +                                "clk24mhz");
> +    qemu_fdt_setprop_cell(fdt, "/apb-pclk", "phandle", vms->clock_phandle);

Does the limited fdt for the sbsa reference machine need to have
this apb-pclk data in it?

> +
> +    if (have_numa_distance) {
> +        int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
> +        uint32_t *matrix = g_malloc0(size);
> +        int idx, i, j;
> +
> +        for (i = 0; i < nb_numa_nodes; i++) {
> +            for (j = 0; j < nb_numa_nodes; j++) {
> +                idx = (i * nb_numa_nodes + j) * 3;
> +                matrix[idx + 0] = cpu_to_be32(i);
> +                matrix[idx + 1] = cpu_to_be32(j);
> +                matrix[idx + 2] = cpu_to_be32(numa_info[i].distance[j]);
> +            }
> +        }
> +
> +        qemu_fdt_add_subnode(fdt, "/distance-map");
> +        qemu_fdt_setprop_string(fdt, "/distance-map", "compatible",
> +                                "numa-distance-map-v1");
> +        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
> +                         matrix, size);
> +        g_free(matrix);
> +    }
> +}
> +
> +static void fdt_add_timer_nodes(const VirtMachineState *vms)
> +{
> +    /* On real hardware these interrupts are level-triggered.
> +     * On KVM they were edge-triggered before host kernel version 4.4,
> +     * and level-triggered afterwards.
> +     * On emulated QEMU they are level-triggered.
> +     *
> +     * Getting the DTB info about them wrong is awkward for some
> +     * guest kernels:
> +     *  pre-4.8 ignore the DT and leave the interrupt configured
> +     *   with whatever the GIC reset value (or the bootloader) left it at
> +     *  4.8 before rc6 honour the incorrect data by programming it back
> +     *   into the GIC, causing problems
> +     *  4.8rc6 and later ignore the DT and always write "level triggered"
> +     *   into the GIC
> +     */
> +    ARMCPU *armcpu;
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
> +
> +    if (vmc->claim_edge_triggered_timers) {
> +        irqflags = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
> +    }
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/timer");
> +
> +    armcpu = ARM_CPU(qemu_get_cpu(0));
> +    if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> +        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
> +        qemu_fdt_setprop(vms->fdt, "/timer", "compatible",
> +                         compat, sizeof(compat));
> +    } else {
> +        qemu_fdt_setprop_string(vms->fdt, "/timer", "compatible",
> +                                "arm,armv7-timer");
> +    }
> +    qemu_fdt_setprop(vms->fdt, "/timer", "always-on", NULL, 0);
> +    qemu_fdt_setprop_cells(vms->fdt, "/timer", "interrupts",
> +                       GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_S_EL1_IRQ, irqflags,
> +                       GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL1_IRQ, irqflags,
> +                       GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_VIRT_IRQ, irqflags,
> +                       GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL2_IRQ, irqflags);

More fdt nodes you don't need. You don't want to just copy the whole of virt's
FDT code into this source file. You want the absolute minimum amount of FDT
generation that is required by the firmware you're going to be running.



> +}
> +
> +static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> +{
> +    int cpu;
> +    int addr_cells = 1;
> +    const MachineState *ms = MACHINE(vms);
> +
> +    /*
> +     * From Documentation/devicetree/bindings/arm/cpus.txt
> +     *  On ARM v8 64-bit systems value should be set to 2,
> +     *  that corresponds to the MPIDR_EL1 register size.
> +     *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> +     *  in the system, #address-cells can be set to 1, since
> +     *  MPIDR_EL1[63:32] bits are not used for CPUs
> +     *  identification.
> +     *
> +     *  Here we actually don't know whether our system is 32- or 64-bit one.

This too is code you don't need (for instance for SBSA you do
know that you have a 64-bit system).


The purpose of suggesting that we use a separate file from the
virt board is that we can remove all the complexities that the
virt board has for fdt generation, and just have a simpler
board code file which does only what the sbsa reference board
needs.

Please can you go through and remove all the unnecessary code
here; I think you should end up with a much smaller source file
which will then be easier to review too.

thanks
-- PMM
