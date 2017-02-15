Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 133sm5548227wmj.27.2017.02.15.06.18.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Feb 2017 06:18:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B7AA63E00FA;
	Wed, 15 Feb 2017 14:18:05 +0000 (GMT)
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org> <1486065742-28639-9-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Michael Davidsaver <mdavidsaver@gmail.com>, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 8/9] armv7m: Simpler and faster exception start
In-reply-to: <1486065742-28639-9-git-send-email-peter.maydell@linaro.org>
Date: Wed, 15 Feb 2017 14:18:05 +0000
Message-ID: <87efyzv8pu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: NspStUCx7xAM


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> All the places in armv7m_cpu_do_interrupt() which pend an
> exception in the NVIC are doing so for synchronous
> exceptions. We know that we will always take some
> exception in this case, so we can just acknowledge it
> immediately, rather than returning and then immediately
> being called again because the NVIC has raised its outbound
> IRQ line.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: tweaked commit message; added DEBUG to the set of
> exceptions we handle immediately, since it is synchronous
> when it results from the BKPT instruction]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 78bf9ab..8bdd99c 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6071,22 +6071,22 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      case EXCP_UDEF:
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>          env->v7m.cfsr |= R_V7M_CFSR_UNDEFINSTR_MASK;
> -        return;
> +        break;
>      case EXCP_NOCP:
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
>          env->v7m.cfsr |= R_V7M_CFSR_NOCP_MASK;
> -        return;
> +        break;
>      case EXCP_SWI:
>          /* The PC already points to the next instruction.  */
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC);
> -        return;
> +        break;
>      case EXCP_PREFETCH_ABORT:
>      case EXCP_DATA_ABORT:
>          /* TODO: if we implemented the MPU registers, this is where we
>           * should set the MMFAR, etc from exception.fsr and exception.vaddress.
>           */
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
> -        return;
> +        break;
>      case EXCP_BKPT:
>          if (semihosting_enabled()) {
>              int nr;
> @@ -6101,9 +6101,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>              }
>          }
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG);
> -        return;
> +        break;
>      case EXCP_IRQ:
> -        armv7m_nvic_acknowledge_irq(env->nvic);
>          break;
>      case EXCP_EXCEPTION_EXIT:
>          do_v7m_exception_exit(env);
> @@ -6113,6 +6112,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          return; /* Never happens.  Keep compiler happy.  */
>      }
>
> +    armv7m_nvic_acknowledge_irq(env->nvic);
> +
> +    qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
> +
>      /* Align stack pointer if the guest wants that */
>      if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
>          env->regs[13] -= 4;


--
Alex Bennée
