Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp216106njc;
        Thu, 5 Jun 2025 05:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCWacdijNWY+SPG2LhG7k6Xp8fhX3AHy2ark8PYVegni5MSi1ipbQ5oVxj7Wc/+mnm3V0wE6JDi5bbqw==@linaro.org
X-Google-Smtp-Source: AGHT+IHxNvqcIPP1qZvqA4ESDLh0kgQLCLI2xChXF7qoAbgPL5krZc3sPEhEPvQzc/afMsg4lojl
X-Received: by 2002:a05:6102:6d1:b0:4e5:992e:e397 with SMTP id ada2fe7eead31-4e746e69287mr5834150137.19.1749127559257;
        Thu, 05 Jun 2025 05:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749127559; cv=none;
        d=google.com; s=arc-20240605;
        b=ayOAF+JvnsCrWwafz9r5+G3cVeIu4bsr6AMmH8sDz7YCi9vACAfVTLFyta4x5q92hF
         sKqa1LqNDMC2VHwoP9jSF4Qee39WfPObuHbMSLsnrH5hRCI9efDFcD/FucMg+loJyUeC
         5B4+5b27ccum3oqP9vNT4gbFY3OGGdnv+z3p+8vmH4vR6nOnRMPXXTdl+ZCgpvuuglJK
         CI/Yn0Dde7p/y2lIjtd1DZsriCPKbHuTyxqt7d5SYdwnUSbX7Nb8tPd0an6NsfdZJuk3
         09xgQJ+f+NkwQtyYWwP3Sfb3peRwoStw+raTnqF1tLimshqkdVhTFYlYWetku3ycscEU
         zHpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wCkw4BoI1QVAwm6Z4o8j5v3Q/B10/HA0UwU8zz1Aer0=;
        fh=m7bC1YVcbcSD1/EbEXCAbB+iLG14g8aetggHX5bOnQs=;
        b=cKu2p3hU7gA1OIq5//8nxbcUu7JcxneRi3l+OGvSzRCdVftSSpyl+cBxnTl/bOFIsF
         Td+K22zbLdR52D3yZ+pFyVbn2Zpqgq42XokFmPbaJCA126oq7YAs0seXjjS0gBss71ky
         YBfyesl/HWinvb2AqImkX3zB/l4EKBYVvL10C0cfN3Z6KmOduam2n7mTjvaefBAz9Jon
         bEZQ1z7PxD/WYQVY/fCJvs4kKlcM6q9rK4fBZMcuKVjP5fI3ihKAOLY7yu9eKw4xQO5x
         XVQycn5nSxFxiVQYXl2fwv6QXjAQ4C5X1/XtrHuRs+qkwlhYPfPtUcjVOMOfpgAmygdc
         s6gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XGAyHIBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-87e2a3bf388si4836049241.84.2025.06.05.05.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 05:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XGAyHIBt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN9yP-000305-5x; Thu, 05 Jun 2025 08:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN9yH-0002y5-Ew
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 08:45:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN9yB-0002Zv-MY
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 08:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749127518;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCkw4BoI1QVAwm6Z4o8j5v3Q/B10/HA0UwU8zz1Aer0=;
 b=XGAyHIBtOoFIXBJ6rzksW1RDSn1yDodmB6b51LUQ/34gfsNMkvxqIhVLqi/T+n1EtZ1dzq
 3+K+LNQpCX0m1etA/+jBlN3X1Wj6Bh66beJHWt2h1Ex6Qjf7SWAMYbLgYf7oi5C4hNlvfT
 cHJEfbi3Lbn3X56ltwqPlU755ZcT6zo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-pvsNq-B-MtODFpE4hH7_pg-1; Thu, 05 Jun 2025 08:45:17 -0400
