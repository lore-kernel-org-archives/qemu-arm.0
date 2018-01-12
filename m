Received: by 10.28.173.206 with SMTP id w197csp2164324wme;
        Fri, 12 Jan 2018 10:25:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBovzQo7PlTQlyUqIjZP/f6O3jO5wtIlV0u6PZAok8/Lz7S0rXO7xA+Zh8UGu8938RGWV1WeG
X-Received: by 10.37.232.1 with SMTP id k1mr8804159ybd.87.1515781507710;
        Fri, 12 Jan 2018 10:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515781507; cv=none;
        d=google.com; s=arc-20160816;
        b=xoTmpg93zWW8IXKmq08CK/K3FztUl1GUU/Uw3Y16n3+Ht0Nrcym4yD3vYnQ1sZ3/Nn
         QhTFkEL0In8OGL0yZV4fPVgzTplvUBJBKILrAEgzNgubq99aYOduMOI51684rY2Oy5QZ
         2M+KMLwzBRPCLw/+QtPwQxzStN9Wo4OuRBPly9n55551Ys+4HmAP+UBlCVl2qZY1JzZa
         RgMvw1ImOhP9sxq3Rl6S8X6dwNsftquOBieiOquLp/WRKoCF5XxsRepgnZr1u6O5v9ci
         M8XtNu2ucUgzAfayUpO7M8AvFbxeVsNuwnGvVbjdp63Ufx9rQ/oOADLDIrNGngnvOCbm
         HgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OFfguOzmY9UrG7pXlv8TFs8FAoR4Jb8Z1y6rnfLGvVg=;
        b=wwTYyhN6gT0C5ePGK0DXQVqd3l6AEhOXsFmiwFhh3tx2FC+zWbnZj+mFE6qiWCxMw9
         vUtBZRWBCH3aFiWWLMvrFzfCjPTKnh8Z5Htq+XznmHmLURMw3hs9WubvIk1ONGC2Kx5K
         YiTpARyyc3P/jud0aUBiPfOISDDmIP269McUYO4VVcpPnHbj30lrQ0h3mwpSFEPvzZ/f
         Zz/Z+p1IPRpT4Kepoius5V4xpt576TJwnoAcjZyjj+GDRPBzr46ggqXKmF16iYE141wh
         l1oM+R44JtHlYw26t0udIMq7oltTd3736rEDpeDjgpHDOcv0qfxEpwhrY1G0OJDMF8ph
         RCCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qb5ieOr3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c11si4792333ywl.287.2018.01.12.10.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 10:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qb5ieOr3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57809 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea40p-0004WN-2x
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 13:25:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea40c-0004To-Ad
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:24:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ea40Y-0000Ui-6D
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:24:54 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ea40X-0000U3-W7
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 13:24:50 -0500
Received: by mail-ot0-x244.google.com with SMTP id x15so5803973ote.0
	for <qemu-arm@nongnu.org>; Fri, 12 Jan 2018 10:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OFfguOzmY9UrG7pXlv8TFs8FAoR4Jb8Z1y6rnfLGvVg=;
	b=Qb5ieOr3m2LeX7lDN7UcnG1p6WLnuPNggEIQ3XbW7AW6qyumeNY1BT2S2V5YmkddO+
	SqsM0l2w+wYNE3/jaTziU+5FGszE8w5xnFEEnAPLeoc4sX+JHHfz+4wKDqLUJEg0bL0b
	b34ovzNOTXqyT8IbNFEaOaU4YGxb9vyE8NomM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OFfguOzmY9UrG7pXlv8TFs8FAoR4Jb8Z1y6rnfLGvVg=;
	b=rN4Oush2ZuD4o7GAOMjBU6GxtWjKL7KPshcN/9D66ZEVPAknPrIR7cmGmk5W2PxEmY
	DmWsOjlcfVPVcTN5Hy6G7LHW6kQLRvTNi3v/UvVJVZpVlmQLP0thSmI1dCYYErR5Zq9o
	UBH4MkuKNI81wg5VnPu7Y3PUjMD/9fN4Y427T8wh7JKYJH1HQfV5p6H/wMXiuT+iiJHe
	AAHGvwvwGPlY8zHTcsvsHSiGf1mx5Z6cPkqciBqCmkLuLPBBTbWEoyWNrX4nC8QPA7WT
	Ye/ZB8bhnCaXU70ghAFXfAQGBEaMqwxeEXtNlb9SA7caB2qXAhmrUu8DVbM3yP4s9wFd
	togg==
