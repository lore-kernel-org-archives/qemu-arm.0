Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2384425njc;
        Tue, 17 Jun 2025 02:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4HZftvwslJ3NqHikWjYV9TQG+mbRvTxULwvPAJehRcMq7EQv6zLMgiXAO9t+cIREHVPnsarXwSZYCaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF2fanxlFzMmG1b83U7rkJdlTj22rNFl62G+ltOehD1bd1oAhyevFcoanBT85vZQGvAsV8W
X-Received: by 2002:ac8:5749:0:b0:4a7:14fc:205e with SMTP id d75a77b69052e-4a73c5ce782mr243690671cf.50.1750152342974;
        Tue, 17 Jun 2025 02:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750152342; cv=none;
        d=google.com; s=arc-20240605;
        b=hB2/nkYih7OmHzpF5EnxKpbX/CAg/T/6MKef3HdYdZw+nK7PY7rfoTfdiBQ2Xbw4xv
         3kD2mUNleek+jRXm2dHOspagVTcSpDCcCQvXtNGsx6evRonnhMS4ZbS5PPbn8LYa7UB7
         y6Z+w/YPhOYi7YibNLdfo7afM3rgF0IYDwjhdXfxcG+K2Z3TN2aCN//bT5LlM9nPOQkn
         1mnPNRF5688tmJUb+Kxfi69/q8gJ/oCZC/l1c1cAtm/o9FO6dv/3QFXkkYYCNxdhiut6
         5OVmmHrO4Tt/KH725U5Np7SNa5A3B4ZXkgMVe96rqSDhD4Kynm64uXVtUiyeny10ljbG
         WB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BCvYnmfUh3k8L/nZQL0ryA8dOhrVVEcQo/AQMdvdIgw=;
        fh=JESPWm+zbL9edpKt9zr3ghWG9QDvO3sT7rzpSB5tZ5s=;
        b=DSlylwJOv0jhxW2L/YdPpplGFMewOyLoU8FPYdUiy/CtWp6FbRfvmmTC20xw7/LZf5
         SmYqLdVpbUSbn9zo7Ya+vLyBgmIWKVXl6L84K9+AS9IA81sX0pUn5hiZXsx47ALh3a5m
         2QbEO2Tf/bDfByOgzforaPcuF+rHRXUlh3xl9L//3so1dGwfajq80CEvGbymkH93WaX2
         fGqhQM9vHDdGIH0JDJsSmQFWlj+gmH0zat6+EUY6AJidsYRpBuzN43HEsEAipsGcmIsb
         gd9GKDSGnTIH6Tn63Ki7IC9I5IBWPFamvMkBb522dMfCO7NhPJ7ymt/Dk9eM5P2CjPhD
         8AKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CsQprP/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b95basi117259331cf.14.2025.06.17.02.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jun 2025 02:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CsQprP/M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRSZW-0003HS-T3; Tue, 17 Jun 2025 05:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRSZU-0003G7-00
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 05:25:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uRSZR-0006qZ-9K
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 05:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750152331;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BCvYnmfUh3k8L/nZQL0ryA8dOhrVVEcQo/AQMdvdIgw=;
 b=CsQprP/MVHlaiyWIXNP3xTi3HJfsWEiudxhJr3ZfptnZaZkweJErIDJNVNHQh03NiABBWy
 zYBpgzxLX66o8lr0UNFtlojpaatuc7CbNK4YB6m4A/ki1Adri0nUUr+bcVGLCO4wJqrKSc
 DzSUhbAIZDUD1C3Kh8qic249g8U9pvM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-FF7kJ2yBN5qyi5ykfPgoYQ-1; Tue, 17 Jun 2025 05:25:28 -0400
