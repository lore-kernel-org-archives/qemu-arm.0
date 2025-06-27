Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp851504dye;
        Fri, 27 Jun 2025 05:06:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbYYBBvmhyMf/Dg63ok/GZqFntD+EWCFJeeePzbq2bpY1HKwI39TBzOPHtu3bhFpGPedqU4R3abB87UA==@linaro.org
X-Google-Smtp-Source: AGHT+IEv99bHWwlkYnuzcc2t5lPAShdtqhyvlNV+otRyf1i7hhYF8HANoSD+pfrusH92xfBszNTw
X-Received: by 2002:a05:622a:a12:b0:490:8ffd:9a90 with SMTP id d75a77b69052e-4a7fcb128ebmr48427791cf.45.1751025989641;
        Fri, 27 Jun 2025 05:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751025989; cv=none;
        d=google.com; s=arc-20240605;
        b=CA88u+iWBn4HvdlZVPhcBhtWzmMetuFjNRezX9Kbbe9Hoc+MORfeM3GSfpcc2IZ21I
         uVwRgklxPy2dZsSszMPSsmIbM/IZbMHtVpUkAWdwwau1bxBHQZnxtEvRG8g+EVYGSFIs
         jjl93vzBBwPMAqgc0e4hOCa3GIHYrdig6Le6S1ALj4RARocssoToSMO6JAMlpReKx+0E
         /DQ/213iNJ4k++lAMJhJ90xhXGuT0TEXYVUA9cPtc6PgIHwql/l/vHv4CO9yHwqZULWz
         FEIMsuXD28Voh2HbxVFsRdzjLEv36lStW/wgB1k4N4SHND00oWrQynR1Igo8ffVr5++z
         BsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lek3TYxnGDlmuZNyXK2WeUfq2rrSXm5nt8GyGI53kDQ=;
        fh=7f3FrPMZKJS8cYmXLag4sxWWfoo3ouEK2fNSvBmSj7A=;
        b=djuW5Ro02FxnbA+6CiqLGCqwt94i+jMzfsfPYDiBIBzqG+lmQQWjJ3UhMHVLVrkUYo
         aZnSzwpjx64/J5xfJBE8BJS8c/sW2SKx7V/49KDa1Q560LH3X/w7WTWt0hBCVze9z54+
         8kXlqFY+tI0FM9ITeEWLkXKkJKe1LiCuPtqPMlbdkhVzSjnBb2UuHqW1Av8KY1zRaJVK
         f+X43HgdCSaErW2h6Q29AaSd0E7wJyurre9HYXXFn3WohjR1egOaPBCzBPZQkv04SzFR
         lpwFjd5qiCNiz5eANOuK3EobNL+THfbdztLv2dYT/uic54WccA6OY/WJDgAslV9ranZJ
         OpNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dl4DIh9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0fee6fsi20856261cf.96.2025.06.27.05.06.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jun 2025 05:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dl4DIh9i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uV7qT-0007vY-Mm; Fri, 27 Jun 2025 08:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uV7pv-0007qW-E6
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 08:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uV7pp-0001xX-3G
 for qemu-arm@nongnu.org; Fri, 27 Jun 2025 08:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751025933;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lek3TYxnGDlmuZNyXK2WeUfq2rrSXm5nt8GyGI53kDQ=;
 b=Dl4DIh9irpzsGvKgGBGj1hAEiMn/iMazAdgRB+PSFPDpgTJdV3IvZpNOIm//ahf9KcOeae
 ConFqUFJzTdZ1188NomdFd9kRXqpTuu/x2Yazt1bxNHN0P/XlP0y9aFHtJvU5Nf+q3teIO
 CcsoJ4m5sBgULgUSMj6TWEkyt7cexXQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-HIq6rlxrPd27-1zhceMb8A-1; Fri, 27 Jun 2025 08:05:32 -0400
