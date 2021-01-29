Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1077088lfo;
        Fri, 29 Jan 2021 04:18:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzyTuAH8zPoAlDuK0NHDYiSxIYJOcRkAtzF8Zpq28AQpYXmXiCF0Xza8bu/OUbtjmnuDfx
X-Received: by 2002:a5b:b51:: with SMTP id b17mr2557735ybr.169.1611922731018;
        Fri, 29 Jan 2021 04:18:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611922731; cv=none;
        d=google.com; s=arc-20160816;
        b=ehrEGXC+d+Xw28SgAoEK8Z1D69ubhJ7+XPDlb3q2drBIGSrAkU5Q8LY9Fatny1Ct8D
         SjTUN4JeqxeZ9gTczrPx9Z9G38AAgFMjobXIl1MV3sYwMqNWOogSKC3e4ex/zJvL5ZP7
         u2VQs+NxNSWqW1u4pypC+Ez6eDbVrDp7bng1MsKrnfP9IZt9JmD59EterYEuffpXIC79
         iXLAYcSQGA7KqPHvx4WSkhMa8r9p71z5E2oEbKRZjrxNdhfFGQh/w7WbBhact6tYjGH3
         fvXbGzZcMt99cj2XLnqUeDQpMzf6BnzR5OP+tLw0R3K/iHyrXl7BiHzBilp7N/Wu50ad
         rHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=MDVrmTV5RP90aq1odTKVAtpSv0Ygcr+hk3xFe/ghtC4=;
        b=I0uXusnE879/MtXXxHjqWjUczYZmi0miIu95e+JCiRbGpAzNg5VGvRFEH8zBdMrzbT
         V7yGBMyLR9GQMiytt720yJNMPFw1UoBITVTpZqKLn/73nEiJ8xdwVchqGs2SmFTR1hM4
         VPoft0WUWbPmLHe+vMldSSdVg5dLQ7h3d89Zp9oporqDucMMp1aIT+oHUdudA0M/gCOG
         PUqefWHozjfSPyQBB0c5t1nsV6z4BKZisE1XDmpjdba9DtB0TWu8zrQ4MQT38nvsYQLV
         n9G5yYLRbly6YspoxDzI1L6c+wPg2471Q543nobiHadLagluuj5qYl8HWZwe9q8Ma/aS
         w04g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si1530331ybo.67.2021.01.29.04.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 04:18:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5Sji-0001Nv-DG
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 07:18:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1l5ShJ-0008T7-B4; Fri, 29 Jan 2021 07:16:21 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1l5ShA-0004yB-VC; Fri, 29 Jan 2021 07:16:21 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DRx9T5rBwzjDyZ;
 Fri, 29 Jan 2021 20:14:53 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Fri, 29 Jan 2021 20:15:47 +0800
Subject: Re: [PATCH] hw/arm/smmuv3: Fix addr_mask for range-based invalidation
To: Auger Eric <eric.auger@redhat.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
References: <20201225095015.609-1-yuzenghui@huawei.com>
 <4e114709-e5c2-1860-c760-c05aa3ed5388@redhat.com>
 <45f3334d-f0b4-9a40-1bd1-78bd04735eaf@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <aca67ce0-5e26-a0cf-1c31-4b08694afda4@huawei.com>
Date: Fri, 29 Jan 2021 20:15:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <45f3334d-f0b4-9a40-1bd1-78bd04735eaf@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yuzenghui@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a9/rkPKwLd9z

Hi Eric,

On 2021/1/29 5:30, Auger Eric wrote:
> Hi Zenghui,
> 
> On 1/28/21 9:25 AM, Auger Eric wrote:
>> Hi Zenghui,
>>
>> On 12/25/20 10:50 AM, Zenghui Yu wrote:
>>> When performing range-based IOTLB invalidation, we should decode the TG
>>> field into the corresponding translation granule size so that we can pass
>>> the correct invalidation range to backend. Set @granule to (tg * 2 + 10) to
>>> properly emulate the architecture.
>>>
>>> Fixes: d52915616c05 ("hw/arm/smmuv3: Get prepared for range invalidation")
>>> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
>>
>> Good catch! I tested with older guest kernels though. I wonder how I did
>> not face the bug?
> Please ignore this wrong comment as this corresponds to recent kernels
> instead. Still puzzled anyway ;-)

I noticed this when looking through your nested SMMU series and I didn't
have much clue about the impact on the real setups.

I guess we may receive some unexpected fault events with this bug. But I
think we may miss it for some reasons:

  - the stale TLB entries happen to be evicted due to heavy traffic
  - some form of over-invalidation is performed by your implementation
  - ...

>>> ---
>>>   hw/arm/smmuv3.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index bbca0e9f20..65231c7d52 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -801,7 +801,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>>>   {
>>>       SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
>>>       IOMMUTLBEvent event;
>>> -    uint8_t granule = tg;
>>> +    uint8_t granule;
>>>   
>>>       if (!tg) {
>>>           SMMUEventInfo event = {.inval_ste_allowed = true};
>>> @@ -821,6 +821,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>>>               return;
>>>           }
>>>           granule = tt->granule_sz;
>>> +    } else {
>>> +        guanule = tg * 2 + 10;
>> maybe just init granule to this value above while fixing the typo.

My intention is to initialize @granule to this value explicitly for the
range-based invalidation case. But I'm okay with either way.


Thanks,
Zenghui
