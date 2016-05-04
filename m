Received: by 10.25.208.137 with SMTP id h131csp195986lfg;
        Wed, 4 May 2016 07:31:05 -0700 (PDT)
X-Received: by 10.195.3.1 with SMTP id bs1mr9591500wjd.160.1462372265384;
        Wed, 04 May 2016 07:31:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l186si5465698wml.88.2016.05.04.07.31.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 07:31:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axxpA-0001eA-8o
	for alex.bennee@linaro.org; Wed, 04 May 2016 10:30:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1axxoz-0001Pd-JM
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1axxon-0001uP-CN
	for qemu-arm@nongnu.org; Wed, 04 May 2016 10:30:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46038)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1axxon-0001s0-8C; Wed, 04 May 2016 10:30:25 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E9EF83F45;
	Wed,  4 May 2016 14:30:08 +0000 (UTC)
Received: from [10.3.113.21] (ovpn-113-21.phx2.redhat.com [10.3.113.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u44EU7Jl007722; Wed, 4 May 2016 10:30:07 -0400
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1462371352-21498-1-git-send-email-peter.maydell@linaro.org>
	<1462371352-21498-2-git-send-email-peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <572A076F.3090808@redhat.com>
Date: Wed, 4 May 2016 08:30:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1462371352-21498-2-git-send-email-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="flE6KtTE6VTMcV0LE7BJBibPtqSr74Dad"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/display/blizzard: Expand out macros
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
X-TUID: djbL6p39aKPS

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--flE6KtTE6VTMcV0LE7BJBibPtqSr74Dad
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/04/2016 08:15 AM, Peter Maydell wrote:
> Now that we can assume that only depth 32 is possible, there's no need
> for the COPY_PIXEL1 and PIXEL_TYPE macros, and the SKIP_PIXEL, COPY_PIX=
EL
> and SWAP_WORDS macros aren't used at all. Expand out COPY_PIXEL1 and
> PIXEL_TYPE where they are used, delete the unused macro definitions, an=
d
> expand out the uses of glue(name_prefix, DEPTH).
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/blizzard_template.h | 55 +++++++++++++---------------------=
--------
>  1 file changed, 17 insertions(+), 38 deletions(-)

I might have broken into more patches, one per macro expansion; but the
final patch was still small enough to review when merged, so keep it the
way you have it.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--flE6KtTE6VTMcV0LE7BJBibPtqSr74Dad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJXKgdvAAoJEKeha0olJ0Nq/l4H/1IKdknUwhiqdRRvYIGjdGXL
QEeFGkGCq6ijI7w6wRDib1pNM7uXWChliP69sRS3ziHBLmctaIU3BYogplULfGIs
uTNvQt347lxWNYus0FIdsypxBg5yY0UjVgqvmDQGYVv+wh2rM+IdBYzENoxJpZlG
P7/ZFQWuLUqkUlOgG+ebPaqE+YxxxxnXLi3hmS41MqJdX3XhFQs6S6148PNqPVPf
EqNvacKYin//J2VWefztDeFkHTBnPm3cmzFPv3MsiHuk3sB65xcxa1EY7KA248bi
gwceyvRaZluNVR8ILy+dVvB04BT9cr2Z0Fc73AsWLpJSVDfJIdbOZ3JNhb5Fbb4=
=AOOu
-----END PGP SIGNATURE-----

--flE6KtTE6VTMcV0LE7BJBibPtqSr74Dad--
