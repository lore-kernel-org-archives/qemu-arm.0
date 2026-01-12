Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A32D26D97
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 09:58:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfEgp-0001gl-FD; Mon, 12 Jan 2026 04:58:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfEgo-0001g8-9n
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 04:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vfEgm-0004qJ-EE
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 04:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768211899;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t91xoUVOsOYp9feQTxhCHRsm8L9Qe52PaMmkJm5UaD4=;
 b=DIUFBvjFJjB6JrBDPHC+RrMMu3DWguGelTwoARYxsltzDW7WZxDKe1wg2BTwweU8ZR9seR
 cFcZTAM5vw5Fqd9SHDk4RXtQbDDjGVP3uEXztpuR8FWKRUTU1LntWiRWq0wTQ1LZ3jj2Dp
 M2BQgLimOA1V1cnwsvE4yfMGcccqXjs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-8loUmSYZOT2-1jn2TDDPyw-1; Mon, 12 Jan 2026 04:58:15 -0500
X-MC-Unique: 8loUmSYZOT2-1jn2TDDPyw-1
X-Mimecast-MFC-AGG-ID: 8loUmSYZOT2-1jn2TDDPyw_1768211894
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47d5c7a2f5dso54703325e9.2
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 01:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768211894; x=1768816694;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t91xoUVOsOYp9feQTxhCHRsm8L9Qe52PaMmkJm5UaD4=;
 b=h7zFBtYUqF5HeK7bQYDMzn5ntXTLD583QknwS39xcYrcsJvHUsJ3X8zUf92dTv4bOi
 +tDaFnQLQVDR7k4XcHsXhq7KsC+NtIr3ncC/qiSJXjbC6IO7r+WGSLJGq1eKBR6vicU5
 GMVkNCCK3VTiaT7L2xUrOWcEzdzOqRXL0YFjiTZjPFcujBZ1W6Vl4ockREEyI5V+pwAR
 6BhkAVN28nqlQqmVNqXnLRFH10NpDmoO021wHBTMxjFFSqPrszy7hIIiKdkZnGe/5DYF
 GWP0wlOFA5Uo0LZ2Q1PkQNBoj2tT1KoN5LgCPo+pyz/BnAPxoWcWSiUTHaxM/xsNgp0K
 q1dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrgh4qdmsBk0tKJNcr8AqIvxzr/Pr2flmKR9tizJ1QSwx7gDKT5alALc+kNpXbDdjNvmfSOXvUTA==@nongnu.org
X-Gm-Message-State: AOJu0YyxwQWPTBMrojV72lgdlELJ8SfGLu8uD6pWtzOJvVg3SySvKGnm
 cg1Uz+h/h/L+gzkVFV1cTeySNZdHVMr4pZjf2yVw6d98tsvk4XHxUVtZRhCf7rbpKwNd4gsHoEz
 V4LRg7RgyPuc/jSYxgowFxOOTNb848Rd+amKJyyWssJ1TBKCKiTdMJA==
X-Gm-Gg: AY/fxX5TBZcyLJtiITuQVwL1EPtcQqgywuXQvfqGSqaduu6TuYeNTGfY2/fgpLq7llC
 c7ZbIbVxsVAPKs2dhL/9h1p2ykZ+Mat/MhlGH8PaVQQU0GWcIEsX/B7wm9r9CMsFAo1v0BP2RLQ
 04awRqPy18W/hv4u+KfvfwbSVYH9InNrGA1igIzACC2ePKOF+7n/0xdnGjjojYiI1QSG7FHR2ic
 Qa+ZFmr6moxhtEozpIRhzQ2dE62XLijufF/i31LUKiDji04V9Ootz4wlmlmUJxUv5X3xEwiClcg
 5DjSfQTJxiehejBRSygB8E6j3uMGWx1dE+LOq/PH0+94Td2DMGdoW4iYUhzUh+zd7pK1c3UVU8T
 efyfJzYJg0ItdiWVhGTfQcY0Xghv0N+Pir+tCe9/knqfq4k39KbFAueqcDw==
