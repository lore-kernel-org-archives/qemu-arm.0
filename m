Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp479438njb;
        Fri, 11 Oct 2024 08:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwdkyaZbc3Y0g4ys0nECGio7Pg/oK11tKJN16+9vKZKwybZv3kdSnEUJ6YO3PCpsfOG79EmehbOnOKCA==@linaro.org
X-Received: by 2002:a17:907:7292:b0:a99:8edf:3a55 with SMTP id a640c23a62f3a-a99b970a25dmr229939166b.54.1728660988835;
        Fri, 11 Oct 2024 08:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728660988; cv=none;
        d=google.com; s=arc-20240605;
        b=aWRV5y8Ps8+MHuvJPZGkJ3tCXMgjTeDDKrh9IqD2DoLa7T+da/VnknwN13vFM7k2+U
         l06SCpYyyqiBdd+0GP6pftHMYd4RwZ6KH/9GJvbyqB/VncUZd+QM8/Kqak6SNPP/Ntvp
         VdZWwnBhdlfE6Vd4sCINXm5KUbmIepsuRdZCN4IFBYh9GZbepqzm9w/04T93Qjc0YJM/
         ilL3oM2SwolGtr9AeZHVfFMfpGQDTAsvLRzaCYQUsOiqs85xv4L2E8vA0gAsjannhKdw
         QH9Wcy3l/6W/pTCOJwLGY+ySB/rYgiz1kNkVGtKfFfOvgDJx4wHr7MIMwMWBq2PiGbVU
         58ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ooVvsEyGOT7aTjiUJiE2ewcH9FMS1o9c1z/caxuq/gc=;
        fh=Wnjl0EHZXAlbAq4vBwgaE677DDY2lLrjGeu25tL69Mg=;
        b=fmoM9t+3CN4YcC2glBJyMeU7CkrQzd2OMp43OlrPPVYI0GhIPMwmGobc2qXRkTZw1z
         Oth8F2Ay/EsOcHZyfQZeM3srHFyuQ2rL8Evmxs/zfMBUB0T4XHm3uT0HJvbClluDU6Vp
         uE2KjPR/gq2wdNdkAERnLh3SxQ/tKudUknxjcfdUDYhO53634r1gdWpvjjQFwatk/1Fd
         VmCd2FRlwfM6ug2s/X4alW0T8RbXu5Cxig91HO3kni29oCJOD+ZEcMtYhNUvxWHitRoE
         JpUGK6VQklDN/GV3F4vmYiP+zc94blSI5OgD5PST59kCswu6XT2wBzH4yLCTs99ofqnc
         1n1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtbOX5qt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a99a80c01f6sor138404366b.16.2024.10.11.08.36.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Oct 2024 08:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtbOX5qt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728660988; x=1729265788; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ooVvsEyGOT7aTjiUJiE2ewcH9FMS1o9c1z/caxuq/gc=;
        b=dtbOX5qt/Rw8Cp0+XFRAcLeeHlRv2Fw+M6dRgAUr8k7fXxMEIHgZzoWD0zSWVhxeLe
         vBd2eusqSgoaNFe4EqW2MRcR7LhXFDDocI8EoNzjFbcGqqgRFZo/UFpf86nVT3C657ph
         /iR/bDl7V48WVv9gh7Zw2wIPyjyk6l5CW2Yw5zZahmNsHUXDwyLwHrJ+V2Vx6Q8909r6
         BxD09yOcZuIY4d9RlQZ1HuiEK3RqujCjXELQ1LQkYUUvVaq5UZUdnBF4BKHxZXkqxGWX
         5ePFzTu6SAEoHhJKuCegWEBLW+D368QfY9zBd+UCVx+qkQf1V7rr6ltdWnZURXlGPyBq
         dbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660988; x=1729265788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooVvsEyGOT7aTjiUJiE2ewcH9FMS1o9c1z/caxuq/gc=;
        b=ba5lWQ6OZ4E9pXS1th0WUrfo1MXoo/q3tPc0p5vTiZ8k8n6knoRsvneRppQsEscBJK
         Aoh7B5oKOatIJT4WB4DvJD35fscJ5QU2TIXV3bpImSkxOIXDmP2MDVCJD0LEKYgxRN+l
         lnUxHbQRkZhsrNH824dmcpjes0Z7CER8lif+0W36nqlQ0NPNJgkICJhE9npfYAGv9qj2
         Qjf+Xt187J5RdElreG8ikqQg87N2UZEyWrACCdLz0SmouzNxuvZFNBb4hEHCTSBhbLgX
         JocBlXgfa7k1WhWf68eEspJIXKZPvAmb53lKBH//8LmG0lrx/VrZa0yMa5yZ7AU3z3UV
         tc9g==
