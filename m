Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675B3CCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 16:31:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFxSJ-00046l-QB; Mon, 03 Nov 2025 11:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxSI-00046Y-7w
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxS7-0007Ob-HA
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762187438;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AMOfvYfaYou6zeuCdAKRJlXrsqctEUARD6uEDmcr3sA=;
 b=fi0qng+NZ42siEz2uUjtcHjZbS08gdoPSWl8UPrlwaITpsumLaumr/PlG+0XSqXYiqs4hU
 Z1xJvarhGv5TEyXlZ7Mebn1KSWYhgAnY+Y8ZKg9aR2o+DI12Oo5GbtdkMqo6paTy6D3ev/
 zOCm5UtT2X6r38flnSQ+/2TJkxvot1w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-e5AuB1dkOQaT1b-TSwlD9w-1; Mon, 03 Nov 2025 11:30:37 -0500
X-MC-Unique: e5AuB1dkOQaT1b-TSwlD9w-1
X-Mimecast-MFC-AGG-ID: e5AuB1dkOQaT1b-TSwlD9w_1762187437
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-429be5aeea2so1895345f8f.2
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 08:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762187436; x=1762792236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AMOfvYfaYou6zeuCdAKRJlXrsqctEUARD6uEDmcr3sA=;
 b=Tb1b3n/PJyNueK9O/hR4G/yWCB8C+3K4jasN+Hxi9fbBSyv7JQGU31VQuNCgrzWLkt
 vXbQb09H1EtpmIQXz5eIkAC29qy9hDR9wxpUb3FdK+DZ+WfcYmOWapkOJ3YmljmQ3/zZ
 lwHh2GKxL7B6Sh0uX5uEPQjSn3JGLt4mT+o3+hRQLKD2a54N9SxEUOBFXHGsxx5SWDGC
 I02coQEHqAhWwwjMdsbeKnyIESbISl/RTRBaLa6H+u8DoxDsLyw5l3Vw9+Zp86uOErZG
 8nRRcRMLQrrSGflOFv3QhFbJbVFuVBDjhkmpKIIJzYDWVudFHeOWoIwixT8JlAK3O8On
 EMlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS1qTem6p0bRe7WN8GfoqAchNwGkuwYOIXnRG3FC3qxYW7mJdHWoMtjHN8Q2ej/AMQWBSDZWkdpw==@nongnu.org
X-Gm-Message-State: AOJu0YxYrWx/GiXSJ/rYRXxV3ECPfx3B9f5c9ZhXIN5XIo2HZienRl8k
 j2uERd3Ltke6GnShgAroZqwM3gK87WDOtW1A700LRXAADS/6ZE1fOhv5nUMPdx1ryLM1pnAkdhQ
 sRz734d/Hk9FkqXKOO8YgrQHBGHoNqw8TwGP1mWXr2qW5BxE55XrRvg==
X-Gm-Gg: ASbGncvPNGmv0NSQDu7QLZSI05j8m5LvMLjcEkxyjZ0MyUx9tdXt6SxOrVtzeBIEU01
 QtuYCpxrZ1Y9F3SwDALEOhSGGIckd7v873MYBr2o20yS1OCPXTmn4rQTJ0VSh4ApkY7X76nIaD8
 r/Tbrb2Ww4h7p+0dLBkEI/TSRbQegmr9soLmjsHSwOQ/ZTlyxmBgwt//mofm1EpclllWTq1ISGu
 Td2jf+32J1hLc+/hvjK3MIIi9r+Erkwhp218MztyaoLoupQZEYIhZPR6fCvUrqmDeUirc1FjraV
 P2aNNxXEyeVu30D2PB4ZiYnqu1BZ7fF7qeLqNywwJUulZzmK/OW+ylUdD0Moe65EcxxyqJLX1wu
 K7MvYeOLxIvREwb1aB6l16ZTKGgBXsKEhEvClXCbA2UyTtw==