X-MC-Unique: pvsNq-B-MtODFpE4hH7_pg-1
X-Mimecast-MFC-AGG-ID: pvsNq-B-MtODFpE4hH7_pg_1749127516
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43eea5a5d80so4278385e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 05:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749127515; x=1749732315;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wCkw4BoI1QVAwm6Z4o8j5v3Q/B10/HA0UwU8zz1Aer0=;
 b=BApih3v2A0BvvD0UuLi0bT3rTpfIC6VDv3wdX+zGlgV/Ql0GYcuQxhd0Vxb5s/7qbL
 R5ePYLBru4a9lG/1PMna8eL8nWRnKi05ZpkNvoBNW7/58ln2frdNhzMF8RI1bpH67ND3
 Kx9PklgR5rrMLw6FNyzoSiXmuOzN8WCgRFZsmyWoyJ7pd6qGINiCMPpLYdNg0MoCQaVd
 /QRMknJnHIM+S2XVgEtGW5388NwG63ZoH3DDRhNwwhDwYfObUJ80EZzC2k0/HGCPQyKN
 whAnIgNCMyEkLzdtVJYEwMsC1aUCpkmLetV+HhcUDFqh/L8wYhWioEQcAPQUWSmO6vHB
 iOwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8DS5HQbmYnt+aIUAEnCzFDQq7F5wBBwI8zJg9V35o3K3EifcdmuuJvUoaus8HHR/Yy357hEAvYA==@nongnu.org
X-Gm-Message-State: AOJu0YyyfO781a0666p93Ka7rXA4Ml3Dj+f4YlVNzgpyFkymTMKGqtFE
 EVewORZgqAGak535T6SzUqtAYhyc1Dhv0sJWG1HMJkczOUrlOK9YCCIPh6cYkQbTs+wnJtVwLac
 4RvLbVrhvNq9pr3jAIHajYLbx/PqNGns0lwoZVqtN5rcnOmHAb+vcZQ==
X-Gm-Gg: ASbGncuBLoLuOmW0DxLglQW+XvafAS+oxP4RV38wLkn8RLzAqiCKnFK4KxefiYrsscj
 zSue3Uacu3yiNf2sxx2u9YF5JNvsEvCxyfZ/t1GGAAUVlUPLcZFW+knePPkwQyGsvorGnvzXIOv
 m/5zZWDIDJeNiJx3srusuBLCmT2BHTLcZAgPbiNzhX1e7MkuPwTJaZyGxM8tJlNGIUCHfaQhjE7
 yMHeSRsGOBiloUECHbLzG5/bBzoT4+8JllRUd+VqIEIgAMvg/WZQC/Ly3an4T5uieiJRwyzYLc4
 HcEGnUNBD7GiWGEEHz918OrzHsJDanY3Xd5CeA0tgZHgDTvFFw38v7dBoEV2xFY1G5Oapw==
X-Received: by 2002:a05:600c:4691:b0:445:49e:796b with SMTP id
 5b1f17b1804b1-451f0b10a06mr71064225e9.17.1749127515382; 
 Thu, 05 Jun 2025 05:45:15 -0700 (PDT)
X-Received: by 2002:a05:600c:4691:b0:445:49e:796b with SMTP id
 5b1f17b1804b1-451f0b10a06mr71063885e9.17.1749127514902; 
 Thu, 05 Jun 2025 05:45:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451fb208926sm18145825e9.23.2025.06.05.05.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 05:45:13 -0700 (PDT)
Message-ID: <f7231c75-b060-484d-a02a-51da624cb1a0@redhat.com>
Date: Thu, 5 Jun 2025 14:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] hw/arm/virt: Allow user-creatable SMMUv3 dev
 instantiation
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-7-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250602154110.48392-7-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nR4WKELvgW7kFwFhiqo7k1FYYPEx1oz-IEYvivWZkcc_1749127516
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xjypdD7TR0PX



