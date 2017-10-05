Received: by 10.223.197.9 with SMTP id q9csp180841wrf;
        Wed, 4 Oct 2017 21:44:53 -0700 (PDT)
X-Received: by 10.55.48.210 with SMTP id w201mr28255179qkw.117.1507178693114;
        Wed, 04 Oct 2017 21:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507178693; cv=none;
        d=google.com; s=arc-20160816;
        b=EMHlV/nZQuCy3W9tz/axQN4j5cRaf9J2TVxWKGzl58ab3CKoDWOpu/3mr9+AtrkK29
         9Sapu8rf0x+Czrq0/6uA7Ve6loQESBFKcmIbHeNc1ctVFVXYuv/1txU14oh/wBL686dB
         kBJeQ+DFyODDKwyKnRW/aBLMAhNv6D1oDmlvNFL3jvSa+HlXF703mEJZAq0kWN5x2PQW
         aWYmQ5MvNKeVOmI3gpsvJAOq9krEmC3p8PW+QctmfgGBYkL8xJvGpAix4XgAH9xtA0VR
         XEHY+MucsjtY8ZcGBgztIaNSMqDVfX/x92Mz7kuz4q+n1SegZs3/IlpCIt0Zl4cnCFQF
         /thQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Bw3bnef0oNLXGtYLHKbtPNP5767xVVQLUZ6lzAsbqfA=;
        b=NL5hb4T2zd6XyvwB9RvEYAowvrKACnFIS2goxzQcSZZhC0v+w4JXE0VkPNL5ciduNI
         fp2DbjFIFRWtKsczEiuQ35XKyGlMGrpvLbL3cVKLZ3nZkQth09edVlPoCo+Vnc9sAGSV
         vzX10tExKItgovrFqiV9faUg4ctiXByo2ILh8Zudl/ukx5TR34G6eC4ROGkPuDblzje2
         97BRhkjGVUWin6Ahun+6SY3onxq3kgzrUSNE6umdnJZyZCxb2px1Xxf6KP4TBs6PZEED
         V8wourAVfq+gbPpiP5e32FW+hHWnolF0kWZMW1Tb0zw56mjyXXo2PblHOyUoEoaAj5uH
         RaaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BCT+yqL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p190si4168786qkc.549.2017.10.04.21.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 21:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BCT+yqL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzy1k-0000mE-KS
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 00:44:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzy1Z-0000km-RJ
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 00:44:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzy1Y-0007hd-Go
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 00:44:41 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzy1T-0007gS-EQ; Thu, 05 Oct 2017 00:44:35 -0400
Received: by mail-qk0-x243.google.com with SMTP id b124so6735357qke.1;
	Wed, 04 Oct 2017 21:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Bw3bnef0oNLXGtYLHKbtPNP5767xVVQLUZ6lzAsbqfA=;
	b=BCT+yqL7G5k4nJimVPIE3t7I4/WJ2Px5y9/Ab7kbM8wX43P/b9Trv7D108gFyJmYAv
	7cJQCLqu5HEwLmTACb+P2/5fWG8oEn2eZ/hpjUw/0RQMVTlER14MexacvJN06+Wx+zha
	j+9gl4HGl6vAhDasIoWP9L67EM9JdzL0QjLAf0Wdh5Bzt+uIVFsHkbjC9/B61K28CZwT
	Ng/epwXgGZZ5x4LPOsWsohT3AdKVV86Rq7ZNR3KV8wA6METhE+GD6Th68OmAGBLd9HbD
	1IetU2VhQhBJysf0B2GSA4GO9gnJCw81RIWC3HXjyPd5IoC2pFc26/6z/TMVOTuKDp+H
	3HGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Bw3bnef0oNLXGtYLHKbtPNP5767xVVQLUZ6lzAsbqfA=;
	b=A+cGMwLkITofW18wBsBANfmWrN79lxPRX5oMDTG36ITrpGobkTOsSWZHPcRFczeb3t
	dC+dyoxWlEzdNbN8VrREqhnpuOEOfQQmsZvvwxxtCOLbikzPG7UQ5F25odM2xjbkB2IT
	xWE8F9UJ4slDcNxedXKMr9jGDu/yzvL7nQ1r+XGy2ZbmdpPRbv7TXekamKsm3sVzvvhl
	0HNjxotx2jzuTKUbwTol9clD5F1bLuxpDMVwZT/7S67UjWYQYnqVHpvHgFVD2hAGtqnF
	0l1ZJPpYsaKS2/g7t16coYu7P5qKc2dcWmqIN3OCNRepMq3Sag72pfnRqn4vTlOS6GX5
	IyUg==
