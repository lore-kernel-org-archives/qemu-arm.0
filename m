Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2804978wre;
        Fri, 25 May 2018 01:52:32 -0700 (PDT)
X-Received: by 2002:a9d:32b:: with SMTP id 40-v6mr1008090otv.211.1527238352464;
        Fri, 25 May 2018 01:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527238352; cv=none;
        d=google.com; s=arc-20160816;
        b=pGdcEgH6Z8cANBW7t3ZklPTGhPtdVV/7+BNKdNKiv3YNGWdLR0vMwvIy/crzOXu3lt
         LArbuI+mpF5TRZjbRGPlOyRZ4addCNzxAOQ3uEy5MFeqA+sHKhy9wQnDY8zR3x6mLfTL
         daCu4mQdKLemvoXJJCnXHx6/rxiAKZQ8wYQwM/zbNflhutAVoptqRniftd8n2O2OupgR
         umoevy9y3srYOI8CPcLsyMNbj3xdEC0SW/3mbzpTsv8CqkRYsFxGtbR7rMGwqFiFFrZt
         ekykfJJOyM1Q5OuFFlRePAvVaGYRWLwFfzTUfc83CPM0jiJ2ZgBB1gVa9+KkbqqtneYt
         oO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=soLLhNOTc7ixRp2YJAwNxE1KJK4mv+xZjIyUYNaVNzM=;
        b=0Sa2TWhDbxKInCEE+hxa9mr6kr7lbbp/vcanhPTJGIZeZZkvKcxspRPUnGenFmKIo5
         LwnIW0I+19T7tl6JCztHgtyQUjXZlZuu9CEhnbu7cQ1QyZ2ZtE9VEv3nP2vhgu0zNWbD
         q8L5CVRWkdqr3fdS2wNebSsCuV0h251kWgIKVeWMMcb+IOVnm2vsnvIlMvDZ9Dl6clMY
         SZiyPApJAPJ2CO+k/2CrrnPKGpY+QeKmLYPGPiRj1Y5CM0xgVS/04Z8x/sa3swkx33xR
         xhwgJC0q6bxbw51332FpI4n9VOc7mmq8YDUEh8tilgH7lFNu+mjoxUnggXBYpSmsn/LQ
         wvvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7ZY98xA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 12-v6sor10882479oir.142.2018.05.25.01.52.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 May 2018 01:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e7ZY98xA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=soLLhNOTc7ixRp2YJAwNxE1KJK4mv+xZjIyUYNaVNzM=;
        b=e7ZY98xA8OWZn81awRa9JJq76AwKT3R8rbGKWxRka9sZizR1gRnFrb+1T/zedkg4JM
         0L0Rzq9wmFpY09pEpelfGPiU4NMcd4rh+PPkLEjBEwp98sD7+7yg1nj3nd929Skc+ZYj
         37uGqVa1a8L94758hV8+lfIj+1y3DbtcrGNcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=soLLhNOTc7ixRp2YJAwNxE1KJK4mv+xZjIyUYNaVNzM=;
        b=s1ipN74Hdj+aDh0+JMIKqBOkYgxs7AssDTphN0XF1t47PT6R7hYrEqyXmSRlRjU+Tv
         eIgXYQcKjBOe3W8itPqN36im157v5JrWtpl7GNtXnJhmCSds5zMWKOTNTmElmxnYsYNM
         OiTKYy9iVXuzJshk+YsmzUEKZrCSGKP+DfVkIHQUbRUv/s54aZBUxsC9Wxf6JSxs2xF1
         BnArFFjfximkdLf+2hIU3C5fGDVqyTXA6NSneaJNsSNkmndwfSLElw+l03fJuU7pQBMt
         J5SqUK5HDtg7iwFsYh2/WRRMgD6ZpTmLln6OcPtKZrbdoGb9dIC8yM+PkZTxgPrb2Svd
         WjFA==
X-Gm-Message-State: ALKqPwdTNaw6uwhPWkC1VB4Fyv3E9W9xOd+0VuJX6VbtdNgeTnHD2QCf
	Eshn3tFQxdv+SsRh4Y3GdRUxFUcKoTYfRWjM3nll/n+O
X-Google-Smtp-Source: ADUXVKJ9igpgiUrIbUVEUrdnOkxI4uOdkeLb8DpGDznPzOCtRkRmRQEymkD0GNr9cNzuh52Xh2mi9rlx5PhKT5xSGMY=
X-Received: by 2002:aca:d447:: with SMTP id l68-v6mr850634oig.102.1527238352021;
 Fri, 25 May 2018 01:52:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 25 May 2018 01:52:11
 -0700 (PDT)
In-Reply-To: <f568933d-2d8c-da22-c588-3ca4d3140538@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-18-peter.maydell@linaro.org> <8736yivgw3.fsf@linaro.org>
 <f568933d-2d8c-da22-c588-3ca4d3140538@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 May 2018 09:52:11 +0100
Message-ID: <CAFEAcA--wyed8qg=4P-DG9QyZe1eACWh+68g99Gowx71CFAh_w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 17/27] exec.c: Handle IOMMUs in address_space_translate_for_iotlb()
To: Auger Eric <eric.auger@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 38YxIq5AgQqV

