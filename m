Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp863929njl;
        Wed, 9 Oct 2024 06:59:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSLTKkhMu74ewJvQoGF9PQDPxU5pIvUQTbwo7AIDk6vjpAaZKRNXsTLrQkvAB9AJutZgaPYRruBWMIDw==@linaro.org
X-Received: by 2002:a17:907:1c0a:b0:a99:403e:2568 with SMTP id a640c23a62f3a-a998d122efcmr202845866b.5.1728482362471;
        Wed, 09 Oct 2024 06:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728482362; cv=none;
        d=google.com; s=arc-20240605;
        b=i9MdemfzVratNreYAqOraz28yBi7VgBNK5GvY6QqqByfbgNcXFNHjnMBfee3OaZTRc
         lh2SLgXlib6PP7hfejz2T28bMjndIe+yFtZy/1WCvLBMAixMidNBnz2uXRTUvNefjT2D
         v7XuszhPzdkN2cnlm8na9E4b+s8mIZZ0sa6nA/HjbUpTpEQh906C66cMGOcI63c/uQOR
         poG0H69+Ur55s2O2ls1Tk/xLSNxBzyjRKjHLzBITKR7D2zOpkz+vzICmElz3qj0FMUQR
         n8dSLrNVvqIKNnYyRZeHOED8RvEDwwNwUf/TRMQbQ4G7D5SlkNGmnzSMZ+ySZfVv6bHh
         FQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l0I3hgXYskFaM1WPaQBMv7Pv3MdsYJHuri7ua6DX/GE=;
        fh=Pm7iEJOBS9nqTxdDWiBESvRze6FXqQ0NzDDPHxLsx98=;
        b=RsDj8Z6F8Ce4zICGI49eW//7EOkp3dtgHHDePmIY/+lbi7XWxYQpSvSy5Wf+u6GPuf
         P2STRl4hcW9+Y2//TdbiSBSPC5jNs/X/8kCMz66NkY/TeYuioRXIiiR6xsGrGL/lQSts
         YmbuMrc65vFHUFnLr5RpjLUJbyRilIeXbopEY4bJJVh2EinsWxB+qjf70rnErzlvQ2pn
         3aw7mtRbAfl90H7ikvGgNrp+Pnq3TcZ6yvV7hw0RmNUAIVg5eKems0fftQHN4L6zak+i
         r0bT93ome9shAQm/AWqBGuc5mgjBQcPPqDNkSfxvAITaGX99AQM6LBpeCif//enwh2WX
         BXuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tYzEpCYg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a994c251722sor282195966b.8.2024.10.09.06.59.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Oct 2024 06:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tYzEpCYg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728482362; x=1729087162; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l0I3hgXYskFaM1WPaQBMv7Pv3MdsYJHuri7ua6DX/GE=;
        b=tYzEpCYgEIwqZEjys7sy1ogXezDNdfN8bAjFUhvP3R+xhOrvBhWcHHRT8kd1C3IQrc
         /rmfLaCC9+fMx85rn5FVZ+gALMBOzwQcQsTPDmrjWA0i/5RSzUyx0cCnsJknZqHD5YFr
         KcW+x4kn4xGj4q42XoI4r2lwUW+uGho4rNSkNoa89EihiyY0873lCyT0Zc/Q02sAl28B
         6FBPT7rX6rVf3fSxjlZpS2xT3zMJ6/x/cN+JFCv6pt/n31Xj0pDyf1h/NPW0xIVa+OA+
         fnW/dOvW5A1TynB6R+co3S5fknt+xumbEZoxm7afaMrhRli1YPfkSlfmzqtTs1Villz+
         EKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728482362; x=1729087162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l0I3hgXYskFaM1WPaQBMv7Pv3MdsYJHuri7ua6DX/GE=;
        b=C1+JK83mFrbTng/F7ROP7DbOEd6RlaTymYZAo2Rf8buKGY0Q9ctGzDek9lAc/driXB
         1not68WP3lw7/KtITMRA+1qeR1Dsy9uNbtqcRF8vVwI1vwtTav4xk882tjVOWaxM+SJn
         +YYj70KWOYuYMhLGWm+NFqrV2oQ06fNmqTfhnC0jzkBvRWTTrOClmzEQstw4ASHNmZ5G
         d4/Eum4iqCM+Wp3M+va3eFA8ScyQ1X1Q+KaSVNc/HzSW1SeqvNw8oP4m0MwNPtuy+QF6
         x1ldjpIlESkDTAcuBsFEeutU0rJL4W++Mw36x//vVcxMeq3W3J+EZp4Dlp1nq7Ng5V8C
         BVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIjrVLH3gMDWazZwcFrMWKAvPM8tjR4bAPBo8opLKZo6fMbODmNWOyn4qoEJayoj+qWYZolZ9LugyB9Q==@linaro.org
X-Gm-Message-State: AOJu0YzjXrCqjD+IOHGHdxCSUIY2uXG8AiiBGd0fSbmL+XlCkE++2O+K
	WCbg1dXNCuOOdbHkNZLpwPKo4wRIpi5MMDbPnLAmGLChY+YIY4vWcK/pdeFnkgWuJf4MxSuzE3E
	oAWcP7+M+0FN20NyE4soCkyyYHh7yHNVmNVVcUqdH
