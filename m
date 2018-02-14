Received: by 10.28.71.27 with SMTP id u27csp788244wma;
        Wed, 14 Feb 2018 02:53:08 -0800 (PST)
X-Google-Smtp-Source: AH8x2270d1SPmyLnF6XSc+Y0bx8CN6ktBSXy8h2yYwJpqJfB1/hAQK9YNM9btl9mS6omko+i/qex
X-Received: by 10.37.244.71 with SMTP id p7mr2718457ybe.264.1518605588150;
        Wed, 14 Feb 2018 02:53:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518605588; cv=none;
        d=google.com; s=arc-20160816;
        b=aqlg7bbdFaeJpJr1cC2ITw0Tx3SJDP+to6B3c+QdZfSq9u9F3dDhaK5BeNUeRwTGbV
         KyTYr0izss5siKFC6/6kX5YSDdcluWESg1NDYdYpt9jo+X3f42lWI0OW2IjgCme6MimN
         naD7G8MxV+X2XhCcsSwpBASLVprP9ibt9UYto59TSC8YssDR3CPmrUgiHuOExrO6Ny6K
         1dtvumnOqIRFgFHzOkhfEt8msVUtb0z/mt4agqR3I6F873hStls0GlcaByI8sazudIWh
         obp3c+qSKHnxpUpzg4YpbrRo5tClnmeRscaNGypXsV/FMJk5eXLrhduY2aVvuxUz9Trx
         +BmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=je78NUcQgngRj9GqRex5AawXeltDChrXhrWJrgR4gH8=;
        b=nfCoS7fqLbkjZ9eBuJNKhl/BBYe1viwo1kUYd7nsB7yxbNR5m2pLys7/18QzABYF1Y
         KmvVkSJZYvt/DtjNNXarw4PjxkP3cw2rx5byFHUFhTDG1RxQlyxdYDvFhDDcTYQM6vzh
         JNPy6k92/F/i9Tf9FjyrqLmuaq12Hqrqqq3yylxn7hGKCurImBLyXZmHCs4AAbTLdpzU
         QsvjkeIREHigDBl8GCKbYd6MmCq2XvBJo1NIyrny+wlndHQjY96V7xS3NtF778zYiooG
         1ylUy3KK2SkRcC8GS0L7pwr0I6SsQxITQMIDhp5s9BdEJqE3H1KRw/KcNBpYgnZIDjBu
         HERQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z127si2221216ybf.535.2018.02.14.02.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Feb 2018 02:53:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elugV-0000wv-L5
	for alex.bennee@linaro.org; Wed, 14 Feb 2018 05:53:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elugL-0000ud-Gu
	for qemu-arm@nongnu.org; Wed, 14 Feb 2018 05:52:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elugI-0000ta-Dr
	for qemu-arm@nongnu.org; Wed, 14 Feb 2018 05:52:57 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41440 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elugI-0000rv-7z; Wed, 14 Feb 2018 05:52:54 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B5028160F83;
	Wed, 14 Feb 2018 10:52:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D7B710A85AE;
	Wed, 14 Feb 2018 10:52:33 +0000 (UTC)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
	<1518189456-2873-6-git-send-email-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <79b1983f-cf83-624b-bd4d-86a2b6cc25e0@redhat.com>
Date: Wed, 14 Feb 2018 11:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1518189456-2873-6-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 14 Feb 2018 10:52:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 14 Feb 2018 10:52:43 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH/RFC 5/5] hw/arm/sysbus-fdt: Enable
 rcar-gen3-gpio dynamic instantiation
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
Cc: Arnd Bergmann <arnd@arndb.de>, Magnus Damm <magnus.damm@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, qemu-arm@nongnu.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CVUUb5VYEKT0

Hi Geert,

On 09/02/18 16:17, Geert Uytterhoeven wrote:
> Allow the instantiation of a Renesas R-Car Gen3 GPIO controller device
> from the QEMU command line:
> 
> -device vfio-platform,host=<device>,manufacturer=renesas,model=rcar-gen3-gpio
> -device vfio-platform,sysfsdev=<path>,manufacturer=renesas,model=rcar-gen3-gpio
> 
> A specialized device tree node is created for the guest, containing
> compatible, reg, gpio-controller, and #gpio-cells properties.
> 
> Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Question:
>   - Why do we need the manufacturer=foo,model=bar syntax? Can't this
>     just be extracted from the host DT?
I think this could be achieved that way too. We just need to pay
attention to the fact the dt node creation function matches the exact
same compatible property value.

> 
> TODO:
>   - Copy properties from the host DT, as add_amd_xgbe_fdt_node() does,
>   - Make this more generic?

Yes I think devising helpers to generate regs/interrupts properties
could help reducing the amount of code to be written

Thanks

Eric
> ---
>  hw/arm/sysbus-fdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index c5d4fd5604c28118..428175f343d9f3b9 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -416,6 +416,52 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>      return 0;
>  }
>  
> +/**
> + * add_rcar_gpio_fdt_node
> + *
> + * Generates a simple node with following properties:
> + * compatible string, regs, #gpio-cells, gpio-controller
> + */
> +static int add_rcar_gpio_fdt_node(SysBusDevice *sbdev, void *opaque)
> +{
> +    PlatformBusFDTData *data = opaque;
> +    PlatformBusDevice *pbus = data->pbus;
> +    void *fdt = data->fdt;
> +    const char *parent_node = data->pbus_node_name;
> +    int compat_str_len, i;
> +    char *nodename;
> +    uint32_t *reg_attr;
> +    uint64_t mmio_base;
> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
> +    VFIODevice *vbasedev = &vdev->vbasedev;
> +
> +    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
> +                               vbasedev->name, mmio_base);
> +    qemu_fdt_add_subnode(fdt, nodename);
> +
> +    compat_str_len = strlen(vdev->compat) + 1;
> +    qemu_fdt_setprop(fdt, nodename, "compatible",
> +                          vdev->compat, compat_str_len);
> +
> +    qemu_fdt_setprop(fdt, nodename, "gpio-controller", NULL, 0);
> +    qemu_fdt_setprop_cells(fdt, nodename, "#gpio-cells", 2);
> +
> +    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
> +    for (i = 0; i < vbasedev->num_regions; i++) {
> +        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
> +        reg_attr[2 * i] = cpu_to_be32(mmio_base);
> +        reg_attr[2 * i + 1] = cpu_to_be32(
> +                                memory_region_size(vdev->regions[i]->mem));
> +    }
> +    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr,
> +                     vbasedev->num_regions * 2 * sizeof(uint32_t));
> +
> +    g_free(reg_attr);
> +    g_free(nodename);
> +    return 0;
> +}
> +
>  /* manufacturer/model matching */
>  static bool vfio_platform_match(SysBusDevice *sbdev,
>                                  const BindingEntry *entry)
> @@ -454,6 +500,7 @@ static const BindingEntry bindings[] = {
>      TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
>      TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
>      VFIO_PLATFORM_BINDING("amd", "xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
> +    VFIO_PLATFORM_BINDING("renesas", "rcar-gen3-gpio", add_rcar_gpio_fdt_node),
>  #endif
>      TYPE_BINDING("", NULL), /* last element */
>  };
> 
