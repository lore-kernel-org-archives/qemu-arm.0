Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h14sm3430954wrs.66.2019.07.03.09.44.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 09:44:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ADD6A1FF87;
	Wed,  3 Jul 2019 17:44:18 +0100 (BST)
References: <20190703155244.28166-1-alex.bennee@linaro.org> <20190703155244.28166-5-alex.bennee@linaro.org> <2c0b9e7f-f4d1-b52b-1f3a-4100bf50c151@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v1 4/4] target/arm: remove run time semihosting checks
In-reply-to: <2c0b9e7f-f4d1-b52b-1f3a-4100bf50c151@redhat.com>
Date: Wed, 03 Jul 2019 17:44:18 +0100
Message-ID: <87lfxfvzj1.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: E9oEaWZv/c9B


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Alex, Peter.
>
> On 7/3/19 5:52 PM, Alex Benn=C3=A9e wrote:
>> Now we do all our checking and use a common EXCP_SEMIHOST for
>> semihosting operations we can make helper code a lot simpler.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  target/arm/helper.c | 84 +++++++++------------------------------------
>>  1 file changed, 17 insertions(+), 67 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index ad29dc4072..5c1f741380 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -10364,83 +10364,33 @@ static void arm_cpu_do_interrupt_aarch64(CPUSt=
ate *cs)
>>                    new_el, env->pc, pstate_read(env));
>>  }
>>
>> -static inline bool check_for_semihosting(CPUState *cs)
>> +/*
>> + * Check whether this exception is a semihosting call; if so
>> + * then handle it and return true; otherwise return false.
>> + *
>> + * All the permission and validity checks are done at translate time.
>> + */
>> +static inline bool handle_semihosting(CPUState *cs)
>>  {
>> -    /* Check whether this exception is a semihosting call; if so
>> -     * then handle it and return true; otherwise return false.
>> -     */
>>      ARMCPU *cpu =3D ARM_CPU(cs);
>>      CPUARMState *env =3D &cpu->env;
>>
>> -    if (is_a64(env)) {
>> -        if (cs->exception_index =3D=3D EXCP_SEMIHOST) {
>> -            /* This is always the 64-bit semihosting exception.
>> -             * The "is this usermode" and "is semihosting enabled"
>> -             * checks have been done at translate time.
>> -             */
>> +    if (cs->exception_index =3D=3D EXCP_SEMIHOST) {
>> +        if (is_a64(env)) {
>>              qemu_log_mask(CPU_LOG_INT,
>>                            "...handling as semihosting call 0x%" PRIx64 =
"\n",
>>                            env->xregs[0]);
>>              env->xregs[0] =3D do_arm_semihosting(env);
>> -            return true;
>> -        }
>> -        return false;
>> -    } else {
>> -        uint32_t imm;
>> -
>> -        /* Only intercept calls from privileged modes, to provide some
>> -         * semblance of security.
>> -         */
>> -        if (cs->exception_index !=3D EXCP_SEMIHOST &&
>> -            (!semihosting_enabled() ||
>> -             ((env->uncached_cpsr & CPSR_M) =3D=3D ARM_CPU_MODE_USR))) {
>> -            return false;
>> -        }
>> -
>> -        switch (cs->exception_index) {
>> -        case EXCP_SEMIHOST:
>> -            /* This is always a semihosting call; the "is this usermode"
>> -             * and "is semihosting enabled" checks have been done at
>> -             * translate time.
>> -             */
>> -            break;
>> -        case EXCP_SWI:
>> -            /* Check for semihosting interrupt.  */
>> -            if (env->thumb) {
>> -                imm =3D arm_lduw_code(env, env->regs[15] - 2, arm_sctlr=
_b(env))
>> -                    & 0xff;
>> -                if (imm =3D=3D 0xab) {
>> -                    break;
>> -                }
>> -            } else {
>> -                imm =3D arm_ldl_code(env, env->regs[15] - 4, arm_sctlr_=
b(env))
>> -                    & 0xffffff;
>> -                if (imm =3D=3D 0x123456) {
>> -                    break;
>> -                }
>> -            }
>> -            return false;
>> -        case EXCP_BKPT:
>> -            /* See if this is a semihosting syscall.  */
>> -            if (env->thumb) {
>> -                imm =3D arm_lduw_code(env, env->regs[15], arm_sctlr_b(e=
nv))
>> -                    & 0xff;
>> -                if (imm =3D=3D 0xab) {
>> -                    env->regs[15] +=3D 2;
>> -                    break;
>> -                }
>> -            }
>> -            return false;
>> -        default:
>> -            return false;
>> +        } else {
>> +            qemu_log_mask(CPU_LOG_INT,
>> +                          "...handling as semihosting call 0x%x\n",
>> +                          env->regs[0]);
>> +            env->regs[0] =3D do_arm_semihosting(env);
>>          }
>> -
>> -        qemu_log_mask(CPU_LOG_INT,
>> -                      "...handling as semihosting call 0x%x\n",
>> -                      env->regs[0]);
>> -        env->regs[0] =3D do_arm_semihosting(env);
>>          return true;
>>      }
>> +
>> +    return false;
>>  }
>>
>>  /* Handle a CPU exception for A and R profile CPUs.
>> @@ -10476,7 +10426,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>>       * code that caused the exception, not the target exception level,
>>       * so must be handled here.
>>       */
>> -    if (check_for_semihosting(cs)) {
>> +    if (handle_semihosting(cs)) {
>>          return;
>>      }
>>
>>
>
> This patch clashes with this one:
> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00343.html
> that Peter already queued:
> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00692.html
>
> Peter, if you want this for 4.1, it might be easier to dequeue "Restrict
> semi-hosting to TCG", apply Alex series, and re-apply "Restrict
> semi-hosting to TCG", the conflicts should be trivial (function name
> changed check_for_semihosting -> handle_semihosting).

This isn't 4.1 material - unless I can figure out the weird single-step
while semihosting bug.

>
> Thanks,
>
> Phil.


--
Alex Benn=C3=A9e
