Received: by 10.28.71.27 with SMTP id u27csp519448wma;
        Wed, 24 Jan 2018 03:47:11 -0800 (PST)
X-Google-Smtp-Source: AH8x226n+fh2hjvHQOzYXZZS7d6/NN2UpvwHKt+wCguaqPgJt6VlWnSlN3urjKeR7RKzh/5s2Xgk
X-Received: by 10.129.123.195 with SMTP id w186mr5184721ywc.425.1516794431791;
        Wed, 24 Jan 2018 03:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516794431; cv=none;
        d=google.com; s=arc-20160816;
        b=W/fqi3HH9sWaxxcuKQjr8RvQuBirz38/CjoLpbvHmxjnd8gV/lBISQSEXQM8FeyPeN
         nshFT3IcpE8wMUhlfp0Xsp/AM6sNBvFz5gbFre2FIX7jZeaO3/pd4CekvaikmNRZFZf8
         T9uLlW1nzWBrBQtVLfmYyUonvzxh5nA1jnRD7kSuVz7aXF2WGw5/1zg1jTmapW5u2vKj
         u3NwGPWSy9mu/+ZzG0CWdJdN4ukUvNkHeCr8T211uZtYhV98I6aWlRaEz1QAXS+YmhsH
         wWgr9z4F5HKCm/gNMNPKZvvaOY83g3x1aZ3tw/hu6YKri+QDk8lxbmR60JuTmSlE85gm
         tazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=VbVl3L09/j8KT8p0Unzem9abF+TlTp1fj7ug02uOs4Y=;
        b=pTwGJ5gg0vb0d8IMOL/pdZ7jwaVq+UAJvoB73KrwtjrHUMsmJlXThhcAzzcUxWBBun
         fblSu5MMDIi0LyQqNU+Ym/+mrlYOEOjpkP/z/mzrVXmP8XW0YF0GxZQKcVvusokFVUj0
         7LacP+zOxH5M6uyImv+i1mH+j2+fu0+Mh02bPrUx96uTorqbuLJ19AKCl36qY9dwFVf7
         BXbDR9AJ/SAKXKKhs4Dd6s2SER7qa9J/xuaVZ5CBjkwFjJdu3KowHfJm5BrLgovQmOYh
         9jPXqzqU5P+sfiJTdY+l+vK/xTEPRm1Sd1wadQApjD0As3bOHJBQ5Sp1wTNfaq4XMpAt
         Estg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X2jRCuhZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g70si17135ywb.156.2018.01.24.03.47.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 03:47:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X2jRCuhZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43688 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeJWJ-0004di-5o
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 06:47:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eeJW6-0004b5-1R
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 06:46:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eeJW2-00023d-Sz
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 06:46:58 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:38597)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eeJW2-00023H-NH; Wed, 24 Jan 2018 06:46:54 -0500
Received: by mail-qt0-x244.google.com with SMTP id z10so9495970qti.5;
	Wed, 24 Jan 2018 03:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=VbVl3L09/j8KT8p0Unzem9abF+TlTp1fj7ug02uOs4Y=;
	b=X2jRCuhZeW++6SMat/HXChzFG/jTrZG06GnQ0dGOlfzc58dJNQ0K7IGVOtdUamkGN6
	RQBQvntKLWXNPr/rWWviV0JCuJ0MP5D14PbczCyhtlAEhICuAFBiTqbJftCJ7FKIBhpe
	fhcZXm0QmCSKT7BfD8F01dI97Ev4b+Ulw5G0lmmYjoWMVGBTpp7szyzFpvv9SKv+4u4k
	JjvVIuGoKj4PEJxMSkCNJdgxlxBDxnz0Il3GCTXQl/swcQQ0G9xLbuOhDM6PAVb4RYIs
	61Gzx1atcdyxtLJsfdiNxh5T/Oz7DKsOZPdXI+1qNomxB3/mm86TYd+pm5gtB3MjW2tV
	5etA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=VbVl3L09/j8KT8p0Unzem9abF+TlTp1fj7ug02uOs4Y=;
	b=jI0ZDKkw/cvVszaL7bQBwkcKcCaIuxmWqYhLOi5JdbAedPYKmkk6pSKoXjfWjG0JMz
	fDpmcLG/TlYsn+JYANS8FmYeOSChxEKe4kLCIKYGeQXPVW1eUsW6ZVXrQioma8/RnAXt
	eguQrkc87k2uGwz8xLU3tN4TFkko346dmragWbPPVHqFmedV8Lg3GQ3OoK+XAsEkg71S
	qrrUUkvCg0uDfNUxivkjgUOFpksdjnDZG9Ft9nIDy0ZYmizYv/gE27I2P/n2utiCmGpA
	mSUeNFfZg2ls2j0lwSLcAsY73y0UpC+BXvPbXAF0pwrZd6WFBGMJalQTViQr/rO+JIqG
	LHtg==
X-Gm-Message-State: AKwxytcgVVn7pBehMU9gpGWbkCTrSSqQspXogVDf0Db5ikUY7/4LMvJe
	QLyqdQLLp0rc+lMMZzVGkBE=
