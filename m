Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A7CD13C36
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 15:29:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkOW2-0007zj-LJ; Mon, 26 Jan 2026 10:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkOVz-0007z2-S6
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 10:28:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkOVx-00070p-Si
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 10:28:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769441308;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzDzvuPvW1G0bkBw/ciRlSexYLiJnj3YSr7fDaVt/Jc=;
 b=VrusRYSIBaAcwZgXNTNbptU44dvQfVKbYn0MoXkq5tkmA/7JICZkqIOVnHOUqM1RpLJfTd
 0pUCQwT60kEFwx4ijpzzq46xNIPn0W0qixm6dgVDAERg64CLASi0m+oFlQoRSi+dN+yvbe
 ZqFUF4MK6R7Qm8gqvZ6658K5aqzhQFw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-wWkADqRMNQ2ocN-mYVbglg-1; Mon, 26 Jan 2026 10:28:27 -0500
X-MC-Unique: wWkADqRMNQ2ocN-mYVbglg-1
X-Mimecast-MFC-AGG-ID: wWkADqRMNQ2ocN-mYVbglg_1769441306
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-432db1a9589so3575838f8f.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 07:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769441306; x=1770046106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HzDzvuPvW1G0bkBw/ciRlSexYLiJnj3YSr7fDaVt/Jc=;
 b=Wl8DHTEMUhQTV5Ft84yeYq8YDPC+XQJM4SRwO9VLD4YxOFNvGvRH7ZZf5F7cvRJZFs
 Djb6ZCaaRM9L+VxOuo6LmvqZq0Bw2HRAIsgamULdygRhDfHUxipraaQJH4VZRVWf0Z+s
 l/wbznTVcKluzeFBYOQ9Pqa1iV1JeAlKJsClWpNqBmQ9pOCfu0Frqvf5S/PjfYG4DQOi
 zi+SK5hfykWinryHpFwiQAdtr3eWZDYXGgZcib9mkhjwaAy66xcPoY6aHFCGLOEBC0IL
 3AtR83dz+7qNR8rnnwPOqLGAASBsAC2DXklIaJ5cEHUpCNFF0/jwyKJIzDfTyv7mp7oi
 PjtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxuvzwqKEVGiLszoe2bePQLT3Z+oX1380TXv85q0MMVHZR76riYCbg5W5akCd5i8tOgOVdnCtRrw==@nongnu.org
X-Gm-Message-State: AOJu0YzsrV02J2C2sYuCmrETF9/96203M6pGaN4IvU5l8fvx0rXU+dJW
 wpW7Y3O5e9GhATrHUWziWu4CMfEEFbcewnGwqz6RU5cb3WpzZDJvfOfsbc0tmrGZd0J4/raDCPt
 xB85W6K1ipRTeEAPMp5mTK9gAPl8I8iUJ/IePZcTDFJkJRxOmV9VhhA==
X-Gm-Gg: AZuq6aILvEx7VLs4OyK8T6lEckKkr+iLineMFxovi6eEo2vDALjrbQwYWLUYxZ0C+se
 fVrV7t47W5llsm/lak2UJOdlCzVWp2E19t7gpabDjTy1xKfjCCuJDpuH7r+mElV0fJMd9dUcj6N
 01i/yGHnPAhGRiiw1Zcb+d3X6KzyLM/KsRTfZf0OhV5Z05soI0KWyPXgAxiLN1g0ogPM7O82pN/
 B5Dy643L8YF/k8o6QP9zhXnFUKpy7Spqs3s8FenxHBYWOXl1xhxbdFgwB2rU/lsTD/BZX8yb+Ro
 vquWesBx7kahfBHuq6pZjVtj93S1liNTrqRS/RrE9enuwLW8gJWa2CDeAxlEK73hMaLZ2SZfUPb
 viPc6zeeYKzgX4UDc+cwg0zNZIQUw4Biofc3AcnXgtcVg2wPq8PbLLhtAnQ==
X-Received: by 2002:a5d:64c6:0:b0:431:3ba:1188 with SMTP id
 ffacd0b85a97d-435ca125affmr7952012f8f.3.1769441306341; 
 Mon, 26 Jan 2026 07:28:26 -0800 (PST)
X-Received: by 2002:a5d:64c6:0:b0:431:3ba:1188 with SMTP id
 ffacd0b85a97d-435ca125affmr7951962f8f.3.1769441305819; 
 Mon, 26 Jan 2026 07:28:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1e7156dsm31701881f8f.20.2026.01.26.07.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 07:28:25 -0800 (PST)
Message-ID: <053a0274-653e-43d3-8803-f9a97d70166c@redhat.com>
Date: Mon, 26 Jan 2026 16:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 15/16] hw/arm/virt-acpi: Advertise Tegra241 CMDQV
 nodes in DSDT
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251210133737.78257-1-skolothumtho@nvidia.com>
 <20251210133737.78257-16-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251210133737.78257-16-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: moTSSFdBq__frI36bffH532VLsIsBkUyWqa19GF2nFQ_1769441306
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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



