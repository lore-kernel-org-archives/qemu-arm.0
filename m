Received: by 10.28.71.27 with SMTP id u27csp5389364wma;
        Tue, 27 Feb 2018 15:38:31 -0800 (PST)
X-Google-Smtp-Source: AG47ELucF7ZY2GhseY4ymWcbJghTGrjBuSR18vUYjF4B60utXaErfe9srqZEBm53nu+oRHfQuY9W
X-Received: by 2002:a25:9090:: with SMTP id t16-v6mr10896023ybl.105.1519774711199;
        Tue, 27 Feb 2018 15:38:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519774711; cv=none;
        d=google.com; s=arc-20160816;
        b=qTVFHYLUBSMGci4O+kWTNIyTxrU6KIioljPQ8fLKUev6rIDkZEkA7hCsUHOBKWKBj8
         A0fqRPPdW7PAzksVH21VxrVmlfulHm5ZTLdOtNltdLuy5h39D/EhujRszrXsCvDoTXWi
         DCG2rD1Zh/cuoI8Ckhn+rqqtNjq8Zgd9fJ1lreEApSFgb2fJ/Qw7Hc1Cpf819WLCAToy
         /j7KHCcVDBax3gVi0wu7sm6TaXKyslskHXw9E6TMwA46cBq2Y7DfVJbRLs80drFSseC4
         JBAqrmhFxCWQZNLhQoIc0RvGH4LldyOFy4u5S0UJZsMzSdoQzbXmTYIfIr+4OJYtbg2U
         vB3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=TRhX1v5rCwZy7zDS5Ga4rPZqI8X6ZnIUWWAbNiqlsN8=;
        b=iMxi3QIOG08LL6tL9T+ezrdIuHO85f0XtPcVUvDGWF+AykwtDJD9IvuxT12DTTgnzd
         N9TTwjIW/8MrTfVhgDI+sYKDRWnyR4e2re1QOOmAFCAj4j7aLsxVnjOn/GFER1JCjVcG
         C1Rr6wFwUsoubRUuvm/awaKRIIahVEX314W4gYHmZmpmM8jR99r7PMyJ2hp/nms3HaSD
         qJ6uMO9DFAiHB+9sRckZODcmbRQMd5rEM4DV8Lb1Ouzpw7aoa70iIm25WBziaVWDOCFf
         YktH7HHLID6uK2j0lTUmZggSazCcZSf3968bc+fFMSht9Iq9pyHTYLDAwE5wsXg8xPDE
         gFBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jHMxoabN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z190si53936ywd.417.2018.02.27.15.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 15:38:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jHMxoabN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqopK-0000jt-MA
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 18:38:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqopC-0000jQ-Ny
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:38:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqopB-0002BW-R1
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 18:38:22 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:54690)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eqopB-0002B1-Ij; Tue, 27 Feb 2018 18:38:21 -0500
Received: by mail-wm0-x243.google.com with SMTP id z81so1664069wmb.4;
	Tue, 27 Feb 2018 15:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=TRhX1v5rCwZy7zDS5Ga4rPZqI8X6ZnIUWWAbNiqlsN8=;
	b=jHMxoabNANIxq75BJUDLKfsOPQdiB1KT0Z3/8BJP+wnQRoyHPAa8tm+LnAITJlOgoa
	pcNmjAYdiPHVL2JtX7FGcxdIIK1zmm50BuvOEC2GFxB+RA+Mus43LVYUCt+Bbj8UBl2k
	nEFkt4Iz2SO/FMxUmsbN5HWSqG0/rn7iBQyOwhNBnpawF2gm+/eNIHB64gqQcsch0nEE
	Yuc57rum1hB625BginwAqLCVFNRPq3GRdOlnhaemH9T5qDmWoBEjNQIs1AaBp+bPcGES
	hDS1kLaAWmHtqAUA/DngEyDsR4mgtbiNvl/Hi94wzmsssdZNZPqCkw96vBysAzvgJNSc
	d9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=TRhX1v5rCwZy7zDS5Ga4rPZqI8X6ZnIUWWAbNiqlsN8=;
	b=r6EhacBv+S4/ib7+4CzFsFmEfi3xn2xwcrnkcD/EC4nGbvBA1pf01ii/+aXtnqc6Og
	MABXj2POos+c8O+eSIL+aDX4o1xK2hob/nUmZCaOpNLOVNZKtmRoebKJsWtTis0gkAr6
	Wc+zm8QXIU92KJW1q+7OU2nBYw+BSaIvdrVCpdidQKf/pi4QUEKY3s35DiC+qkHFaxPZ
	9ECu9LX68RFE2XW6MohQs1NwmqrMOufzooLaAKYu3mB/dKrMf8Sida+bl0HYibcftDV1
	j90OLQ7qqk76cY9JVatMTp7yc1iym2VDaw3IuqlIGkH9kdZCt+BZo2+NQ35dTHs9hso5
	ZTyg==
X-Gm-Message-State: APf1xPDqVF3JGhCVi0J2Mx4Ivb0PnJMXbbjDzkjwpiAKqxradSILA2mi
	LH8NaynP3r2dNa63r6NYsno=
