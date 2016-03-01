Received: by 10.25.208.211 with SMTP id h202csp1444326lfg;
        Mon, 29 Feb 2016 21:27:42 -0800 (PST)
X-Received: by 10.140.16.225 with SMTP id 88mr24598187qgb.96.1456810062387;
        Mon, 29 Feb 2016 21:27:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 110si3582066qgy.36.2016.02.29.21.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Feb 2016 21:27:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aacqT-0002R5-Kh
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 00:27:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aacq3-00027D-Ax
	for qemu-devel@nongnu.org; Tue, 01 Mar 2016 00:27:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aacpz-0001PU-Ao
	for qemu-devel@nongnu.org; Tue, 01 Mar 2016 00:27:15 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=34825 helo=mail.weilnetz.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aacpz-0001PQ-40
	for qemu-devel@nongnu.org; Tue, 01 Mar 2016 00:27:11 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id E717911810AA;
	Tue,  1 Mar 2016 06:27:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Lyipv4dqGZDW; Tue,  1 Mar 2016 06:27:07 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (p54AC93F9.dip0.t-ipconnect.de
	[84.172.147.249])
	by mail.weilnetz.de (Postfix) with ESMTPSA id 7B68611810A3;
	Tue,  1 Mar 2016 06:27:06 +0100 (CET)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-devel@nongnu.org
References: <cover.1453100525.git.crosthwaite.peter@gmail.com>
From: Stefan Weil <sw@weilnetz.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <56D52825.1010107@weilnetz.de>
Date: Tue, 1 Mar 2016 06:27:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1453100525.git.crosthwaite.peter@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uHnVGkCuGHABnpmdxo4SUFQfT1dHS8qMi"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Cc: peter.maydell@linaro.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
	alistair.francis@xilinx.com, sridhar_kulk@yahoo.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, piotr.krol@3mdeb.com
Subject: Re: [Qemu-devel] [PATCH v1 00/17] ARM big-endian and setend support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TJg1fe9Q9ZWC

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uHnVGkCuGHABnpmdxo4SUFQfT1dHS8qMi
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Am 18.01.2016 um 08:12 schrieb Peter Crosthwaite:
> Hi All,
>
> This patch series adds system-mode big-endian support for ARM. It also
> implements the setend instruction, and loading of BE binaries even in
> LE emulation mode.
>
> Based on Paolo's original work. I have moved all the BE32 related work
> to the back of the series. Multiple parties are interested in the BE8
> work just on its own, so that could potentially be merged w/o BE32.
> PMM requested BE32 be at least thought out architecturally, so this
> series sees BE32 functionality through.
>
> I have tested all of LE. BE8 and BE32 in both linux-user mode (for
> regressions) and system mode (BE8 and BE32 are new here).
> My test application is here, the README gives some example command
> lines you can run:
>
> https://github.com/pcrost/arm-be-test
>
> Regards,
> Peter

It would be nice to get at least the emulation for 'setend' into the
next version, because it is needed for the Raspberry Pi emulation.

Peter C., are you planning a new pull request? Maybe the number
of commits needed can be reduced by adding the already reviewed
ones to QEMU.

Regards,
Stefan



--uHnVGkCuGHABnpmdxo4SUFQfT1dHS8qMi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJW1SgqAAoJEOCMIdVndFCt2dcP/0fCGWqhe3HinEx9RuIZY0MO
dzQkY8JUNtpJMU2VNRiZP5K11jv8jdw6JIkrSnhmwZ5lSTvTa0MPbr2Z6/U9WRSz
jMD0EjYy85waJJChHQ9Xyd7jNRSYuBAHhUb22e+xLypiodQLamytN9+462iZTpXw
9byZeuTSmEJjJMPPN8lD/rgc724pWHTX6GAmRmzzzn2AZNKqxU3rCky4Ll0btPOz
6i1siw7WRKG4YuochS39d03uPc1E/jUCP8D4kKjXNUfm4V9QKsJurfNJIzB9nXTr
WE1ECI4693DWrGDsSTYKNYDge6Fd7A5iPxDlkIUtSZxwWvgzwSo3UaUd2MqvS6g1
SR8pvVxD4L2eoGImvEcJMGaoshB75jnft+vj2JBjIxH7u1DsR+A6Wb75bN/oxEPv
0jyINUd1mLHFh2i3zaoZ9zAL8FaMYo4XsT9A/Oj7davbO3OqppM90IFlbYF1eT5Y
/+Ct2ySLYkM4aM3Zo2iNyY1dABaT/MSIQDzV4QadbgSkDN+ZmYXpZGmyYK1tSnHN
UVrT+V8Nbml+8gdMU23itaKSnARa4bWZ9SgKgPQiS1477ZOJxFezsWib2WZXUVen
iMlL8DW7js6U3Dz+CQyHAoURbK3iHaLY8DZJ8N+UCBqpAmb4J/G1tZrxraDX4KhM
gJ2yZp26KcVY9lW1jMFv
=UD0c
-----END PGP SIGNATURE-----

--uHnVGkCuGHABnpmdxo4SUFQfT1dHS8qMi--
