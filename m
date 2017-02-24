Received: by 10.25.0.147 with SMTP id 141csp605049lfa;
        Fri, 24 Feb 2017 01:48:59 -0800 (PST)
X-Received: by 10.200.40.86 with SMTP id 22mr1836508qtr.245.1487929739238;
        Fri, 24 Feb 2017 01:48:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si5270484qta.308.2017.02.24.01.48.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Feb 2017 01:48:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@antfield.fr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:35780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1chCUi-000384-MJ
	for alex.bennee@linaro.org; Fri, 24 Feb 2017 04:48:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chCSw-0001nh-Dk
	for qemu-devel@nongnu.org; Fri, 24 Feb 2017 04:47:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chCSv-0002QO-Lr
	for qemu-devel@nongnu.org; Fri, 24 Feb 2017 04:47:06 -0500
Received: from bee.antfield.fr ([188.165.75.195]:59318)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clement.deschamps@antfield.fr>)
	id 1chCSb-0002LO-Cp; Fri, 24 Feb 2017 04:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1487929603; bh=+XPuDrnDeg2QOx4wypw0pIi6zOmTBSDE0vdpIU6IBAo=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=CwhkGKHFoU2bR2OzYth6HxpXFhTredG/xrzICZJUhrePZsqPo087Ou+2pH3jds9/M
	9fpujqZjDn3fxxyYbJRTpf4YIi80LwYmleoYSjT4odmJPQDg/Vb0h1GpI3wz+6aIpz
	l2Qq+IOZK0jprgkulSCeYC8zxH03tF3h/cryNPF0=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170222112338.25492-1-clement.deschamps@antfield.fr>
	<CAFEAcA8=nouAmHZbs-VBabx=kkGzdWFNJ4kFJTh2B4Uemd9_Cg@mail.gmail.com>
From: Clement Deschamps <clement.deschamps@antfield.fr>
Message-ID: <f169d8d8-439b-29f2-60d2-d302469d02e5@antfield.fr>
Date: Fri, 24 Feb 2017 10:46:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=nouAmHZbs-VBabx=kkGzdWFNJ4kFJTh2B4Uemd9_Cg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="8OhT0Rvd31e3tNTgH7PXM7E5WWMHNCK16"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v2 0/3] add sdhost and gpio controllers to
 the bcm2835 platform
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zZr8j0SFdCo8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8OhT0Rvd31e3tNTgH7PXM7E5WWMHNCK16
From: Clement Deschamps <clement.deschamps@antfield.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Baumann <andrew.baumann@microsoft.com>
Message-ID: <f169d8d8-439b-29f2-60d2-d302469d02e5@antfield.fr>
Subject: Re: [PATCH v2 0/3] add sdhost and gpio controllers to the bcm2835
 platform
References: <20170222112338.25492-1-clement.deschamps@antfield.fr>
 <CAFEAcA8=nouAmHZbs-VBabx=kkGzdWFNJ4kFJTh2B4Uemd9_Cg@mail.gmail.com>
In-Reply-To: <CAFEAcA8=nouAmHZbs-VBabx=kkGzdWFNJ4kFJTh2B4Uemd9_Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/23/2017 07:44 PM, Peter Maydell wrote:

> Wow, that was fast. Are these patches entirely your own work or did
> you start with something from Andrew's tree or elsewhere? (I'm wonderin=
g
> if we need extra signed-off-by lines in the commit messages.)

It's my own work, we don't need more signed-off-by.


--8OhT0Rvd31e3tNTgH7PXM7E5WWMHNCK16
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJSBAEBCAA8FiEEaNi9eUaRP9BYKowJomWY3rxByn8FAliwAQceHGNsZW1lbnQu
ZGVzY2hhbXBzQGFudGZpZWxkLmZyAAoJEKJlmN68Qcp/v2YP/jKX9l0yDURuAc9I
rlweEfP9v++gZxzHqvhq0NcKJwlW+l+SMBedgfDnxUs4cPd28PLdtxmj2LH51FH+
Q5RM8ds/mszFvAiqwahZ7nPrqAicHu35W1AxVv4U/vBwM1V1+pAHCCHSt/Aseq+a
k6zHUDSZ/y/e37XEt9cgaB9Pu89orjGcmM15GrfcU3Yn/zQYKyvjWgTfG7sic1ED
MC5kZIQYrzvxukh1byzEu9y6GhYVroZkiIKBOIDmCMsJKXE7CP2NAtk8LThbZ6Wz
l4KPTEQIGLkMS2wmQvhOAvMZEJ35i+qvXLQi5lOnNkrYTIgwT+hqqFlzF1tOyUJc
Ernx5dmrBP+vlgR6o5c7aI6kOGdgp3ioC7tgPGdZqygY7/rDYWQ9NPW3+MVrFuZ5
mH/5uDpG9vErohKsn0mq7vBP6bRGNCnPZp5j4Ovwhdpzmxfc2Rx8zqfP6fGmNnGa
cC72Gvzke/HeRu+MA7DnJ0y5oCRD1aT9ZEHmQ0qW+t+3rMvP/HKCew2Q/2Vz/Wwy
M8JxfeqTOlYhzut2fi9PjfoagJCNrmilEJRdCm6RM63oC7zLVRGk1emTAR4vwxOl
mUsH/oFhPc0/VVcBIXQWrNDxqAoIk+sUjriV5S6VUgDXQehOL6dBezDFgQxIo6DX
cniqfCKYGimc2Svhx4jteZFSYwnF
=1ato
-----END PGP SIGNATURE-----

--8OhT0Rvd31e3tNTgH7PXM7E5WWMHNCK16--
