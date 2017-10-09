Received: by 10.223.197.9 with SMTP id q9csp1942455wrf;
        Sun, 8 Oct 2017 17:48:13 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCCengRcmtCEhQCZT0VVHG4gviZIKe7GT/F3uW+5graCaMPJ0j7hvVaxhOr/c/NjLBoP9kY
X-Received: by 10.55.178.65 with SMTP id b62mr7572424qkf.348.1507510093231;
        Sun, 08 Oct 2017 17:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507510093; cv=none;
        d=google.com; s=arc-20160816;
        b=L/rO8xQmpkDlFOpsF49BIyEUcnGYOjLtIRpk6CrzvaBB7QoOnpyEM1TM3RUSd6N/pg
         rSxv97AGRWG8GEqFgXHHeLLxmsxVF2tlFl3Kh57ePonNsxRXsXhpPW4VXzeNz0BBFW9E
         md/ULZXOSX1qZ1YXiYTGuqBybZtL1GaJ2Dm4Z/kDgZrFANm69TdU+XWi0WTvLcDI8zYX
         6LuaFtbgHJandFmUf1mC3v6fQuNF4pnXs0m0LBPqmKENbe21pvY53XLGRetzRC9LLwYh
         iUnzKUuXyfdz9/1hr6JVxmHezylpHZvvky3EvT95qPRFh2TKlca0wFMAgjpTMqVmDdnD
         eV6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=lUoJobJOVPlBIEzSONLObqz+el6U0GsS96+GPPHzYUw=;
        b=lP7UlEGAEXnAoQL7C+gHyX/8F9usvDBYWqUkIQKUjmMRzptddh1qYN+IjCzol06UEJ
         bgBN90Jjl7o8QKsuTMyzcCTOOgj5s0u3MwYiPVeghaj+CvsLWavjARXjmhqrlo5Y0iVt
         Yj9Rw8AH92mUmrvT4a20hrJmLGY8jKhY3yi1AJ31QRwWCdKsYB8Ee2tHRv5/sCyKxfA/
         IdAVfyDhJkuMMMbQC51Xuxc1Y850izcy6ZkEWFAq7lJ/sv2HYh81h0xVXsqXAw++XS48
         6jdTI5hcKdsYDwctuLlxcgh9632PHR41u+BKJptDod4+5NcF/BZxWnxPrrEQADGMI2/e
         6zhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=T2jGdMMk;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=B+9+eKXm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f33si1251109qtd.288.2017.10.08.17.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Oct 2017 17:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=T2jGdMMk;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=B+9+eKXm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1MEu-00082E-Oo
	for alex.bennee@linaro.org; Sun, 08 Oct 2017 20:48:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e1MEl-00081x-GA
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:48:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e1MEi-00008g-Aj
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:48:03 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:51345)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1e1MEi-00008a-6v; Sun, 08 Oct 2017 20:48:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id CA49E209D5;
	Sun,  8 Oct 2017 20:47:59 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Sun, 08 Oct 2017 20:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=lUoJobJOVPlBIEzSONLObqz+el6U0GsS96+GPPHzY
	Uw=; b=T2jGdMMkN9iRTWe/WMAIO7mPBkUdD2R9FXcPd1FFv8zT+wIyfybMlaoGw
	G7G3W2aZWTnNun3HtgPgvP45N4zfopmEMNf1XnqZ9BjOeGxHT+Pnyohw41cS4PoR
	bXNgfTjp7Q3MRpYFFBecgB5uMdGsUrliqKBknWMt//n3hrIdmxjLt6oZqHhPNQLL
	di0OXxk7Rtb290dMWWWB856IAcPlb73I8DJkf0uhKAm1NRZbM5HqmKtFvpJy77YS
	ch/ksfAp8wcBtmnlRJMmX5xwG9dTFX4RwSGcq6kMO5RgRGq8KOw/1Patni0FGora
	/QZLjDJLxWVX7Yj7DyUT1OyNsiMew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=lUoJobJOVPlBIEzSON
	LObqz+el6U0GsS96+GPPHzYUw=; b=B+9+eKXmD5JkM63fZ1gZWPCy8BUdW8ZXMI
	ryOUQIY5N43mVPanL0XTkym4H0BZtRClCvkKZ2DQ8allRL15R3FUSda0D9E13dpA
	ilieOTxz3kA9+Xh9ZzaXLV3FgyVsorbYTN3nBoUCuWWjFWh2o1dovbM91+s31neX
	bgBZgwARivwxoJp4pfFsSwls1Ld2G/yoe6JbuOAhBt3Ap+VBVb590eGlbEUMCi2s
	0p0HacgBEw7mCYr4Qh024mXNqj96u1+v6YtGhgCa5tkGnoqhsg6rkPE+foHfcLgw
	JDrlrIhIS30HBEWMGIxkA/igibmTThyZLcKpIMF8auHJQPJ/TyXg==
