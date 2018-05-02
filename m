Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k79sm14984515wmg.39.2018.05.02.02.46.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 May 2018 02:46:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D9BDD3E01C9;
	Wed,  2 May 2018 10:46:47 +0100 (BST)
References: <20180501180455.11214-1-richard.henderson@linaro.org> <20180501180455.11214-2-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: Tidy conditions in handle_vec_simd_shri
In-reply-to: <20180501180455.11214-2-richard.henderson@linaro.org>
Date: Wed, 02 May 2018 10:46:47 +0100
Message-ID: <87a7ti9ypk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2Nj3V313BpIh


Richard Henderson <richard.henderson@linaro.org> writes:

> The (size > 3 && !is_q) condition is identical to the preceeding test
> of bit 3 in immh; eliminate it.  For the benefit of Coverity, assert
> that size is within the bounds we expect.
>
> Fixes: Coverity CID1385846
> Fixes: Coverity CID1385849
> Fixes: Coverity CID1385852
> Fixes: Coverity CID1385857
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/translate-a64.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index bff4e13bf6..97950dce1a 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -9019,11 +9019,7 @@ static void handle_vec_simd_shri(DisasContext *s, =
bool is_q, bool is_u,
>          unallocated_encoding(s);
>          return;
>      }
> -
> -    if (size > 3 && !is_q) {
> -        unallocated_encoding(s);
> -        return;
> -    }
> +    tcg_debug_assert(size <=3D 3);
>
>      if (!fp_access_check(s)) {
>          return;


--
Alex Benn=C3=A9e
