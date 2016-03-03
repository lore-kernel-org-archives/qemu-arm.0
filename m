Received: by 10.25.208.211 with SMTP id h202csp2612853lfg;
        Thu, 3 Mar 2016 02:16:46 -0800 (PST)
X-Received: by 10.140.177.71 with SMTP id x68mr1955639qhx.39.1457000206765;
        Thu, 03 Mar 2016 02:16:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w13si14142538qka.41.2016.03.03.02.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 02:16:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abQJK-00065k-7s
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 05:16:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1abQJG-00061U-83
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 05:16:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1abQJF-0006La-AM
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 05:16:42 -0500
Received: from ipmail07.adl2.internode.on.net ([150.101.137.131]:23547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1abQJ9-0006H1-4r; Thu, 03 Mar 2016 05:16:35 -0500
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CrBAAEDthW//fVestehHm4E4QIhgkEAgKBfgEBAQEBAWUnhEIBAQQjBC8jEAkCGBwOAgI5HgYTiCCQRZ0XhiGJGAEBCAIBFQiFIIU0gTaGAoE6BY0tiW6ORI4Wjk1ighAggUcpLohgAQEB
Received: from ppp203-122-213-247.static.internode.on.net (HELO
	lasair.aj.id.au) ([203.122.213.247])
	by ipmail07.adl2.internode.on.net with ESMTP; 03 Mar 2016 20:46:30 +1030
Message-ID: <1457000176.3938.31.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 03 Mar 2016 20:46:16 +1030
In-Reply-To: <CAFEAcA_YcF1zYY4brY+Wxc95-fn-WYN7TGMU9A4_YfPH=SLjeQ@mail.gmail.com>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
	<1455622497-25966-3-git-send-email-andrew@aj.id.au>
	<CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
	<1456982069.10265.11.camel@aj.id.au>
	<CAFEAcA_YcF1zYY4brY+Wxc95-fn-WYN7TGMU9A4_YfPH=SLjeQ@mail.gmail.com>
Organization: N/A
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-iNxU6MmPKfK11xi95vNt"
X-Mailer: Evolution 3.18.5.1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 150.101.137.131
Cc: openbmc@lists.ozlabs.org, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400
 AVIC device model
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
X-TUID: pMKDX1I2+n4I


--=-iNxU6MmPKfK11xi95vNt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-03-03 at 08:39 +0000, Peter Maydell wrote:
> On 3 March 2016 at 05:14, Andrew Jeffery <andrew@aj.id.au> wrote:
> >=20
> > On Thu, 2016-02-25 at 16:29 +0000, Peter Maydell wrote:
> > >=20
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0case 0x20: /* Interrupt Enable */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->int_enable |=3D=
 data;
> > > Are you sure this only ORs in new 1 bits?
> > As in, am I sure I only want to take the newly set bits? If so, yes, as
> > the the following register serves to clear the field's set bits:
> >=20
> > >=20
> > >=20
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0case 0x28: /* Interrupt Enable Clear */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->int_enable &=3D=
 ~data;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> > The 'int_enable', 'int_trigger' and 'edge_status' fields all use the pa
> > ttern of separate set and clear registers (the remaining registers may
> > benefit from the extract64/deposit64 helpers, I'll think about that
> > further). I'll add some comments to help clear this up.
> >=20
> > Otherwise, can you rephrase the question? At face value it seems like
> > you're implying that I'm doing more than ORing in the new 1 bits?
> It was just that the register name didn't imply a set-bits-only
> semantic and some of the other registers looked like they were
> also incorrectly not handling updates right.

That's a fair call: The comments I added were the documented register
names, which don't provide huge insight on their own. This is probably
a less-than-ideal approach given the datasheet is largely unavailable.
As mentioned above I'll add some comments on the different access
patterns and where they apply to try clear this up.

Cheers,

Andrew
--=-iNxU6MmPKfK11xi95vNt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJW2A7wAAoJEJ0dnzgO5LT5nLUP/jREiAX7u9vEziI1ocW8Quh3
4nsvrIYP+oW078ITP6sdoHUDGTlpj68oO3JfqX25H3zIjsLB6cKqR/s6DQL/ahmk
HU8kLefpNxaGE319ORD6BrNkiLHUkRdttXVycYTowCucxrIfGgiE+fXUsdKs06d7
qiFs3b19RPdDFVmYtN6FEDyPw2KgS7qdeqAw7WYCj+xuG2P0o51/ZYpe6r09Rlin
+8YG+EiV+h99/KNtFubFw70pgL/m4XZj+TeUaXKcVreMbVXb1BaMFAiR6gGH7l9J
R8lbOUFPMJ6D4TCxeTdomsKClsZhczetGHj/7X2GYAnAgnvG2X6s9hTOylZCuoOq
7O43FUa/pJg6TefUKquncoR/w2wWrVCYWuPm7+SXtoBEePKtIEJd5p5BdFHcuqxo
PEtoX86rfmTSWDOWbG4PXyRBpA7IXjnAnmr4A2Kshe4jH8/QsVPeCTFcFcribp9O
00V1zwvHvsNDIDMmtJKGpcZSEW6RxGhkmlanromZJWfXt0Z57B39wxzlBiOvLaHK
w/RmbKJzoxBKTa7mrhyeRtJwqRDvlu0RVjXvNKNS/HIR/NJmy4Sj2KeAdPK3nA3y
mwxRvOSf+DRJXWeMgwVCo2SWrW8fqdmtWK3iJ40HohHMVAAGsxrlckWKTBM7owSe
hXr8l9+8fMih8UmZXJi1
=Sdom
-----END PGP SIGNATURE-----

--=-iNxU6MmPKfK11xi95vNt--