X-Google-Smtp-Source: AGHT+IFcaDAmv5R+/Xh7CHX50o4jgaS6RwlGJuW4592TQfJL+6zctEsY3T1VEpWaMxyXf+D46/DImjU/Acw+HiHxBUI=
X-Received: by 2002:a05:6402:2813:b0:5c2:6d16:ad5e with SMTP id
 4fb4d7f45d1cf-5c91d63e0e4mr2429095a12.19.1728482361560; Wed, 09 Oct 2024
 06:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-14-richard.henderson@linaro.org> <CAFEAcA_jXTuB6c8oVcXmi66zcXn5-PYM7W9z1wf7-fzXg7_Oiw@mail.gmail.com>
 <5c33b223-10cc-4ad6-a3e8-15082266b31d@linaro.org>
In-Reply-To: <5c33b223-10cc-4ad6-a3e8-15082266b31d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Oct 2024 14:59:10 +0100
Message-ID: <CAFEAcA9jwsD3p3Voj=q1Tcv0CZ7u2mADdfo6oQrGXr5FfFQQBg@mail.gmail.com>
Subject: Re: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: 1Q1nFbhUzS5/

On Tue, 8 Oct 2024 at 18:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/8/24 07:45, Peter Maydell wrote:
> > On Sat, 5 Oct 2024 at 21:06, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Zero is the safe do-nothing value for callers to use.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/internals.h      | 3 ++-
> >>   target/arm/ptw.c            | 2 +-
> >>   target/arm/tcg/m_helper.c   | 8 ++++----
> >>   target/arm/tcg/tlb_helper.c | 2 +-
> >>   4 files changed, 8 insertions(+), 7 deletions(-)
> >
> >> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> >> index 23d7f73035..f7354f3c6e 100644
> >> --- a/target/arm/tcg/m_helper.c
> >> +++ b/target/arm/tcg/m_helper.c
> >> @@ -222,7 +222,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
> >>       int exc;
> >>       bool exc_secure;
> >>
> >> -    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
> >> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, 0, mmu_idx, &res, &fi)) {
> >>           /* MPU/SAU lookup failed */
> >>           if (fi.type == ARMFault_QEMU_SFault) {
> >>               if (mode == STACK_LAZYFP) {
> >> @@ -311,7 +311,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
> >>       bool exc_secure;
> >>       uint32_t value;
> >>
> >> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
> >> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
> >>           /* MPU/SAU lookup failed */
> >>           if (fi.type == ARMFault_QEMU_SFault) {
> >>               qemu_log_mask(CPU_LOG_INT,
> >
> > We do actually know what kind of memory operation we're doing here:
> > it's a 4-byte access. (It should never be unaligned because an M-profile
> > SP can't ever be un-4-aligned, though I forget whether our implementation
> > really enforces that.)
> >
> >> @@ -2009,7 +2009,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
> >>                         "...really SecureFault with SFSR.INVEP\n");
> >>           return false;
> >>       }
> >> -    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
> >> +    if (get_phys_addr(env, addr, MMU_INST_FETCH, 0, mmu_idx, &res, &fi)) {
> >>           /* the MPU lookup failed */
> >>           env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
> >>           armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
> >
> > Similarly this is a 16-bit load that in theory should never
> > be possible to be unaligned.
> >
> >> @@ -2045,7 +2045,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
> >>       ARMMMUFaultInfo fi = {};
> >>       uint32_t value;
> >>
> >> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
> >> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
> >>           /* MPU/SAU lookup failed */
> >>           if (fi.type == ARMFault_QEMU_SFault) {
> >>               qemu_log_mask(CPU_LOG_INT,
> >
> > and this is another 4-byte load via sp.
> >
> >> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
> >> index 885bf4ec14..1d8b7bcaa2 100644
> >> --- a/target/arm/tcg/tlb_helper.c
> >> +++ b/target/arm/tcg/tlb_helper.c
> >> @@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> >>        * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
> >>        * register format, and signal the fault.
> >>        */
> >> -    ret = get_phys_addr(&cpu->env, address, access_type,
> >> +    ret = get_phys_addr(&cpu->env, address, access_type, 0,
> >>                           core_to_arm_mmu_idx(&cpu->env, mmu_idx),
> >>                           &res, fi);
> >>       if (likely(!ret)) {
>
> The question is: if it should be impossible for them to be misaligned, should we pass an
> argument that checks alignment and then (!) potentially raise a guest exception.
>
> I suspect the answer is no.
>
> If it should be impossible, no alignment fault is ever visible to the guest in this
> context, then we should at most assert(), otherwise do nothing.
>
> We *can* pass, e.g. MO_32 or MO_16 for documentation purposes, if you like.  Without
> additional adornment, this does not imply alignment enforcement (i.e. MO_ALIGN).  But this
> would be functionally indistinguishable from 0 (which I imperfectly documented with "or 0"
> in the function block comments).

Mmm. I think I thought when I started reviewing this series that we might
have a bigger set of "we put in 0 here but is that the right thing?"
callsites. But I think in working through it it turns out there aren't
very many and for all of those "don't check alignment" is the right thing.

thanks
-- PMM
