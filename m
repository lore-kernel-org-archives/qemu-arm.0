Received: by 10.25.159.19 with SMTP id i19csp48171lfe;
        Mon, 1 Feb 2016 05:12:22 -0800 (PST)
X-Received: by 10.28.227.67 with SMTP id a64mr11468426wmh.74.1454332341802;
        Mon, 01 Feb 2016 05:12:21 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com. [2a00:1450:400c:c09::22c])
        by mx.google.com with ESMTPS id e9si14889173wma.120.2016.02.01.05.12.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Feb 2016 05:12:21 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) client-ip=2a00:1450:400c:c09::22c;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22c.google.com with SMTP id p63so70428672wmp.1
        for <alex.bennee@linaro.org>; Mon, 01 Feb 2016 05:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=3mFGzgkM1bWxoNWT5a4hXo9L/uuN64uXdETWyl+AbSA=;
        b=UL3tSFmPVvyFo0kbzIHNxpV89HKT7ROkW7EkrF1Lpvvv9ao2IIR6MfpiHomaeBH15W
         b/Xm8E0VzbXq2e79T7trdz/kRnzDq29XZJG7ylz19HYAjqJGZXknic4jqN/oP7ClrQGE
         dU6mLcziByMEL/HGwN1G2/v28nIjk+A+dGpgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=3mFGzgkM1bWxoNWT5a4hXo9L/uuN64uXdETWyl+AbSA=;
        b=DHyhQ4TmDub6GW9gcWvRacgAQ7jkyoOqQ/jvZrAKzlqrTdaYA4I+XTP2X5pb733dzC
         UVQucRMPiO2AYX/C5ML0V89irEsgNERDql6hviA1qlPSFuwt+MB3C8hYSTWtBu9Sny0u
         QK3Cj6IPGOM7V8aINQFdd0gi4kh1LH9E2j/ayQopsZkN6V1+ucn51A6Yva1qDhYK1ZE5
         Jz0sXYOPXkitkJFW6vMG/GZNMNJ1INxbcLRJxTK76giQXcmB4QGKuRh+pYrXo/5kc0QB
         kotXrj6WGGW8kN8bBS/aaraszwU+bDMYcyJA5G8BUprVOPHXRScCNub1x04ERUpWKTLm
         ctIg==
X-Gm-Message-State: AG10YOQgREQvjrD9P6wXUtdKYbCUZ9CJEEXdsHDR+t8GtgYgxFpwIVyYX6xRLx/8Ld6UoLtnLIc=
X-Received: by 10.28.98.133 with SMTP id w127mr11283083wmb.4.1454332341549;
        Mon, 01 Feb 2016 05:12:21 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id az10sm29093426wjc.28.2016.02.01.05.12.16
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 01 Feb 2016 05:12:20 -0800 (PST)
Subject: Re: [PATCH v5 7/8] hw/arm/sysbus-fdt: enable amd-xgbe dynamic
 instantiation
To: Peter Maydell <peter.maydell@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
 <1453130204-655-8-git-send-email-eric.auger@linaro.org>
 <CAFEAcA9T2OxhC7si7LVc7WX--F-kbHms9QgdN99PWjO-ns9TDg@mail.gmail.com>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 Patch Tracking <patches@linaro.org>,
 Christoffer Dall <christoffer.dall@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Baptiste Reynal <b.reynal@virtualopensystems.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56AF599D.8010903@linaro.org>
Date: Mon, 1 Feb 2016 14:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9T2OxhC7si7LVc7WX--F-kbHms9QgdN99PWjO-ns9TDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: oza8UQ+eyWfl

