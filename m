Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2253327wre;
        Thu, 24 May 2018 12:54:21 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK74MbJSI7WWpaJCdMcaWhOv+vDJY4d4WGe2PcidOy6YKhV0gTn3OvUO6EeugeKcv+WNwnB
X-Received: by 2002:ac8:30c8:: with SMTP id w8-v6mr8347389qta.226.1527191661770;
        Thu, 24 May 2018 12:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527191661; cv=none;
        d=google.com; s=arc-20160816;
        b=cjs0h0ANT3c32qS5Z4sQpsiQ4haPpDPlrxcPOVZp83Snvl7PI1mfYdBY9hoZJBPERF
         Hham9fLTQpuAZoNJ7ET5Q2HkSLlGIY17dTjrKVB+e0LWFBiYmgSZtCg/WbUnkOwTG654
         P9yPX6BfNSm0RozGwR/oYduP58fFGrSZ5rgMdFnc97BOSF9ql5Jhk3HL+ptqD5RomNwm
         Wcs9yeIS5oNGKKXgjL0LJDsLqr3gfqMGaJZfmCEhhqgLvssay3BUdEA/CP12sgWwbz7V
         itqxktu9M5EsX03IMvDABZdyLPsoZCZnV/S4LPbdB565dNA8eQuclpPPY6xKUWvd8iVp
         MAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=Cru/PphX7pyszXgwrLpzjSShXyoGQcE0HRahQdCgvf0=;
        b=pAj+tNBeR1l8vpF77oTCifkjIVT1egUMmElqb5fKBWsu1k9BbBX4Fu/VZjsOzCCixp
         m0zrFL1QKekWOpw/kpvLjx3VduOi4fMmV1L9Qw1/64/9M+x6/8RR5SwaQxhHBfXpPm3p
         T57B1u+e0vqb9Q1UYyXhcIvfpVanL86kE4y1kjilshwHRgxdxE4qN/4BJAWoFqJfFfCc
         eePLeDKdOHTS37Xf9NNXgYXj3CTYZfIMakvF2CJ+a/4XgL4ZB1Mg5m7Ztt1OOJTqixN8
         gS5DPl0g9XkS5JAZfFx8Rjqf4vDXtkWdxvUamtwu858vCJedB9wSpN8Kn59EUJfOFvAn
         lEKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id l184-v6si5753873qkd.287.2018.05.24.12.54.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 May 2018 12:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B29FC12C3;
	Thu, 24 May 2018 19:54:21 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4B8B11166F0;
	Thu, 24 May 2018 19:54:19 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 17/27] exec.c: Handle IOMMUs in
 address_space_translate_for_iotlb()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-18-peter.maydell@linaro.org>
 <8736yivgw3.fsf@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f568933d-2d8c-da22-c588-3ca4d3140538@redhat.com>
Date: Thu, 24 May 2018 21:54:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8736yivgw3.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 24 May 2018 19:54:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 24 May 2018 19:54:21 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: Yi/tSsB/sTcd

Hi Peter,

On 05/23/2018 11:51 AM, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> Currently we don't support board configurations that put an IOMMU
>> in the path of the CPU's memory transactions, and instead just
>> assert() if the memory region fonud in address_space_translate_for_iotlb()
found
>> is an IOMMUMemoryRegion.
>>
>> Remove this limitation by having the function handle IOMMUs.
>> This is mostly straightforward, but we must make sure we have
>> a notifier registered for every IOMMU that a transaction has
>> passed through, so that we can flush the TLB appropriately
Can you elaborate on what (TCG) TLB we are talking about?

