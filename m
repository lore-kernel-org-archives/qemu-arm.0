Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp512098wrg;
        Mon, 3 Jun 2019 03:54:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbV2xKVzsP2qcfBzSQdlj+wbVPxBXPzhU5o36Jk1EVL6aBjGctcz0u5tn74lwiCm7H1JTs
X-Received: by 2002:a37:6895:: with SMTP id d143mr18993825qkc.94.1559559299232;
        Mon, 03 Jun 2019 03:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559559299; cv=none;
        d=google.com; s=arc-20160816;
        b=J7iJQA0rV6LLcFr7QhmvjyOzQgA4r8OuDd0GPaks49tTV39Q1FGNDwpWEYbfq5uOD8
         gG9uzjESU8U+BW27lRLBnPn123xd+i/3oMmHP5mQUKkfazqdXsjF+xuraqKfa8Zc3xOP
         12rrFQT35VaJbqIo4jp0hqvhh3J0m6IQXkcbAnih5ASfARMX4Hg+HZQYsBDAnKa0QcgS
         w2scu1RInr4Re469q5enjwSZOoKDCAYyFOWKezRxn4ns2RMrkOHsubuR4aNDlRetw5qm
         wISvzJImwxe4DWFrhEoZI5+KffM+HZqDDo5Ynuik1TL8ace49EvMQ+BSX85G22J71gm7
         8VCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=FKVaUyQDP4UZmEjuKT+lBbuCZenpuAeo2JD08Ql4eaE=;
        b=eS5Im4B2Q+JbLhwlL/wv+1k0SBVz5wPVjuu+AxUFoC9p6VN2SLlM/v0LBKv3DP9Gy/
         tudBlBK/pEdSGMKuouhUhcEwU3KzByEMpbbsX68VaAXiT7aVsDeJvZv2XUoRTB6FMLNf
         k6bCSHEJjNNTM+0YJlibu5aD4z28kg79d2C+pgVR69gxkIdk68Q857tnWSHB7b2j64XS
         K6NARDXYxJ1R54Dzso7GYrL43l+cvcTmaLMXn2WILnJmMlUZ+a8c96Ddj+JNMdW0/vXH
         GVhhhnpk9/pt8D2Mciup3RfvqSX+hktAGs6fyVZHKVkRDVK97xio9Aj9sRsvwwFCIj7n
         K+Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f49si77067qvh.165.2019.06.03.03.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Jun 2019 03:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hXkcE-0005qQ-NJ
	for alex.bennee@linaro.org; Mon, 03 Jun 2019 06:54:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hXkc2-0005pz-4z
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 06:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hXkbz-0003SG-D9
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 06:54:46 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40493)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hXkbz-0003PU-55
	for qemu-arm@nongnu.org; Mon, 03 Jun 2019 06:54:43 -0400
Received: by mail-wm1-f65.google.com with SMTP id u16so5317780wmc.5
	for <qemu-arm@nongnu.org>; Mon, 03 Jun 2019 03:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FKVaUyQDP4UZmEjuKT+lBbuCZenpuAeo2JD08Ql4eaE=;
	b=oATRgjTvjzGyK8O5Je5Q86ys71g6u2B9fDzB2hultyeUfNYPcg5DOz4ZFSqe5D9KW1
	7J59Lf84xiSmxCTaOfz6ght9F0yGcdvjvY6FHZO2QDJo/qWzq6hDHA3/w69b3B96yU3V
	kKe89q30H3rZvPs4tBD3nmkfs7O7EMUqnSPnCc4ZL43h4pJ2F96Vi60gZTZaDRQJvfQw
	BNCcEOAyPTvund0wruxPROl++uSet7essZJivsY2qA+haXVU0PJjpLWKySPRef7lx78q
	fCiZSW5B+HcSAxHjqbl9BVCUT6TugRkShORv0DALEx9fMfaFnzGjECYH8UoOhAJVjYvp
	7Erg==
X-Gm-Message-State: APjAAAUrIzoWQS5xqG2AVoXJrHuWzT891Qdq0aXTanCavSoeF0kHisf/
	orpjhPr0/pfUbn+5GvkLryB78g==
X-Received: by 2002:a1c:6545:: with SMTP id z66mr1884463wmb.77.1559559281410; 
	Mon, 03 Jun 2019 03:54:41 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.183]) by smtp.gmail.com with ESMTPSA id
	k2sm24967003wrg.41.2019.06.03.03.54.40
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jun 2019 03:54:40 -0700 (PDT)
To: Hongbo Zhang <hongbo.zhang@linaro.org>, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
	<1555560291-3415-3-git-send-email-hongbo.zhang@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ed731639-5ed1-5473-f078-e62f8fa98678@redhat.com>
