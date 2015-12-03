Received: by 10.182.158.201 with SMTP id ww9csp55325obb;
        Thu, 3 Dec 2015 08:18:10 -0800 (PST)
X-Received: by 10.28.130.7 with SMTP id e7mr50814469wmd.68.1449159489980;
        Thu, 03 Dec 2015 08:18:09 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com. [2a00:1450:400c:c09::236])
        by mx.google.com with ESMTPS id o8si12146334wjy.224.2015.12.03.08.18.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Dec 2015 08:18:09 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) client-ip=2a00:1450:400c:c09::236;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro-org.20150623.gappssmtp.com
Received: by wmvv187 with SMTP id v187so35161964wmv.1
        for <alex.bennee@linaro.org>; Thu, 03 Dec 2015 08:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=S5GmH8mH3piDWHHcUoaMxn672C98LrndyK0+qWl8m60=;
        b=JBC7Lhh5ntnm/VOCvxdDAFZSQfFnaGbt0Vq3fmsKe8fzcSVIZ1lOsXaA85b6IFE2d4
         jv4XCAXoHKPQrYBgLZxoaztx8reF+L9RmhpdnYLrZIlAldeYrgB5SHMb2OkYNFy6ZU/F
         8uGbrjEYPfM/+n3zFux3MWbZAvLmuzp6tz1MAQXTk4yHZhAxejZ+FBl9d2iumSaD1Mjl
         HeLmuyZ1oyhaSJg1+uGA2TI2GTydJ0RfUtHIj+hTR1dscZEadntdc4GAng82Q2alqPTq
         dILcFtpuzMfQJgvofjostO2qaKALJU+p1VUcnX3bKU6x+LRwPUVlX27NCRni+nTbAQUm
         ikug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=S5GmH8mH3piDWHHcUoaMxn672C98LrndyK0+qWl8m60=;
        b=Lcnlb73hOx43OiHCUs22OlyiwqIxrMEUuIot4T5UDIGilzNAaZBfidLI9P0iN+ylYD
         l6qrdJNDuijBzTnxj9Z1McmqygPNHSbz9qjcARnmE/hJI70hAfMgWMflxpM/RMsNyj40
         Pbt/vksFVIgfwXhRbP/S2kkOVBWVL11aYcLidY1qSajeSOvqirWoNknC2l7HfK1wtEso
         RSvJiuwitvXuPO3wRNCWTOX7yCzyYbGzwcrnlRWG5dFVlUNSseo504aCwf7db34z2iYj
         hyTacUdmy84RNkbVsfb/O58LO/QmUp/Qze65gbly8uZFaNgro6h22bjvJuzSZELJkwQ/
         uAIw==
X-Gm-Message-State: ALoCoQnUl+kRO5l3YCDknpX7wMBJmSW242co4iJle7jkQpthEIXH5uBfEfMDYZIHH+6UBQSsvFfJ
X-Received: by 10.28.4.7 with SMTP id 7mr12816989wme.85.1449159489617;
        Thu, 03 Dec 2015 08:18:09 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id q9sm8244733wjo.9.2015.12.03.08.18.07
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 03 Dec 2015 08:18:08 -0800 (PST)
Subject: Re: [Qemu-devel] [RESEND RFC 6/6] hw/arm/sysbus-fdt: enable amd-xgbe
 dynamic instantiation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
 <1447946528-1533-7-git-send-email-eric.auger@linaro.org>
 <87vb8obs35.fsf@linaro.org>
Cc: eric.auger@st.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
 patches@linaro.org, suravee.suthikulpanit@amd.com, pbonzini@redhat.com,
 christoffer.dall@linaro.org
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56606B23.2020901@linaro.org>
Date: Thu, 3 Dec 2015 17:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <87vb8obs35.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: PX248S2zUrqM

On 11/26/2015 06:14 PM, Alex Bennée wrote:
> 
> Eric Auger <eric.auger@linaro.org> writes:
> 
>> This patch allows the instantiation of the vfio-amd-xgbe device
>> from the QEMU command line (-device vfio-amd-xgbe,host="<device>").
>>
>> The guest is exposed with a device tree node that combines the description
>> of both XGBE and PHY (representation supported from 4.2 onwards kernel):
>> Documentation/devicetree/bindings/net/amd-xgbe.txt.
>>
>> There are 5 register regions, 6 interrupts including 4 optional
>> edge-sensitive per-channel interrupts.
>>
>> Property values are inherited from host device tree. It is mandated
>> host uses device tree, dtc binary is installed, and the host also uses a
>> combined XGBE/PHY representation (>= 4.2 host kernel).
> 
> I might ping you later about this as I'm running 4.3 but can't see the
> device. However my board could be a very old rev.
On my side it is in the smb directory.

