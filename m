Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp397489ejq;
        Thu, 4 May 2023 08:39:23 -0700 (PDT)
X-Received: by 2002:aa7:da82:0:b0:50b:cff8:ff1f with SMTP id q2-20020aa7da82000000b0050bcff8ff1fmr1991798eds.42.1683214763716;
        Thu, 04 May 2023 08:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683214763; cv=none;
        d=google.com; s=arc-20160816;
        b=ldlttscPVsbZfuw9DtmQdJA2W2JsmA8m2PwIJow5rj2ziCeib6lc1pzoshRJtUJ8SY
         9e+dfEKLMdsEvp6nBGSff6uU/uG4jAuy8WpN36k2vH+ldgUS69xQ0knJBjq7l465eAOO
         BSBtK3YkhtdiHsQGBxZLWcV4p5dlxeyhcAzflVNrRcdJ/Daxf6K9DlqZ4sEuts96TR75
         KO0lIC+kyfR2H2vcSeqJ2345tgx1b9l0LpoqxKpdMWfsaGQC2UWiuJVp1Elfd4bfMK7R
         6tgQLpRyUCW5YXFq1idFQ92SHUazGLmFk2eNG6qUzD17aNneEyO6HtRq9LXfDBkSCnOv
         FBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CCpRlDguvEjAb+xFSEilMlq7+yQCqd5fPfosF9kyQDg=;
        b=fHKkUL99dcCqfGCNHrz7ug8FHjtfkvXYcMbze0jsI+SoH8CMQ1SD+Xc8QrlXLZfLBG
         5QpHY1i4d70/aELJ5NfqzwW4wlxJ1nTaf8jvzF81zgghpqUZeTzZOR5YUfqRU+b1jcJ7
         5ZtjtVGBTB43FhVG9wnHxlPPHq0oFZYh04VMA4tn/xjdkP+50b+/dumC5Ge6mUWFc1xX
         bo78InYc2zdIkgyMDF1BlHsKS+nax7vvecEtnAbxIJWwX8Gv7mZFxiHng/GrHzj17IzL
         nB536frciYPvC/Iz4SvpM/N5MS8cDmedN8Yfy6Qd6Yr2dBr5JH0O3agFfb0VSGRExlrS
         d71Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEcBaBWc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t12-20020a50ab4c000000b0050bca470ed1sor2401180edc.6.2023.05.04.08.39.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 May 2023 08:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEcBaBWc;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683214763; x=1685806763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCpRlDguvEjAb+xFSEilMlq7+yQCqd5fPfosF9kyQDg=;
        b=EEcBaBWcDiqJ08RRatzOE7TDLM3AiIoz9h7WWtHZHhmqJCBrQr991BzWT/RvAbVHrv
         +ETJrHGpfEyX7LTa2WkCNZozB5/aK9vydWf4CpcStkJFdAqTZvKgAPYT3hRs6HtedC1M
         fmMQ2FLdZaskIc2b5t6WIVSqcPc18vw02eGNV0VD5qJgS7my9PXB4/cddbsuskBGTZgz
         aYLSFE510RG3nfR9TtX0dgiLmAzzB5rIXqPoSIRwRLvMich8IwwFUI97/gdcr2gp0TzX
         mOHhwtN0DriCyFLW8I/XZ9UJ2fqwckWenrD+yGp7FN9cW37Wa5aNu5THjEmc6gbU2pw3
         Q/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683214763; x=1685806763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCpRlDguvEjAb+xFSEilMlq7+yQCqd5fPfosF9kyQDg=;
        b=R5BXizFOq1nROCzV/fS5br5t5DfoWfN4zYLIoyP9YmSaIFMPDlkue9ClfovRFdpO58
         EwYSsDo3dh4l0KrNoT65SAFBW+wvQPBFgUOiA928hvgX8G/dpfhZf0uQ89ouwJl56EoC
         CikyrChRTcrbZLWVWgW02xA9hZzmCfvxKuEHeK1peK1A+/FiNMKut6Q5L/czaTBaHqZG
         e5jpw1UkRA1m9oApneToKV0SCZCueCOqZEkCxkD9lwsORFpNxhApOecmT+wkSCEuIJpz
         Hq4s7PsbT6LPwQeK0NdkM9o5oe1ytgFqRd9IvffFR31a7Fx8vHJwylkWHfLuCQ3Wl6ZH
         XXug==
