Received: by 10.25.159.19 with SMTP id i19csp512605lfe;
        Fri, 15 Jan 2016 06:54:53 -0800 (PST)
X-Received: by 10.66.252.136 with SMTP id zs8mr15425932pac.110.1452869693796;
        Fri, 15 Jan 2016 06:54:53 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com. [2607:f8b0:400e:c00::242])
        by mx.google.com with ESMTPS id z88si17012104pfi.50.2016.01.15.06.54.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jan 2016 06:54:53 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) client-ip=2607:f8b0:400e:c00::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x242.google.com with SMTP id 65so8622833pff.2;
        Fri, 15 Jan 2016 06:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=BRn6oVkwDHUAPPYlMrQIIiwW+64+rIAU3NRrSd9oE00=;
        b=jiCzKJSXB9xCn+NsVoZhJN4AVfCq4zNUTcknU5QCKjOgICebnjRaSSLDR8PsWAKbBB
         ckD5gjf4aW76jXwjUKS1I1L1pdI358WAopplfa/UDlXr7ol8oCd2MgP+dQOf9+xUOIAi
         /AQg0jq4eosBfHttlfqZHP6iyjzRlDZTB4PEcKMXSdDlMsZpzDRuo6kF27J5BB+n/56r
         2M45QqECpwL4Gr4sdTNqCvG/GPNsGlT1u2OJC6wmkUlSPk5nEDvwxMZOmmrtVATb521k
         ufa7h/ag+V44g9vBbxcbRCbcSTV4AFn9GAJif6ZcE+bpKW9PqMyylfbtG+0/CiCsco/c
         Grww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=BRn6oVkwDHUAPPYlMrQIIiwW+64+rIAU3NRrSd9oE00=;
        b=I4rR4N9AsnejrAl4sG+11lCSiHtTdIs9OCs97lwCXr+V1mffaVZzkBiGqp10XvkHo3
         Yv8as8UZUXmUV9VTTAY4jOOm0Zr00VvJEn9cEMJU3dKq0U1hykVuizVB67CWf5e0FlUo
         lcjpv0DfZR2AnEim9Y3eRTw4mSz/eOOo/q0GVW7T6VidIJ59HhJj1tjOEpg4BNOISSEx
         Jwkx+0n7olH9rHEDXlzycyC4KsR4bDeVWLoZFnaZbfhP9mUFiUqWU5Xm7m1h92eE3wT3
         SyEk3a9Pk2l0IZGlS6tb2Lu4HXXrZQN6NIkIzYugdAxj1FvLhAuOH6CYJqUdQQQd0Lin
         tptA==
X-Gm-Message-State: ALoCoQlUmgoSJciLWDSIT3W69nM8jL1edltxdaJrqgG3xeP0qfyCDs9ZUz4Pwhpr6qEqp5dl+RVHOCg4AA0K96LhA7TLSApZcw==
X-Received: by 10.98.87.20 with SMTP id l20mr15478761pfb.70.1452869693360;
        Fri, 15 Jan 2016 06:54:53 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id w22sm16064494pfa.79.2016.01.15.06.54.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:54:52 -0800 (PST)
Date: Fri, 15 Jan 2016 15:54:43 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 3/8] target-arm: Use a single entry point for AArch64 and
 AArch32 exceptions
Message-ID: <20160115145443.GK29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452796451-2946-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: S6vmhChHcAGf

