Received: by 10.25.208.211 with SMTP id h202csp1302780lfg;
        Mon, 29 Feb 2016 13:23:00 -0800 (PST)
X-Received: by 10.140.157.214 with SMTP id d205mr23558387qhd.3.1456780979987;
        Mon, 29 Feb 2016 13:22:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w189si1273174qka.47.2016.02.29.13.22.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Feb 2016 13:22:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaVHP-0005t5-C9
	for alex.bennee@linaro.org; Mon, 29 Feb 2016 16:22:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aaVHK-0005p2-TU
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 16:22:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aaVHI-000177-Nq
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 16:22:54 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:37414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aaVH9-00016E-7l; Mon, 29 Feb 2016 16:22:43 -0500
Received: by mail-wm0-x230.google.com with SMTP id p65so7625994wmp.0;
	Mon, 29 Feb 2016 13:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TUPToUjOkjVXVtP1STmyt/nwHAPACcVNm+5dRLRTpwk=;
	b=G+9y2zrW/raXU4cl8QYLfBPWh10FGivmAUNun5Gu30CAGjFQn/2+PNHI+OUY+fQjiz
	JtUpTbzGWB5m2QdB/UXZU8OINfO492kWPJ7iBOZahzurOgw5hlpBqGz58xO+jHW3C2gB
	ktyBDvS10hSCoXBrFmQLiuuYhF/rywglocBCYYpXHHZbgQWEJBfYgRhDNuBOk70gGEaT
	hAaok6AUVZfRF2FHtTPvZHMBQcDyjp55MZDGthUudL/mmXpVsE/EuT3CJEjJZsx3AMh3
	A8eO8Kv+C55LotEgfpAcd2zzr3VQI5eiOx91t9QvI19TAdR5CmgqfZzDqMMXCKKNqfm3
	U/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TUPToUjOkjVXVtP1STmyt/nwHAPACcVNm+5dRLRTpwk=;
	b=akaOUCBbVmURIhPCGzdO+CG/uReBqdqg6jD/tCWOkc7vkXosIowNSH/2rkGeref/LM
	DAIHb2yffFd2hn/66c6mYLNnpBU7+JhyRiEQxiowt4LYOJ2sGgGfM4jOoH61teUzGf2N
	vZ/j5Y4O06A6ehNm5U0UTtZwjj39LvLiQNciLVdh7MgfTkNu9LqLztIP0BHk5Fgmlowg
	8AQkC7mxt/MNJzEUCJT4qPmi6lcp0Cv+wbboJpbzj86D2dUQ1Gf1KevFsUMMBwtbrkBF
	zcg1RLX7zbdyA4hwhmpWJoHgdazU4xqAR2IlQUVSk4S7CkYBQTw8ykTm7TVYzalB08M2
	lA6g==
X-Gm-Message-State: AD7BkJJi4IR18rdsjuothh+igu2nGlWpdOjNyeRlDY372EF0qF7K7mQKN828iDDRnNKzPg==
X-Received: by 10.28.20.145 with SMTP id 139mr88999wmu.76.1456780961591;
	Mon, 29 Feb 2016 13:22:41 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	ka4sm27696998wjc.47.2016.02.29.13.22.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Feb 2016 13:22:40 -0800 (PST)
Date: Mon, 29 Feb 2016 22:22:39 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160229212239.GF16305@toto>
References: <1456762734-23939-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456762734-23939-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH] target-arm: Implement MRS (banked) and MSR
 (banked) instructions
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rtiBMDbWvfIm

On Mon, Feb 29, 2016 at 04:18:54PM +0000, Peter Maydell wrote:
> Starting with the ARMv7 Virtualization Extensions, the A32 and T32
> instruction sets provide instructions "MSR (banked)" and "MRS
> (banked)" which can be used to access registers for a mode other
> than the current one:
>  * R<m>_<mode>
>  * ELR_hyp
>  * SPSR_<mode>
> 
> Implement the missing instructions.

