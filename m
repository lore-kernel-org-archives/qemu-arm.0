Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3257204njb;
        Tue, 18 Mar 2025 15:50:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnK1lAAbcUX4cFINoT4Zt6e1t99/7adYG1uz4TJqhnofrHM51RMH6fa5rBHTywEPQfgfdtL2Z3L8yL0w==@linaro.org
X-Google-Smtp-Source: AGHT+IFLxkiysIctyNxmLEuOrB2beJFaB1buRGMZ+CzEmcZAyTDl0w6a/DWUwDMii4FjNhe4mPTs
X-Received: by 2002:a05:620a:29d4:b0:7c5:4adb:7818 with SMTP id af79cd13be357-7c5a8390e73mr77354585a.15.1742338232052;
        Tue, 18 Mar 2025 15:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742338232; cv=none;
        d=google.com; s=arc-20240605;
        b=ODnbFEKvH3YVQIVdwUDI47ofAtuijN7ArZfUIoiReblNT69iRi8aPeVFH0ItNPGJbh
         UcGONEFzvHa930iTr7A97wyLoglr1kX+S98XQDiNrsV+hv6nKdjRU4osV2H2Xgpqr3ME
         9eoDgtnExfAr9lEodWJfwwhta2RxDtBUIoflfecI7SQzfWH+qkAZ68uVTNFRd04pS0lZ
         HQcO1arTSsbuGm9R8q4CKkZCbKvniz+fgSGj+mcQNs4udm59lgr6mgbkZFFzr4LByjrJ
         cHxnk94f/+mGYwoYcyiKUBR/8Kb+7n5T4lhdfszavJy7HBNMe9l88KHUxo7tXDHmoevD
         uYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AF4rmIYLEyBVPVsLZ3qMtdPqeFbNY2HOyi12QD0TGEM=;
        fh=smSR7eEH98I7aoIx6aEo/Gp4dqlttPUHK0IhIIslZ9Y=;
        b=PvnWa7zRSaFXSbztteNiVzjT7zidrJqXD4N2TY2IVeSiI4MkufhHaxCCXrM0seL8yh
         Ffmhg+pQQsmv6ZOHyQtpRDl85LQ6kQHnawsOiTpnI3tOz3a/wz8V8osQi0qIaS28MI51
         glrM8e+b33ZhYp7t+9Q4WqmcrdU707i6BPNQsWcYkBTo4YN9DwQSWrvtuJnXGSSy3Rzl
         BWel9kVSd0KbI4h0GX9SL46UIUDp50zZ9lrYRNmjuVOsd0iwqDIwnzGbDCKK9WGm1q+f
         E795I7cXynqDp8+QEl9517tUbdjOspv41EF/nUvRuMECddHQS2308+TOzQhEB8Eq/V2D
         uL8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NDx26Q1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c573d19852si1359696685a.564.2025.03.18.15.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 15:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NDx26Q1t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuflA-0008NZ-7y; Tue, 18 Mar 2025 18:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tufl7-0008LL-5M
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 18:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tufl0-00038p-SZ
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 18:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742338192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AF4rmIYLEyBVPVsLZ3qMtdPqeFbNY2HOyi12QD0TGEM=;
 b=NDx26Q1tMzr0rflG8SvNf8mEGvMbqAcDWHsn5UJZhnWPOamowtsMADnNtJ0MmegqTMX7yG
 Lx+i+NYG3iVGegHhub87FSiHFnWOpPuQtnZ9auQBLaDrB7Whj1b6FYd+8DzQhf7u/ZF1nu
 UBd4Xd6zgJuBcq6J1tWseLJsu8uUFSs=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-uKez9HM9MwuqxGuBmzNkIg-1; Tue, 18 Mar 2025 18:49:51 -0400
X-MC-Unique: uKez9HM9MwuqxGuBmzNkIg-1
X-Mimecast-MFC-AGG-ID: uKez9HM9MwuqxGuBmzNkIg_1742338190
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-85d9a52717aso611363539f.1
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 15:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742338190; x=1742942990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AF4rmIYLEyBVPVsLZ3qMtdPqeFbNY2HOyi12QD0TGEM=;
 b=eYxIw3ZvF8X7dXINT308jh3csqbvY1ZDGPIn7zun/7KLgBYK+VF0sga7qCE2Fdm/UA
 0eYvgCNg0LYghPpIAR3Bez7rIlZH/yhvp9SVh5vUgDVCg0I1eq2KkOMZG5IybWNq8ix6
 E5d5kLhwkxiFj+OAzByEjaEsn8WGxOoeJnoiRfLx88AzkV5AHQnNXVMYgwqK26EAFZMQ
 jV9njGiqWz6sSRaG7Fhawd25Y9/0B4PbcpR2/O2vSeSQUwfltYqWeHNZGHU22a8HqOza
 PV03T3eS/y0OG+a4z4Qw7EL/9tzp9OBtklu7IEXCvx173rYVjK6+N5pUGE9/noHUlvN2
 jIqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwLWZijmEcIlLuBf/phN2VgyztH2RO6kfqgiNzIJwua5BgLDNI4r5WE9Sembcbnxdi0XylR68y0g==@nongnu.org
