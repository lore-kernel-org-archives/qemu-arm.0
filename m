Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA15D0D15D
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Jan 2026 18:34:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdYL6-0002fw-7J; Wed, 07 Jan 2026 13:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vdYL4-0002en-Kn
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 13:32:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vdYL2-0007tt-NF
 for qemu-arm@nongnu.org; Wed, 07 Jan 2026 13:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767810776;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2D0iu5X2TsQ8bI0HPUfBqH0crJV/1hKC+dYNuE05vYA=;
 b=O3FOTr/eLTkcNHAjhTdsxC20w7rE+VLtGgh5G7vXynib1MOerQ/73/B6nHGN9ye7CRBLcp
 OokZ/7D6CdGFUWtXKXVi+on6XnA07z6F34fjuDzUQlIrxIez6eJJnRQnWG/p2b2oBdh/Oo
 J26Boqny9RA8mQuImSnt9AqCCJe0SWU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-HvdWawFmMrSGZcbGKi1Tmw-1; Wed, 07 Jan 2026 13:32:52 -0500
X-MC-Unique: HvdWawFmMrSGZcbGKi1Tmw-1
X-Mimecast-MFC-AGG-ID: HvdWawFmMrSGZcbGKi1Tmw_1767810771
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4325aa61c6bso1592789f8f.0
 for <qemu-arm@nongnu.org>; Wed, 07 Jan 2026 10:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767810771; x=1768415571;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2D0iu5X2TsQ8bI0HPUfBqH0crJV/1hKC+dYNuE05vYA=;
 b=G8Ud214NduqHIxeROJ1F7TQxQ8F4l6vGCDISnEn48QwZ+6BXyQ1K5BmNKTKi5uRRNM
 wre2OtxFcfqzetHq/LIplqJEI7LsqDCjk3l7L2JMTx7bsIGZPbLIaDkYxgcXq+Nk1FJ0
 J3BbPsQXFaZz38YgzovleKGBWCawQvvSJSios/U1KZz3W1BwZnJtwb9Bz6dZaSJ+j3Bu
 ET1Y2b1+qJqjcCr82vJasHVi/kbmu8rvPiADKk5oNXfPNfO22rmRMDGvK+ry3pY8GCaO
 NL6jN8E2+UXGJDalVzrGwu7vaLsirI9mUQpVknKdZ4KAHFqBWPeEBB4jmEAI9KHAHK2j
 tJjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUarPxqaedj/AVmDkj8Oem0u2XGY8AoU6Wg1WJ+DjDTHz08nHWPBTUXtEaPEQ49HiWljv0RcjrESQ==@nongnu.org
X-Gm-Message-State: AOJu0YykkILc+icjU4A5Eel2dL/vGSA24AHOXE/yC7QdOWnoBytlsFxK
 t0+8/AXe89peDoxcJQcUgij/6q1TY/+cHv01IZfEjBQxY1OBX/LqF3exMr5JTyoLH9a0QoIQhE3
 eQA3ZyrMMGpXbvG3OtzPymZb0fNzNKrZCEzyr0/NWFAnvZZMetLEDbw==
X-Gm-Gg: AY/fxX5VX0Rf6fs88ro5kIuIUxMPz4eqtyAPfuFoGjXopRMpLkt4tDZrjy13wHwi61o
 g7Gh3t3jqOMvSPJSJjo0tN0NmL4JYeWZNht5njQURMbyKk918C/XJjBM1hRaZolliOcB9FLdaqw
 z+H0h/THwI+e9sT68Gr49F/AKNnJBW4Dsf0vXmhLaOhaUSxXdKlHrv2/pKhZKn5ncueqgTnlh9Q
 TkCc7S4bg9GWkfLChJ4m+YheOS/W9gyNlKM5dF9QTmPJNCc9n7qlJb1FO/DBO11xh0xfs2motK+
 o7Pw5Iu+CDeEDn+XdXNz38j8zSrhwEiP+cLCzg8GX7uiPU3V77qKcrwiMu8UgjwaM4GdD8qpycY
 4W/12aVqs8d4JTkJGlb7ob6Uvrof/rdrjJj16zB+QuVLDNlyCWZ4cA8fy8w==
