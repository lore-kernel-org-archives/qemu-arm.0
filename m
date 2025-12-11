Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2094BD41D56
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Dec 2025 15:12:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTiKe-0007xX-MR; Thu, 11 Dec 2025 10:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vTiKZ-0007wv-Ta
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 10:11:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vTiKU-0001PL-5n
 for qemu-arm@nongnu.org; Thu, 11 Dec 2025 10:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765465901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=M3V4QAmkd7VEkayvwfxT+kMt7tbZOOAmLQsPiOpJV6w=;
 b=I8gOl1JnSpx31KVT7HE+aEUmzLkVsQKmFG2laPzkppQMwmk7uFtiQ9LYhVvbhBf9rnd6AU
 ag3WlQTcosm5HfmoTIt5fOyk+eTsffws9tdSUBD/b1vcX/BbKJg+hICbLbl0X3wphmyIon
 WZOw95naWIezF9YI+lQ5knDUszaNwks=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-O7WigggANWq3OppnClu_Rw-1; Thu, 11 Dec 2025 10:11:37 -0500
X-MC-Unique: O7WigggANWq3OppnClu_Rw-1
X-Mimecast-MFC-AGG-ID: O7WigggANWq3OppnClu_Rw_1765465897
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477771366cbso1586605e9.0
 for <qemu-arm@nongnu.org>; Thu, 11 Dec 2025 07:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765465897; x=1766070697;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3V4QAmkd7VEkayvwfxT+kMt7tbZOOAmLQsPiOpJV6w=;
 b=WJKHzIwT6wt+5SBRTD4QGQBv698bNyE0A9UCCwGpGqcURCuMJBKbvZh2QFhSwu3j0K
 BfHh0lPsWwIZYzNbdd23KrXzrIgUfOilkOw51DYfSGXIORKViDPhTFeMS0edbPmITNDs
 WISe/ubCEb2Eu72vEbzc5MLO1c7wuUvwt5NRBSdVLPv23z/tdEU3Dtcl9zjWWwsvos7s
 tWyi4v82NMBfeRweFnVGIJmHPwEdG8voflP07gp5wdxPu3fOR7qU86I1uBG8Z0G2SnYB
 4rPsNGSmmZ/iCSHOjmr1ybVaxUhhA8DAofg4ufu/EyOASR0y0laddFT9H+QAkxTw4NVF
 CyzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNnP0hJk9KKSncXixObcQRl9QYwadMctmkqITlhc1OxZTBA9jYl9Jl5cLelcpfcEtF3IhrP9uIIg==@nongnu.org
X-Gm-Message-State: AOJu0YxY11/YFH/ubtgeKp6rGnkaSMxhoB9hqE8ZOvgpXjlufm4XaZfB
 UqlN6p5BrTGnnggSOXw8+p80DJ47I21wftgIoC1vH9GuYPqIpbyFNLeBQo3dzM00xiR5fWTF11C
 oNpSskdnNeein1ahWucNkj3kh0ofqKv3T00cQvAXjwybpe2Lbk80atA==
X-Gm-Gg: AY/fxX6zO/TKWsHh1IDck7WSGfAvl88sOZVhfaYMqM35HkDJPtIcW1HzJD66z7fXBP3
 4v9MLOZrooXJQMeKMkT9prB3las9tRtdpTr0ZF9E2R/SsOBQXREMo3pvuPTq1INK0iBmsEdAZy0
 gEBrJkjW7qiHNsktwFYBiwJ91iV7Wlz6+e58BLxYX1IAVKq0/vSZdXzzrKJgIjvq/hUA5oblN8L
 DkIFeG2NDyqlXEKWuwI81eeVPF5u+NvNFmIfcSkgsZ3cNIZkxHPfn+NTzKseAcGoz+GsIB+O7xF
 R85L6FQN5MUyVwAjzc1GRTiZo5XBoSR7VImmKSxiEvVu/Yua9aOS8DCMNp+rFPYk0vDSrbRjz3i
 lr0PgrMQcO9dZTi1Qtl0Fpq5u3CD1N5cBVViutm4z+oDV0txZ
X-Received: by 2002:a05:600c:3541:b0:477:632c:5b91 with SMTP id
 5b1f17b1804b1-47a8375a183mr82279785e9.16.1765465896675; 
 Thu, 11 Dec 2025 07:11:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzunEGXRQKLPXzkg8Hvm6mswQYn3vv5lKgTwUugTZ5hqUbIV3i5v14NAhF+yD/vv0NQkhfdw==
X-Received: by 2002:a05:600c:3541:b0:477:632c:5b91 with SMTP id
 5b1f17b1804b1-47a8375a183mr82279215e9.16.1765465896155; 
 Thu, 11 Dec 2025 07:11:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89ed3986sm15998675e9.5.2025.12.11.07.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:11:35 -0800 (PST)
