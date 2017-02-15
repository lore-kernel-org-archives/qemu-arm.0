Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l37sm5082854wrc.41.2017.02.15.06.16.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Feb 2017 06:16:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 96FDC3E00FA;
	Wed, 15 Feb 2017 14:16:45 +0000 (GMT)
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org> <1486065742-28639-8-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Michael Davidsaver <mdavidsaver@gmail.com>, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 7/9] armv7m: Remove unused armv7m_nvic_acknowledge_irq() return value
In-reply-to: <1486065742-28639-8-git-send-email-peter.maydell@linaro.org>
Date: Wed, 15 Feb 2017 14:16:45 +0000
Message-ID: <87fujfv8s2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 01DjmHfD4Cdj


Peter Maydell <peter.maydell@linaro.org> writes:

> Having armv7m_nvic_acknowledge_irq() return the new value of
> env->v7m.exception and its one caller assign the return value
> back to env->v7m.exception is pointless. Just make the return
> type void instead.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h      | 2 +-
>  hw/intc/armv7m_nvic.c | 4 +---
>  target/arm/helper.c   | 2 +-
>  3 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ac20a56..36cccfc 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1344,7 +1344,7 @@ static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
>  }
>  #endif
>  void armv7m_nvic_set_pending(void *opaque, int irq);
> -int armv7m_nvic_acknowledge_irq(void *opaque);
> +void armv7m_nvic_acknowledge_irq(void *opaque);
>  void armv7m_nvic_complete_irq(void *opaque, int irq);
>
>  /* Interface for defining coprocessor registers.
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 2eaac3d..7b61fe6 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -394,7 +394,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq)
>  }
>
>  /* Make pending IRQ active.  */
> -int armv7m_nvic_acknowledge_irq(void *opaque)
> +void armv7m_nvic_acknowledge_irq(void *opaque)
>  {
>      NVICState *s = (NVICState *)opaque;
>      CPUARMState *env = &s->cpu->env;
> @@ -421,8 +421,6 @@ int armv7m_nvic_acknowledge_irq(void *opaque)
>      env->v7m.exception = s->vectpending;
>
>      nvic_irq_update(s);
> -
> -    return env->v7m.exception;
>  }
>
>  void armv7m_nvic_complete_irq(void *opaque, int irq)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6c86eac..78bf9ab 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6103,7 +6103,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG);
>          return;
>      case EXCP_IRQ:
> -        env->v7m.exception = armv7m_nvic_acknowledge_irq(env->nvic);
> +        armv7m_nvic_acknowledge_irq(env->nvic);
>          break;
>      case EXCP_EXCEPTION_EXIT:
>          do_v7m_exception_exit(env);


--
Alex Bennée
