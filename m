Received: by 10.25.208.211 with SMTP id h202csp376082lfg;
        Mon, 14 Mar 2016 22:01:41 -0700 (PDT)
X-Received: by 10.55.75.203 with SMTP id y194mr35927929qka.2.1458018101501;
        Mon, 14 Mar 2016 22:01:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z203si24957898qka.44.2016.03.14.22.01.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Mar 2016 22:01:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:45451 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afh6z-0000rl-3D
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 01:01:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afh6v-0000re-VQ
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 01:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afh6r-0003lG-VU
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 01:01:37 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:36847
	helo=homiemail-a101.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1afh6r-0003km-0q; Tue, 15 Mar 2016 01:01:33 -0400
Received: from homiemail-a101.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a101.g.dreamhost.com (Postfix) with ESMTP id 31AC9117E06C; 
	Mon, 14 Mar 2016 22:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=vGk3qUoWu5W2G6wMbwl0s
	eoZyuc=; b=nRxyS61uwX07eKjS9vSNguajFdomfpQ4JTiOVPz/KnWfjhag0mpuW
	b/hBWnREtUbLQ/tWx96KiP6I/lJmeuofs9RcTQFzjjQ54fi4KKbd5LFsBZ9KJrpY
	R0AtgncUJ4gzdERrhCarRPwUsui0ahnWEU7K0NZ28RngOWDN8ZSxWs=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a101.g.dreamhost.com (Postfix) with ESMTPSA id
	8A876117E06A; Mon, 14 Mar 2016 22:01:27 -0700 (PDT)
Message-ID: <1458018080.29435.20.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Jeremy Kerr <jk@ozlabs.org>, Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2016 15:31:20 +1030
In-Reply-To: <56E790E2.7040006@ozlabs.org>
References: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
	<56E790E2.7040006@ozlabs.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CKad6nGvU+xYdFO1rhIJ"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm@nongnu.org,
	=?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v4 0/4] Add ASPEED AST2400 SoC and OpenPower
	BMC machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: andrew@aj.id.au
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wDInn6/4xq99


--=-CKad6nGvU+xYdFO1rhIJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-03-15 at 12:34 +0800, Jeremy Kerr wrote:
> Hi Andrew,
>=20
> > This patch series models enough of the ASPEED AST2400 ARM9 SoC[0] to
> > boot an aspeed_defconfig Linux kernel[1][2]. Specifically, the series
> > implements the ASPEED timer and VIC devices, integrates them into an
> > AST2400 SoC and exposes it all through a new opbmc2400 machine. The
> > device model patches only partially implement the hardware features of
> > the timer and VIC, again mostly just enough to boot Linux.
>=20
> Awesome! Nice to have these patches escaping the lab :)
>=20
> In terms of naming suggestions: I think this depends on what we're
> looking to emulate here. I see two options:
>=20
> The qemu platform becomes a "reference" for OpenPOWER bmc hardware, but
> doesn't necessarily align with an actual machine. In that case,
> something generic like opbmc- would make sense.
>=20
> On the other hand, if we'd like to create qemu platforms that represent
> actual machines (eg, the OpenPOWER "palmetto" machine), then
> -bmc would seem more appropriate. In this case, the machine
> name would be palmetto-bmc. No need to include the SoC name in that, as
> it's defined by the hardware implementation.
>=20
> I think the latter option may be more generally useful.

Okay, agreed, I'll rework the change to use palmetto-bmc for the
machine name. Thanks for the feedback.

Andrew
--=-CKad6nGvU+xYdFO1rhIJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJW55cgAAoJEJ0dnzgO5LT5CVcP/1yJKUblbCtnbU5s2QRU5Zrl
9Vn5hR62d2Kvj3tBbVcZqmZOJ/X5kQa15a/nB8UQmTqb8rc5+v8uAzegwx3Aw33V
kYO1ylVosw0lfSoJ0IZR8Ngf0zdEOOWqQo2LIrVSLOcPzV95J/2WHVx6ZfgVFAjH
MvuLB7v71BnFY4XZWpRCaLV5CSg3Hja0bwF2h5GjnEA/yXsoyCJf32xtk654hPVb
LUauqZNrbK6kIbOerDkeL3TooeLs6+KqfhT6oqzSClBgbiDvdVp440J14kBA8Ag7
zdfefbCoBX7DnvGX0Et/cXVzhlkZR/uC4PBaR3szQekMw1Xb0jhR+dqFCiW0Cj3b
aPsjQb27jVUtOzmroN/MX8/LSSPRqIhIyBKyRdCSe+YZ5rqdTiQYPhb01BT2Qd+f
A9a87boYl7F8zu6WwkgTDrvDKc6n1yQug+G95//fp46+H5mUNdPRKXvcK8rhrTjj
PJrAM1oEAcNi+V0mxSt8fUw+fpgpp9Sudb2tZZr3SttRqI+Nnxzr0kI6I0YM5YqZ
BSHsWa+neaSsWSxP8l5h7reBJ2DbOgeueykcNWzCId2S4nMPNkXd7vGPUzHCvsPv
v4PEfm1U/8FWKaG7KktJ3RYidbo6SHhHfLPmMQb6kYNJt+BU/hoixKcMnOoNelg4
OaHrhnfn//ucXIvsqOq4
=Edh/
-----END PGP SIGNATURE-----

--=-CKad6nGvU+xYdFO1rhIJ--

