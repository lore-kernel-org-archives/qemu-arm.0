Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp6616ejb;
        Thu, 8 Feb 2024 02:21:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW266f1AyqXLNebDQGijPUvUCBEXriW+nMsEAFYlNAQGyTAvNl26TNqsUGCA1aeJaQCYrUFSOYJ5m1Lzel3/N8lh3oMvUoK
X-Google-Smtp-Source: AGHT+IFra9JDhn3lwxFFO+AkN68v7K3NLNf7QB/XpFFrh7TMVGRXiveJhVTKD+RuwCDJn0jxJB5D
X-Received: by 2002:a25:a28d:0:b0:dc6:d808:cf75 with SMTP id c13-20020a25a28d000000b00dc6d808cf75mr7272761ybi.20.1707387696493;
        Thu, 08 Feb 2024 02:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707387696; cv=none;
        d=google.com; s=arc-20160816;
        b=v0W0OKECj466bCnA3yEfIALNtM+MPEsWj+WJspmAP9BJzGGdtyVckcGazAqyFl2NZI
         wfFjmfXQDYs0KSrhMoq6SZUXkkmzTnGhNZ+mST/8/rOf5qnVbFko2dH/UbyU8mSBNXXL
         /fakRuXRIVwxHEnMDsslP3FuhBtyV0UqCZv9TAk/v2aq4cFa3CpISSIPdyKagPiHgO/g
         n3nCgbLa26mwaOHxkE5iess9EbxXExxXjBrfigRi/ekv+/6c6F3UsiXDsaBLj99+b0Fz
         kMmPwaL63BFTeFDdbhudQ1+mqrixE1S5ZGS0MK6MVtR+eG4/QqFy6rqFQBU8IRWc4eJ4
         l3rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Uyhl4gljIvylUxxsk4RjoaeNUwT3guyr/FMP3HOu0OI=;
        fh=f3U1NKg/n1jgtCyDc3j3yW5e5PJ1Usw5NYRl8mymxpo=;
        b=yv4L7TQycH8VZdYwuM6detjay13og0GUaQmIviz67lLBLrwDXsqnhKJRKmzU/YIwgh
         dx/3i/4JwK5og5VzEo+7fnE47m0IijCaoo6G8MPnt888eJx5bExj/Wf2Epb+yCXIFL5R
         XUSKD0K+DSMbE8+tWxbqwvhvGaJ3/yo7/qtfy5MzkiOU+j8Z9h4uxj0C1gBbvKiNlz6L
         o0XpIXksIaforHoIw4cFKAATvy+HpE1/d6lXc/KiTsaXkFj4n2CtGG/1SXNwRRUtqDxh
         Ovp7PZcs6cg3OZZPGCeRufr7KgfKLvpD/SfXR688haYPmo1izjv5PLpzRUYUhWP95s1G
         Zd6w==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fgRVq/bT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCU/hMfTu98+RjhO07lkOY0Ft/ya+XN7ix+Vw5i9KZEktuMgyKPytAzYanGyjAqFRjPlZ3LfnltwNIhcE9erXXgTPwQYdynF
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05622a165100b0042c4a131193si1164373qtj.362.2024.02.08.02.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 02:21:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fgRVq/bT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY1X8-0001bt-SD; Thu, 08 Feb 2024 05:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rY1X7-0001bM-7i
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:21:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rY1X5-00022L-Mw
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 05:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707387686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uyhl4gljIvylUxxsk4RjoaeNUwT3guyr/FMP3HOu0OI=;
 b=fgRVq/bTR7saiL4HG3teXA239U5IeJ/KY6maY3vvWm0JOnyf1+XrHeo1UXAM0oQLbw/mic
 We/IOsaSbEZs/Har4UkWICUslMO0qsdgnX8h+hgRXWXFeIeQr2XkfJUQ/9Uvxa56LELUkV
 BQffdlBfvTLzG0QjO883uv5hhLUrWdc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-rLaow1gCMh6sWyLuvMozJA-1; Thu, 08 Feb 2024 05:21:25 -0500
X-MC-Unique: rLaow1gCMh6sWyLuvMozJA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-785448c774fso138307585a.2
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 02:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707387684; x=1707992484;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uyhl4gljIvylUxxsk4RjoaeNUwT3guyr/FMP3HOu0OI=;
 b=vuF5aE+3+dndZAmiUaf6Dwc+ePUdf19djeMh3cWSv2CWuN8o6pIoDmd3wYAOtsuJl8
 YlSUvRpoW6HCoLxpdI4UEXMKGU/tFtsCCsWhTNXebtpCpU7t/6UgdCJIPnwzPsPGwy/s
 CH5eznRxCr7pl//A38Y+7Zl5GYxLxffQ9IRZj6rO4AZ6kWFjhv3NqjcpMjclnWzyYpf0
 8DJL1QgNckJdwO6sjBproRk7T/n5qsdEd5LX7FEuItAWH0tFtW1LlCqa1cetnpNC9z6e
 df7twrpttNgYyFFbjh/JxlCDZRCyjMrayZ9QHjboYPnKXS7H0GkfrjYRovFhqbRfg4hH
 zOkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf93MwGow0JrByc64nY6QE/8rcPt4dWZMQMXDGOozgKNgzr2+ZEZGbjbraslJo6cP9eqXOYEy9mixfLKZLkwbgtFIZ
