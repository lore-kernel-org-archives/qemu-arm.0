Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1237218ejb;
        Mon, 5 Feb 2024 08:24:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAgdoz9sU+L8u0XEoMAgcPzaRXteV9XDrnbwDIilvnjp6FssNv+UP8od7dIl3rmSh9Aw1M
X-Received: by 2002:a05:6808:3a0e:b0:3bf:c3bc:4379 with SMTP id gr14-20020a0568083a0e00b003bfc3bc4379mr256491oib.3.1707150256675;
        Mon, 05 Feb 2024 08:24:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707150256; cv=none;
        d=google.com; s=arc-20160816;
        b=SUnK7IRU9otvN5/2C+j/yvXor7ScuT1U3aLhO4eTQh2LTot/XUXg8JjoMAsPOE74bf
         1jO+vU4VFvWqsBzxtf2Bse04HCoQnB+VaAKj5sgrS7XP1XcQBRMe/t6NY8UIxi7ELcGK
         QojLvw7dW2+RTUPS6ZXycdchlmZT/RtdXVJd94OHeFLdcKo8q5e0RD5RgdAeUXB534Vv
         zlj79e8fTIiUyzZpBRm4rPU+zIU3eN0Jl1Ujt8z79IsZxKsfwo9GGlOwMJHBBG+Jp1av
         sl1IUbKVfXlSyKbADZD17DXWqjEGnXqxIZ6CwMvAyPS32NN17dK4VH/f4Oyz7q9TZU61
         jorg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=v0YpVOHMpyvEliTGejhp9W9X/tl+XrN5ezSE0h6zBoU=;
        fh=FQvirCCsCVjCIoKMv01ITavyLA8O8haKtyNo4W7e/dQ=;
        b=0S2DtngELc4bij1yYm2vSPrErXzeOqRdSq56ss0Cs3AepEEXOFQjj2HRN2f4NwR0ws
         jzhaoWuG5ajegf7PJa+2hJWhkQ8S3fZILY9dYMvxsSWKgpUVru0Tiwc/UHt0+1lsBnF0
         ewLD2eZ/QGhXWevl5kRyepWOw1pgi1/6NJPJ7HZFRhrjnwZTr/1MEhkbzLGo81MuEaH9
         WwWFFL8UE74tD9fJSbLbzXE48RiEWAXBU0/hao51BKx3O24QdX3O7HOCAoZJW3dk1Rjy
         KZ8shvdvg9d0oRKakd9eNQXRyP9bsuQaxaH0fANC+5wO9S55PBjQO38ZfhJao/3q0dHp
         anoA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ePWux3l4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCWkGVtcut2z2w4RieEqJn4rRnbQ6BhUGqw6lAOGIJBjJpUWQ6SpSXXXJTDOQObaw++goHaqVwl6JNdmfqSQ1FIisaBmSetf
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vq8-20020a05620a558800b0078407cfac22si148340qkn.376.2024.02.05.08.24.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 08:24:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ePWux3l4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rX1lU-0005bk-2h; Mon, 05 Feb 2024 11:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rX1lS-0005bU-J9
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 11:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rX1lR-0000Yp-0O
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 11:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707150248;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0YpVOHMpyvEliTGejhp9W9X/tl+XrN5ezSE0h6zBoU=;
 b=ePWux3l4znzq2YilIh1cSFIOPVDnhrYZHBJUcmwKXcscdD/iQI/ZZRaOBvgXketT4TN6eW
 GnKR8LjlMcbF6+hoo647Ey7eSbQGNWUGiwi6JvwO0agcNZXiQh07NF2hIf6uJM1V0S8z1c
 H8gJP+q5UDyyc+wcGrENOifAZglQzyY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-KiyeOmz7P0u8N8hA4DBCbA-1; Mon, 05 Feb 2024 11:24:07 -0500
