Received: by 10.25.87.130 with SMTP id l124csp507431lfb;
        Wed, 7 Sep 2016 14:40:37 -0700 (PDT)
X-Received: by 10.55.114.193 with SMTP id n184mr55249098qkc.4.1473284437283;
        Wed, 07 Sep 2016 14:40:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f65si26483712qkj.9.2016.09.07.14.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 14:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhkaC-0004mF-6e
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 17:40:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bhkSY-00054h-SZ
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 17:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bhkSU-0006pu-Ko
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 17:32:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bhkSU-0006pZ-Cs; Wed, 07 Sep 2016 17:32:38 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6D7181253;
	Wed,  7 Sep 2016 21:32:37 +0000 (UTC)
Received: from [10.3.116.152] (ovpn-116-152.phx2.redhat.com [10.3.116.152])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u87LWbSc014410; Wed, 7 Sep 2016 17:32:37 -0400
To: Dmitry Osipenko <digetx@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
References: <cover.1473252818.git.digetx@gmail.com>
	<1de89fe6e1ccaf6c8071ee3469e1a844df948359.1473252818.git.digetx@gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <c5767f15-d7cc-932e-a272-4f7d990d656a@redhat.com>
Date: Wed, 7 Sep 2016 16:32:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1de89fe6e1ccaf6c8071ee3469e1a844df948359.1473252818.git.digetx@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="o2XQ9bKrlp61Fn0caIpHSddCaBe78itHe"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 07 Sep 2016 21:32:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v16 03/16] tests: Add ptimer
 tests
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EmGrCyIGYo9L

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--o2XQ9bKrlp61Fn0caIpHSddCaBe78itHe
Content-Type: multipart/mixed; boundary="oxNlmodIM1IUloSproSm9h5XaxotUlJ7J"
From: Eric Blake <eblake@redhat.com>
To: Dmitry Osipenko <digetx@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>
Message-ID: <c5767f15-d7cc-932e-a272-4f7d990d656a@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v16 03/16] tests: Add ptimer tests
References: <cover.1473252818.git.digetx@gmail.com>
 <1de89fe6e1ccaf6c8071ee3469e1a844df948359.1473252818.git.digetx@gmail.com>
In-Reply-To: <1de89fe6e1ccaf6c8071ee3469e1a844df948359.1473252818.git.digetx@gmail.com>

--oxNlmodIM1IUloSproSm9h5XaxotUlJ7J
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09/07/2016 08:22 AM, Dmitry Osipenko wrote:
> Ptimer is a generic countdown timer helper that is used by many timer
> device models as well as by the QEMU core. Add QTests for the ptimer.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

> --- /dev/null
> +++ b/tests/ptimer-test-stubs.c
> @@ -0,0 +1,107 @@
> +/*
> + * Stubs for the ptimer-test
> + *
> + * Author: Dmitry Osipenko <digetx@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + *

I'm not a lawyer, but my reading of the GPL says that for it to be
enforceable, someone has to claim copyright (in other words, it works
BECAUSE of copyright law).  Yeah, you may already have implicit rights
based on country of origin, but it's always safer to add an explicit
Copyright line; if for no other reason than to be consistent with what
most other files do.

Also, are these new files covered by an addition to MAINTAINERS?

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--oxNlmodIM1IUloSproSm9h5XaxotUlJ7J--

--o2XQ9bKrlp61Fn0caIpHSddCaBe78itHe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX0Id0AAoJEKeha0olJ0NqMMsH/0r3UCI6My4pSuO9VnKdSUZA
7zr1dJG+wkOKP4HzUlzsuVa6j6d+doH6+AN/JL7Ij8w8/0ag9I8WXuvEtR9RTCsp
70nK8hd9j67QsdyYBnfuczLwpOwjXiQAz9SMYVhQstVfUvXmd2GtN9dTm/iWYrCr
YNTUaNxr/6mf8W+v6H+NkuCLC8mHx3fsVQODq1+27KzZxeTo/itlBLq3SfhH/XHL
dGOfXHdTnTw4E0GHi0ez7Nd6J2UeLYPUikIi+38GvSrClB59FwdfxrX3adrGs6CJ
hG1DJOEkr6lCDFsPUNFxEEfuxJy+bo0TxpKs7fsGrsKu2F7L7A7f5qR8OnHa3/s=
=ObY/
-----END PGP SIGNATURE-----

--o2XQ9bKrlp61Fn0caIpHSddCaBe78itHe--
