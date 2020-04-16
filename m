Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1785505lfm;
        Thu, 16 Apr 2020 06:03:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypJpR1ggcJxa5D41wtYP8B7+MsbHQZwqVTs/Lz9xyNC8svITOb20UTacuihN6d2n7ZTF3s1w
X-Received: by 2002:ac8:27f9:: with SMTP id x54mr25568112qtx.45.1587042227642;
        Thu, 16 Apr 2020 06:03:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587042227; cv=none;
        d=google.com; s=arc-20160816;
        b=efqVIp8BdlJoOPvTT/mxuQzJWvyI3byrQADVErbNGJq4zdxjmbFLyewW/Pmr4cHwGA
         4mXjfDkQBwJ487LRBifpcJ1l24bY0MLIkEIkd7ZANSsiVnXx1xF9pXJ0hryjOmHkWECV
         QXn18f0xrmGAhtwr8l5xGid3+vYEDoVjB1Tz+K5C+/kkg4H8Pzsa0e5919y3dLY3wMzF
         Agwvdtj4AjLOoKbPG0X/cGHMADwDkKPgSF1eoR42qMjhbsP5BtMOIPkOKH3fqct+xAKz
         Ve08I7co3MCmPeW77nryl7wIZnPA/G3eijQUJ7sDvu5R86Ju23gLFSIkVXtdKohSEgoS
         OEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ymdPh0UvFhhDw29CTxGDGdgLqYba+DJ1MWHMztUn+iA=;
        b=E4PfJB6HbgWF5BqVr9j6m9Sor82CNvcFSGDzN6+Fn9l3M1he2PBGzP4+KUnWMO8vQa
         shwTk4Xb9p/K7/31qcFmHSMePwNR+quAgabBYNTUGUlbxJNHgnb7lzPcsKzj3tgyVqNv
         vc1LTRAhP/yompKVuBXyz5RLfiL3Gx75p6jrMedPTLPG4j5x3YJik1AwH+5RFWQ0K4w9
         FZQgZ+NsqLgle6AdgFzTG1BYBQTO6snIZZnNdyAw1c8QYxKXanjpalcEla+e+a6y8Qho
         n+PrrgDp+lEalMFKUGKhDYWI8DnRtCU/UiK0wOXCBKQgBLASfb8IC+rqJK/Vi20NnGEM
         IJ0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SX5EpVc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si10772907qtr.392.2020.04.16.06.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 06:03:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SX5EpVc8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP4BH-000866-2t
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 09:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4B7-00085S-7Y
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4B5-0004EE-9c
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:03:36 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43487)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP4B5-0004Db-14
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:03:35 -0400
Received: by mail-ot1-x343.google.com with SMTP id g14so2936173otg.10
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ymdPh0UvFhhDw29CTxGDGdgLqYba+DJ1MWHMztUn+iA=;
 b=SX5EpVc8rYBqpME43Xm7vpmaT/21RhCK4CQ1V7bX8Koi6oKRGm+ayZsxd0L6yfdNaR
 2ZEakBJcqkre6AgUEcKp09ZlpNOc8OoPzEqvqO0p/IPymw4j4MwTZ0XKsPwQDugz8oWW
 LFJogSTkLQ6/yyQZx0fMXjCRZH/g873Q1Mplg4+oZhV74QZZJ2o/GkzImaiW/vRs937Z
 HuRLzHgjbZS4tIV6x/MAvIaTrDpfAIdY56LBnr92JQqZBV/wsL2tT/mMXGbtqBavoaaC
 pmI0khuhEGcEk3p32lLxyFeYSqHzjpINGCth0KAoDNXkks1GjUzMsdmMa/RSioG5GOI+
 4psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ymdPh0UvFhhDw29CTxGDGdgLqYba+DJ1MWHMztUn+iA=;
 b=YKWMJLTmadt25z3+sg9qFS110zpZvgtWzXMnax8y9cby5U6EXMyagXe7m3u6B7fnJm
 5yWzmiiNfFswh+PO6Vesiuq5rqZ3c8wy7lAdMkQ3Xhpbi98Knvvyi6U25x3peHe+YdSr
 iPpdrY6I8ZvxvK3YXRib0XdflW+7I06noo7t27CIPBBt2m1fuQypTaHiCJjwaXn7MZL7
 7ZGkgb1T/6AVS0CRpDMdkE2rfsFzGhDIprt93wINthtQG0Frc/AXa6R2PgkMJcgt+Q3P
 uCZ5YBBdvAPsqG/axXn5smYxylP7vAREjw9HUcFnMQzFDNsEBxhUebFx8fDHN7xUFlMm
 jeMA==