X-Gm-Message-State: AKwxytcb/cAse3qs4QvrplhYAA6F2rwwGHAULe1Z3Ku+OXId7ttLTEPV
	fSb9oFL8U6SkHB9N6zMIv0wWe7ttqobWnnZSWtNwmw==
X-Received: by 10.157.29.233 with SMTP id w38mr14182862otw.24.1515781488705;
	Fri, 12 Jan 2018 10:24:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Fri, 12 Jan 2018 10:24:28 -0800 (PST)
In-Reply-To: <20171218173022.18418-6-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2018 18:24:28 +0000
Message-ID: <CAFEAcA_NXsPZYJHhYZShroXFUS_5SwpJCi8ehBL+o4OxpNqYmA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH 5/9] target/arm: Add
 aa32_vfp_dreg/aa64_vfp_qreg helpers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zo4X2Q8nPLXs

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Helpers that return a pointer into env->vfp.regs so that we isolate
> the logic of how to index the regs array for different cpu modes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 20 +++++++++++++++++++-
>  linux-user/signal.c        | 22 ++++++++++++----------
>  target/arm/arch_dump.c     |  8 +++++---
>  target/arm/helper-a64.c    | 13 +++++++------
>  target/arm/helper.c        | 32 ++++++++++++++++++++------------
>  target/arm/kvm32.c         |  4 ++--
>  target/arm/kvm64.c         | 31 ++++++++++---------------------
>  target/arm/machine.c       |  2 +-
>  target/arm/translate-a64.c | 25 ++++++++-----------------
>  target/arm/translate.c     | 16 +++++++++-------
>  10 files changed, 93 insertions(+), 80 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 7a705a09a1..e1a8e2880d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -493,7 +493,7 @@ typedef struct CPUARMState {
>           * the two execution states, and means we do not need to explicitly
>           * map these registers when changing states.
>           */
> -        float64 regs[64] QEMU_ALIGNED(16);
> +        uint64_t regs[64] QEMU_ALIGNED(16);
>
>          uint32_t xregs[16];
>          /* We store these fpcsr fields separately for convenience.  */
> @@ -2899,4 +2899,22 @@ static inline void *arm_get_el_change_hook_opaque(ARMCPU *cpu)
>      return cpu->el_change_hook_opaque;
>  }
>
> +/**
> + * aa32_vfp_dreg:
> + * Return a pointer to the Dn register within env in 32-bit mode.
> + */
> +static inline uint64_t *aa32_vfp_dreg(CPUARMState *env, unsigned regno)
> +{
> +    return &env->vfp.regs[regno];
> +}
> +
> +/**
> + * aa64_vfp_dreg:
> + * Return a pointer to the Qn register within env in 64-bit mode.
> + */
> +static inline uint64_t *aa64_vfp_qreg(CPUARMState *env, unsigned regno)

Comment and code disagree about the name of the function...