Hi Peter,
On 01/25/2016 03:33 PM, Peter Maydell wrote:
> On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
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
>> Some property values are inherited from host device tree. Host device tree
>> must feature a combined XGBE/PHY representation (>= 4.2 host kernel).
>>
>> 2 clock nodes (dma and ptp) also are created. It is checked those clocks
>> are fixed on host side.
>>
>> AMD XGBE node creation function has a dependency on vfio Linux header and
>> more generally node creation function for VFIO platform devices only make
>> sense with CONFIG_LINUX so let's protect this code with #ifdef CONFIG_LINUX.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
> 
>>  hw/arm/sysbus-fdt.c | 195 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 189 insertions(+), 6 deletions(-)
> 
> I'll let it pass for this patchset, but this file is starting to
> get big, and probably needs some kind of split into common functions
> in one file and then a separate file for each pass-through device,
> if they're all going to require 200-odd lines to deal with.

That's understood. If you don't mind i would rather introduce that move
in a separate series then.

Thanks

Eric
> 
>> +/**
>> + * sysfs_to_dt_name: convert the name found in sysfs into the node name
>> + * for instance e0900000.xgmac is converted into xgmac@e0900000
>> + * @sysfs_name: directory name in sysfs
>> + *
>> + * returns the device tree name upon success or NULL in case the sysfs name
>> + * does not match the expected format
>> + */
>> +static char *sysfs_to_dt_name(const char *sysfs_name)
>> +{
>> +    gchar **substrings =  g_strsplit(sysfs_name, ".", 2);
>> +    char *dt_name = NULL;
>> +
>> +    if (!substrings || !substrings[1] || !substrings[0]) {
> 
> We should check substrings[0] before substrings[1], as otherwise
> if we're passed the empty string we'll index off the end of the
> vector.
> 
>> +        goto out;
>> +    }
>> +    dt_name = g_strdup_printf("%s@%s", substrings[1], substrings[0]);
>> +out:
>> +    g_strfreev(substrings);
>> +    return dt_name;
>> +}
>> +
>>  /* Device Specific Code */
>>
>>  /**
>> @@ -243,9 +269,166 @@ fail_reg:
>>      return ret;
>>  }
>>
>> +
>> +/* AMD xgbe properties whose values are copied/pasted from host */
>> +static HostProperty amd_xgbe_copied_properties[] = {
>> +    {"compatible", false},
>> +    {"dma-coherent", true},
>> +    {"amd,per-channel-interrupt", true},
>> +    {"phy-mode", false},
>> +    {"mac-address", true},
>> +    {"amd,speed-set", false},
>> +    {"amd,serdes-blwc", true},
>> +    {"amd,serdes-cdr-rate", true},
>> +    {"amd,serdes-pq-skew", true},
>> +    {"amd,serdes-tx-amp", true},
>> +    {"amd,serdes-dfe-tap-config", true},
>> +    {"amd,serdes-dfe-tap-enable", true},
>> +    {"clock-names", false},
>> +};
>> +
>> +/**
>> + * add_amd_xgbe_fdt_node
>> + *
>> + * Generates the combined xgbe/phy node following kernel >=4.2
>> + * binding documentation:
>> + * Documentation/devicetree/bindings/net/amd-xgbe.txt:
>> + * Also 2 clock nodes are created (dma and ptp)
>> + *
>> + * self-asserts in case of error
> 
> "asserts".
> 
>> +    for (i = 0; i < vbasedev->num_irqs; i++) {
>> +        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
>> +                         + data->irq_start;
>> +        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
>> +        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
>> +        /*
>> +          * General device interrupt and PCS auto-negociation interrupts are
> 
> "negotiation"
> 
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
>> +    qemu_fdt_setprop(guest_fdt, nodename, "interrupts",
>> +                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
>> +
>> +    g_free(host_fdt);
>> +    g_strfreev(node_path);
>> +    g_free(irq_attr);
>> +    g_free(reg_attr);
>> +    g_free(nodename);
>> +    return 0;
>> +}
>> +
>> +#endif /* CONFIG_LINUX */
>> +
>>  /* list of supported dynamic sysbus devices */
>>  static const NodeCreationPair add_fdt_node_functions[] = {
>> +#ifdef CONFIG_LINUX
>>      {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
>> +    {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
>> +#endif
>>      {"", NULL}, /* last element */
>>  };
> 
> thanks
> -- PMM
> 
