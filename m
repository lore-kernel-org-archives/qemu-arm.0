Received: by 10.25.0.144 with SMTP id 138csp872275lfa;
        Mon, 10 Apr 2017 06:53:34 -0700 (PDT)
X-Received: by 10.55.159.136 with SMTP id i130mr22382025qke.94.1491832414084;
        Mon, 10 Apr 2017 06:53:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i3si3992774qkd.268.2017.04.10.06.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 06:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxZl5-0005gc-LB
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 09:53:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxZky-0005dG-1B
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 09:53:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxZkw-0000LL-Lq
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 09:53:24 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxZks-0000JT-0G; Mon, 10 Apr 2017 09:53:18 -0400
Received: by mail-qt0-x241.google.com with SMTP id v3so10029518qtd.3;
	Mon, 10 Apr 2017 06:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=kilyif92c68bkkHMJIzo+jKn/9YJ9Es0fSfGLgBHO3k=;
	b=GtTH567Lhd9N6th9+9iz3sdpE4DS/MsU2KOgBNGuTrIs+flHYDx0op1pW9CgV5UT3g
	rQKi1bIZYQHsyn5e8aHHTq1YWnxOLIlfnLAHvRJkfS09Bfb2fiU2FVViYw2XHV89wzpv
	006YKGkZTKpSbFILdmscv4epV5ggMOMvWow2Fi40OhvJK5+9Nyy4YXaiIMO2O4lMqXxC
	BcgihEG2GVyZ9AezctYbjnmpWjALimBHFBJIDADWXWik7K8+Tygn/nj4LQMZiviwJaFy
	mZbtUmSHdYW8gba4qq6PETVmE/IDIPr7sXN9p1+Hg7KlF+uP/kbfNuXHf+9HPSVrYsTZ
	jnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=kilyif92c68bkkHMJIzo+jKn/9YJ9Es0fSfGLgBHO3k=;
	b=PAtl7VO3Ls+vE2FVuYw2jjqEL7XqrkrbaI/wizd9FicQqa5AiCK2D9qXXrarBIPopy
	w/IK4dw7FS2cRkgKUIHidgsZdmgK9QorOpIJ13KjFVvJjBh5jTnVVqn7d4UeD3q3hxVw
	OiWHuXWA5cqhzzeaiB8iYIIDK6zqRwpSKnglH0l8EIo+2v8aBVJCn6OuSHEX/qgpSm0P
	uOD6GgiqauOo/5vNSJ452ULuVp0nUR5fm1r9IQOlxjePMZp3Y3Fkbo33G05JQ0hQVOzS
	fjUaoT5OODOentyvZDeYeOB/hSTrvLdaMd7mpWNXSmqpayK6k31aGc3MEr9XHEr+BHbX
	HfyA==
X-Gm-Message-State: AN3rC/71ZjayuWxEu+alDuK5CKM9GR02e6TnK/hLH36NqY3kNhvD9y1NdDyga6tDjYkCIg==
X-Received: by 10.200.4.148 with SMTP id s20mr14747614qtg.148.1491832397152;
	Mon, 10 Apr 2017 06:53:17 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	t22sm8837764qke.49.2017.04.10.06.53.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 06:53:16 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
	<1491820793-5348-8-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bb111dba-c11a-80f5-e685-a9d6ca2cb8d9@amsat.org>
Date: Mon, 10 Apr 2017 10:53:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491820793-5348-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH 7/7] arm: Remove workarounds for old
 M-profile exception return implementation
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
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M5aH5/ltvtYs

On 04/10/2017 07:39 AM, Peter Maydell wrote:
> Now that we've rewritten M-profile exception return so that the magic
> PC values are not visible to other parts of QEMU, we can delete the
> special casing of them elsewhere.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.c       | 43 ++-----------------------------------------
>  target/arm/translate.c |  8 --------
>  2 files changed, 2 insertions(+), 49 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 04b062c..b357aee 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -304,33 +304,6 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  }
>
>  #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
> -static void arm_v7m_unassigned_access(CPUState *cpu, hwaddr addr,
> -                                      bool is_write, bool is_exec, int opaque,
> -                                      unsigned size)
> -{
> -    ARMCPU *arm = ARM_CPU(cpu);
> -    CPUARMState *env = &arm->env;
> -
> -    /* ARMv7-M interrupt return works by loading a magic value into the PC.
> -     * On real hardware the load causes the return to occur.  The qemu
> -     * implementation performs the jump normally, then does the exception
> -     * return by throwing a special exception when when the CPU tries to
> -     * execute code at the magic address.
> -     */
> -    if (env->v7m.exception != 0 && addr >= 0xfffffff0 && is_exec) {
> -        cpu->exception_index = EXCP_EXCEPTION_EXIT;
> -        cpu_loop_exit(cpu);
> -    }
> -
> -    /* In real hardware an attempt to access parts of the address space
> -     * with nothing there will usually cause an external abort.
> -     * However our QEMU board models are often missing device models where
> -     * the guest can boot anyway with the default read-as-zero/writes-ignored
> -     * behaviour that you get without a QEMU unassigned_access hook.
> -     * So just return here to retain that default behaviour.
> -     */
> -}
> -
>  static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cs);
> @@ -338,17 +311,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>      CPUARMState *env = &cpu->env;
>      bool ret = false;
>
> -    /* ARMv7-M interrupt return works by loading a magic value
> -     * into the PC.  On real hardware the load causes the
> -     * return to occur.  The qemu implementation performs the
> -     * jump normally, then does the exception return when the
> -     * CPU tries to execute code at the magic address.
> -     * This will cause the magic PC value to be pushed to
> -     * the stack if an interrupt occurred at the wrong time.
> -     * We avoid this by disabling interrupts when
> -     * pc contains a magic address.
> -     *
> -     * ARMv7-M interrupt masking works differently than -A or -R.
> +    /* ARMv7-M interrupt masking works differently than -A or -R.
>       * There is no FIQ/IRQ distinction. Instead of I and F bits
>       * masking FIQ and IRQ interrupts, an exception is taken only
>       * if it is higher priority than the current execution priority
> @@ -356,8 +319,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>       * currently active exception).
>       */
>      if (interrupt_request & CPU_INTERRUPT_HARD
> -        && (armv7m_nvic_can_take_pending_exception(env->nvic))
> -        && (env->regs[15] < 0xfffffff0)) {
> +        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
>          cs->exception_index = EXCP_IRQ;
>          cc->do_interrupt(cs);
>          ret = true;
> @@ -1091,7 +1053,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
>      cc->do_interrupt = arm_v7m_cpu_do_interrupt;
>  #endif
>
> -    cc->do_unassigned_access = arm_v7m_unassigned_access;
>      cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
>  }
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 156ab46..c85bc6c 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -11914,14 +11914,6 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>              dc->is_jmp = DISAS_EXC;
>              break;
>          }
> -#else
> -        if (arm_dc_feature(dc, ARM_FEATURE_M)) {
> -            /* Branches to the magic exception-return addresses should
> -             * already have been caught via the arm_v7m_unassigned_access hook,
> -             * and never get here.
> -             */
> -            assert(dc->pc < 0xfffffff0);
> -        }
>  #endif
>
>          if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
>
