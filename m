Received: by 10.223.197.9 with SMTP id q9csp1932517wrf;
        Sun, 8 Oct 2017 17:29:11 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDdQPgFAVD5nE5zDa3pVuEWbEMFejmSB0phlVY3W/RxlIj+GGksZs8ZpMvI8NDb6Laq01UJ
X-Received: by 10.55.132.130 with SMTP id g124mr7782341qkd.268.1507508951425;
        Sun, 08 Oct 2017 17:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507508951; cv=none;
        d=google.com; s=arc-20160816;
        b=FL9O4H3y2kdHuoIdPC0XqXJLZyXwaeW4FiXtnEFsnKLh+DwY4eTrpxEjFrObpzCQRo
         rNjtGx4bMYADYszwDXxzBU8rukEWRydcYJ2Xihmiqokp5zVUrvFzEv6ChTPOqUqzPS+L
         fM47J+9UV+00l7JOVmNMs4pFA0aYYFIOTlN/m5oeaXIEhYIaCmtCuS1g7lQ8TUFQRdia
         fZrzUbrQ5nCQmwPISWRSc4fPYmlUFTilMxxNLI0Fe2zr9W28XJj1xF+Yr6xE3AGtmFnk
         oNfaXRaAfSU1oLp/sQ1m5iMqcVtubuoKNJlFQiSvC91Jcyi1bTZapjsNvNFjbfLqPCX8
         lqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=qAhE5kDYiu9lYmoJXYvzL7LVvFsD2qjjHCQnhVgyQB0=;
        b=PNMshe/udnuGQSBJQeFoGDHYHoNxN72HPRfLKEw9kO1bcFD8HU/0DWJK4+pgwexTdM
         8UoOeN/DXpjoAvL01PSDywn/JsL+voy8IrcxtwAlfe1zuDNZA1ijhxR1bnh7Pi2wl250
         GB6AdR9OgSYXjLyIg7UA7CL4PnIKZtbajnJCrFCXwq8gSllfD2VQcLw9PUUOiHY2HgXE
         UZSxDlPVRIWf/8J1BW7lILRJmgnZSSuwjIdtl6veRSAsnflJBqhfYzikiq3x1+xLwle7
         yVoq3fNH2KuygULXwuH4Sb9l7tnnQF6YoDUpj14xSVHUkK/6vPiqoD9BoU/T0lGLIh85
         heIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=GWbFOuDK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=hbA+mUTS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v126si2045415qkh.169.2017.10.08.17.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Oct 2017 17:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=GWbFOuDK;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=hbA+mUTS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1LwU-0003TV-VT
	for alex.bennee@linaro.org; Sun, 08 Oct 2017 20:29:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e1LwM-0003TL-2m
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:29:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e1LwH-00043J-5I
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:29:02 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40321)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1e1LwG-00041r-Uk; Sun, 08 Oct 2017 20:28:57 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4484E20A52;
	Sun,  8 Oct 2017 20:28:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Sun, 08 Oct 2017 20:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=qAhE5kDYiu9lYmoJXYvzL7LVvFsD2qjjHCQnhVgyQ
	B0=; b=GWbFOuDKy6IKpkKaJ5vRttnfOc5/ExSO/DnRZWqN9n3vuYWJ7tSTSB8nR
	nD3yk5O1X5z6GR3Rw31ba/Ndzwm6UYNuO0hsjrhqT2ELTOMOJr1nPzkHXe1/ty6E
	gncZ96hKSH/Pe+R/wMPg4mk7M1wT9QyQFr8J5s+9H3OjAjqp0z6wYXKRwV7XR6EX
	UySc5BxQTrH8Vr8HTmXJo1auRQUgbRte/5uhIkWgTsRq268u/kfFEBqydBZeOQm8
	1UkMLpXepv/LLj53s56VKKjD5zjnSJs1pRA/KJoS0EHcJbY8lzmkD5yr21I6qXR2
	7GZjhkEv9HRpQk7u6KHpkUO0nlJIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=qAhE5kDYiu9lYmoJXY
	vzL7LVvFsD2qjjHCQnhVgyQB0=; b=hbA+mUTSGaUFiEbmYsZlsa2zRDuMQxSZND
	9LGEpk91OBSyxrEofPcJbwTpYOd/mSp0gifAqqC9/uztYyfI0UHxdzXjyJ87K3u+
	hTbvZPIsFEyDSsy/wrh+zG/KNstEWNX6Siz0nvl0nDFmPE5htwSKzUvxm2Z/mlca
	3lN1SYWWDhdaHqCd9MTiTxn3rQcw6DzP9IpuA4xuI4+MC3evPeBwEdvUFQLYb0yA
	+zPex+SEvwALmj0P05SVtcwjC8I55obdwVkRIcppmf05F1IEx4E3bZ47OFXISXf/
	K7SycFAZ/hXNJfJl6Ab254SBNp4l3vgcwG9QeygvvKezTeahuPDQ==
X-ME-Sender: <xms:x8LaWRYH5iL_HrG1a6vxED8h6IVbzs4GS8EEolminho1AqkYwSQUig>
X-Sasl-enc: wAKZZqByiD+sD2xVBr+TJ/n0oBb5jNh2OPpP8+fRfa9i 1507508934
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id C4D2B2413F;
	Sun,  8 Oct 2017 20:28:52 -0400 (EDT)
