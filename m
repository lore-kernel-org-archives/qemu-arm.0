Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r6sm27285239wmd.4.2017.01.24.08.59.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 08:59:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id AF2693E0133;
	Tue, 24 Jan 2017 16:59:52 +0000 (GMT)
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org> <1484937883-1068-7-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 6/6] armv7m: Clear FAULTMASK on return from non-NMI exceptions
In-reply-to: <1484937883-1068-7-git-send-email-peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 16:59:52 +0000
Message-ID: <87pojc9ywn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 2ZuDg5wxU7Du


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> FAULTMASK must be cleared on return from all
> exceptions other than NMI.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index dc383d1..cfbc622 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5969,8 +5969,13 @@ static void do_v7m_exception_exit(CPUARMState *env)
>      uint32_t xpsr;
>
>      type = env->regs[15];
> -    if (env->v7m.exception != 0)
> +    if (env->v7m.exception != ARMV7M_EXCP_NMI) {
> +        /* Auto-clear FAULTMASK on return from other than NMI */
> +        env->daif &= ~PSTATE_F;
> +    }
> +    if (env->v7m.exception != 0) {
>          armv7m_nvic_complete_irq(env->nvic, env->v7m.exception);
> +    }
>
>      /* Switch to the target stack.  */
>      switch_v7m_sp(env, (type & 4) != 0);

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

--
Alex Bennée
