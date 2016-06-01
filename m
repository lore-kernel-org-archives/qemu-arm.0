Received: by 10.25.27.66 with SMTP id b63csp2395985lfb;
        Tue, 31 May 2016 19:33:58 -0700 (PDT)
X-Received: by 10.55.214.89 with SMTP id t86mr23032880qki.180.1464748437989;
        Tue, 31 May 2016 19:33:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6si13644884qtb.91.2016.05.31.19.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 19:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7vyn-0000JA-Ao
	for alex.bennee@linaro.org; Tue, 31 May 2016 22:33:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1b7vyi-0000Ig-FE
	for qemu-arm@nongnu.org; Tue, 31 May 2016 22:33:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1b7vye-0002CB-4Y
	for qemu-arm@nongnu.org; Tue, 31 May 2016 22:33:51 -0400
Received: from ozlabs.org ([103.22.144.67]:33515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1b7vyd-0002Bv-PW; Tue, 31 May 2016 22:33:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rKDtx6V7Jz9t41; Wed,  1 Jun 2016 12:33:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1464748425;
	bh=8y+bhhe95+W2oJnELBJEXAsorIgCZYYOfiWnOHpkaHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4ocx1KCWMJs57m/asL+JJzv4CPUFbboohdnw712LcIYMQFhGTS91AkmpaSBt5XXA
	iBQQgSYMhY5ESCNCRyZAyXQaLgb8vuv/j/WUwVWZ6i6lfwRVFjpUxlk6/pjNCrMITD
	tcnvxmWN0h2rJVQgI5nj0uW3Jzlx6r60xCsV2jQk=
Date: Wed, 1 Jun 2016 12:33:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160601023328.GB15455@voom.fritz.box>
References: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
	<81bca811-db78-ffd2-dbfc-67e14ae88ce2@redhat.com>
	<20160531151029.605aebb1@bahia.lab.toulouse-stg.fr.ibm.com>
	<0818d93b-358a-647d-b14b-698ae74031a1@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline
In-Reply-To: <0818d93b-358a-647d-b14b-698ae74031a1@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH] virtio: move bi-endian target support to a
 single location
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Greg Kurz <gkurz@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pBlkGXthc+KF


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2016 at 03:15:21PM +0200, Paolo Bonzini wrote:
>=20
>=20
> On 31/05/2016 15:10, Greg Kurz wrote:
> >>> > > +#if defined(TARGET_PPC64) || defined(TARGET_ARM)
> >>> > > +#define LEGACY_VIRTIO_IS_BIENDIAN 1
> >>> > > +#endif =20
> >> >=20
> >> > These will only be correct if something else includes cpu.h.  Instea=
d of
> > Unless I missed something, the TARGET_* macros come from the generated
> > config-target.h header, which is in turn included by qemu/osdep.h and
> > thus included by most of the code.
>=20
> You're right.  Problems _could_ happen if virtio-access.h is included in
> a file compiled without -DNEED_CPU_H (i.e. with common-obj-y instead of
> obj-y) but include/exec/poison.h should take care of that.
>=20
> >> > defining this, you should add
> >> >=20
> >> > #include "cpu.h"
> >> >=20
> >> > at the top of include/hw/virtio-access.h and leave the definitions in
> >> > target-*/cpu.h.
> >> >=20
> > All this bi-endian stuff is really an old-virtio-only thing... it is
> > only to be used by virtio_access_is_big_endian(). The fact that it
> > broke silently with your cleanup series is yet another proof that
> > this workaround is fragile.
>=20
> It is not fragile actually.  cpu.h doesn't exist in common-obj-y, so the
> TARGET_IS_BIENDIAN define can be safely taken from cpu.h.
>=20
> Anyway because of poison.h your solution isn't fragile either, so
>=20
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Should I take this through my tree?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXTkl4AAoJEGw4ysog2bOSFdoQAMFWbCYvKmzyydaEf1zsIVmV
TELvgB3pkduKVUHiN9rB6ioFI6Q7o21nRtJEuzqBWRSgERYIBIf/DO6izYYyGTSg
JWZ335N3pA2q6iKlYLlRKV8WozCOgCJC2B+OCBoqsryqsVBJPE2KoAMOGo9tnx0Y
mMy10r4l80IOsyPpGo18/Ruxwu0RarF943cl9wV2nxOkjvUIS3VZh98LmYj3k8Av
D3PHUVypW9VINBdFSCpK3FpDo3+AGrgWxkR1bpxGWhktClGVwB+QkOql7ewoN1RX
4R2DsSjtepGUfVQyob7st9wcu0NYlGkRn9NtWwti7mM4EP1FVlHkHJ/J7TnUcnNE
XU9tzZewpuJN0Q5pFfpNqOlIIcwPYHHjrvqdo3zz88HEZ+vTsNHFCZsOpElbZ77g
y2/1StydScrMw8Wkc9IytDUXDk1GdFZDUBn+C1y//fdVtAl0heXK5ZWOVcKr3TdP
CwjARmDY+hG+dk221a89F/vyO8ye/abx3lnAWBzbEGSK4LV2ZlimkBBRFWPqISD8
pKJV1lsGTxpHHphodoqEYzGkQOWlBGnzWHgP9pDeS1PZ6EDxj/UxyenB5GHAeNrl
Ipcy73nkYFQOc96mwAHJ1Kx2RkAOo7ZxeB7YYWqrF1CnjN2ZlPjrGKcpKnTzk5lM
7rpb4RK024Z1r3v3ChSn
=uQ/N
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