X-MC-Unique: KiyeOmz7P0u8N8hA4DBCbA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-680c651928eso65903286d6.2
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 08:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707150246; x=1707755046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0YpVOHMpyvEliTGejhp9W9X/tl+XrN5ezSE0h6zBoU=;
 b=nEaAQ4vwAsZ6NnBC6xQ5rRdzL2VYQfngLFavEnO3J0vfq4/eqp7nj+eEcDgmYq7JxP
 n6FCY3qTyV/ewqORvwOycH1jQW0/tWQ2SXty+Q8bqoar5/nSqAlh3vu+jmD/v0lpJHHL
 rk28AMSq0xb4gSJRICoFOwHlkWW90W/MeOlMDzoFDErSFHGF5kl5+PmLhUm36FaoEGED
 awo5EFTZBQ5Z5dckVwuzeWeuVSRNanossw7FaPmN6Oqx33LMei2h1pj0exKVkji38dJ9
 CBDoA4IOkOpMwEWHz5v9VKrcncdcvgqDiC4Gt2DWajlEUpsrwObhdtnAlSFmPz1YynXq
 +B7w==
X-Gm-Message-State: AOJu0YwbAUF+0RNDNL4iIYc50P4iq4DEZ+2k7gUx6Mdw5X7FrYUUHJX+
 bu8ciaOulE63cz+JLKfxyTWL77AjQAioM7gtrA8hSIhz5ESZzY2hZg83jzZAXxmn5IeT0gJwShZ
 xAkUKATSWhm7zENC2Aswrt2Gevf+Whgr/KDTBo+LgjtY+sFRvyQ==
X-Received: by 2002:a05:6214:260e:b0:68c:9db6:e178 with SMTP id
 gu14-20020a056214260e00b0068c9db6e178mr6455864qvb.39.1707150246567; 
 Mon, 05 Feb 2024 08:24:06 -0800 (PST)
X-Received: by 2002:a05:6214:260e:b0:68c:9db6:e178 with SMTP id
 gu14-20020a056214260e00b0068c9db6e178mr6455836qvb.39.1707150246257; 
 Mon, 05 Feb 2024 08:24:06 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU39dEf55hNYsaJNqi+pDLPQRrpjHLG4nu+Ci7MXXtg4eaILEo4bw9MofJPFz/1x1wOKYIBCw2AF8Nkkkg/GPHP4N//INGx1P5c1o/WWl5IxbbYb+DVio07FSOyWmjDWuwcLf6m9Jwgxxt6jL8G9DAIKYScrV094bMvSghm9b2jUSQYGmN4KqmQawodh6mp8sdaqrKHy788eOESPFl+dkj/RQ5T/Yiz7ZXFG1nHisIKB1Sl7cdfNbMbZWFPPG6/G61I1TRT2BKlHt4j6n0xJ88X69uFbdIv54J8iDdHcYrg0R5emDsfnwrT2hQQf2HRID0EQrPCZ/cmsJa/AFhCK2Z5wxPMy7f/cVk=
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a0cf514000000b0068c440bc7d0sm109511qvm.105.2024.02.05.08.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 08:24:05 -0800 (PST)
Message-ID: <716f974a-48b3-4b30-bebc-242f4c3e7430@redhat.com>
Date: Mon, 5 Feb 2024 17:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hw: Set virtio-iommu aw-bits default value on
 pc_q35_9.0 and arm virt
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, yanghliu@redhat.com
Cc: mst@redhat.com, jasowang@redhat.com
References: <20240201163324.564525-1-eric.auger@redhat.com>
 <20240201163324.564525-4-eric.auger@redhat.com>
 <d4571370-0fcc-4065-8571-60ccc18f4982@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <d4571370-0fcc-4065-8571-60ccc18f4982@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.285,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 64216IABRWLk



