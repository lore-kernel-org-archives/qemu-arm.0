Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x128sm3201912wmg.2.2018.05.02.02.47.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 May 2018 02:47:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 70DBD3E01C9;
	Wed,  2 May 2018 10:47:17 +0100 (BST)
References: <20180501180455.11214-1-richard.henderson@linaro.org> <20180501180455.11214-3-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Tidy condition in disas_simd_two_reg_misc
In-reply-to: <20180501180455.11214-3-richard.henderson@linaro.org>
Date: Wed, 02 May 2018 10:47:17 +0100
Message-ID: <878t929yoq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: GJswD3AdCorU


Richard Henderson <richard.henderson@linaro.org> writes:

> Path analysis shows that size =3D=3D 3 && !is_q has been eliminated.
>
> Fixes: Coverity CID1385853
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/translate-a64.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 97950dce1a..6d49f30b4a 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11473,7 +11473,11 @@ static void disas_simd_two_reg_misc(DisasContext=
 *s, uint32_t insn)
>          /* All 64-bit element operations can be shared with scalar 2misc=
 */
>          int pass;
>
> -        for (pass =3D 0; pass < (is_q ? 2 : 1); pass++) {
> +        /* Coverity claims (size =3D=3D 3 && !is_q) has been eliminated
> +         * from all paths leading to here.
> +         */
> +        tcg_debug_assert(is_q);
> +        for (pass =3D 0; pass < 2; pass++) {
>              TCGv_i64 tcg_op =3D tcg_temp_new_i64();
>              TCGv_i64 tcg_res =3D tcg_temp_new_i64();


--
Alex Benn=C3=A9e
