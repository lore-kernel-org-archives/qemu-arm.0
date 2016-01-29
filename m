Received: by 10.25.159.19 with SMTP id i19csp1049878lfe;
        Fri, 29 Jan 2016 08:46:04 -0800 (PST)
X-Received: by 10.112.161.201 with SMTP id xu9mr3660069lbb.35.1454085964233;
        Fri, 29 Jan 2016 08:46:04 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com. [2a00:1450:4010:c07::242])
        by mx.google.com with ESMTPS id iy6si8513956lbc.138.2016.01.29.08.46.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2016 08:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::242 as permitted sender) client-ip=2a00:1450:4010:c07::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::242 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x242.google.com with SMTP id e36so682103lfi.0;
        Fri, 29 Jan 2016 08:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=Yq29aLq2/MjVV/XmCd0Oqg9TqudE9tX1n2pTSFSU+5o=;
        b=G4+ojNEX0hMzR6zWSb/qfxrd26vve0JTOvZskrJVW9xOvwyR8pnhpliQOBQuiUY6yQ
         FbmpV5/66MAvC8nBeRydj4UdVU34jgwyCbsG5vGHMZuaTADJIjCE0iEuFH5TbalO7MVt
         MEPBK37U36iYJ2ShrvZzvgitsuNaWMuyTJHPXJquhtkEPWEIfXrOnNEDNKaGOdEfzmva
         zXd3oXaWhMNlE4ICPNUBfIEe+a/SDcmbocB/gKcBu0nwRXjYB8pTVWrl/QdI85DLE3vf
         h9SnOR419NWKz0zzYC/BJidQW40h2lW+MgVPzrSPKOZI+C3xwzJ4jH2vDBoZQztqk/24
         /aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Yq29aLq2/MjVV/XmCd0Oqg9TqudE9tX1n2pTSFSU+5o=;
        b=fPcQSPDE5RNESikfV/ry7ZDB2E9GgvHFtxNCNc5KLgBcrh437as21oTYiQnuwJeYoy
         ld+muxVcIMvDeCrhvsb1cjqYbUiUW+/hdwLSwsPlF+e63+i3+JFjQfUZcl7KfCAN6jQd
         ZeTmCIWt8nyTnQqEM6pFlvDZOeBdRZaIIMtXZxTJI8EthmfAHH087PxSnB548ofNyBrq
         gzZg4rO3W6NR2VMPoKWUFCH95y7UDQZy7rcmAgtefcBtYCj8gGJKPdc1JTurQc425fUA
         NVKkLgQVvGqM39Rx3GAuRnnemZs4gY9TRnffrJ1zk8zbwomzLtFHZufkia9LLhHslWAp
         vd6A==
X-Gm-Message-State: AG10YOQtk/3q1JzZdVASd5HVmGdcJD9WTCQSBsCULBCW6I3glx2Mczxfcj5LmiRPVYnlAg==
X-Received: by 10.25.213.3 with SMTP id m3mr3678788lfg.125.1454085963882;
        Fri, 29 Jan 2016 08:46:03 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [10.30.10.50] ([213.243.91.10])
        by smtp.googlemail.com with ESMTPSA id f186sm2135206lfd.26.2016.01.29.08.46.02
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 29 Jan 2016 08:46:03 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH 2/8] target-arm: Move
 aarch64_cpu_do_interrupt() to helper.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-3-git-send-email-peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, patches@linaro.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB9749.2090301@gmail.com>
Date: Fri, 29 Jan 2016 19:46:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452796451-2946-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: nnZfTWaIrk1J

On 14.01.2016 21:34, Peter Maydell wrote:
> Move the aarch64_cpu_do_interrupt() function to helper.c. We want
> to be able to call this from code that isn't AArch64-only, and
> the move allows us to avoid awkward #ifdeffery at the callsite.

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
