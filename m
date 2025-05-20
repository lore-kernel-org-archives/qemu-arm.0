Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp750510njc;
        Tue, 20 May 2025 13:00:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU467FYoQw81IK1a1EivHnCs0aKAXi6cTrMhL2+Aa9q/vRF3WysYopIuf0a031sPmCjmJO5UF2Xi/SyOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFKL/XAt+EAcM+tNgqd/RehvaEwLB77lCFRmFYES7ELu4sY29/noYkGCWbkJes7p5Ac2res
X-Received: by 2002:a05:620a:2984:b0:7c7:95ee:77bf with SMTP id af79cd13be357-7cd46724f5amr2422079585a.19.1747771214603;
        Tue, 20 May 2025 13:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747771214; cv=none;
        d=google.com; s=arc-20240605;
        b=K4pYyMLcxvO88yB9i/NNud8s1/sMhHilsDJ5ZDuwLk8oqaQApGWiZ4NjUY+5ruevKJ
         RO2Uz23+so0xK9vOFtjWnNQM5kv8xJC+GQqnjlTYOlnLWphrn6iCDouUBwosRqeqxVcn
         dSdoYsT5L8iRg7lwwihGrZ1hhs+KuLyCAl6lLr8LDNnhGSrhQTCvzPaUSZCMKAqLB+Fi
         Ncwl/zSYPJVsdM5+S6KNh/wtJw06GHJUNmSs3QK2pRnBglqxAknXvic8/hUHIfIySZqj
         OnsRa2EFom+6kkzyoM5b9+a0u9j61NabCT7a9xW0llA8+HK8xb1SjoS3E52S49OcCs9y
         PYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=e0Vo+XWPia2ro4Tn2sHmF8ont5kIyuPTttTlPL9Ngr8=;
        fh=sp8+O5KgcBlouqdVZokA3BtkCQiEGtLR7Qq0+wYrOPA=;
        b=OUPKAPEoEEm/k1fM/ZQkZV9R2JsRDlpHf7NVU3Yul3qqSqzQ233ciEsEdr62F1fI61
         JCnffjy+bfCB3p1cCOjgm/748rTDHDB6hSu1SM/UdJC/x3rxU/kNB2joEjUExnRuRtgj
         V+RSc/alAsXBSTiv/8VmMbYAeOrXSyzTE7NoWiXwXLFGxAZ5M3TC/9wVkjhjdWQNxc4p
         3foPa0lI/E8/lSaU1YGyodfu589zTOPAmOvB0lbjcVuasg6qc9OIzRYcYWGTpEA3aUf+
         U3HxvA75OkU4kJioFPP8KI1lVmZKFj8JYa8LnCE2dtLZO1ovyEP1jiZx+5eHVY8210Cs
         2d4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wsj+Soos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae55ff73si123250661cf.265.2025.05.20.13.00.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 13:00:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wsj+Soos;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHT88-0002bb-GX; Tue, 20 May 2025 16:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHT85-0002ZS-VS
 for qemu-arm@nongnu.org; Tue, 20 May 2025 16:00:02 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHT82-0007ZW-Gf
 for qemu-arm@nongnu.org; Tue, 20 May 2025 16:00:01 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-742c5eb7d1cso4074773b3a.3
 for <qemu-arm@nongnu.org>; Tue, 20 May 2025 12:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747771196; x=1748375996; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e0Vo+XWPia2ro4Tn2sHmF8ont5kIyuPTttTlPL9Ngr8=;
 b=Wsj+SoosyXAjqDn0B+gfE8mstbJJkYCAzuJPGYiLBhNZ3OxARH2u/aQcIlPXOQ3rNK
 Jr3WTmXMEsB6RM0kCRg4RNcl+sTcquX/clJHi/SxM5T+aO9ZwSGT2NxMpvZTnHL+1uv9
 bGK5Ikh4zpdnqNc9AsO910xujGznB1qs4+IpMKcJS3P2qpv/T6b0t+KkJsNegtgQVIYy
 1AScrvhc2yADl8J9mE7Z6+TpNMRKwX+cSPS4XFS3R54dTceTrgWGHRy2G8dx9uTTFdgs
 oF6AoUL1FYh5/A6LOLWY97a2DfHsKw8tJC5PSnUkVHDRZL1LjfI1Q6PeDrUWdgn7Gj3b
 kWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747771196; x=1748375996;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e0Vo+XWPia2ro4Tn2sHmF8ont5kIyuPTttTlPL9Ngr8=;
 b=iJxVOHfKBacdookHdeZfnHG4LZxkaIzpkukjfZW+bVJb8NFqest5ujzQv+Leesyk74
 7JHXVZTpbebcdszpWW07eVL+bJQkaojomIzPliWg0aLsSgewG5OeIQKE3uf8ZKQHNpIh
 o/qAZt08/X0Wt3yxGzDQUug43k1n6DbYUCAfBApAwfGYYxnwkomknZVvYU60snvrrnhj
 7Y//Y2HL+zZ+mk4HsaIKm7M9IiGTLsVxpsr7vF4lQziBMr7En2xMprXpNNxyV5sjGDsG
 qiQ5rWe+giIsWZDCn3j5aWDvEBfAxoc1BcbhHzJr3bRXd7Jf/QbqIpZk695uEXJesiuP
 aflA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl1dfWZJ09jM5pQjy6P4ZZUFGa92SAX+y1e4dulIP1i3ZfuOTwy8mNhfX+q7u3uRxate44yo3BJw==@nongnu.org
