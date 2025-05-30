Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1036944njh;
        Fri, 30 May 2025 03:24:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJ9lNPgMZ1d4gntjeU817KDgcm41xBAtGMbjF0EV4EJKwv5SOUhOREDodbf9LC3tdhFcFfyftG934p9A==@linaro.org
X-Google-Smtp-Source: AGHT+IHzQjt4cofkKOjG/MDTH46dXBvxj8Gb6cP7DjkPsn7RNIMrng1/WdkU4O5LC4+h4a4Tc+LL
X-Received: by 2002:a05:6000:250d:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3a4f7a3e96cmr1936384f8f.5.1748600665453;
        Fri, 30 May 2025 03:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748600665; cv=none;
        d=google.com; s=arc-20240605;
        b=Tj2LO/nn7Zez9ByDSaUBLoQHNRHBMtjgcVxTi5HkagpwZ27PIkDbDnB65aDrNHGY4f
         yCcQo2Y3gIJuYR77Ns77Lq6yzGWGA7Q9KhSWJltmaaAoCptZzmavm2fxf4Mzw4JjetAC
         njDzIi4WaAX08ECTdVOxG7t+LPrSzFhg7l0KBuS3DxNv9mYI3n8jZS2HOMmHHpwS4s/J
         qns7NYYB1TNbFkYjgrkO7m6lDoJkHmxu8NjvCEVu7DQTG/qyUxQNAaVtvv72VIzZFZj3
         A0ULF8yghv10QLvCsebL2WUDvf/dx9Mgyh4+Pd5RM1sac5nIxTwjIrcbYtY0HhP24ZKc
         Gfgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=e1OUmWL23AisSsks9erPcFWBfWV4ZRkRMATvyg1YyG4=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=fu58nQkGjvjGtGswjx0oOvJQ5GE1HUuTVk38VN/cVhAgQ9XkkNqHwaPWL5TYXnDdb+
         1HlTbb2QrHlZIJ2dN3Yvg3Jr8mIuGu9bP3yXHzBVxEwzHhdneerHnkzyrIS2b30bjkgJ
         f20yPxwdxgdHuhkw4dGxxnBIRgdhLAv5GlKeBbNnF3kzCkAPxOVU4DZjiVWt/wxCrSaT
         axY4duwhy62217ErXC+cIsKXnX6JG22t9VwGK2h2iXCj+Kk8NrapHxZMGlMFCq+RmYkg
         pF98lz1hFcg1aAacRWLkLX1GxLlj28rrmlHNh7/5tYdwNqTo/C5LSvyYyydq56K8gCBs
         11wg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4efe5be89si2531429f8f.217.2025.05.30.03.24.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 03:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7zql1rTKz6GFKD;
	Fri, 30 May 2025 18:24:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AA5C51400C8;
	Fri, 30 May 2025 18:24:24 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 12:24:23 +0200
Date: Fri, 30 May 2025 11:24:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 14/25] hw/i386/acpi-build: Move
 build_append_pci_bus_devices/pcihp_slots to pcihp
Message-ID: <20250530112422.0000376e@huawei.com>
In-Reply-To: <20250527074224.1197793-15-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-15-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 6E4KdHj9xwZ2

On Tue, 27 May 2025 09:40:16 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> We intend to reuse build_append_pci_bus_devices and
> build_append_pcihp_slots on ARM. So let's move them to
> hw/acpi/pcihp.c as well as all static helpers they
> use.
Oddly short wrap.   I guess it kind of looks prettier than ...

We intend to reuse build_append_pci_bus_devices and
build_append_pcihp_slots on ARM. So let's move them to hw/acpi/pcihp.c as 
well as all static helpers they use.


... so I'm not that fussed.

I don't really mind, but maybe a short statement of why you
put the functions in a different order in the destination
would be a good thing to add to this description?

Either way
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> 
> No functional change intended.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  include/hw/acpi/pci.h   |   1 -
>  include/hw/acpi/pcihp.h |   2 +
>  hw/acpi/pcihp.c         | 173 ++++++++++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c    | 172 ---------------------------------------
>  4 files changed, 175 insertions(+), 173 deletions(-)
> 
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index ab0187a894..4dca22c0e2 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -37,7 +37,6 @@ typedef struct AcpiMcfgInfo {
>  void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
>                  const char *oem_id, const char *oem_table_id);
>  
> -void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>  void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
>  
>  void build_srat_generic_affinity_structures(GArray *table_data);
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index f4fd44cb32..5506a58862 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -80,6 +80,8 @@ void build_append_pcihp_resources(Aml *table,
>                                    uint64_t io_addr, uint64_t io_len);
>  bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus);
>  
> +void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
> +
>  /* Called on reset */
>  void acpi_pcihp_reset(AcpiPciHpState *s);
>  
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 907a08ac7f..942669ea89 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -27,6 +27,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/acpi/pcihp.h"
>  #include "hw/acpi/aml-build.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>  #include "hw/pci-host/i440fx.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
> @@ -763,6 +764,178 @@ bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus)
>      return !!nr_notifiers;
>  }
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
>  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>      .name = "acpi_pcihp_pci_status",
>      .version_id = 1,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 3275675e60..fe8bc62c03 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -338,29 +338,6 @@ build_facs(GArray *table_data)
>      g_array_append_vals(table_data, reserved, 40); /* Reserved */
>  }
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
>  static Aml *aml_pci_edsm(void)
>  {
>      Aml *method, *ifctx;
> @@ -414,155 +391,6 @@ static Aml *aml_pci_edsm(void)
>      return method;
>  }
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
>  /*
>   * build_prt - Define interrupt routing rules
>   *
