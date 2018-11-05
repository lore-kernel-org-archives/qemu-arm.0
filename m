Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t16-v6sm14139564wrr.12.2018.11.05.08.48.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Nov 2018 08:48:40 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 827EC3E0245;
	Mon,  5 Nov 2018 16:48:39 +0000 (GMT)
References: <20181016093703.10637-1-peter.maydell@linaro.org> <20181016093703.10637-3-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Fix ATS1Hx instructions
In-reply-to: <20181016093703.10637-3-peter.maydell@linaro.org>
Date: Mon, 05 Nov 2018 16:48:39 +0000
Message-ID: <87sh0feahk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZC1aCkrpbAvF


Peter Maydell <peter.maydell@linaro.org> writes:

> ATS1HR and ATS1HW (which allow AArch32 EL2 to do address translations
> on the EL2 translation regime) were implemented in commit 14db7fe09a2c8.
> However, we got them wrong: these should do stage 1 address translations
> as defined for NS-EL2, which is ARMMMUIdx_S1E2. We were incorrectly
> making them perform stage 2 translations.
>
> A few years later in commit 1313e2d7e2cd we forgot entirely that
> we'd implemented ATS1Hx, and added a comment that ATS1Hx were
> "not supported yet". Remove the comment; there is no extra code
> needed to handle these operations in do_ats_write(), because
> arm_s1_regime_using_lpae_format() returns true for ARMMMUIdx_S1E2,
> which forces 64-bit PAR format.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index dc849b09893..903a832f1fa 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2316,7 +2316,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint=
64_t value,
>           *
>           * (Note that HCR.DC makes HCR.VM behave as if it is 1.)
>           *
> -         * ATS1Hx always uses the 64bit format (not supported yet).
> +         * ATS1Hx always uses the 64bit format.
>           */
>          format64 =3D arm_s1_regime_using_lpae_format(env, mmu_idx);
>
> @@ -2441,7 +2441,7 @@ static void ats1h_write(CPUARMState *env, const ARM=
CPRegInfo *ri,
>      MMUAccessType access_type =3D ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DA=
TA_LOAD;
>      uint64_t par64;
>
> -    par64 =3D do_ats_write(env, value, access_type, ARMMMUIdx_S2NS);
> +    par64 =3D do_ats_write(env, value, access_type, ARMMMUIdx_S1E2);
>
>      A32_BANKED_CURRENT_REG_SET(env, par, par64);
>  }


--
Alex Benn=C3=A9e
