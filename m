Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o9-v6sm49863755wra.42.2018.11.05.08.24.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Nov 2018 08:24:11 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 6F0D93E0245;
	Mon,  5 Nov 2018 16:24:10 +0000 (GMT)
References: <20181016093703.10637-1-peter.maydell@linaro.org> <20181016093703.10637-2-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: Set S and PTW in 64-bit PAR format
In-reply-to: <20181016093703.10637-2-peter.maydell@linaro.org>
Date: Mon, 05 Nov 2018 16:24:10 +0000
Message-ID: <87tvkvebmd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: EdEvzBItI/kg


Peter Maydell <peter.maydell@linaro.org> writes:

> In do_ats_write() we construct a PAR value based on the result
> of the translation.  A comment says "S2WLK and FSTAGE are always
> zero, because we don't implement virtualization".
> Since we do in fact now implement virtualization, add the missing
> code that sets these bits based on the reported ARMMMUFaultInfo.
>
> (These bits are named PTW and S in ARMv8, so we follow that
> convention in the new comments in this patch.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 43afdd082e1..dc849b09893 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2344,10 +2344,12 @@ static uint64_t do_ats_write(CPUARMState *env, ui=
nt64_t value,
>
>              par64 |=3D 1; /* F */

To aid readability, mainly for those not familiar like me, maybe:

  par64 |=3D 1; /* PAR_EL1.F =3D=3D 1, failed translation */

>              par64 |=3D (fsr & 0x3f) << 1; /* FS */
> -            /* Note that S2WLK and FSTAGE are always zero, because we do=
n't
> -             * implement virtualization and therefore there can't be a s=
tage 2
> -             * fault.
> -             */
> +            if (fi.stage2) {
> +                par64 |=3D (1 << 9); /* S */
> +            }
> +            if (fi.s1ptw) {
> +                par64 |=3D (1 << 8); /* PTW */
> +            }
>          }
>      } else {
>          /* fsr is a DFSR/IFSR value for the short descriptor

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--
Alex Benn=C3=A9e
