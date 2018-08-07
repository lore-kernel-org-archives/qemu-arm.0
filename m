Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4260504wru;
        Tue, 7 Aug 2018 07:19:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeKROKBEaUung0jNx3ubiHTg7toCPsLF4Zx5Y3drXHinqH17pRnYii4/EjWL+uT22Q7zudh
X-Received: by 2002:a0c:9aef:: with SMTP id k47-v6mr16931528qvf.134.1533651564876;
        Tue, 07 Aug 2018 07:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533651564; cv=none;
        d=google.com; s=arc-20160816;
        b=IrziJdfOtHEiadS63RRBu0l8m+KASGQ1u13pb+cLPbQ0xVgHXpgk/l0bgIQBzIv9AW
         DrLUOObDrr6UMjkAEHOd6Xq6pHWvEvK+Ct+SS7aKg0kUVlWyUoGnQf461gsisrCIROmN
         tsv69KNRZJ+Wmq+vJhMhd7rr0CoFINB9hyxF+pQw+lh0S+3HiQo1XEvzXrp67MctaBi9
         oZSv1LvE4YMdth5qZX5lKFKPxAsWPu3osqwUlpHTP1lkp+PheiL0dsKlMPyXlc7qltqR
         9P26kbZzKK0mdz23/1iVSDbpeMvGH3KH04O3Cx0im/W/97rb4qZctYRxtAUIkH+0isKc
         ivzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=nQxsuozz1Cyj+uZr0O8r7+DsQINlxSbpCS/jurdkYVI=;
        b=zhoVUYS920+E7FoGkP2f5h9QFQ5lE4bt94/yzrsPYbd3z+9J8+58ymC475KMwN/8rU
         b+fdF1LcOJxEGTWiTQEikZM/aP6gifnnR4xsXRpBlvQN9wIUGuUdRhfLS5zdIh6lsL4u
         DDWAxlg2hJsn5SU5bgW9On9SYbUBgswwM9l7ycraPfeoo2omBmqUU+ss0BFzEUgNqdzd
         9Nf/Jpx/muNtxfRuDz9BT45ApEKO+nPuuCNfErQtZSrlfmt4CCfnIRBAgY14P5MXTjj7
         ex/yKFMbR1Mrm/gsQuH7BFHqBmks4K9PAsfjzpvUAMQdlocaFM5TifAmf56NNkq4sIz3
         CnUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r76-v6si1415593qkl.279.2018.08.07.07.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn2pY-00013o-9t
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:19:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn2pI-000113-Nn
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:19:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn2pH-0002Kf-CE
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:19:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42176 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fn2pH-0002KR-5d; Tue, 07 Aug 2018 10:19:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6CCC40201C6;
	Tue,  7 Aug 2018 14:19:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0054F2026D66;
	Tue,  7 Aug 2018 14:19:04 +0000 (UTC)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20180725143413.9728-1-geert+renesas@glider.be>
	<20180725143413.9728-5-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e52bfdab-5c23-a617-8bef-0c17ab831ec1@redhat.com>
Date: Tue, 7 Aug 2018 16:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180725143413.9728-5-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 07 Aug 2018 14:19:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 07 Aug 2018 14:19:06 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v3 4/4] hw/arm/sysbus-fdt: Add support for
 instantiating generic devices
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T056n85lJOMk

Hi Geert,

