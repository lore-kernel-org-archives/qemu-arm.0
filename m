Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp243328njl;
        Tue, 8 Oct 2024 07:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtmMyrRbshhM4uD42zXBbRrVOBLlduJagKwiYX5CH+KNk3N/jj1LReGPoS+hCMjjc/PiQbTAsqmmPRYQ==@linaro.org
X-Received: by 2002:a17:907:3e05:b0:a93:d5d3:be4 with SMTP id a640c23a62f3a-a991bd16c3fmr1610531566b.13.1728398765870;
        Tue, 08 Oct 2024 07:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728398765; cv=none;
        d=google.com; s=arc-20240605;
        b=J38UQk8w9hpA5I8K90afkv767dSa8nU0QOGRTdWsW1io3u5IHpPgxNap7+8AjH0EoB
         aM1h34DKy+s1cJn3xHGSLPj9zeokMz2G0t7LYzJQYlEO9KIYzRJZIwSUT16WOZ1BPznc
         bQB8A/2aooMCyUlMUzLXeHzvs2yE29r2U7tVNZ1vSq2/q1NsZJCpIEu6X5GMW30eZucG
         9LaArquaxk3S1tfjSb9KCZtLYFqkkGT6C+QEV6CH3VP1uPE8wPfT5FGSWl40hSHgHV+x
         dXcuCSptAy+OSSY1FqJaHZXuuE2Ipln2jLoyWKfRitYLHykQT/TWInP1MWj03BV13n9W
         dH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j5MphECLD4P0U/jqbmbESSvAYHMevQyba1bA/1qjbuA=;
        fh=5bsxa+6u59BK7EttGcknRG4ajhDZmxGhIcafQ0okKg0=;
        b=E+M7JUeRKTho8thwDQZVTqMXmP8fNxceAEXSZpFZUr4GLbs8MznZrcuOxJaaF64gmW
         bu26oqkQQIzB13Tvk0wUL9xCOTqLqpRSX422sLW5nfrhlG0I+LltswyB3XpKFaFmKw3y
         Y03SkSmDo2j8gQozWv8pcm/ERPXbx/R3eSrVTvQ+spwP9zx1XrVcrzqi6/DX6mOMSecS
         5wVUzoAMmMWO/acl4GrBtzwi8fPnGqlcBUWTyYV+2P3JbuBraL7t8b782vv98H6gDv0V
         6oKfX+sfVOUIPMXtynImkaGx6IvCWFSrUcdLU9nucRpD4BGnttmNrrVE72I70F6TYpH1
         cphA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FhceTU5I;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a9943221077sor245406066b.1.2024.10.08.07.46.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FhceTU5I;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728398765; x=1729003565; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j5MphECLD4P0U/jqbmbESSvAYHMevQyba1bA/1qjbuA=;
        b=FhceTU5I36wM+O/VrvGnUSND9Zf541fSAkOBslMZiAMOS+rWybNhslju+dIZycPhl8
         JFysQ9wnwqlbpMesW+ZfAvFNmzbQ/uldHkEWcAQGeG0V2Ezdxn4/gcDKITUn+Ek0qKTu
         K+kr8U9Euoi58nXeTu7FnlYspQu78A1KFi/48+CdRJrsrOow7r7FEpuu/ZxYRVI1tvj1
         f0LnZkQNxcQSzX92WFwz5YEDlceVlEcz6cf5WH0PUv1ipb2Sc1UD4hz8mDbaTBekYA8G
         42YLnbxxBXv3f6vcl2yWogN5ycJTPx73yh1lnl+O3+steZv4xad1vxC4hB9nPltc5522
         FlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398765; x=1729003565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5MphECLD4P0U/jqbmbESSvAYHMevQyba1bA/1qjbuA=;
        b=EFXSzlJLgCJ76T4kjEqJuUerOmT66vldqc21xRyXGrzIUP2i5flyZa0t3dAZw0qfpK
         O+LmBMPAWot7O1+J1rgQW7xVVMD8e0JvcddI5oAR09/2cgvDH5p+31dPtYm6XNuPHMVW
         ob8ojz6glQQTzIOHexTB7K+92Ab2PoV2GzYdRJj/TY4Kvfe6TusUGo1a6+eICyW3oBIo
         ctajaS0lzDkIIn4Iy17783uDLKyV8r+sD02+rO7ACZ0B1rfSAmNocfPyo/Kvs3WkE869
         wEBzMEyz2n07H2f6zrTjJxxK5531Dm02i/91gz5p6HY4EOh6tWxUDQcXuzADFch2C9Ud
         kVNA==
