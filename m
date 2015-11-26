Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id ot9sm28999715wjc.12.2015.11.26.09.14.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2015 09:14:55 -0800 (PST)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B3EDC3E02EA;
	Thu, 26 Nov 2015 17:14:54 +0000 (GMT)
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org> <1447946528-1533-7-git-send-email-eric.auger@linaro.org>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org, thomas.lendacky@amd.com, b.reynal@virtualopensystems.com, patches@linaro.org, suravee.suthikulpanit@amd.com, pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-devel] [RESEND RFC 6/6] hw/arm/sysbus-fdt: enable amd-xgbe dynamic instantiation
In-reply-to: <1447946528-1533-7-git-send-email-eric.auger@linaro.org>
Date: Thu, 26 Nov 2015 17:14:54 +0000
Message-ID: <87vb8obs35.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: nBsSsPxuUEsA


Eric Auger <eric.auger@linaro.org> writes:

> This patch allows the instantiation of the vfio-amd-xgbe device
> from the QEMU command line (-device vfio-amd-xgbe,host="<device>").
>
> The guest is exposed with a device tree node that combines the description
> of both XGBE and PHY (representation supported from 4.2 onwards kernel):
> Documentation/devicetree/bindings/net/amd-xgbe.txt.
>
> There are 5 register regions, 6 interrupts including 4 optional
> edge-sensitive per-channel interrupts.
>
> Property values are inherited from host device tree. It is mandated
> host uses device tree, dtc binary is installed, and the host also uses a
> combined XGBE/PHY representation (>= 4.2 host kernel).

I might ping you later about this as I'm running 4.3 but can't see the
device. However my board could be a very old rev.

>
> 2 clock nodes (dma and ptp) also are created. It is mandated those clocks
> are fixed on host side.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> ---
>  hw/arm/sysbus-fdt.c | 171 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 167 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 22e5801..b13d380 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -22,6 +22,7 @@
>   */
>
>  #include <libfdt.h>
> +#include <linux/vfio.h>
>  #include "hw/arm/sysbus-fdt.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/device_tree.h"
> @@ -29,8 +30,10 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/vfio/vfio-platform.h"
>  #include "hw/vfio/vfio-calxeda-xgmac.h"
> +#include "hw/vfio/vfio-amd-xgbe.h"
>  #include "hw/arm/fdt.h"
>
> +
>  /*
>   * internal struct that contains the information to create dynamic
>   * sysbus device node
> @@ -120,10 +123,7 @@ static HostProperty clock_inherited_properties[] = {
>   * host_phandle: phandle of the clock in host device tree
>   * guest_phandle: phandle to assign to the guest node
>   */
> -int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
> -                                uint32_t host_phandle,
> -                                uint32_t guest_phandle);
> -int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
> +static int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>                                  uint32_t host_phandle,
>                                  uint32_t guest_phandle)
>  {

This looks like it should be squashed with 5/6.

> @@ -166,6 +166,21 @@ out:
>      return ret;
>  }
>
> +/**
> + * sysfs_to_dt_name
> + *
> + * convert the name found in sysfs into the node name
> + * for instance e0900000.xgmac is converted into xgmac@e0900000
> + */
> +static char *sysfs_to_dt_name(const char *sysfs_name)
> +{
> +    gchar **substrings =  g_strsplit(sysfs_name, ".", 2);
> +    char *dt_name;
> +
> +    dt_name = g_strdup_printf("%s@%s", substrings[1], substrings[0]);

You need to g_strfreev(substrings) once you are done.

> +    return dt_name;
> +}
> +
>  /* Device Specific Code */
>
>  /**
> @@ -233,9 +248,157 @@ fail_reg:
>      return ret;
>  }
>
> +
> +/* AMD xgbe properties whose values are copied/pasted from host */
> +static HostProperty amd_xgbe_inherited_properties[] = {
> +    {"compatible", 0},
> +    {"dma-coherent", 1},
> +    {"amd,per-channel-interrupt", 1},
> +    {"phy-mode", 0},
> +    {"mac-address", 1},
> +    {"amd,speed-set", 0},
> +    {"amd,serdes-blwc", 1},
> +    {"amd,serdes-cdr-rate", 1},
> +    {"amd,serdes-pq-skew", 1},
> +    {"amd,serdes-tx-amp", 1},
> +    {"amd,serdes-dfe-tap-config", 1},
> +    {"amd,serdes-dfe-tap-enable", 1},
> +    {"clock-names", 0},
> +};
> +
> +/**
> + * add_amd_xgbe_fdt_node
> + *
> + * Generates the combined xgbe/phy node following kernel >=4.2
> + * binding documentation:
> + * Documentation/devicetree/bindings/net/amd-xgbe.txt:
> + * Also 2 clock nodes are created (dma and ptp)
> + */
> +static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
> +{
> +    PlatformBusFDTData *data = opaque;
> +    PlatformBusDevice *pbus = data->pbus;
> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
> +    VFIODevice *vbasedev = &vdev->vbasedev;
> +    VFIOINTp *intp;
> +    const char *parent_node = data->pbus_node_name;
> +    char *node_path, *nodename, *dt_name;
> +    void *guest_fdt = data->fdt, *host_fdt;
> +    const void *r;
> +    int i, ret = -1, prop_len;
> +    uint32_t *irq_attr, *reg_attr, *host_clock_phandles;
> +    uint64_t mmio_base, irq_number;
> +    uint32_t guest_clock_phandles[2];
> +
> +    host_fdt = load_device_tree_from_sysfs();
> +    if (!host_fdt) {
> +        goto stop;
> +    }
> +    dt_name = sysfs_to_dt_name(vbasedev->name);
> +    ret = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat, &node_path);
> +    g_free(dt_name);
> +
> +    if (ret) {
> +        goto stop;
> +    }
> +
> +    /* generate nodes for DMA_CLK and PTP_CLK */
> +    r = qemu_fdt_getprop(host_fdt, node_path, "clocks", &prop_len);
> +    if (prop_len != 8) {
> +        goto stop;
> +    }
> +    host_clock_phandles = (uint32_t *)r;
> +    host_clock_phandles[0] = be32_to_cpu(host_clock_phandles[0]);
> +    host_clock_phandles[1] = be32_to_cpu(host_clock_phandles[1]);
> +    guest_clock_phandles[0] = qemu_fdt_alloc_phandle(guest_fdt);
> +    guest_clock_phandles[1] = qemu_fdt_alloc_phandle(guest_fdt);
> +
> +    ret = fdt_build_clock_node(host_fdt, guest_fdt,
> +                               host_clock_phandles[0],
> +                               guest_clock_phandles[0]);

