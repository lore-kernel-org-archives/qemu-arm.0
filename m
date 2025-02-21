Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbe1e8aa51sm486409466b.149.2025.02.21.10.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 10:02:24 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4D4B35F8C8;
	Fri, 21 Feb 2025 18:02:23 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH v3 3/9] target/arm: Make CNTPS_* UNDEF from Secure EL1
 when Secure EL2 is enabled
In-Reply-To: <20250204125009.2281315-4-peter.maydell@linaro.org> (Peter
	Maydell's message of "Tue, 4 Feb 2025 12:50:03 +0000")
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
	<20250204125009.2281315-4-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Feb 2025 18:02:23 +0000
Message-ID: <87wmdjgor4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nHCl8ChOr91o

Peter Maydell <peter.maydell@linaro.org> writes:

> When we added Secure EL2 support, we missed that this needs an update
> to the access code for the EL3 physical timer registers.  These are
> supposed to UNDEF from Secure EL1 when Secure EL2 is enabled.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ac8cb428925..7ec1e6cfaab 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2387,6 +2387,9 @@ static CPAccessResult gt_stimer_access(CPUARMState =
*env,
>          if (!arm_is_secure(env)) {
>              return CP_ACCESS_UNDEFINED;
>          }

Hmm this failed to apply as b4d3978c2f (target-arm: Add the AArch64 view
of the Secure physical timer) has the above as CP_ACCESS_TRAP. I guess
because I didn't apply 20250130182309.717346-1-peter.maydell@linaro.org.
I guess this needs fixing up for stable.


> +        if (arm_is_el2_enabled(env)) {
> +            return CP_ACCESS_UNDEFINED;
> +        }
>          if (!(env->cp15.scr_el3 & SCR_ST)) {
>              return CP_ACCESS_TRAP_EL3;
>          }


Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
