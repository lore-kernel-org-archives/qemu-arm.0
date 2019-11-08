Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1844445wri;
        Thu, 7 Nov 2019 17:54:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwqea/oy2w8iiQoUWplpc7Km6cUnRCINCplSuWS0KqN9j8/6KiZ0s45wzdJm07zWqD4Z9TE
X-Received: by 2002:aed:3225:: with SMTP id y34mr7820801qtd.353.1573178077244;
        Thu, 07 Nov 2019 17:54:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573178077; cv=none;
        d=google.com; s=arc-20160816;
        b=gAFDGGnZyx/GmUFWOKL0S0eweGZV73aQZ/v7tv6g2zvZ0HSD0J1eNZEwQU27mQxy4N
         p2xDHDl2BYmlUUzWpXkwDc1DaT6ewajPyq8vLSWnhlpwfZwhz84CB3EwFQrwYxONPswZ
         uTMlzG3noNjFW0d9RKdviOTtNaSI2lX533K7fBmn0GRjD7s9yrJxuaFVobH6gU7lTqVs
         dd5jGfIOH5VbqrPOei0H66lxiWt4jEDPD9BUMMK49l9SpmyhBEIrWi/AuG85P57/qshy
         nhXM4jUScValtOsrl6RzHyFXKZYrMlIQX5++1RujW3bAk1qeHtHx/8FEfeIc315Ud3T1
         4Jww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=NynImZ17FAi4o/3Z9zNF1P6DHs5p5/WBnugBDlcheho=;
        b=xOzIavoOHYx6FbywV6tKZjvSWGsX8kLijSCdTiSK4LxDJLg2TMGmywKgNquob7bFxj
         bLJkTqkgKPRmzFPiBXGYg4MT6KncyXI7lFZHacwITkMw4Q+lJtdXPhpV0+6bp8ibPb/+
         KmkGLbc2j/05IFVmj+4OZco4A/5Q//2MDHWYhBUtzSFQJrV5WKUKc4cXN+R5cguA12CX
         +fJekyV87NJ6Co5pGcIrSDLAPFnpBflXRDccaFnUjhIHvdTlmRBjsvTE+mK/t0McVwwt
         XPUhN8KBNN+pmQFuAN/cB+J+0uQ9o6hKNUEvUJMV0u+Uj2UpED7x43mjbGuS6/T3hyjT
         sZ2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w128si2671624qkc.99.2019.11.07.17.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 17:54:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iStTw-0002vO-MF
	for alex.bennee@linaro.org; Thu, 07 Nov 2019 20:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iStTl-0002ux-Vy
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 20:54:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iStTk-0004Ay-Kb
 for qemu-arm@nongnu.org; Thu, 07 Nov 2019 20:54:25 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2198 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iStTk-00044h-92; Thu, 07 Nov 2019 20:54:24 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CC77A107FC70F11991A6;
 Fri,  8 Nov 2019 09:54:15 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Fri, 8 Nov 2019
 09:54:06 +0800
Subject: Re: [RFC v2 11/14] linux-headers/kvm.h: add capability to forward
 hypercall
To: Cornelia Huck <cohuck@redhat.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <20191105091056.9541-12-guoheyi@huawei.com>
 <20191106185524.0fe51c50.cohuck@redhat.com>
 <4dbcbd18-0e6c-f985-c36d-96df65331d11@huawei.com>
 <20191107035624-mutt-send-email-mst@kernel.org>
 <da720295-2a84-e38b-9828-5287daefcfa2@huawei.com>
 <20191107131210.26acf011.cohuck@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <3e0dc8b2-77dd-f37a-861b-fdd90134e880@huawei.com>
Date: Fri, 8 Nov 2019 09:54:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20191107131210.26acf011.cohuck@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yu1Ql+HjYU0S



On 2019/11/7 20:12, Cornelia Huck wrote:
> On Thu, 7 Nov 2019 19:57:22 +0800
> Guoheyi <guoheyi@huawei.com> wrote:
>
>> On 2019/11/7 16:57, Michael S. Tsirkin wrote:
>>> On Thu, Nov 07, 2019 at 09:44:36AM +0800, Guoheyi wrote:
>>>> On 2019/11/7 1:55, Cornelia Huck wrote:
>>>>> On Tue, 5 Nov 2019 17:10:53 +0800
>>>>> Heyi Guo <guoheyi@huawei.com> wrote:
>>>>>   
>>>>>> To keep backward compatibility, we add new KVM capability
>>>>>> "KVM_CAP_FORWARD_HYPERCALL" to probe whether KVM supports forwarding
>>>>>> hypercall to userspace.
>>>>>>
>>>>>> The capability should be enabled explicitly, for we don't want user
>>>>>> space application to deal with unexpected hypercall exits. After
>>>>>> enabling this cap, all HVC calls unhandled by kvm will be forwarded to
>>>>>> user space.
>>>>>>
>>>>>> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
>>>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>>>>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>>>>> Cc: Dave Martin <Dave.Martin@arm.com>
>>>>>> Cc: Marc Zyngier <marc.zyngier@arm.com>
>>>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>>>> Cc: James Morse <james.morse@arm.com>
>>>>>> ---
>>>>>>     linux-headers/linux/kvm.h |  1 +
>>>>>>     target/arm/sdei.c         | 16 ++++++++++++++++
>>>>>>     target/arm/sdei.h         |  2 ++
>>>>>>     3 files changed, 19 insertions(+)
>>>>>>
>>>>>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
>>>>>> index 3d9b18f7f8..36c9b3859f 100644
>>>>>> --- a/linux-headers/linux/kvm.h
>>>>>> +++ b/linux-headers/linux/kvm.h
>>>>>> @@ -1000,6 +1000,7 @@ struct kvm_ppc_resize_hpt {
>>>>>>     #define KVM_CAP_PMU_EVENT_FILTER 173
>>>>>>     #define KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 174
>>>>>>     #define KVM_CAP_HYPERV_DIRECT_TLBFLUSH 175
>>>>>> +#define KVM_CAP_FORWARD_HYPERCALL 176
>>>>>>     #ifdef KVM_CAP_IRQ_ROUTING
>>>>> Is this cap upstream already? I would have thought your header sync
>>>>> would have brought it in, then. (Saying this, that header sync looks
>>>>> awfully small.)
>>>>>
>>>>> If it is not upstream yet, please split off this hunk into a separate
>>>>> patch -- it's a bit annoying, but makes life easier for merging.
>>>> No, it is not upstream yet. The whole framework and interfaces between KVM
>>>> and qemu are still under discussion. I'll keep in mind of this when moving
>>>> forward to next steps...
>>>>
>>>> Thanks,
>>>> HG
>>> It's best to add it in some other place meanwhile.
>> Do you mean to split this patch from the whole patch set and send it
>> separately? Sorry I'm not clear about maintainers' work and may bring
>> you some trouble...
> My preferred approach:
>
> - add a commit entitled "placeholder for headers update" that contains
>    the not-yet-upstream changes in the header files you need
> - base the rest of your work on that
> ...
> <review happens, series looks good>
> ...
> - if kernel changes are upstream: replace the placeholder patch with a
>    real update (may include separate patches, if you need an additional
>    header); maintainer merges
> - if kernel changes are not yet upstream: maintainer merges with
>    placeholder to a feature branch, replaces with real update and merges
>    once kernel patches hit upstream
> (not every maintainer does the second approach; they may ask you
> instead to resend with a proper headers update once the kernel changes
> are upstream)

Thanks a lot. I'll do that in the next version.
HG

>
> .
>


