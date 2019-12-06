Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp954598lff;
        Fri, 6 Dec 2019 08:17:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzmknYUMPbmrkTDfSwIcExuGJ8OTbFrC5Be3J/xp9yVgrguUkVUMvQBYb3hvDZZokW6gJbC
X-Received: by 2002:a9d:7:: with SMTP id 7mr10193957ota.26.1575649064488;
        Fri, 06 Dec 2019 08:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575649064; cv=none;
        d=google.com; s=arc-20160816;
        b=rfNxOcg1A5Bvtl9BA4oyZvBpl/En3ybo9bxRfL+qrsk32fEFcLV1E2Z0VK1PXbRV2r
         7BrJHUvkFF912G4VS8ElQ7n+XRMBHKw6hxSfpAmuDhrhIb6uXhm6btnkcFd55rlQ7B5+
         NaHiKIAfEcnbGIVAKFXaUSdlezSivEef0h2SuF2nvNk+UwknSjHUncmo1CHnN+Hral5u
         8qBwWIv/f/EBL2z73apuzMpXixvAKS8aRrenkuqLH7qb9LqIgGLsCgZOaXpejDWG7z68
         QcJB76D33H0mWISbJhXIwDYTq8aor3PuaJX6t9Zh1crp1e/z5BlGYFlha5JyNZDyacbm
         nlnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6SeJWuW7smgEfzxeMhKUR3tViJ1MMS3OliKE3zzGKtU=;
        b=MqtSwQroxG0a+Yn3x0SeyywW6kKSfWvuZ/P24Y5C0wX7KHgLLsS4J6Sc8sSmw8eoKf
         0tM97zZS34gMCucCtWDrvuty7kDrjxvU6uc2sEycu8kgAw37OR8ZlohXeG0H2indcvZ0
         QE/gTx9z+zkz/+CCB+FaJ8YQ08WR42mzIElC6EaOikEs7Dcio26lIhQIsMlgrtVkgXcX
         9B3hr3CrokZUvOdJVrjbOHkpGx4Xsmz1Gei9fAg51x2AaJ8m+dEa60PGfIcXQfRod5ev
         jhooQxsJhv1L4A2+8+sHT0sLDYJoCNoiBdEHU1juEpCL5KEvrUgf8cQ883q8Kh68By+D
         wPAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s7UKlPpB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a26si7058965oto.199.2019.12.06.08.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 08:17:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s7UKlPpB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1idGIY-0003Be-W7
	for alex.bennee@linaro.org; Fri, 06 Dec 2019 11:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58910)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idEyg-0008Lt-Sk
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:53:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idEyf-0005G5-KM
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:53:06 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43425)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idEyf-0005EP-8R
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:53:05 -0500
Received: by mail-oi1-x242.google.com with SMTP id x14so2821326oic.10
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6SeJWuW7smgEfzxeMhKUR3tViJ1MMS3OliKE3zzGKtU=;
 b=s7UKlPpBZD1y3gEUPUtZSvKlf+9xf3fyBPXTbvolyaLSa3/gXKLvv18JDrNBynJ29X
 M9VnbeztwyV6mhNSQpvM/AWI35JqfDTE0H2q/kRP6xmZnO78giE7niRuGBrH0uIBoT56
 yeYghhciwt9trXxFMxfhCO3dkzyZTqTbpoOXDcL3uak5Jwps5TzlgFiVEwLkxBH95Vh2
 rKq/0soWsRqx3UIntqXNG88V+vHoxG1iYRcoQjh1hAN+To0TxOKTxdjfwtsim2WcMb+r
 5i0+LS3K+ZQN2UaYLrAhTPNcuxBt6fpWsP2fmreNyqiWIbSmN6yM05wmF8RXtSLqFTrf
 1Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6SeJWuW7smgEfzxeMhKUR3tViJ1MMS3OliKE3zzGKtU=;
 b=iuRIPhW2I9WbOcGZmioU8BHq8cnlQspNA5S2uZUJVjTv1zyW8RPCsVOQmAG70+Vt4y
 56dkgNEb+mg7ixjUyKrrmEhOuz+0zyh0ZFMWLvDGvgf0wnkS533LAgwecODGy8shf9kb
 QIk91sTJxmftJR7HdeGDzii+JuxDmXl3kB5LSWRy7GQwrbaNceMT9fq9C2rs6ScHBgFv
 oUHfKypFrVUG0x6CY7WmAaUIWBG4yBrrhmjCvcvy48XbQmJ1JQpVpsmoPt9rBbAgH14E
 ny7fBjbWpMLmwtsZ3HlPSISZWO6LG5LNu6vmyp3UpxJ8Vu1fSWV63hcwpF107hBA4tly
 QekQ==
