Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp830182njj;
        Fri, 2 May 2025 06:05:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXME2jJbfzWfuRJhCPpEypfEKGbHAuvzPVS3OLr8Kgijz3Ou963Va3nxWOvV+7fiG4JY6NRJbc7TkTWg==@linaro.org
X-Received: by 2002:a05:690c:7083:b0:703:b92c:7170 with SMTP id 00721157ae682-708ced3b25cmr40986467b3.12.1746191146075;
        Fri, 02 May 2025 06:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746191146; cv=none;
        d=google.com; s=arc-20240605;
        b=HnAl1KLKYzSuDaUmhOgeGpPW4NYwRUiArNnCl+6L9cvf3wLuOoBi1UKSqGMN/Mcrg5
         rKE+IokgKgDK5SDsUGlO7G7rdP+7R27ykhl1WmrpLM9FQ4dbfWISd5GUvfk4y5OjO6M7
         l2kmJo363GgcZppaZYY4tDQSOTZU3WYxV/kuNHY7fN+mk9Caf6jTN3CW/gBUYoniYuLf
         3q5dRVAPg/9PMaxNwhLhJsmCs5ATl6OFc6cN3Pw+tnZKEXYveQwHW/u70TmEcSyPkNHd
         lad8WqhLwnH5faWlp2gCC6U9+cGHCIl9VxqVK2kbbECnmWDVOOEpn2eShMi1xHtLvyK+
         Asdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U/RoE23ApTjqbVe27klDcTmtWofCycnun26HGiKmoRk=;
        fh=DjNheVNETXWKUTYKq+idbRQ1ik3hJc6BZnefuVH6LX4=;
        b=bR7dood/7+66Dq61vxTehcYvcrms62k4HCG3pIfCl4yEu5NaKqTU9SMJsifKFBl334
         TthsY5IVigNfhZh94XcdffCM36TuSurAkncqq9F4BftC6NiyQK7qH0gXsZ6W5/9XmGUf
         p1Cwl6mS3Z/S6TzM4OQis9mVBfXkfIasjifFXewz5weuPr2rMGlQ9+MM0Qrk4hkuz+XJ
         R2arRFNC0XNqPEkvDGbU/TKqXQodpu5FpOLVZlmmQ/cOQCOc2S69msh1bQMMwBfKrx7i
         CzCO1HHsOsVWpxjgCGywZUUzEp/zxFR7G91SyOZ2pOLm37h4k6JphNLqoDMRwa+QMh4G
         LsbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vOK8OOsX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-708c3ef8153sor20288407b3.1.2025.05.02.06.05.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 May 2025 06:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vOK8OOsX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746191145; x=1746795945; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U/RoE23ApTjqbVe27klDcTmtWofCycnun26HGiKmoRk=;
        b=vOK8OOsXxHKsWItSHf/aruSb/D4coy37A4yBSWfXx9bwZNARpUKIMpv+dE3SD48toN
         +unPeJVhHBWZYhB7W+JL/SAU7/ywxaFxcX73vB5oKe0RBu2R1Fn3L+3od78HMDrvJnm0
         xtQOU61RfR6OpAP/1/P8KPTPLghADrpNHLx96IKkiliqetgbgeHOzvV6Dzz+rIKjsSHf
         ZLo7NZNRTX1Yuy0xXbqaEPnzClii76H/JS+iONXflWSSds9s/rKyHLDbP3wZMmCB7GeT
         keb6ZWcxtzO/70cyphDQ9d+1kUPFspgAUJKMWkw5VzgM3eWVxR55pjfyTn7LqrEmqm2/
         DJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191145; x=1746795945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/RoE23ApTjqbVe27klDcTmtWofCycnun26HGiKmoRk=;
        b=dDZ98uAdK+zGf0l89ASzmkiFh3sr3zE2p/4SiDDw9XgpLTwyQN4h5rgL8LaSGuEJRt
         b2Om3rvODVR4n4VJZl0PfpC1Bc7HplZ3UBskty22cG1j/4yvWwtRxMKz1XLLchlU/2zf
         PwDgsQWE3IVFJJlbOr7/UAdMUPIEzcBfqIrS2qLWMxgKWWMlItBbea4X5lxY/knVU/eU
         b/WPR6CvtxtqajjwBtQ0ULBgMqZsj1UibbqGm3AfIcIwSji2P/NSNGYV/gssWj9S5GQx
         i1cCddTasQKWLZ4ZD7R1WsT/vk4vDHQDD/IGRSF4nqWIHklm82fi80Dn7E5qGEjGpXwf
         AWMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiXuvo+kzji744kQ/G5gshsnl8cLUzVvkV5wGw3jmfi5hJvZ8U68qqWcPCm73COnJqE14WPK1c2bUN+g==@linaro.org
X-Gm-Message-State: AOJu0YwbWIOC03bSvYYlPkyBks99+snhe5ZcQ3sSQQks8YTsp4aTJhQv
	FkvdjKyzFjKCOUzCzTM6K0tPtB+TUflo3P/3GZLp6xWBd2MfubOQqGjoBTXTQ16muUuuL5ScFe0
	DSPlo15oiO2DhDatZZLBjU68R3Vjji4rBKVJDmhy7Tpv22N2CxNU=
