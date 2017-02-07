Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g40sm8312010wrg.19.2017.02.07.08.52.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Feb 2017 08:52:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 975BF3E008E;
	Tue,  7 Feb 2017 16:52:14 +0000 (GMT)
References: <20170206153113.27729-1-alex.bennee@linaro.org> <20170206153113.27729-21-alex.bennee@linaro.org> <CAFEAcA9YEo2+_9jc4V_aEds_tQV-f5pU+W49zUs1Ls0JOiQTLg@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, MTTCG Devel
 <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD =?utf-8?B?RnLDqWTDqXJpYw==?= <fred.konrad@greensocs.com>, Alvise
 Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>,
 Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania
 <nikunj@linux.vnet.ibm.com>, Mark Burton <mark.burton@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Fedorov Sergey <serge.fdrv@gmail.com>, Bamvor Zhang Jian
 <bamvor.zhangjian@linaro.org>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v10 20/23] target-arm/powerctl: defer cpu reset work to CPU context
In-reply-to: <CAFEAcA9YEo2+_9jc4V_aEds_tQV-f5pU+W49zUs1Ls0JOiQTLg@mail.gmail.com>
Date: Tue, 07 Feb 2017 16:52:14 +0000
Message-ID: <877f52x7sx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: LTOPEOv22rkX


Peter Maydell <peter.maydell@linaro.org> writes:

> On 6 February 2017 at 15:31, Alex Bennée <alex.bennee@linaro.org> wrote:
>> When switching a new vCPU on we want to complete a bunch of the setup
>> work before we start scheduling the vCPU thread. To do this cleanly we
>> defer vCPU setup to async work which will run the vCPUs execution
>> context as the thread is woken up. The scheduling of the work will kick
>> the vCPU awake.
>>
>> This avoids potential races in MTTCG system emulation.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <rth@twiddle.net>
>
>> @@ -77,7 +159,7 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
>>      }
>>
>>      target_cpu = ARM_CPU(target_cpu_state);
>> -    if (!target_cpu->powered_off) {
>> +    if (!atomic_mb_read(&target_cpu->powered_off)) {
>>          qemu_log_mask(LOG_GUEST_ERROR,
>>                        "[ARM]%s: CPU %" PRId64 " is already on\n",
>>                        __func__, cpuid);
>
>> +    /*
>> +     * If another CPU has powered the target on we are in the state
>> +     * ON_PENDING and additional attempts to power on the CPU should
>> +     * fail (see 6.6 Implementation CPU_ON/CPU_OFF races in the PSCI
>> +     * spec)
>> +     */
>> +    if (atomic_cmpxchg(&target_cpu->powering_on, false, true)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "[ARM]%s: CPU %" PRId64 " is already powering on\n",
>> +                      __func__, cpuid);
>> +        return QEMU_ARM_POWERCTL_ON_PENDING;
>>      }
>
> I find this too hard to reason about :-(  We store the current
> CPU state in not one but two CPU structure fields, and then
> we check and manipulate it not by doing "take lock; access
> and update; drop lock" but by doing successive atomic
> operations on the various different flags. This seems unnecessarily
> tricky, and the patch doesn't provide any documentation about
> what's going on and what the constraints are to avoid races.

I was trying to avoid changing the powered_off state to a new variable
(maybe pcsi_power_state?) because it meant I didn't have to touch the
kvm code that treated powered_off as a simple bool. However I can unify
the state into one variable if you wish.

As for locking do we have a handy per-CPU lock already or would it be
enough to use the BQL for this? Although that may be problematic as the
cpu_reset/on can come from two places (the initial realization and the
runtime switching of power state.)

>
>>
>> -    /* Start the new CPU at the requested address */
>> -    cpu_set_pc(target_cpu_state, entry);
>> +    /* To avoid racing with a CPU we are just kicking off we do the
>> +     * final bit of preparation for the work in the target CPUs
>> +     * context.
>> +     */
>> +    info = g_new(struct cpu_on_info, 1);
>> +    info->entry = entry;
>> +    info->context_id = context_id;
>> +    info->target_el = target_el;
>> +    info->target_aa64 = target_aa64;
>>
>> -    qemu_cpu_kick(target_cpu_state);
>> +    async_run_on_cpu(target_cpu_state, arm_set_cpu_on_async_work,
>> +                     RUN_ON_CPU_HOST_PTR(info));
>>
>>      /* We are good to go */
>>      return QEMU_ARM_POWERCTL_RET_SUCCESS;
>>  }
>
>> @@ -221,8 +284,9 @@ int arm_reset_cpu(uint64_t cpuid)
>>          return QEMU_ARM_POWERCTL_IS_OFF;
>>      }
>>
>> -    /* Reset the cpu */
>> -    cpu_reset(target_cpu_state);
>> +    /* Queue work to run under the target vCPUs context */
>> +    async_run_on_cpu(target_cpu_state, arm_reset_cpu_async_work,
>> +                     RUN_ON_CPU_NULL);
>
> The imx6 datasheet says that the RST bit in the SCR register
> is set by the guest to trigger a reset, and then the bit
> remains set until the reset has finished (at which point it
> self-clears). At the moment the imx6_src.c code does this:
>
>         if (EXTRACT(change_mask, CORE0_RST)) {
>             arm_reset_cpu(0);
>             clear_bit(CORE0_RST_SHIFT, &current_value);
>         }
>
> ie it assumes that arm_reset_cpu() is synchronous.