X-Gm-Message-State: APjAAAVQJpRJX8xqJjCntx8PE2wcP3pSQ6d3ONHJ8T1fn3Q6iefKsroD
 WTwICCqdI4JxMU+ZPjJ3El3IVXE+6dMcuRGc528d9sJ9
X-Received: by 2002:aca:edd5:: with SMTP id l204mr12369452oih.98.1575637362903; 
 Fri, 06 Dec 2019 05:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-23-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 13:02:32 +0000
Message-ID: <CAFEAcA8AaCOBKSgVrpMxAiEGN0+JmJjJtMY-=M4ed06SAoe69g@mail.gmail.com>
Subject: Re: [PATCH v5 22/22] target/arm: Add allocation tag storage for
 system mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EbeljPCnBa/H

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 61 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index e8d8a6bedb..657383ba0e 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -28,8 +28,69 @@
>  static uint8_t *allocation_tag_mem(CPUARMState *env, uint64_t ptr,
>                                     bool write, uintptr_t ra)
>  {
> +#ifdef CONFIG_USER_ONLY
>      /* Tag storage not implemented.  */
>      return NULL;
> +#else
> +    CPUState *cs = env_cpu(env);
> +    uintptr_t index;
> +    int mmu_idx;
> +    CPUTLBEntry *entry;
> +    CPUIOTLBEntry *iotlbentry;
> +    MemoryRegionSection *section;
> +    hwaddr physaddr, tag_physaddr;
> +
> +    /*
> +     * Find the TLB entry for this access.
> +     * As a side effect, this also raises an exception for invalid access.
> +     *
> +     * TODO: Perhaps there should be a cputlb helper that returns a
> +     * matching tlb entry + iotlb entry.  That would also be able to
> +     * make use of the victim tlb cache, which is currently private.
> +     */
> +    mmu_idx = cpu_mmu_index(env, false);
> +    index = tlb_index(env, mmu_idx, ptr);
> +    entry = tlb_entry(env, mmu_idx, ptr);
> +    if (!tlb_hit(write ? tlb_addr_write(entry) : entry->addr_read, ptr)) {
> +        bool ok = arm_cpu_tlb_fill(cs, ptr, 16,
> +                                   write ? MMU_DATA_STORE : MMU_DATA_LOAD,
> +                                   mmu_idx, false, ra);
> +        assert(ok);
> +        index = tlb_index(env, mmu_idx, ptr);
> +        entry = tlb_entry(env, mmu_idx, ptr);
> +    }
> +
> +    /* If the virtual page MemAttr != Tagged, nothing to do.  */
> +    iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
> +    if (!iotlbentry->attrs.target_tlb_bit1) {
> +        return NULL;
> +    }
> +
> +    /*
> +     * Find the physical address for the virtual access.
> +     *
> +     * TODO: It should be possible to have the tag mmu_idx map
> +     * from main memory ram_addr to tag memory host address.
> +     * that would allow this lookup step to be cached as well.
> +     */
> +    section = iotlb_to_section(cs, iotlbentry->addr, iotlbentry->attrs);
> +    physaddr = ((iotlbentry->addr & TARGET_PAGE_MASK) + ptr
> +                + section->offset_within_address_space
> +                - section->offset_within_region);

I'm surprised that going from vaddr to (physaddr, attrs) requires
this much effort, it seems like the kind of thing we would
already have a function to do.

> +
> +    /* Convert to the physical address in tag space.  */
> +    tag_physaddr = physaddr >> (LOG2_TAG_GRANULE + 1);
> +
> +    /* Choose the tlb index to use for the tag physical access.  */
> +    mmu_idx = iotlbentry->attrs.secure ? ARMMMUIdx_TagS : ARMMMUIdx_TagNS;
> +    mmu_idx = arm_to_core_mmu_idx(mmu_idx);
> +
> +    /*
> +     * FIXME: Get access length and type so that we can use
> +     * probe_access, so that pages are marked dirty for migration.
> +     */
> +    return tlb_vaddr_to_host(env, tag_physaddr, MMU_DATA_LOAD, mmu_idx);

Hmm, does that mean that a setup with MemTag is not migratable?
If so, we should at least install a migration-blocker for CPUs
in that configuration.

> +#endif
>  }
>
>  static int get_allocation_tag(CPUARMState *env, uint64_t ptr, uintptr_t ra)
> --
> 2.17.1
>


thanks
-- PMM
