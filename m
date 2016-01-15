Received: by 10.25.159.19 with SMTP id i19csp504464lfe;
        Fri, 15 Jan 2016 06:39:38 -0800 (PST)
X-Received: by 10.67.7.3 with SMTP id cy3mr5098724pad.100.1452868778325;
        Fri, 15 Jan 2016 06:39:38 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com. [2607:f8b0:400e:c00::242])
        by mx.google.com with ESMTPS id v18si16870557pfi.243.2016.01.15.06.39.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jan 2016 06:39:38 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) client-ip=2607:f8b0:400e:c00::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x242.google.com with SMTP id n128so8597376pfn.3;
        Fri, 15 Jan 2016 06:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=s9xQJAwU3jyuYQ25DClJGhsg2Q5oDvOuPqFhUwcXePk=;
        b=STZVMq93z0lyPx7vANqn3YQvFWzNVxVpi52inr7OozKV05gBosgzZ2arVW+4BKYgVV
         KdpmSbvqYU5cN9botCmKajh/QhyaqSvIN8FPcW5Z4eCVjHhbsA/5ciYKVlqRR/ubAq+R
         cjgfY9CEBbg48Ma9vWghC/NWQSXnqg+8cTogxHK2lreDXIuWN9bkbKgLCw+An5+MYYLp
         dDQiMk33tq4PHlI5x2NhAooCsWESjN6REy4XuOajPHy5vyQh6cJ+bRNKyq2CqwnfFtLY
         U/6/Oluq5nI4a6mShJbQ/iHzHq5DtAXimXXbSxVBrLsXf3sWKekl8CGfC+1+4GpHj0mr
         oMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition:in-reply-to
         :user-agent;
        bh=s9xQJAwU3jyuYQ25DClJGhsg2Q5oDvOuPqFhUwcXePk=;
        b=I0TF+V056tLzi33GuVHv+ozknFw2FZ+uzo7rtRse687MgzM0BU/yiMkdT7N+1PhymE
         6/bB8ggs/mckwDwFfs5thDCvcPyK/P2KBbmvr/r7refpT41VpM5FzVIqukJmw/6tUoiY
         KPV83b5j8cBH07hOhZgsBlBcUo9hROUI4rN6FlE3Y07LDsqcWrFwKkkKTqe2u7q0tgcy
         3WiRblHUnoctgNOXR1HlfVIhQYg4qoCpb+wVOc9WupR09lWBk27Y3fL22Ddpp2yuRgkE
         NxsZkgVDuAknF5pulcy8NBQdN5QVQjtMd81WkB1nPW6D/Yk+0GKx+SZ6oBEiIVcboqov
         +xFw==
X-Gm-Message-State: ALoCoQn7x0b79ylQCaqwxmyqvc/L3au/c1a8VcLeDKngmQ81/z9vGC9JCrqGIUb2GdbP0/xiuLWLQA78lSG4aQLP6kZjn6bywQ==
X-Received: by 10.98.14.209 with SMTP id 78mr15232874pfo.157.1452868777798;
        Fri, 15 Jan 2016 06:39:37 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id n84sm16041247pfa.45.2016.01.15.06.39.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:39:37 -0800 (PST)
Date: Fri, 15 Jan 2016 15:39:28 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 2/8] target-arm: Move aarch64_cpu_do_interrupt() to
 helper.c
Message-ID: <20160115143928.GJ29396@toto>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452796451-2946-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: 1Rms3Y02dxjD