X-Received: by 10.28.62.16 with SMTP id l16mr8104588wma.54.1519774700364;
	Tue, 27 Feb 2018 15:38:20 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7?
	([2a01:cb1d:8526:ac00:37c8:9a2b:1b7e:2ba7])
	by smtp.gmail.com with ESMTPSA id
	e18sm1146819wmc.21.2018.02.27.15.38.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 15:38:19 -0800 (PST)
To: Linus Walleij <linus.walleij@linaro.org>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
	<20180227104903.21353-4-linus.walleij@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <37d1e8d7-1d73-b635-269a-fd154426cdeb@amsat.org>
Date: Tue, 27 Feb 2018 20:38:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180227104903.21353-4-linus.walleij@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="fXsmhgVwVcLef5cnEExs5SFYtBLUEllUV"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [PATCH 3/5] hw/i2c-ddc: Do not fail writes
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BVY5I68CgduD

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fXsmhgVwVcLef5cnEExs5SFYtBLUEllUV
Content-Type: multipart/mixed; boundary="HgwcLMa4Rnb7gGfq1o1b27qL7h4mMOFgx";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Linus Walleij <linus.walleij@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Corey Minyard <cminyard@mvista.com>
Message-ID: <37d1e8d7-1d73-b635-269a-fd154426cdeb@amsat.org>
Subject: Re: [PATCH 3/5] hw/i2c-ddc: Do not fail writes
References: <20180227104903.21353-1-linus.walleij@linaro.org>
 <20180227104903.21353-4-linus.walleij@linaro.org>
In-Reply-To: <20180227104903.21353-4-linus.walleij@linaro.org>

--HgwcLMa4Rnb7gGfq1o1b27qL7h4mMOFgx
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02/27/2018 07:49 AM, Linus Walleij wrote:
> The tx function of the DDC I2C slave emulation was returning 1
> on all writes resulting in NACK in the I2C bus. Changing it to
> 0 makes the DDC I2C work fine with bit-banged I2C such as the
> versatile I2C.
>=20
> I guess it was not affecting whatever I2C controller this was
> used with until now, but with the Versatile I2C it surely
> does not work.
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  hw/i2c/i2c-ddc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i2c/i2c-ddc.c b/hw/i2c/i2c-ddc.c
> index 199dac9e41c1..bec0c91e2dd0 100644
> --- a/hw/i2c/i2c-ddc.c
> +++ b/hw/i2c/i2c-ddc.c
> @@ -259,12 +259,12 @@ static int i2c_ddc_tx(I2CSlave *i2c, uint8_t data=
)
>          s->reg =3D data;
>          s->firstbyte =3D false;
>          DPRINTF("[EDID] Written new pointer: %u\n", data);
> -        return 1;
> +        return 0;
>      }
> =20
>      /* Ignore all writes */
>      s->reg++;
> -    return 1;
> +    return 0;
>  }
> =20
>  static void i2c_ddc_init(Object *obj)
>=20


--HgwcLMa4Rnb7gGfq1o1b27qL7h4mMOFgx--

--fXsmhgVwVcLef5cnEExs5SFYtBLUEllUV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAlqV6+oACgkQ4+MsLN6t
wN5Y8w/8CGKWeG2YXKnSvJbxGmqvFhXUo8x+C1+rc7ejjElT56bN3AtjAOvCDSPC
WMeUZ6J2OyHLDHHkxzmk41tm8T2h9quO8aDbaUzFVf8ThnKP07eEbO6eDiplP5Pa
5XBvp/WEpXwwsPNXOI+Rdwigqr6ZKFA7Wn58enCtRUqbuSlSjHF9GmYFDRJsQkgH
obsumgKoxjc/tcUe4EBvq+n2oDLBBSAstFtJ3quZP25zOR/zK1LDoMbgPfQwZn/l
gjX+AluOanQdx6H6CZ7tgxVzS92VeuL0IT+5QZIqQI195JWFwnddtO/HvntIAAzd
aaOo38oTUmj1qy/6j/acPUUJPaTouxjmwGisouBEu0l8kkEDjbdj+MSleEcAOr85
A14Kv4byumMmg1tSNXMuQ42WZOGM4ZFlLh88tO8tsqql2UalmBzlQbdLQ1/Ocd2d
je8AZVwgC5aneHK7RCugZOM/v1uqB+GuE/Xbm1VEXgJ5jFJZPtKXtjG9heIvNTp1
RaQUSlgVvW0SUoe+cKyqXk+nosc2gOhQ4HpeLqWJKSaosTit9tlZeyDYQ0AZsH9e
6fR3nzXG9PWpNGjEquz3RicQJfaZXnPtPUaMF646j/MyFJiPvm8e5WuCFwH9bS8Q
5qJdt+3PJqMFoDhgDQyOlo8wPgrLDmwK8FEfwGMl1IEBdoze1hU=
=jHaS
-----END PGP SIGNATURE-----

--fXsmhgVwVcLef5cnEExs5SFYtBLUEllUV--
