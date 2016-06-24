Received: by 10.25.21.96 with SMTP id l93csp815267lfi;
        Thu, 23 Jun 2016 19:22:24 -0700 (PDT)
X-Received: by 10.55.209.83 with SMTP id s80mr1856310qki.87.1466734944176;
        Thu, 23 Jun 2016 19:22:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y32si3079111qta.101.2016.06.23.19.22.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 19:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGGlD-0005Fe-Kl
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 22:22:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGGl9-0005FY-5k
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 22:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGGl4-0006U1-20
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 22:22:19 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:54342)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bGGl1-0006S8-L0; Thu, 23 Jun 2016 22:22:13 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 271C8CDF;
	Thu, 23 Jun 2016 22:21:58 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 23 Jun 2016 22:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=mNxhg
	1ybIqhp+BGY6Vp8Xf4UQLw=; b=Ym1KJs6uHzcyFjWHV1b4M8dc07YNzfh30amRB
	gsyYZAY/aHbUALMUoV5YBuNGXyb5p2uwG5rLrbrwqxl7DYZp9Z+fnm1q7xwLzZxE
	d3dvZ8fx6RgcGBdkqPzAozKAv8Jo+G2QlF4OsZdlcx6l667zEkTXooi+Dnwxd0H1
	2ld5PU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=mNxhg1ybIqhp+BGY6Vp8Xf4UQLw=; b=L+O3A
	+5rfpllYGIv79N/JDkeFU2GuLVwRcwnDHlaVtul/EdtZP3txbH0Q8BY7EYtfJrWO
	/UOjX/W1TwIwlUZffN/hdmu5CHayUzaGfZqCWMNTdd4feJteu6jUjEWA//TNnpRD
	5DIk5U/ZmlYCpXMjS9HutZ86qFWkON9Okq42rA=
X-Sasl-enc: uRzmSVz83Mp91TFYpGatf1gNPqY2SvSTkAv2KxqcCTO6 1466734916
Received: from keelia (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id 88230F29FA;
	Thu, 23 Jun 2016 22:21:54 -0400 (EDT)
Message-ID: <1466734909.23740.125.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 11:51:49 +0930
In-Reply-To: <CAFEAcA94oy9Bw=1trtn1rnbobMQwpRg-8oOgf1G_1rbhaZH-7w@mail.gmail.com>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
	<1466648115-17015-4-git-send-email-andrew@aj.id.au>
	<CAFEAcA94oy9Bw=1trtn1rnbobMQwpRg-8oOgf1G_1rbhaZH-7w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-x4DU9CVQVzsxpw64qPwE"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH v2 3/3] palmetto-bmc: Configure the SCU's
 hardware strapping register
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a+xw1HqzZ1LV


--=-x4DU9CVQVzsxpw64qPwE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-06-23 at 18:39 +0100, Peter Maydell wrote:
> On 23 June 2016 at 03:15, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > The magic constant configures the following options:
> >=20
> > * 28:27: Configure DRAM size as 256MB
> > * 26:24: DDR3 SDRAM with CL =3D 6, CWL =3D 5
> > * 23: Configure 24/48MHz CLKIN
> > * 22: Disable GPIOE pass-through mode
> > * 21: Disable GPIOD pass-through mode
> > * 20: Enable LPC decode of SuperIO 0x2E/0x4E addresses
> > * 19: Disable ACPI
> > * 18: Configure 48MHz CLKIN
> > * 17: Disable BMC 2nd boot watchdog timer
> > * 16: Decode SuperIO address 0x2E
> > * 15: VGA Class Code
> > * 14: Enable LPC dedicated reset pin
> > * 13:12: Enable SPI Master and SPI Slave to AHB Bridge
> > * 11:10: Select CPU:AHB ratio =3D 2:1
> > * 9:8: Select 384MHz H-PLL
> > * 7: Configure MAC#2 for RMII/NCSI
> > * 6: Configure MAC#1 for RMII/NCSI
> > * 5: No VGA BIOS ROM
> > * 4: Boot using 32bit SPI address mode
> > * 3:2: Select 16MB VGA memory
> > * 1:0: Boot from SPI flash memory
> Maybe we should say this in a comment in the code?

The list describes our specific value choices in the register's
bitfields rather than fully documenting the bitfields and values. If
you prefer I could switch to the latter and make it a comment, but
failing that my only thought was if we tweaked the value the comment
maybe come out of sync. By putting our choices in the commit message
the description is at least accurate for what was configured at the
time.

However I don't expect we will tweak the value...

>=20
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> > =C2=A0hw/arm/palmetto-bmc.c | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> > index a51d960510ee..b8eed21348d8 100644
> > --- a/hw/arm/palmetto-bmc.c
> > +++ b/hw/arm/palmetto-bmc.c
> > @@ -44,6 +44,8 @@ static void palmetto_bmc_init(MachineState *machine)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&bmc->ram);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_const_link(OBJECT(&bm=
c->soc), "ram", OBJECT(&bmc->ram),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&er=
ror_abort);
> > +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&bmc->soc), 0x1=
20CE416, "hw-strap1",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0&error_abort);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&bmc->soc=
), true, "realized",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&error_abort);
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Cheers,

Andrew

--=-x4DU9CVQVzsxpw64qPwE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXbJk+AAoJEJ0dnzgO5LT59+4P/2j5Lfqh0cebwIi22o1l4z3F
BfdnRlHJDodE8uyNft2RorDDKPERFOt+i7RIxgF+olnhI1oUZFS7AJPWa/B4KCe3
RYSL2y5zF4xPjtvplK9GBROIfTYMgVL7bEqst3w2aAKj4udMeG5gnbMU9VaSIu4Y
YI+SGvf67g4kCvsQ1pJN0bWRBsnce3VOhQ4Jc4jWMzZSgcPt1diNbezIhroJUMKT
jgfQTR7KCYeRaeQ91yYM7r6ykKZrhCUzMwmSrbmp4z0IP5pABG0g5+Ag4pPEatLe
yyP/+BlIP2Xaci4y+igceYdERag8q5k4+VF6GzB7iKiQJLm01Nu5kPKXjOMOrbBN
Ui7/ElvlGslSOJhZn3V57uvy+jmON0nBYF9NPxqI/9vzlFqZdudHAn8grpqrV9pm
rV7pRiAxgbYTxHGp3r/6mdW1i7dbAWRVUFM4yP/Cc9Scs3O7dRh6luRsXwAqCKsK
RTVRi5vASZSPGvq2nMDpnh/6q4CmCoszgiziCAFPf+mNDW6o8PzdvJOjDSR2w7Tc
037vWOdaCSAZOLF59NRFAZgoLm9w1Uh3sXJyIjsUiYOOXLXk+ViLwxi+aOsKENBD
ch6eh+0rHzvxMCQI7R4h0udSxBmIJRD4M3PI7HhTTKgY86zigMAkOdpAk13LQ6Lg
k+CWefope6yEkRxis3qX
=O+DC
-----END PGP SIGNATURE-----

--=-x4DU9CVQVzsxpw64qPwE--

