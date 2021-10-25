Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp642063lfn;
        Sun, 24 Oct 2021 17:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU2kMBC5DsW/KJgiZTV7KmCDAkQb2xrwPL5Avbh8tZhhKxWwqU7/pvLZLtBrD/DExYjllb
X-Received: by 2002:a05:6830:4113:: with SMTP id w19mr10875542ott.207.1635122086821;
        Sun, 24 Oct 2021 17:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635122086; cv=none;
        d=google.com; s=arc-20160816;
        b=N0/X1NVLVmTLxGqcPP28oqgysxmmF9yX+FocRG6Qa068G97rsCSPimQFtCdIHH9Pu2
         j7lkHXGjG2lTX3AQS6VaSngili3t5WegLgQwFf6qQQ2zzYCZ9FbK5xocXO86rXYYCf43
         7yrTNHDrlRA712ZUMQBsZZA/n2UJUybATtmooRha+m6fKXlTwpW3tEmZnCXiHSlvQ4c6
         OgAfZyTDQ9Qmv8gQi3HG5kmHO7frVFtrl20kgwQqyvzVhLv02FKdxRRfaGxhZbOd2sGi
         J/4wcOFOSyyXr07Ac5TPAM/dM1USl76MPaFDeLwU/qwfBEaIr3OJc69JK4J2t822x1YR
         VOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=b9MgtRTrQrNvDDjR7v3rJw2ZPN3Bm+NZfobG/ELsJPc=;
        b=Z3dtcnTO8aW82OXp63D7UBf4vvfJFor1UH+vY9O8FUJ6XiPltpIWNcqV54PZl4RCBF
         vfc87/uVrnNbhd1CaxtvSyPut28V8YsEed1rpYGisKT4JVh/h1Wfe+oTnB7vLTHSDOD1
         xf4tSCT0lNcM0grbvh3xI6CjxwndLxDr30HuYdCEdwhFvzu9zs5dRZhKTYUf4Bn6NUqW
         yGVxE9vWzC09wdbA7eKr45oseQY1EuahAfHdiVQQX2zgUD3M5MsfCsu6bDzmbpa6V40L
         1ebrkVhqlNDul2wVR1kCS9f3xyIo5gcaCMipRbJR3HVcnDmy+ox5MovOOldK4Ch9Yc/q
         a1fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=MPKp0oNM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v187si16976005oib.247.2021.10.24.17.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Oct 2021 17:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=MPKp0oNM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1menwr-0005AJ-M7
	for alex.bennee@linaro.org; Sun, 24 Oct 2021 20:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1menvz-00059l-8W; Sun, 24 Oct 2021 20:33:52 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1menvw-0008P2-2E; Sun, 24 Oct 2021 20:33:50 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Hcwt665HPz4xbM; Mon, 25 Oct 2021 11:33:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1635122014;
 bh=b9MgtRTrQrNvDDjR7v3rJw2ZPN3Bm+NZfobG/ELsJPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MPKp0oNM9Cf0LiLOajxxkgv3wPL8fYd8fr+zGM8Lw32lAvYxoSuPoxe6ALgDROAnL
 E/P18CuKtfKGemlltevLpRzWCQtScWC10FLZMHWT4l/D2czokakRFdEPT8cxTwNq0a
 YcqHLaWn8qHg1pCjJyZtwWwyzUJuANS9QOG+LmyI=
Date: Mon, 25 Oct 2021 11:21:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/4] target/ppc: Use tcg_constant_tl() in gen_op_cmp()
Message-ID: <YXX4cgZ6nHzRj4Br@yekko>
References: <20211024161619.325903-1-f4bug@amsat.org>
 <20211024161619.325903-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XmnCEcH7312jy7Iy"
Content-Disposition: inline
In-Reply-To: <20211024161619.325903-4-f4bug@amsat.org>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LaeDpDdH8vYe


--XmnCEcH7312jy7Iy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 24, 2021 at 06:16:18PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Avoid using a TCG temporary by moving the compared values
> to the constant pool.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/translate.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 518337bcb7f..507f6699f47 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1430,23 +1430,20 @@ static opc_handler_t invalid_handler =3D {
>  static inline void gen_op_cmp(TCGv arg0, TCGv arg1, int s, int crf)
>  {
>      TCGv t0 =3D tcg_temp_new();
> -    TCGv t1 =3D tcg_temp_new();
>      TCGv_i32 t =3D tcg_temp_new_i32();
> =20
> -    tcg_gen_movi_tl(t0, CRF_EQ);
> -    tcg_gen_movi_tl(t1, CRF_LT);
>      tcg_gen_movcond_tl((s ? TCG_COND_LT : TCG_COND_LTU),
> -                       t0, arg0, arg1, t1, t0);
> -    tcg_gen_movi_tl(t1, CRF_GT);
> +                       t0, arg0, arg1,
> +                       tcg_constant_tl(CRF_LT), tcg_constant_tl(CRF_EQ));
>      tcg_gen_movcond_tl((s ? TCG_COND_GT : TCG_COND_GTU),
> -                       t0, arg0, arg1, t1, t0);
> +                       t0, arg0, arg1,
> +                       tcg_constant_tl(CRF_GT), t0);
> =20
>      tcg_gen_trunc_tl_i32(t, t0);
>      tcg_gen_trunc_tl_i32(cpu_crf[crf], cpu_so);
>      tcg_gen_or_i32(cpu_crf[crf], cpu_crf[crf], t);
> =20
>      tcg_temp_free(t0);
> -    tcg_temp_free(t1);
>      tcg_temp_free_i32(t);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XmnCEcH7312jy7Iy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmF1+HIACgkQbDjKyiDZ
s5JIPxAAzvdB2EyIosgQP7WZXEsnVFVPleMqaCBxhFOHdkUpWt0C0lHit6MHbVBa
xOODwAsJgU8ygwIYQZqfUwah5cA5NI9EXFFAb9J8709SNmBORlJOb6eu9s0q3ZH7
LYxi42xr/iqXnaavTZjnT8D02+EP31T8o+ZW9aHenTpgHkSsRO+nP2OIM3totm14
YyEKDCg6acX4ggBN211CUd3AsLnwypeLrfVuk67xAhjitBXt62fZqdfkb1pLDpp1
zkjENBWC+ogq1huzlkomt0dxkP/m8U/Z3+v1GqyfviWtQQTWpIzX6y17W/eB3ObG
u/AiU94dV3Bj7FfChHPw7p5SQTHt5V64uFByppS20EPqD9lOaYUkd4oTt4fFgHsi
wPWyt04gHYLuc8w8x6OWk0DgZB+7Q9kKxwU7MtHUGXqqwmacEMtxu53z5XOhCw69
yh6fw164NsOnZbjC1B/yIIX0dinzg6YgK7jcFD4khNiLro1DY8nRu3lCLr5bqoCE
DyoO9WttClzGl3f+uUYZWzNC85onO+Z8ZHw+5tCLGCuFl8siJc+QvoBHm6LdXF1/
y+O6Yu23TuimEdyEpxL1/t5lvuCicGhUIqVnisRLPqLFvd4/LKYKtewX2SD8ANMm
HjO6vJgdDcIUY8QpB98cpe76xK+qm0K27U/kvpW9CPzkmPw/XlI=
=oOSh
-----END PGP SIGNATURE-----

--XmnCEcH7312jy7Iy--