X-Received: by 10.200.50.41 with SMTP id x38mr8671312qta.221.1516794413870;
	Wed, 24 Jan 2018 03:46:53 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id a125sm79557qkg.79.2018.01.24.03.46.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jan 2018 03:46:53 -0800 (PST)
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
	Laurent Vivier <laurent@vivier.eu>
References: <20180124101358.GA5028@bogon.m.sigxcpu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <73ef36b3-8fc3-0115-3ce6-7a632ae27127@amsat.org>
Date: Wed, 24 Jan 2018 08:46:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180124101358.GA5028@bogon.m.sigxcpu.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="3fwCpU1hKONuIHidrWlU4iUthzPNAFb8L"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH] linux-user: Fix register used for 6th and
 7th syscall argument on aarch64
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kv+psw4misiU

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3fwCpU1hKONuIHidrWlU4iUthzPNAFb8L
Content-Type: multipart/mixed; boundary="GH9EZWf1t5hwHFogguvnYeffFQlbFrsMG";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73ef36b3-8fc3-0115-3ce6-7a632ae27127@amsat.org>
Subject: Re: [PATCH] linux-user: Fix register used for 6th and 7th syscall
 argument on aarch64
References: <20180124101358.GA5028@bogon.m.sigxcpu.org>
In-Reply-To: <20180124101358.GA5028@bogon.m.sigxcpu.org>

--GH9EZWf1t5hwHFogguvnYeffFQlbFrsMG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I spent the night studying linux-user end figured out the same correct
fix. Just checking morning ML before sending the patch :)

Mine had "Suggested-by: Laurent Vivier <laurent@vivier.eu>" since he
said on IRC "gdb will help" and indeed single stepping before the
syscall the bug was obvious.

On 01/24/2018 07:13 AM, Guido G=C3=BCnther wrote:
> Unbreaks the testcase from
>=20
>     http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html=

>=20
> Thanks to Laurent Vivier for spotting the 7th one.
> Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  linux-user/host/aarch64/safe-syscall.inc.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/ho=
st/aarch64/safe-syscall.inc.S
> index 58a2329b37..bc1f5a9792 100644
> --- a/linux-user/host/aarch64/safe-syscall.inc.S
> +++ b/linux-user/host/aarch64/safe-syscall.inc.S
> @@ -36,7 +36,7 @@ safe_syscall_base:
>  	 *               and return the result in x0
>  	 * and the syscall instruction needs
>  	 *               x8 =3D=3D syscall number
> -	 *               x0 ... x7 =3D=3D syscall arguments
> +	 *               x0 ... x6 =3D=3D syscall arguments
>  	 *               and returns the result in x0
>  	 * Shuffle everything around appropriately.
>  	 */
> @@ -47,8 +47,8 @@ safe_syscall_base:
>  	mov	x2, x4
>  	mov	x3, x5
>  	mov	x4, x6
> -	mov	x6, x7
> -	ldr	x7, [sp]
> +	mov	x5, x7
> +	ldr	x6, [sp]
> =20
>  	/* This next sequence of code works in conjunction with the
>  	 * rewind_if_safe_syscall_function(). If a signal is taken
>=20


--GH9EZWf1t5hwHFogguvnYeffFQlbFrsMG--

--3fwCpU1hKONuIHidrWlU4iUthzPNAFb8L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlpocicACgkQ4+MsLN6t
wN6hmhAAm0yyxZhorU/uwioYzlfpw2ZIHS/2RevpiQeSe4yLFlumvAfA20RMAAZ3
MxxSOCdUkXWXrP/aKQSYBCo/Wru4bhVX9bJHiw8EBj0KkrTqAR4D5C6ngS0vb+2z
BegUDz1PhBaLIuFojZ09odGJla90kjrfpkOfYja6lde2DiaYGR/MPMwX+IUT1q9c
ixwbGC3xJKGWs5WJP7ldpMTDbNALuUmo0Z2iOjLcsVAvkPdM2oSL2ER93Hvb3Zfx
h1b5067Y8C/3cxJZEOilKq211EilzQmlPkJTfoFP9+tkDjJvYbW2P2yFDmMGzWNT
t3hXrvLRO5P5/7gVVq3BiwU/zHCFzImNP1hqGFozZBJS1LrQlmbympWKjOLGnHSg
YjPT1bAFWWzd8B9CiScXeyPzcBFOIPgmFprvTKVWCmUkShEBLLsU10Gf/CP70Y40
Rk7vgwzczmM266L1EqN9Z3Uq0yLtREwCXAO5ykvaXmduwSnAJaLPfugLyESHmgz4
WqP7Eq/JBPY8kkl4HmK1adKPGasbYzaOVjo5Ec1KTeeohGRhIyZChxYdkZcoYSvG
XE1gjBkpSE3+MJGLhX3ZP0ydk1YASd2EDl1NR12WFi7BCnWJ1P3BeS1nQrC0F+v4
2fa6aFv112P6v72xdLCDpcCHwnzgWNN0SOztrJtMJ+AT3q5gSys=
=IKBM
-----END PGP SIGNATURE-----

--3fwCpU1hKONuIHidrWlU4iUthzPNAFb8L--