On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
> Add a fallback for instantiating generic devices without a type-specific
> or compatible-specific instantation method.  This will be used when no
> other match is found.
> 
> The generic instantation method creates a device node with "reg" and
> (optional) "interrupts" properties, and copies the "compatible"
> property and other optional properties from the host.
> For now the following optional properties are copied, if found:
>   - "#gpio-cells",
>   - "gpio-controller",
>   - "#interrupt-cells",
>   - "interrupt-controller",
>   - "interrupt-names".
> 
> More can be added when needed.
> 
> This avoids having to write device-specific instantation methods for
instantiation
> each and every "simple" device using only a set of generic properties.
> Devices that need more specialized handling can still provide their
> own instantation method.
> 
> This has been tested on a Renesas Salvator-XS board with R-Car H3 ES2.0
> with SATA:
> 
>     -device vfio-platform,host=ee300000.sata
> 
> and GPIO (needs VFIO No-IOMMU support):
> 
>     -device vfio-platform,host=e6055400.gpio
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> ---
>  hw/arm/sysbus-fdt.c | 102 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 0e24c803a1c2c734..8040af00ccf131d7 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -415,6 +415,99 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>      return 0;
>  }
>  
> +static HostProperty generic_copied_properties[] = {
> +    {"compatible", false},
> +    {"#gpio-cells", true},
> +    {"gpio-controller", true},
> +    {"#interrupt-cells", true},
> +    {"interrupt-controller", true},
> +    {"interrupt-names", true},
I think we would need to enumerate the other source properties which
were not copied to the guest fdt and either warn the userspace those
were omitted or fail. We may end up generating an incomplete guest dt
node that may not work properly.
> +};
> +
> +/**
> + * add_generic_fdt_node
> + *
> + * Generates a generic DT node by copying properties from the host
> + */
> +static int add_generic_fdt_node(SysBusDevice *sbdev, void *opaque)
> +{
> +    PlatformBusFDTData *data = opaque;
> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
> +    const char *parent_node = data->pbus_node_name;
> +    void *guest_fdt = data->fdt, *host_fdt;
> +    VFIODevice *vbasedev = &vdev->vbasedev;
> +    char **node_path, *node_name, *dt_name;
> +    PlatformBusDevice *pbus = data->pbus;
> +    int i, irq_number;
> +    uint32_t *reg_attr, *irq_attr;
> +    uint64_t mmio_base;
> +
> +    host_fdt = load_device_tree_from_sysfs();
> +
> +    dt_name = sysfs_to_dt_name(vbasedev->name);
> +    if (!dt_name) {
> +        error_report("%s incorrect sysfs device name %s", __func__,
> +                     vbasedev->name);
> +        exit(1);
> +    }
> +    node_path = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
> +                                   &error_fatal);
> +    if (!node_path || !node_path[0]) {
> +        error_report("%s unable to retrieve node path for %s/%s", __func__,
> +                     dt_name, vdev->compat);
> +        exit(1);
> +    }
> +
> +    if (node_path[1]) {
> +        error_report("%s more than one node matching %s/%s!", __func__, dt_name,
> +                     vdev->compat);
> +        exit(1);
> +    }
> +
> +    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    node_name = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
> +                               vbasedev->name, mmio_base);
> +    qemu_fdt_add_subnode(guest_fdt, node_name);
> +
> +    /* Copy generic properties */
> +    copy_properties_from_host(generic_copied_properties,
> +                              ARRAY_SIZE(generic_copied_properties), host_fdt,
> +                              guest_fdt, node_path[0], node_name);
> +
> +    /* Copy reg (remapped) */
> +    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
> +    for (i = 0; i < vbasedev->num_regions; i++) {
> +        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
> +        reg_attr[2 * i] = cpu_to_be32(mmio_base);
> +        reg_attr[2 * i + 1] = cpu_to_be32(
> +                                memory_region_size(vdev->regions[i]->mem));
> +    }
> +    qemu_fdt_setprop(guest_fdt, node_name, "reg", reg_attr,
> +                     vbasedev->num_regions * 2 * sizeof(uint32_t));
> +
> +    /* Copy interrupts (remapped) */
> +    if (vbasedev->num_irqs) {
> +        irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
> +        for (i = 0; i < vbasedev->num_irqs; i++) {
> +            irq_number = platform_bus_get_irqn(pbus, sbdev , i)
> +                             + data->irq_start;
> +            irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
> +            irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
> +            irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
I think this part is not generic enough. How can you assume the IRQs are
level or edge? Can't you copy the source interrupt properties and just
overwrite the IRQ number?

Thanks

Eric
> +        }
> +        qemu_fdt_setprop(guest_fdt, node_name, "interrupts",
> +                         irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
> +        g_free(irq_attr);
> +    }
> +
> +    g_free(reg_attr);
> +    g_free(node_name);
> +    g_strfreev(node_path);
> +    g_free(dt_name);
> +    g_free(host_fdt);
> +    return 0;
> +}
> +
>  /* DT compatible matching */
>  static bool vfio_platform_match(SysBusDevice *sbdev,
>                                  const BindingEntry *entry)
> @@ -423,6 +516,11 @@ static bool vfio_platform_match(SysBusDevice *sbdev,
>      const char *compat;
>      unsigned int n;
>  
> +    if (!entry->compat) {
> +        /* Generic DT fallback */
> +        return true;
> +    }
> +
>      for (n = vdev->num_compat, compat = vdev->compat; n > 0;
>           n--, compat += strlen(compat) + 1) {
>          if (!strcmp(entry->compat, compat)) {
> @@ -459,6 +557,10 @@ static const BindingEntry bindings[] = {
>      VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
>  #endif
>      TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
> +#ifdef CONFIG_LINUX
> +    /* Generic DT fallback must be last */
> +    VFIO_PLATFORM_BINDING(NULL, add_generic_fdt_node),
> +#endif
>      TYPE_BINDING("", NULL), /* last element */
>  };
>  
> 
