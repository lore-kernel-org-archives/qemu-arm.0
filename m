Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E22CD3445
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 14:51:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLMXN-0005Xt-NY; Fri, 08 May 2026 10:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLMXM-0005WI-9X
 for qemu-arm@nongnu.org; Fri, 08 May 2026 10:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wLMXJ-0002e1-HA
 for qemu-arm@nongnu.org; Fri, 08 May 2026 10:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778251840;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ZqhMJcqTBnnL7yAVZBa5NsI+FR09BBSIY5USgYNuYY=;
 b=FhsncKIg6yB0PfMohgL6mZZtbwU3UZA5bMDHnGVEoHSElsmzQnxl6Ji6WbMvyG7JjTTb34
 TnbwmXHTBaap5FR42euaPoHs9CoB9HRdICim/yJPhLwXzdl7HCPtq+KlL8tKI+XScLUoeV
 coqiiXQzV+aokLonBwWKphoh8/E4Xeg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-eZp6EvSLNkybgtQYENSgpQ-1; Fri, 08 May 2026 10:50:39 -0400
X-MC-Unique: eZp6EvSLNkybgtQYENSgpQ-1
X-Mimecast-MFC-AGG-ID: eZp6EvSLNkybgtQYENSgpQ_1778251838
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43fe791a398so1768341f8f.0
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 07:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778251838; x=1778856638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ZqhMJcqTBnnL7yAVZBa5NsI+FR09BBSIY5USgYNuYY=;
 b=kpgU49mzL8aT/8r5zBuUHqkE4PIb0zipNQ9paslrN1vtIt5vH1RS41kwpruS1QGLCA
 nMPQNlSizQL0Gxk+rWst+9WnTg2snW8CDBmg00Lj6dG6NsOpBuivTmioIVfjfk2AAAN0
 ir92eGA3vN4nnvg5F77xWr5eRt0OuEzDMYUlkQx7qtjpr6fFacLDSwxFNKco67Fl/fl4
 Q4aKdoKwF2x/Y/oNMkaMFfF9gVHHsGLWTV/o0fKEAKwTpEUb3CmzExTBBIrbREzd1iIt
 s/J6angkBeSAKCDw+k/n52B3+bXGJnhKt5CzIFBjIyYtq5vFARxKnhuGtIodRmE6EB2Y
 uQLg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8E+T1uRn1w+W1QTOCsxN4ezUOYRfdnAx0UONpj0iF2KqsWTPwx+I3zdpMOmX9alKvCm/Y6tjP35g==@nongnu.org
X-Gm-Message-State: AOJu0YyipJcGBb5DivXFrHZiFcRSRvWBkde74xLfN2WxE/Y91d8uyRWN
 SpORXzKD3nnbOHXM7o2KIRMVIlmKWdKQQKZtkbGFRRvWcoQ89rMcLvf2S7LgwaqmEC5vBvLoPEC
 heYW31Xi6We5Ixrexw4t5WJBcQvyNn9mrpVpWYHbnLaWEgXy/vlG2KA==
X-Gm-Gg: Acq92OGJafs8czJOQaSdLuhgltfaXvyuZKMB1gU4HfL9zZFU7Em2lddVROUSMEvY/pU
 Ei0i4byKxQ7tqfJN1pASOS2FZOHlm2KGEZ2d+RSL1RqtzT9RyOkc4LZLlK3sD322GWtcz7KHPJC
 OOdRf09icpeqpJDK3kD0PQE9gHQsfRSOSfaGuSNqo9PwdLWc3GDirEG+1n+J2u8viwVlWxNPd8c
 BoYMYhD+kVkjqWiX7gZA1MKA+ZVmnIJf+Q/MQ4qHqAE2EPdDNQiEm8F1mL7qmhMu0BxachTQWxw
 pKpvlGf+MRY0bFgfYfUTmGyISVa+q+rmXfTOy4r/VbPWTex4RI/yr2SF8lWhITjAD6vJYi8tnht
 iND5nGtCFVFFdESWTxj14IS3oV6S5ZaeqUAmw1fogshCI+iRWacEfy5oZji8qdFXXjHk7SA==
X-Received: by 2002:a05:6000:2689:b0:44a:2555:f8a9 with SMTP id
 ffacd0b85a97d-4515b524014mr20455106f8f.10.1778251838035; 
 Fri, 08 May 2026 07:50:38 -0700 (PDT)