The concept of IOMMUs downstream to a CPU is not obvious to me. Maybe an
example may be documented in the commit message?
>> when any of the IOMMUs change their mappings.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  include/exec/exec-all.h |   3 +-
>>  include/qom/cpu.h       |   3 +
>>  accel/tcg/cputlb.c      |   3 +-
>>  exec.c                  | 147 +++++++++++++++++++++++++++++++++++++++-
>>  4 files changed, 152 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index 4d09eaba72..e0ff19b711 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -469,7 +469,8 @@ void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
>>
>>  MemoryRegionSection *
>>  address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
>> -                                  hwaddr *xlat, hwaddr *plen);
>> +                                  hwaddr *xlat, hwaddr *plen,
>> +                                  MemTxAttrs attrs, int *prot);
>>  hwaddr memory_region_section_get_iotlb(CPUState *cpu,
>>                                         MemoryRegionSection *section,
>>                                         target_ulong vaddr,
>> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
>> index 9d3afc6c75..d4a30149dd 100644
>> --- a/include/qom/cpu.h
>> +++ b/include/qom/cpu.h
>> @@ -429,6 +429,9 @@ struct CPUState {
>>      uint16_t pending_tlb_flush;
>>
>>      int hvf_fd;
>> +
>> +    /* track IOMMUs whose translations we've cached in the TCG TLB */
>> +    GSList *iommu_notifiers;
> 
> So we are only concerned about TCG IOMMU notifiers here, specifically
> TCGIOMMUNotifier structures. Why not just use a GArray and save
> ourselves chasing pointers?
> 
>>  };
>>
>>  QTAILQ_HEAD(CPUTailQ, CPUState);
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index 05439039e9..c8acaf21e9 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -632,7 +632,8 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>>      }
>>
>>      sz = size;
>> -    section = address_space_translate_for_iotlb(cpu, asidx, paddr, &xlat, &sz);
>> +    section = address_space_translate_for_iotlb(cpu, asidx, paddr, &xlat, &sz,
>> +                                                attrs, &prot);
>>      assert(sz >= TARGET_PAGE_SIZE);
>>
>>      tlb_debug("vaddr=" TARGET_FMT_lx " paddr=0x" TARGET_FMT_plx
>> diff --git a/exec.c b/exec.c
>> index c9285c9c39..6c8f2dcc3f 100644
>> --- a/exec.c
>> +++ b/exec.c
>> @@ -650,18 +650,158 @@ MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
>>      return mr;
>>  }
>>
>> +typedef struct TCGIOMMUNotifier {
>> +    IOMMUNotifier n;
>> +    MemoryRegion *mr;
>> +    CPUState *cpu;
> 
> This seems superfluous if we are storing the list of notifiers in the CPUState
> 
>> +    int iommu_idx;
>> +    bool active;
>> +} TCGIOMMUNotifier;
>> +
>> +static void tcg_iommu_unmap_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>> +{
>> +    TCGIOMMUNotifier *notifier = container_of(n, TCGIOMMUNotifier, n);
>> +
>> +    if (!notifier->active) {
>> +        return;
>> +    }
>> +    tlb_flush(notifier->cpu);
>> +    notifier->active = false;
>> +    /* We leave the notifier struct on the list to avoid reallocating it later.
>> +     * Generally the number of IOMMUs a CPU deals with will be small.
>> +     * In any case we can't unregister the iommu notifier from a notify
>> +     * callback.
>> +     */
I don't get the life cycle of the notifier and why it becomes inactive
after the invalidate. Could you detail the specificity of this one?
>> +}
>> +
>> +static gint tcg_iommu_find_notifier(gconstpointer a, gconstpointer b)
>> +{
>> +    TCGIOMMUNotifier *notifier = (TCGIOMMUNotifier *)a;
>> +    TCGIOMMUNotifier *seeking = (TCGIOMMUNotifier *)b;
>> +
>> +    if (notifier->mr == seeking->mr &&
>> +        notifier->iommu_idx == seeking->iommu_idx) {
>> +        return 0;
>> +    }
>> +    return 1;
>> +}
>> +
>> +static void tcg_register_iommu_notifier(CPUState *cpu,
>> +                                        IOMMUMemoryRegion *iommu_mr,
>> +                                        int iommu_idx)
>> +{
>> +    /* Make sure this CPU has an IOMMU notifier registered for this
>> +     * IOMMU/IOMMU index combination, so that we can flush its TLB
>> +     * when the IOMMU tells us the mappings we've cached have changed.
>> +     */
>> +    TCGIOMMUNotifier seeking = {
>> +        .mr = MEMORY_REGION(iommu_mr),
>> +        .iommu_idx = iommu_idx,
>> +    };
>> +    TCGIOMMUNotifier *notifier;
>> +    GSList *found = g_slist_find_custom(cpu->iommu_notifiers,
>> +                                        &seeking,
>> +                                        tcg_iommu_find_notifier);
>> +    if (found) {
>> +        notifier = found->data;
>> +    } else {
>> +        notifier = g_new0(TCGIOMMUNotifier, 1);
>> +        notifier->mr = seeking.mr;
>> +        notifier->iommu_idx = iommu_idx;
>> +        notifier->cpu = cpu;
>> +        /* Rather than trying to register interest in the specific part
>> +         * of the iommu's address space that we've accessed and then
>> +         * expand it later as subsequent accesses touch more of it, we
>> +         * just register interest in the whole thing, on the assumption
>> +         * that iommu reconfiguration will be rare.
>> +         */
>> +        iommu_notifier_init(&notifier->n,
>> +                            tcg_iommu_unmap_notify,
>> +                            IOMMU_NOTIFIER_UNMAP,
>> +                            0,
>> +                            HWADDR_MAX,
>> +                            iommu_idx);
>> +        memory_region_register_iommu_notifier(notifier->mr, &notifier->n);
>> +        cpu->iommu_notifiers = g_slist_prepend(cpu->iommu_notifiers,
>> +                                               notifier);
>> +    }
>> +    if (!notifier->active) {
>> +        notifier->active = true;
>> +    }
>> +}
>> +
>> +static void tcg_iommu_notifier_destroy(gpointer data)
>> +{
>> +    TCGIOMMUNotifier *notifier = data;
>> +
>> +    if (notifier->active) {
>> +        memory_region_unregister_iommu_notifier(notifier->mr, &notifier->n);
>> +    }
Is it safe to leave the notifier registered to an IOMMU whereas it gets
freed?

Thanks

Eric
>> +    g_free(notifier);
>> +}
>> +
>> +static void tcg_iommu_free_notifier_list(CPUState *cpu)
>> +{
>> +    /* Destroy the CPU's notifier list */
>> +    g_slist_free_full(cpu->iommu_notifiers, tcg_iommu_notifier_destroy);
>> +    cpu->iommu_notifiers = NULL;
>> +}
>> +
>>  /* Called from RCU critical section */
>>  MemoryRegionSection *
>>  address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
>> -                                  hwaddr *xlat, hwaddr *plen)
>> +                                  hwaddr *xlat, hwaddr *plen,
>> +                                  MemTxAttrs attrs, int *prot)
>>  {
>>      MemoryRegionSection *section;
>> +    IOMMUMemoryRegion *iommu_mr;
>> +    IOMMUMemoryRegionClass *imrc;
>> +    IOMMUTLBEntry iotlb;
>> +    int iommu_idx;
>>      AddressSpaceDispatch *d = atomic_rcu_read(&cpu->cpu_ases[asidx].memory_dispatch);
>>
>> -    section = address_space_translate_internal(d, addr, xlat, plen, false);
>> +    for (;;) {
>> +        section = address_space_translate_internal(d, addr, &addr, plen, false);
>> +
>> +        iommu_mr = memory_region_get_iommu(section->mr);
>> +        if (!iommu_mr) {
>> +            break;
>> +        }
>> +
>> +        imrc = memory_region_get_iommu_class_nocheck(iommu_mr);
>> +
>> +        iommu_idx = imrc->attrs_to_index(iommu_mr, attrs);
>> +        tcg_register_iommu_notifier(cpu, iommu_mr, iommu_idx);
>> +        /* We need all the permissions, so pass IOMMU_NONE so the IOMMU
>> +         * doesn't short-cut its translation table walk.
it is not clear to me why you don't use the access flag as you seem to
handle the perm fault after the translate() call.

Thanks

Eric
>> +         */
>> +        iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, iommu_idx);
>> +        addr = ((iotlb.translated_addr & ~iotlb.addr_mask)
>> +                | (addr & iotlb.addr_mask));
>> +        /* Update the caller's prot bits to remove permissions the IOMMU
>> +         * is giving us a failure response for. If we get down to no
>> +         * permissions left at all we can give up now.
>> +         */
>> +        if (!(iotlb.perm & IOMMU_RO)) {
>> +            *prot &= ~(PAGE_READ | PAGE_EXEC);
>> +        }
>> +        if (!(iotlb.perm & IOMMU_WO)) {
>> +            *prot &= ~PAGE_WRITE;
>> +        }
>> +
>> +        if (!*prot) {
>> +            goto translate_fail;
>> +        }
>> +
>> +        d = flatview_to_dispatch(address_space_to_flatview(iotlb.target_as));
>> +    }
>>
>>      assert(!memory_region_is_iommu(section->mr));
>> +    *xlat = addr;
>>      return section;
>> +
>> +translate_fail:
>> +    return &d->map.sections[PHYS_SECTION_UNASSIGNED];
>>  }
>>  #endif
>>
>> @@ -820,6 +960,9 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>>      if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
>>          vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
>>      }
>> +#ifndef CONFIG_USER_ONLY
>> +    tcg_iommu_free_notifier_list(cpu);
>> +#endif
>>  }
>>
>>  Property cpu_common_props[] = {
> 
> 
> --
> Alex Bennée
> 
