Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2847713wre;
        Fri, 25 May 2018 02:50:46 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIpVKEPoVCfu+0mM4MzsKVN/lcTF8qxSYhVpeTImfhQnYwrEL/qFc/mGAMavolDf5DAvdXn
X-Received: by 2002:a37:3c42:: with SMTP id j63-v6mr1264078qka.109.1527241846390;
        Fri, 25 May 2018 02:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527241846; cv=none;
        d=google.com; s=arc-20160816;
        b=SwcZccDr2gkulwNICBwP+xFvWUtoTY+SH3+FN1xKi5VKTdSYiUIzmTZRaPfgAC2doR
         ibpgcG/lUXwdbyN4IKErvr9PwuI6v0yfuAGnuZeJpX4kHKzhCtg5fobrWzJ9lyrFnp9A
         H6cTnILMW0MbkfciPoyN31w6BOLUZr5d3aS5M1vkGpu5lmHNIbA+GBJzt9benZ4Ckp9y
         W0PwqQW3tj0RCMD9l0xpqndOxUvBP8fRmmuIgTmj3Ch+kXsY6JZ9O855XIfiAHyQB7Lm
         CA5gGF3fzfFQUGl9sjzE2QGG6bt7DLrco/ERYIk/fKhOddpdHhga38UKSNPKRovjJvsf
         IsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=lJK8yXsoGIbVPosBa+wZ+mtp57nnDMqhrNvrT0Lk0Vo=;
        b=YFaADLxlljQh+RtAdN2sdr6vJu2Z+1jMHP4TBZwai9SQxY2GjvnOnWJYSYqb/Ds/Cl
         DbyZfxF4ZD4yeJxhfrX+JOGVxknNyqsONC51fK8uLCzeD0UKKNSL5/V2qC26mqVMDvCz
         tiqmQxOUsFRoXp8YfeZBRSs23ysZWRazwpI33xlfMa4hHskJMsDpWq748at4LYcy2KsE
         CuRZR/WZ62xXNd4x7+da8g/pPmFbj32ANG8hetfoTsu935LnTAnqsB+eIGWoyI7wuk2H
         J1ULto9gJdZs4kYJBD+lX5S87lTGFLIW2G2tvKfyZgpqG2GrIogs6GkLGq5Z9wHZd2Dx
         PYfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id n24-v6si1559386qkh.129.2018.05.25.02.50.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 May 2018 02:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CFB3440711E2;
	Fri, 25 May 2018 09:50:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1DB63F3E;
	Fri, 25 May 2018 09:50:44 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 17/27] exec.c: Handle IOMMUs in
 address_space_translate_for_iotlb()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-18-peter.maydell@linaro.org>
 <8736yivgw3.fsf@linaro.org> <f568933d-2d8c-da22-c588-3ca4d3140538@redhat.com>
 <CAFEAcA--wyed8qg=4P-DG9QyZe1eACWh+68g99Gowx71CFAh_w@mail.gmail.com>
Cc: "patches@linaro.org" <patches@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <e253665e-18db-49c7-afca-8284e975b80f@redhat.com>
Date: Fri, 25 May 2018 11:50:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--wyed8qg=4P-DG9QyZe1eACWh+68g99Gowx71CFAh_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Fri, 25 May 2018 09:50:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Fri, 25 May 2018 09:50:45 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: AKT3CqQ2FJH+

Hi Peter,

