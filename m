Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x21sm5237479wmi.30.2020.02.25.12.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 12:32:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A2CA01FF87;
	Tue, 25 Feb 2020 20:32:46 +0000 (GMT)
References: <20200225143923.22297-1-peter.maydell@linaro.org>
User-agent: mu4e 1.3.8; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH RISU] aarch64.risu: Add patterns for v8.3-RCPC and
 v8.4-RCPC insns
In-reply-to: <20200225143923.22297-1-peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 20:32:46 +0000
Message-ID: <87v9nuxv9t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +mSntCj6R/db


Peter Maydell <peter.maydell@linaro.org> writes:

> Add patterns for the new instructions in the v8.3-RCPC and
> v8.4-RCPC extensions.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is what I used for testing the RCPC QEMU patches I sent out
> the other day. Did I get the @ section syntax here right?

Yep ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
>
>  aarch64.risu | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/aarch64.risu b/aarch64.risu
> index c4eda7a..8f08cd0 100644
> --- a/aarch64.risu
> +++ b/aarch64.risu
> @@ -3019,3 +3019,35 @@ SM3TT2B A64_V 1100 1110 010 rm:5 10 imm:2 11 rn:5 =
rd:5
>  XAR A64_V 1100 1110 100 rm:5 imm:6 rn:5 rd:5
>=20=20
>  @
> +
> +# v8.3-RCPC instructions
> +@v8_3_rcpc
> +
> +# LDAPR, LDAPRH, LDAPRB
> +# As usual, the $rn !=3D $rt constraint is risu-imposed, not architectur=
al
> +LDAPR A64 sz:2 111000 101 11111 1100 00 rn:5 rt:5 \
> +!constraints { $rn !=3D 31 && $rn !=3D $rt } \
> +!memory { align(1 << $sz); reg_plus_imm($rn, 0); }
> +
> +@
> +
> +# v8.4-RCPC instructions
> +# As usual, the $rn !=3D $rt constraint is risu-imposed, not architectur=
al
> +@v8_4_rcpc
> +STLUR A64 sz:2 011001 00 0 imm:9 00 rn:5 rt:5 \
> +!constraints { $rn !=3D 31 && $rn !=3D $rt } \
> +!memory { align(1 << $sz); reg_plus_imm($rn, $imm); }
> +
> +LDAPUR A64 sz:2 011001 01 0 imm:9 00 rn:5 rt:5 \
> +!constraints { $rn !=3D 31 && $rn !=3D $rt } \
> +!memory { align(1 << $sz); reg_plus_imm($rn, $imm); }
> +
> +LDAPURS64 A64 sz:2 011001 10 0 imm:9 00 rn:5 rt:5 \
> +!constraints { $rn !=3D 31 && $rn !=3D $rt && $sz !=3D 3 } \
> +!memory { align(1 << $sz); reg_plus_imm($rn, $imm); }
> +
> +LDAPURS32 A64 sz:2 011001 11 0 imm:9 00 rn:5 rt:5 \
> +!constraints { $rn !=3D 31 && $rn !=3D $rt && $sz < 2 } \
> +!memory { align(1 << $sz); reg_plus_imm($rn, $imm); }
> +
> +@


--=20
Alex Benn=C3=A9e