X-MC-Unique: HIq6rlxrPd27-1zhceMb8A-1
X-Mimecast-MFC-AGG-ID: HIq6rlxrPd27-1zhceMb8A_1751025931
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45311704d22so13185105e9.2
 for <qemu-arm@nongnu.org>; Fri, 27 Jun 2025 05:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751025931; x=1751630731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lek3TYxnGDlmuZNyXK2WeUfq2rrSXm5nt8GyGI53kDQ=;
 b=INhOZgkg3KO6daPFFOxjgm0FlpAPPdN8VWZMUie+5/y8P9PGSQcOSSDB9rN9Yp/Np/
 RVxfm7gwR3T/9hSTt1sXR7MBtFxanyfc3QniljhrgjBid87nhkEunHaImHETzsePzb5f
 Mw59/GndsfrlPG9a4BrF8ZKw4o5tP0VBOYs6tB8kIGmBZh/Cttn63w1WadWdxPYT83u9
 UG08Bi4imWCEtSR7TiAiEeYO0JFb0f4MXJtj97CY/Gues5XCTv9O1t76Jp3ILuldISbF
 NXJwLr4uka05jVEKghx5idXvvpAKbBNJnGNsEKlBWbcAHkNPwaLH49nIQgNNYKxpzOPv
 Qfjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO1X4pbedsWmm3yXW7dB9uNiEA50qiNbhPmv6u0ukrcD/9kkuGY40Vsn7fahkC/2s+KiZeouOI1A==@nongnu.org
X-Gm-Message-State: AOJu0Yw+Jz0da5C2GCQEUvadzQyiCf1g1rrIdhV499aX2T4IQ/4pDeX2
 ITiUsc2AlTgCvI1vgLlcPc23pk5fq1J9kslWyWotWviyXnjN816JUvqBTfFiZTgaTassr9X+S6D
 FA7nNUi/rmZyIftemQi0qE+uXRe3wlX/qccXILcaBW0ax167SfV4ryQ==
X-Gm-Gg: ASbGncuYhMIimUWtOqEwHVUggkTm+26CmDYsmZbGgnITs7JboOrh+su4oEJf+tdYpdk
 i/JmgxvNSZqQk8liBwZbQrzQ4c+t994ZnW3DtBxknF9Q1/mrF/h/rKkqvG1CuUprad11abBj/DH
 zJqRuI3EbPktYTWNKEi3heprAOplILor4HO0aW09nbjsrM7wn+kVzT6bq1qVCOdgZhi5oq+0Ei8
 BG3pOKedpDuFGi/j5YmvIosSuqKtjQt6Z26wdpCX9XysitC29c4aHO3fuzmvD+j48nVCvjgYuPa
 39Rbek27bxM158SPvdmXJLJTZdHgFFVVHNSEMYVB1DpE5lzk5g6rbyn2w6Ew9w9NfzS4pA==
X-Received: by 2002:a05:600c:5298:b0:440:68db:9fef with SMTP id
 5b1f17b1804b1-4538ee61e72mr25053185e9.20.1751025930866; 
 Fri, 27 Jun 2025 05:05:30 -0700 (PDT)
X-Received: by 2002:a05:600c:5298:b0:440:68db:9fef with SMTP id
 5b1f17b1804b1-4538ee61e72mr25051415e9.20.1751025928667; 
 Fri, 27 Jun 2025 05:05:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453822c6b9fsm78820695e9.0.2025.06.27.05.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 05:05:27 -0700 (PDT)
Message-ID: <07d8f93a-d366-4c51-b585-242bc8aed683@redhat.com>
Date: Fri, 27 Jun 2025 14:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] hw/arm/virt: Allow user-creatable SMMUv3 dev
 instantiation
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 gustavo.romero@linaro.org, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-8-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623094230.76084-8-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PdaOmXdhW9v20GQR9eI8Q-tKcqo5IVFb4sv1vcSFnGI_1751025931
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wr/12iuO9qTt



On 6/23/25 11:42 AM, Shameer Kolothum wrote:
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
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
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
> index ae30320c38..e52347634f 100644
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
> @@ -2932,6 +2955,16 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
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
> @@ -2955,6 +2988,22 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
> @@ -3157,6 +3206,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
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

