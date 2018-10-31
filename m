Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r198-v6sm1851159wmg.0.2018.10.31.03.47.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Oct 2018 03:47:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 39B8A3E0520;
	Wed, 31 Oct 2018 10:47:41 +0000 (GMT)
References: <20181030162517.21816-1-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH for-3.1] target/arm: Remove can't-happen if() from handle_vec_simd_shli()
In-reply-to: <20181030162517.21816-1-peter.maydell@linaro.org>
Date: Wed, 31 Oct 2018 10:47:41 +0000
Message-ID: <87o9ba8kaa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: VIXsA2oxHrIh


Peter Maydell <peter.maydell@linaro.org> writes:

> In handle_vec_simd_shli() we have a check:
>      if (size > 3 && !is_q) {
>          unallocated_encoding(s);
>          return;
>      }
> However this can never be true, because we calculate
>     int size =3D 32 - clz32(immh) - 1;
> where immh is a 4 bit field which we know cannot be all-zeroes.
> So the clz32() return must be in {28,29,30,31} and the resulting
> size is in {0,1,2,3}, and "size > 3" is never true.
>
> This unnecessary code confuses Coverity's analysis:
> in CID 1396476 it thinks we might later index off the
> end of an array because the condition implies that we
> might have a size > 3.
>
> Remove the code, and instead assert that the size is in [0..3],
> since the decode that enforces that is somewhat distant from
> this function.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Alex, if you could run this through the risu testset just as
> a sanity check that would be very helpful.
>
>  target/arm/translate-a64.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 88195ab9490..fd36425f1ae 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -9483,12 +9483,10 @@ static void handle_vec_simd_shli(DisasContext *s,=
 bool is_q, bool insert,
>      int immhb =3D immh << 3 | immb;
>      int shift =3D immhb - (8 << size);
>
> -    if (extract32(immh, 3, 1) && !is_q) {
> -        unallocated_encoding(s);
> -        return;
> -    }
> +    /* Range of size is limited by decode: immh is a non-zero 4 bit fiel=
d */
> +    assert(size >=3D 0 && size <=3D 3);
>
> -    if (size > 3 && !is_q) {
> +    if (extract32(immh, 3, 1) && !is_q) {
>          unallocated_encoding(s);
>          return;
>      }

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--
Alex Benn=C3=A9e