X-Received: by 2002:a05:6000:2689:b0:44a:2555:f8a9 with SMTP id
 ffacd0b85a97d-4515b524014mr20455049f8f.10.1778251837552; 
 Fri, 08 May 2026 07:50:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491ca2fd6sm5189193f8f.30.2026.05.08.07.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 07:50:37 -0700 (PDT)
Message-ID: <4338266c-1e99-4ee5-80d2-d85ae55c9daa@redhat.com>
Date: Fri, 8 May 2026 16:50:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/31] hw/arm/tegra241-cmdqv: Allocate HW VCMDQs on
 base register programming
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, "phrdina@redhat.com"
 <phrdina@redhat.com>
References: <20260415105552.622421-1-skolothumtho@nvidia.com>
 <20260415105552.622421-20-skolothumtho@nvidia.com>
 <103d06a5-3203-4545-b617-517f695eb751@redhat.com>
 <CH3PR12MB7548F9BC9DCCE1D5899EA168AB3E2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548F9BC9DCCE1D5899EA168AB3E2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cLYk06_LI-tOqk6MjPUsi0sDwDrbCEkwXDRQHZ-J1gY_1778251838
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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



On 5/5/26 4:26 PM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 05 May 2026 14:26
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nicolin
>> Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; jonathan.cameron@huawei.com;
>> zhenzhong.duan@intel.com; Krishnakant Jaju <kjaju@nvidia.com>;
>> phrdina@redhat.com
>> Subject: Re: [PATCH v4 19/31] hw/arm/tegra241-cmdqv: Allocate HW
>> VCMDQs on base register programming
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi,
>>
>> On 4/15/26 12:55 PM, Shameer Kolothum wrote:
>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>
>>> Add support for allocating IOMMUFD hardware queues when the guest
>>> programs the VCMDQ BASE registers.
>>>
>>> VCMDQ_EN is part of the VCMDQ_CONFIG register, which is accessed
>>> through the VINTF Page0 region. A subsequent patch maps this region
>>> directly into the guest address space, so QEMU does not trap writes
>>> to VCMDQ_CONFIG.
>>>
>>> Since VCMDQ_EN writes are not trapped, QEMU cannot allocate the
>>> hardware queue based on that bit. Instead, allocate the IOMMUFD
>>> hardware queue when the guest writes a VCMDQ BASE register with a
>>> valid RAM-backed address and when CMDQV and VINTF are enabled.
>>> If a hardware queue was previously allocated for the same VCMDQ,
>>> free it before reallocation.
>> the asymetric alloc/free sounds unusual. Are there other alternatives?
> Nothing that comes to my mind now. There is no "update hw_queue address"
> hence we have to free and allocate. May be we can add a small optimisation
> and skip free + alloc if the vcmdq_base[index] hasn't changed from
> previous alloc.

OK

Thanks