X-Forwarded-Encrypted: i=1; AJvYcCWRE5FXu1cLPXuCKPBixp1l67cGfhSZ07p+ilNzoRWKW4eNRlvGAF59Z1hmA1uDfwwMISe3Htnc8tozsA==@linaro.org
X-Gm-Message-State: AOJu0Yz2OnToINcCerDtC9grqcMhsKPt//5UtXIaQf+SBxiyZH7+CJfR
	p53Ual/cxyoAbeXC5WQlAdcn23E6VYPupo7BO+TEM6rAxKoM620ms2lPAd1s2RiKPqfDLsMqco6
	zjyeDF67plSr9gVx/OiqiZCuaQeDqjHLmUwBkxwbM
X-Google-Smtp-Source: AGHT+IEjAHVyDzsxyfA+hUYjmXreiKyNYIRlBTXDRhSDjaO8yGQi8i2TD7NUA9+tfGUqyCOuYQb/F3LOjlf9b49Eimc=
X-Received: by 2002:a05:6402:2786:b0:5be:ee30:9948 with SMTP id
 4fb4d7f45d1cf-5c948ca2342mr2251965a12.8.1728660988058; Fri, 11 Oct 2024
 08:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-7-richard.henderson@linaro.org> <CAFEAcA-mSsFgjoBWi13dXqZUbys2N81YVXLD_ZfuuGo+Xfy-gQ@mail.gmail.com>
 <b5bf5d17-2451-4d6e-9a4e-6fb4e94ad308@linaro.org>
In-Reply-To: <b5bf5d17-2451-4d6e-9a4e-6fb4e94ad308@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Oct 2024 16:36:16 +0100
Message-ID: <CAFEAcA9brYu2trekf3=ztRkHOc2Lw24_L+eSpTJzaf=orVFv8g@mail.gmail.com>
Subject: Re: [PATCH v3 06/20] accel/tcg: Use the alignment test in tlb_fill_align
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: UnO7bYcPUW8H

On Fri, 11 Oct 2024 at 16:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/10/24 03:44, Peter Maydell wrote:
> > On Wed, 9 Oct 2024 at 01:05, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> When we have a tlb miss, defer the alignment check to
> >> the new tlb_fill_align hook.  Move the existing alignment
> >> check so that we only perform it with a tlb hit.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >
> >> @@ -1754,8 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
> >>            * Lookup both pages, recognizing exceptions from either.  If the
> >>            * second lookup potentially resized, refresh first CPUTLBEntryFull.
> >>            */
> >> -        mmu_lookup1(cpu, &l->page[0], l->mmu_idx, type, ra);
> >> -        if (mmu_lookup1(cpu, &l->page[1], l->mmu_idx, type, ra)) {
> >> +        mmu_lookup1(cpu, &l->page[0], l->memop, l->mmu_idx, type, ra);
> >> +        if (mmu_lookup1(cpu, &l->page[1], 0, l->mmu_idx, type, ra)) {
> >
> > Is 0 the right thing here ? Given that alignment-requirements can
> > differ per-page, what happens for the case of an unaligned access
> > that crosses a page boundary where the first page is "memory that
> > doesn't care about alignment" and the second page is "memory that
> > does enforce alignment" ?
>
> I can't think of anything else that makes sense.  The access to the second page is
> "aligned" in the sense that it begins at offset 0.

Ah, yes, you don't get to see how unaligned the access
is in the second mmu lookup.

> Anyway, alignment as a page property is unique to Arm and...
>
>
> > For Arm this is moot, because an access that crosses a page
> > boundary into something with different memory attributes is
> > CONSTRAINED UNPREDICTABLE (per Arm ARM rev K.a B2.15.3), but
> > maybe other architectures are less flexible.
>
> ... as you say.
>
> > Also, the comment does say "recognizing exceptions from either",
> > and we aren't going to do that for alignment issues in page 2,
> > so if we're OK with ignoring this we should update the comment.
>
> The second page can still raise page faults.  How would you re-word this?

Mmm, so there's also the case of an unaligned access across the
page boundary where page 1 is present and page 2 is not -- do
we prioritize the alignment fault or the page fault? This
patch will always prioritize the alignment fault. For Arm
that's fine, as we architecturally should do the checks in
that order.

-- PMM
