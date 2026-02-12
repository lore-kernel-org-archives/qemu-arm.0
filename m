Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C22AEEA846
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Feb 2026 18:30:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqbRx-0003dW-FT; Thu, 12 Feb 2026 13:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqbRv-0003cQ-S1
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 13:29:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqbRt-0005sv-Qw
 for qemu-arm@nongnu.org; Thu, 12 Feb 2026 13:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770920995;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+yjv/Cp6W5b0BAAzHQNN/vBafaSHrxuTXQHFMcnRAU=;
 b=H05j4g64Tk2shuOsXsnN6I7v8FK3i1HCfzBmn1huW/6yrHDRaOFm4wXZ6AjntS5P7YcEFi
 9O34KBHzHxupxZx/y7/j6ro5kcGeU3XtACnVdQOq59fLf7Y2EEnuFh+vrefFvfO2XdnZ1V
 UVnUW9yMdD8f+BQ0R2MhkSPViC6EbEk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-HL2ptjn-NCC2BJqoNxvXjg-1; Thu, 12 Feb 2026 13:29:54 -0500
X-MC-Unique: HL2ptjn-NCC2BJqoNxvXjg-1
X-Mimecast-MFC-AGG-ID: HL2ptjn-NCC2BJqoNxvXjg_1770920993
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4836b7c302fso980055e9.1
 for <qemu-arm@nongnu.org>; Thu, 12 Feb 2026 10:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770920993; x=1771525793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q+yjv/Cp6W5b0BAAzHQNN/vBafaSHrxuTXQHFMcnRAU=;
 b=omd3lOfMvotFgF4RJpiFksQfRZrtMAdCvpRo19nj3P7yCkkGog9Q795AAxv78m9tb3
 T0PCt0HnBUvBiNQaFPj0HS4KfAyrvOxcfUFNMcNsDNTwiv+JDNBfDOLEyItJVuIjW4m8
 pDNH0KIvA0b+ypSqgIKUyZjLO1KajS+SnpJEFjlj9iA4g/h9NLgwxWJ7c9+qDjdSAU0j
 oOIHTJj4Plzwz+4jL5DL+FsVmicQ2vYsxxsMfklt3KGvvruE9FWQnGSGkyBuErfg7xBn
 HtvSm32GhfxC+GBQfGWLErfPko1yBGx7v/eEn1eUx19hj4qqfiX+4tYYyXfYsChoeTeQ
 7+Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD180Z+PJ/r/se+sZAww8E39YIdTjmkkw+bNuS4V3X9k9BncjrL24VfbgTmYTy7QvOA/7ovSM46w==@nongnu.org
X-Gm-Message-State: AOJu0YyJ9E44LbROk1z+9GUY+f+NXomJxj6M3OwY/p5um7PBhb6h0N7y
 BVswVDoIIleyTho4tU6cZ/laIIR8B71ERl7nUX4aygjnq6RjF9GxCnc+nji9DqZIkABjqoxmoSw
 WCxpqKF4hsMdfQGx129Hlvar7tYzM5sWgb2jH6pIkWIIcqGdJQtTDpg==
X-Gm-Gg: AZuq6aKL5TOk7IfS/NMUKbNtoUpKg2SB6BTZ9PdcNeHATDQzTqDBVFnTZnArOgvd30n
 0B/Ar2mHpi3ois6Cb6j9S8C2wRcPpeKrp1dKt41dj8cWzZpKIDfz8lSLjEB2yeQCzWto++YTxNQ
 pPWMLYNrjuPODxexXOQprHmwYyoCi0VErPbosyEeQYLGhKdgYgLunIUIY+K4yJZeQiB23SbD2VV
 2cZUMqiuELHz6rwBMfDRbEtGKeMNyPXGKN1YX43QIAA1ggXHHso+fWQvy4cvsvY8X1shG/iormI
 6dwA70alu/XmI22S2NsA2+hDat7i+pdIwocwyOYi1vzbwlequa56jsx9VpVGPlF7FM3t7A90omk
 hBVBpmTIppSRFOAt2P/zK1966TERp6us57XdcYLwB8B68OZU+eonR/ZmmIWVcQtPHCA2e4Q==
X-Received: by 2002:a05:600c:1da1:b0:47e:e8de:7420 with SMTP id
 5b1f17b1804b1-48371085905mr234485e9.22.1770920993116; 
 Thu, 12 Feb 2026 10:29:53 -0800 (PST)
