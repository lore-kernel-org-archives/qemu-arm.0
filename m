Received: by 10.25.27.66 with SMTP id b63csp2344945lfb;
        Tue, 7 Jun 2016 22:31:47 -0700 (PDT)
X-Received: by 10.140.136.16 with SMTP id 16mr3064250qhi.25.1465363907304;
        Tue, 07 Jun 2016 22:31:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a15si1071287qge.63.2016.06.07.22.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 22:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAW5i-0003Up-OV
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 01:31:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bAW5d-0003UZ-TH
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 01:31:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bAW5Z-0004Ev-Tv
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 01:31:41 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:41633
	helo=homiemail-a19.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bAW5Z-0004DY-AQ; Wed, 08 Jun 2016 01:31:37 -0400
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 2871C604078;
	Tue,  7 Jun 2016 22:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=3b7hDoBEZz/mRjlJsQHRE
	4gub1s=; b=MbcFi51/shVL19I5rcv2kwl0cebce+XF8W9AuyL1WzXer38BsYYV7
	tOskfsnnvY1CGWyD+hkWPW4TbQCYTDhyGBSzB9B3dgP7LIUv+Z65hma75OiJHZT9
	chVKgrbEomQRkSvQAZTesnSGy3MGz3z8eV8fMm6EDsjNqV5QAcyzq8=
Received: from keelia (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 319F2604069; 
	Tue,  7 Jun 2016 22:31:30 -0700 (PDT)
Message-ID: <1465363881.16048.134.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 08 Jun 2016 15:01:21 +0930
In-Reply-To: <CAFEAcA_Pseb+W6q-TjyZxsf+OuET=FpzNwck+72QpnY0iqxS6g@mail.gmail.com>
References: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
	<CAFEAcA_Pseb+W6q-TjyZxsf+OuET=FpzNwck+72QpnY0iqxS6g@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Hobq0SFDGu2xSLU7AygK"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
Subject: Re: [Qemu-arm] [PATCH] hw/timer: Add value matching support to
 aspeed_timer
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
Reply-To: andrew@aj.id.au
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hozRkrl1Kd0a


--=-Hobq0SFDGu2xSLU7AygK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-06-06 at 15:01 +0100, Peter Maydell wrote:
> On 27 May 2016 at 06:08, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=3Dy on the
> > palmetto-bmc machine. Two match registers are provided for each timer.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >=20
> > The change pulls out ptimer in favour of the regular timer infrastructu=
re. As a
> > consequence it implements the conversions between ticks and time which =
feels a
> > little tedious. Any comments there would be appreciated.
> So what would you need from ptimer to be able to implement value
> matching with it; or is ptimer just too far away from what this
> timer device needs to make that worthwhile ?

I gave expanding the ptimer API some (quick) consideration. It feels
like it might be a departure from "simple" and depending on your view a
departure from "periodic"; though an interrupt for a given match value
is at least periodic with respect to itself. In this case the hardware
supports two match values, so if we add something to the ptimer API it
would need to support an arbitrary number of values
(ptimer_{add,del}_match(...)?). In this case the hardware counts down,
but just as we're doing currently we can fix the values to give the
right behaviour.

I guess the final thought was that you queried me on the #include
"qemu/main-loop.h" in the original patch, and that moving away from
ptimer would eliminate it.

If we come up with an acceptable match value API for ptimer I can
implement it and resend.

Cheers,

Andrew
--=-Hobq0SFDGu2xSLU7AygK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXV62pAAoJEJ0dnzgO5LT5dsQQALXOb9Rqc6bbPPtO4Kzqv1ua
uSjIs7GEzBSOm31ESwvLd7rPItApktBgA/eQ8NpetkpmUqVAvWLey3tzgLs7QQob
lqF64oGZpDutAKW5dNh+j5fRqHdysnWMUH0g9L0igWVkYDWBM1HIBRCxtSycHwd5
LouP21XeQQz4mMXvr6F3Is/MceJqohQjI/GULV4QyLieN3II15DJalhKj1iA/yD7
a3JiKJHicLsHrSdItFb5xQeGe25HKkgcJawp3ifmWl49cFLsK3frewA8uUWpXrwG
Od5ZxsKp4IQmSwRqIuoaZCKmixLELVU+c0dW1QPU/CdfPmT34ML/ILScD9okvl9i
y4uESHRYWM/qjD7wMOwm3Tp0NrTbpSuW5vy7D1L48VUJvwv8HP0dCkYGuLrejgCC
a4YBofrVeyIZXAiz6c9yEL6jXns8mVJ1sheYHTCYao1C7EEoYZgPp2nL1BS4EBg3
j5W5M69Wy380M8tsrhHcG4yqgsJEFoDY6lXblegtwPerEmzBlAYtRY2WKy1HvrR4
+fg+1y7DE/332mdm568RhAtVr8vMyNF9HY0OPuTPoULKZoEJv0nir/ux5+XhA3X2
rmp/MB2XG0qcTX9SU8YsbTdHMpGkq/57w/JUx2w2AdGBw98Q0cPmefZNBX50rXwK
91N4c4OA0BJyW7yvA3Z3
=kWIn
-----END PGP SIGNATURE-----

--=-Hobq0SFDGu2xSLU7AygK--

