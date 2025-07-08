Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9DCC8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:08:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFAR-00034F-7z; Tue, 08 Jul 2025 16:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZDjP-0000hN-C4
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:12:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZDjJ-0006C2-5a
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752001900;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IsMbAriCtKjDhyeVOZuhFppiFoqdOBN5AQNhiodm5U=;
 b=cESNdkqLM8SmIMhezAjUMwTfVdnAqXi4xGCDJ9sdeoa0sIIrk2yhKXSBMmSXcPy6PfJbnI
 B0sZTl3JNIc+iPufRmZDkZO4uoShuGZf2SmFUDI8rxpjRfMFmqFzXplYpnd23qBYaURMwc
 0G6USxN/dKFT1g+w9dtnFNiOJnqLhx0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-Es7F0TVFO7OywgIcJ8svag-1; Tue, 08 Jul 2025 03:41:28 -0400
X-MC-Unique: Es7F0TVFO7OywgIcJ8svag-1
X-Mimecast-MFC-AGG-ID: Es7F0TVFO7OywgIcJ8svag_1751960487
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4f85f31d9so1464164f8f.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 00:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751960487; x=1752565287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5IsMbAriCtKjDhyeVOZuhFppiFoqdOBN5AQNhiodm5U=;
 b=MgiMCw8XsHYKGiNgAE7FVDrBs+doooxkgIT0ejShqz79vgOxqncgt0tVC2Ds2SFCoT
 /s4jfecDo/YmEVaoVIKHuC+QM1ZtUhRzksXgYHzSUnu51UWDmrvOlGq2NC+9+d+uhAbG
 p7mDyRHx8wq9I/MYqkDbP2jRA4NdgiZX/XdUYFQF0VIKuy6tIxRSK09N4FguhCkDsDbu
 hrkbMFh15f/R2abC17VNjFkF25MV8U/o8O3Xr1/2FZVmzsKyWUaSYrXay91CJupVFktq
 iDwdjGxS5w66dxdxa86J93nxoOcGRVL9peu18oLHJCdq+eiy/ZfBBOe86K9C3hEEbsay
 Qi4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9+LwHrLTteKqHvmp7gDmXQ/UphxoQzzD4m2M95UtAf3rZNRk3VC9KrdugvfmVkujzc9b6zJBTog==@nongnu.org
X-Gm-Message-State: AOJu0YwkQ7XFyuKvJh71KUdJd0+Tvfsux9CxeyP+VSPNacsnmV4dr6Yj
 ZXNhid7Nuv7rDefp21WkQxzJEWfg0lW1BX1wvfLnKfRUYD/eYgIXyP0JYIeYMeWBwvgP/xiFwpx
 j3n7AEKifgyNBKCoNnSm9JQgdXu7+RQk6Her2IpjRYW7F8efScmlbAA==
X-Gm-Gg: ASbGncsH18RN8Re/W6QEAmnzUdwy9AEN9LddNkOn+WWfVT/P87hzpkXuOlG54K48Dab
 8O0BASVxOUbiLEi7Bw7LxaNqbysMwbDHwNodnIAqIwUR24rXhjNj9cEsZ61Uh1T/MVA+aZLHpl5
 dW5dkL4YJ+C+beXl5wjTniCTJho/j2aMDc6XiHhXbwkZIoGngk+jK+ax80X+z/4+HXBbNmbTm9c
 RFJ61ZnMtHZaR0D7v/UgD4p/QvKTxxZ7jLXus5G+zUKGFkViWgYVMYotlPLuWdFawfF4OqdKKsh
 N+gZyIHKmZPItCr84M4jYrTk6PXbMCTYG6XSMFf73IDJqwhYS+MFaeptBjK2fYOaH7AzFw==
X-Received: by 2002:a05:6000:2dc7:b0:3a4:f63b:4bfc with SMTP id
 ffacd0b85a97d-3b5ddecd077mr1481774f8f.34.1751960486633; 
 Tue, 08 Jul 2025 00:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHKwN5Lwc27tEHIF5aJ6WHcaRkkSSXuH9pJCvcwVDvHm9RcjAo9sRHOQ2nnNwb8PyLplyMbg==
