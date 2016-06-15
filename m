Received: by 10.25.21.96 with SMTP id l93csp315925lfi;
        Tue, 14 Jun 2016 17:59:42 -0700 (PDT)
X-Received: by 10.55.70.66 with SMTP id t63mr20538737qka.162.1465952382401;
        Tue, 14 Jun 2016 17:59:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u31si12193868qge.68.2016.06.14.17.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 17:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCzBF-00082l-Pd
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 20:59:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB7-00080n-MM
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB3-0007eR-Mx
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:33 -0400
Received: from ozlabs.org ([103.22.144.67]:38908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCzB2-0007db-VS; Tue, 14 Jun 2016 20:59:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTp7Z1Jl0z9t1K; Wed, 15 Jun 2016 10:59:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465952362;
	bh=C41MwvbHMbnYjexeX1Sn4SQvJWZgrWj2tB8pmzm6HuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLJdB1zSSH6qApiFHAdwq2kqF0SH+T32/uZlQ4N1lhP4ZiJM9et4HKv+InZ6IHJj+
	VUKRp4Nkx64+KnMUPbrYW7g23umgdSR4MR+1d0WbfRFdARtkeOVlA8XE4YxuxXZjrF
	KJFUqrkKs0cHXwQGkbQOJDEdYLIwScGnZjvx4/Y0=
Date: Wed, 15 Jun 2016 10:43:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160615004317.GS4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
	<d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
	<20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
	<60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="daC8KDjlMyCcZyAo"
Content-Disposition: inline
In-Reply-To: <60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH RFC 06/16] vl: move smp parsing to machine
 pre_init
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
	ehabkost@redhat.com, qemu-devel@nongnu.org, agraf@suse.de,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, dgibson@redhat.com,
	imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bJlaxWaUanHs


--daC8KDjlMyCcZyAo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 10:17:49AM +0200, Paolo Bonzini wrote:
>=20
>=20
> On 13/06/2016 22:35, Andrew Jones wrote:
> > On Mon, Jun 13, 2016 at 07:04:01PM +0200, Paolo Bonzini wrote:
> >> On 10/06/2016 19:40, Andrew Jones wrote:
> >>> +    if (sockets =3D=3D -1 || cores =3D=3D -1 || threads =3D=3D -1 ||
> >>> +        maxcpus =3D=3D -1 || cpus =3D=3D -1) {
> >>> +        error_report("cpu topology: "
> >>> +                     "all machine properties must be specified");
> >>> +        exit(1);
> >>> +    }
> >>> +
> >>
> >> I think it's sane to accept some defaults.  It must not be the DWIM
> >> thing that -smp does (which is targeted to Windows's dislike of
> >> multi-socket machine on consumer hardware).  It must be something that
> >> makes sense, and my proposal is:
> >>
> >> - threads: 1
> >> - cores: 1
> >> - sockets:
> >>   - maxcpus / (cores * threads) if maxcpus given
> >>   - cpus / (cores * threads) if cpus given
> >>   - else 1
> >> - maxcpus: cores * threads * sockets
> >> - cpus: maxcpus
> >=20
> > I think some machines may prefer
> >=20
> > - threads: 1
> > - sockets: 1
> > - cores:
> >   - maxcpus / (sockets * threads) if maxcpus given
> >   - cpus / (sockets * threads) if cpus given
> >   - else 1
>=20
> smp_cores is only used by pseries and x86 machines.  I expect machines
> that must be single-socket to disregard smp_sockets altogether.

Note that on pseries (as a purely paravirt platform), the distinction
between cores and sockets is basically meaningless - there is no
important difference between a threads=3D4,cores=3D4,sockets=3D1 machine and
a threads=3D4,cores=3D1,sockets=3D4 machine.s

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--daC8KDjlMyCcZyAo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYKSlAAoJEGw4ysog2bOSSmQP/08QxOQeubw0O94kpK3zhLQG
Oij/Tp5Us1Yi+5qXykS51U5nhM5M5yve23KWfjoKPlykwKbTJXHMZsHuhaimiwtq
FEIsFC/JjaLl3SgWUr/QahiH52KuBLX8xsIwZTb0zVnrkRbibpuLQQLumZzCYay9
152Ah1fN7uFTTc7jJvJKMql8uzBtoPVNBTWjV3j2nCvDTsUGknX/3s4wjreSa2w5
V4qiqDu/hsiO3RNutQ+xvUPQOET0/mu0y96euX/m/64MjfN93a7FFIHnnZE38WVf
Nsk6m36IBJbXxSvUlHlRDpYpVX+1HUyQwn1EwQo3dW/jNggQj8JD+4BSHVnT4YrS
ahX1NqbRaoOdK9j15J9LukAz4Y/gWnXqInCPoQq9IX0Yew0d6bhkifMrewwmWVMW
k3N6BoD93kexhNJ7DO0Akvm705HZGVqLWac8OKj2lhu5rQqtd+mDdiVEccxZTgdg
zkP/LXoigMmbBUzzfi+M3GwcjJN9Rp3Bm1yk7MBMvpVaQEPoxET0f/APdHfmNf6b
cWfkwWKq1YtCKQCzPdyT/hEo2ru0TPtJHEGgEzaHFat8nYdwsfioUGl0BjPD4Hnj
QP2uxE7g4+IlZvMAbhjUf3EZ8D7dHLk7bhiGyAvrUWDA0Vh4fqyFWWf7h6NbC8pQ
mM40mO12kyptfXmJq0Dv
=kFBj
-----END PGP SIGNATURE-----

--daC8KDjlMyCcZyAo--
