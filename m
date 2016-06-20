Received: by 10.25.21.96 with SMTP id l93csp1256017lfi;
        Sun, 19 Jun 2016 20:44:54 -0700 (PDT)
X-Received: by 10.55.163.200 with SMTP id m191mr19233864qke.175.1466394294811;
        Sun, 19 Jun 2016 20:44:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 67si45578833qkv.167.2016.06.19.20.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 19 Jun 2016 20:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bEq8r-0004aL-UU
	for alex.bennee@linaro.org; Sun, 19 Jun 2016 23:44:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bEq8o-0004aC-Nu
	for qemu-arm@nongnu.org; Sun, 19 Jun 2016 23:44:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bEq8i-0002sQ-O4
	for qemu-arm@nongnu.org; Sun, 19 Jun 2016 23:44:49 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:39528
	helo=homiemail-a11.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bEq8i-0002s7-0n; Sun, 19 Jun 2016 23:44:44 -0400
Received: from homiemail-a11.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a11.g.dreamhost.com (Postfix) with ESMTP id 923616E06C;
	Sun, 19 Jun 2016 20:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=5ynGSGYa2JCNNAXrkRWtv
	3yxJlY=; b=CeDV5XKy3/OAl0kMVfoXLbu578X7IreRbknv376jGEc5dt9IEJsUN
	wZc6DVW4V+4T2evfjcF5SUu7P/mg1Yu/Osyyp+0qCIitPVPS8rMCcuns/aNbVTB1
	DxEZvUTe9Mjj8w3Uj0AxnW+f/n9gMjzRSHGKD0FyfIQc6mgYzypXac=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a11.g.dreamhost.com (Postfix) with ESMTPSA id 0714F6E06A; 
	Sun, 19 Jun 2016 20:44:39 -0700 (PDT)
Message-ID: <1466394273.4344.25.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jun 2016 13:14:33 +0930
In-Reply-To: <CAFEAcA_-+nWvAsCLE71d4qb_3eFkF80L-JgZSxwF5L3CH+W_Aw@mail.gmail.com>
References: <1466063287-19350-1-git-send-email-andrew@aj.id.au>
	<1466063287-19350-2-git-send-email-andrew@aj.id.au>
	<CAFEAcA_-+nWvAsCLE71d4qb_3eFkF80L-JgZSxwF5L3CH+W_Aw@mail.gmail.com>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7L/tXS4eJwdiOH6GOWds"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/misc: Add a model for the ASPEED
 System Control Unit
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
X-TUID: Kub/y4WPSKrB


--=-7L/tXS4eJwdiOH6GOWds
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-06-17 at 15:22 +0100, Peter Maydell wrote:
On 16 June 2016 at 08:48, Andrew Jeffery <andrew@aj.id.au> wrote:


The SCU is a collection of chip-level control registers that manage the
various functions supported by the AST2400. Typically the bits control
interactions with clocks, external hardware or reset behaviour, and we
can largly take a hands-off approach to reads and writes.


Firmware makes heavy use of the state to determine how to boot, but the
reset values vary from SoC to SoC. qdev properties are exposed so that
the integrating SoC model can configure the appropriate reset values.


Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
+static Property aspeed_scu_properties[] =3D {
+=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_ARRAY("reset", AspeedSCUState, num_res=
ets, reset,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_prop_uint3=
2, uint32_t),
+=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_END_OF_LIST(),
+};
+
+#define ASPEED_SCU_NR_REGS (0x1A8 >> 2)
This seems like a very unwieldy way of specifying the reset values
for this device. Are they really all fully configurable in the
hardware? It seems unlikely. I'd much rather see something that
looks more like what you might plausibly be configuring when wiring
up the SoC, which might be some version/revision numbers and/or
some particular tweakable parameters.

Right. I left out some context which may clear things up: We are
working with two SoCs at the moment, the AST2400 and AST2500 (hopefully
the AST2500 patches will be sent to the list soon). I wanted to
abstract the configuration to cater for the differences in register
values between the SoCs, less so for wiring the one SoC up in a
different fashion.=C2=A0For what it's worth, out of 86 registers defined in
the IO space between the two SoCs, 37 take the same value and 49
differ.

I can rework the commit message to say as much.

Separately, the qdev array approach was lifted from your commit
9c7d489379c2 hw/vexpress: Set reset values for daughterboard
oscillators. Another approach would be to set the members of the SCU's
reset array directly as we know the type. That seems less convoluted
but my gut instinct was that wasn't how we should be configuring the
devices. Is qdev the right way to go in the SCU's case?

Cheers,

Andrew
--=-7L/tXS4eJwdiOH6GOWds
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXZ2ahAAoJEJ0dnzgO5LT55XgP/A4ncrqT6W8Y59zEBMSn/7CN
+nOsIbqXS4pB+Iy+0Ok81i/reh190B3D6FSfYicoNKRKBnOJ0m4l9xuXK8aw3NQe
4UVVsg/ZH3o4cmHzPj/8X948v1P8s1o5NeAbX2sT2ZGJkt2l2H5uRy2bP9TNYEUn
7jqC3dQ3nRfchH5sflAQNzZXkJbGudzy64TaiEmKGCsT2KCCdLz4hurCCIeMgZ40
QzWuZuKSKk6Y7qLEp/eWEg4lfbVd9kneHFb8GFyF3/PoRO7MZwLG8P1XfYBAahyS
Dhft9qA5Lgf8bOsDNb7T921R/8CLYby/zu7D4+0WMkkc1manuWjrD72pFskpocyc
oQMeDiOpLI681F1j0/q8SEI0Byg/hL2AqlRKvHLxUqlu09RDNOHrOOkiGyd36W7t
ZKXJ5jr+mwKsUTUwZSPUj5hBMN5uMCGbBOzMDnC0wG2+Uhc3xDdnneYBQIfMMUMN
BoQroQZwobJ1UuzTIYo0nZKdHDc2YdK3+X5ltkLX7mI4bBf2i81iTAX9NPIeAUda
ueePZH9PQcHYpiQIKGLwGMjssQEHITfMFk3Pyl0CoSKvzxO7Jl3TzQSLMjIPw4xN
7QyiPThxgfZ21iMV3m0GX+0Kb4Zxkw25O7OrRH9sN7UnULk/FdFIHz+WdbFIxQlk
4wxfbt+zizKsGU6+lZUK
=WQcL
-----END PGP SIGNATURE-----

--=-7L/tXS4eJwdiOH6GOWds--

