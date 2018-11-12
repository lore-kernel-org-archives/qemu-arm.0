Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i7-v6sm13318904wrs.55.2018.11.12.03.13.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Nov 2018 03:13:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 70D143E045E;
	Mon, 12 Nov 2018 11:13:44 +0000 (GMT)
References: <20181110121711.15257-1-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-arm] [PATCH for-3.1] target/arm: Fix typo in tlbi_aa64_vmalle1_write
In-reply-to: <20181110121711.15257-1-richard.henderson@linaro.org>
Date: Mon, 12 Nov 2018 11:13:44 +0000
Message-ID: <87muqeeefr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hzMYd4Eu1Ses


Richard Henderson <richard.henderson@linaro.org> writes:

> This would cause an infinite recursion or loop.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I feel the title undersells the importance of the fix ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96301930cc..a327988c66 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3155,7 +3155,7 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *en=
v, const ARMCPRegInfo *ri,
>      CPUState *cs =3D ENV_GET_CPU(env);
>
>      if (tlb_force_broadcast(env)) {
> -        tlbi_aa64_vmalle1_write(env, NULL, value);
> +        tlbi_aa64_vmalle1is_write(env, NULL, value);
>          return;
>      }


--
Alex Benn=C3=A9e
