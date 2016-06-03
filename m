Received: by 10.25.27.66 with SMTP id b63csp998867lfb;
        Thu, 2 Jun 2016 18:17:50 -0700 (PDT)
X-Received: by 10.140.168.131 with SMTP id o125mr960243qho.101.1464916669975;
        Thu, 02 Jun 2016 18:17:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x7si960319qkb.24.2016.06.02.18.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 18:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8dkD-0007zS-F8
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 21:17:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1b8djF-0007bA-KI
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 21:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1b8djD-0006fk-Au
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 21:16:48 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1b8djC-0006fc-Ul; Thu, 02 Jun 2016 21:16:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rLR596Fdjz9t88; Fri,  3 Jun 2016 11:16:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1464916605;
	bh=Rb0cOaYrfawvRPVYUanKhObdHHv0m4If8tjkv59pV3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7p2ByhHlMckQs0WJ/jFAOAfwvWjavijpC8MQRRiG7UAExHggmryMAvkLrpv/bBK5
	Wj9jGdFyrzBn2xOzIlG51MaFTfEWxmV3O9FuYLor+AGgTJnINTKE8wB1jRZ+0Iaf9s
	RobOEXITRxjT3LUjmntbdtUE4o0xXnv5c/Iony88=
Date: Fri, 3 Jun 2016 11:16:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <gkurz@linux.vnet.ibm.com>
Message-ID: <20160603011604.GE1087@voom.fritz.box>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
	<20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
	<0818d93b-358a-647d-b14b-698ae74031a1@redhat.com>
	<20160601023328.GB15455@voom.fritz.box>
	<20160602180437.02f3ed85@bahia.huguette.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bi5JUZtvcfApsciF"
Content-Disposition: inline
In-Reply-To: <20160602180437.02f3ed85@bahia.huguette.org>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH] virtio: move bi-endian target support to a
 single location
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ot+6mValmLGl


--bi5JUZtvcfApsciF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2016 at 06:04:37PM +0200, Greg Kurz wrote:
> On Wed, 1 Jun 2016 12:33:28 +1000
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, May 31, 2016 at 03:15:21PM +0200, Paolo Bonzini wrote:
> > >=20
> > >=20
> > > On 31/05/2016 15:10, Greg Kurz wrote: =20
> > > >>> > > +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
> > > >>> > > +#define LEGACY_VIRTIO_IS_BIENDIAN 1
> > > >>> > > +#endif   =20
> > > >> >=20
> > > >> > These will only be correct if something else includes cpu.h.  In=
stead of =20
> > > > Unless I missed something, the TARGET_* macros come from the genera=
ted
> > > > config-target.h header, which is in turn included by qemu/osdep.h a=
nd
> > > > thus included by most of the code. =20
> > >=20
> > > You're right.  Problems _could_ happen if virtio-access.h is included=
 in
> > > a file compiled without -DNEED_CPU_H (i.e. with common-obj-y instead =
of
> > > obj-y) but include/exec/poison.h should take care of that.
> > >  =20
> > > >> > defining this, you should add
> > > >> >=20
> > > >> > #include "cpu.h"
> > > >> >=20
> > > >> > at the top of include/hw/virtio-access.h and leave the definitio=
ns in
> > > >> > target-*/cpu.h.
> > > >> >  =20
> > > > All this bi-endian stuff is really an old-virtio-only thing... it is
> > > > only to be used by virtio_access_is_big_endian(). The fact that it
> > > > broke silently with your cleanup series is yet another proof that
> > > > this workaround is fragile. =20
> > >=20
> > > It is not fragile actually.  cpu.h doesn't exist in common-obj-y, so =
the
> > > TARGET_IS_BIENDIAN define can be safely taken from cpu.h.
> > >=20
> > > Anyway because of poison.h your solution isn't fragile either, so
> > >=20
> > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com> =20
> >=20
> > Should I take this through my tree?
> >=20
>=20
> That would be great !

Actually, that was a question for Paolo..


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bi5JUZtvcfApsciF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXUNpUAAoJEGw4ysog2bOSpOAP/1cUsuLU/EMthfrCZT/Cs18K
zjj4trllX4QYEE6PlUwvmm2G8fKdz35DfbfqlP0UnR9L2+DHNCwc3pmgsa8e2oIx
w2bj6EG7cZD9nCqet2SS1DBF3t9VuWzObkelX0Sl0zH6eH4tfTk3Rn3ClVd8jc0b
uqcpv6RumTa/NtYgMF7la6AjhVxFdwSJCDYGI06e3+8EeegkqUiUwMmGDe+Wg+Gm
P1yNvcLNrF87qBw65Sqc/oK67fzN9ILi57BEgVfYWi5opjlqdXimAIganW0iPctu
bKOMoGvv+CpBiHZdd5xG86/mxYTFiCZgzUY7asWvGo3lpdQXqegMdsx6OShRb7/c
Zomue2+rqDtSzWMiyaD+6Sr80ta4lUjW0mB7e74edSR2pgpDnAy8t3pGX65kFrTw
h8i/JWOt0US/my9Za940AEHpFYkBixqtpINFbIlb/Q/O43BkuFV0VHHaKoD0Y4IO
orbxrkl8rk8RwSAh1Sk1qktuuZEeS0zaol78NMpdX/qCniCyAoT32yyYzuhfnu7U
9FJ/+gVB5c/jtIj3Zr1puyHqEQMti6SdsXzc9SjWS90aroIN4OuhkqAyCge8EbkC
0BM1qjf7Jk0DJbcCSyHkXPPuvHM9+jb0mT9abD1uxygVv+qFPXoZLYk9Vyb19MZ+
3Ry0s//VK5p5VHwuaBiS
=H2rG
-----END PGP SIGNATURE-----

--bi5JUZtvcfApsciF--