X-Received: by 2002:a05:600c:1da1:b0:47e:e8de:7420 with SMTP id
 5b1f17b1804b1-48371085905mr234055e9.22.1770920992646; 
 Thu, 12 Feb 2026 10:29:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48370a63881sm708675e9.21.2026.02.12.10.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 10:29:52 -0800 (PST)
Message-ID: <6c4468e1-85e5-4d3e-9b4d-6710aac202a2@redhat.com>
Date: Thu, 12 Feb 2026 19:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/24] hw/arm/smmuv3: Add per-device identifier
 poroperty
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260206144823.80655-1-skolothumtho@nvidia.com>
 <20260206144823.80655-23-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260206144823.80655-23-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2dN4tx8BSa1fcW6GSIuuyoDfp87rjyFRKxIwm6g-3E8_1770920993
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 2/6/26 3:48 PM, Shameer Kolothum wrote:
> Add an "identifier" property to the SMMUv3 device and use it when
> building the ACPI IORT SMMUv3 node Identifier field.
>
> This avoids relying on enumeration order and provides a stable
> per-device identifier. This is useful when we add support for
> Tegra241 CMDQV DSDT in subsequent patch.
>
> No functional change intended.
I think an important info which is missing here is you need the id used
in IORT and DSDT to be the same, is that correct

By the way why can't you reuse the QOM id. I think Dan said there is one
for all QOM objects.

Thanks

Eric
    

>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3.c          | 1 +
>  hw/arm/virt-acpi-build.c | 4 +++-
>  hw/arm/virt.c            | 3 +++
>  include/hw/arm/smmuv3.h  | 1 +
>  4 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 7858bf2c33..7f84c87a46 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -2114,6 +2114,7 @@ static const Property smmuv3_properties[] = {
>       * Defaults to stage 1
>       */
>      DEFINE_PROP_STRING("stage", SMMUv3State, stage),
> +    DEFINE_PROP_UINT8("identifier", SMMUv3State, identifier, 0),
>      DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
>      /* GPA of MSI doorbell, for SMMUv3 accel use. */
>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ae3b4aac52..046e930ca5 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -342,6 +342,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>  typedef struct AcpiSMMUv3Dev {
>      int irq;
>      hwaddr base;
> +    uint8_t id;
>  
>      /*
>       * IORT-only fields.
> @@ -407,6 +408,7 @@ static int iort_smmuv3_devices(Object *obj, void *opaque)
>      bus = PCI_BUS(object_property_get_link(obj, "primary-bus", &error_abort));
>      sdev.accel = object_property_get_bool(obj, "accel", &error_abort);
>      sdev.ats = object_property_get_bool(obj, "ats", &error_abort);
> +    sdev.id = object_property_get_uint(obj, "identifier", &error_abort);
>      pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
>      sbdev = SYS_BUS_DEVICE(obj);
>      sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> @@ -642,7 +644,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                       (ID_MAPPING_ENTRY_SIZE * smmu_mapping_count);
>          build_append_int_noprefix(table_data, node_size, 2); /* Length */
>          build_append_int_noprefix(table_data, 4, 1); /* Revision */
> -        build_append_int_noprefix(table_data, id++, 4); /* Identifier */
> +        build_append_int_noprefix(table_data, sdev->id, 4); /* Identifier */
>          /* Number of ID mappings */
>          build_append_int_noprefix(table_data, smmu_mapping_count, 4);
>          /* Reference to ID Array */
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 390845c503..22ee5c4a41 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3059,12 +3059,15 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                         (vms->legacy_smmuv3_present) ?
>                         "iommu=smmuv3" : "virtio-iommu");
>          } else if (vms->iommu == VIRT_IOMMU_NONE) {
> +            static uint8_t id;
> +
>              /* The new SMMUv3 device is specific to the PCI bus */
>              object_property_set_bool(OBJECT(dev), "smmu_per_bus", true, NULL);
>              object_property_set_link(OBJECT(dev), "memory",
>                                       OBJECT(vms->sysmem), NULL);
>              object_property_set_link(OBJECT(dev), "secure-memory",
>                                       OBJECT(vms->secure_sysmem), NULL);
> +            object_property_set_uint(OBJECT(dev), "identifier", id++, NULL);
>          }
>          if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
>              hwaddr db_start = 0;
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 87926f8cb3..39cb43506e 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -63,6 +63,7 @@ struct SMMUv3State {
>      qemu_irq     irq[4];
>      QemuMutex mutex;
>      char *stage;
> +    uint8_t identifier;
>  
>      /* SMMU has HW accelerator support for nested S1 + s2 */
>      bool accel;


