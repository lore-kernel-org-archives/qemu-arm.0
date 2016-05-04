Received: by 10.25.208.137 with SMTP id h131csp196827lfg;
        Wed, 4 May 2016 07:32:37 -0700 (PDT)
X-Received: by 10.28.27.17 with SMTP id b17mr9522484wmb.19.1462372357671;
        Wed, 04 May 2016 07:32:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h62si5312313wma.124.2016.05.04.07.32.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 07:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axxqe-00042y-Fh
	for alex.bennee@linaro.org; Wed, 04 May 2016 10:32:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1axxqU-0003kG-IA
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:32:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1axxqI-0002Um-IC
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:32:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1axxqI-0002NO-7R; Wed, 04 May 2016 10:31:58 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE33762641;
	Wed,  4 May 2016 14:31:41 +0000 (UTC)
Received: from [10.3.113.21] (ovpn-113-21.phx2.redhat.com [10.3.113.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u44EVf23010124; Wed, 4 May 2016 10:31:41 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
	<1462371352-21498-3-git-send-email-peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <572A07CC.4070004@redhat.com>
Date: Wed, 4 May 2016 08:31:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1462371352-21498-3-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="FJDulp0WCIQXRtouNUOMxGnTbwbjSEdnL"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 04 May 2016 14:31:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/display/blizzard: Remove
 blizzard_template.h
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Pooja Dhannawat <dhannawatpooja1@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u75TqdS2PbXM

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FJDulp0WCIQXRtouNUOMxGnTbwbjSEdnL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/04/2016 08:15 AM, Peter Maydell wrote:
> We no longer need to do the "multiply include this header" trick with
> blizzard_template.h, and it is only used in a single .c file, so just
> put its contents inline in blizzard.c.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/blizzard.c          | 79 +++++++++++++++++++++++++++++++++-=

>  hw/display/blizzard_template.h | 97 ----------------------------------=
--------
>  2 files changed, 77 insertions(+), 99 deletions(-)
>  delete mode 100644 hw/display/blizzard_template.h
>=20

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--FJDulp0WCIQXRtouNUOMxGnTbwbjSEdnL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXKgfMAAoJEKeha0olJ0NqEG8H/RwLJph1mYanQ2coD0vSwTNa
WheJX6EhM99q2L6ckXfQTM4HE9dcsrVyoFaast/39T3q3IjzPzORc5I3PC2QR2Ro
XOEl/kXDS+2nXLMAka1G1hUNzMyDLc1qrXJdOtU2y2VRyy9P48znjzMuzSBu8AT2
IfZOkZ8G8OpgypFA1Y/V+xcRPuiXru9rwZkxLvF2JC+rl5UdG15SrZkXduqprlyj
c2yzfBNdriYOHPUJkgyPK7OuQZ+ex0yHGwQpDLiVxbZpUwSXuS4HdLacVLJxmlBC
m/hFHtVxIPnwpJUc35HMh4dOzo9O4Np49PbZY5AW/QPz70t9b80bsgF83hicrFk=
=2/+5
-----END PGP SIGNATURE-----

--FJDulp0WCIQXRtouNUOMxGnTbwbjSEdnL--
