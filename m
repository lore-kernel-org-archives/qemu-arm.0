Received: by 10.25.0.144 with SMTP id 138csp517831lfa;
        Wed, 12 Apr 2017 17:04:48 -0700 (PDT)
X-Received: by 10.55.24.202 with SMTP id 71mr266074qky.190.1492041888224;
        Wed, 12 Apr 2017 17:04:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p18si20963533qtc.21.2017.04.12.17.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Apr 2017 17:04:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cySFh-0008KF-Kp
	for alex.bennee@linaro.org; Wed, 12 Apr 2017 20:04:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cySFe-0008K9-I7
	for qemu-arm@nongnu.org; Wed, 12 Apr 2017 20:04:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1cySFb-0008Og-EB
	for qemu-arm@nongnu.org; Wed, 12 Apr 2017 20:04:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1cySFb-0008Ob-59; Wed, 12 Apr 2017 20:04:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E651F61D02;
	Thu, 13 Apr 2017 00:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E651F61D02
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E651F61D02
Received: from [10.10.122.61] (ovpn-122-61.rdu2.redhat.com [10.10.122.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA37B18EFD;
	Thu, 13 Apr 2017 00:04:34 +0000 (UTC)
To: qemu-devel@nongnu.org, omar.rizwan@gmail.com
References: <149204143506.10500.9312462203357418218@6c512846dbc7>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <f52ad9a6-c3e7-4823-c21c-091809780341@redhat.com>
Date: Wed, 12 Apr 2017 19:04:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <149204143506.10500.9312462203357418218@6c512846dbc7>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="N9Ic3KCCNaEKdegA4a6u8iUSMindfqXEB"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 13 Apr 2017 00:04:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] raspi: Add Raspberry Pi 1
 support
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, famz@redhat.com,
	Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 92TYqUxwZ8J1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--N9Ic3KCCNaEKdegA4a6u8iUSMindfqXEB
Content-Type: multipart/mixed; boundary="jjtKrswklhP976KqNiewpKKsWEkgmF0tF";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org, omar.rizwan@gmail.com
Cc: peter.maydell@linaro.org, famz@redhat.com, Andrew.Baumann@microsoft.com,
 qemu-arm@nongnu.org
Message-ID: <f52ad9a6-c3e7-4823-c21c-091809780341@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] raspi: Add Raspberry Pi 1 support
References: <149204143506.10500.9312462203357418218@6c512846dbc7>
In-Reply-To: <149204143506.10500.9312462203357418218@6c512846dbc7>

--jjtKrswklhP976KqNiewpKKsWEkgmF0tF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04/12/2017 06:57 PM, no-reply@patchew.org wrote:
> Hi,
>=20
> This series seems to have some coding style problems. See output below =
for
> more information:

> =3D=3D=3D OUTPUT BEGIN =3D=3D=3D
> Checking PATCH 1/1: raspi: Add Raspberry Pi 1 support...
> ERROR: line over 90 characters
> #189: FILE: hw/arm/raspi.c:34:
> + * https://github.com/AndrewFromMelbourne/raspberry_pi_revision/blob/2=
764c19983fb7b1ef8cb21031e94c293703afa2e/README.md

You can shorten this:

https://github.com/AndrewFromMelbourne/raspberry_pi_revision/blob/2764c19=
9/README.md

to fit under 90, while still resolving to the same place (collisions
with just an 8-char prefix are rare enough to generally not be an issue
to git)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--jjtKrswklhP976KqNiewpKKsWEkgmF0tF--

--N9Ic3KCCNaEKdegA4a6u8iUSMindfqXEB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY7sCRAAoJEKeha0olJ0NqvqkH+QEUpVoC9Iicoo/W31K+D3gp
SGdJYCCyp/gpjn2gJYkxpJ5ckcPCYwjtCa461fn2CVyAMtWZ0Tysg3wH/ud4+lpu
ijcSkIn5CxePfj0QBDkfnplcGZ5rOKCUqRxMX89JS6psg6Mg5lbiP8UtQ6qhGhIR
zy6jYGGkhpL4h1LAjbmF1Vi4xZyN2Q797ocdtO7G210dv7bu+D7skw5/vQcNzn+L
AixwwwOlpi9DlMGi6zI8D8QlYxrcX32vv/etMbED60g9J/Ptb5LVIZOuH8rE8Kbw
bCTqidurFfGkqihRDBr3N9HLyYLlK1eT3WwfHdAaiua8obOFn0AYsYyAmtl3Gsw=
=n51A
-----END PGP SIGNATURE-----

--N9Ic3KCCNaEKdegA4a6u8iUSMindfqXEB--
