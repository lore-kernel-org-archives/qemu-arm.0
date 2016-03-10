Received: by 10.25.208.211 with SMTP id h202csp663052lfg;
        Thu, 10 Mar 2016 13:11:04 -0800 (PST)
X-Received: by 10.55.192.154 with SMTP id v26mr7090647qkv.36.1457644264133;
        Thu, 10 Mar 2016 13:11:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a29si5343731qkj.13.2016.03.10.13.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Mar 2016 13:11:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ae7rL-0005BQ-Il
	for alex.bennee@linaro.org; Thu, 10 Mar 2016 16:11:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ae7rI-0005B5-HM
	for qemu-arm@nongnu.org; Thu, 10 Mar 2016 16:11:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1ae7rF-0002oM-B8
	for qemu-arm@nongnu.org; Thu, 10 Mar 2016 16:11:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1ae7rF-0002oI-5L; Thu, 10 Mar 2016 16:10:57 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 5D69D78252;
	Thu, 10 Mar 2016 21:10:55 +0000 (UTC)
Received: from [10.3.113.30] (ovpn-113-30.phx2.redhat.com [10.3.113.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2ALAqxm023138; Thu, 10 Mar 2016 16:10:52 -0500
To: rutu.shah.26@gmail.com, qemu-devel@nongnu.org
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56E1E2DB.1020603@redhat.com>
Date: Thu, 10 Mar 2016 14:10:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="tfcjdccEePaiOGLURoRfKdwP3V3Ctqjjl"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, mst@redhat.com,
	jasowang@redhat.com, mark.cave-ayland@ilande.co.uk,
	agraf@suse.de, kraxel@redhat.com, qemu-block@nongnu.org,
	armbru@redhat.com, borntraeger@de.ibm.com,
	samuel.thibault@ens-lyon.org, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, stefanha@redhat.com, imammedo@redhat.com,
	cornelia.huck@de.ibm.com, lcapitulino@redhat.com,
	jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
	blauwirbel@gmail.co, qemu-ppc@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Replacing (and removing)
 get_ticks_per_sec() function with NANOSECONDS_PER_SECOND Signed-off-by:
 Rutuja Shah <rutu.shah.26@gmail.com>
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
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
X-TUID: 4JME4vvdeDZM

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tfcjdccEePaiOGLURoRfKdwP3V3Ctqjjl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/10/2016 12:30 PM, rutu.shah.26@gmail.com wrote:
> From: Rutuja Shah <rutu.shah.26@gmail.com>
>=20

Your commit message body was botched, cramming everything into the
subject line.  Be sure you have a one-line summary (preferably shorter
than 60 characters), then a blank line, before the rest of your
description and S-o-b.  Also, it's good to say "why" in the commit body,
not just "what".  Something like:

maint: Drop unused get_ticks_per_sec()

Replace the use of get_ticks_per_sec() with NANOSECONDS_PER_SECOND,
because...

Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--tfcjdccEePaiOGLURoRfKdwP3V3Ctqjjl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW4eLbAAoJEKeha0olJ0NqANIH/2RB/4LcJTzBeytntFeoIkum
sgG+UVLghZV74go5VBDYNXIr5QAuUIS2TnF6xHEl/BysInjKJvBJYo63OWZJVosA
3vMR4x3q+HCMvpKpKQMvt/dhR6JP07wc1HHIQjKcuJmrAMEqm67+yWSYnfXObCt3
DafQjN1csL7e+6oOQLVVP44k9QmUWBofvQTSyuqHVW/rDZOkG7WAXirt++hiI22S
NVpj26NilKYs/9B19YoXaNhNARW58nHYruPqLwfi0fJNEH960BAlNCUog/5OirSe
ht8YKOi401riXs0zLH48aI9sXtEDw06aVuvdZTnLSzw3hoTwjZU7FT7gWBXU1xs=
=SHpS
-----END PGP SIGNATURE-----

--tfcjdccEePaiOGLURoRfKdwP3V3Ctqjjl--