X-Gm-Message-State: AOJu0YxEUkAOh4Q9ayD4vnQeBhTRBxdZGL76tBQBevd1GSA5GkqH4cVD
 hG8ISWnjV2PzjPlLPO/tNZG1LIqL8pD0fQpENSKs3zkeeP8Db5I0D5gkEU5lopkgyn46268psbi
 3I9p9K6q+KgIdXRXLFug4XWbbGNcqMmpqtNzjVJaE3apJyOZ4aQ==
X-Received: by 2002:a05:620a:21c7:b0:785:5fde:bf32 with SMTP id
 h7-20020a05620a21c700b007855fdebf32mr7869467qka.68.1707387683916; 
 Thu, 08 Feb 2024 02:21:23 -0800 (PST)
X-Received: by 2002:a05:620a:21c7:b0:785:5fde:bf32 with SMTP id
 h7-20020a05620a21c700b007855fdebf32mr7869446qka.68.1707387683525; 
 Thu, 08 Feb 2024 02:21:23 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXXfg+U6omYLmE9pV2gaJm8GDpBHjBClhpAZPkgYIiIBnjcWq+bjhZT9kIWZ2tXySRhZRJZCMN7+DJcgRFuxI9a/5ZiVFrIzBXA+8Pcmqr7fTxoENx05uxC7Kamja9l/U99wZiFiB84dP3vnZANl/6iivV5inlw/jd+tNwzs/BBL1RnK7q2C9Tw/RFNyH5a1yocvDgkEBNWEHzoDEqM6/469RUbyFiKHmgtErk8jEoVKRpFdmmgqNrkefikG2DczgIEM+aoiev6uZi2ao/wEKMgoXA08ypIGMsTgZYJ36AUNw2e3eBdbOThMk184TmvcVYmTLf8K32yu5gfnG0=
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 oo20-20020a05620a531400b00783f534706esm1283323qkn.61.2024.02.08.02.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 02:21:23 -0800 (PST)
Message-ID: <8c0ac34a-58cb-4301-8293-e58596c208f2@redhat.com>
Date: Thu, 8 Feb 2024 11:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] hw: Set virtio-iommu aw-bits default value on
 pc_q35 and arm virt
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 mst@redhat.com, peter.maydell@linaro.org, zhenzhong.duan@intel.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com
References: <20240208101128.655167-1-eric.auger@redhat.com>
 <20240208101128.655167-4-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240208101128.655167-4-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.106,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: e18iDZW0c3yw

On 2/8/24 11:10, Eric Auger wrote:
> Currently the default input range can extend to 64 bits. On x86,
> when the virtio-iommu protects vfio devices, the physical iommu
> may support only 39 bits. Let's set the default to 39, as done
> for the intel-iommu. On ARM we set 48b as a default (matching
> SMMUv3 SMMU_IDR5.VAX == 0).
> 
> We use hw_compat_8_2 to handle the compatibility for machines
> before 9.0 which used to have a virtio-iommu default input range
> of 64 bits.
> 
> Of course if aw-bits is set from the command line, the default
> is overriden.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> Tested-by: Yanghang Liu<yanghliu@redhat.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
> 
> v2 -> v3:
> - collected Zhenzhong's R-b
> - use &error_abort instead of NULL error handle
>    on object_property_get_uint() call (Cédric)
> - use VTD_HOST_AW_39BIT (Cédric)
> 
> v1 -> v2:
> - set aw-bits to 48b on ARM
> - use hw_compat_8_2 to handle the compat for older machines
>    which used 64b as a default
> ---
>   hw/arm/virt.c            | 6 ++++++
>   hw/core/machine.c        | 5 ++++-
>   hw/i386/pc.c             | 6 ++++++
>   hw/virtio/virtio-iommu.c | 2 +-
>   4 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 368c2a415a..0994f2a560 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2716,10 +2716,16 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>           virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
> +                                                   "aw-bits", &error_abort);
>           hwaddr db_start = 0, db_end = 0;
>           QList *reserved_regions;
>           char *resv_prop_str;
>   
> +        if (!aw_bits) {
> +            qdev_prop_set_uint8(dev, "aw-bits", 48);
> +        }
> +
>           if (vms->iommu != VIRT_IOMMU_NONE) {
>               error_setg(errp, "virt machine does not support multiple IOMMUs");
>               return;
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index fb5afdcae4..70ac96954c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -30,9 +30,12 @@
>   #include "exec/confidential-guest-support.h"
>   #include "hw/virtio/virtio-pci.h"
>   #include "hw/virtio/virtio-net.h"
> +#include "hw/virtio/virtio-iommu.h"
>   #include "audio/audio.h"
>   
> -GlobalProperty hw_compat_8_2[] = {};
> +GlobalProperty hw_compat_8_2[] = {
> +    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
> +};
>   const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
>   
>   GlobalProperty hw_compat_8_1[] = {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 196827531a..ee2d379c90 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1456,6 +1456,8 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>           virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
> +                                                   "aw-bits", &error_abort);
>           /* Declare the APIC range as the reserved MSI region */
>           char *resv_prop_str = g_strdup_printf("0xfee00000:0xfeefffff:%d",
>                                                 VIRTIO_IOMMU_RESV_MEM_T_MSI);
> @@ -1464,6 +1466,10 @@ static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>           qlist_append_str(reserved_regions, resv_prop_str);
>           qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
>   
> +        if (!aw_bits) {
> +            qdev_prop_set_uint8(dev, "aw-bits", VTD_HOST_AW_39BIT);
> +        }
> +
>           g_free(resv_prop_str);
>       }
>   
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 7870bdbeee..c468e9b13b 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1529,7 +1529,7 @@ static Property virtio_iommu_properties[] = {
>       DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>                        TYPE_PCI_BUS, PCIBus *),
>       DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
> -    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