X-Gm-Message-State: AMCzsaUFotvW+xdLVhxsbjRv4VJu9howjq2wFT23UEiWsc2+ki3avjec
	20PwPwmFCSS2KxY92joobms=
X-Google-Smtp-Source: AOwi7QCpu/BFJsycUFU7CUE9DSqQlSZuhDfOuaGbsVkLFSI7HpRMQNcDBbnFQWcr67zthAVCfJdi7g==
X-Received: by 10.55.17.33 with SMTP id b33mr28344607qkh.58.1507178674496;
	Wed, 04 Oct 2017 21:44:34 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 36sm4318192qtr.42.2017.10.04.21.44.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Oct 2017 21:44:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <63505593-53ea-90ba-f2ba-72cadfd1179f@amsat.org>
Date: Thu, 5 Oct 2017 01:44:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/20] target/arm: Don't switch
 to target stack early in v7M exception return
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wABkwaqFyU5s

On 09/22/2017 11:59 AM, Peter Maydell wrote:
> Currently our M profile exception return code switches to the
> target stack pointer relatively early in the process, before
> it tries to pop the exception frame off the stack. This is
> awkward for v8M for two reasons:
>  * in v8M the process vs main stack pointer is not selected
>    purely by the value of CONTROL.SPSEL, so updating SPSEL
>    and relying on that to switch to the right stack pointer
>    won't work
>  * the stack we should be reading the stack frame from and
>    the stack we will eventually switch to might not be the
>    same if the guest is doing strange things
> 
> Change our exception return code to use a 'frame pointer'
> to read the exception frame rather than assuming that we
> can switch the live stack pointer this early.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 127 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 95 insertions(+), 32 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8be78ea..f13b99d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6040,16 +6040,6 @@ static void v7m_push(CPUARMState *env, uint32_t val)
>      stl_phys(cs->as, env->regs[13], val);
>  }
>  
> -static uint32_t v7m_pop(CPUARMState *env)
> -{
> -    CPUState *cs = CPU(arm_env_get_cpu(env));
> -    uint32_t val;
> -
> -    val = ldl_phys(cs->as, env->regs[13]);
> -    env->regs[13] += 4;
> -    return val;
> -}
> -
>  /* Return true if we're using the process stack pointer (not the MSP) */
>  static bool v7m_using_psp(CPUARMState *env)
>  {
> @@ -6141,6 +6131,40 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
>      env->regs[15] = dest & ~1;
>  }
>  
> +static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
> +                                bool spsel)
> +{
> +    /* Return a pointer to the location where we currently store the
> +     * stack pointer for the requested security state and thread mode.
> +     * This pointer will become invalid if the CPU state is updated
> +     * such that the stack pointers are switched around (eg changing
> +     * the SPSEL control bit).
> +     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
> +     * Unlike that pseudocode, we require the caller to pass us in the
> +     * SPSEL control bit value; this is because we also use this
> +     * function in handling of pushing of the callee-saves registers
> +     * part of the v8M stack frame, and in that case the SPSEL bit
> +     * comes from the exception return magic LR value.
> +     */
> +    bool want_psp = threadmode && spsel;
> +
> +    if (secure == env->v7m.secure) {
> +        /* Currently switch_v7m_sp switches SP as it updates SPSEL,
> +         * so the SP we want is always in regs[13].
> +         * When we decouple SPSEL from the actually selected SP
> +         * we need to check want_psp against v7m_using_psp()
> +         * to see whether we need regs[13] or v7m.other_sp.
> +         */
> +        return &env->regs[13];
> +    } else {
> +        if (want_psp) {
> +            return &env->v7m.other_ss_psp;
> +        } else {
> +            return &env->v7m.other_ss_msp;
> +        }
> +    }
> +}
> +
>  static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
>  {
>      CPUState *cs = CPU(cpu);
> @@ -6212,6 +6236,7 @@ static void v7m_push_stack(ARMCPU *cpu)
>  static void do_v7m_exception_exit(ARMCPU *cpu)
>  {
>      CPUARMState *env = &cpu->env;
> +    CPUState *cs = CPU(cpu);
>      uint32_t excret;
>      uint32_t xpsr;
>      bool ufault = false;
> @@ -6219,6 +6244,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>      bool return_to_handler = false;
>      bool rettobase = false;
>      bool exc_secure = false;
> +    bool return_to_secure;
>  
>      /* We can only get here from an EXCP_EXCEPTION_EXIT, and
>       * gen_bx_excret() enforces the architectural rule
> @@ -6286,6 +6312,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>          g_assert_not_reached();
>      }
>  
> +    return_to_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
> +        (excret & R_V7M_EXCRET_S_MASK);
> +
>      switch (excret & 0xf) {
>      case 1: /* Return to Handler */
>          return_to_handler = true;
> @@ -6315,32 +6344,66 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>          return;
>      }
>  
> -    /* Switch to the target stack.  */
> +    /* Set CONTROL.SPSEL from excret.SPSEL. For QEMU this currently
> +     * causes us to switch the active SP, but we will change this
> +     * later to not do that so we can support v8M.
> +     */
>      switch_v7m_sp(env, return_to_sp_process);
> -    /* Pop registers.  */
> -    env->regs[0] = v7m_pop(env);
> -    env->regs[1] = v7m_pop(env);
> -    env->regs[2] = v7m_pop(env);
> -    env->regs[3] = v7m_pop(env);
> -    env->regs[12] = v7m_pop(env);
> -    env->regs[14] = v7m_pop(env);
> -    env->regs[15] = v7m_pop(env);
> -    if (env->regs[15] & 1) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "M profile return from interrupt with misaligned "
> -                      "PC is UNPREDICTABLE\n");
> -        /* Actual hardware seems to ignore the lsbit, and there are several
> -         * RTOSes out there which incorrectly assume the r15 in the stack
> -         * frame should be a Thumb-style "lsbit indicates ARM/Thumb" value.
> +
> +    {
> +        /* The stack pointer we should be reading the exception frame from
> +         * depends on bits in the magic exception return type value (and
> +         * for v8M isn't necessarily the stack pointer we will eventually
> +         * end up resuming execution with). Get a pointer to the location
> +         * in the CPU state struct where the SP we need is currently being
> +         * stored; we will use and modify it in place.
> +         * We use this limited C variable scope so we don't accidentally
> +         * use 'frame_sp_p' after we do something that makes it invalid.
> +         */
> +        uint32_t *frame_sp_p = get_v7m_sp_ptr(env,
> +                                              return_to_secure,
> +                                              !return_to_handler,
> +                                              return_to_sp_process);
> +        uint32_t frameptr = *frame_sp_p;
> +
> +        /* Pop registers. TODO: make these accesses use the correct
> +         * attributes and address space (S/NS, priv/unpriv) and handle
> +         * memory transaction failures.
>           */
> -        env->regs[15] &= ~1U;
> +        env->regs[0] = ldl_phys(cs->as, frameptr);
> +        env->regs[1] = ldl_phys(cs->as, frameptr + 0x4);
> +        env->regs[2] = ldl_phys(cs->as, frameptr + 0x8);
> +        env->regs[3] = ldl_phys(cs->as, frameptr + 0xc);
> +        env->regs[12] = ldl_phys(cs->as, frameptr + 0x10);
> +        env->regs[14] = ldl_phys(cs->as, frameptr + 0x14);
> +        env->regs[15] = ldl_phys(cs->as, frameptr + 0x18);
> +        if (env->regs[15] & 1) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M profile return from interrupt with misaligned "
> +                          "PC is UNPREDICTABLE\n");
> +            /* Actual hardware seems to ignore the lsbit, and there are several
> +             * RTOSes out there which incorrectly assume the r15 in the stack
> +             * frame should be a Thumb-style "lsbit indicates ARM/Thumb" value.
> +             */
> +            env->regs[15] &= ~1U;
> +        }
> +        xpsr = ldl_phys(cs->as, frameptr + 0x1c);
> +
> +        /* Commit to consuming the stack frame */
> +        frameptr += 0x20;
> +        /* Undo stack alignment (the SPREALIGN bit indicates that the original
> +         * pre-exception SP was not 8-aligned and we added a padding word to
> +         * align it, so we undo this by ORing in the bit that increases it
> +         * from the current 8-aligned value to the 8-unaligned value. (Adding 4
> +         * would work too but a logical OR is how the pseudocode specifies it.)
> +         */
> +        if (xpsr & XPSR_SPREALIGN) {
> +            frameptr |= 4;
> +        }
> +        *frame_sp_p = frameptr;
>      }
> -    xpsr = v7m_pop(env);
> +    /* This xpsr_write() will invalidate frame_sp_p as it may switch stack */
>      xpsr_write(env, xpsr, ~XPSR_SPREALIGN);
> -    /* Undo stack alignment.  */
> -    if (xpsr & XPSR_SPREALIGN) {
> -        env->regs[13] |= 4;
> -    }
>  
>      /* The restored xPSR exception field will be zero if we're
>       * resuming in Thread mode. If that doesn't match what the
> 