On 6/2/25 5:41 PM, Shameer Kolothum wrote:
> Allow cold-plug of smmuv3 device to virt if there is no machine
> wide legacy smmuv3 or a virtio-iommu is specified.
>
> Device tree support for new smmuv3 dev is limited to the case where
> it is associated with the default pcie.0 RC.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3.c      |  2 ++
>  hw/arm/virt.c        | 50 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/core/sysbus-fdt.c |  3 +++
>  3 files changed, 55 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 7e934336c2..d1f66dcd8f 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2004,6 +2004,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>      device_class_set_parent_realize(dc, smmu_realize,
>                                      &c->parent_realize);
>      device_class_set_props(dc, smmuv3_properties);
> +    dc->hotpluggable = false;
> +    dc->user_creatable = true;
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index eeace4754d..04bc940fc3 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -56,6 +56,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
> +#include "hw/pci/pci_bus.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/core/sysbus-fdt.h"
> @@ -1443,6 +1444,28 @@ static void create_smmuv3_dt_bindings(const VirtMachineState *vms, hwaddr base,
>      g_free(node);
>  }
>  
> +static void create_smmuv3_dev_dtb(VirtMachineState *vms,
> +                                  DeviceState *dev, PCIBus *bus)
> +{
> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    SysBusDevice *sbdev = SYS_BUS_DEVICE(dev);
> +    int irq = platform_bus_get_irqn(pbus, sbdev, 0);
> +    hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    MachineState *ms = MACHINE(vms);
> +
> +    if (strcmp("pcie.0", bus->qbus.name)) {
> +        warn_report("SMMUv3 device only supported with pcie.0 for DT");
> +        return;
> +    }
> +    base += vms->memmap[VIRT_PLATFORM_BUS].base;
> +    irq += vms->irqmap[VIRT_PLATFORM_BUS];
> +
> +    vms->iommu_phandle = qemu_fdt_alloc_phandle(ms->fdt);
> +    create_smmuv3_dt_bindings(vms, base, SMMU_IO_LEN, irq);
> +    qemu_fdt_setprop_cells(ms->fdt, vms->pciehb_nodename, "iommu-map",
> +                           0x0, vms->iommu_phandle, 0x0, 0x10000);
> +}
wondering whether you couldn't have put that code in hw/core/sysbus-fdt.c
just like add_calxeda_midway_xgmac_fdt_node(). vms can be retrieved from
the object hierarchy I guess.

Actually the original infra was made in that spirit. Now I know that
Peter is not a big fan of all those VFIO platform related stuff ;-) so I
have no strong opinion either.
> +
>  static void create_smmu(const VirtMachineState *vms,
>                          PCIBus *bus)
>  {
> @@ -2931,6 +2954,13 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>          qlist_append_str(reserved_regions, resv_prop_str);
>          qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
>          g_free(resv_prop_str);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
> +        if (vms->legacy_smmuv3_present || vms->iommu == VIRT_IOMMU_VIRTIO) {
> +            error_setg(errp, "virt machine already has %s set. "
> +                       "Doesn't support incompatible iommus",
> +                       (vms->legacy_smmuv3_present) ?
> +                       "iommu=smmuv3" : "virtio-iommu");
> +        }
>      }
>  }
>  
> @@ -2954,6 +2984,25 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>          virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>      }
>  
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
> +        if (!vms->legacy_smmuv3_present && vms->platform_bus_dev) {
> +            PCIBus *bus;
> +
> +            bus = PCI_BUS(object_property_get_link(OBJECT(dev), "primary-bus",
> +                                                   &error_abort));
> +            if (pci_bus_bypass_iommu(bus)) {
> +                error_setg(errp, "Bypass option cannot be set for SMMUv3 "
> +                           "associated PCIe RC");
> +                return;
> +            }
> +
> +            create_smmuv3_dev_dtb(vms, dev, bus);
> +            if (vms->iommu != VIRT_IOMMU_SMMUV3) {
is it worth to check given the check done in
virt_machine_device_pre_plug_cb()?
        if (vms->legacy_smmuv3_present || vms->iommu == VIRT_IOMMU_VIRTIO) {

Cheers

Eric
> +                vms->iommu = VIRT_IOMMU_SMMUV3;
> +            }
> +        }
> +    }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          PCIDevice *pdev = PCI_DEVICE(dev);
>  
> @@ -3156,6 +3205,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_UEFI_VARS_SYSBUS);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ARM_SMMUV3);
>  #ifdef CONFIG_TPM
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
>  #endif
> diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> index c339a27875..e80776080b 100644
> --- a/hw/core/sysbus-fdt.c
> +++ b/hw/core/sysbus-fdt.c
> @@ -31,6 +31,7 @@
>  #include "qemu/error-report.h"
>  #include "system/device_tree.h"
>  #include "system/tpm.h"
> +#include "hw/arm/smmuv3.h"
>  #include "hw/platform-bus.h"
>  #include "hw/vfio/vfio-platform.h"
>  #include "hw/vfio/vfio-calxeda-xgmac.h"
> @@ -518,6 +519,8 @@ static const BindingEntry bindings[] = {
>  #ifdef CONFIG_TPM
>      TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
>  #endif
> +    /* No generic DT support for smmuv3 dev. Support added for arm virt only */
> +    TYPE_BINDING(TYPE_ARM_SMMUV3, no_fdt_node),
>      TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
>      TYPE_BINDING(TYPE_UEFI_VARS_SYSBUS, add_uefi_vars_node),
>      TYPE_BINDING("", NULL), /* last element */

