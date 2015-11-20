Received: by 10.182.158.201 with SMTP id ww9csp489434obb;
        Fri, 20 Nov 2015 05:49:08 -0800 (PST)
X-Received: by 10.129.90.4 with SMTP id o4mr12693295ywb.243.1448027348932;
        Fri, 20 Nov 2015 05:49:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si10601709ywb.212.2015.11.20.05.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 05:49:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:47435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zzm3o-0007g3-GR
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 08:49:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zzm3H-0007YJ-2a
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 08:49:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zzm2l-0006Cl-86
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 08:48:34 -0500
Received: from mail-yk0-x234.google.com ([2607:f8b0:4002:c07::234]:36756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zzm2k-0006Cd-VA
	for qemu-arm@nongnu.org; Fri, 20 Nov 2015 08:48:03 -0500
Received: by ykdr82 with SMTP id r82so161189501ykd.3
	for <qemu-arm@nongnu.org>; Fri, 20 Nov 2015 05:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+gXMY++voopt4q3QfUYaml7MX2TsiE3WMuF4wg41CIA=;
	b=bCzPCyfqx4iy9bbeMxDw4+E49pbYknd5oJulQtdKUavZ7mw336jKRcJuUU8sFE4EsZ
	81lKsaJZoCpqY7PuDtnm99e1B85SZ5mlCrvapzkMv7HLF3Xq5kEdMAK2mm1IirybbiVq
	M8gECjTilLFUdQOJuvHoifsmIZO/PdiPrfu08ob3KUaPKZW8v0+FFqD/FmBICn4OeajK
	aTU0UHW8gqsEXndbqKhts+dtEtLebsCR/4nN0EZ4WTMXHHTyuwC3pYISY+7eN57mqwkw
	oo6VTNO4BZqq0gCs4UXrA64w+lGvFlkaeOqEktogqlg2iwqzTHV9hTPNtoprM7wdmXCE
	mHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+gXMY++voopt4q3QfUYaml7MX2TsiE3WMuF4wg41CIA=;
	b=SRxNbLjLprewZL84OrPwdctigo9AYgmxH0wZLyggf+AeBqqUt+A94kZ6VFjwX0f7fg
	s/YZNigi4yJ8+EI1wi37BlR1h01Iyywa5MyG24NetAa5Jyn+NfZ3gNazSC2njR485Z/Z
	8mT+GIYmVYrTzOI9hfK/VskT4DI748VUE9ciw8LK+9h5t7rsp/P7p6qfcwLWtdrj4i6l
	3l0dzgx5IRGQXrB+uG4WhOyNWOlxiHE9TMpCtnTC18ncbKBsNMu89MuCD8tize3O6g1/
	m0ivULSRAJVxTpwfvxzpa24pskV+QhECjEW1+/gvZgBbPAHqiHIySxL8zRl9ZTj6MeQS
	9FuQ==
X-Gm-Message-State: ALoCoQnO4Ek+W5pZtO+WOdZ8QrxDpSkABZtJQ+MUqqnU/wsQ5vsqoxP8BhvW5EhbzrynLhDioJj9
X-Received: by 10.129.110.70 with SMTP id j67mr14462134ywc.180.1448027282463; 
	Fri, 20 Nov 2015 05:48:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 05:47:43 -0800 (PST)
In-Reply-To: <1447031505-12477-12-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<1447031505-12477-12-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 13:47:43 +0000
Message-ID: <CAFEAcA_M0z=QaeASNBfM6QfOhZ=+hvZD0XkX9nM4C4x3Fs0EEw@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::234
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 11/18] armv7m: fix I and F flag handling
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
X-TUID: jBH0owKODJUZ

On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Despite having the same notation, these bits
> have completely different meaning than -AR.
>
> Add armv7m_excp_unmasked()
> to calculate the currently runable exception priority
> taking into account masks and active handlers.
> Use this in conjunction with the pending exception
> priority to determine if the pending exception
> can interrupt execution.

This function is used by code added in earlier patches in
this series, so this patch needs to be moved earlier in the
series, or those patches won't compile.

> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> ---
>  target-arm/cpu.c | 26 +++++++-------------------
>  target-arm/cpu.h | 27 ++++++++++++++++++++++++++-
>  2 files changed, 33 insertions(+), 20 deletions(-)
>
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index be026bc..5d03117 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -173,6 +173,8 @@ static void arm_cpu_reset(CPUState *s)
>          uint32_t initial_pc; /* Loaded from 0x4 */
>          uint8_t *rom;
>
> +        env->v7m.exception_prio = env->v7m.pending_prio = 0x100;
> +
>          env->daif &= ~PSTATE_I;
>          rom = rom_ptr(0);
>          if (rom) {
> @@ -301,29 +303,15 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cs);
>      ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
>      bool ret = false;
>
> -
> -    if (interrupt_request & CPU_INTERRUPT_FIQ
> -        && !(env->daif & PSTATE_F)) {
> -        cs->exception_index = EXCP_FIQ;
> -        cc->do_interrupt(cs);
> -        ret = true;
> -    }
> -    /* ARMv7-M interrupt return works by loading a magic value
> -     * into the PC.  On real hardware the load causes the
> -     * return to occur.  The qemu implementation performs the
> -     * jump normally, then does the exception return when the
> -     * CPU tries to execute code at the magic address.
> -     * This will cause the magic PC value to be pushed to
> -     * the stack if an interrupt occurred at the wrong time.
> -     * We avoid this by disabling interrupts when
> -     * pc contains a magic address.

This (removing this comment and the checks for the magic address)
seem to be part of a separate change [probably the one in
"armv7m: Undo armv7m.hack"] and shouldn't be in this patch.

> +    /* ARMv7-M interrupt masking works differently than -A or -R.
> +     * There is no FIQ/IRQ distinction.
> +     * Instead of masking interrupt sources, the I and F bits
> +     * (along with basepri) mask certain exception priority levels.
>       */
>      if (interrupt_request & CPU_INTERRUPT_HARD
> -        && !(env->daif & PSTATE_I)
> -        && (env->regs[15] < 0xfffffff0)) {
> +            && (armv7m_excp_unmasked(cpu) >= cpu->env.v7m.pending_prio)) {
>          cs->exception_index = EXCP_IRQ;
>          cc->do_interrupt(cs);
>          ret = true;
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index c193fbb..29d89ce 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1033,9 +1033,34 @@ void arm_cpu_list(FILE *f, fprintf_function cpu_fprintf);
>  uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
>                                   uint32_t cur_el, bool secure);
>
> +/* @returns highest (numerically lowest) unmasked exception priority
> + */
> +static inline
> +int armv7m_excp_unmasked(ARMCPU *cpu)

What this is really calculating is the current execution
priority (running priority) of the CPU, so I think a better
name would be armv7m_current_exec_priority() or
armv7m_current_priority() or armv7m_running_priority() or similar.

> +{
> +    CPUARMState *env = &cpu->env;
> +    int runnable;
> +
> +    /* find highest (numerically lowest) priority which could
> +     * run based on masks
> +     */
> +    if (env->daif&PSTATE_F) { /* FAULTMASK */

Style issue -- operands should have spaces around them.

> +        runnable = -2;

These all seem to be off by one: FAULTMASK sets the
running priority to -1, not -2, PRIMASK sets it to 0,
not -1, and so on.

> +    } else if (env->daif&PSTATE_I) { /* PRIMASK */
> +        runnable = -1;
> +    } else if (env->v7m.basepri > 0) {
> +        /* BASEPRI==1 -> runnable==-1 (same as PRIMASK==1) */

(applies to operands in comments too)

> +        runnable = env->v7m.basepri-2;

Where is this - 2 from? Also, BASEPRI values honour the
PRIGROUP setting. (Compare the ExecutionPriority pseudocode).

> +    } else {
> +        runnable = 0x100; /* lower than any possible priority */
> +    }
> +    /* consider priority of active handler */
> +    return MIN(runnable, env->v7m.exception_prio-1);

I don't think this -1 should be here.

> +}
> +
>  /* Interface between CPU and Interrupt controller.  */
>  void armv7m_nvic_set_pending(void *opaque, int irq);
> -int armv7m_nvic_acknowledge_irq(void *opaque);
> +void armv7m_nvic_acknowledge_irq(void *opaque);
>  void armv7m_nvic_complete_irq(void *opaque, int irq);
>
>  /* Interface for defining coprocessor registers.

thanks
-- PMM