X-Forwarded-Encrypted: i=1; AJvYcCWLhLzAvTTUnOpaqF4ziR+Bs6rD6dQu9bemov1dUHxuH7dhHBXIyp22iSAc2kn6hxpq8w+LFJtSBojMqw==@linaro.org
X-Gm-Message-State: AOJu0YwAhoAik7g1z1DWyo/WPKJMWVSZ4/BG9vOAKIUwYK1D6SwwcoxC
	lPfz8v5EXhmDNETKF1MlCCwuYp7ZD7HIC/Yn3B38iSnjW8bIPhVhbIKFRW1bC7Oz6Q7teujXcuC
	jXLJR+apbcnRijENh32g+HJ9hDE3UPD7pSYQp/0ur
X-Google-Smtp-Source: AGHT+IGbbRXahkkw9UahWbFZHSA6zRVWmmssrHeW2g12mO5Ut8YunOTSsC5XXWpGwl8aN5g3vofSKPBmJRKe9gpczlc=
X-Received: by 2002:a05:6402:50d0:b0:5c8:a92b:b0a with SMTP id
 4fb4d7f45d1cf-5c8d2e1efd5mr13576867a12.1.1728398765144; Tue, 08 Oct 2024
 07:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-14-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:45:53 +0100
Message-ID: <CAFEAcA_jXTuB6c8oVcXmi66zcXn5-PYM7W9z1wf7-fzXg7_Oiw@mail.gmail.com>
Subject: Re: [PATCH v2 13/21] target/arm: Pass MemOp to get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: Bw6/XisNDndd

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Zero is the safe do-nothing value for callers to use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h      | 3 ++-
>  target/arm/ptw.c            | 2 +-
>  target/arm/tcg/m_helper.c   | 8 ++++----
>  target/arm/tcg/tlb_helper.c | 2 +-
>  4 files changed, 8 insertions(+), 7 deletions(-)

> diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
> index 23d7f73035..f7354f3c6e 100644
> --- a/target/arm/tcg/m_helper.c
> +++ b/target/arm/tcg/m_helper.c
> @@ -222,7 +222,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
>      int exc;
>      bool exc_secure;
>
> -    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &res, &fi)) {
> +    if (get_phys_addr(env, addr, MMU_DATA_STORE, 0, mmu_idx, &res, &fi)) {
>          /* MPU/SAU lookup failed */
>          if (fi.type == ARMFault_QEMU_SFault) {
>              if (mode == STACK_LAZYFP) {
> @@ -311,7 +311,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
>      bool exc_secure;
>      uint32_t value;
>
> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
>          /* MPU/SAU lookup failed */
>          if (fi.type == ARMFault_QEMU_SFault) {
>              qemu_log_mask(CPU_LOG_INT,

We do actually know what kind of memory operation we're doing here:
it's a 4-byte access. (It should never be unaligned because an M-profile
SP can't ever be un-4-aligned, though I forget whether our implementation
really enforces that.)

> @@ -2009,7 +2009,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
>                        "...really SecureFault with SFSR.INVEP\n");
>          return false;
>      }
> -    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx, &res, &fi)) {
> +    if (get_phys_addr(env, addr, MMU_INST_FETCH, 0, mmu_idx, &res, &fi)) {
>          /* the MPU lookup failed */
>          env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);

Similarly this is a 16-bit load that in theory should never
be possible to be unaligned.

> @@ -2045,7 +2045,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
>      ARMMMUFaultInfo fi = {};
>      uint32_t value;
>
> -    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &res, &fi)) {
> +    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
>          /* MPU/SAU lookup failed */
>          if (fi.type == ARMFault_QEMU_SFault) {
>              qemu_log_mask(CPU_LOG_INT,

and this is another 4-byte load via sp.

> diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
> index 885bf4ec14..1d8b7bcaa2 100644
> --- a/target/arm/tcg/tlb_helper.c
> +++ b/target/arm/tcg/tlb_helper.c
> @@ -344,7 +344,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
>       * register format, and signal the fault.
>       */
> -    ret = get_phys_addr(&cpu->env, address, access_type,
> +    ret = get_phys_addr(&cpu->env, address, access_type, 0,
>                          core_to_arm_mmu_idx(&cpu->env, mmu_idx),
>                          &res, fi);
>      if (likely(!ret)) {

thanks
-- PMM