Message-ID: <9a54ba3b-1a14-4240-80a7-715e20b99dac@redhat.com>
Date: Thu, 11 Dec 2025 16:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 26/33] hw/arm/smmuv3: Add accel property for SMMUv3
 device
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, ddutile@redhat.com, berrange@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
References: <20251120132213.56581-1-skolothumtho@nvidia.com>
 <20251120132213.56581-27-skolothumtho@nvidia.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20251120132213.56581-27-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 44LkAzMS0skwCO5s2fFXncOG2EHw5vKYd4wTZA59uxg_1765465897
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 11/20/25 14:22, Shameer Kolothum wrote:
> Introduce an “accel” property to enable accelerator mode.
> 
> Live migration is currently unsupported when accelerator mode is enabled,
> so a migration blocker is added.
> 
> Because this mode relies on IORT RMR for MSI support, accelerator mode is
> not supported for device tree boot.
> 
> Also, in the accelerated SMMUv3 case, the host SMMUv3 is configured in nested
> mode (S1 + S2), and the guest owns the Stage-1 page table. Therefore, we
> expose only Stage-1 to the guest to ensure it uses the correct page table
> format.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>   hw/arm/smmuv3.c          | 26 ++++++++++++++++++++++++++
>   hw/arm/virt-acpi-build.c |  4 +---
>   hw/arm/virt.c            | 15 +++++++++++----
>   include/hw/arm/smmuv3.h  |  1 +
>   4 files changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index dba5abc8d3..8352dd5757 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -20,6 +20,7 @@
>   #include "qemu/bitops.h"
>   #include "hw/irq.h"
>   #include "hw/sysbus.h"
> +#include "migration/blocker.h"
>   #include "migration/vmstate.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/qdev-core.h"
> @@ -1915,6 +1916,17 @@ static void smmu_reset_exit(Object *obj, ResetType type)
>       smmuv3_accel_reset(s);
>   }
>   
> +static bool smmu_validate_property(SMMUv3State *s, Error **errp)
> +{
> +#ifndef CONFIG_ARM_SMMUV3_ACCEL
> +    if (s->accel) {
> +        error_setg(errp, "accel=on support not compiled in");
> +        return false;
> +    }
> +#endif
> +    return true;
> +}
> +
>   static void smmu_realize(DeviceState *d, Error **errp)
>   {
>       SMMUState *sys = ARM_SMMU(d);
> @@ -1923,8 +1935,17 @@ static void smmu_realize(DeviceState *d, Error **errp)
>       SysBusDevice *dev = SYS_BUS_DEVICE(d);
>       Error *local_err = NULL;
>   
> +    if (!smmu_validate_property(s, errp)) {
> +        return;
> +    }

You should really consider adding a new QOM model for the "accel" mode.

>       if (s->accel) {
>           smmuv3_accel_init(s);
> +        error_setg(&s->migration_blocker, "Migration not supported with SMMUv3 "
> +                   "accelerator mode enabled");
> +        if (migrate_add_blocker(&s->migration_blocker, errp) < 0) {
> +            return;
> +        }

I would add the migration blocker in a separate patch.


>       }
>   
>       c->parent_realize(d, &local_err);
> @@ -2023,6 +2044,7 @@ static const Property smmuv3_properties[] = {
>        * Defaults to stage 1
>        */
>       DEFINE_PROP_STRING("stage", SMMUv3State, stage),
> +    DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
>       /* GPA of MSI doorbell, for SMMUv3 accel use. */
>       DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>   };
> @@ -2046,6 +2068,10 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>       device_class_set_props(dc, smmuv3_properties);
>       dc->hotpluggable = false;
>       dc->user_creatable = true;
> +
> +    object_class_property_set_description(klass, "accel",
> +        "Enable SMMUv3 accelerator support. Allows host SMMUv3 to be "
> +        "configured in nested mode for vfio-pci dev assignment");
>   }
>   
>   static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7a7b2e62c1..fd78c39317 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -400,9 +400,7 @@ static int iort_smmuv3_devices(Object *obj, void *opaque)
>       }
>   
>       bus = PCI_BUS(object_property_get_link(obj, "primary-bus", &error_abort));
> -    if (object_property_find(obj, "accel")) {
> -        sdev.accel = object_property_get_bool(obj, "accel", &error_abort);
> -    }
> +    sdev.accel = object_property_get_bool(obj, "accel", &error_abort);
>       pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
>       sbdev = SYS_BUS_DEVICE(obj);
>       sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8503879c3d..51b15aef37 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3052,13 +3052,21 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>               /* The new SMMUv3 device is specific to the PCI bus */
>               object_property_set_bool(OBJECT(dev), "smmu_per_bus", true, NULL);
>           }
> -        if (object_property_find(OBJECT(dev), "accel") &&
> -            object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
> +        if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
> +            char *stage;
> +
>               if (!kvm_enabled() || !kvm_irqchip_in_kernel()) {
>                   error_setg(errp, "SMMUv3 accel=on requires KVM with "
>                              "kernel-irqchip=on support");
>                       return;
>               }
> +            stage = object_property_get_str(OBJECT(dev), "stage", &error_fatal);
> +            /* If no stage specified, SMMUv3 will default to stage 1 */
> +            if (*stage && strcmp("1", stage)) {

It would be less "ugly" to check SMMUStage enum values instead
of using string compare :/

> +                error_setg(errp, "Only stage1 is supported for SMMUV3 with "
> +                           "accel=on");

Can't this condition be checked in the realize handler instead ?

C.


> +                return;
> +            }
>           }
>       }
>   }
> @@ -3096,8 +3104,7 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>               }
>   
>               create_smmuv3_dev_dtb(vms, dev, bus);
> -            if (object_property_find(OBJECT(dev), "accel") &&
> -                object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
> +            if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
>                   hwaddr db_start;
>   
>                   if (vms->msi_controller == VIRT_MSI_CTRL_ITS) {
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 5616a8a2be..9c39acd5ca 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -68,6 +68,7 @@ struct SMMUv3State {
>       bool accel;
>       struct SMMUv3AccelState *s_accel;
>       uint64_t msi_gpa;
> +    Error *migration_blocker;
>   };
>   
>   typedef enum {


