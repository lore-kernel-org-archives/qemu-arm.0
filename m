Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y1sm26951153wme.15.2017.01.24.08.43.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 08:43:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 423DB3E0133;
	Tue, 24 Jan 2017 16:43:22 +0000 (GMT)
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org> <1484937883-1068-4-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 3/6] armv7m: Explicit error for bad vector table
In-reply-to: <1484937883-1068-4-git-send-email-peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 16:43:22 +0000
Message-ID: <87tw8o9zo5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: rqkRjEpvzYlS


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> Give an explicit error and abort when a load
> from the vector table fails. Architecturally this
> should HardFault (which will then immediately
> fail to load the HardFault vector and go into Lockup).
> Since we don't model Lockup, just report this guest
> error via cpu_abort(). This is more helpful than the
> previous behaviour of reading a zero, which is the
> address of the reset stack pointer and not a sensible
> location to jump to.

Word wrap has gone a little aggressive in the commit message ;-)

>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> [PMM: expanded commit message]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ad23de3..8edb08c 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6014,6 +6014,30 @@ static void arm_log_exception(int idx)
>      }
>  }
>
> +static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
> +
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
>  void arm_v7m_cpu_do_interrupt(CPUState *cs)
>  {
>      ARMCPU *cpu = ARM_CPU(cs);
> @@ -6095,7 +6119,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      /* Clear IT bits */
>      env->condexec_bits = 0;
>      env->regs[14] = lr;
> -    addr = ldl_phys(cs->as, env->v7m.vecbase + env->v7m.exception * 4);
> +    addr = arm_v7m_load_vector(cpu);
>      env->regs[15] = addr & 0xfffffffe;
>      env->thumb = addr & 1;
>  }

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
