Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp860486wri;
        Thu, 7 Nov 2019 03:57:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpjq2xjQf3a7XMvxQ90O3LoPAbsJz8kX3VindcqncPuoNIM5NqRFaACCQ9JsFs/0F2wKsB
X-Received: by 2002:a05:620a:90a:: with SMTP id v10mr2290786qkv.195.1573127869867;
        Thu, 07 Nov 2019 03:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573127869; cv=none;
        d=google.com; s=arc-20160816;
        b=zix36e/FQtpTvTdul9mC2iLs0H45cDcIeSA249L96oCUuPvfU4RyjTmunRd8IZk/Ox
         jVNPuMpoR9wCwWn+Q8ttuTQ9lgZX8yYRbyOP5NXVVzy29W2cL459DHQeaPHl0RDsrmXV
         xART1C/GuRehFKaiOc6/nhq8CJ0RKNamHJ/F89Qn5A2Pd+swO71mt1JSe7T81hX/jWMz
         OvbLHwMkKKx/ARFq5qXqHdzQI8tmPXzO3XRXrhF1xDl250F++qfYRvLYnKKyJqPIvtvR
         Cph/Vo9opttqqhqslm6ngkaW+9Y+jHroES7qSlaC2h4GM/dDQN2DDDX0r5gyMH1c/gv9
         1C4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=JnnDLttzHLpwMxaQ+0dMp7sILf4cUbDybYytJ5MiziU=;
        b=FlRobsFlnpcxudzYEqjnPTtb3IRR8TBunHZj1ru16beJ7qIXjjl2kuCUHXNaNHjYdx
         aqy1MB47hEmf5e86ohsj578iBjw8NDpTf0/3Hb10NEODdu8f/1RXWlFlpvTjmoRP0EHU
         oR45sV9eP9lQe37IQGiL1/F18hVVsgtohD7unU0TTuE9f7e6dT/HrvyudHivs+lOUda1
         QZQfzJR+7E3CIiT8yJI42mchgIalwCDiZODxnoSp2e3Q0IQwtMQGsKou9jNdTxip/G91
         ibr6EWzVfkxJ9y0DB4IZ4jnjaSa+VU/vsHleTK8GrCBKmRcdsTyEU3xKH38a4tNAiz0u
         QJ1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si912547qka.214.2019.11.07.03.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 03:57:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iSgQ9-0003aQ-5G
	for alex.bennee@linaro.org; Thu, 07 Nov 2019 06:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iSgQ0-0003V4-Sd
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 06:57:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iSgPy-0001Cd-EZ
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 06:57:40 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:48724 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iSgPy-000178-2k; Thu, 07 Nov 2019 06:57:38 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E310182D411826A41F90;
 Thu,  7 Nov 2019 19:57:31 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Thu, 7 Nov 2019
 19:57:23 +0800
Subject: Re: [RFC v2 11/14] linux-headers/kvm.h: add capability to forward
 hypercall
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <20191105091056.9541-12-guoheyi@huawei.com>
 <20191106185524.0fe51c50.cohuck@redhat.com>
 <4dbcbd18-0e6c-f985-c36d-96df65331d11@huawei.com>
 <20191107035624-mutt-send-email-mst@kernel.org>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <da720295-2a84-e38b-9828-5287daefcfa2@huawei.com>
Date: Thu, 7 Nov 2019 19:57:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20191107035624-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 James Morse <james.morse@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9cPxzqxr/IYo



On 2019/11/7 16:57, Michael S. Tsirkin wrote:
> On Thu, Nov 07, 2019 at 09:44:36AM +0800, Guoheyi wrote:
>>
>> On 2019/11/7 1:55, Cornelia Huck wrote:
>>> On Tue, 5 Nov 2019 17:10:53 +0800
>>> Heyi Guo <guoheyi@huawei.com> wrote:
>>>
>>>> To keep backward compatibility, we add new KVM capability
>>>> "KVM_CAP_FORWARD_HYPERCALL" to probe whether KVM supports forwarding
>>>> hypercall to userspace.
>>>>
>>>> The capability should be enabled explicitly, for we don't want user
>>>> space application to deal with unexpected hypercall exits. After
>>>> enabling this cap, all HVC calls unhandled by kvm will be forwarded to
>>>> user space.
>>>>
>>>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>> Cc: Dave Martin <Dave.Martin@arm.com>
>>>> Cc: Marc Zyngier <marc.zyngier@arm.com>
>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>> Cc: James Morse <james.morse@arm.com>
>>>> ---
>>>>    linux-headers/linux/kvm.h |  1 +
>>>>    target/arm/sdei.c         | 16 ++++++++++++++++
>>>>    target/arm/sdei.h         |  2 ++
>>>>    3 files changed, 19 insertions(+)
>>>>
>>>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>>>> index 3d9b18f7f8..36c9b3859f 100644
>>>> --- a/linux-headers/linux/kvm.h
>>>> +++ b/linux-headers/linux/kvm.h
>>>> @@ -1000,6 +1000,7 @@ struct kvm_ppc_resize_hpt {
>>>>    #define KVM_CAP_PMU_EVENT_FILTER 173
>>>>    #define KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 174
>>>>    #define KVM_CAP_HYPERV_DIRECT_TLBFLUSH 175
>>>> +#define KVM_CAP_FORWARD_HYPERCALL 176
>>>>    #ifdef KVM_CAP_IRQ_ROUTING
>>> Is this cap upstream already? I would have thought your header sync
>>> would have brought it in, then. (Saying this, that header sync looks
>>> awfully small.)
>>>
>>> If it is not upstream yet, please split off this hunk into a separate
>>> patch -- it's a bit annoying, but makes life easier for merging.
>> No, it is not upstream yet. The whole framework and interfaces between KVM
>> and qemu are still under discussion. I'll keep in mind of this when moving
>> forward to next steps...
>>
>> Thanks,
>> HG
> It's best to add it in some other place meanwhile.
Do you mean to split this patch from the whole patch set and send it 
separately? Sorry I'm not clear about maintainers' work and may bring 
you some trouble...

Thanks,
HG

> Then we can drop it when it's in an upstream header.
>
>
>>>
>>> .
>>>
> .
>