> +{
> +    return &env->vfp.regs[2 * regno];
> +}
> +
>  #endif
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index cf35473671..a9a3f41721 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -1487,12 +1487,13 @@ static int target_setup_sigframe(struct target_rt_sigframe *sf,
>      }
>
>      for (i = 0; i < 32; i++) {
> +        uint64_t *q = aa64_vfp_qreg(env, i);
>  #ifdef TARGET_WORDS_BIGENDIAN
> -        __put_user(env->vfp.regs[i * 2], &aux->fpsimd.vregs[i * 2 + 1]);
> -        __put_user(env->vfp.regs[i * 2 + 1], &aux->fpsimd.vregs[i * 2]);
> +        __put_user(q[0], &aux->fpsimd.vregs[i * 2 + 1]);
> +        __put_user(q[1], &aux->fpsimd.vregs[i * 2]);
>  #else
> -        __put_user(env->vfp.regs[i * 2], &aux->fpsimd.vregs[i * 2]);
> -        __put_user(env->vfp.regs[i * 2 + 1], &aux->fpsimd.vregs[i * 2 + 1]);
> +        __put_user(q[0], &aux->fpsimd.vregs[i * 2]);
> +        __put_user(q[1], &aux->fpsimd.vregs[i * 2 + 1]);
>  #endif
>      }
>      __put_user(vfp_get_fpsr(env), &aux->fpsimd.fpsr);
> @@ -1539,12 +1540,13 @@ static int target_restore_sigframe(CPUARMState *env,
>      }
>
>      for (i = 0; i < 32; i++) {
> +        uint64_t *q = aa64_vfp_qreg(env, i);
>  #ifdef TARGET_WORDS_BIGENDIAN
> -        __get_user(env->vfp.regs[i * 2], &aux->fpsimd.vregs[i * 2 + 1]);
> -        __get_user(env->vfp.regs[i * 2 + 1], &aux->fpsimd.vregs[i * 2]);
> +        __get_user(q[0], &aux->fpsimd.vregs[i * 2 + 1]);
> +        __get_user(q[1], &aux->fpsimd.vregs[i * 2]);
>  #else
> -        __get_user(env->vfp.regs[i * 2], &aux->fpsimd.vregs[i * 2]);
> -        __get_user(env->vfp.regs[i * 2 + 1], &aux->fpsimd.vregs[i * 2 + 1]);
> +        __get_user(q[0], &aux->fpsimd.vregs[i * 2]);
> +        __get_user(q[1], &aux->fpsimd.vregs[i * 2 + 1]);
>  #endif
>      }
>      __get_user(fpsr, &aux->fpsimd.fpsr);
> @@ -1899,7 +1901,7 @@ static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)
>      __put_user(TARGET_VFP_MAGIC, &vfpframe->magic);
>      __put_user(sizeof(*vfpframe), &vfpframe->size);
>      for (i = 0; i < 32; i++) {
> -        __put_user(float64_val(env->vfp.regs[i]), &vfpframe->ufp.fpregs[i]);
> +        __put_user(*aa32_vfp_dreg(env, i), &vfpframe->ufp.fpregs[i]);
>      }
>      __put_user(vfp_get_fpscr(env), &vfpframe->ufp.fpscr);
>      __put_user(env->vfp.xregs[ARM_VFP_FPEXC], &vfpframe->ufp_exc.fpexc);
> @@ -2206,7 +2208,7 @@ static abi_ulong *restore_sigframe_v2_vfp(CPUARMState *env, abi_ulong *regspace)
>          return 0;
>      }
>      for (i = 0; i < 32; i++) {
> -        __get_user(float64_val(env->vfp.regs[i]), &vfpframe->ufp.fpregs[i]);
> +        __get_user(*aa32_vfp_dreg(env, i), &vfpframe->ufp.fpregs[i]);
>      }
>      __get_user(fpscr, &vfpframe->ufp.fpscr);
>      vfp_set_fpscr(env, fpscr);
> diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
> index 9e5b2fb31c..26a2c09868 100644
> --- a/target/arm/arch_dump.c
> +++ b/target/arm/arch_dump.c
> @@ -99,8 +99,10 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
>
>      aarch64_note_init(&note, s, "CORE", 5, NT_PRFPREG, sizeof(note.vfp));
>
> -    for (i = 0; i < 64; ++i) {
> -        note.vfp.vregs[i] = cpu_to_dump64(s, float64_val(env->vfp.regs[i]));
> +    for (i = 0; i < 32; ++i) {
> +        uint64_t *q = aa64_vfp_qreg(env, i);
> +        note.vfp.vregs[2*i + 0] = cpu_to_dump64(s, q[0]);
> +        note.vfp.vregs[2*i + 1] = cpu_to_dump64(s, q[1]);

This doesn't change the behaviour but I suspect it's wrong for big-endian...

>      }
>
>      if (s->dump_info.d_endian == ELFDATA2MSB) {
> @@ -229,7 +231,7 @@ static int arm_write_elf32_vfp(WriteCoreDumpFunction f, CPUARMState *env,
>      arm_note_init(&note, s, "LINUX", 6, NT_ARM_VFP, sizeof(note.vfp));
>
>      for (i = 0; i < 32; ++i) {
> -        note.vfp.vregs[i] = cpu_to_dump64(s, float64_val(env->vfp.regs[i]));
> +        note.vfp.vregs[i] = cpu_to_dump64(s, *aa32_vfp_dreg(env, i));
>      }
>
>      note.vfp.fpscr = cpu_to_dump32(s, vfp_get_fpscr(env));
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index 0bcf02eeb5..750a088803 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -146,20 +146,21 @@ uint64_t HELPER(simd_tbl)(CPUARMState *env, uint64_t result, uint64_t indices,
>       * the table starts, and numregs the number of registers in the table.
>       * We return the results of the lookups.
>       */
> -    int shift;
> +    unsigned shift;
>
>      for (shift = 0; shift < 64; shift += 8) {
> -        int index = extract64(indices, shift, 8);
> +        unsigned index = extract64(indices, shift, 8);
>          if (index < 16 * numregs) {
>              /* Convert index (a byte offset into the virtual table
>               * which is a series of 128-bit vectors concatenated)
> -             * into the correct vfp.regs[] element plus a bit offset
> +             * into the correct register element plus a bit offset
>               * into that element, bearing in mind that the table
>               * can wrap around from V31 to V0.
>               */
> -            int elt = (rn * 2 + (index >> 3)) % 64;
> -            int bitidx = (index & 7) * 8;
> -            uint64_t val = extract64(env->vfp.regs[elt], bitidx, 8);
> +            unsigned elt = (rn * 2 + (index >> 3)) % 64;
> +            unsigned bitidx = (index & 7) * 8;
> +            uint64_t *q = aa64_vfp_qreg(env, elt >> 1);
> +            uint64_t val = extract64(q[elt & 1], bitidx, 8);


Any particular reason for changing all these ints to unsigned ?

>
>              result = deposit64(result, shift, 8, val);
>          }
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 02d1b57501..7f304111f0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -64,15 +64,16 @@ static int vfp_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
>      /* VFP data registers are always little-endian.  */
>      nregs = arm_feature(env, ARM_FEATURE_VFP3) ? 32 : 16;
>      if (reg < nregs) {
> -        stfq_le_p(buf, env->vfp.regs[reg]);
> +        stfq_le_p(buf, *aa32_vfp_dreg(env, reg));
>          return 8;
>      }
>      if (arm_feature(env, ARM_FEATURE_NEON)) {
>          /* Aliases for Q regs.  */
>          nregs += 16;
>          if (reg < nregs) {
> -            stfq_le_p(buf, env->vfp.regs[(reg - 32) * 2]);
> -            stfq_le_p(buf + 8, env->vfp.regs[(reg - 32) * 2 + 1]);
> +            uint64_t *q = aa32_vfp_dreg(env, (reg - 32) * 2);
> +            stfq_le_p(buf, q[0]);
> +            stfq_le_p(buf + 8, q[1]);
>              return 16;
>          }
>      }
> @@ -90,14 +91,15 @@ static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
>
>      nregs = arm_feature(env, ARM_FEATURE_VFP3) ? 32 : 16;
>      if (reg < nregs) {
> -        env->vfp.regs[reg] = ldfq_le_p(buf);
> +        *aa32_vfp_dreg(env, reg) = ldfq_le_p(buf);
>          return 8;
>      }
>      if (arm_feature(env, ARM_FEATURE_NEON)) {
>          nregs += 16;
>          if (reg < nregs) {
> -            env->vfp.regs[(reg - 32) * 2] = ldfq_le_p(buf);
> -            env->vfp.regs[(reg - 32) * 2 + 1] = ldfq_le_p(buf + 8);
> +            uint64_t *q = aa32_vfp_dreg(env, (reg - 32) * 2);
> +            q[0] = ldfq_le_p(buf);
> +            q[1] = ldfq_le_p(buf + 8);
>              return 16;
>          }
>      }
> @@ -114,9 +116,12 @@ static int aarch64_fpu_gdb_get_reg(CPUARMState *env, uint8_t *buf, int reg)
>      switch (reg) {
>      case 0 ... 31:
>          /* 128 bit FP register */
> -        stfq_le_p(buf, env->vfp.regs[reg * 2]);
> -        stfq_le_p(buf + 8, env->vfp.regs[reg * 2 + 1]);
> -        return 16;
> +        {
> +            uint64_t *q = aa64_vfp_qreg(env, reg);
> +            stfq_le_p(buf, q[0]);
> +            stfq_le_p(buf + 8, q[1]);
> +            return 16;
> +        }
>      case 32:
>          /* FPSR */
>          stl_p(buf, vfp_get_fpsr(env));
> @@ -135,9 +140,12 @@ static int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
>      switch (reg) {
>      case 0 ... 31:
>          /* 128 bit FP register */
> -        env->vfp.regs[reg * 2] = ldfq_le_p(buf);
> -        env->vfp.regs[reg * 2 + 1] = ldfq_le_p(buf + 8);
> -        return 16;
> +        {
> +            uint64_t *q = aa64_vfp_qreg(env, reg);
> +            q[0] = ldfq_le_p(buf);
> +            q[1] = ldfq_le_p(buf + 8);
> +            return 16;
> +        }
>      case 32:
>          /* FPSR */
>          vfp_set_fpsr(env, ldl_p(buf));
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index f925a21481..f77c9c494b 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -358,7 +358,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>      /* VFP registers */
>      r.id = KVM_REG_ARM | KVM_REG_SIZE_U64 | KVM_REG_ARM_VFP;
>      for (i = 0; i < 32; i++) {
> -        r.addr = (uintptr_t)(&env->vfp.regs[i]);
> +        r.addr = (uintptr_t)aa32_vfp_dreg(env, i);
>          ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &r);
>          if (ret) {
>              return ret;
> @@ -445,7 +445,7 @@ int kvm_arch_get_registers(CPUState *cs)
>      /* VFP registers */
>      r.id = KVM_REG_ARM | KVM_REG_SIZE_U64 | KVM_REG_ARM_VFP;
>      for (i = 0; i < 32; i++) {
> -        r.addr = (uintptr_t)(&env->vfp.regs[i]);
> +        r.addr = (uintptr_t)aa32_vfp_dreg(env, i);
>          ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &r);
>          if (ret) {
>              return ret;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 6554c30007..ac728494a4 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -696,21 +696,16 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          }
>      }
>
> -    /* Advanced SIMD and FP registers
> -     * We map Qn = regs[2n+1]:regs[2n]
> -     */
> +    /* Advanced SIMD and FP registers. */
>      for (i = 0; i < 32; i++) {
> -        int rd = i << 1;
> -        uint64_t fp_val[2];
> +        uint64_t *q = aa64_vfp_qreg(env, i);
>  #ifdef HOST_WORDS_BIGENDIAN
> -        fp_val[0] = env->vfp.regs[rd + 1];
> -        fp_val[1] = env->vfp.regs[rd];
> +        uint64_t fp_val[2] = { q[1], q[0] };
> +        reg.addr = (uintptr_t)fp_val;
>  #else
> -        fp_val[1] = env->vfp.regs[rd + 1];
> -        fp_val[0] = env->vfp.regs[rd];
> +        reg.addr = (uintptr_t)q;
>  #endif
>          reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
> -        reg.addr = (uintptr_t)(&fp_val);
>          ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
>          if (ret) {
>              return ret;
> @@ -837,24 +832,18 @@ int kvm_arch_get_registers(CPUState *cs)
>          env->spsr = env->banked_spsr[i];
>      }
>
> -    /* Advanced SIMD and FP registers
> -     * We map Qn = regs[2n+1]:regs[2n]
> -     */
> +    /* Advanced SIMD and FP registers */
>      for (i = 0; i < 32; i++) {
> -        uint64_t fp_val[2];
> +        uint64_t *q = aa64_vfp_qreg(env, i);
>          reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
> -        reg.addr = (uintptr_t)(&fp_val);
> +        reg.addr = (uintptr_t)q;
>          ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
>          if (ret) {
>              return ret;
>          } else {
> -            int rd = i << 1;
>  #ifdef HOST_WORDS_BIGENDIAN
> -            env->vfp.regs[rd + 1] = fp_val[0];
> -            env->vfp.regs[rd] = fp_val[1];
> -#else
> -            env->vfp.regs[rd + 1] = fp_val[1];
> -            env->vfp.regs[rd] = fp_val[0];
> +            uint64_t t;
> +            t = q[0], q[0] = q[1], q[1] = t;
>  #endif
>          }
>      }
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 176274629c..a85c2430d3 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -50,7 +50,7 @@ static const VMStateDescription vmstate_vfp = {
>      .minimum_version_id = 3,
>      .needed = vfp_needed,
>      .fields = (VMStateField[]) {
> -        VMSTATE_FLOAT64_ARRAY(env.vfp.regs, ARMCPU, 64),
> +        VMSTATE_UINT64_ARRAY(env.vfp.regs, ARMCPU, 64),
>          /* The xregs array is a little awkward because element 1 (FPSCR)
>           * requires a specific accessor, so we have to split it up in
>           * the vmstate:
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index d246e8f6b5..e17c7269d4 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -170,15 +170,12 @@ void aarch64_cpu_dump_state(CPUState *cs, FILE *f,
>
>      if (flags & CPU_DUMP_FPU) {
>          int numvfpregs = 32;
> -        for (i = 0; i < numvfpregs; i += 2) {
> -            uint64_t vlo = float64_val(env->vfp.regs[i * 2]);
> -            uint64_t vhi = float64_val(env->vfp.regs[(i * 2) + 1]);
> -            cpu_fprintf(f, "q%02d=%016" PRIx64 ":%016" PRIx64 " ",
> -                        i, vhi, vlo);
> -            vlo = float64_val(env->vfp.regs[(i + 1) * 2]);
> -            vhi = float64_val(env->vfp.regs[((i + 1) * 2) + 1]);
> -            cpu_fprintf(f, "q%02d=%016" PRIx64 ":%016" PRIx64 "\n",
> -                        i + 1, vhi, vlo);
> +        for (i = 0; i < numvfpregs; i++) {
> +            uint64_t *q = aa64_vfp_qreg(env, i);
> +            uint64_t vlo = q[0];
> +            uint64_t vhi = q[1];
> +            cpu_fprintf(f, "q%02d=%016" PRIx64 ":%016" PRIx64 "%c",
> +                        i, vhi, vlo, (i & 1 ? '\n' : ' '));
>          }
>          cpu_fprintf(f, "FPCR: %08x  FPSR: %08x\n",
>                      vfp_get_fpcr(env), vfp_get_fpsr(env));
> @@ -572,19 +569,13 @@ static TCGv_ptr vec_full_reg_ptr(DisasContext *s, int regno)
>   */
>  static inline int fp_reg_offset(DisasContext *s, int regno, TCGMemOp size)
>  {
> -    int offs = offsetof(CPUARMState, vfp.regs[regno * 2]);
> -#ifdef HOST_WORDS_BIGENDIAN
> -    offs += (8 - (1 << size));
> -#endif
> -    assert_fp_access_checked(s);
> -    return offs;
> +    return vec_reg_offset(s, regno, 0, size);
>  }
>
>  /* Offset of the high half of the 128 bit vector Qn */
>  static inline int fp_reg_hi_offset(DisasContext *s, int regno)
>  {
> -    assert_fp_access_checked(s);
> -    return offsetof(CPUARMState, vfp.regs[regno * 2 + 1]);
> +    return vec_reg_offset(s, regno, 1, MO_64);
>  }
>
>  /* Convenience accessors for reading and writing single and double
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 55afd29b21..a93e26498e 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1516,14 +1516,16 @@ static inline void gen_vfp_st(DisasContext *s, int dp, TCGv_i32 addr)
>  static inline long
>  vfp_reg_offset (int dp, int reg)
>  {
> -    if (dp)
> +    if (dp) {
>          return offsetof(CPUARMState, vfp.regs[reg]);
> -    else if (reg & 1) {
> -        return offsetof(CPUARMState, vfp.regs[reg >> 1])
> -          + offsetof(CPU_DoubleU, l.upper);
>      } else {
> -        return offsetof(CPUARMState, vfp.regs[reg >> 1])
> -          + offsetof(CPU_DoubleU, l.lower);
> +        long ofs = offsetof(CPUARMState, vfp.regs[reg >> 1]);
> +        if (reg & 1) {
> +            ofs += offsetof(CPU_DoubleU, l.upper);
> +        } else {
> +            ofs += offsetof(CPU_DoubleU, l.lower);
> +        }
> +        return ofs;
>      }

This hunk seems to just be rearranging the if-logic without
doing anything else, right?

>  }
>
> @@ -12770,7 +12772,7 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
>              numvfpregs += 16;
>          }
>          for (i = 0; i < numvfpregs; i++) {
> -            uint64_t v = float64_val(env->vfp.regs[i]);
> +            uint64_t v = *aa32_vfp_dreg(env, i);
>              cpu_fprintf(f, "s%02d=%08x s%02d=%08x d%02d=%016" PRIx64 "\n",
>                          i * 2, (uint32_t)v,
>                          i * 2 + 1, (uint32_t)(v >> 32),
> --
> 2.14.3
>

thanks
-- PMM