X-Received: by 2002:a05:6000:2dc7:b0:3a4:f63b:4bfc with SMTP id
 ffacd0b85a97d-3b5ddecd077mr1481734f8f.34.1751960486077; 
 Tue, 08 Jul 2025 00:41:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0959sm12199396f8f.27.2025.07.08.00.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 00:41:25 -0700 (PDT)
Message-ID: <b05cd1f5-db7a-45d3-a582-85c808adcd04@redhat.com>
Date: Tue, 8 Jul 2025 09:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/12] hw/arm/virt: Allow user-creatable SMMUv3 dev
 instantiation
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 gustavo.romero@linaro.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 linuxarm@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
 <20250703084643.85740-9-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250703084643.85740-9-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d4IiMkhZIusjqIB6aJFeI7jKelj8S6qwhfW7vhEawZE_1751960487
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 7/3/25 10:46 AM, Shameer Kolothum wrote:
> Allow cold-plugging of an SMMUv3 device on the virt machine when no
> global (legacy) SMMUv3 is present or when a virtio-iommu is specified.
>
> This user-created SMMUv3 device is tied to a specific PCI bus provided
> by the user, so ensure the IOMMU ops are configured accordingly.
>
> Due to current limitations in QEMU’s device tree support, specifically
> its inability to properly present pxb-pcie based root complexes and
> their devices, the device tree support for the new SMMUv3 device is
> limited to cases where it is attached to the default pcie.0 root complex.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmu-common.c         |  8 +++++-
>  hw/arm/smmuv3.c              |  2 ++
>  hw/arm/virt.c                | 50 ++++++++++++++++++++++++++++++++++++
>  hw/core/sysbus-fdt.c         |  3 +++
>  include/hw/arm/smmu-common.h |  1 +
>  5 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index b15e7fd0e4..2ee4691299 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -959,7 +959,12 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>                  goto out_err;
>              }
>          }
> -        pci_setup_iommu(pci_bus, &smmu_ops, s);
> +
> +        if (s->smmu_per_bus) {
> +            pci_setup_iommu_per_bus(pci_bus, &smmu_ops, s);
> +        } else {
> +            pci_setup_iommu(pci_bus, &smmu_ops, s);
> +        }
>          return;
>      }
>  out_err:
> @@ -984,6 +989,7 @@ static void smmu_base_reset_exit(Object *obj, ResetType type)
>  
>  static const Property smmu_dev_properties[] = {
>      DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
> +    DEFINE_PROP_BOOL("smmu_per_bus", SMMUState, smmu_per_bus, false),
>      DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
>                       TYPE_PCI_BUS, PCIBus *),
>  };
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
> index 05a14881cf..8662173c43 100644
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
> @@ -1440,6 +1441,28 @@ static void create_smmuv3_dt_bindings(const VirtMachineState *vms, hwaddr base,
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
while testing the series I hit the warning with a rhel guest which boots
with ACPI.
I think we shall make the check smarter to avoid that.
maybe also check firmware_loaded and virt_is_acpi_enabled()?

Cheers

Eric
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
> @@ -2935,6 +2958,16 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>          qlist_append_str(reserved_regions, resv_prop_str);
>          qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
>          g_free(resv_prop_str);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
> +        if (vms->legacy_smmuv3_present || vms->iommu == VIRT_IOMMU_VIRTIO) {
> +            error_setg(errp, "virt machine already has %s set. "
> +                       "Doesn't support incompatible iommus",
> +                       (vms->legacy_smmuv3_present) ?
> +                       "iommu=smmuv3" : "virtio-iommu");
> +        } else if (vms->iommu == VIRT_IOMMU_NONE) {
> +            /* The new SMMUv3 device is specific to the PCI bus */
> +            object_property_set_bool(OBJECT(dev), "smmu_per_bus", true, NULL);
> +        }
>      }
>  }
>  
> @@ -2958,6 +2991,22 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
> @@ -3160,6 +3209,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
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
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index e5e2d09294..80d0fecfde 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -161,6 +161,7 @@ struct SMMUState {
>      QLIST_HEAD(, SMMUDevice) devices_with_notifiers;
>      uint8_t bus_num;
>      PCIBus *primary_bus;
> +    bool smmu_per_bus; /* SMMU is specific to the primary_bus */
>  };
>  
>  struct SMMUBaseClass {


