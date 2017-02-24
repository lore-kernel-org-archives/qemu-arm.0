Received: by 10.25.0.147 with SMTP id 141csp604560lfa;
        Fri, 24 Feb 2017 01:47:15 -0800 (PST)
X-Received: by 10.237.59.73 with SMTP id q9mr1751353qte.247.1487929635415;
        Fri, 24 Feb 2017 01:47:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t30si5292615qtt.48.2017.02.24.01.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Feb 2017 01:47:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@antfield.fr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=antfield.fr
Received: from localhost ([::1]:35764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1chCT2-0001nV-LL
	for alex.bennee@linaro.org; Fri, 24 Feb 2017 04:47:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chCSu-0001kN-CB
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 04:47:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clement.deschamps@antfield.fr>) id 1chCSr-0002Oo-6b
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 04:47:04 -0500
Received: from bee.antfield.fr ([188.165.75.195]:59338)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clement.deschamps@antfield.fr>)
	id 1chCSq-0002N0-8Y; Fri, 24 Feb 2017 04:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=antfield.fr; s=mail;
	t=1487929619; bh=bXmd0BqWqyKtWuO/xcw1pkWGWbVtB+HtXYQ8qWkVGx0=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=ZKsRBx7Io55HXVXbLWw37LrJs4RXtwm/0Gvh87y2tijAzuXKCwJZ6a9X5XZwLOO1/
	JNN9Blwkm6DKSZmIpSUEdwY40cg11tK8kHp7WPgpP9L0naseKlxHxJPcocYp5UNshT
	bIv+34C2CYjW8bq6ecZfpUFOMvqR1ap9Hp4V8sHc=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170222112338.25492-1-clement.deschamps@antfield.fr>
	<20170222112338.25492-2-clement.deschamps@antfield.fr>
	<CAFEAcA84OnAiAujSa-N5dtK0TO5KeCyiXxKvTwShXrqieGaxhQ@mail.gmail.com>
From: Clement Deschamps <clement.deschamps@antfield.fr>
Message-ID: <808bbcbd-7d71-ec8b-65ad-cc3e5a58c98f@antfield.fr>
Date: Fri, 24 Feb 2017 10:47:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA84OnAiAujSa-N5dtK0TO5KeCyiXxKvTwShXrqieGaxhQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="a2TxIXqLu79lWIJmdcpeeAqpH3DfRmnBA"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.75.195
Subject: Re: [Qemu-arm] [PATCH v2 1/3] bcm2835_sdhost: add bcm2835 sdhost
 controller
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bdXoh0ptpzcv

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--a2TxIXqLu79lWIJmdcpeeAqpH3DfRmnBA
Content-Type: multipart/mixed; boundary="JoSDjlWKgqRlOUIS5R9UnW7rPramhQilo";
 protected-headers="v1"
From: Clement Deschamps <clement.deschamps@antfield.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Andrew Baumann <andrew.baumann@microsoft.com>
Message-ID: <808bbcbd-7d71-ec8b-65ad-cc3e5a58c98f@antfield.fr>
Subject: Re: [PATCH v2 1/3] bcm2835_sdhost: add bcm2835 sdhost controller
References: <20170222112338.25492-1-clement.deschamps@antfield.fr>
 <20170222112338.25492-2-clement.deschamps@antfield.fr>
 <CAFEAcA84OnAiAujSa-N5dtK0TO5KeCyiXxKvTwShXrqieGaxhQ@mail.gmail.com>
In-Reply-To: <CAFEAcA84OnAiAujSa-N5dtK0TO5KeCyiXxKvTwShXrqieGaxhQ@mail.gmail.com>

--JoSDjlWKgqRlOUIS5R9UnW7rPramhQilo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/23/2017 07:48 PM, Peter Maydell wrote:

> GPL-2-only is OK if that's what you strongly want, but if all the
> authors are OK with it we prefer GPL-2-or-later (see the note in
> the LICENSE file). Similarly with the header file.

No problem, I'll change it.


--JoSDjlWKgqRlOUIS5R9UnW7rPramhQilo--

--a2TxIXqLu79lWIJmdcpeeAqpH3DfRmnBA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJSBAEBCAA8FiEEaNi9eUaRP9BYKowJomWY3rxByn8FAliwARceHGNsZW1lbnQu
ZGVzY2hhbXBzQGFudGZpZWxkLmZyAAoJEKJlmN68Qcp/fU0QAJ3xJc4eclCgLLp1
YFsFFpsic3oDyAkFVmRf8TEgzdNVWgWDh4abXu6pddH5e88uaqhq9xFqaLQnu9nw
abaCYYeAhl81kfZwfPnRC0A6byZ85dblSATd2efFrh7OES63g27xJ3wukYZZgXqo
b6zJKHmJx+fqa4pZC3ETXjRsRsBO/yTXATQDuqDKKuAlZs1Jxha6PdJDvnD4FfWh
pb780Ds4xRNSRWuFEIxeUe+IRwKwkkaYCz4Gz+jzo9vwkrGgcGYGsF3qvdtOqVOQ
yxZGJND3I9CfJN56hM8/ErK66L59efmdAttDmVbVT40lFBcTPH0m2PmW5yjIhkuO
vX3A7fiQ8la2BEmvNCY+BucPzaI+JQG2S5rc6ZVSry9YDZf4RjQ9YGRrONK6xCH+
ODu8zSuC8G81vgnXk4r0GZavhrwtS6OuEScQDOTOUi3LBxCmw9RM5UJssnXxw/Xh
K6PsKZK4N6OGRQ21qY0DHBoJbGQ/Vs+XmCXmSDIOUASMHeV08KQDOzj95aePuJ5m
/XatFXfJhIe62CJ0Hahc3UDaEyPf1CNr5BctxLHTA5qx20aPDFsvs00Sx6vRmPU1
LrHSIWL26torBg6Xkr3Ac16x5HnyydvmjF+3WYmTqqrvkZ+6qrnUczeUFxRFogip
xNo6FG6vb+S7y6Y4SNXDvFzZ6obK
=Oz54
-----END PGP SIGNATURE-----

--a2TxIXqLu79lWIJmdcpeeAqpH3DfRmnBA--
