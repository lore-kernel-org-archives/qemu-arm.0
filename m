Received: by 10.25.21.96 with SMTP id l93csp315969lfi;
        Tue, 14 Jun 2016 17:59:54 -0700 (PDT)
X-Received: by 10.200.55.219 with SMTP id e27mr23794048qtc.93.1465952394170;
        Tue, 14 Jun 2016 17:59:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c5si19722923qhc.88.2016.06.14.17.59.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 17:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCzBR-00087J-I4
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 20:59:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB7-00080l-6Z
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB4-0007ex-Ue
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:32 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCzB2-0007df-VW; Tue, 14 Jun 2016 20:59:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTp7Z0ff8z9t1G; Wed, 15 Jun 2016 10:59:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465952362;
	bh=yQTjasIwy6t1CB3dDLRkgD9PZAagwGhsTIaW6hD/jZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KA7CVL7R3iicgdMWKuwiRCp0mWg2Twz0xDhUi1TCwwRylzC2AwaX2PbH+2DnTznDb
	CKd9qIftikA678xUU3960xbWMTQ5EWRpGHwTVKFAyjWWOjJ08f8eb/jyNL7VcvlcpS
	hTi91qlJeBv6jDYiuc2Gh8X/XQ8HZnxxKypiYXqQ=
Date: Wed, 15 Jun 2016 10:51:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160615005108.GT4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
	<d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
	<20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
	<60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
	<20160614113904.2u5qvf7kasv5hact@hawk.localdomain>
	<c1f094e3-c41b-88d3-9bf2-91b334d9513a@redhat.com>
	<20160614140329.6oz6mzlgs4gswjls@hawk.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VZEZlOQeSr/zV9d3"
Content-Disposition: inline
In-Reply-To: <20160614140329.6oz6mzlgs4gswjls@hawk.localdomain>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 06/16] vl: move smp parsing
 to machine pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, imammedo@redhat.com,
	qemu-devel@nongnu.org, agraf@suse.de, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, dgibson@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CUY7GMykROdK


--VZEZlOQeSr/zV9d3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 04:03:29PM +0200, Andrew Jones wrote:
> On Tue, Jun 14, 2016 at 01:53:05PM +0200, Paolo Bonzini wrote:
> >=20
> >=20
> > On 14/06/2016 13:39, Andrew Jones wrote:
> > > On Tue, Jun 14, 2016 at 10:17:49AM +0200, Paolo Bonzini wrote:
> > >> On 13/06/2016 22:35, Andrew Jones wrote:
> > >>> On Mon, Jun 13, 2016 at 07:04:01PM +0200, Paolo Bonzini wrote:
> > >>>> On 10/06/2016 19:40, Andrew Jones wrote:
> > >> They should just not specify it and get a default of 1. ;)
> > >=20
> > > Yeah, threads, the only one we should never calculate, could be
> > > optional. If not specified, defaulting to 1 makes perfect sense.
> > > But, threads=3D0, which is weird, but in a way specifying that it's
> > > not specified, also makes some sense.
> >=20
> > If it's weird, let's make it invalid. :)
>=20
> I'm weird, and starting to like it :-)
>=20
> >=20
> > >>>> - cpus % (cores * threads) !=3D 0
> > >>>
> > >>> Hmm. This makes sense where cpus is the number of cpu packages,
> > >>
> > >> I'm not sure I understand what you mean here.  The point is that the
> > >> machine starts with an integral number of sockets.
> > >=20
> > > OK, s/cpus/maxcpus/ then. By using the currently online number, I
> > > thought you were starting to prepare for cpu packages, which are
> > > indivisible sets of cores and threads.
> >=20
> > Yes, that's what I meant to do.  Isn't cpus what you call
> > "total-online-threads" below?
>=20
> It is. I was thinking it may need to be redefined if we wanted to
> hotplug these "indivisible sets of cores and threads" (sockets),
> instead of what we do today, which is to hotplug one "cpu" at a time.
> However, I just chatted with Igor, and he says cpu hotplug operates
> on logical processors, and thus it's fine to talk about hotplugging
> threads. Even real hardware does this. Real hardware will plug a
> socket full of threads, but then the firmware may keep most of them
> disabled until they're "hotplugged". So, I think the value of cpus
> can be anything. Even the useless value of zero.

Uh.. this depends on the platform (machine type).  ACPI allows
(logical) hotplugging of individual threads.  However on pseries the
hotplug mechanism works at core granularity only.  I don't know of
real examples off hand, but it's easy to imagine a platform interface
which worked at socket, or even a multi-socket-module level

In other words the "cpu package" doesn't necessarily lie at a fixed
level of the thread/core/socket heirarchy.

This is something we're grappling with in trying to implement
cross-platform cpu hotplug, and we obviously don't want to make it
worse with these -smp changes.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VZEZlOQeSr/zV9d3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYKZ8AAoJEGw4ysog2bOSu5sP/0hyKngGAztMJe4Noxlg7USR
mNTGUaoLCczfYpaNjSEWbp3P54fecJVOqhWdTU+qDhNWwdd9401yYvaJ9rnkJUfu
7hQ3AO5li6HOiWEdmewbc98bTsEa+E/DOOSZJG/WADulzKdAyUVJoJz7KcI1k2KK
5dVYCUZULPXLuuq1fpUNkQruaLV1++hCWigyo8WWVN0u8rNQHMJCcLV/T+JZIsYx
wf8+kSLKsmTH3vE4sLkSmd1C3BVlWcjkSooS2vhV3umbcBxZ1ax34uQhsrZvSK5J
j0xRPT2wGLe7YPTUnin2sMLoEjBjHxNnYetE7AjlL0D5nFXaBPgjn0Ozm7s2qbBl
1TEMoNCgmsYHJIPlLR1VdT9fB3bpLLWp2EMDFrfeMVqEYu75BdBkZEvprbUkoKZ+
Zrlbz2nIvbr2rA7ssRmePRRAvjzvByEx0FszJqL8vMiEhJ0xFAIbzvqrZ/xKFrf4
vNsaspEh1+V0yqZbEqb9469YAcz6thxE+tF3EVN/2Nrd1cBbiISRPmDKvqRD/hu9
N5Dqh0CoUaviBYPXz4SMjZ1ED+D/fsYE2RQW3xoi3oMmD07lBCgK4csv4m1nWKuD
Jgdn7gUFRlDlfjjSl7cs5CtJs45bZdRbL5I95Hk9njRGfJ2h7woqkCEKmohTwKDL
Ge6AshfAW8Efhu2hKykP
=BcMC
-----END PGP SIGNATURE-----

--VZEZlOQeSr/zV9d3--