On Thu, Jan 14, 2016 at 06:34:06PM +0000, Peter Maydell wrote:
> If EL2 or EL3 is present on an AArch64 CPU, then exceptions can be
> taken to an exception level which is running AArch32 (if only EL0
> and EL1 are present then EL1 must be AArch64 and all exceptions are
> taken to AArch64). To support this we need to have a single
> implementation of the CPU do_interrupt() method which can handle both
> 32 and 64 bit exception entry.
> 
> Pull the common parts of aarch64_cpu_do_interrupt() and
> arm_cpu_do_interrupt() out into a new function which calls
> either the AArch32 or AArch64 specific entry code once it has
> worked out which one is needed.
> 
> We temporarily special-case the handling of EXCP_SEMIHOST to
> avoid an assertion in arm_el_is_aa64(); the next patch will
> pull all the semihosting handling out to the arm_cpu_do_interrupt()
> level (since semihosting semantics depend on the register width
> of the calling code, not on that of any higher EL).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target-arm/cpu-qom.h |  2 --
>  target-arm/cpu64.c   |  3 ---
>  target-arm/helper.c  | 75 ++++++++++++++++++++++++++++++----------------------
>  3 files changed, 44 insertions(+), 36 deletions(-)
> 
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index bda2af8..eae6cd1 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -249,6 +249,4 @@ int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  #endif
>  
> -void aarch64_cpu_do_interrupt(CPUState *cs);
> -
>  #endif
> diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
> index 63c8b1c..edb41f7 100644
> --- a/target-arm/cpu64.c
> +++ b/target-arm/cpu64.c
> @@ -290,9 +290,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
>  {
>      CPUClass *cc = CPU_CLASS(oc);
>  
> -#if !defined(CONFIG_USER_ONLY)
> -    cc->do_interrupt = aarch64_cpu_do_interrupt;
> -#endif
>      cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
>      cc->set_pc = aarch64_cpu_set_pc;
>      cc->gdb_read_register = aarch64_cpu_gdb_read_register;
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 519f066..962bb3c 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5707,8 +5707,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
>      env->regs[15] = env->pc;
>  }
>  
> -/* Handle a CPU exception.  */
> -void arm_cpu_do_interrupt(CPUState *cs)
> +static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> @@ -5718,16 +5717,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      uint32_t offset;
>      uint32_t moe;
>  
> -    assert(!IS_M(env));
> -
> -    arm_log_exception(cs->exception_index);
> -
> -    if (arm_is_psci_call(cpu, cs->exception_index)) {
> -        arm_handle_psci_call(cpu);
> -        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> -        return;
> -    }
> -
>      /* If this is a debug exception we must update the DBGDSCR.MOE bits */
>      switch (env->exception.syndrome >> ARM_EL_EC_SHIFT) {
>      case EC_BREAKPOINT:
> @@ -5899,11 +5888,10 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      }
>      env->regs[14] = env->regs[15] + offset;
>      env->regs[15] = addr;
> -    cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
>  }
>  
> -/* Handle a CPU exception.  */
> -void aarch64_cpu_do_interrupt(CPUState *cs)
> +/* Handle exception entry to a target EL which is using AArch64 */
> +static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> @@ -5921,22 +5909,6 @@ void aarch64_cpu_do_interrupt(CPUState *cs)
>          addr += 0x200;
>      }
>  
> -    arm_log_exception(cs->exception_index);
> -    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
> -                  new_el);
> -    if (qemu_loglevel_mask(CPU_LOG_INT)
> -        && !excp_is_internal(cs->exception_index)) {
> -        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
> -                      env->exception.syndrome >> ARM_EL_EC_SHIFT,
> -                      env->exception.syndrome);
> -    }
> -
> -    if (arm_is_psci_call(cpu, cs->exception_index)) {
> -        arm_handle_psci_call(cpu);
> -        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> -        return;
> -    }
> -
>      switch (cs->exception_index) {
>      case EXCP_PREFETCH_ABORT:
>      case EXCP_DATA_ABORT:
> @@ -5996,6 +5968,47 @@ void aarch64_cpu_do_interrupt(CPUState *cs)
>  
>      qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
>                    new_el, env->pc, pstate_read(env));
> +}
> +
> +/* Handle a CPU exception for A and R profile CPUs.
> + * Do any appropriate logging, handle PSCI calls, and then hand off
> + * to the AArch64-entry or AArch32-entry function depending on the
> + * target exception level's register width.
> + */
> +void arm_cpu_do_interrupt(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    unsigned int new_el = env->exception.target_el;
> +
> +    assert(!IS_M(env));
> +
> +    arm_log_exception(cs->exception_index);
> +    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
> +                  new_el);
> +    if (qemu_loglevel_mask(CPU_LOG_INT)
> +        && !excp_is_internal(cs->exception_index)) {
> +        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
> +                      env->exception.syndrome >> ARM_EL_EC_SHIFT,
> +                      env->exception.syndrome);
> +    }
> +
> +    if (arm_is_psci_call(cpu, cs->exception_index)) {
> +        arm_handle_psci_call(cpu);
> +        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
> +        return;
> +    }
> +
> +    /* Temporary special case for EXCP_SEMIHOST, which is used only
> +     * for 64-bit semihosting calls -- as this is an internal exception
> +     * it has no specified target level and arm_el_is_aa64() would
> +     * assert because new_el could be 0.
> +     */
> +    if (cs->exception_index == EXCP_SEMIHOST || arm_el_is_aa64(env, new_el)) {
> +        arm_cpu_do_interrupt_aarch64(cs);
> +    } else {
> +        arm_cpu_do_interrupt_aarch32(cs);
> +    }
>  
>      if (!kvm_enabled()) {
>          cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
> -- 
> 1.9.1
> 