X-ME-Sender: <xms:P8faWQPcJSiTyCeeaFpCbPOAZdsn4sRCNZFqAbvJ5S1Su15uid2mpA>
X-Sasl-enc: CzndMjGuqUIS8vdo3+Eg8yVNLKitpxee/hRBqKv4zrlc 1507510078
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 61880247DD;
	Sun,  8 Oct 2017 20:47:56 -0400 (EDT)
Message-ID: <1507510072.5452.151.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Mon, 09 Oct 2017 11:17:52 +1030
In-Reply-To: <20170920070135.31379-7-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-7-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-eTx3SJYtBYAbjZOoBSKH"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH v2 6/6] aspeed: add the pc9552 chips to the
 witherspoon machine
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
Cc: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9JTpdKQ/EyLj


--=-eTx3SJYtBYAbjZOoBSKH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-20 at 09:01 +0200, C=C3=A9dric Le Goater wrote:
> The pca9552 LED blinkers on the Witherspoon machine are used for leds
> but also as GPIOs to control fans and GPUs.
>=C2=A0
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=C2=A0
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 462f8008cff5..2ae46d71bff7 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -379,6 +379,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t *eeprom_buf =3D g_malloc0(8 * 1024)=
;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 3), "pca9552", 0x60);
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 4), "tmp423", 0x4c);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 5), "tmp423", 0x4c);
> =C2=A0
> @@ -390,6 +392,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0smbus_eeprom_init_one(aspeed_i2c_get_bus(DE=
VICE(&soc->i2c), 11), 0x51,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0eeprom_buf);
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 11), "pca9552",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00x60);
> =C2=A0}
> =C2=A0
> =C2=A0static void witherspoon_bmc_init(MachineState *machine)
--=-eTx3SJYtBYAbjZOoBSKH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ2sc4AAoJEJ0dnzgO5LT5c8IP/R6u1SPk7my/NtGhKOIU2I8m
nekuOKl7re2jVERZ/oFDW/mEwuXglT5nGyP0PDoBpWfp2McUob81a5U9BgBaY+Uj
agr8o4EjRukMHjeFkAl0bOxFppsBULBRF8IVkusSCEw3wQGylbB6in3d/3vyAeRp
20Is8dXf/FcGHQ5SzyzUT/EP+gWZqmt54JUj54LxjCj7o8LLvEowrGnLiVu3LisY
0cILXAGW0DtKj4576BE6pxOExDqRsPd2Ht40PdvK6VpxjVEMZ3IV8mntYtGJ0FHV
ieDLuWPbLlE70D1drjZ9jvdSN7c2xQIYydkLBEcCzEF0V+fhEdTXzhy8Y8bc4IZS
FlUlo1EEqZr8gqMUGoDqYExC4Pg+ad6DdVXECAQOo8NYVQxezMi/mclLMkOdX0ZB
P+PtNPvXLSolOUQRjVOOI6UIPcLVZx4kswmOcbmbNhXfxwVuZtJYL877jLjkTT3b
IVbo9t9k8RwucPSqXJE5ZYtR0EIqtN7ZSK5sajAyPnlwGg1HHKntK5vt85D5iNsh
VvJkSBKx4PZhMgG/eSs+upj8oIFQEelUj7/2+qKGcEP/7TJHQi5PQr1EkuF0XQXs
xIOM38cX3MhrcaQvF50JaeyK4WWkAJfKdi1YJK2r8zknR2DUqqFo1deDRqEcZxld
+1pX3Nwvgz95J8yff2EL
=7R2O
-----END PGP SIGNATURE-----

--=-eTx3SJYtBYAbjZOoBSKH--

