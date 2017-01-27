Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d14sm3930266wmd.19.2017.01.27.05.44.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 05:44:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3C62D3E008E;
	Fri, 27 Jan 2017 13:44:12 +0000 (GMT)
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org> <1485285380-10565-7-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 06/10] armv7m: set CFSR.UNDEFINSTR on undefined instructions
In-reply-to: <1485285380-10565-7-git-send-email-peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 13:44:12 +0000
Message-ID: <8760l0aa8j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: oBrU8R4bwuQJ


Peter Maydell <peter.maydell@linaro.org> writes:

> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> When we take an exception for an undefined instruction, set the
> appropriate CFSR bit.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> [PMM: tweaked commit message, comment]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7dc30f5..e6b1c36 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6072,6 +6072,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>      switch (cs->exception_index) {
>      case EXCP_UDEF:
>          armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
> +        env->v7m.cfsr |= R_V7M_CFSR_UNDEFINSTR_MASK;
>          return;
>      case EXCP_SWI:
>          /* The PC already points to the next instruction.  */


--
Alex Bennée