X-Gm-Message-State: AC+VfDwCcwP+3ISXIKu5KPj+K+oPbTTDwAiuv0iwGKRd3bl5tDKe3JeE
	o+aD0TRSsd5feWJjMT96SsvWRuxjwt2BVn8nDVoNccT00ZCFwDxCNZM=
X-Google-Smtp-Source: ACHHUZ7HawQI3rHbfUDkI/xOB5Bb5SyM1pN4vgRaAmTPiSZY0AZXIlW6RfIxsYmASUxLtC/0SpCNcFv8xcCYJtnO7CY=
X-Received: by 2002:a50:ee8c:0:b0:506:b228:7aff with SMTP id
 f12-20020a50ee8c000000b00506b2287affmr2091106edr.23.1683214763344; Thu, 04
 May 2023 08:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org> <20230503070656.1746170-5-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 16:39:12 +0100
Message-ID: <CAFEAcA8LMQ6rfbCBB=sPfnDG0Uk9qaTZQXbH4D55veQgFNOqvg@mail.gmail.com>
Subject: Re: [PATCH v4 04/57] accel/tcg: Reorg system mode load helpers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: EohyUpRIWpfQ

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of trying to unify all operations on uint64_t, pull out
> mmu_lookup() to perform the basic tlb hit and resolution.
> Create individual functions to handle access by size.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/**
> + * mmu_watch_or_dirty
> + * @env: cpu context
> + * @data: lookup parameters
> + * @access_type: load/store/code
> + * @ra: return address into tcg generated code, or 0
> + *
> + * Trigger watchpoints for @data.addr:@data.size;
> + * record writes to protected clean pages.
> + */
> +static void mmu_watch_or_dirty(CPUArchState *env, MMULookupPageData *dat=
a,
> +                               MMUAccessType access_type, uintptr_t ra)
> +{
> +    CPUTLBEntryFull *full =3D data->full;
> +    target_ulong addr =3D data->addr;
> +    int flags =3D data->flags;
> +    int size =3D data->size;
> +
> +    /* On watchpoint hit, this will longjmp out.  */
> +    if (flags & TLB_WATCHPOINT) {
> +        int wp =3D access_type =3D=3D MMU_DATA_STORE ? BP_MEM_WRITE : BP=
_MEM_READ;
> +        cpu_check_watchpoint(env_cpu(env), addr, size, full->attrs, wp, =
ra);
> +        flags &=3D ~TLB_WATCHPOINT;
> +    }
> +
> +    if (flags & TLB_NOTDIRTY) {
> +        notdirty_write(env_cpu(env), addr, size, full, ra);
> +        flags &=3D ~TLB_NOTDIRTY;
> +    }

Maybe worth a comment that the NOTDIRTY flag is only ever
set for the addr_write TLB entry? This confused me for a bit...

> +    data->flags =3D flags;
> +}
> +
> +/**
> + * mmu_lookup: translate page(s)
> + * @env: cpu context
> + * @addr: virtual address
> + * @oi: combined mmu_idx and MemOp
> + * @ra: return address into tcg generated code, or 0
> + * @access_type: load/store/code
> + * @l: output result
> + *
> + * Resolve the translation for the page(s) beginning at @addr, for MemOp=
.size
> + * bytes.  Return true if the lookup crosses a page boundary.
> + */
> +static bool mmu_lookup(CPUArchState *env, target_ulong addr, MemOpIdx oi=
,
> +                       uintptr_t ra, MMUAccessType type, MMULookupLocals=
 *l)