X-Received: by 2002:a05:6000:2584:b0:432:8585:3416 with SMTP id
 ffacd0b85a97d-432c37614femr4813028f8f.45.1767810771223; 
 Wed, 07 Jan 2026 10:32:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEikRXlHWeqWitJ9wZIa1g8i7ED0aqSRh4gle2rrMA9cEG53hRLR0IP8zZYZ5nKVe7X5z53OA==
X-Received: by 2002:a05:6000:2584:b0:432:8585:3416 with SMTP id
 ffacd0b85a97d-432c37614femr4813005f8f.45.1767810770753; 
 Wed, 07 Jan 2026 10:32:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e17aasm12064616f8f.15.2026.01.07.10.32.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 10:32:50 -0800 (PST)
Message-ID: <16a8de8d-3054-4d7f-b4b1-1588aa54ee24@redhat.com>
Date: Wed, 7 Jan 2026 19:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hw/arm/smmu: add memory regions as property for an
 SMMU instance
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Radoslaw Biernacki <rad@semihalf.com>,
 tangtao1634@phytium.com.cn, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
References: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251216235731.1793908-1-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G9ImIXh3rfkwRhhE3ShSE5SHLjL0TGo0MdLcwlReqp0_1767810771
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Pierrick,

On 12/17/25 12:57 AM, Pierrick Bouvier wrote:
> This will be used to access non-secure and secure memory. Secure support
> and Granule Protection Check (for RME) for SMMU need to access secure
> memory.
>
> As well, it allows to remove usage of global address_space_memory,
> allowing different SMMU instances to have a specific view of memory.
>
> User creatable SMMU are handled as well for virt machine,
> by setting the memory properties when device is plugged in.

Will Tao's [RFC v3 08/21] hw/arm/smmuv3: Add separate address space for
secure SMMU accesses
be rebased on top of that. How does it cooperate?

Thanks

Eric
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  include/hw/arm/smmu-common.h |  4 ++++
>  include/hw/arm/virt.h        |  2 ++
>  hw/arm/sbsa-ref.c            | 16 ++++++++++++----
>  hw/arm/smmu-common.c         | 25 +++++++++++++++++++++++++
>  hw/arm/virt.c                | 13 +++++++++++--
>  5 files changed, 54 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index 80d0fecfde8..d9bade3c803 100644
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
> index c77a33f6df2..d3743810338 100644
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
> index 2205500a8da..cc9d4385826 100644
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
> index 62a76121841..9a67ce857fe 100644
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
> @@ -1008,10 +1015,28 @@ static void smmu_base_class_init(ObjectClass *klass, const void *data)
>      rc->phases.exit = smmu_base_reset_exit;
>  }
>  
> +static void smmu_base_instance_init(Object *obj)
> +{
> +    SMMUState *s = ARM_SMMU(obj);
> +
> +    object_property_add_link(obj, "memory",
> +                             TYPE_MEMORY_REGION,
> +                             (Object **)&s->memory,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_STRONG);
> +
> +    object_property_add_link(obj, "secure-memory",
> +                             TYPE_MEMORY_REGION,
> +                             (Object **)&s->secure_memory,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_STRONG);
> +}
> +
>  static const TypeInfo smmu_base_info = {
>      .name          = TYPE_ARM_SMMU,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(SMMUState),
> +    .instance_init = smmu_base_instance_init,
>      .class_data    = NULL,
>      .class_size    = sizeof(SMMUBaseClass),
>      .class_init    = smmu_base_class_init,
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 25fb2bab568..603f4b6a1d7 100644
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