X-Gm-Message-State: AOJu0YxGEhnPhJD8kIRHHteaDCkuc0K+hg7C0+hGUHTITm4ckLpInz1h
 k/3570C+gBm3u+9eV3K+LnhZIwVGZfXf51OrDMzvJCeDD3i/BLJO04euEOoGyzNCXnFCCu2vRHU
 neygsLfpsbFe0loNXpsWNNnAXG1D7UhR5FjGouoPXigZqLqzmaA==
X-Gm-Gg: ASbGnct50uM+cET7xz7Re7mLYMX+gqX+BaTm5uOTM7tZ+hekh2npl66yvM2IfAKTLZb
 7DUft2StcvrwttKLvOq4ZnikqBaFi+ho7JC35X4vYVgp0Htu+eOENu8PG4UPocyipF/cquW2O3s
 +Gkn/ZcD3UON8srLZ0q+xw2xMbWNz8AKkUYpLG9kd81mFcuQa9/jygO8GwTVKxUnyZQ0aUbHU8N
 N4/RYCN4Jr9YGNy5o1KLvwKx10rxIly2D4aqk10wEMdghmTgXhTyjdPjVleTpNTxnHO72UWiQ4+
 k30DdTwPL1TM9Iwc
X-Received: by 2002:a05:6602:378d:b0:85b:601d:dfb3 with SMTP id
 ca18e2360f4ac-85e137c0ce7mr77481139f.5.1742338190278; 
 Tue, 18 Mar 2025 15:49:50 -0700 (PDT)
X-Received: by 2002:a05:6602:378d:b0:85b:601d:dfb3 with SMTP id
 ca18e2360f4ac-85e137c0ce7mr77476339f.5.1742338189949; 
 Tue, 18 Mar 2025 15:49:49 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f263719a69sm2936084173.52.2025.03.18.15.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 15:49:49 -0700 (PDT)
Message-ID: <82e44777-8f14-428c-9614-c521e4836fce@redhat.com>
Date: Tue, 18 Mar 2025 18:49:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/20] hw/arm/virt: Add support for smmuv3-accel
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-5-shameerali.kolothum.thodi@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250311141045.66620-5-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XE6rNWm38mw1PJJ0g8ZdbfnRRKGVp9B0qXlq8YNhRR8_1742338190
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UNtwZUInajk2


Doesn't this commit become moot, if accel becomes an smmuv3 option vs separate device object altogether,
dynamically added if a pdev is attached to a host SMMUv3 that has accel feature(s)?

Blocking w/virtio-iommu falls under the same situation mentioned in 03/20 wrt mixing emulated & physical devices on the same smmuv3.

- Don

On 3/11/25 10:10 AM, Shameer Kolothum wrote:
> Allow cold-plug smmuv3-accel to virt If the machine wide smmuv3
> is not specified.
> 
> No FDT support is added for now.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>   hw/arm/virt.c         | 12 ++++++++++++
>   hw/core/sysbus-fdt.c  |  1 +
>   include/hw/arm/virt.h |  1 +
>   3 files changed, 14 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4a5a9666e9..84a323da55 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -73,6 +73,7 @@
>   #include "qobject/qlist.h"
>   #include "standard-headers/linux/input.h"
>   #include "hw/arm/smmuv3.h"
> +#include "hw/arm/smmuv3-accel.h"
>   #include "hw/acpi/acpi.h"
>   #include "target/arm/cpu-qom.h"
>   #include "target/arm/internals.h"
> @@ -2911,6 +2912,16 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>               platform_bus_link_device(PLATFORM_BUS_DEVICE(vms->platform_bus_dev),
>                                        SYS_BUS_DEVICE(dev));
>           }
> +        if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3_ACCEL)) {
> +            if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> +                error_setg(errp,
> +                           "iommu=smmuv3 is already specified. can't create smmuv3-accel dev");
> +                return;
> +            }
> +            if (vms->iommu != VIRT_IOMMU_SMMUV3_ACCEL) {
> +                vms->iommu = VIRT_IOMMU_SMMUV3_ACCEL;
> +            }
> +        }
>       }
>   
>       if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> @@ -3120,6 +3131,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_AMD_XGBE);
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
> +    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ARM_SMMUV3_ACCEL);
>   #ifdef CONFIG_TPM
>       machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
>   #endif
> diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
> index 774c0aed41..c8502ad830 100644
> --- a/hw/core/sysbus-fdt.c
> +++ b/hw/core/sysbus-fdt.c
> @@ -489,6 +489,7 @@ static const BindingEntry bindings[] = {
>   #ifdef CONFIG_LINUX
>       TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
>       TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
> +    TYPE_BINDING("arm-smmuv3-accel", no_fdt_node),
>       VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
>   #endif
>   #ifdef CONFIG_TPM
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c8e94e6aed..849d1cd5b5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -92,6 +92,7 @@ enum {
>   typedef enum VirtIOMMUType {
>       VIRT_IOMMU_NONE,
>       VIRT_IOMMU_SMMUV3,
> +    VIRT_IOMMU_SMMUV3_ACCEL,
>       VIRT_IOMMU_VIRTIO,
>   } VirtIOMMUType;
>   