> +{
> +    unsigned a_bits;
> +    bool crosspage;
> +    int flags;
> +
> +    l->memop =3D get_memop(oi);
> +    l->mmu_idx =3D get_mmuidx(oi);
> +
> +    tcg_debug_assert(l->mmu_idx < NB_MMU_MODES);
> +
> +    /* Handle CPU specific unaligned behaviour */
> +    a_bits =3D get_alignment_bits(l->memop);
> +    if (addr & ((1 << a_bits) - 1)) {
> +        cpu_unaligned_access(env_cpu(env), addr, type, l->mmu_idx, ra);
> +    }
> +
> +    l->page[0].addr =3D addr;
> +    l->page[0].size =3D memop_size(l->memop);
> +    l->page[1].addr =3D (addr + l->page[0].size - 1) & TARGET_PAGE_MASK;
> +    l->page[1].size =3D 0;
> +    crosspage =3D (addr ^ l->page[1].addr) & TARGET_PAGE_MASK;
> +
> +    if (likely(!crosspage)) {
> +        mmu_lookup1(env, &l->page[0], l->mmu_idx, type, ra);
> +
> +        flags =3D l->page[0].flags;
> +        if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
> +            mmu_watch_or_dirty(env, &l->page[0], type, ra);
> +        }
> +        if (unlikely(flags & TLB_BSWAP)) {
> +            l->memop ^=3D MO_BSWAP;
> +        }
> +    } else {
> +        /* Finish compute of page crossing. */
> +        int size1 =3D l->page[1].addr - addr;
> +        l->page[1].size =3D l->page[0].size - size1;
> +        l->page[0].size =3D size1;

Should this local variable be named "size0" ? It seems to be
the size of the access done to page[0], not the size of the
access to page[1].

> +
> +        /*
> +         * Lookup both pages, recognizing exceptions from either.  If th=
e
> +         * second lookup potentially resized, refresh first CPUTLBEntryF=
ull.
> +         */
> +        mmu_lookup1(env, &l->page[0], l->mmu_idx, type, ra);
> +        if (mmu_lookup1(env, &l->page[1], l->mmu_idx, type, ra)) {
> +            uintptr_t index =3D tlb_index(env, l->mmu_idx, addr);
> +            l->page[0].full =3D &env_tlb(env)->d[l->mmu_idx].fulltlb[ind=
ex];
> +        }
> +
> +        flags =3D l->page[0].flags | l->page[1].flags;
> +        if (unlikely(flags & (TLB_WATCHPOINT | TLB_NOTDIRTY))) {
> +            mmu_watch_or_dirty(env, &l->page[0], type, ra);
> +            mmu_watch_or_dirty(env, &l->page[1], type, ra);
> +        }
> +
> +        /*
> +         * Since target/sparc is the only user of TLB_BSWAP, and all
> +         * Sparc accesses are aligned, any treatment across two pages
> +         * would be arbitrary.  Refuse it until there's a use.
> +         */
> +        tcg_debug_assert((flags & TLB_BSWAP) =3D=3D 0);
> +    }
> +
> +    return crosspage;
> +}


> +/**
> + * do_ld_mmio_beN:
> + * @env: cpu context
> + * @p: translation parameters
> + * @ret_be: accumulated data
> + * @mmu_idx: virtual address context
> + * @ra: return address into tcg generated code, or 0
> + *
> + * Load @p->size bytes from @p->addr, which is memory-mapped i/o.
> + * The bytes are concatenated with in big-endian order with @ret_be.

"in big-endian order with"

> + */
> +static uint64_t do_ld_mmio_beN(CPUArchState *env, MMULookupPageData *p,
> +                               uint64_t ret_be, int mmu_idx,
> +                               MMUAccessType type, uintptr_t ra)
>  {
> -    validate_memop(oi, MO_UB);
> -    return load_helper(env, addr, oi, retaddr, MO_UB, MMU_DATA_LOAD,
> -                       full_ldub_mmu);
> +    CPUTLBEntryFull *full =3D p->full;
> +    target_ulong addr =3D p->addr;
> +    int i, size =3D p->size;
> +
> +    QEMU_IOTHREAD_LOCK_GUARD();
> +    for (i =3D 0; i < size; i++) {
> +        uint8_t x =3D io_readx(env, full, mmu_idx, addr + i, ra, type, M=
O_UB);
> +        ret_be =3D (ret_be << 8) | x;
> +    }
> +    return ret_be;
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
