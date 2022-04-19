Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id vw17-20020a170907059100b006e8732d1944sm5522828ejb.5.2022.04.19.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 04:15:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 27F451FFB7;
	Tue, 19 Apr 2022 12:15:12 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-4-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 03/60] target/arm: Update SCR_EL3 bits to ARMv8.8
Date: Tue, 19 Apr 2022 12:14:35 +0100
In-reply-to: <20220417174426.711829-4-richard.henderson@linaro.org>
Message-ID: <87y201wchr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: q/UKVHtExRnC


Richard Henderson <richard.henderson@linaro.org> writes:

> Update SCR_EL3 fields per ARM DDI0487 H.a.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Aside: I notice you have added FEAT_foo comments to the SCTLR bits next,
it might be worth at least flagging the FEAT_RME ones here.

> ---
>  target/arm/cpu.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9a29a4a215..f843c62c83 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1544,6 +1544,18 @@ static inline void xpsr_write(CPUARMState *env, ui=
nt32_t val, uint32_t mask)
>  #define SCR_FIEN              (1U << 21)
>  #define SCR_ENSCXT            (1U << 25)
>  #define SCR_ATA               (1U << 26)
> +#define SCR_FGTEN             (1U << 27)
> +#define SCR_ECVEN             (1U << 28)
> +#define SCR_TWEDEN            (1U << 29)
> +#define SCR_TWEDEL            MAKE_64BIT_MASK(30, 4)
> +#define SCR_TME               (1ULL << 34)
> +#define SCR_AMVOFFEN          (1ULL << 35)
> +#define SCR_ENAS0             (1ULL << 36)
> +#define SCR_ADEN              (1ULL << 37)
> +#define SCR_HXEN              (1ULL << 38)
> +#define SCR_TRNDR             (1ULL << 40)
> +#define SCR_ENTP2             (1ULL << 41)
> +#define SCR_GPF               (1ULL << 48)
>=20=20
>  #define HSTR_TTEE (1 << 16)
>  #define HSTR_TJDBX (1 << 17)


--=20
Alex Benn=C3=A9e
