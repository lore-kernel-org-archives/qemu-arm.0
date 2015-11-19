Received: by 10.182.158.201 with SMTP id ww9csp2020900obb;
        Thu, 19 Nov 2015 07:23:10 -0800 (PST)
X-Received: by 10.31.163.85 with SMTP id m82mr5473273vke.158.1447946590054;
        Thu, 19 Nov 2015 07:23:10 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a66si4465878vke.94.2015.11.19.07.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Nov 2015 07:23:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzR3F-0004QD-Is
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 10:23:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZzR2R-0003If-8S
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ZzR2Q-0000hs-CD
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48061)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ZzR2L-0000gP-Q7; Thu, 19 Nov 2015 10:22:13 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 2C638C100457;
	Thu, 19 Nov 2015 15:22:10 +0000 (UTC)
Received: from [10.3.113.208] (ovpn-113-208.phx2.redhat.com [10.3.113.208])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAJFM9Dn023028; Thu, 19 Nov 2015 10:22:09 -0500
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
	<1447944817-13286-2-git-send-email-drjones@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <564DE921.80806@redhat.com>
Date: Thu, 19 Nov 2015 08:22:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447944817-13286-2-git-send-email-drjones@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="G7pKv729dLC5gv1PJ2SapXGcXXG3JTV5f"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, afaerber@suse.de, rth@twiddle.net
Subject: Re: [Qemu-devel] [PATCH 1/5] qapi-schema: dump-guest-memory:
	Improve text
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
X-TUID: tyIZnqUr01Uu

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--G7pKv729dLC5gv1PJ2SapXGcXXG3JTV5f
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/19/2015 07:53 AM, Andrew Jones wrote:
> dump-guest-memory is supported by more than just x86, however
> the paging option is not.
>=20
> (No functional change.)
>=20
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  qapi-schema.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--G7pKv729dLC5gv1PJ2SapXGcXXG3JTV5f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWTekhAAoJEKeha0olJ0NqUr0H/jwhQEACeSyzYWzUrp6UyGoe
xQXSdEI2G1xAWhUXf5wBgxEkoEb3QF9JVP5am9xgPKLo/rlUGyuMuv2dKQlt7qN/
qGcXX5/Me9uWb4t/K5vQ5EkSESeTPmMdpI/tk5ur8FJvCZ93k5LvwseIKdhULMfN
X6pL3Ga+Sy3ddDAQXdXFVdxijufVJ4VuSlTIlY5nxxqVi+2DosYlrJWtD2QYpkWM
SCUEdD4WwsU+dY1uWx//nBsQ8t2K2AzAiKWreOx27L0U6fp5wuVO21yMaMEtonlJ
7C3T0lAlU1gHHoG/X2g9vfnYQOmNMC5Lkm/lcY2ATnS6YLPq8BTgAuyAD8WH9Oo=
=JdTN
-----END PGP SIGNATURE-----

--G7pKv729dLC5gv1PJ2SapXGcXXG3JTV5f--