On 12/10/25 2:37 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add ACPI DSDT support for Tegra241 CMDQV when the SMMUv3 instance is
> created with tegra241-cmdqv=on.

Pls can you give a point to the DSDT spec to understand why this is
needed and what needs to be added.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/trace-events      |  1 +
>  hw/arm/virt-acpi-build.c | 74 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h    |  2 ++
>  3 files changed, 77 insertions(+)
>
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index ef495c040c..e7e3ccfe9f 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -9,6 +9,7 @@ omap1_lpg_led(const char *onoff) "omap1 LPG: LED is %s"
>  
>  # virt-acpi-build.c
>  virt_acpi_setup(void) "No fw cfg or ACPI disabled. Bailing out."
> +virt_acpi_dsdt_tegra241_cmdqv(int smmu_id, uint64_t base, uint32_t irq) "DSDT: add cmdqv node for (id=%d), base=0x%" PRIx64 ", irq=%d"
>  
>  # smmu-common.c
>  smmu_add_mr(const char *name) "%s"
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4f8d36dae0..11494b29ad 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -1115,6 +1115,78 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
>      build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
>  }
>  
> +static int smmuv3_cmdqv_devices(Object *obj, void *opaque)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
> +    GArray *sdev_blob = opaque;
> +    PlatformBusDevice *pbus;
> +    AcpiSMMUv3Dev sdev;
> +    SysBusDevice *sbdev;
> +
> +    if (!object_dynamic_cast(obj, TYPE_ARM_SMMUV3)) {
> +        return 0;
> +    }
> +
> +    if (!object_property_get_bool(obj, "tegra241-cmdqv", NULL)) {
> +        return 0;
> +    }
> +
> +    pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    sbdev = SYS_BUS_DEVICE(obj);
> +    sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 1);
> +    sdev.base += vms->memmap[VIRT_PLATFORM_BUS].base;
> +    sdev.irq = platform_bus_get_irqn(pbus, sbdev, NUM_SMMU_IRQS);
> +    sdev.irq += vms->irqmap[VIRT_PLATFORM_BUS];
> +    sdev.irq += ARM_SPI_BASE;
> +    g_array_append_val(sdev_blob, sdev);
> +    return 0;
> +}
> +
> +static void acpi_dsdt_add_tegra241_cmdqv(Aml *scope, VirtMachineState *vms)
> +{
> +    GArray *smmuv3_devs = g_array_new(false, true, sizeof(AcpiSMMUv3Dev));
> +    int i;
> +
> +    if (vms->legacy_smmuv3_present) {
> +        return;
> +    }
> +
> +    object_child_foreach_recursive(object_get_root(), smmuv3_cmdqv_devices,
> +                                   smmuv3_devs);
> +
> +    for (i = 0; i < smmuv3_devs->len; i++) {
> +        uint32_t identifier = i;
> +        AcpiSMMUv3Dev *sdev;
> +        Aml *dev, *crs, *addr;
> +
> +        sdev = &g_array_index(smmuv3_devs, AcpiSMMUv3Dev, i);
> +
> +        dev = aml_device("CV%.02u", identifier);
> +        aml_append(dev, aml_name_decl("_HID", aml_string("NVDA200C")));
> +        if (vms->its) {
> +            identifier++;
> +        }
> +        aml_append(dev, aml_name_decl("_UID", aml_int(identifier)));
> +        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
> +
> +        crs = aml_resource_template();
> +        addr = aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
> +                                AML_CACHEABLE, AML_READ_WRITE, 0x0, sdev->base,
> +                                sdev->base + TEGRA241_CMDQV_IO_LEN - 0x1, 0x0,
> +                                TEGRA241_CMDQV_IO_LEN);
> +        aml_append(crs, addr);
> +        aml_append(crs, aml_interrupt(AML_CONSUMER, AML_EDGE,
> +                                      AML_ACTIVE_HIGH, AML_EXCLUSIVE,
> +                                      (uint32_t *)&sdev->irq, 1));
> +        aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +        aml_append(scope, dev);
> +
> +        trace_virt_acpi_dsdt_tegra241_cmdqv(identifier, sdev->base, sdev->irq);
> +    }
> +    g_array_free(smmuv3_devs, true);
> +}
> +
>  /* DSDT */
>  static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -1179,6 +1251,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_tpm(scope, vms);
>  #endif
>  
> +    acpi_dsdt_add_tegra241_cmdqv(scope, vms);
> +
>      aml_append(dsdt, scope);
>  
>      pci0_scope = aml_scope("\\_SB.PCI0");
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index efbc1758c5..842143cc85 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -46,6 +46,8 @@
>  #define NUM_VIRTIO_TRANSPORTS 32
>  #define NUM_SMMU_IRQS          4
>  
> +#define TEGRA241_CMDQV_IO_LEN 0x50000
isn't it already defined elsewhere, use the corresponding include?

Eric
> +
>  /* See Linux kernel arch/arm64/include/asm/pvclock-abi.h */
>  #define PVTIME_SIZE_PER_CPU 64
>  