X-Gm-Message-State: AOJu0YxL5wVJZLu+m2IMhK0RVox9frEhQgsy/8e84tlidFEjDnkzmI8v
 E5sXQwki7bhU9r0I5ps72fVsE1/U2+nk40I3awiti+K5cSvHkM1hfmzOvkDvxpelDTM=
X-Gm-Gg: ASbGncuGTMo+AizGHShkqxFWsIsMDa6LJxu0ZCpH4Ibfx+7yKwFBG5PUcreJAQc7ZRG
 xWQsXOPZp01XKL8ksmWpQO3cyyUs5oIr5sBFVniMXLSkX/Q0E5vPPSijXyX5sCxLQm85AjXRgcc
 o5lqw+JXyhu0IUkLfZrH5PxM7pWzabMbq6KOeoGaXF1cc9QVjDvolvLuaVYj6eir++gMVOQZOOH
 arZg4HfVdARnkySlkB9apsUNzr+MKVtBmuo9YMTIJFArXPJ96bO+9/wyJyhZdcI6YlFSZvKbqHJ
 xcIdhi2s8uTfOfZICtv6LGtouVf3j7LMpjvJorsRjY4NmNaOdvmHGioBcawu5zNKyruMtapXMgh
 +RZVvSFrrwTt0jOavDx41+YR5oC/etA==
X-Received: by 2002:a05:6a00:2288:b0:742:9bd3:238a with SMTP id
 d2e1a72fcca58-742a978dc29mr26481423b3a.4.1747771196496; 
 Tue, 20 May 2025 12:59:56 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:d47f:6989:b93e:2caa:f174?
 ([2804:7f0:b401:d47f:6989:b93e:2caa:f174])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742acb8731esm8056290b3a.168.2025.05.20.12.59.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 12:59:55 -0700 (PDT)
Message-ID: <fdf853d2-35ae-40d7-942e-e01c7331ba34@linaro.org>
Date: Tue, 20 May 2025 16:59:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/22] hw/i386/acpi-build: Move
 build_append_pci_bus_devices/pcihp_slots to pcihp
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-13-eric.auger@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250514170431.2786231-13-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3f77A26Rddsw

Hi Eric,

On 5/14/25 14:00, Eric Auger wrote:
> We intend to reuse build_append_pci_bus_devices and
> build_append_pcihp_slots on ARM. So Let's move them to

nit: lowercase                     ---^


