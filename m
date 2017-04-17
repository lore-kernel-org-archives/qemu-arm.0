Received: by 10.25.0.144 with SMTP id 138csp1120687lfa;
        Sun, 16 Apr 2017 20:49:54 -0700 (PDT)
X-Received: by 10.55.164.71 with SMTP id n68mr7487632qke.107.1492400994837;
        Sun, 16 Apr 2017 20:49:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 35si9643639qkz.323.2017.04.16.20.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 20:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czxfm-0001up-Ai
	for alex.bennee@linaro.org; Sun, 16 Apr 2017 23:49:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxfX-0001oV-EZ
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxfS-0005py-PX
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:49:39 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36250)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxfH-0005if-Rn; Sun, 16 Apr 2017 23:49:24 -0400
Received: by mail-qk0-x241.google.com with SMTP id v75so18035686qkb.3;
	Sun, 16 Apr 2017 20:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=HDh9k8XUnnucE8QDmqDRnmdwiJqIcOfKE538YQhIs+Y=;
	b=h4yO6O8f+yYo7Qxwnld1oL+UcALqIhpM6k7q25nzqRkSR4LL0vcZG266LZ/8YY3oV2
	4hvfYLKVM61bSLOFn5M2aWKaVZwo88UDKyd1QQzKLFv/sHqhm8ewWolLl+E1DVxrv6pU
	yxGinABBP+g8s2YVad6BjLC0X8N8vMXEr0RzkjcrO0H/GAOksbLi0uDFq/CXysQ5bj1o
	RNVVuH2rY6EfF5DFjDOa909PmTED39Wp23zv/CvEr6IfkgFGARzf1p2pjkoCyG8WEf7a
	5eMrD9UxpXfqnJAOluias+/kkHbZRmnhtawqLPaWXmw/oU4Qv5kCXV/T/1aeGUa+wM0s
	PW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HDh9k8XUnnucE8QDmqDRnmdwiJqIcOfKE538YQhIs+Y=;
	b=tpgNbU6tLKRGK/rScdNAcqpcwCN5BgtPdVTKIaMBgjjuQNJ+XhA/39nPhvn8UyhsPl
	BqnxxLWxpZXstrfYRkm+uj0BaAzvld9cG09G+1yYx1ZowC38QTLQJwf0rxVGb7bZfzsY
	KGeRnUaVE9cnyeVA3+Mo/lKv3BTTfqaCuILgUWdKZ5v7mJGiZLwdx4faDl9GfDM6+/P/
	ee+uBo0eij3y/ls8oYclaxzrMui9ByFydRCgCXb/b2RPSOXROhLfwlwx7eHDAO/ew/6c
	hQ2Nqf3VAtTIfwwDFvt6ur1FDbtpM4P1Fs2ikr+HtgpFo8GngqbiHJjirYUB08sfmz8I
	YMYg==
X-Gm-Message-State: AN3rC/5dBzIssLvM4Sm1DjjQf4gLUAKHfij2Zz4fccnqv5g7LW7tweGd
	/EUs3k1PLZMwEg==
X-Received: by 10.55.128.198 with SMTP id b189mr6622539qkd.301.1492400963139; 
	Sun, 16 Apr 2017 20:49:23 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 55sm6420715qtt.12.2017.04.16.20.49.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Apr 2017 20:49:22 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
	<1487262963-11519-11-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1d91f91-bef4-5740-a3d7-71193cba6251@amsat.org>
Date: Mon, 17 Apr 2017 00:49:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1487262963-11519-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH v2 10/13] armv7m: Extract "exception taken"
 code into functions
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
X-TUID: 4QuRtiabi0bx