X-Received: by 2002:a05:6000:2387:b0:429:b751:7935 with SMTP id
 ffacd0b85a97d-429bd6b1fbemr11615930f8f.56.1762187436492; 
 Mon, 03 Nov 2025 08:30:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPB7L4RnPIaLDr20ydsswmq05dPX7C+uIKYMYA7+0CXCfUAlrAuaclnEPhp7aVaGqcJbCwOA==
X-Received: by 2002:a05:6000:2387:b0:429:b751:7935 with SMTP id
 ffacd0b85a97d-429bd6b1fbemr11615889f8f.56.1762187436060; 
 Mon, 03 Nov 2025 08:30:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c2e677csm163887905e9.3.2025.11.03.08.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 08:30:35 -0800 (PST)
Message-ID: <1d2570cc-02f4-41c5-ba5a-0ceca8a732e5@redhat.com>
Date: Mon, 3 Nov 2025 17:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/32] hw/arm/smmuv3-accel: Initialize shared system
 address space
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com, Peter Xu <peterx@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-7-skolothumtho@nvidia.com>
 <ea91137e-e5af-414b-86e2-2de7373bcb05@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ea91137e-e5af-414b-86e2-2de7373bcb05@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x6OYgwikWs6zGIRWBZ50YC7dbo5pSDiuKIpIn6q-GVE_1762187437
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



On 11/3/25 2:39 PM, Philippe Mathieu-Daudé wrote:
> Hi,
>
> On 31/10/25 11:49, Shameer Kolothum wrote:
>> To support accelerated SMMUv3 instances, introduce a shared system-wide
>> AddressSpace (shared_as_sysmem) that aliases the global system memory.
>> This shared AddressSpace will be used in a subsequent patch for all
>> vfio-pci devices behind all accelerated SMMUv3 instances within a VM.
>>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> ---
>>   hw/arm/smmuv3-accel.c | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>> index 99ef0db8c4..f62b6cf2c9 100644
>> --- a/hw/arm/smmuv3-accel.c
>> +++ b/hw/arm/smmuv3-accel.c
>> @@ -11,6 +11,15 @@
>>   #include "hw/arm/smmuv3.h"
>>   #include "smmuv3-accel.h"
>>   +/*
>> + * The root region aliases the global system memory, and
>> shared_as_sysmem
>> + * provides a shared Address Space referencing it. This Address
>> Space is used
>> + * by all vfio-pci devices behind all accelerated SMMUv3 instances
>> within a VM.
>> + */
>> +MemoryRegion root;
>> +MemoryRegion sysmem;
>
> Why can't we store that in SMMUv3State?
>
>> +static AddressSpace *shared_as_sysmem;

We will have several instances of SMMUv3State which all share the same
as, hence the choice of having a global.

Eric
>
> FYI we have object_resolve_type_unambiguous() to check whether an
> instance exists only once (singleton).
>
>> +
>>   static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs,
>> SMMUPciBus *sbus,
>>                                                  PCIBus *bus, int devfn)
>>   {
>> @@ -51,9 +60,27 @@ static const PCIIOMMUOps smmuv3_accel_ops = {
>>       .get_address_space = smmuv3_accel_find_add_as,
>>   };
>>   +static void smmuv3_accel_as_init(SMMUv3State *s)
>> +{
>> +
>> +    if (shared_as_sysmem) {
>> +        return;
>> +    }
>> +
>> +    memory_region_init(&root, OBJECT(s), "root", UINT64_MAX);
>> +    memory_region_init_alias(&sysmem, OBJECT(s), "smmuv3-accel-sysmem",
>> +                             get_system_memory(), 0,
>> +                             memory_region_size(get_system_memory()));
>> +    memory_region_add_subregion(&root, 0, &sysmem);
>> +
>> +    shared_as_sysmem = g_new0(AddressSpace, 1);
>> +    address_space_init(shared_as_sysmem, &root,
>> "smmuv3-accel-as-sysmem");
>> +}
>> +
>>   void smmuv3_accel_init(SMMUv3State *s)
>>   {
>>       SMMUState *bs = ARM_SMMU(s);
>>         bs->iommu_ops = &smmuv3_accel_ops;
>> +    smmuv3_accel_as_init(s);
>>   }
>