X-MC-Unique: FF7kJ2yBN5qyi5ykfPgoYQ-1
X-Mimecast-MFC-AGG-ID: FF7kJ2yBN5qyi5ykfPgoYQ_1750152327
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-452ff9e054eso28657125e9.2
 for <qemu-arm@nongnu.org>; Tue, 17 Jun 2025 02:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750152327; x=1750757127;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BCvYnmfUh3k8L/nZQL0ryA8dOhrVVEcQo/AQMdvdIgw=;
 b=QpvhkXFyQ63Ronez0BegWx0RFpzgu3m9klSyo++bO8ncSVHVme7/gpQZRZ+Lkm8CMm
 cjK4vq54avzne/5nLoJCkCmm0+ncqW01xTwtvIk+oTFdeUXjS/CwCn2SShr+V8fZ24BO
 7xee0NJFISP9ZYuCfrItaSc1THVdzlS6cGYn6YBYdwhtfU0/+TTxjh2REEyhxRGtlNYu
 2YU5L1oKLJFRKFCQEePtBzytYvZEnJV6zUE1IuvRy09P6yE2cQEr06Em009SnnrIjEzI
 xHBc7C9/UUeYAyENNW/OA3KIdOXkOZdholhta0VwPRRKflklwNVcghbo1kX16MzALxC6
 CuBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhBJis28Z5BdqJWayYkAnYXu6qPYBq9egpQnIGaAHhynZVQ+coesycItR9tybvIO7Wi2FPxpJmNA==@nongnu.org
X-Gm-Message-State: AOJu0YzLg3FAX5ULIX9jBWtUfpsq9KDecBgll7jxzkozpcaB4/2sfl/4
 LrhpXrGZ8EunYRcFBUAxrogW20LZkbFTmDfi6pM8+20GttCSuBSmq+Qv471IfVOKsmI6X7BKpdb
 AdFGzVqQzSScOMW6eKYwd90YXTa2fzDGzMFh/DnIqsGY8QDKSp/B6pQ==
X-Gm-Gg: ASbGncvUBDXPCYPoY7Wne97ONowYUbjCviCqX4qMbqCWjmIxnKA5Z2cIeEd0EMT1mC7
 BH8qH19R8wsEqDGOLt4TJjk+/ixfc1U1UTHjJ2g3RT/7KuAwP+FDot0HmKD7BU9trD/6qVghNzr
 fr9W5OJcQ0P8iLsXFsxXypArfpWCLLwrZbGLIrWhEv1dGfFJVcSBSuSfOm2PqssDcNxcN1rpnar
 2ogLT9DX+qz3xdzrihtgk96ZVjx1Bnt5j6m/E/MYgTnMzutZsKv+bTVBbColhAbsCg09MLbrgeD
 KtJCTofIg7iDS5DE1y0GG8U0L5CzNwCyWAg0YIXYolY76cdCquoj91FJb6H29zRMREeOFA==
X-Received: by 2002:a05:600c:1da8:b0:43b:cc42:c54f with SMTP id
 5b1f17b1804b1-4533ca6762cmr121599975e9.14.1750152326915; 
 Tue, 17 Jun 2025 02:25:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1da8:b0:43b:cc42:c54f with SMTP id
 5b1f17b1804b1-4533ca6762cmr121599715e9.14.1750152326464; 
 Tue, 17 Jun 2025 02:25:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e13cfbesm170841525e9.22.2025.06.17.02.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:25:25 -0700 (PDT)
Message-ID: <8704b4ec-d0b4-4c6c-95fb-dbe597d16a9e@redhat.com>
Date: Tue, 17 Jun 2025 11:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] hw/arm/virt: Allow user-creatable SMMUv3 dev
 instantiation
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 linuxarm@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-7-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250613144449.60156-7-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HuBjT4iwMUWDUzbfGpL0sFIsKntIN8Lj5DMazfV94f0_1750152327
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.892,
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
X-TUID: WvGN7b1OY9t2

Hi Shameer,
On 6/13/25 4:44 PM, Shameer Kolothum wrote:
> Allow cold-plug of smmuv3 device to virt if there is no machine
> wide legacy smmuv3 or a virtio-iommu is specified.
>
> Device tree support for new smmuv3 dev is limited to the case where
> it is associated with the default pcie.0 RC.
>
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3.c      |  2 ++
>  hw/arm/virt.c        | 47 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/core/sysbus-fdt.c |  3 +++
>  3 files changed, 52 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ab67972353..bcf8af8dc7 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1996,6 +1996,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>      device_class_set_parent_realize(dc, smmu_realize,
>                                      &c->parent_realize);
>      device_class_set_props(dc, smmuv3_properties);
> +    dc->hotpluggable = false;
> +    dc->user_creatable = true;
>  }
>  
>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index eeace4754d..3be007d87c 100644
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
> @@ -2954,6 +2984,22 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
> +        }
> +    }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          PCIDevice *pdev = PCI_DEVICE(dev);
>  
> @@ -3156,6 +3202,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
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

