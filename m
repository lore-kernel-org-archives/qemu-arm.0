Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DB5CAC5B8
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 12:32:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4ITB-0002UI-Dq; Thu, 02 Oct 2025 08:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v4IT9-0002TH-Gg
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 08:31:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v4IT0-0007EC-Rg
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 08:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759408281;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wrhx+c8cXyNJc24eBerjkENL7JP60Ne6Fu4Cxd3+zwM=;
 b=DyDbJSv6JeYPkmpYpwUcGzN37HPtQAtOyF/klpwxGIVr3XE7k4WGPTks1AeOya91+gG7tb
 Bf8vMMpwa+WiRCP9ysvazI7owxiKSqec7Kg3rcxKA5dC8z5dTo9JspHCidujkoK0m5spuz
 Vss7MH5Ko8nL1H6TnyLo7WylQk/g5j4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-Kqgly6MMPHurOIs4QnDbHA-1; Thu, 02 Oct 2025 08:31:18 -0400
X-MC-Unique: Kqgly6MMPHurOIs4QnDbHA-1
X-Mimecast-MFC-AGG-ID: Kqgly6MMPHurOIs4QnDbHA_1759408277
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3ecdfe971abso1183021f8f.2
 for <qemu-arm@nongnu.org>; Thu, 02 Oct 2025 05:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759408277; x=1760013077;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wrhx+c8cXyNJc24eBerjkENL7JP60Ne6Fu4Cxd3+zwM=;
 b=p9tcXfxFkQE2GZsAL3m0Pq5apY31LPdri2zdv85OYrTKq06Mc4n/dFmFxWcoOlgtbf
 GeSxXvSTWsNO5EZEtIrqfVpNl1QxzNirMt1p3KW2EV/QGJnPDGerQAy0174fMz1MRK9b
 z3RZMN/ZfB1ZBM4PvN9j7r1vOtJAOBvzPNfE+cBbwl84/VF7yPLpJTn2ela9H2R5j+oL
 yI6RySof6rOcX/lhhdiP4C7IgH/n50tFfut96SO4fVykIDd/EU5BjKGjCt5pqQdtaFT1
 BFAWcRmoZEylzJJ7KoZ1Pd+/6itZNMRsrlR40BS7V0wQ8GBBA5yE0yXKg4p7VD2/YGqY
 2caQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2KvVDJf/KAEh8PAkFAkWZK7eHirCsUBeONxzgsMVPqnl2KUcTn4A1SS1kq8FeB941FP0dWGAk+Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx2w10sDR1w0h274FfgfP4CSV0VWMquSkAcdXeLvuDvDkJ6oNdf
 ZbEx7HTdiC0CxtihuXkffxOqT77Ml+s0Qa8LrYGGm1BcXBKWypluiOHWS2yJ7VveiC58I0oQfbl
 dE83HEte/qXiToXbUIDytSFzgPRIH2cXzmuaSxrW1kfb6LtpT3vQ7vg==
X-Gm-Gg: ASbGncur4gYMdcaQuQVfxHQVdB06/CHX8+dS4QyEIKtaDHPsPPB3MMb6CtfLl+Hg6lz
 0NVM9wQyBrhXqiUYjnXBCDt7XdfXSb1QgPCyd1YX0p8ISqeMRGn5luGRlp+o0iZOwoajcrRy/vD
 IkRsJUDBYEJsLRhRVQc/tuE4JVNalU9ZSDKv52sAVpUKBI8m9NvT1s7IQ+j65kOzpYWFb5aF1Lh
 LU1OryeFrrQ+R9Lfa3GVJnDyjbdDxvs6ZZqJRcTyoiw36NInHRTO2vZWzV+7Pmhb+kSd3NruZ5p
 7wUR2C+QLpZXL6c5ADlOk9DhpQYWJTYMkjWBmeevtnYcnQLodwc75+BQRBH6uNG0jCjU5gWx2f4
 SieSKaug3JL5SCoRJ
X-Received: by 2002:a05:6000:18a5:b0:3ea:a694:ae0a with SMTP id
 ffacd0b85a97d-42557809256mr5333939f8f.48.1759408277128; 
 Thu, 02 Oct 2025 05:31:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgob2sMraRO7AkhngrbMkpa7zQvLNB5+limVLXhcRZGHfJwOuhD4JKgRN3xBqh6BJ7CbvnVQ==