On 2/5/24 10:33, Cédric Le Goater wrote:
> On 2/1/24 17:32, Eric Auger wrote:
>> Currently the default input range can extend to 64 bits. On x86,
>> when the virtio-iommu protects vfio devices, the physical iommu
>> may support only 39 bits. Let's set the default to 39, as done
>> for the intel-iommu. On ARM we set 48b as a default (matching
>> SMMUv3 SMMU_IDR5.VAX == 0).
>>
>> We use hw_compat_8_2 to handle the compatibility for machines
>> before 9.0 which used to have a virtio-iommu default input range
>> of 64 bits.
>>
>> Of course if aw-bits is set from the command line, the default
>> is overriden.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - set aw-bits to 48b on ARM
>> - use hw_compat_8_2 to handle the compat for older machines
>>    which used 64b as a default
>> ---
>>   hw/arm/virt.c            | 6 ++++++
>>   hw/core/machine.c        | 5 ++++-
>>   hw/i386/pc.c             | 6 ++++++
>>   hw/virtio/virtio-iommu.c | 2 +-
>>   4 files changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index e6ead2c5c8..56539f2fc5 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2718,10 +2718,16 @@ static void
>> virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>           virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev),
>> MACHINE(hotplug_dev), errp);
>>       } else if (object_dynamic_cast(OBJECT(dev),
>> TYPE_VIRTIO_IOMMU_PCI)) {
>> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
>> +                                                   "aw-bits", NULL);
>
> object_property_get_uint() should not fail. Please use &error_abort.
sure
>
>>           hwaddr db_start = 0, db_end = 0;
>>           QList *reserved_regions;
>>           char *resv_prop_str;
>>   +        if (!aw_bits) {
>> +            qdev_prop_set_uint8(dev, "aw-bits", 48);
>> +        }
>> +
>>           if (vms->iommu != VIRT_IOMMU_NONE) {
>>               error_setg(errp, "virt machine does not support
>> multiple IOMMUs");
>>               return;
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index fb5afdcae4..70ac96954c 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -30,9 +30,12 @@
>>   #include "exec/confidential-guest-support.h"
>>   #include "hw/virtio/virtio-pci.h"
>>   #include "hw/virtio/virtio-net.h"
>> +#include "hw/virtio/virtio-iommu.h"
>>   #include "audio/audio.h"
>>   -GlobalProperty hw_compat_8_2[] = {};
>> +GlobalProperty hw_compat_8_2[] = {
>> +    { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
>> +};
>>   const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
>>     GlobalProperty hw_compat_8_1[] = {
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 803244e5cc..0e2bcb4840 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1458,6 +1458,8 @@ static void
>> pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>           virtio_md_pci_pre_plug(VIRTIO_MD_PCI(dev),
>> MACHINE(hotplug_dev), errp);
>>       } else if (object_dynamic_cast(OBJECT(dev),
>> TYPE_VIRTIO_IOMMU_PCI)) {
>> +        uint8_t aw_bits = object_property_get_uint(OBJECT(dev),
>> +                                                   "aw-bits", NULL);
>>           /* Declare the APIC range as the reserved MSI region */
>>           char *resv_prop_str =
>> g_strdup_printf("0xfee00000:0xfeefffff:%d",
>>                                                
>> VIRTIO_IOMMU_RESV_MEM_T_MSI);
>> @@ -1466,6 +1468,10 @@ static void
>> pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>           qlist_append_str(reserved_regions, resv_prop_str);
>>           qdev_prop_set_array(dev, "reserved-regions",
>> reserved_regions);
>>   +        if (!aw_bits) {
>> +            qdev_prop_set_uint8(dev, "aw-bits", 39);
>
> May be use VTD_HOST_AW_39BIT instead of 39 ? This would make it
> easier to find uses of certain defaults values and would clarify
> that the default AW of virtio-iommu is set as intel-iommu.

OK

Thanks!

Eric
>
> Thanks,
>
> C.
>
>
>
>> +        }
>> +
>>           g_free(resv_prop_str);
>>       }
>>   diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> index 7870bdbeee..c468e9b13b 100644
>> --- a/hw/virtio/virtio-iommu.c
>> +++ b/hw/virtio/virtio-iommu.c
>> @@ -1529,7 +1529,7 @@ static Property virtio_iommu_properties[] = {
>>       DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
>>                        TYPE_PCI_BUS, PCIBus *),
>>       DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
>> -    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 64),
>> +    DEFINE_PROP_UINT8("aw-bits", VirtIOIOMMU, aw_bits, 0),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>

