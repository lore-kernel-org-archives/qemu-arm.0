Received: by 10.223.197.9 with SMTP id q9csp133797wrf;
        Wed, 4 Oct 2017 20:26:00 -0700 (PDT)
X-Received: by 10.237.33.188 with SMTP id l57mr6116852qtc.270.1507173960413;
        Wed, 04 Oct 2017 20:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507173960; cv=none;
        d=google.com; s=arc-20160816;
        b=vrbCEblZRXjF9p9d6yfeOs9haC1HwrEgGiiT2oYizxdCyfyYtdc/CnzJbCDlurH5XN
         RGb9E5KbHeSThhGD7GjNJutjKwp+2YYFKa5ak8Ytt73YA99+DJuCwGs4i3xO1tNIrnW8
         w1+4Kj8FBVBM2xUEv0j5rUzAjOtr0K8lux4Uj+Z7ZCXW7dAbjpv+ZH2Mv+kbjOsxYMhX
         FXYWWzGV9te+bMu0rOsKWvwS3ZbNcOyT3ny09Jb4N0Be0kXuSQ42KyyEj9voJ3gsNMsk
         Q6eA9hWMY3JJ2GjYGpauNxCHVJKERjT1/olZJ4J3ClmyTb9MPlsZFfun/uP8K/sOcHHg
         tE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=0fH0fJ4wcgHW+Sg92m11bzvDdANk4dqIS5NVJvcno34=;
        b=AkSvDysjOGPvuiRs0m+9qErcTi7up/wWgdrPBxbTTqqjNkzrFttA6CQZZDjv70omZA
         qUoxU9cht6OTHMzkXckb2CaEgmIxQhprLJlvcUJ9IMjahm8m1eir7NlKXt2BwPZI2LzN
         bMSvE/mBy6BDUwcVwFxHjY8BGDGlqe4yHFkzVex29QncOmrUPsqQskU5IsA4noCuTfvv
         KWAVQ/jtb89qkvl3JFxMgS6pvT9Y7mBbQM3SZx6hJ/6ZxBs87zww1C4xzhODSJ6EAkpE
         LU5Dt803s+CWzt17rLZh4+jnst5Y6hXcVPUM0BzZLHP07UpyibjH5cLBp7BUO4ZiIMbk
         0ZkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VJpmjkmy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s3si9556365qtj.322.2017.10.04.20.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 20:26:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VJpmjkmy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzwnP-0004im-T1
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 23:25:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzwnG-0004ge-2g
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 23:25:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzwnE-0004f9-PX
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 23:25:50 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38144)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dzwn9-0004c5-Mt; Wed, 04 Oct 2017 23:25:43 -0400
Received: by mail-qk0-x244.google.com with SMTP id 17so2322043qkq.5;
	Wed, 04 Oct 2017 20:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0fH0fJ4wcgHW+Sg92m11bzvDdANk4dqIS5NVJvcno34=;
	b=VJpmjkmyDCIyReQ6ag4XfhGXs5bl7Smj+dlGfOG0UYsxeSxZ0J6T7vPaEZTD615ZOi
	+bpDHJHHR5YWw8lGYWcraywZX/Ud0vItHrMsLhQPODwUGOp7fv3vGjkYdoatTNMdMB60
	Rx1OFU2gDE05sOWG4byA+fvJRBXVkIurp2H4MUAo920NCR25uy9gxD/fMzBoVPIrP8nl
	E8GPLaVOB2DM4rtpgoS+WUGpWxkkda+yYJYvmprOTrY08I0qTxX0OF5yaW01v3KQaLYO
	TdrXAUoxpZ3cFg7qsXk4buKqfZQGVa136feaWTR7hCSIYz1Z6A47vGAos1WDkYqsz1O/
	Pntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=0fH0fJ4wcgHW+Sg92m11bzvDdANk4dqIS5NVJvcno34=;
	b=ig2JmRh++oNEcogL5AUCU1tfop3ak8xIrl31VZK2EZrAsqe6qikht7m8t1usv/u6FL
	ncsTXSrv930yvzHCJbi3NLP8R3PairDkDVWj6cNxBxxQw8RGUKTzQBUWcfSb9klRT0vf
	0vrriC4F2j9GnczcYYoyfS+7wSC7KQFMHzpDZaZ1b5NP6rYX49cQuSn8mngPpnivDB9N
	aupfj5txViwx1nH+DmnxgdoQrmYl1V5QE6xs8cjgN9ZsdBmDnoqRpIR/f6hwve6kdqMV
	kdQS8QGjqExBUxTqNjWeoC3g/1t1Zgk0/CHNaOt/eEJWWd01ZNJClpSEv+G8hXDSaDVy
	/31Q==