/sys/firmware/devicetree/base/smb/xgmac@*
> 
>>
>> 2 clock nodes (dma and ptp) also are created. It is mandated those clocks
>> are fixed on host side.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>> ---
>>  hw/arm/sysbus-fdt.c | 171 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 167 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>> index 22e5801..b13d380 100644
>> --- a/hw/arm/sysbus-fdt.c
>> +++ b/hw/arm/sysbus-fdt.c
>> @@ -22,6 +22,7 @@
>>   */
>>
>>  #include <libfdt.h>
>> +#include <linux/vfio.h>
>>  #include "hw/arm/sysbus-fdt.h"
>>  #include "qemu/error-report.h"
>>  #include "sysemu/device_tree.h"
>> @@ -29,8 +30,10 @@
>>  #include "sysemu/sysemu.h"
>>  #include "hw/vfio/vfio-platform.h"
>>  #include "hw/vfio/vfio-calxeda-xgmac.h"
>> +#include "hw/vfio/vfio-amd-xgbe.h"
>>  #include "hw/arm/fdt.h"
>>
>> +
>>  /*
>>   * internal struct that contains the information to create dynamic
>>   * sysbus device node
>> @@ -120,10 +123,7 @@ static HostProperty clock_inherited_properties[] = {
>>   * host_phandle: phandle of the clock in host device tree
>>   * guest_phandle: phandle to assign to the guest node
>>   */
>> -int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>> -                                uint32_t host_phandle,
>> -                                uint32_t guest_phandle);
>> -int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>> +static int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
>>                                  uint32_t host_phandle,
>>                                  uint32_t guest_phandle)
>>  {
> 
> This looks like it should be squashed with 5/6.
Sure ;-)
> 
>> @@ -166,6 +166,21 @@ out:
>>      return ret;
>>  }
>>
>> +/**
>> + * sysfs_to_dt_name
>> + *
>> + * convert the name found in sysfs into the node name
>> + * for instance e0900000.xgmac is converted into xgmac@e0900000
>> + */
>> +static char *sysfs_to_dt_name(const char *sysfs_name)
>> +{
>> +    gchar **substrings =  g_strsplit(sysfs_name, ".", 2);
>> +    char *dt_name;
>> +
>> +    dt_name = g_strdup_printf("%s@%s", substrings[1], substrings[0]);
> 
> You need to g_strfreev(substrings) once you are done.
sure!
> 
>> +    return dt_name;
>> +}
>> +
>>  /* Device Specific Code */
>>
>>  /**
>> @@ -233,9 +248,157 @@ fail_reg:
>>      return ret;
>>  }
>>
>> +
>> +/* AMD xgbe properties whose values are copied/pasted from host */
>> +static HostProperty amd_xgbe_inherited_properties[] = {
>> +    {"compatible", 0},
>> +    {"dma-coherent", 1},
>> +    {"amd,per-channel-interrupt", 1},
>> +    {"phy-mode", 0},
>> +    {"mac-address", 1},
>> +    {"amd,speed-set", 0},
>> +    {"amd,serdes-blwc", 1},
>> +    {"amd,serdes-cdr-rate", 1},
>> +    {"amd,serdes-pq-skew", 1},
>> +    {"amd,serdes-tx-amp", 1},
>> +    {"amd,serdes-dfe-tap-config", 1},
>> +    {"amd,serdes-dfe-tap-enable", 1},
>> +    {"clock-names", 0},
>> +};
>> +
>> +/**
>> + * add_amd_xgbe_fdt_node
>> + *
>> + * Generates the combined xgbe/phy node following kernel >=4.2
>> + * binding documentation:
>> + * Documentation/devicetree/bindings/net/amd-xgbe.txt:
>> + * Also 2 clock nodes are created (dma and ptp)
>> + */
>> +static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>> +{
>> +    PlatformBusFDTData *data = opaque;
>> +    PlatformBusDevice *pbus = data->pbus;
>> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
>> +    VFIODevice *vbasedev = &vdev->vbasedev;
>> +    VFIOINTp *intp;
>> +    const char *parent_node = data->pbus_node_name;
>> +    char *node_path, *nodename, *dt_name;
>> +    void *guest_fdt = data->fdt, *host_fdt;
>> +    const void *r;
>> +    int i, ret = -1, prop_len;
>> +    uint32_t *irq_attr, *reg_attr, *host_clock_phandles;
>> +    uint64_t mmio_base, irq_number;
>> +    uint32_t guest_clock_phandles[2];
>> +
>> +    host_fdt = load_device_tree_from_sysfs();
>> +    if (!host_fdt) {
>> +        goto stop;
>> +    }
>> +    dt_name = sysfs_to_dt_name(vbasedev->name);
>> +    ret = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat, &node_path);
>> +    g_free(dt_name);
>> +
>> +    if (ret) {
>> +        goto stop;
>> +    }
>> +
>> +    /* generate nodes for DMA_CLK and PTP_CLK */
>> +    r = qemu_fdt_getprop(host_fdt, node_path, "clocks", &prop_len);
>> +    if (prop_len != 8) {
>> +        goto stop;
>> +    }
>> +    host_clock_phandles = (uint32_t *)r;
>> +    host_clock_phandles[0] = be32_to_cpu(host_clock_phandles[0]);
>> +    host_clock_phandles[1] = be32_to_cpu(host_clock_phandles[1]);
>> +    guest_clock_phandles[0] = qemu_fdt_alloc_phandle(guest_fdt);
>> +    guest_clock_phandles[1] = qemu_fdt_alloc_phandle(guest_fdt);
>> +
>> +    ret = fdt_build_clock_node(host_fdt, guest_fdt,
>> +                               host_clock_phandles[0],
>> +                               guest_clock_phandles[0]);
> 
> Hmm a little comment about the endianess here would be worthwhile. It
> seems odd to have a fdt function return stuff in be32 form but need it
> in host cpu form in other calls.
> 
> As you only use host_clock_phandles[] once you could push the endian
> conversion to the call rather than the in-place swizzle.:
OK

