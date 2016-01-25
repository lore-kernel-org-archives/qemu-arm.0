Received: by 10.25.159.19 with SMTP id i19csp1281276lfe;
        Mon, 25 Jan 2016 06:33:51 -0800 (PST)
X-Received: by 10.31.158.204 with SMTP id h195mr10707883vke.147.1453732431565;
        Mon, 25 Jan 2016 06:33:51 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com. [2607:f8b0:400c:c05::231])
        by mx.google.com with ESMTPS id v189si4239680vkv.56.2016.01.25.06.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 06:33:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) client-ip=2607:f8b0:400c:c05::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::231 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x231.google.com with SMTP id n1so74417859vkb.3
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 06:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=fJyg+fQuk0pM20fdNUKdk+pyymxMHtZGmomt6Cx6lNQ=;
        b=KR0+yiWhv5i8tkNUGXHreVHX/lapCMTS8v/TFG4tZEkiR6B7FkYhcAZqDLUbmjl/M9
         yLlFP2SQt/OVRqyIIf4UvyLA2jILsipIIxCYTNJ2YbyCMYCOj43q6kvYQRbvFWip1SGX
         LDgG9f3tUZmz243uNVTJJosAi8dhsE97j+DuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=fJyg+fQuk0pM20fdNUKdk+pyymxMHtZGmomt6Cx6lNQ=;
        b=Hdc6IPCtwLQi3vmwItPCjY0I8NMqJriEyzMVS9vhMMcIbDcWHsMubSMJgoQ8hVkEux
         nfpTHlDhgnl/NWInq7xI4hXkW7EfqyD8RWboft4p0ZABVAAaJY+Vbp3vKWbSQN5KShpd
         pjPQnAPQSEy8c9m7dRXvYJXKpzLzqT9t1Z4oNP/xpGTpz6Y0m6bIDL8hNItgXBVYsBZf
         rBAzWkdgsYzONBxWxgoThp/bhXcOXOUqjnQmWR9U5Cn0u9bDFmuRi8hUSx1DtTgBuSwA
         GU7qe3UMgcgAdTBBHnhZM1O0gnswOk2eU/BxBm1NO9P51h5vho729z4OxqsaDDzC1c3R
         1W+g==
X-Gm-Message-State: AG10YOScinHnNHOw0vo8ckDZEN3motGmyIB7dI6/5cDgpn6yPC0t+pDmPpFv21BEtuaWBSbIEFzVuVzKW7NO85XGck4=
X-Received: by 10.31.107.138 with SMTP id k10mr9891996vki.27.1453732431156;
 Mon, 25 Jan 2016 06:33:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 06:33:31 -0800 (PST)
In-Reply-To: <1453130204-655-8-git-send-email-eric.auger@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org> <1453130204-655-8-git-send-email-eric.auger@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 14:33:31 +0000
Message-ID: <CAFEAcA9T2OxhC7si7LVc7WX--F-kbHms9QgdN99PWjO-ns9TDg@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] hw/arm/sysbus-fdt: enable amd-xgbe dynamic instantiation
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Alex Williamson <alex.williamson@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Patch Tracking <patches@linaro.org>, Christoffer Dall <christoffer.dall@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Baptiste Reynal <b.reynal@virtualopensystems.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, thomas.lendacky@amd.com
Content-Type: text/plain; charset=UTF-8
X-TUID: GVkevOARHToV

On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
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
> Some property values are inherited from host device tree. Host device tree
> must feature a combined XGBE/PHY representation (>= 4.2 host kernel).
>
> 2 clock nodes (dma and ptp) also are created. It is checked those clocks
> are fixed on host side.
>
> AMD XGBE node creation function has a dependency on vfio Linux header and
> more generally node creation function for VFIO platform devices only make
> sense with CONFIG_LINUX so let's protect this code with #ifdef CONFIG_LINUX.
>
> Signed-off-by: Eric Auger <eric.auger@linaro.org>

>  hw/arm/sysbus-fdt.c | 195 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 189 insertions(+), 6 deletions(-)

I'll let it pass for this patchset, but this file is starting to
get big, and probably needs some kind of split into common functions
in one file and then a separate file for each pass-through device,
if they're all going to require 200-odd lines to deal with.

> +/**
> + * sysfs_to_dt_name: convert the name found in sysfs into the node name
> + * for instance e0900000.xgmac is converted into xgmac@e0900000
> + * @sysfs_name: directory name in sysfs
> + *
> + * returns the device tree name upon success or NULL in case the sysfs name
> + * does not match the expected format
> + */
> +static char *sysfs_to_dt_name(const char *sysfs_name)
> +{
> +    gchar **substrings =  g_strsplit(sysfs_name, ".", 2);
> +    char *dt_name = NULL;
> +
> +    if (!substrings || !substrings[1] || !substrings[0]) {

We should check substrings[0] before substrings[1], as otherwise
if we're passed the empty string we'll index off the end of the
vector.

> +        goto out;
> +    }
> +    dt_name = g_strdup_printf("%s@%s", substrings[1], substrings[0]);
> +out:
> +    g_strfreev(substrings);
> +    return dt_name;
> +}
> +
>  /* Device Specific Code */
>
>  /**
> @@ -243,9 +269,166 @@ fail_reg:
>      return ret;
>  }
>
> +
> +/* AMD xgbe properties whose values are copied/pasted from host */
> +static HostProperty amd_xgbe_copied_properties[] = {
> +    {"compatible", false},
> +    {"dma-coherent", true},
> +    {"amd,per-channel-interrupt", true},
> +    {"phy-mode", false},
> +    {"mac-address", true},
> +    {"amd,speed-set", false},
> +    {"amd,serdes-blwc", true},
> +    {"amd,serdes-cdr-rate", true},
> +    {"amd,serdes-pq-skew", true},
> +    {"amd,serdes-tx-amp", true},
> +    {"amd,serdes-dfe-tap-config", true},
> +    {"amd,serdes-dfe-tap-enable", true},
> +    {"clock-names", false},
> +};
> +
> +/**
> + * add_amd_xgbe_fdt_node
> + *
> + * Generates the combined xgbe/phy node following kernel >=4.2
> + * binding documentation:
> + * Documentation/devicetree/bindings/net/amd-xgbe.txt:
> + * Also 2 clock nodes are created (dma and ptp)
> + *
> + * self-asserts in case of error

"asserts".

> +    for (i = 0; i < vbasedev->num_irqs; i++) {
> +        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
> +                         + data->irq_start;
> +        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
> +        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
> +        /*
> +          * General device interrupt and PCS auto-negociation interrupts are

"negotiation"

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
> +    qemu_fdt_setprop(guest_fdt, nodename, "interrupts",
> +                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
> +
> +    g_free(host_fdt);
> +    g_strfreev(node_path);
> +    g_free(irq_attr);
> +    g_free(reg_attr);
> +    g_free(nodename);
> +    return 0;
> +}
> +
> +#endif /* CONFIG_LINUX */
> +
>  /* list of supported dynamic sysbus devices */
>  static const NodeCreationPair add_fdt_node_functions[] = {
> +#ifdef CONFIG_LINUX
>      {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
> +    {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
> +#endif
>      {"", NULL}, /* last element */
>  };

thanks
-- PMM
