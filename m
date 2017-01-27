Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h3sm8081600wrb.31.2017.01.27.05.58.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 05:58:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 8CA173E0342;
	Fri, 27 Jan 2017 13:58:01 +0000 (GMT)
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org> <1485285380-10565-11-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 10/10] armv7m: R14 should reset to 0xffffffff
In-reply-to: <1485285380-10565-11-git-send-email-peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 13:58:01 +0000
Message-ID: <87ziic8v12.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: SaCW1RuF3E3Q


Peter Maydell <peter.maydell@linaro.org> writes:

> For M profile (unlike A profile) the reset value of R14 is specified
> as 0xffffffff.  (The rationale is that this is an illegal exception
> return value, so if guest code tries to return to it it will result
> in a helpful exception.)
>
> Registers r0 to r12 and the flags are architecturally UNKNOWN on
> reset, so we leave those at zero.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 0814f73..e9f10f7 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -196,6 +196,9 @@ static void arm_cpu_reset(CPUState *s)
>           */
>          env->v7m.ccr = R_V7M_CCR_STKALIGN_MASK;
>
> +        /* Unlike A/R profile, M profile defines the reset LR value */
> +        env->regs[14] = 0xffffffff;
> +
>          /* Load the initial SP and PC from the vector table at address 0 */
>          rom = rom_ptr(0);
>          if (rom) {


--
Alex Bennée