X-Gm-Message-State: AGi0Pubk0pOO74P/SIQZkg7xL8a64Ko9xJ2ZFY4OK8GNiEXN0fTRw2JL
 XmGCNs0YDgjW3FwEDPQB8K9/P7r5GL41rtj/gzJWAQ==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr8050522otj.91.1587042213709; 
 Thu, 16 Apr 2020 06:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-7-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 14:03:22 +0100
Message-ID: <CAFEAcA8F2Qmdh=9RXFhN9_WPjhjhai9iO2Cn0dL5UAGV_r4AGw@mail.gmail.com>
Subject: Re: [PATCH 06/16] target/arm: Add sve infrastructure for page lookup
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 18ymVt/MmwHD

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For contiguous predicated memory operations, we want to
> minimize the number of tlb lookups performed.  We have
> open-coded this for sve_ld1_r, but for correctness with
> MTE we will need this for all of the memory operations.
>
> Create a structure that holds the bounds of active elements,
> and metadata for two pages.  Add routines to find those
> active elements, lookup the pages, and run watchpoints
> for those pages.
>
> Temporarily mark the functions unused to avoid Werror.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 240 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 240 insertions(+)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 8b470991db..3f653e46a0 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -4155,6 +4155,246 @@ static intptr_t max_for_page(target_ulong base, intptr_t mem_off,
>      return MIN(split, mem_max - mem_off) + mem_off;
>  }
>
> +/*
> + * Resolve the guest virtual address to info->host and info->flags.
> + * If @nofault, return false if the page is invalid, otherwise
> + * exit via page fault exception.
> + */
> +
> +typedef struct {
> +    void *host;
> +    int flags;
> +    MemTxAttrs attrs;
> +} SVEHostPage;
> +
> +static bool sve_probe_page(SVEHostPage *info, bool nofault,
> +                           CPUARMState *env, target_ulong addr,
> +                           int mem_off, MMUAccessType access_type,
> +                           int mmu_idx, uintptr_t retaddr)
> +{
> +    int flags;
> +
> +    addr += mem_off;
> +    flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
> +                               &info->host, retaddr);
> +    info->flags = flags;
> +
> +    if (flags & TLB_INVALID_MASK) {
> +        g_assert(nofault);
> +        return false;
> +    }
> +
> +    /* Ensure that info->host[] is relative to addr, not addr + mem_off. */
> +    info->host -= mem_off;
> +
> +#ifdef CONFIG_USER_ONLY
> +    memset(&info->attrs, 0, sizeof(info->attrs));

Could just write "info->attrs = {};" ?