On 02/16/2017 01:36 PM, Peter Maydell wrote:
> Extract the code from the tail end of arm_v7m_do_interrupt() which
> enters the exception handler into a pair of utility functions
> v7m_exception_taken() and v7m_push_stack(), which correspond roughly
> to the pseudocode PushStack() and ExceptionTaken().
>
> This also requires us to move the arm_v7m_load_vector() utility
> routine up so we can call it.
>
> Handling illegal exception returns has some cases where we want to
> take a UsageFault either on an existing stack frame or with a new
> stack frame but with a specific LR value, so we want to be able to
> call these without having to go via arm_v7m_cpu_do_interrupt().
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 118 ++++++++++++++++++++++++++++++----------------------
>  1 file changed, 68 insertions(+), 50 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 1844852..f94d1c7 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6001,6 +6001,72 @@ static void switch_v7m_sp(CPUARMState *env, bool new_spsel)
>      }
>  }
>
> +static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
> +{
> +    CPUState *cs = CPU(cpu);
> +    CPUARMState *env = &cpu->env;
> +    MemTxResult result;
> +    hwaddr vec = env->v7m.vecbase + env->v7m.exception * 4;
> +    uint32_t addr;
> +
> +    addr = address_space_ldl(cs->as, vec,
> +                             MEMTXATTRS_UNSPECIFIED, &result);
> +    if (result != MEMTX_OK) {
> +        /* Architecturally this should cause a HardFault setting HSFR.VECTTBL,
> +         * which would then be immediately followed by our failing to load
> +         * the entry vector for that HardFault, which is a Lockup case.
> +         * Since we don't model Lockup, we just report this guest error
> +         * via cpu_abort().
> +         */
> +        cpu_abort(cs, "Failed to read from exception vector table "
> +                  "entry %08x\n", (unsigned)vec);
> +    }
> +    return addr;
> +}
> +
> +static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr)
> +{
> +    /* Do the "take the exception" parts of exception entry,
> +     * but not the pushing of state to the stack. This is
> +     * similar to the pseudocode ExceptionTaken() function.
> +     */
> +    CPUARMState *env = &cpu->env;
> +    uint32_t addr;
> +
> +    armv7m_nvic_acknowledge_irq(env->nvic);
> +    switch_v7m_sp(env, 0);
> +    /* Clear IT bits */
> +    env->condexec_bits = 0;
> +    env->regs[14] = lr;
> +    addr = arm_v7m_load_vector(cpu);
> +    env->regs[15] = addr & 0xfffffffe;
> +    env->thumb = addr & 1;
> +}
> +
> +static void v7m_push_stack(ARMCPU *cpu)
> +{
> +    /* Do the "set up stack frame" part of exception entry,
> +     * similar to pseudocode PushStack().
> +     */
> +    CPUARMState *env = &cpu->env;
> +    uint32_t xpsr = xpsr_read(env);
> +
> +    /* Align stack pointer if the guest wants that */
> +    if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
> +        env->regs[13] -= 4;
> +        xpsr |= 0x200;
> +    }
> +    /* Switch to the handler mode.  */
> +    v7m_push(env, xpsr);
> +    v7m_push(env, env->regs[15]);
> +    v7m_push(env, env->regs[14]);
> +    v7m_push(env, env->regs[12]);
> +    v7m_push(env, env->regs[3]);
> +    v7m_push(env, env->regs[2]);
> +    v7m_push(env, env->regs[1]);
> +    v7m_push(env, env->regs[0]);
> +}
> +
>  static void do_v7m_exception_exit(CPUARMState *env)
>  {
>      uint32_t type;
> @@ -6062,37 +6128,11 @@ static void arm_log_exception(int idx)
>      }
>  }
>
> -static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
> -
> -{
> -    CPUState *cs = CPU(cpu);
> -    CPUARMState *env = &cpu->env;
> -    MemTxResult result;
> -    hwaddr vec = env->v7m.vecbase + env->v7m.exception * 4;
> -    uint32_t addr;
> -
> -    addr = address_space_ldl(cs->as, vec,
> -                             MEMTXATTRS_UNSPECIFIED, &result);
> -    if (result != MEMTX_OK) {
> -        /* Architecturally this should cause a HardFault setting HSFR.VECTTBL,
> -         * which would then be immediately followed by our failing to load
> -         * the entry vector for that HardFault, which is a Lockup case.
> -         * Since we don't model Lockup, we just report this guest error
> -         * via cpu_abort().
> -         */
> -        cpu_abort(cs, "Failed to read from exception vector table "
> -                  "entry %08x\n", (unsigned)vec);
> -    }
> -    return addr;
> -}
> -
>  void arm_v7m_cpu_do_interrupt(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> -    uint32_t xpsr = xpsr_read(env);
>      uint32_t lr;
> -    uint32_t addr;
>
>      arm_log_exception(cs->exception_index);
>
> @@ -6150,31 +6190,9 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          return; /* Never happens.  Keep compiler happy.  */
>      }
>
> -    armv7m_nvic_acknowledge_irq(env->nvic);
> -
> +    v7m_push_stack(cpu);
> +    v7m_exception_taken(cpu, lr);
>      qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
> -
> -    /* Align stack pointer if the guest wants that */
> -    if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
> -        env->regs[13] -= 4;
> -        xpsr |= 0x200;
> -    }
> -    /* Switch to the handler mode.  */
> -    v7m_push(env, xpsr);
> -    v7m_push(env, env->regs[15]);
> -    v7m_push(env, env->regs[14]);
> -    v7m_push(env, env->regs[12]);
> -    v7m_push(env, env->regs[3]);
> -    v7m_push(env, env->regs[2]);
> -    v7m_push(env, env->regs[1]);
> -    v7m_push(env, env->regs[0]);
> -    switch_v7m_sp(env, 0);
> -    /* Clear IT bits */
> -    env->condexec_bits = 0;
> -    env->regs[14] = lr;
> -    addr = arm_v7m_load_vector(cpu);
> -    env->regs[15] = addr & 0xfffffffe;
> -    env->thumb = addr & 1;
>  }
>
>  /* Function used to synchronize QEMU's AArch64 register set with AArch32
>
