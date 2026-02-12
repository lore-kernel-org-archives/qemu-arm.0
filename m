Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27E8EEA845
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 19:10:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqc52-0006tG-Ew; Thu, 12 Feb 2026 14:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqc51-0006sn-El
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 14:10:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqc4z-0007ub-9G
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 14:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770923419;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1zYFmLS1aUHuGRVXmgf6THOuV7zOuTW85hBywRILGk=;
 b=VuScMPxzGBiOaoNdgk9prd4zC3+NpXXrPYAp5lI1Q6FUjCMKRvQDOTJEydv4HKU4zdarjr
 mCNf4GwyiEBQ8A1qtVwebf+bSxoAC2FAVS8PpUzteITdqfCmoQKivfkTTQeW6D4DdjQ3kG
 1A7IbdvJGY+mX73ii2AQwkOtqRkyWwI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-AnkiiZ82Ppu8vOvazdlLpA-1; Thu, 12 Feb 2026 14:10:17 -0500
X-MC-Unique: AnkiiZ82Ppu8vOvazdlLpA-1
X-Mimecast-MFC-AGG-ID: AnkiiZ82Ppu8vOvazdlLpA_1770923416
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4836c819456so1237865e9.3
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 11:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770923416; x=1771528216;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e1zYFmLS1aUHuGRVXmgf6THOuV7zOuTW85hBywRILGk=;
 b=frWSGMqABZxHjd5Ls65DvF+08Ott974lHbJK5xO5zqTq4HQc4T5AmaVnx6u+LbCKq0
 YHE5CzkvGBNWDCW+wdLV+mYGQdrMEn/3/7FbgW2ljN5DMHubED6CIcVn8fyXTva+7C61
 EKHtsl9suQaxRkIn+T7LA7ULO6UDzLw3f2wGRnBO/BT5pk9q1zaX6/Pd2ktfKZ3uRjc8
 /rmOpmF5kIVytNSGqmAHFpFVBQJ8X4RT8o4nfGIFHLaPK/Kmvu8Hr9lwClZvZhN7c/wt
 oPo1FLG7lcXJknO1pn56uo3e9/Ki9X8aueT+w+P/3ZMQfMtFfpgM46mKvcCdgSLwOFYo
 d1+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXP3rS6efhKMzfzwzsHTjv4vRG5+kO4M20ottt9XyWvsnOqXngbPGOERcEn813MgCSFnG+Fr58Og==@nongnu.org
X-Gm-Message-State: AOJu0Yxzqj9Wvvxx/jMQ1FX5dg2Dlkm22DyX2QJSX6ygYimugSmkox0/
 lYHHC6hINin4iYccGmVI8DuVap21PtGOdCUTn+W0Wcxp0syZrWbNBpoGVo+I4MtxjCAxQVedFY9
 Nt4GP6r7NMK1pX9hHQaISuoyQd6s4UcIPaxdZQ9wR9wXEBvzHn21FpQ==
X-Gm-Gg: AZuq6aLEQSayMFQf3HLIi0Xc4EvwXO76bMyd7oOr23tylPCcNTjZZ9OWSoD46G4f7Yf
 wvJ85jzoYZo1v+xrmoWwRgFFQeIGCvI6slZtXpXSXUZo3ljgO+rhVPORDQSxCGSVHJdaABXVvbG
 SSfXUAsb8EPyZ48ri/fA+F8DwISRBUdURLQIwMHO/56zT3v6LM8L+IEU0Lm0SkReX0c8cqyhBA5
 MLsGGw+Skyg8tD9dKtAELpjf2tr5gvA7KZ6jKk9OeZpoRAqTYgsc2wHLh2jIYj0YLkMfPUUQtWh
 r8XExwm/tuYoV7ag2NhuAXypRdsAzhBEjnZ/jANq/L4qwWOGUQDeH882tSy5xm2aiHGNihB2fcN
 lMjy2NXU/FfskZQoYlBhmaAIxNaHN7LKbBIig6xWwiz+IVYs4/Xy+kvxhWz1s/TTWignnnA==
X-Received: by 2002:a05:600c:4e8e:b0:477:a21c:2066 with SMTP id
 5b1f17b1804b1-48371043b42mr2649375e9.5.1770923416411; 
 Thu, 12 Feb 2026 11:10:16 -0800 (PST)
X-Received: by 2002:a05:600c:4e8e:b0:477:a21c:2066 with SMTP id
 5b1f17b1804b1-48371043b42mr2648855e9.5.1770923415938; 
 Thu, 12 Feb 2026 11:10:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d99e194sm108878625e9.8.2026.02.12.11.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 11:10:15 -0800 (PST)
Message-ID: <b627633a-db93-41a1-ab7c-befef619c51b@redhat.com>
Date: Thu, 12 Feb 2026 20:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/24] hw/arm/virt-acpi: Advertise Tegra241 CMDQV nodes
 in DSDT
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-24-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260206144823.80655-24-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oJWEjKEpF5WVqr6RNYR1a2e6zuLvj7xRD3bXFudx9f8_1770923416
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/6/26 3:48 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Add ACPI DSDT support for Tegra241 CMDQV when the SMMUv3 instance is
> created with tegra241-cmdqv.
>
> The SMMUv3 device identifier is used as the ACPI _UID. This matches
> the Identifier field of the corresponding SMMUv3 IORT node, allowing
> the CMDQV DSDT device to be correctly associated with its SMMU.
>
> Because virt-acpi-build.c now includes CONFIG_DEVICES via the Tegra241
> CMDQV header, the Meson file entry is updated to build it as part of
> arm_ss instead of arm_common_ss
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/meson.build       |  2 +-
>  hw/arm/trace-events      |  1 +
>  hw/arm/virt-acpi-build.c | 73 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 75 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 4ec91db50a..af0b516df1 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -1,7 +1,7 @@
>  arm_ss = ss.source_set()
>  arm_common_ss = ss.source_set()
>  arm_common_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
> -arm_common_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
> +arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
>  arm_common_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
>  arm_common_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
>  arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
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
> index 046e930ca5..fe2925baaf 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -65,6 +65,8 @@
>  #include "target/arm/cpu.h"
>  #include "target/arm/multiprocessing.h"
>  
> +#include "tegra241-cmdqv.h"
> +
>  #define ARM_SPI_BASE 32
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
> @@ -1121,6 +1123,75 @@ static void build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
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
> +    sdev.id = object_property_get_uint(obj, "identifier", &error_abort);
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
wonder if it wouldn't be possible to compute and store the blob in vms
once and reuse that for both iort and dsdt?

Eric
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
> +        AcpiSMMUv3Dev *sdev;
> +        Aml *dev, *crs, *addr;
> +
> +        sdev = &g_array_index(smmuv3_devs, AcpiSMMUv3Dev, i);
> +
> +        dev = aml_device("CV%.02u", sdev->id);
> +        aml_append(dev, aml_name_decl("_HID", aml_string("NVDA200C")));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(sdev->id)));
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
> +        trace_virt_acpi_dsdt_tegra241_cmdqv(sdev->id, sdev->base, sdev->irq);
> +    }
> +    g_array_free(smmuv3_devs, true);
> +}
> +
>  /* DSDT */
>  static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> @@ -1185,6 +1256,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_tpm(scope, vms);
>  #endif
>  
> +    acpi_dsdt_add_tegra241_cmdqv(scope, vms);
> +
>      aml_append(dsdt, scope);
>  
>      pci0_scope = aml_scope("\\_SB.PCI0");