Hmm a little comment about the endianess here would be worthwhile. It
seems odd to have a fdt function return stuff in be32 form but need it
in host cpu form in other calls.

As you only use host_clock_phandles[] once you could push the endian
conversion to the call rather than the in-place swizzle.:

        ret = fdt_build_clock_node(host_fdt, guest_fdt,
                                   be32_to_cpu(host_clock_phandles[0]),
                                   guest_clock_phandles[0]);


> +    if (ret) {
> +        goto stop;
> +    }
> +
> +    ret = fdt_build_clock_node(host_fdt, guest_fdt,
> +                               host_clock_phandles[1],
> +                               guest_clock_phandles[1]);
> +    if (ret) {
> +        goto stop;
> +    }
> +
> +    /* combined XGBE/PHY node */
> +    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
> +                               vbasedev->name, mmio_base);
> +    qemu_fdt_add_subnode(guest_fdt, nodename);
> +
> +    inherit_properties(amd_xgbe_inherited_properties,
> +                       ARRAY_SIZE(amd_xgbe_inherited_properties),
> +                       host_fdt, guest_fdt,
> +                       node_path, nodename);
> +
> +    qemu_fdt_setprop_cells(guest_fdt, nodename, "clocks",
> +                           guest_clock_phandles[0],
> +                           guest_clock_phandles[1]);
> +
> +    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
> +    for (i = 0; i < vbasedev->num_regions; i++) {
> +        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
> +        reg_attr[2 * i] = cpu_to_be32(mmio_base);
> +        reg_attr[2 * i + 1] = cpu_to_be32(
> +                                memory_region_size(&vdev->regions[i]->mem));
> +    }
> +    ret = qemu_fdt_setprop(guest_fdt, nodename, "reg", reg_attr,
> +                           vbasedev->num_regions * 2 * sizeof(uint32_t));
> +    if (ret) {
> +        error_report("could not set reg property of node %s", nodename);
> +        goto fail_reg;
> +    }
> +
> +    irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
> +    for (i = 0; i < vbasedev->num_irqs; i++) {
> +        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
> +                         + data->irq_start;
> +        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
> +        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
> +        /*
> +          * General device interrupt and PCS auto-negociation interrupts are
> +          * level-sensitive while the 4 per-channel interrupts are edge
> +          * sensitive
> +          */
> +        QLIST_FOREACH(intp, &vdev->intp_list, next) {
> +            if (intp->pin == i) {
> +                break;
> +            }
> +        }
> +        if (intp->flags & VFIO_IRQ_INFO_AUTOMASKED) {
> +            irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +        } else {
> +            irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
> +        }
> +    }
> +    ret = qemu_fdt_setprop(guest_fdt, nodename, "interrupts",
> +                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
> +    if (ret) {
> +        error_report("could not set interrupts property of node %s",
> +                     nodename);
> +    }
> +    g_free(host_fdt);
> +    g_free(node_path);
> +    g_free(irq_attr);
> +fail_reg:
> +    g_free(reg_attr);
> +    g_free(nodename);
> +    return ret;
> +stop:
> +    exit(1);
> +}
> +
>  /* list of supported dynamic sysbus devices */
>  static const NodeCreationPair add_fdt_node_functions[] = {
>      {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
> +    {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
>      {"", NULL}, /* last element */
>  };


--
Alex Bennée