> +#else
> +    /*
> +     * Find the iotlbentry for addr and return the transaction attributes.
> +     * This *must* be present in the TLB because we just found the mapping.
> +     */
> +    {
> +        uintptr_t index = tlb_index(env, mmu_idx, addr);
> +
> +# ifdef CONFIG_DEBUG_TCG
> +        CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
> +        target_ulong comparator = (access_type == MMU_DATA_LOAD
> +                                   ? entry->addr_read
> +                                   : tlb_addr_write(entry));
> +        g_assert(tlb_hit(comparator, addr));
> +# endif
> +
> +        CPUIOTLBEntry *iotlbentry = &env_tlb(env)->d[mmu_idx].iotlb[index];
> +        info->attrs = iotlbentry->attrs;
> +    }
> +#endif
> +
> +    return true;
> +}
> +
> +
> +/*
> + * Analyse contiguous data, protected by a governing predicate.
> + */
> +
> +typedef enum {
> +    FAULT_NO,
> +    FAULT_FIRST,
> +    FAULT_ALL,
> +} SVEContFault;
> +
> +typedef struct {
> +    /* First and last element wholy contained within the two pages. */

"wholly"


> +    int16_t mem_off_first[2];
> +    int16_t reg_off_first[2];
> +    int16_t reg_off_last[2];

It would be helpful to document what these actually are,
and in particular what the behaviour is if the whole thing
fits in a single page. (Judging by the code, the elements
at index 1 for the 2nd page are set to -1 ?)

> +
> +    /* One element that is misaligned and spans both pages. */
> +    int16_t mem_off_split;
> +    int16_t reg_off_split;
> +    int16_t page_split;
> +
> +    /* TLB data for the two pages. */
> +    SVEHostPage page[2];
> +} SVEContLdSt;
> +
> +/*
> + * Find first active element on each page, and a loose bound for the
> + * final element on each page.  Identify any single element that spans
> + * the page boundary.  Return true if there are any active elements.
> + */
> +static bool __attribute__((unused))
> +sve_cont_ldst_elements(SVEContLdSt *info, target_ulong addr, uint64_t *vg,
> +                       intptr_t reg_max, int esz, int msize)
> +{
> +    const int esize = 1 << esz;
> +    const uint64_t pg_mask = pred_esz_masks[esz];
> +    intptr_t reg_off_first = -1, reg_off_last = -1, reg_off_split;
> +    intptr_t mem_off_last, mem_off_split;
> +    intptr_t page_split, elt_split;
> +    intptr_t i;

intptr_t seems like a funny type to be using here, since these
aren't actually related to pointers as far as I can tell.
It's also odd that the type is not the same one used in the SVEContLdSt
struct for the corresponding fields.

> +
> +    /* Set all of the element indicies to -1, and the TLB data to 0. */

"indices"

> +    memset(info, -1, offsetof(SVEContLdSt, page));

I guess this isn't conceptually much different from zeroing
out integer struct fields, but it feels a bit less safe somehow.

> +    memset(info->page, 0, sizeof(info->page));
> +
> +    /* Gross scan over the entire predicate to find bounds. */
> +    i = 0;
> +    do {
> +        uint64_t pg = vg[i] & pg_mask;
> +        if (pg) {
> +            reg_off_last = i * 64 + 63 - clz64(pg);
> +            if (reg_off_first < 0) {
> +                reg_off_first = i * 64 + ctz64(pg);
> +            }
> +        }
> +    } while (++i * 64 < reg_max);
> +
> +    if (unlikely(reg_off_first < 0)) {
> +        /* No active elements, no pages touched. */
> +        return false;
> +    }
> +    tcg_debug_assert(reg_off_last >= 0 && reg_off_last < reg_max);
> +
> +    info->reg_off_first[0] = reg_off_first;
> +    info->mem_off_first[0] = (reg_off_first >> esz) * msize;
> +    mem_off_last = (reg_off_last >> esz) * msize;
> +
> +    page_split = -(addr | TARGET_PAGE_MASK);

What is the negation for ?

> +    if (likely(mem_off_last + msize <= page_split)) {
> +        /* The entire operation fits within a single page. */
> +        info->reg_off_last[0] = reg_off_last;
> +        return true;
> +    }
> +
> +    info->page_split = page_split;
> +    elt_split = page_split / msize;
> +    reg_off_split = elt_split << esz;
> +    mem_off_split = elt_split * msize;
> +
> +    /*
> +     * This is the last full element on the first page, but it is not
> +     * necessarily active.  If there is no full element, i.e. the first
> +     * active element is the one that's split, this value remains -1.
> +     * It is useful as iteration bounds.
> +     */
> +    if (elt_split != 0) {
> +        info->reg_off_last[0] = reg_off_split - esize;
> +    }
> +
> +    /* Determine if an unaligned element spans the pages.  */
> +    if (page_split % msize != 0) {
> +        /* It is helpful to know if the split element is active. */
> +        if ((vg[reg_off_split >> 6] >> (reg_off_split & 63)) & 1) {
> +            info->reg_off_split = reg_off_split;
> +            info->mem_off_split = mem_off_split;
> +
> +            if (reg_off_split == reg_off_last) {
> +                /* The page crossing element is last. */
> +                return true;
> +            }
> +        }
> +        reg_off_split += esize;
> +        mem_off_split += msize;
> +    }
> +
> +    /*
> +     * We do want the first active element on the second page, because
> +     * this may affect the address reported in an exception.
> +     */
> +    reg_off_split = find_next_active(vg, reg_off_split, reg_max, esz);
> +    tcg_debug_assert(reg_off_split <= reg_off_last);
> +    info->reg_off_first[1] = reg_off_split;
> +    info->mem_off_first[1] = (reg_off_split >> esz) * msize;
> +    info->reg_off_last[1] = reg_off_last;
> +    return true;
> +}

thanks
-- PMM