X-Received: by 2002:a05:6000:18a5:b0:3ea:a694:ae0a with SMTP id
 ffacd0b85a97d-42557809256mr5333912f8f.48.1759408276705; 
 Thu, 02 Oct 2025 05:31:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f4ab0sm3412107f8f.52.2025.10.02.05.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 05:31:15 -0700 (PDT)
Message-ID: <da1dc832-5a45-4ea3-8aaf-021b2eb32d06@redhat.com>
Date: Thu, 2 Oct 2025 14:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/27] hw/arm/smmuv3: Implement get_viommu_cap()
 callback
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "shameerkolothum@gmail.com" <shameerkolothum@gmail.com>
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-8-skolothumtho@nvidia.com>
 <55de40c2-7d33-4806-8eb0-e4dde8d0c84f@redhat.com>
 <CH3PR12MB75488A0A98B26690D5A573B5ABE7A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75488A0A98B26690D5A573B5ABE7A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jbE26rYB9QSnqsHugkZDulttzJb8QXLDxEdtGk9Syww_1759408277
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.451,
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



On 10/2/25 11:38 AM, Shameer Kolothum wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 01 October 2025 18:37
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> shameerkolothum@gmail.com
>> Subject: Re: [PATCH v4 07/27] hw/arm/smmuv3: Implement
>> get_viommu_cap() callback
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 9/29/25 3:36 PM, Shameer Kolothum wrote:
>>> For accelerated SMMUv3, we need nested parent domain creation. Add the
>>> callback support so that VFIO can create a nested parent.
>>>
>>> In the accelerated SMMUv3 case, the host SMMUv3 is configured in nested
>>> mode (S1 + S2), and the guest owns the Stage-1 page table. Therefore, we
>>> expose only Stage-1 to the guest to ensure it uses the correct page-table
>>> format.
>>>
>>> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Signed-off-by: Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>> Wonder if you shall keep both. I don't know the usage though but worth
>> to check.
> Hmm.. I don't know either for sure. What I followed here(I will double check)
> is all the patches I had previously(v3) I kept all the S-by tags. That seems to be
> a right thing to do and IIRC I have seen that previously as well.
>
>>> ---
>>>  hw/arm/smmuv3-accel.c | 13 +++++++++++++
>>>  hw/arm/virt.c         | 13 +++++++++++++
>>>  2 files changed, 26 insertions(+)
>>>
>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>>> index 44410cfb2a..6b0e512d86 100644
>>> --- a/hw/arm/smmuv3-accel.c
>>> +++ b/hw/arm/smmuv3-accel.c
>>> @@ -10,6 +10,7 @@
>>>  #include "qemu/error-report.h"
>>>
>>>  #include "hw/arm/smmuv3.h"
>>> +#include "hw/iommu.h"
>>>  #include "hw/pci/pci_bridge.h"
>>>  #include "hw/pci-host/gpex.h"
>>>  #include "hw/vfio/pci.h"
>>> @@ -106,8 +107,20 @@ static AddressSpace
>> *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
>>>      }
>>>  }
>>>
>>> +static uint64_t smmuv3_accel_get_viommu_flags(void *opaque)
>>> +{
>>> +    /*
>>> +     * We return VIOMMU_FLAG_WANT_NESTING_PARENT to inform VFIO
>> core to create a
>>> +     * nesting parent which is required for accelerated SMMUv3 support.
>>> +     * The real HW nested support should be reported from host SMMUv3
>> and if
>>> +     * it doesn't, the nesting parent allocation will fail anyway in VFIO core.
>>> +     */
>>> +    return VIOMMU_FLAG_WANT_NESTING_PARENT;
>>> +}
>>> +
>>>  static const PCIIOMMUOps smmuv3_accel_ops = {
>>>      .get_address_space = smmuv3_accel_find_add_as,
>>> +    .get_viommu_flags = smmuv3_accel_get_viommu_flags,
>>>  };
>>>
>>>  void smmuv3_accel_init(SMMUv3State *s)
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 02209fadcf..b533b0556e 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -3073,6 +3073,19 @@ static void
>> virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>>>                  return;
>>>              }
>>>
>>> +            if (object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {
>> This looks unrelated to the get_viommu_flags() addition and to me this
>> shall be put in a separate patch of squashed in the patch that exposes
>> the accel prop Thanks Eric
> But my thought process was, without this we can't say the vIOMMU will support
> the nesting parent. But then the flag seems to be indicating that vIOMMU "want"
> nesting parent. So I guess we can move it for later.
Yes that's my understanding too

Eric
>
> Thanks,
> Shameer