X-Received: by 2002:a05:600c:a48:b0:477:9eb8:97d2 with SMTP id
 5b1f17b1804b1-47d84b08652mr202330525e9.8.1768211894404; 
 Mon, 12 Jan 2026 01:58:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9fPhh8v4ZYoNoq7m1o4wjGB5opSXOSPQ5eAjNTaUYhi4rdNcm0d+6BkUrej6iIXKXSQ/HyA==
X-Received: by 2002:a05:600c:a48:b0:477:9eb8:97d2 with SMTP id
 5b1f17b1804b1-47d84b08652mr202330235e9.8.1768211893936; 
 Mon, 12 Jan 2026 01:58:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e6784sm38332100f8f.19.2026.01.12.01.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 01:58:13 -0800 (PST)
Message-ID: <08c42104-d7c5-4df8-b25f-7138ddc94a94@redhat.com>
Date: Mon, 12 Jan 2026 10:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] hw/arm/smmu: add memory regions as property for an
 SMMU instance
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 tangtao1634@phytium.com.cn, richard.henderson@linaro.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260108210453.2280733-1-pierrick.bouvier@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260108210453.2280733-1-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5RXrRs6rRFEyqrnUd2qLGZQG6HO0R4BGmEKK2qHuItA_1768211894
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 1/8/26 10:04 PM, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
>
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
>
> User creatable SMMU are handled as well for virt machine,
> by setting the memory properties when device is plugged in.
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  include/hw/arm/smmu-common.h |  4 ++++
>  include/hw/arm/virt.h        |  2 ++
>  hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>  hw/arm/smmu-common.c         | 11 +++++++++++
>  hw/arm/virt.c                | 13 +++++++++++--
>  5 files changed, 40 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 48368c8e894..b49b2f27fa9 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -162,6 +162,10 @@ struct SMMUState {
>      uint8_t bus_num;
>      PCIBus *primary_bus;
>      bool smmu_per_bus; /* SMMU is specific to the primary_bus */
> +    MemoryRegion *memory;
> +    AddressSpace memory_as;
> +    MemoryRegion *secure_memory;
> +    AddressSpace secure_memory_as;
>  };
>  
>  struct SMMUBaseClass {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 8694aaa4e2a..5907d41dbb2 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -180,6 +180,8 @@ struct VirtMachineState {
>      bool ns_el2_virt_timer_irq;
>      CXLState cxl_devices_state;
>      bool legacy_smmuv3_present;
> +    MemoryRegion *sysmem;
> +    MemoryRegion *secure_sysmem;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index d86b4706869..52c35e10c2d 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -613,7 +613,9 @@ static void create_xhci(const SBSAMachineState *sms)
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, qdev_get_gpio_in(sms->gic, irq));
>  }
>  
> -static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
> +static void create_smmu(const SBSAMachineState *sms, PCIBus *bus,
> +                        MemoryRegion *sysmem,
> +                        MemoryRegion *secure_sysmem)
>  {
>      hwaddr base = sbsa_ref_memmap[SBSA_SMMU].base;
>      int irq =  sbsa_ref_irqmap[SBSA_SMMU];
> @@ -625,6 +627,10 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>      object_property_set_str(OBJECT(dev), "stage", "nested", &error_abort);
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);
> +    object_property_set_link(OBJECT(dev), "memory", OBJECT(sysmem),
> +                             &error_abort);
> +    object_property_set_link(OBJECT(dev), "secure-memory", OBJECT(secure_sysmem),
> +                             &error_abort);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
> @@ -633,7 +639,9 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
>      }
>  }
>  
> -static void create_pcie(SBSAMachineState *sms)
> +static void create_pcie(SBSAMachineState *sms,
> +                        MemoryRegion *sysmem,
> +                        MemoryRegion *secure_sysmem)
>  {
>      hwaddr base_ecam = sbsa_ref_memmap[SBSA_PCIE_ECAM].base;
>      hwaddr size_ecam = sbsa_ref_memmap[SBSA_PCIE_ECAM].size;
> @@ -689,7 +697,7 @@ static void create_pcie(SBSAMachineState *sms)
>  
>      pci_create_simple(pci->bus, -1, "bochs-display");
>  
> -    create_smmu(sms, pci->bus);
> +    create_smmu(sms, pci->bus, sysmem, secure_sysmem);
>  }
>  
>  static void *sbsa_ref_dtb(const struct arm_boot_info *binfo, int *fdt_size)
> @@ -825,7 +833,7 @@ static void sbsa_ref_init(MachineState *machine)
>  
>      create_xhci(sms);
>  
> -    create_pcie(sms);
> +    create_pcie(sms, sysmem, secure_sysmem);
>  
>      create_secure_ec(secure_sysmem);
>  
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index e1b77cc55fc..cdcfb1343da 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -944,6 +944,13 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    g_assert(s->memory);
> +    address_space_init(&s->memory_as, s->memory, "smmu-memory-view");
> +    if (s->secure_memory) {
> +        address_space_init(&s->secure_memory_as, s->secure_memory,
> +                           "smmu-secure-memory-view");
> +    }
> +
>      /*
>       * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
>       * root complexes to be associated with SMMU.
> @@ -994,6 +1001,10 @@ static const Property smmu_dev_properties[] = {
>      DEFINE_PROP_BOOL("smmu_per_bus", SMMUState, smmu_per_bus, false),
>      DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
>                       TYPE_PCI_BUS, PCIBus *),
> +    DEFINE_PROP_LINK("memory", SMMUState, memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_LINK("secure-memory", SMMUState, secure_memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>  };
>  
>  static void smmu_base_class_init(ObjectClass *klass, const void *data)
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9d0568a7d56..4badc1a7348 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1514,8 +1514,7 @@ static void create_smmuv3_dev_dtb(VirtMachineState *vms,
>                             0x0, vms->iommu_phandle, 0x0, 0x10000);
>  }
>  
> -static void create_smmu(const VirtMachineState *vms,
> -                        PCIBus *bus)
> +static void create_smmu(const VirtMachineState *vms, PCIBus *bus)
>  {
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      int irq =  vms->irqmap[VIRT_SMMU];
> @@ -1535,6 +1534,10 @@ static void create_smmu(const VirtMachineState *vms,
>      }
>      object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>                               &error_abort);
> +    object_property_set_link(OBJECT(dev), "memory", OBJECT(vms->sysmem),
> +                             &error_abort);
> +    object_property_set_link(OBJECT(dev), "secure-memory", OBJECT(vms->secure_sysmem),
> +                             &error_abort);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
> @@ -1609,6 +1612,7 @@ static void create_pcie(VirtMachineState *vms)
>      memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
>                               ecam_reg, 0, size_ecam);
>      memory_region_add_subregion(get_system_memory(), base_ecam, ecam_alias);
> +    vms->sysmem = get_system_memory();
>  
>      /* Map the MMIO window into system address space so as to expose
>       * the section of PCI MMIO space which starts at the same base address
> @@ -2256,6 +2260,7 @@ static void machvirt_init(MachineState *machine)
>           * devices go in at higher priority and take precedence.
>           */
>          secure_sysmem = g_new(MemoryRegion, 1);
> +        vms->secure_sysmem = secure_sysmem;
>          memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
>                             UINT64_MAX);
>          memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
> @@ -3051,6 +3056,10 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>          } else if (vms->iommu == VIRT_IOMMU_NONE) {
>              /* The new SMMUv3 device is specific to the PCI bus */
>              object_property_set_bool(OBJECT(dev), "smmu_per_bus", true, NULL);
> +            object_property_set_link(OBJECT(dev), "memory",
> +                                     OBJECT(vms->sysmem), NULL);
> +            object_property_set_link(OBJECT(dev), "secure-memory",
> +                                     OBJECT(vms->secure_sysmem), NULL);
>          }
>      }
>  }