Date: Mon, 3 Jun 2019 12:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555560291-3415-3-git-send-email-hongbo.zhang@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 2/2] hw/arm: Add arm SBSA
 reference machine, devices part
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
Cc: radoslaw.biernacki@linaro.org, Laszlo Ersek <lersek@redhat.com>,
	leif.lindholm@linaro.org, ard.biesheuvel@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rugJQg3O+Cwe

Hi Hongbo, Ard.

On 4/18/19 6:04 AM, Hongbo Zhang wrote:
> Following the previous patch, this patch adds peripheral devices to the
> newly introduced SBSA-ref machine.
> 
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 451 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 451 insertions(+)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 652ec13..3fb0027 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -21,6 +21,7 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/units.h"
> +#include "sysemu/device_tree.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/sysemu.h"
>  #include "exec/address-spaces.h"
> @@ -28,11 +29,28 @@
>  #include "kvm_arm.h"
>  #include "hw/arm/arm.h"
>  #include "hw/boards.h"
> +#include "hw/ide/internal.h"
> +#include "hw/ide/ahci_internal.h"
>  #include "hw/intc/arm_gicv3_common.h"
> +#include "hw/loader.h"
> +#include "hw/pci-host/gpex.h"
> +#include "hw/usb.h"
> +#include "net/net.h"
>  
>  #define RAMLIMIT_GB 8192
>  #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
>  
> +#define NUM_IRQS        256
> +#define NUM_SMMU_IRQS   4
> +#define NUM_SATA_PORTS  6
> +
> +#define VIRTUAL_PMU_IRQ        7
> +#define ARCH_GIC_MAINT_IRQ     9
> +#define ARCH_TIMER_VIRT_IRQ    11
> +#define ARCH_TIMER_S_EL1_IRQ   13
> +#define ARCH_TIMER_NS_EL1_IRQ  14
> +#define ARCH_TIMER_NS_EL2_IRQ  10
> +
>  enum {
>      SBSA_FLASH,
>      SBSA_MEM,
> @@ -115,6 +133,415 @@ static const int sbsa_ref_irqmap[] = {
>      [SBSA_EHCI] = 11,
>  };
>  
> +/*
> + * Firmware on this machine only uses ACPI table to load OS, these limited
> + * device tree nodes are just to let firmware know the info which varies from
> + * command line parameters, so it is not necessary to be fully compatible
> + * with the kernel CPU and NUMA binding rules.
> + */
> +static void create_fdt(SBSAMachineState *vms)
> +{
> +    void *fdt = create_device_tree(&vms->fdt_size);
> +    const MachineState *ms = MACHINE(vms);
> +    int cpu;
> +
> +    if (!fdt) {
> +        error_report("create_device_tree() failed");
> +        exit(1);
> +    }
> +
> +    vms->fdt = fdt;
> +
> +    qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,sbsa-ref");
> +    qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
> +    qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
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
> +        qemu_fdt_setprop(fdt, "/distance-map", "distance-matrix",
> +                         matrix, size);
> +        g_free(matrix);
> +    }
> +
> +    qemu_fdt_add_subnode(vms->fdt, "/cpus");
> +
> +    for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
> +        char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> +        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
> +        CPUState *cs = CPU(armcpu);
> +
> +        qemu_fdt_add_subnode(vms->fdt, nodename);
> +
> +        if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
> +            qemu_fdt_setprop_cell(vms->fdt, nodename, "numa-node-id",
> +                ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
> +        }
> +
> +        g_free(nodename);
> +    }
> +}
> +
> +static void create_one_flash(const char *name, hwaddr flashbase,
> +                             hwaddr flashsize, const char *file,
> +                             MemoryRegion *sysmem)
> +{
> +    /*
> +     * Create and map a single flash device. We use the same
> +     * parameters as the flash devices on the Versatile Express board.
> +     */
> +    DriveInfo *dinfo = drive_get_next(IF_PFLASH);
> +    DeviceState *dev = qdev_create(NULL, "cfi.pflash01");

Please use TYPE_PFLASH_CFI01 instead of "cfi.pflash01".

I wanted to ask "does it has to be CFI01?" because this device model is
in bad shape, but I guess I answered myself looking at the EDK2 platform
code:

- P30_CFI_ADDR_VENDOR_ID is not used
- NorFlashDxe::NorFlashReadCfiData() is not implemented
- All commands in NorFlashDxe uses:
    SEND_NOR_COMMAND(..., P30_CMD_...)
  which are specific to the Intel P30 Nor flash family (CFI01).

> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    const uint64_t sectorlength = 256 * 1024;
> +
> +    if (dinfo) {
> +        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo),
> +                            &error_abort);
> +    }
> +
> +    qdev_prop_set_uint32(dev, "num-blocks", flashsize / sectorlength);
> +    qdev_prop_set_uint64(dev, "sector-length", sectorlength);
> +    qdev_prop_set_uint8(dev, "width", 4);
> +    qdev_prop_set_uint8(dev, "device-width", 2);
> +    qdev_prop_set_bit(dev, "big-endian", false);
> +    qdev_prop_set_uint16(dev, "id0", 0x89);
> +    qdev_prop_set_uint16(dev, "id1", 0x18);
> +    qdev_prop_set_uint16(dev, "id2", 0x00);
> +    qdev_prop_set_uint16(dev, "id3", 0x00);
> +    qdev_prop_set_string(dev, "name", name);
> +    qdev_init_nofail(dev);
> +
> +    memory_region_add_subregion(sysmem, flashbase,
> +                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0));
> +
> +    if (file) {
> +        char *fn;
> +        int image_size;
> +
> +        if (drive_get(IF_PFLASH, 0, 0)) {
> +            error_report("The contents of the first flash device may be "
> +                         "specified with -bios or with -drive if=pflash... "
> +                         "but you cannot use both options at once");
> +            exit(1);
> +        }
> +        fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, file);
> +        if (!fn) {
> +            error_report("Could not find ROM image '%s'", file);
> +            exit(1);
> +        }
> +        image_size = load_image_mr(fn, sysbus_mmio_get_region(sbd, 0));
> +        g_free(fn);
> +        if (image_size < 0) {
> +            error_report("Could not load ROM image '%s'", file);
> +            exit(1);
> +        }
> +    }
> +}
> +
> +static void create_flash(const SBSAMachineState *vms,
> +                         MemoryRegion *sysmem,
> +                         MemoryRegion *secure_sysmem)
> +{
> +    /*
> +     * Create one secure and nonsecure flash devices to fill SBSA_FLASH
> +     * space in the memmap, file passed via -bios goes in the first one.
> +     */
> +    hwaddr flashsize = vms->memmap[SBSA_FLASH].size / 2;
> +    hwaddr flashbase = vms->memmap[SBSA_FLASH].base;
> +
> +    create_one_flash("sbsa-ref.flash0", flashbase, flashsize,
> +                     bios_name, secure_sysmem);
> +    create_one_flash("sbsa-ref.flash1", flashbase + flashsize, flashsize,
> +                     NULL, sysmem);

static const MemMapEntry base_memmap[] = {
    /* Space up to 0x8000000 is reserved for a boot ROM */
    [VIRT_FLASH] =              {          0, 0x08000000 },

So you are creating 2 identical flashes of 128MiB/2 = 64 MiB each which
are the biggest flash you can have:

"The P30 family provides density upgrades from 64-Mbit through
512-Mbit." On Intel, the 512-Mib case is particular in that it is built
of 2x 256-Mib on the same die, with a virtual chip enable. It is simpler
to use a Micron or Numonyx model.

I plan to use a whitelist of supported (and tested...) models, the one
you use seems the Micron JS28F512P30EF ('E' for 'Symetrically Blocked',
since the current model doesn't support bottom/top blocks layout), or in
short: 28F512P30E.
Ard, is that OK?

Checking EDK2 git history, the driver is part of ArmPlatformPkg,
imported in commit 1d5d0ae92d9541, based on 'Versatile Express'.

On the Versatile Express and the RealView Emulation Baseboard user
guides, I only find reference of "64MB of NOR flash" with no specific model.

Peter, do you have physical access to tell me what flashes are used on
real hardware? I googled for Linux console boot log but the kernel
doesn't seem to care about detecting/mapping the flash.

QEMU added the flash to the Versatile board in commit 964c695a54ceda3a,
with the following description:

    - add support for the 64MB NOR CFI01 flash available at
    0x34000000 on the versatilepb board

http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0225d/BBAJIHEC.html

However on this link I only see "SSMC Chip Select 1, normally NOR flash
(During boot remapping, this can be NOR flash, Disk-on-Chip, or static
expansion memory)". Again, nothing specific (which makes sense, why
restrict the users to a particuliar family, as long as the pinout matches).

The Manufacturer/Device ID used in QEMU (0x0089, 0x0018) correspond to
the Micron 28F128J3D (128-Mbit, 128 symmetrical blocks of 128-KiB).
Neither the flash size (64 vs 16) nor the block size (256 vs 128) match.

The safer fix here is to find a CFI01 flash of 256 sectors of 256-KiB
and update the Manufacturer/Device IDs in QEMU. Luckily this matches the
28F512P30E cited previously :)

Regards,

Phil.

> +}
> +
> +static void create_secure_ram(SBSAMachineState *vms,
> +                              MemoryRegion *secure_sysmem)
> +{
> +    MemoryRegion *secram = g_new(MemoryRegion, 1);
> +    hwaddr base = vms->memmap[SBSA_SECURE_MEM].base;
> +    hwaddr size = vms->memmap[SBSA_SECURE_MEM].size;
> +
> +    memory_region_init_ram(secram, NULL, "sbsa-ref.secure-ram", size,
> +                           &error_fatal);
> +    memory_region_add_subregion(secure_sysmem, base, secram);
> +}
> +
> +static void create_gic(SBSAMachineState *vms, qemu_irq *pic)
> +{
> +    DeviceState *gicdev;
> +    SysBusDevice *gicbusdev;
> +    const char *gictype;
> +    uint32_t redist0_capacity, redist0_count;
> +    int i;
> +
> +    gictype = gicv3_class_name();
> +
> +    gicdev = qdev_create(NULL, gictype);
> +    qdev_prop_set_uint32(gicdev, "revision", 3);
> +    qdev_prop_set_uint32(gicdev, "num-cpu", smp_cpus);
> +    /*
> +     * Note that the num-irq property counts both internal and external
> +     * interrupts; there are always 32 of the former (mandated by GIC spec).
> +     */
> +    qdev_prop_set_uint32(gicdev, "num-irq", NUM_IRQS + 32);
> +    qdev_prop_set_bit(gicdev, "has-security-extensions", true);
> +
> +    redist0_capacity =
> +                vms->memmap[SBSA_GIC_REDIST].size / GICV3_REDIST_SIZE;
> +    redist0_count = MIN(smp_cpus, redist0_capacity);
> +
> +    qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
> +    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", redist0_count);
> +
> +    qdev_init_nofail(gicdev);
> +    gicbusdev = SYS_BUS_DEVICE(gicdev);
> +    sysbus_mmio_map(gicbusdev, 0, vms->memmap[SBSA_GIC_DIST].base);
> +    sysbus_mmio_map(gicbusdev, 1, vms->memmap[SBSA_GIC_REDIST].base);
> +
> +    /*
> +     * Wire the outputs from each CPU's generic timer and the GICv3
> +     * maintenance interrupt signal to the appropriate GIC PPI inputs,
> +     * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
> +     */
> +    for (i = 0; i < smp_cpus; i++) {
> +        DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
> +        int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
> +        int irq;
> +        /*
> +         * Mapping from the output timer irq lines from the CPU to the
> +         * GIC PPI inputs used for this board.
> +         */
> +        const int timer_irq[] = {
> +            [GTIMER_PHYS] = ARCH_TIMER_NS_EL1_IRQ,
> +            [GTIMER_VIRT] = ARCH_TIMER_VIRT_IRQ,
> +            [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
> +            [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
> +        };
> +
> +        for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
> +            qdev_connect_gpio_out(cpudev, irq,
> +                                  qdev_get_gpio_in(gicdev,
> +                                                   ppibase + timer_irq[irq]));
> +        }
> +
> +        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
> +                                    qdev_get_gpio_in(gicdev, ppibase
> +                                                     + ARCH_GIC_MAINT_IRQ));
> +        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> +                                    qdev_get_gpio_in(gicdev, ppibase
> +                                                     + VIRTUAL_PMU_IRQ));
> +
> +        sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
> +        sysbus_connect_irq(gicbusdev, i + smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
> +        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
> +        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
> +    }
> +
> +    for (i = 0; i < NUM_IRQS; i++) {
> +        pic[i] = qdev_get_gpio_in(gicdev, i);
> +    }
> +}
> +
> +static void create_uart(const SBSAMachineState *vms, qemu_irq *pic, int uart,
> +                        MemoryRegion *mem, Chardev *chr)
> +{
> +    hwaddr base = vms->memmap[uart].base;
> +    int irq = vms->irqmap[uart];
> +    DeviceState *dev = qdev_create(NULL, "pl011");
> +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> +
> +    qdev_prop_set_chr(dev, "chardev", chr);
> +    qdev_init_nofail(dev);
> +    memory_region_add_subregion(mem, base,
> +                                sysbus_mmio_get_region(s, 0));
> +    sysbus_connect_irq(s, 0, pic[irq]);
> +}
> +
> +static void create_rtc(const SBSAMachineState *vms, qemu_irq *pic)
> +{
> +    hwaddr base = vms->memmap[SBSA_RTC].base;
> +    int irq = vms->irqmap[SBSA_RTC];
> +
> +    sysbus_create_simple("pl031", base, pic[irq]);
> +}
> +
> +static DeviceState *gpio_key_dev;
> +static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
> +{
> +    /* use gpio Pin 3 for power button event */
> +    qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
> +}
> +
> +static Notifier sbsa_ref_powerdown_notifier = {
> +    .notify = sbsa_ref_powerdown_req
> +};
> +
> +static void create_gpio(const SBSAMachineState *vms, qemu_irq *pic)
> +{
> +    DeviceState *pl061_dev;
> +    hwaddr base = vms->memmap[SBSA_GPIO].base;
> +    int irq = vms->irqmap[SBSA_GPIO];
> +
> +    pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
> +
> +    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
> +                                        qdev_get_gpio_in(pl061_dev, 3));
> +
> +    /* connect powerdown request */
> +    qemu_register_powerdown_notifier(&sbsa_ref_powerdown_notifier);
> +}
> +
> +static void create_ahci(const SBSAMachineState *vms, qemu_irq *pic)
> +{
> +    hwaddr base = vms->memmap[SBSA_AHCI].base;
> +    int irq = vms->irqmap[SBSA_AHCI];
> +    DeviceState *dev;
> +    DriveInfo *hd[NUM_SATA_PORTS];
> +    SysbusAHCIState *sysahci;
> +    AHCIState *ahci;
> +    int i;
> +
> +    dev = qdev_create(NULL, "sysbus-ahci");
> +    qdev_prop_set_uint32(dev, "num-ports", NUM_SATA_PORTS);
> +    qdev_init_nofail(dev);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[irq]);
> +
> +    sysahci = SYSBUS_AHCI(dev);
> +    ahci = &sysahci->ahci;
> +    ide_drive_get(hd, ARRAY_SIZE(hd));
> +    for (i = 0; i < ahci->ports; i++) {
> +        if (hd[i] == NULL) {
> +            continue;
> +        }
> +        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
> +    }
> +}
> +
> +static void create_ehci(const SBSAMachineState *vms, qemu_irq *pic)
> +{
> +    hwaddr base = vms->memmap[SBSA_EHCI].base;
> +    int irq = vms->irqmap[SBSA_EHCI];
> +    USBBus *usb_bus;
> +
> +    sysbus_create_simple("platform-ehci-usb", base, pic[irq]);
> +
> +    usb_bus = usb_bus_find(-1);
> +    usb_create_simple(usb_bus, "usb-kbd");
> +    usb_create_simple(usb_bus, "usb-mouse");
> +}
> +
> +static void create_smmu(const SBSAMachineState *vms, qemu_irq *pic,
> +                        PCIBus *bus)
> +{
> +    hwaddr base = vms->memmap[SBSA_SMMU].base;
> +    int irq =  vms->irqmap[SBSA_SMMU];
> +    DeviceState *dev;
> +    int i;
> +
> +    dev = qdev_create(NULL, "arm-smmuv3");
> +
> +    object_property_set_link(OBJECT(dev), OBJECT(bus), "primary-bus",
> +                             &error_abort);
> +    qdev_init_nofail(dev);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
> +    for (i = 0; i < NUM_SMMU_IRQS; i++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
> +    }
> +}
> +
> +static void create_pcie(SBSAMachineState *vms, qemu_irq *pic)
> +{
> +    hwaddr base_ecam = vms->memmap[SBSA_PCIE_ECAM].base;
> +    hwaddr size_ecam = vms->memmap[SBSA_PCIE_ECAM].size;
> +    hwaddr base_mmio = vms->memmap[SBSA_PCIE_MMIO].base;
> +    hwaddr size_mmio = vms->memmap[SBSA_PCIE_MMIO].size;
> +    hwaddr base_mmio_high = vms->memmap[SBSA_PCIE_MMIO_HIGH].base;
> +    hwaddr size_mmio_high = vms->memmap[SBSA_PCIE_MMIO_HIGH].size;
> +    hwaddr base_pio = vms->memmap[SBSA_PCIE_PIO].base;
> +    int irq = vms->irqmap[SBSA_PCIE];
> +    MemoryRegion *mmio_alias, *mmio_alias_high, *mmio_reg;
> +    MemoryRegion *ecam_alias, *ecam_reg;
> +    DeviceState *dev;
> +    PCIHostState *pci;
> +    int i;
> +
> +    dev = qdev_create(NULL, TYPE_GPEX_HOST);
> +    qdev_init_nofail(dev);
> +
> +    /* Map ECAM space */
> +    ecam_alias = g_new0(MemoryRegion, 1);
> +    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> +    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
> +                             ecam_reg, 0, size_ecam);
> +    memory_region_add_subregion(get_system_memory(), base_ecam, ecam_alias);
> +
> +    /* Map the MMIO space */
> +    mmio_alias = g_new0(MemoryRegion, 1);
> +    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> +    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
> +                             mmio_reg, base_mmio, size_mmio);
> +    memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
> +
> +    /* Map the MMIO_HIGH space */
> +    mmio_alias_high = g_new0(MemoryRegion, 1);
> +    memory_region_init_alias(mmio_alias_high, OBJECT(dev), "pcie-mmio-high",
> +                             mmio_reg, base_mmio_high, size_mmio_high);
> +    memory_region_add_subregion(get_system_memory(), base_mmio_high,
> +                                mmio_alias_high);
> +
> +    /* Map IO port space */
> +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, base_pio);
> +
> +    for (i = 0; i < GPEX_NUM_IRQS; i++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
> +        gpex_set_irq_num(GPEX_HOST(dev), i, irq + i);
> +    }
> +
> +    pci = PCI_HOST_BRIDGE(dev);
> +    if (pci->bus) {
> +        for (i = 0; i < nb_nics; i++) {
> +            NICInfo *nd = &nd_table[i];
> +
> +            if (!nd->model) {
> +                nd->model = g_strdup("e1000e");
> +            }
> +
> +            pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
> +        }
> +    }
> +
> +    pci_create_simple(pci->bus, -1, "VGA");
> +
> +    create_smmu(vms, pic, pci->bus);
> +}
> +
> +static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size)
> +{
> +    const SBSAMachineState *board = container_of(binfo, SBSAMachineState,
> +                                                 bootinfo);
> +
> +    *fdt_size = board->fdt_size;
> +    return board->fdt;
> +}
> +
>  static void sbsa_ref_init(MachineState *machine)
>  {
>      SBSAMachineState *vms = SBSA_MACHINE(machine);
> @@ -125,6 +552,7 @@ static void sbsa_ref_init(MachineState *machine)
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>      const CPUArchIdList *possible_cpus;
>      int n, sbsa_max_cpus;
> +    qemu_irq pic[NUM_IRQS];
>  
>      if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
>          error_report("sbsa-ref: CPU type other than the built-in "
> @@ -209,11 +637,34 @@ static void sbsa_ref_init(MachineState *machine)
>                                           machine->ram_size);
>      memory_region_add_subregion(sysmem, vms->memmap[SBSA_MEM].base, ram);
>  
> +    create_fdt(vms);
> +
> +    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
> +
> +    create_secure_ram(vms, secure_sysmem);
> +
> +    create_gic(vms, pic);
> +
> +    create_uart(vms, pic, SBSA_UART, sysmem, serial_hd(0));
> +    create_uart(vms, pic, SBSA_SECURE_UART, secure_sysmem, serial_hd(1));
> +    create_uart(vms, pic, SBSA_SECURE_UART_MM, secure_sysmem, serial_hd(2));
> +
> +    create_rtc(vms, pic);
> +
> +    create_gpio(vms, pic);
> +
> +    create_ahci(vms, pic);
> +
> +    create_ehci(vms, pic);
> +
> +    create_pcie(vms, pic);
> +
>      vms->bootinfo.ram_size = machine->ram_size;
>      vms->bootinfo.kernel_filename = machine->kernel_filename;
>      vms->bootinfo.nb_cpus = smp_cpus;
>      vms->bootinfo.board_id = -1;
>      vms->bootinfo.loader_start = vms->memmap[SBSA_MEM].base;
> +    vms->bootinfo.get_dtb = sbsa_ref_dtb;
>      vms->bootinfo.firmware_loaded = firmware_loaded;
>      arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
>  }
> 