On 24 May 2018 at 20:54, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 05/23/2018 11:51 AM, Alex Benn=C3=A9e wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> Currently we don't support board configurations that put an IOMMU
>>> in the path of the CPU's memory transactions, and instead just
>>> assert() if the memory region fonud in address_space_translate_for_iotl=
b()
> found
>>> is an IOMMUMemoryRegion.
>>>
>>> Remove this limitation by having the function handle IOMMUs.
>>> This is mostly straightforward, but we must make sure we have
>>> a notifier registered for every IOMMU that a transaction has
>>> passed through, so that we can flush the TLB appropriately
> Can you elaborate on what (TCG) TLB we are talking about?

The TCG TLB, as implemented in accel/tcg/cputlb.c. Basically
the thing that caches the results it gets back from the memory
system so it can fast path device and memory accesses.

> The concept of IOMMUs downstream to a CPU is not obvious to me. Maybe an
> example may be documented in the commit message?

The MPC implemented in this patchset is an example.



>>> +static void tcg_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *io=
tlb)
>>> +{
>>> +    TCGIOMMUNotifier *notifier =3D container_of(n, TCGIOMMUNotifier, n=
);
>>> +
>>> +    if (!notifier->active) {
>>> +        return;
>>> +    }
>>> +    tlb_flush(notifier->cpu);
>>> +    notifier->active =3D false;
>>> +    /* We leave the notifier struct on the list to avoid reallocating =
it later.
>>> +     * Generally the number of IOMMUs a CPU deals with will be small.
>>> +     * In any case we can't unregister the iommu notifier from a notif=
y
>>> +     * callback.
>>> +     */
> I don't get the life cycle of the notifier and why it becomes inactive
> after the invalidate. Could you detail the specificity of this one?

Once we've flushed the TLB it is empty and will have no cached
information from the IOMMU. So there's no point in flushing the
TLB again (which is expensive) until the next time a transaction
goes through the IOMMU and we're caching something from it.

So the cycle goes:
 * CPU makes transaction that goes through an IOMMU
 * in tcg_register_iommu_notifier() we register the notifier
   if we haven't already, and make sure it's got active =3D true
 * in the unmap notify, we flush the whole TLB for the CPU, and
   set active =3D false
 * repeat...


>>> +static void tcg_iommu_notifier_destroy(gpointer data)
>>> +{
>>> +    TCGIOMMUNotifier *notifier =3D data;
>>> +
>>> +    if (notifier->active) {
>>> +        memory_region_unregister_iommu_notifier(notifier->mr, &notifie=
r->n);
>>> +    }
> Is it safe to leave the notifier registered to an IOMMU whereas it gets
> freed?

Oh, this is a bug, left over from my first idea (which was to
unregister the IOMMU notifier in the notifier unmap callback,
in which case active =3D=3D true would be the only case when we
had a registered notifier).

We should unconditionally unregister the notifier here.


>>>  /* Called from RCU critical section */
>>>  MemoryRegionSection *
>>>  address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr add=
r,
>>> -                                  hwaddr *xlat, hwaddr *plen)
>>> +                                  hwaddr *xlat, hwaddr *plen,
>>> +                                  MemTxAttrs attrs, int *prot)
>>>  {
>>>      MemoryRegionSection *section;
>>> +    IOMMUMemoryRegion *iommu_mr;
>>> +    IOMMUMemoryRegionClass *imrc;
>>> +    IOMMUTLBEntry iotlb;
>>> +    int iommu_idx;
>>>      AddressSpaceDispatch *d =3D atomic_rcu_read(&cpu->cpu_ases[asidx].=
memory_dispatch);
>>>
>>> -    section =3D address_space_translate_internal(d, addr, xlat, plen, =
false);
>>> +    for (;;) {
>>> +        section =3D address_space_translate_internal(d, addr, &addr, p=
len, false);
>>> +
>>> +        iommu_mr =3D memory_region_get_iommu(section->mr);
>>> +        if (!iommu_mr) {
>>> +            break;
>>> +        }
>>> +
>>> +        imrc =3D memory_region_get_iommu_class_nocheck(iommu_mr);
>>> +
>>> +        iommu_idx =3D imrc->attrs_to_index(iommu_mr, attrs);
>>> +        tcg_register_iommu_notifier(cpu, iommu_mr, iommu_idx);
>>> +        /* We need all the permissions, so pass IOMMU_NONE so the IOMM=
U
>>> +         * doesn't short-cut its translation table walk.
> it is not clear to me why you don't use the access flag as you seem to
> handle the perm fault after the translate() call.

We need to know all the permissions (because we'll cache the result
in the TCG TLB and later use them for future read and write accesses),
so we pass IOMMU_NONE.

My understanding from previous discussion is that the only
reason to pass in some other access flag value is if you
only care about one of read or write and want to allow the
IOMMU to stop walking the page table early as soon as it decides
it doesn't have permissions.

thanks
-- PMM