X-Gm-Gg: ASbGncs14DnFA4IBKFOf9znfiGUyIz9mZQnO6saTaCvsTERb3DopHX0kaQ2lOiwalX6
	orHCvjwAST5q+h/ZVqtTy+gK123mDhVSHSpp/DBJVtqXfGkAgtFmYDdEJHa+8ukjqVy4Sd0abEf
	SU5NEeSol4XlvB5hFzfLODF1Q=
X-Google-Smtp-Source: AGHT+IFVwNbgupiVHh1lPAipK/kOSgiFPgV3qiGulbNifcJJZE7uAcsoiPvh6mBwG7oA0j7TKZ7Owz+PZjlaxz5fq7o=
X-Received: by 2002:a05:690c:6f8f:b0:708:c1a5:ca4e with SMTP id
 00721157ae682-708ced3b02bmr45645537b3.13.1746191145686; Fri, 02 May 2025
 06:05:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250414153027.1486719-1-pierrick.bouvier@linaro.org> <21843e8d-cdbc-4f84-a652-01ee467f2dc7@linaro.org>
In-Reply-To: <21843e8d-cdbc-4f84-a652-01ee467f2dc7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 May 2025 14:05:33 +0100
X-Gm-Features: ATxdqUE8L9NTXDwVmgb6blgawlDUc9oYjm_w9bucKQJWH0eLXK3MklHJ12F7AWE
Message-ID: <CAFEAcA8cBUc_iJCA_D6ZDsJad75Rmad6xDz34FPXWrnyEhk4tg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/arm: fix arm_cpu_get_phys_page_attrs_debug
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Yannis Bolliger <yannis.bolliger@protonmail.com>, qemu-arm@nongnu.org, 
	alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: UVHaCYU0GjhJ

On Mon, 28 Apr 2025 at 20:34, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 4/14/25 8:30 AM, Pierrick Bouvier wrote:
> > It was reported that QEMU monitor command gva2gpa was reporting unmapped
> > memory for a valid access (qemu-system-aarch64), during a copy from
> > kernel to user space (__arch_copy_to_user symbol in Linux) [1].
> > This was affecting cpu_memory_rw_debug also, which
> > is used in numerous places in our codebase. After investigating, the
> > problem was specific to arm_cpu_get_phys_page_attrs_debug.
> >
> > [1] https://lists.nongnu.org/archive/html/qemu-discuss/2025-04/msg00013.html
> >
> > When performing user access from a privileged space, we need to do a
> > second lookup for user mmu idx, following what get_a64_user_mem_index is
> > doing at translation time.
> >
> > This series first extract some functions, and then perform the second lookup
> > expected using extracted functions.
> >
> > Besides running all QEMU tests, it was explicitely checked that during a linux
> > boot sequence, accesses now report a valid physical address inconditionnally
> > using this (non sent) patch:
> >
> > --- a/accel/tcg/cputlb.c
> > +++ b/accel/tcg/cputlb.c
> > @@ -997,9 +997,7 @@ static inline void tlb_set_compare(CPUTLBEntryFull *full, CPUTLBEntry *ent,
> >       if (enable) {
> >           address |= flags & TLB_FLAGS_MASK;
> >           flags &= TLB_SLOW_FLAGS_MASK;
> > -        if (flags) {
> >               address |= TLB_FORCE_SLOW;
> > -        }
> >       } else {
> >           address = -1;
> >           flags = 0;
> > @@ -1658,6 +1656,10 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data, MemOp memop,
> >           tlb_addr = tlb_read_idx(entry, access_type) & ~TLB_INVALID_MASK;
> >       }
> >
> > +    vaddr page = addr & TARGET_PAGE_MASK;
> > +    hwaddr physaddr = cpu_get_phys_page_debug(cpu, page);
> > +    g_assert(physaddr != -1);
> > +
> >       full = &cpu->neg.tlb.d[mmu_idx].fulltlb[index];
> >       flags = tlb_addr & (TLB_FLAGS_MASK & ~TLB_FORCE_SLOW);
> >       flags |= full->slow_flags[access_type];
> >
> > v2:
> > - fix style in first commit (philmd)
> >
> > Pierrick Bouvier (4):
> >    target/arm/ptw: extract arm_mmu_idx_to_security_space
> >    target/arm/ptw: get current security_space for current mmu_idx
> >    target/arm/ptw: extract arm_cpu_get_phys_page
> >    target/arm/ptw: fix arm_cpu_get_phys_page_attrs_debug
> >
> >   target/arm/ptw.c | 65 +++++++++++++++++++++++++++++++++++-------------
> >   1 file changed, 48 insertions(+), 17 deletions(-)
> >
>
> Gentle ping on this series.
> Any plan to queue it to tcg-next @Richard?

I've queued this series to target-arm.next; thanks.

-- PMM