Eric
>
>>> Writes with invalid addresses are ignored.
>>>
>>> All allocated VCMDQs are freed when CMDQV or VINTF is disabled.
>>>
>>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/tegra241-cmdqv.h | 11 +++++++
>>>  hw/arm/tegra241-cmdqv.c | 70
>> +++++++++++++++++++++++++++++++++++++++--
>>>  2 files changed, 78 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/arm/tegra241-cmdqv.h b/hw/arm/tegra241-cmdqv.h
>>> index 88572ad939..039d86374f 100644
>>> --- a/hw/arm/tegra241-cmdqv.h
>>> +++ b/hw/arm/tegra241-cmdqv.h
>>> @@ -44,6 +44,7 @@ typedef struct Tegra241CMDQV {
>>>      MemoryRegion mmio_cmdqv;
>>>      qemu_irq irq;
>>>      IOMMUFDVeventq *veventq;
>>> +    IOMMUFDHWqueue *vcmdq[TEGRA241_CMDQV_MAX_CMDQ];
>>>      void *vintf_page0;
>>>
>>>      /* Register Cache */
>>> @@ -348,6 +349,16 @@ A_VI_VCMDQi_CONS_INDX_BASE_DRAM_L(1)
>>>  A_VI_VCMDQi_CONS_INDX_BASE_DRAM_H(0)
>>>  A_VI_VCMDQi_CONS_INDX_BASE_DRAM_H(1)
>>>
>>> +static inline bool tegra241_cmdq_enabled(Tegra241CMDQV *cmdqv)
>>> +{
>>> +    return cmdqv->status & R_STATUS_CMDQV_ENABLED_MASK;
>>> +}
>>> +
>>> +static inline bool tegra241_vintf_enabled(Tegra241CMDQV *cmdqv)
>>> +{
>>> +    return cmdqv->vintf_status & R_VINTF0_STATUS_ENABLE_OK_MASK;
>>> +}
>>> +
>>>  const SMMUv3AccelCmdqvOps *tegra241_cmdqv_get_ops(void);
>>>
>>>  #endif /* HW_ARM_TEGRA241_CMDQV_H */
>>> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
>>> index cdd941cec9..b5f2f74cf2 100644
>>> --- a/hw/arm/tegra241-cmdqv.c
>>> +++ b/hw/arm/tegra241-cmdqv.c
>>> @@ -15,6 +15,66 @@
>>>  #include "tegra241-cmdqv.h"
>>>  #include "trace.h"
>>>
>>> +static void tegra241_cmdqv_free_vcmdq(Tegra241CMDQV *cmdqv, int
>> index)
>>> +{
>>> +    IOMMUFDViommu *viommu = cmdqv->s_accel->viommu;
>>> +    IOMMUFDHWqueue *vcmdq = cmdqv->vcmdq[index];
>>> +
>>> +    if (!vcmdq) {
>>> +        return;
>>> +    }
>>> +    iommufd_backend_free_id(viommu->iommufd, vcmdq->hw_queue_id);
>>> +    g_free(vcmdq);
>>> +    cmdqv->vcmdq[index] = NULL;
>>> +}
>>> +
>>> +static void tegra241_cmdqv_free_all_vcmdq(Tegra241CMDQV *cmdqv)
>>> +{
>>> +    /* Free in reverse order to avoid "resource busy" error */
>> can you provide additional details about the above problematic. Is it
>> documented in the spec?
> See p.176:
>
> Deallocate a VCMDQ from a Virtual Interface 
>     Logical CMDQ being deallocated for a Guest must be in decreasing order
>     starting from the highest numbered LVCMDQ.
>
>>> +    for (int i = (TEGRA241_CMDQV_MAX_CMDQ - 1); i >= 0; i--) {
>>> +        tegra241_cmdqv_free_vcmdq(cmdqv, i);
>>> +    }
>>> +}
>>> +
>>> +static bool tegra241_cmdqv_setup_vcmdq(Tegra241CMDQV *cmdqv, int
>> index,
>>> +                                       Error **errp)
>>> +{
>>> +    SMMUv3AccelState *accel = cmdqv->s_accel;
>>> +    uint64_t base_mask = (uint64_t)R_VCMDQ0_BASE_L_ADDR_MASK |
>>> +                         (uint64_t)R_VCMDQ0_BASE_H_ADDR_MASK << 32;
>>> +    uint64_t addr = cmdqv->vcmdq_base[index] & base_mask;
>>> +    uint64_t log2 = cmdqv->vcmdq_base[index] &
>> R_VCMDQ0_BASE_L_LOG2SIZE_MASK;
>>> +    uint64_t size = 1ULL << (log2 + 4);
>>> +    IOMMUFDViommu *viommu = accel->viommu;
>>> +    IOMMUFDHWqueue *hw_queue;
>>> +    uint32_t hw_queue_id;
>>> +
>>> +    /* Ignore any invalid address. This may come as part of reset etc. */
>>> +    if (!address_space_is_ram(&address_space_memory, addr) ||
>>> +        !address_space_is_ram(&address_space_memory, addr + size - 1)) {
>> this check looks a little bit risky, no? Don't we have a better way to
>> test the address has been properly set?
> I think eventually kernel will handle any attempt to use an invalid address
> through IOMMU_HW_QUEUE_ALLOC IOCTL:
>      iommufd_hw_queue_alloc_phys()/iommufd_access_pin_pages() etc.
>
> Any attempt to pass an invalid address will return error, I think.
>
> @Nicolin, is that a safe assumption to make?
>
>>> +        return true;
>>> +    }
>>> +
>>> +    if (!tegra241_cmdq_enabled(cmdqv) ||
>> !tegra241_vintf_enabled(cmdqv)) {
>>> +        return true;
>>> +    }
>>> +
>>> +    tegra241_cmdqv_free_vcmdq(cmdqv, index);
>> would deserve a comment also here.
> Sure.
>
> Thanks,
> Shameer


