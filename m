Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4824255njc;
        Tue, 27 May 2025 06:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBki9zWb41mUBHHydhWxdq/araxB34xxTkAEkjPnyNOSK98SFJ/biFijSdx8tKGChiel+Jv8kMCuwDjw==@linaro.org
X-Google-Smtp-Source: AGHT+IHmR+Sk1CqFZE3cO+6Q3O3alfL9IAizLHhkBE1qhOr7NoFb2qgMXIk39+5tN+T5JNSfaFeN
X-Received: by 2002:a05:620a:31a0:b0:7c7:ad45:b3d4 with SMTP id af79cd13be357-7ceecbe7f72mr1842261085a.34.1748353402852;
        Tue, 27 May 2025 06:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748353402; cv=none;
        d=google.com; s=arc-20240605;
        b=OumE+LE+PhWp3RxSHRg9Z5pkwZykUCjkkzpzbCi+69k49M7sPDxDIK8a72REf8Rec4
         AEXiViqCKDXD/RRN23BoQazOywJckPDTlV+WllY6pV7iHmPzz8CNMYMOyYFTHW3DJQy0
         GbPiXPVdcG0SrQvS3+PIgpFY+rdLiXczDy3j44iU+CMVHGvrJB52jFFLL5oY8zyahcdl
         VzPlIy0JwZ11uSmneiWv0j9GKGe1Dm6DdakRKMI62qEn60xQRkxj/iU2cxhx1m8fp7lx
         fuEjnqJwU0MKRKCoEfvaoNUKhH/Y968QI2QOrcKUVOW89+UIic7hyz7lOKo1alW9yg+w
         FGLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=OhW6/sBU+DZCnT3Od1+u9HEJPARdh0nIEibFY/6JtGY=;
        fh=tU0GDwaRaezZf8VzQdUr1gAUOuHa14t2jlxenlTeDM0=;
        b=Z3QeyKLKouNWe27Bji6y7yhQkcOIx5MvtkHtp1lQ8oX1VKe0PJfel2gV0uDDoPESE0
         IKUE/jS3UXJ97ftXBgZ76I0UaUT+zH8zqMoA/NLqw7lbeMIT7HCmnuFucliq59UcudOx
         U7TmqyeV9AXfXCMsU7XbmmULeIKRjml/XsIuzlcctfqWQOZwBaax4yTv9Gtbe8ydo/ay
         1eXz4p+dMd36wPVWWx2Beh4R7DkKMSCWM93lGBZZ0xpUH6uVcfAclVGHvJwiZvtfsPgw
         Fp8DVGBOL4hj/r1Z4U76bjdfJKUdFLxnNirY39+i/5sSty2QHwXAcwgeW+58BsQqIiYl
         yL3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fm5h5aRn;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd46889a24si2684146285a.230.2025.05.27.06.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fm5h5aRn;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748353402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OhW6/sBU+DZCnT3Od1+u9HEJPARdh0nIEibFY/6JtGY=;
	b=Fm5h5aRnxb5bxKDDEn9OxOTnXQtQxO5o4fHnzC4VPqky0xPqm7uuCQXKA82Sf4kLVWhJ1b
	sVRfcwBFpxy5mJtDGZJVNmH6cQNHAFePeFjPqwhF/DdQpGbMMDJ1xgZZb7HV/ldS1/oVOB
	XEdzaXVmHF6WTbL25zfEraXswo/ybfo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-nhPNuA_AMdCOUsiAOL_AIg-1; Tue, 27 May 2025 09:43:21 -0400
X-MC-Unique: nhPNuA_AMdCOUsiAOL_AIg-1
X-Mimecast-MFC-AGG-ID: nhPNuA_AMdCOUsiAOL_AIg_1748353400
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso17463195e9.0
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 06:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748353400; x=1748958200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhW6/sBU+DZCnT3Od1+u9HEJPARdh0nIEibFY/6JtGY=;
        b=ipXhA/oH82CBRoj5ar8wn/uwVpkOjMSqr4iVeP902IWHV1Z2R1XjpnDMZrmlisUGGY
         zIBFV5SE2cdG3gc8XIHkHJpMBM7L51oGB7QrkxW/BVsYGZirgXXjhU/JL+FXIoMxbvY2
         tU4/JFz1xNo3kovxyZEnWBcF6Ub2vJMrdvNcepyIyf53nNo+9P0fjXaIOaCcEqkqeC/i
         yQINAJFJdK2yEIvs51Hi8jwxv0Ee/VBs31qOOjrYjKBhF5Miab8ioh3ZQRjNHB3ckaOJ
         UcMOUfC3wU3OQuEwhhaxDvhsfg8GQb/2U3XUdKCtD98hfrcdENuSPzlAUy1+E4BKoAjS
         +OMA==
X-Forwarded-Encrypted: i=1; AJvYcCWQhrciib9BYSvqB+zgNlr05BEN/Q61eDO8Co3RFCBNch8cqMR94XfaUJ4I9afdeNwN+qfp0lEY5b+t3g==@linaro.org
X-Gm-Message-State: AOJu0YwWOiBn07knY+2D+Yv2oqVNId5KEYyrg4Pbf6fCvT89fr20yXeH
	QoRLc1tumoH5Nj5+VRoOgUDiGIYUx1unFXGTpyW1T1u8xlmrlhxj7qxMgvbnBslkksHvoGwlFZ2
	aPMpZfPDIiUqPKw+136bra+NYFKMWbV6HdfX1/JaWEXlQAk4Pl5Ik0qJVgQ==
X-Gm-Gg: ASbGnctjlqyyckfdLhzhNv+nM3huF3OeoyxL2opipqmUjpaaeT3hZG/OT4COCDTief1
	z9Kb4y1AS6njNwG9S+yT6IlZ4pKl/FRPdg1QN6U66l1a4uWaX6IHALoMsnSryisvD1kTv1iFybI
	AKGZFccMx2iI+y2kol5TqqHJsAeHSAXSlmdMA07tlsmWda+JKHhx89n1MQ7CfcVUr8g71OWwqiV
	6ZDIYGHoftbE8vJH7QCZqLW61HOZQSnZGGBucB37WKUe+2S6wC5gUxP1VnMWn7s2i+4KP6JVoI1
	rUavpAapPv/oGZHJ3lpdmTnAvNLgxYQ3
X-Received: by 2002:a05:600c:3ac4:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-44fd1a5bcb4mr6314325e9.12.1748353399708;
        Tue, 27 May 2025 06:43:19 -0700 (PDT)
X-Received: by 2002:a05:600c:3ac4:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-44fd1a5bcb4mr6314025e9.12.1748353399268;
        Tue, 27 May 2025 06:43:19 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef032esm275419735e9.9.2025.05.27.06.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:43:18 -0700 (PDT)
Date: Tue, 27 May 2025 15:43:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 14/25] hw/i386/acpi-build: Move
 build_append_pci_bus_devices/pcihp_slots to pcihp
Message-ID: <20250527154317.5f804abf@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-15-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-15-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NCUALnWGLeZqN7V79HXgDfAQ8Fd7FXGpURRuXykElVo_1748353400
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: IwmgnjaQeA+x

On Tue, 27 May 2025 09:40:16 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> We intend to reuse build_append_pci_bus_devices and
> build_append_pcihp_slots on ARM. So let's move them to
> hw/acpi/pcihp.c as well as all static helpers they
> use.
> 
> No functional change intended.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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