Well for this case the imx6 could queue the "clear_bit" function as
async work and then it will be correctly reported after the reset has
occurred.

>
> PS: if the code does an arm_set_cpu_on() and then
> arm_reset_cpu() do we do the two lots of async work
> in the right order?

Yes. The actual run queue is protected by a lock and run on a FIFO
basis.

>
>>      return QEMU_ARM_POWERCTL_RET_SUCCESS;
>>  }
>> diff --git a/target/arm/arm-powerctl.h b/target/arm/arm-powerctl.h
>> index 98ee04989b..04353923c0 100644
>> --- a/target/arm/arm-powerctl.h
>> +++ b/target/arm/arm-powerctl.h
>> @@ -17,6 +17,7 @@
>>  #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
>>  #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
>>  #define QEMU_ARM_POWERCTL_IS_OFF QEMU_PSCI_RET_DENIED
>> +#define QEMU_ARM_POWERCTL_ON_PENDING QEMU_PSCI_RET_ON_PENDING
>>
>>  /*
>>   * arm_get_cpu_by_id:
>> @@ -43,6 +44,7 @@ CPUState *arm_get_cpu_by_id(uint64_t cpuid);
>>   * Returns: QEMU_ARM_POWERCTL_RET_SUCCESS on success.
>>   * QEMU_ARM_POWERCTL_INVALID_PARAM if bad parameters are provided.
>>   * QEMU_ARM_POWERCTL_ALREADY_ON if the CPU was already started.
>> + * QEMU_ARM_POWERCTL_ON_PENDING if the CPU is still powering up
>>   */
>>  int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
>>                     uint32_t target_el, bool target_aa64);
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 39bff86daf..b8f82d5d20 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -582,8 +582,16 @@ struct ARMCPU {
>>
>>      /* Should CPU start in PSCI powered-off state? */
>>      bool start_powered_off;
>> -    /* CPU currently in PSCI powered-off state */
>> +    /* CPU PSCI state.
>> +     *
>> +     * For TCG these can be cross-vCPU accesses and should be done
>> +     * atomically to avoid races.
>> +     *
>> +     *  - powered_off indicates the vCPU state
>> +     *  - powering_on true if the vCPU has had a CPU_ON but not yet up
>> +     */
>>      bool powered_off;
>> +    bool powering_on;  /* PSCI ON_PENDING */
>>      /* CPU has virtualization extension */
>>      bool has_el2;
>>      /* CPU has security extension */
>> --
>> 2.11.0
>>
>
> thanks
> -- PMM


--
Alex Bennée