Thanks!

Eric
> 
>         ret = fdt_build_clock_node(host_fdt, guest_fdt,
>                                    be32_to_cpu(host_clock_phandles[0]),
>                                    guest_clock_phandles[0]);
> 
> 
>> +    if (ret) {
>> +        goto stop;
>> +    }
>> +
>> +    ret = fdt_build_clock_node(host_fdt, guest_fdt,
>> +                               host_clock_phandles[1],
>> +                               guest_clock_phandles[1]);
>> +    if (ret) {
>> +        goto stop;
>> +    }
>> +
>> +    /* combined XGBE/PHY node */
>> +    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
>> +    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
>> +                               vbasedev->name, mmio_base);
>> +    qemu_fdt_add_subnode(guest_fdt, nodename);
>> +
>> +    inherit_properties(amd_xgbe_inherited_properties,
>> +                       ARRAY_SIZE(amd_xgbe_inherited_properties),
>> +                       host_fdt, guest_fdt,
>> +                       node_path, nodename);
>> +
>> +    qemu_fdt_setprop_cells(guest_fdt, nodename, "clocks",
>> +                           guest_clock_phandles[0],
>> +                           guest_clock_phandles[1]);
>> +
>> +    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
>> +    for (i = 0; i < vbasedev->num_regions; i++) {
>> +        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
>> +        reg_attr[2 * i] = cpu_to_be32(mmio_base);
>> +        reg_attr[2 * i + 1] = cpu_to_be32(
>> +                                memory_region_size(&vdev->regions[i]->mem));
>> +    }
>> +    ret = qemu_fdt_setprop(guest_fdt, nodename, "reg", reg_attr,
>> +                           vbasedev->num_regions * 2 * sizeof(uint32_t));
>> +    if (ret) {
>> +        error_report("could not set reg property of node %s", nodename);
>> +        goto fail_reg;
>> +    }
>> +
>> +    irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
>> +    for (i = 0; i < vbasedev->num_irqs; i++) {
>> +        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
>> +                         + data->irq_start;
>> +        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
>> +        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
>> +        /*
>> +          * General device interrupt and PCS auto-negociation interrupts are
>> +          * level-sensitive while the 4 per-channel interrupts are edge
>> +          * sensitive
>> +          */
>> +        QLIST_FOREACH(intp, &vdev->intp_list, next) {
>> +            if (intp->pin == i) {
>> +                break;
>> +            }
>> +        }
>> +        if (intp->flags & VFIO_IRQ_INFO_AUTOMASKED) {
>> +            irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>> +        } else {
>> +            irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
>> +        }
>> +    }
>> +    ret = qemu_fdt_setprop(guest_fdt, nodename, "interrupts",
>> +                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
>> +    if (ret) {
>> +        error_report("could not set interrupts property of node %s",
>> +                     nodename);
>> +    }
>> +    g_free(host_fdt);
>> +    g_free(node_path);
>> +    g_free(irq_attr);
>> +fail_reg:
>> +    g_free(reg_attr);
>> +    g_free(nodename);
>> +    return ret;
>> +stop:
>> +    exit(1);
>> +}
>> +
>>  /* list of supported dynamic sysbus devices */
>>  static const NodeCreationPair add_fdt_node_functions[] = {
>>      {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
>> +    {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
>>      {"", NULL}, /* last element */
>>  };
> 
> 
> --
> Alex Bennée
> 