Message-ID: <1507508929.5452.148.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Mon, 09 Oct 2017 10:58:49 +1030
In-Reply-To: <20170920070135.31379-3-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-3-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-/dT+XB7iCO0KsHsc2QRx"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH v2 2/6] aspeed: add an I2C RTC device to all
 machines
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
X-TUID: euGplk+2UZHs


--=-/dT+XB7iCO0KsHsc2QRx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-20 at 09:01 +0200, C=C3=A9dric Le Goater wrote:
> The AST2500 EVB does not have an RTC but we can pretend that one is
> plugged on the I2C bus header.
>=C2=A0
> The romulus and witherspoon boards expects an Epson RX8900 I2C RTC but
> a ds1338 is good enough for the basic features we need.
>=C2=A0
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed.c | 19 +++++++++++++++++++
> =C2=A01 file changed, 19 insertions(+)
>=C2=A0
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 81f522f711ae..362b683e9021 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -89,6 +89,7 @@ enum {
> =C2=A0
> =C2=A0static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
> =C2=A0static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
> +static void romulus_bmc_i2c_init(AspeedBoardState *bmc);
> =C2=A0static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
> =C2=A0
> =C2=A0static const AspeedBoardConfig aspeed_boards[] =3D {
> @@ -114,6 +115,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fmc_model =3D "n25=
q256a",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D "mx6=
6l1g45g",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=C2=A0=
=C2=A0=C2=A0=3D 2,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.i2c_init=C2=A0=C2=A0=3D=
 romulus_bmc_i2c_init,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[WITHERSPOON_BMC]=C2=A0=C2=A0=3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.soc_name=C2=A0=C2=
=A0=3D "ast2500-a1",
> @@ -298,6 +300,10 @@ static void ast2500_evb_i2c_init(AspeedBoardState *b=
mc)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* The AST2500 EVB expects a LM75 but a TMP=
105 is compatible */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 7), "tmp105", 0x4d);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* The AST2500 EVB does not have an RTC. Let's p=
retend that one is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* plugged on the I2C bus header */
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 11), "ds1338", 0x32);
> =C2=A0}
> =C2=A0
> =C2=A0static void ast2500_evb_init(MachineState *machine)
> @@ -325,6 +331,15 @@ static const TypeInfo ast2500_evb_type =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D ast2500_evb_class_init,
> =C2=A0};
> =C2=A0
> +static void romulus_bmc_i2c_init(AspeedBoardState *bmc)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* The romulus board expects Epson RX8900 I2C RT=
C but a ds1338 is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* good enough */
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 11), "ds1338", 0x32);
> +}
> +
> =C2=A0static void romulus_bmc_init(MachineState *machine)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_init(machine, &aspeed_boards[R=
OMULUS_BMC]);
> @@ -358,6 +373,10 @@ static void witherspoon_bmc_i2c_init(AspeedBoardStat=
e *bmc)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 5), "tmp423", 0x4c);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(=
&soc->i2c), 9), "tmp105", 0x4a);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0/* The witherspoon board expects Epson RX8900 I2=
C RTC but a ds1338 is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* good enough */
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 11), "ds1338", 0x32);
> =C2=A0}
> =C2=A0
> =C2=A0static void witherspoon_bmc_init(MachineState *machine)
--=-/dT+XB7iCO0KsHsc2QRx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ2sLBAAoJEJ0dnzgO5LT5x+sQAJ9GCa1X8zkE+xS8MLvNx0Rd
/EwqXyvTXdAcvg49lhoYL+6xNQ5wEBRlutG11agCbRKxy5RG/kjTY95H3JOCc78s
TtCIeXUa7GRvyOX46q8f7GBUqymXb7uEkwBl5u5fEM9so7cHAn41Lc8dofxIBi0S
SsrSa9695rrGwUmo+VLx0yXguu4xeSUbmWaGoBFQtLhqfU0OewbwZcb/UC2m9+UM
6H+SXCE88NVp1c9X+ZAN8EMC2eWPwIagie1AIZeJ9g0l4aG1sCThF5TJeNlPMVZO
CH8kTs6FThfqDRYt5xKV8DAvnz/vYtE2/d9RsO7HDz6OJOAiTKwZMheKlrop+Qfj
l4Tuyz4+B1kuw4diNR/PxF1SWbMrZFfbTnx8HHHY6tdVuQtx0q6dKCfY6OCz2Pqw
oBp3+3IjyA3mooJsMu55ub0Ec0vxY7gHLFy8PuEgX6qwh5SDygGoY0xlZ4B+JBTP
U3PP4FtZ0s+wxhAidlt5fERYYmBRGV54PPjIfzgrvghBnl4xK48DkmrQFjbZGmyV
T9q3vGIF2sPFBKU2tys2xCFE8BrRqHYPSl/YS6Ofb30EXWAkKPxQof8Fma1W4EWi
L2/Neo7OGibDMcsblX+LoIozb8HPcMBfTt2FCxmgn3nY9sp9GtzX+zAcGjeeUihZ
ZeKUfb/46/dO354iOS/g
=gCOi
-----END PGP SIGNATURE-----

--=-/dT+XB7iCO0KsHsc2QRx--

