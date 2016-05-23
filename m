Received: by 10.25.30.65 with SMTP id e62csp49887lfe;
        Sun, 22 May 2016 23:21:16 -0700 (PDT)
X-Received: by 10.140.228.16 with SMTP id y16mr14694124qhb.83.1463984476152;
        Sun, 22 May 2016 23:21:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m190si21771307qke.275.2016.05.22.23.21.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 May 2016 23:21:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b4jEp-0008Hu-L7
	for alex.bennee@linaro.org; Mon, 23 May 2016 02:21:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1b4jEm-0008Hk-IL
	for qemu-arm@nongnu.org; Mon, 23 May 2016 02:21:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1b4jEi-0000xp-2Z
	for qemu-arm@nongnu.org; Mon, 23 May 2016 02:21:11 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:52456
	helo=homiemail-a13.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1b4jEh-0000xZ-Q6; Mon, 23 May 2016 02:21:07 -0400
Received: from homiemail-a13.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a13.g.dreamhost.com (Postfix) with ESMTP id 5A7BF334072;
	Sun, 22 May 2016 23:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
	:subject:from:reply-to:to:cc:date:in-reply-to:references
	:content-type:mime-version; s=aj.id.au; bh=f3j77ICud9/PUxDcfSdpI
	6Ib/3U=; b=I/6h+LlgHpl11gB3S5NuYux5Q669JlwXSaPYFp3jW1okzMOtZSbKi
	jMLftupjTg21TJDAScPm0IXXCq46Bo41B3dv1fbYk/dx36YfW3TWQ5xcoIuacGqx
	6uL8gAPHl4XCi0DXk7z/pmRQMllM2Z9xqCohQl2Xjon0EXQ/vofJJE=
Received: from keelia (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a13.g.dreamhost.com (Postfix) with ESMTPSA id 1001C33406F; 
	Sun, 22 May 2016 23:20:59 -0700 (PDT)
Message-ID: <1463984454.2703.291.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Mon, 23 May 2016 15:50:54 +0930
In-Reply-To: <57429B4E.5080008@kaod.org>
References: <1463761675-15227-1-git-send-email-clg@kaod.org>
	<1463967709.2703.238.camel@aj.id.au> <57429B4E.5080008@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-awgkIy1JEC32op+3r+oa"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] i2c: add aspeed i2c crontroller
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KrARWxEiSnGz


--=-awgkIy1JEC32op+3r+oa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-05-23 at 07:55 +0200, C=C3=A9dric Le Goater wrote:
> >=C2=A0
> > The hunk fails to apply to master as the SCU isn't yet integrated
> > there. The change to ast2400.h also fails to apply for this reason.
>=20
> Ah yes. I am using your branch for this patch.=C2=A0
>=20
> So, I will provide you a fix for "qemu/log.h" below=C2=A0 and let you do=
=C2=A0
> the sending of the SCU device ? or do you want me to send it all ?=C2=A0
>=20

I'd make this patch apply to master and send it alone. The SCU patches
aren't quite ready for posting and I've got a few distractions at the
moment, so it might be a week or two before I can clean them up and
send them out. I'll apply them on top of the i2c controller patch when
I get around to it.

Cheers,

Andrew
--=-awgkIy1JEC32op+3r+oa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXQqFGAAoJEJ0dnzgO5LT54VEP/iuKsCfW2+/pSGxCLfvlBHDT
f7FjuWS7HVBSEW3v5uWo+xIhV3KvD4h/yU2iKNU8IsBUknPYO1tWboyDIl72BN64
D/xcN2kdYgiNZFNVbh3s0LkRoqkKrcQrpj9Csxv5yMKKJR2QNqFi6Bj5hwhQXbMA
mT9zX9Ov44qIwwlbZL0BrJ1644OkVSqQCaTEQFfanvmF9aFu4RXIQ9Ylpktxc+v+
VAnzf1iNebt1n94mx79PCFqlpcnYO+OtPEEnWVHAwFFIQjHZnxsHvmSqwSoQrT6o
DMtzK2SrtrKFM6g2qA3yb7B9aqveZKNz0zuPMV4bbq/4uv22Xk1r7CLnmzGZwqWX
uHlFzgdhqDZwkkZAh7d2201VY7/3Wk4H266XyA5H0zaeuEonaPy41Ksg9R8j40XC
gwdcCH35HSSXW1cLKngyWbT1Ec6xNhyeefus57e5Qr6Ql/5CqO8as5s67gjEhcgw
+AYFSIEk1vIV8YP+FSokeQeVjCsV3T/m2MDprWw7Vko3X4qEmoHyKSbw2VNlgXsF
Sh5BTnqdgQOQptBWa5p7vmLpNbtflUgKTXWrcdSNTzXnEyhSJmJxpVuZonLo1BIf
hH95yGkl3YgebLSatzrZcNj9elwvRj7tv2Pfe3GHdQtbcEctEr5fy6sBFMXVXIVs
KP+zEib5WzgaaoJ180MG
=1sOo
-----END PGP SIGNATURE-----

--=-awgkIy1JEC32op+3r+oa--