On Thu, Jan 14, 2016 at 06:34:05PM +0000, Peter Maydell wrote:
> Move the aarch64_cpu_do_interrupt() function to helper.c. We want
> to be able to call this from code that isn't AArch64-only, and
> the move allows us to avoid awkward #ifdeffery at the callsite.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target-arm/cpu-qom.h    |   2 +-
>  target-arm/helper-a64.c | 104 ------------------------------------------------
>  target-arm/helper.c     | 100 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 101 insertions(+), 105 deletions(-)
> 
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index e4d4270..bda2af8 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -247,8 +247,8 @@ void arm_gt_stimer_cb(void *opaque);
>  #ifdef TARGET_AARCH64
>  int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +#endif
>  
>  void aarch64_cpu_do_interrupt(CPUState *cs);
> -#endif
>  
>  #endif
> diff --git a/target-arm/helper-a64.c b/target-arm/helper-a64.c
> index fc3ccdf..a322e7b 100644
> --- a/target-arm/helper-a64.c
> +++ b/target-arm/helper-a64.c
> @@ -25,7 +25,6 @@
>  #include "qemu/bitops.h"
>  #include "internals.h"
>  #include "qemu/crc32c.h"
> -#include "sysemu/kvm.h"
>  #include <zlib.h> /* For crc32 */
>  
>  /* C2.4.7 Multiply and divide */
> @@ -443,106 +442,3 @@ uint64_t HELPER(crc32c_64)(uint64_t acc, uint64_t val, uint32_t bytes)
>      /* Linux crc32c converts the output to one's complement.  */
>      return crc32c(acc, buf, bytes) ^ 0xffffffff;
>  }
> -
> -#if !defined(CONFIG_USER_ONLY)
> -
> -/* Handle a CPU exception.  */
> -void aarch64_cpu_do_interrupt(CPUState *cs)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -    unsigned int new_el = env->exception.target_el;
> -    target_ulong addr = env->cp15.vbar_el[new_el];
> -    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
> -
> -    if (arm_current_el(env) < new_el) {
> -        if (env->aarch64) {
> -            addr += 0x400;
> -        } else {
> -            addr += 0x600;
> -        }
> -    } else if (pstate_read(env) & PSTATE_SP) {
> -        addr += 0x200;
> -    }
> -
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
> -    switch (cs->exception_index) {
> -    case EXCP_PREFETCH_ABORT:
> -    case EXCP_DATA_ABORT:
> -        env->cp15.far_el[new_el] = env->exception.vaddress;
> -        qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
> -                      env->cp15.far_el[new_el]);
> -        /* fall through */
> -    case EXCP_BKPT:
> -    case EXCP_UDEF:
> -    case EXCP_SWI:
> -    case EXCP_HVC:
> -    case EXCP_HYP_TRAP:
> -    case EXCP_SMC:
> -        env->cp15.esr_el[new_el] = env->exception.syndrome;
> -        break;
> -    case EXCP_IRQ:
> -    case EXCP_VIRQ:
> -        addr += 0x80;
> -        break;
> -    case EXCP_FIQ:
> -    case EXCP_VFIQ:
> -        addr += 0x100;
> -        break;
> -    case EXCP_SEMIHOST:
> -        qemu_log_mask(CPU_LOG_INT,
> -                      "...handling as semihosting call 0x%" PRIx64 "\n",
> -                      env->xregs[0]);
> -        env->xregs[0] = do_arm_semihosting(env);
> -        return;
> -    default:
> -        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
> -    }
> -
> -    if (is_a64(env)) {
> -        env->banked_spsr[aarch64_banked_spsr_index(new_el)] = pstate_read(env);
> -        aarch64_save_sp(env, arm_current_el(env));
> -        env->elr_el[new_el] = env->pc;
> -    } else {
> -        env->banked_spsr[aarch64_banked_spsr_index(new_el)] = cpsr_read(env);
> -        if (!env->thumb) {
> -            env->cp15.esr_el[new_el] |= 1 << 25;
> -        }
> -        env->elr_el[new_el] = env->regs[15];
> -
> -        aarch64_sync_32_to_64(env);
> -
> -        env->condexec_bits = 0;
> -    }
> -    qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
> -                  env->elr_el[new_el]);
> -
> -    pstate_write(env, PSTATE_DAIF | new_mode);
> -    env->aarch64 = 1;
> -    aarch64_restore_sp(env, new_el);
> -
> -    env->pc = addr;
> -
> -    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
> -                  new_el, env->pc, pstate_read(env));
> -
> -    if (!kvm_enabled()) {
> -        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
> -    }
> -}
> -#endif
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index a06bfaf..519f066 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -11,6 +11,7 @@
>  #include "arm_ldst.h"
>  #include <zlib.h> /* For crc32 */
>  #include "exec/semihost.h"
> +#include "sysemu/kvm.h"
>  
>  #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
>  
> @@ -5901,6 +5902,105 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
>  }
>  
> +/* Handle a CPU exception.  */
> +void aarch64_cpu_do_interrupt(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    unsigned int new_el = env->exception.target_el;
> +    target_ulong addr = env->cp15.vbar_el[new_el];
> +    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
> +
> +    if (arm_current_el(env) < new_el) {
> +        if (env->aarch64) {
> +            addr += 0x400;
> +        } else {
> +            addr += 0x600;
> +        }
> +    } else if (pstate_read(env) & PSTATE_SP) {
> +        addr += 0x200;
> +    }
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
> +    switch (cs->exception_index) {
> +    case EXCP_PREFETCH_ABORT:
> +    case EXCP_DATA_ABORT:
> +        env->cp15.far_el[new_el] = env->exception.vaddress;
> +        qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
> +                      env->cp15.far_el[new_el]);
> +        /* fall through */
> +    case EXCP_BKPT:
> +    case EXCP_UDEF:
> +    case EXCP_SWI:
> +    case EXCP_HVC:
> +    case EXCP_HYP_TRAP:
> +    case EXCP_SMC:
> +        env->cp15.esr_el[new_el] = env->exception.syndrome;
> +        break;
> +    case EXCP_IRQ:
> +    case EXCP_VIRQ:
> +        addr += 0x80;
> +        break;
> +    case EXCP_FIQ:
> +    case EXCP_VFIQ:
> +        addr += 0x100;
> +        break;
> +    case EXCP_SEMIHOST:
> +        qemu_log_mask(CPU_LOG_INT,
> +                      "...handling as semihosting call 0x%" PRIx64 "\n",
> +                      env->xregs[0]);
> +        env->xregs[0] = do_arm_semihosting(env);
> +        return;
> +    default:
> +        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
> +    }
> +
> +    if (is_a64(env)) {
> +        env->banked_spsr[aarch64_banked_spsr_index(new_el)] = pstate_read(env);
> +        aarch64_save_sp(env, arm_current_el(env));
> +        env->elr_el[new_el] = env->pc;
> +    } else {
> +        env->banked_spsr[aarch64_banked_spsr_index(new_el)] = cpsr_read(env);
> +        if (!env->thumb) {
> +            env->cp15.esr_el[new_el] |= 1 << 25;
> +        }
> +        env->elr_el[new_el] = env->regs[15];
> +
> +        aarch64_sync_32_to_64(env);
> +
> +        env->condexec_bits = 0;
> +    }
> +    qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
> +                  env->elr_el[new_el]);
> +
> +    pstate_write(env, PSTATE_DAIF | new_mode);
> +    env->aarch64 = 1;
> +    aarch64_restore_sp(env, new_el);
> +
> +    env->pc = addr;
> +
> +    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
> +                  new_el, env->pc, pstate_read(env));
> +
> +    if (!kvm_enabled()) {
> +        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
> +    }
> +}
>  
>  /* Return the exception level which controls this address translation regime */
>  static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
> -- 
> 1.9.1
> 