On 05/25/2018 10:52 AM, Peter Maydell wrote:
> On 24 May 2018 at 20:54, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi Peter,
>>
>> On 05/23/2018 11:51 AM, Alex Bennée wrote:
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> Currently we don't support board configurations that put an IOMMU
>>>> in the path of the CPU's memory transactions, and instead just
>>>> assert() if the memory region fonud in address_space_translate_for_iotlb()
>> found
>>>> is an IOMMUMemoryRegion.
>>>>
>>>> Remove this limitation by having the function handle IOMMUs.
>>>> This is mostly straightforward, but we must make sure we have
>>>> a notifier registered for every IOMMU that a transaction has
>>>> passed through, so that we can flush the TLB appropriately
>> Can you elaborate on what (TCG) TLB we are talking about?
> 
> The TCG TLB, as implemented in accel/tcg/cputlb.c. Basically
> the thing that caches the results it gets back from the memory
> system so it can fast path device and memory accesses.
> 
>> The concept of IOMMUs downstream to a CPU is not obvious to me. Maybe an
>> example may be documented in the commit message?
> 
> The MPC implemented in this patchset is an example.
> 
> 
> 
>>>> +static void tcg_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>>>> +{
>>>> +    TCGIOMMUNotifier *notifier = container_of(n, TCGIOMMUNotifier, n);
>>>> +
>>>> +    if (!notifier->active) {
>>>> +        return;
>>>> +    }
>>>> +    tlb_flush(notifier->cpu);
>>>> +    notifier->active = false;
>>>> +    /* We leave the notifier struct on the list to avoid reallocating it later.
>>>> +     * Generally the number of IOMMUs a CPU deals with will be small.
>>>> +     * In any case we can't unregister the iommu notifier from a notify
>>>> +     * callback.
>>>> +     */
>> I don't get the life cycle of the notifier and why it becomes inactive
>> after the invalidate. Could you detail the specificity of this one?
> 
> Once we've flushed the TLB it is empty and will have no cached
> information from the IOMMU. So there's no point in flushing the
> TLB again (which is expensive) until the next time a transaction
> goes through the IOMMU and we're caching something from it.
Ak OK. there is no finer granularity for TLB flush?

> 
> So the cycle goes:
>  * CPU makes transaction that goes through an IOMMU
>  * in tcg_register_iommu_notifier() we register the notifier
>    if we haven't already, and make sure it's got active = true
>  * in the unmap notify, we flush the whole TLB for the CPU, and
>    set active = false
>  * repeat...
OK thank you for the explanation
> 
> 
>>>> +static void tcg_iommu_notifier_destroy(gpointer data)
>>>> +{
>>>> +    TCGIOMMUNotifier *notifier = data;
>>>> +
>>>> +    if (notifier->active) {
>>>> +        memory_region_unregister_iommu_notifier(notifier->mr, &notifier->n);
>>>> +    }
>> Is it safe to leave the notifier registered to an IOMMU whereas it gets
>> freed?
> 
> Oh, this is a bug, left over from my first idea (which was to
> unregister the IOMMU notifier in the notifier unmap callback,
> in which case active == true would be the only case when we
> had a registered notifier).
> 
> We should unconditionally unregister the notifier here.
> 
> 
>>>>  /* Called from RCU critical section */
>>>>  MemoryRegionSection *
>>>>  address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
>>>> -                                  hwaddr *xlat, hwaddr *plen)
>>>> +                                  hwaddr *xlat, hwaddr *plen,
>>>> +                                  MemTxAttrs attrs, int *prot)
>>>>  {
>>>>      MemoryRegionSection *section;
>>>> +    IOMMUMemoryRegion *iommu_mr;
>>>> +    IOMMUMemoryRegionClass *imrc;
>>>> +    IOMMUTLBEntry iotlb;
>>>> +    int iommu_idx;
>>>>      AddressSpaceDispatch *d = atomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
>>>>
>>>> -    section = address_space_translate_internal(d, addr, xlat, plen, false);
>>>> +    for (;;) {
>>>> +        section = address_space_translate_internal(d, addr, &addr, plen, false);
>>>> +
>>>> +        iommu_mr = memory_region_get_iommu(section->mr);
>>>> +        if (!iommu_mr) {
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
>>>> +
>>>> +        iommu_idx = imrc->attrs_to_index(iommu_mr, attrs);
>>>> +        tcg_register_iommu_notifier(cpu, iommu_mr, iommu_idx);
>>>> +        /* We need all the permissions, so pass IOMMU_NONE so the IOMMU
>>>> +         * doesn't short-cut its translation table walk.
>> it is not clear to me why you don't use the access flag as you seem to
>> handle the perm fault after the translate() call.
> 
> We need to know all the permissions (because we'll cache the result
> in the TCG TLB and later use them for future read and write accesses),
> so we pass IOMMU_NONE.
> 
> My understanding from previous discussion is that the only
> reason to pass in some other access flag value is if you
> only care about one of read or write and want to allow the
> IOMMU to stop walking the page table early as soon as it decides
> it doesn't have permissions.

agreed. So you need to fetch the whole set of table permissions to
update the TLB. By the way where is the TLB updated?

Thanks

Eric
> 
> thanks
> -- PMM
> 