> hw/acpi/pcihp.c as well as all static helpers they
> use.
> 
> No functional change intended.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/acpi/pci.h   |   1 -
>   include/hw/acpi/pcihp.h |   2 +
>   hw/acpi/pcihp.c         | 173 ++++++++++++++++++++++++++++++++++++++++
>   hw/i386/acpi-build.c    | 172 ---------------------------------------
>   4 files changed, 175 insertions(+), 173 deletions(-)

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index ab0187a894..4dca22c0e2 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -37,7 +37,6 @@ typedef struct AcpiMcfgInfo {
>   void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
>                   const char *oem_id, const char *oem_table_id);
>   
> -void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>   void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
>   
>   void build_srat_generic_affinity_structures(GArray *table_data);
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 7c5d59243f..4d820b4baf 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -80,6 +80,8 @@ void build_append_pcihp_resources(Aml *table,
>                                     uint64_t io_addr, uint64_t io_len);
>   bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus);
>   
> +void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
> +
>   /* Called on reset */
>   void acpi_pcihp_reset(AcpiPciHpState *s);
>   
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 907a08ac7f..942669ea89 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -27,6 +27,7 @@
>   #include "qemu/osdep.h"
>   #include "hw/acpi/pcihp.h"
>   #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>   #include "hw/pci-host/i440fx.h"
>   #include "hw/pci/pci.h"
>   #include "hw/pci/pci_bridge.h"
> @@ -763,6 +764,178 @@ bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus)
>       return !!nr_notifiers;
>   }
>   
> +static void build_append_pcihp_notify_entry(Aml *method, int slot)
> +{
> +    Aml *if_ctx;
> +    int32_t devfn = PCI_DEVFN(slot, 0);
> +
> +    if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
> +    aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
> +    aml_append(method, if_ctx);
> +}
> +
> +static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
> +{
> +    const PCIDevice *pdev = bus->devices[devfn];
> +
> +    if (PCI_FUNC(devfn)) {
> +        if (IS_PCI_BRIDGE(pdev)) {
> +            /*
> +             * Ignore only hotplugged PCI bridges on !0 functions, but
> +             * allow describing cold plugged bridges on all functions
> +             */
> +            if (DEVICE(pdev)->hotplugged) {
> +                return true;
> +            }
> +        }
> +    }
> +    return false;
> +}
> +
> +static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
> +{
> +    PCIDevice *pdev = bus->devices[devfn];
> +    if (pdev) {
> +        return is_devfn_ignored_generic(devfn, bus) ||
> +               !DEVICE_GET_CLASS(pdev)->hotpluggable ||
> +               /* Cold plugged bridges aren't themselves hot-pluggable */
> +               (IS_PCI_BRIDGE(pdev) && !DEVICE(pdev)->hotplugged);
> +    } else { /* non populated slots */
> +         /*
> +          * hotplug is supported only for non-multifunction device
> +          * so generate device description only for function 0
> +          */
> +        if (PCI_FUNC(devfn) ||
> +            (pci_bus_is_express(bus) && PCI_SLOT(devfn) > 0)) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +static Aml *aml_pci_static_endpoint_dsm(PCIDevice *pdev)
> +{
> +    Aml *method;
> +
> +    g_assert(pdev->acpi_index != 0);
> +    method = aml_method("_DSM", 4, AML_SERIALIZED);
> +    {
> +        Aml *params = aml_local(0);
> +        Aml *pkg = aml_package(1);
> +        aml_append(pkg, aml_int(pdev->acpi_index));
> +        aml_append(method, aml_store(pkg, params));
> +        aml_append(method,
> +            aml_return(aml_call5("EDSM", aml_arg(0), aml_arg(1),
> +                                 aml_arg(2), aml_arg(3), params))
> +        );
> +    }
> +    return method;
> +}
> +
> +static Aml *aml_pci_device_dsm(void)
> +{
> +    Aml *method;
> +
> +    method = aml_method("_DSM", 4, AML_SERIALIZED);
> +    {
> +        Aml *params = aml_local(0);
> +        Aml *pkg = aml_package(2);
> +        aml_append(pkg, aml_int(0));
> +        aml_append(pkg, aml_int(0));
> +        aml_append(method, aml_store(pkg, params));
> +        aml_append(method,
> +            aml_store(aml_name("BSEL"), aml_index(params, aml_int(0))));
> +        aml_append(method,
> +            aml_store(aml_name("ASUN"), aml_index(params, aml_int(1))));
> +        aml_append(method,
> +            aml_return(aml_call5("PDSM", aml_arg(0), aml_arg(1),
> +                                 aml_arg(2), aml_arg(3), params))
> +        );
> +    }
> +    return method;
> +}
> +
> +void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
> +{
> +    int devfn;
> +    Aml *dev, *notify_method = NULL, *method;
> +    QObject *bsel = object_property_get_qobject(OBJECT(bus),
> +                        ACPI_PCIHP_PROP_BSEL, NULL);
> +    uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
> +    qobject_unref(bsel);
> +
> +    aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
> +    notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
> +
> +    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
> +        int slot = PCI_SLOT(devfn);
> +        int adr = slot << 16 | PCI_FUNC(devfn);
> +
> +        if (is_devfn_ignored_hotplug(devfn, bus)) {
> +            continue;
> +        }
> +
> +        if (bus->devices[devfn]) {
> +            dev = aml_scope("S%.02X", devfn);
> +        } else {
> +            dev = aml_device("S%.02X", devfn);
> +            aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
> +        }
> +
> +        /*
> +         * Can't declare _SUN here for every device as it changes 'slot'
> +         * enumeration order in linux kernel, so use another variable for it
> +         */
> +        aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
> +        aml_append(dev, aml_pci_device_dsm());
> +
> +        aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> +        /* add _EJ0 to make slot hotpluggable  */
> +        method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> +        aml_append(method,
> +            aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
> +        );
> +        aml_append(dev, method);
> +
> +        build_append_pcihp_notify_entry(notify_method, slot);
> +
> +        /* device descriptor has been composed, add it into parent context */
> +        aml_append(parent_scope, dev);
> +    }
> +    aml_append(parent_scope, notify_method);
> +}
> +
> +void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
> +{
> +    int devfn;
> +    Aml *dev;
> +
> +    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
> +        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
> +        int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
> +        PCIDevice *pdev = bus->devices[devfn];
> +
> +        if (!pdev || is_devfn_ignored_generic(devfn, bus)) {
> +            continue;
> +        }
> +
> +        /* start to compose PCI device descriptor */
> +        dev = aml_device("S%.02X", devfn);
> +        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
> +
> +        call_dev_aml_func(DEVICE(bus->devices[devfn]), dev);
> +        /* add _DSM if device has acpi-index set */
> +        if (pdev->acpi_index &&
> +            !object_property_get_bool(OBJECT(pdev), "hotpluggable",
> +                                      &error_abort)) {
> +            aml_append(dev, aml_pci_static_endpoint_dsm(pdev));
> +        }
> +
> +        /* device descriptor has been composed, add it into parent context */
> +        aml_append(parent_scope, dev);
> +    }
> +}
> +
>   const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>       .name = "acpi_pcihp_pci_status",
>       .version_id = 1,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f08ce407c8..06b4b8eed4 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -338,29 +338,6 @@ build_facs(GArray *table_data)
>       g_array_append_vals(table_data, reserved, 40); /* Reserved */
>   }
>   
> -static Aml *aml_pci_device_dsm(void)
> -{
> -    Aml *method;
> -
> -    method = aml_method("_DSM", 4, AML_SERIALIZED);
> -    {
> -        Aml *params = aml_local(0);
> -        Aml *pkg = aml_package(2);
> -        aml_append(pkg, aml_int(0));
> -        aml_append(pkg, aml_int(0));
> -        aml_append(method, aml_store(pkg, params));
> -        aml_append(method,
> -            aml_store(aml_name("BSEL"), aml_index(params, aml_int(0))));
> -        aml_append(method,
> -            aml_store(aml_name("ASUN"), aml_index(params, aml_int(1))));
> -        aml_append(method,
> -            aml_return(aml_call5("PDSM", aml_arg(0), aml_arg(1),
> -                                 aml_arg(2), aml_arg(3), params))
> -        );
> -    }
> -    return method;
> -}
> -
>   static Aml *aml_pci_edsm(void)
>   {
>       Aml *method, *ifctx;
> @@ -414,155 +391,6 @@ static Aml *aml_pci_edsm(void)
>       return method;
>   }
>   
> -static Aml *aml_pci_static_endpoint_dsm(PCIDevice *pdev)
> -{
> -    Aml *method;
> -
> -    g_assert(pdev->acpi_index != 0);
> -    method = aml_method("_DSM", 4, AML_SERIALIZED);
> -    {
> -        Aml *params = aml_local(0);
> -        Aml *pkg = aml_package(1);
> -        aml_append(pkg, aml_int(pdev->acpi_index));
> -        aml_append(method, aml_store(pkg, params));
> -        aml_append(method,
> -            aml_return(aml_call5("EDSM", aml_arg(0), aml_arg(1),
> -                                 aml_arg(2), aml_arg(3), params))
> -        );
> -    }
> -    return method;
> -}
> -
> -static void build_append_pcihp_notify_entry(Aml *method, int slot)
> -{
> -    Aml *if_ctx;
> -    int32_t devfn = PCI_DEVFN(slot, 0);
> -
> -    if_ctx = aml_if(aml_and(aml_arg(0), aml_int(0x1U << slot), NULL));
> -    aml_append(if_ctx, aml_notify(aml_name("S%.02X", devfn), aml_arg(1)));
> -    aml_append(method, if_ctx);
> -}
> -
> -static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
> -{
> -    const PCIDevice *pdev = bus->devices[devfn];
> -
> -    if (PCI_FUNC(devfn)) {
> -        if (IS_PCI_BRIDGE(pdev)) {
> -            /*
> -             * Ignore only hotplugged PCI bridges on !0 functions, but
> -             * allow describing cold plugged bridges on all functions
> -             */
> -            if (DEVICE(pdev)->hotplugged) {
> -                return true;
> -            }
> -        }
> -    }
> -    return false;
> -}
> -
> -static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
> -{
> -    PCIDevice *pdev = bus->devices[devfn];
> -    if (pdev) {
> -        return is_devfn_ignored_generic(devfn, bus) ||
> -               !DEVICE_GET_CLASS(pdev)->hotpluggable ||
> -               /* Cold plugged bridges aren't themselves hot-pluggable */
> -               (IS_PCI_BRIDGE(pdev) && !DEVICE(pdev)->hotplugged);
> -    } else { /* non populated slots */
> -         /*
> -         * hotplug is supported only for non-multifunction device
> -         * so generate device description only for function 0
> -         */
> -        if (PCI_FUNC(devfn) ||
> -            (pci_bus_is_express(bus) && PCI_SLOT(devfn) > 0)) {
> -            return true;
> -        }
> -    }
> -    return false;
> -}
> -
> -void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
> -{
> -    int devfn;
> -    Aml *dev, *notify_method = NULL, *method;
> -    QObject *bsel = object_property_get_qobject(OBJECT(bus),
> -                        ACPI_PCIHP_PROP_BSEL, NULL);
> -    uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
> -    qobject_unref(bsel);
> -
> -    aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
> -    notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
> -
> -    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
> -        int slot = PCI_SLOT(devfn);
> -        int adr = slot << 16 | PCI_FUNC(devfn);
> -
> -        if (is_devfn_ignored_hotplug(devfn, bus)) {
> -            continue;
> -        }
> -
> -        if (bus->devices[devfn]) {
> -            dev = aml_scope("S%.02X", devfn);
> -        } else {
> -            dev = aml_device("S%.02X", devfn);
> -            aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
> -        }
> -
> -        /*
> -         * Can't declare _SUN here for every device as it changes 'slot'
> -         * enumeration order in linux kernel, so use another variable for it
> -         */
> -        aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
> -        aml_append(dev, aml_pci_device_dsm());
> -
> -        aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
> -        /* add _EJ0 to make slot hotpluggable  */
> -        method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
> -        aml_append(method,
> -            aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
> -        );
> -        aml_append(dev, method);
> -
> -        build_append_pcihp_notify_entry(notify_method, slot);
> -
> -        /* device descriptor has been composed, add it into parent context */
> -        aml_append(parent_scope, dev);
> -    }
> -    aml_append(parent_scope, notify_method);
> -}
> -
> -void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
> -{
> -    int devfn;
> -    Aml *dev;
> -
> -    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
> -        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
> -        int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
> -        PCIDevice *pdev = bus->devices[devfn];
> -
> -        if (!pdev || is_devfn_ignored_generic(devfn, bus)) {
> -            continue;
> -        }
> -
> -        /* start to compose PCI device descriptor */
> -        dev = aml_device("S%.02X", devfn);
> -        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
> -
> -        call_dev_aml_func(DEVICE(bus->devices[devfn]), dev);
> -        /* add _DSM if device has acpi-index set */
> -        if (pdev->acpi_index &&
> -            !object_property_get_bool(OBJECT(pdev), "hotpluggable",
> -                                      &error_abort)) {
> -            aml_append(dev, aml_pci_static_endpoint_dsm(pdev));
> -        }
> -
> -        /* device descriptor has been composed, add it into parent context */
> -        aml_append(parent_scope, dev);
> -    }
> -}
> -
>   /*
>    * build_prt - Define interrupt routing rules
>    *