Wow, these insns were a bit messy to follow... Anyway, AFAIK this looks OK:

Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We don't support EL2 yet, but you can get at these on a v8 CPU in
> 32-bit EL1 if EL3 is enabled. Obviously there's not going to be much
> 32-bit EL1 code out there that uses the insns though, as it wouldn't
> work on v7 if it did...
> 
>  target-arm/helper.h    |   3 +
>  target-arm/op_helper.c | 120 ++++++++++++++++++++++++
>  target-arm/translate.c | 246 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 366 insertions(+), 3 deletions(-)
> 
> diff --git a/target-arm/helper.h b/target-arm/helper.h
> index ea13202..de3c644 100644
> --- a/target-arm/helper.h
> +++ b/target-arm/helper.h
> @@ -76,6 +76,9 @@ DEF_HELPER_1(exception_return, void, env)
>  DEF_HELPER_2(get_r13_banked, i32, env, i32)
>  DEF_HELPER_3(set_r13_banked, void, env, i32, i32)
>  
> +DEF_HELPER_3(mrs_banked, i32, env, i32, i32)
> +DEF_HELPER_4(msr_banked, void, env, i32, i32, i32)
> +
>  DEF_HELPER_2(get_user_reg, i32, env, i32)
>  DEF_HELPER_3(set_user_reg, void, env, i32, i32)
>  
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index 4881e34..a2afdd8 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -489,6 +489,126 @@ uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
>      }
>  }
>  
> +static void msr_mrs_banked_exc_checks(CPUARMState *env, uint32_t tgtmode,
> +                                      uint32_t regno)
> +{
> +    /* Raise an exception if the requested access is one of the UNPREDICTABLE
> +     * cases; otherwise return. This broadly corresponds to the pseudocode
> +     * BankedRegisterAccessValid() and SPSRAccessValid(),
> +     * except that we have already handled some cases at translate time.
> +     */
> +    int curmode = env->uncached_cpsr & CPSR_M;
> +
> +    if (curmode == tgtmode) {
> +        goto undef;
> +    }
> +
> +    if (tgtmode == ARM_CPU_MODE_USR) {
> +        switch (regno) {
> +        case 8 ... 12:
> +            if (curmode != ARM_CPU_MODE_FIQ) {
> +                goto undef;
> +            }
> +            break;
> +        case 13:
> +            if (curmode == ARM_CPU_MODE_SYS) {
> +                goto undef;
> +            }
> +            break;
> +        case 14:
> +            if (curmode == ARM_CPU_MODE_HYP || curmode == ARM_CPU_MODE_SYS) {
> +                goto undef;
> +            }
> +            break;
> +        default:
> +            break;
> +        }
> +    }
> +
> +    if (tgtmode == ARM_CPU_MODE_HYP) {
> +        switch (regno) {
> +        case 17: /* ELR_Hyp */
> +            if (curmode != ARM_CPU_MODE_HYP && curmode != ARM_CPU_MODE_MON) {
> +                goto undef;
> +            }
> +            break;
> +        default:
> +            if (curmode != ARM_CPU_MODE_MON) {
> +                goto undef;
> +            }
> +            break;
> +        }
> +    }
> +
> +    return;
> +
> +undef:
> +    raise_exception(env, EXCP_UDEF, syn_uncategorized(),
> +                    exception_target_el(env));
> +}
> +
> +void HELPER(msr_banked)(CPUARMState *env, uint32_t value, uint32_t tgtmode,
> +                        uint32_t regno)
> +{
> +    msr_mrs_banked_exc_checks(env, tgtmode, regno);
> +
> +    switch (regno) {
> +    case 16: /* SPSRs */
> +        env->banked_spsr[bank_number(tgtmode)] = value;
> +        break;
> +    case 17: /* ELR_Hyp */
> +        env->elr_el[2] = value;
> +        break;
> +    case 13:
> +        env->banked_r13[bank_number(tgtmode)] = value;
> +        break;
> +    case 14:
> +        env->banked_r14[bank_number(tgtmode)] = value;
> +        break;
> +    case 8 ... 12:
> +        switch (tgtmode) {
> +        case ARM_CPU_MODE_USR:
> +            env->usr_regs[regno - 8] = value;
> +            break;
> +        case ARM_CPU_MODE_FIQ:
> +            env->fiq_regs[regno - 8] = value;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +uint32_t HELPER(mrs_banked)(CPUARMState *env, uint32_t tgtmode, uint32_t regno)
> +{
> +    msr_mrs_banked_exc_checks(env, tgtmode, regno);
> +
> +    switch (regno) {
> +    case 16: /* SPSRs */
> +        return env->banked_spsr[bank_number(tgtmode)];
> +    case 17: /* ELR_Hyp */
> +        return env->elr_el[2];
> +    case 13:
> +        return env->banked_r13[bank_number(tgtmode)];
> +    case 14:
> +        return env->banked_r14[bank_number(tgtmode)];
> +    case 8 ... 12:
> +        switch (tgtmode) {
> +        case ARM_CPU_MODE_USR:
> +            return env->usr_regs[regno - 8];
> +        case ARM_CPU_MODE_FIQ:
> +            return env->fiq_regs[regno - 8];
> +        default:
> +            g_assert_not_reached();
> +        }
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +
>  void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
>                                   uint32_t isread)
>  {
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 413f7de..a8dd490 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -4088,6 +4088,195 @@ static int gen_set_psr_im(DisasContext *s, uint32_t mask, int spsr, uint32_t val
>      return gen_set_psr(s, mask, spsr, tmp);
>  }
>  
> +static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
> +                                     int *tgtmode, int *regno)
> +{
> +    /* Decode the r and sysm fields of MSR/MRS banked accesses into
> +     * the target mode and register number, and identify the various
> +     * unpredictable cases.
> +     * MSR (banked) and MRS (banked) are CONSTRAINED UNPREDICTABLE if:
> +     *  + executed in user mode
> +     *  + using R15 as the src/dest register
> +     *  + accessing an unimplemented register
> +     *  + accessing a register that's inaccessible at current PL/security state*
> +     *  + accessing a register that you could access with a different insn
> +     * We choose to UNDEF in all these cases.
> +     * Since we don't know which of the various AArch32 modes we are in
> +     * we have to defer some checks to runtime.
> +     * Accesses to Monitor mode registers from Secure EL1 (which implies
> +     * that EL3 is AArch64) must trap to EL3.
> +     *
> +     * If the access checks fail this function will emit code to take
> +     * an exception and return false. Otherwise it will return true,
> +     * and set *tgtmode and *regno appropriately.
> +     */
> +    int exc_target = default_exception_el(s);
> +
> +    /* These instructions are present only in ARMv8, or in ARMv7 with the
> +     * Virtualization Extensions.
> +     */
> +    if (!arm_dc_feature(s, ARM_FEATURE_V8) &&
> +        !arm_dc_feature(s, ARM_FEATURE_EL2)) {
> +        goto undef;
> +    }
> +
> +    if (IS_USER(s) || rn == 15) {
> +        goto undef;
> +    }
> +
> +    /* The table in the v8 ARM ARM section F5.2.3 describes the encoding
> +     * of registers into (r, sysm).
> +     */
> +    if (r) {
> +        /* SPSRs for other modes */
> +        switch (sysm) {
> +        case 0xe: /* SPSR_fiq */
> +            *tgtmode = ARM_CPU_MODE_FIQ;
> +            break;
> +        case 0x10: /* SPSR_irq */
> +            *tgtmode = ARM_CPU_MODE_IRQ;
> +            break;
> +        case 0x12: /* SPSR_svc */
> +            *tgtmode = ARM_CPU_MODE_SVC;
> +            break;
> +        case 0x14: /* SPSR_abt */
> +            *tgtmode = ARM_CPU_MODE_ABT;
> +            break;
> +        case 0x16: /* SPSR_und */
> +            *tgtmode = ARM_CPU_MODE_UND;
> +            break;
> +        case 0x1c: /* SPSR_mon */
> +            *tgtmode = ARM_CPU_MODE_MON;
> +            break;
> +        case 0x1e: /* SPSR_hyp */
> +            *tgtmode = ARM_CPU_MODE_HYP;
> +            break;
> +        default: /* unallocated */
> +            goto undef;
> +        }
> +        /* We arbitrarily assign SPSR a register number of 16. */
> +        *regno = 16;
> +    } else {
> +        /* general purpose registers for other modes */
> +        switch (sysm) {
> +        case 0x0 ... 0x6:   /* 0b00xxx : r8_usr ... r14_usr */
> +            *tgtmode = ARM_CPU_MODE_USR;
> +            *regno = sysm + 8;
> +            break;
> +        case 0x8 ... 0xe:   /* 0b01xxx : r8_fiq ... r14_fiq */
> +            *tgtmode = ARM_CPU_MODE_FIQ;
> +            *regno = sysm;
> +            break;
> +        case 0x10 ... 0x11: /* 0b1000x : r14_irq, r13_irq */
> +            *tgtmode = ARM_CPU_MODE_IRQ;
> +            *regno = sysm & 1 ? 13 : 14;
> +            break;
> +        case 0x12 ... 0x13: /* 0b1001x : r14_svc, r13_svc */
> +            *tgtmode = ARM_CPU_MODE_SVC;
> +            *regno = sysm & 1 ? 13 : 14;
> +            break;
> +        case 0x14 ... 0x15: /* 0b1010x : r14_abt, r13_abt */
> +            *tgtmode = ARM_CPU_MODE_ABT;
> +            *regno = sysm & 1 ? 13 : 14;
> +            break;
> +        case 0x16 ... 0x17: /* 0b1011x : r14_und, r13_und */
> +            *tgtmode = ARM_CPU_MODE_UND;
> +            *regno = sysm & 1 ? 13 : 14;
> +            break;
> +        case 0x1c ... 0x1d: /* 0b1110x : r14_mon, r13_mon */
> +            *tgtmode = ARM_CPU_MODE_MON;
> +            *regno = sysm & 1 ? 13 : 14;
> +            break;
> +        case 0x1e ... 0x1f: /* 0b1111x : elr_hyp, r13_hyp */
> +            *tgtmode = ARM_CPU_MODE_HYP;
> +            /* Arbitrarily pick 17 for ELR_Hyp (which is not a banked LR!) */
> +            *regno = sysm & 1 ? 13 : 17;
> +            break;
> +        default: /* unallocated */
> +            goto undef;
> +        }
> +    }
> +
> +    /* Catch the 'accessing inaccessible register' cases we can detect
> +     * at translate time.
> +     */
> +    switch (*tgtmode) {
> +    case ARM_CPU_MODE_MON:
> +        if (!arm_dc_feature(s, ARM_FEATURE_EL3) || s->ns) {
> +            goto undef;
> +        }
> +        if (s->current_el == 1) {
> +            /* If we're in Secure EL1 (which implies that EL3 is AArch64)
> +             * then accesses to Mon registers trap to EL3
> +             */
> +            exc_target = 3;
> +            goto undef;
> +        }
> +        break;
> +    case ARM_CPU_MODE_HYP:
> +        /* Note that we can forbid accesses from EL2 here because they
> +         * must be from Hyp mode itself
> +         */
> +        if (!arm_dc_feature(s, ARM_FEATURE_EL2) || s->current_el < 3) {
> +            goto undef;
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return true;
> +
> +undef:
> +    /* If we get here then some access check did not pass */
> +    gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), exc_target);
> +    return false;
> +}
> +
> +static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
> +{
> +    TCGv_i32 tcg_reg, tcg_tgtmode, tcg_regno;
> +    int tgtmode, regno;
> +
> +    if (!msr_banked_access_decode(s, r, sysm, rn, &tgtmode, &regno)) {
> +        return;
> +    }
> +
> +    /* Sync state because msr_banked() can raise exceptions */
> +    gen_set_condexec(s);
> +    gen_set_pc_im(s, s->pc - 4);
> +    tcg_reg = load_reg(s, rn);
> +    tcg_tgtmode = tcg_const_i32(tgtmode);
> +    tcg_regno = tcg_const_i32(regno);
> +    gen_helper_msr_banked(cpu_env, tcg_reg, tcg_tgtmode, tcg_regno);
> +    tcg_temp_free_i32(tcg_tgtmode);
> +    tcg_temp_free_i32(tcg_regno);
> +    tcg_temp_free_i32(tcg_reg);
> +    s->is_jmp = DISAS_UPDATE;
> +}
> +
> +static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
> +{
> +    TCGv_i32 tcg_reg, tcg_tgtmode, tcg_regno;
> +    int tgtmode, regno;
> +
> +    if (!msr_banked_access_decode(s, r, sysm, rn, &tgtmode, &regno)) {
> +        return;
> +    }
> +
> +    /* Sync state because mrs_banked() can raise exceptions */
> +    gen_set_condexec(s);
> +    gen_set_pc_im(s, s->pc - 4);
> +    tcg_reg = tcg_temp_new_i32();
> +    tcg_tgtmode = tcg_const_i32(tgtmode);
> +    tcg_regno = tcg_const_i32(regno);
> +    gen_helper_mrs_banked(tcg_reg, cpu_env, tcg_tgtmode, tcg_regno);
> +    tcg_temp_free_i32(tcg_tgtmode);
> +    tcg_temp_free_i32(tcg_regno);
> +    store_reg(s, rn, tcg_reg);
> +    s->is_jmp = DISAS_UPDATE;
> +}
> +
>  /* Generate an old-style exception return. Marks pc as dead. */
>  static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
>  {
> @@ -7950,7 +8139,26 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>          sh = (insn >> 4) & 0xf;
>          rm = insn & 0xf;
>          switch (sh) {
> -        case 0x0: /* move program status register */
> +        case 0x0: /* MSR, MRS */
> +            if (insn & (1 << 9)) {
> +                /* MSR (banked) and MRS (banked) */
> +                int sysm = extract32(insn, 16, 4) |
> +                    (extract32(insn, 8, 1) << 4);
> +                int r = extract32(insn, 22, 1);
> +
> +                if (op1 & 1) {
> +                    /* MSR (banked) */
> +                    gen_msr_banked(s, r, sysm, rm);
> +                } else {
> +                    /* MRS (banked) */
> +                    int rd = extract32(insn, 12, 4);
> +
> +                    gen_mrs_banked(s, r, sysm, rd);
> +                }
> +                break;
> +            }
> +
> +            /* MSR, MRS (for PSRs) */
>              if (op1 & 1) {
>                  /* PSR = reg */
>                  tmp = load_reg(s, rm);
> @@ -10055,6 +10263,18 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                          if (arm_dc_feature(s, ARM_FEATURE_M)) {
>                              goto illegal_op;
>                          }
> +
> +                        if (extract32(insn, 5, 1)) {
> +                            /* MSR (banked) */
> +                            int sysm = extract32(insn, 8, 4) |
> +                                (extract32(insn, 4, 1) << 4);
> +                            int r = op & 1;
> +
> +                            gen_msr_banked(s, r, sysm, rm);
> +                            break;
> +                        }
> +
> +                        /* MSR (for PSRs) */
>                          tmp = load_reg(s, rn);
>                          if (gen_set_psr(s,
>                                msr_mask(s, (insn >> 8) & 0xf, op == 1),
> @@ -10127,7 +10347,17 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                          tcg_gen_subi_i32(tmp, tmp, insn & 0xff);
>                          gen_exception_return(s, tmp);
>                          break;
> -                    case 6: /* mrs cpsr.  */
> +                    case 6: /* MRS */
> +                        if (extract32(insn, 5, 1)) {
> +                            /* MRS (banked) */
> +                            int sysm = extract32(insn, 16, 4) |
> +                                (extract32(insn, 4, 1) << 4);
> +
> +                            gen_mrs_banked(s, 0, sysm, rd);
> +                            break;
> +                        }
> +
> +                        /* mrs cpsr */
>                          tmp = tcg_temp_new_i32();
>                          if (arm_dc_feature(s, ARM_FEATURE_M)) {
>                              addr = tcg_const_i32(insn & 0xff);
> @@ -10138,7 +10368,17 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
>                          }
>                          store_reg(s, rd, tmp);
>                          break;
> -                    case 7: /* mrs spsr.  */
> +                    case 7: /* MRS */
> +                        if (extract32(insn, 5, 1)) {
> +                            /* MRS (banked) */
> +                            int sysm = extract32(insn, 16, 4) |
> +                                (extract32(insn, 4, 1) << 4);
> +
> +                            gen_mrs_banked(s, 1, sysm, rd);
> +                            break;
> +                        }
> +
> +                        /* mrs spsr.  */
>                          /* Not accessible in user mode.  */
>                          if (IS_USER(s) || arm_dc_feature(s, ARM_FEATURE_M)) {
>                              goto illegal_op;
> -- 
> 1.9.1
> 