X-Gm-Message-State: AMCzsaW19izCflW2NCKDgZIK8gNroOuQ6dw29VuTnrYWsiTPcj46kr7U
	5qHRKaVi8GXm0yXi7vrbF2g=
X-Google-Smtp-Source: AOwi7QBiWy5TEHYnWd0HhEENT+SoXFGMVHeJgA4se0HncUZolK/IvunAs/FaJh63P76oASiNcPu3Xg==
X-Received: by 10.55.67.81 with SMTP id q78mr15005827qka.248.1507173942950;
	Wed, 04 Oct 2017 20:25:42 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	50sm11461200qts.82.2017.10.04.20.25.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Oct 2017 20:25:42 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5d58270d-9d17-fe9e-6d24-9cb130646de6@amsat.org>
Date: Thu, 5 Oct 2017 00:25:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH 03/20] target/arm: Prepare for CONTROL.SPSEL
 being nonzero in Handler mode
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
X-TUID: Hhpptn2lOy4J

On 09/22/2017 11:59 AM, Peter Maydell wrote:
> In the v7M architecture, there is an invariant that if the CPU is
> in Handler mode then the CONTROL.SPSEL bit cannot be nonzero.
> This in turn means that the current stack pointer is always
> indicated by CONTROL.SPSEL, even though Handler mode always uses
> the Main stack pointer.
> 
> In v8M, this invariant is removed, and CONTROL.SPSEL may now
> be nonzero in Handler mode (though Handler mode still always
> uses the Main stack pointer). In preparation for this change,
> change how we handle this bit: rename switch_v7m_sp() to
> the now more accurate write_v7m_control_spsel(), and make it
> check both the handler mode state and the SPSEL bit.
> 
> Note that this implicitly changes the point at which we switch
> active SP on exception exit from before we pop the exception
> frame to after it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.h      |  8 ++++++-
>  hw/intc/armv7m_nvic.c |  2 +-
>  target/arm/helper.c   | 65 ++++++++++++++++++++++++++++++++++-----------------
>  3 files changed, 51 insertions(+), 24 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8afceca..ad6eff4 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -991,6 +991,11 @@ void pmccntr_sync(CPUARMState *env);
>  #define PSTATE_MODE_EL1t 4
>  #define PSTATE_MODE_EL0t 0
>  
> +/* Write a new value to v7m.exception, thus transitioning into or out
> + * of Handler mode; this may result in a change of active stack pointer.
> + */
> +void write_v7m_exception(CPUARMState *env, uint32_t new_exc);
> +
>  /* Map EL and handler into a PSTATE_MODE.  */
>  static inline unsigned int aarch64_pstate_mode(unsigned int el, bool handler)
>  {
> @@ -1071,7 +1076,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
>          env->condexec_bits |= (val >> 8) & 0xfc;
>      }
>      if (mask & XPSR_EXCP) {
> -        env->v7m.exception = val & XPSR_EXCP;
> +        /* Note that this only happens on exception exit */
> +        write_v7m_exception(env, val & XPSR_EXCP);
>      }
>  }
>  
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index bc7b66d..a1041c2 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -616,7 +616,7 @@ bool armv7m_nvic_acknowledge_irq(void *opaque)
>      vec->active = 1;
>      vec->pending = 0;
>  
> -    env->v7m.exception = s->vectpending;
> +    write_v7m_exception(env, s->vectpending);
>  
>      nvic_irq_update(s);
>  
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f13b99d..509a1aa 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6052,21 +6052,44 @@ static bool v7m_using_psp(CPUARMState *env)
>          env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK;
>  }
>  
> -/* Switch to V7M main or process stack pointer.  */
> -static void switch_v7m_sp(CPUARMState *env, bool new_spsel)
> +/* Write to v7M CONTROL.SPSEL bit. This may change the current
> + * stack pointer between Main and Process stack pointers.
> + */
> +static void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
>  {
>      uint32_t tmp;
> -    uint32_t old_control = env->v7m.control[env->v7m.secure];
> -    bool old_spsel = old_control & R_V7M_CONTROL_SPSEL_MASK;
> +    bool new_is_psp, old_is_psp = v7m_using_psp(env);
> +
> +    env->v7m.control[env->v7m.secure] =
> +        deposit32(env->v7m.control[env->v7m.secure],
> +                  R_V7M_CONTROL_SPSEL_SHIFT,
> +                  R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
> +
> +    new_is_psp = v7m_using_psp(env);
>  
> -    if (old_spsel != new_spsel) {
> +    if (old_is_psp != new_is_psp) {
>          tmp = env->v7m.other_sp;
>          env->v7m.other_sp = env->regs[13];
>          env->regs[13] = tmp;
> +    }
> +}
> +
> +void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
> +{
> +    /* Write a new value to v7m.exception, thus transitioning into or out
> +     * of Handler mode; this may result in a change of active stack pointer.
> +     */
> +    bool new_is_psp, old_is_psp = v7m_using_psp(env);
> +    uint32_t tmp;
>  
> -        env->v7m.control[env->v7m.secure] = deposit32(old_control,
> -                                     R_V7M_CONTROL_SPSEL_SHIFT,
> -                                     R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
> +    env->v7m.exception = new_exc;
> +
> +    new_is_psp = v7m_using_psp(env);
> +
> +    if (old_is_psp != new_is_psp) {
> +        tmp = env->v7m.other_sp;
> +        env->v7m.other_sp = env->regs[13];
> +        env->regs[13] = tmp;
>      }
>  }
>  
> @@ -6149,13 +6172,11 @@ static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
>      bool want_psp = threadmode && spsel;
>  
>      if (secure == env->v7m.secure) {
> -        /* Currently switch_v7m_sp switches SP as it updates SPSEL,
> -         * so the SP we want is always in regs[13].
> -         * When we decouple SPSEL from the actually selected SP
> -         * we need to check want_psp against v7m_using_psp()
> -         * to see whether we need regs[13] or v7m.other_sp.
> -         */
> -        return &env->regs[13];
> +        if (want_psp == v7m_using_psp(env)) {
> +            return &env->regs[13];
> +        } else {
> +            return &env->v7m.other_sp;
> +        }
>      } else {
>          if (want_psp) {
>              return &env->v7m.other_ss_psp;
> @@ -6198,7 +6219,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr)
>      uint32_t addr;
>  
>      armv7m_nvic_acknowledge_irq(env->nvic);
> -    switch_v7m_sp(env, 0);
> +    write_v7m_control_spsel(env, 0);
>      arm_clear_exclusive(env);
>      /* Clear IT bits */
>      env->condexec_bits = 0;
> @@ -6344,11 +6365,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>          return;
>      }
>  
> -    /* Set CONTROL.SPSEL from excret.SPSEL. For QEMU this currently
> -     * causes us to switch the active SP, but we will change this
> -     * later to not do that so we can support v8M.
> +    /* Set CONTROL.SPSEL from excret.SPSEL. Since we're still in
> +     * Handler mode (and will be until we write the new XPSR.Interrupt
> +     * field) this does not switch around the current stack pointer.
>       */
> -    switch_v7m_sp(env, return_to_sp_process);
> +    write_v7m_control_spsel(env, return_to_sp_process);
>  
>      {
>          /* The stack pointer we should be reading the exception frame from
> @@ -9163,11 +9184,11 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>      case 20: /* CONTROL */
>          /* Writing to the SPSEL bit only has an effect if we are in
>           * thread mode; other bits can be updated by any privileged code.
> -         * switch_v7m_sp() deals with updating the SPSEL bit in
> +         * write_v7m_control_spsel() deals with updating the SPSEL bit in
>           * env->v7m.control, so we only need update the others.
>           */
>          if (!arm_v7m_is_handler_mode(env)) {
> -            switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
> +            write_v7m_control_spsel(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
>          }
>          env->v7m.control[env->v7m.secure] &= ~R_V7M_CONTROL_NPRIV_MASK;
>          env->v7m.control[env->v7m.secure] |= val & R_V7M_CONTROL_NPRIV_MASK;
> 
