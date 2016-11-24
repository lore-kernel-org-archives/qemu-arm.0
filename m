Received: by 10.25.150.194 with SMTP id y185csp2887913lfd;
        Wed, 23 Nov 2016 19:01:37 -0800 (PST)
X-Received: by 10.55.176.131 with SMTP id z125mr86296qke.286.1479956497064;
        Wed, 23 Nov 2016 19:01:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g34si13793855qtc.112.2016.11.23.19.01.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Nov 2016 19:01:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9kI4-0000Co-Ib
	for alex.bennee@linaro.org; Wed, 23 Nov 2016 22:01:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1c9kI0-0000CW-Dz
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 22:01:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1c9kHx-0004S3-Cc
	for qemu-arm@nongnu.org; Wed, 23 Nov 2016 22:01:32 -0500
Received: from ozlabs.org ([103.22.144.67]:33553)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1c9kHw-0004QI-1j; Wed, 23 Nov 2016 22:01:29 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3tPP9b41w0z9t9b; Thu, 24 Nov 2016 14:01:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1479956483;
	bh=MvXnwsHQwdltFJiNHc+XqAHNZKwVwWHYz4xKPtKabUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgKJW3jICLliyvRfDJBs6YNrYwblrYrDXQZ2QvDznHvs0UgieONtDw4wLZQV/Z+bI
	TiZJzwNAK3YO6kxbqGvvo88/4g6oUQ0qUQ4LpnXBryk7wEShW8jd4nAFSbrKEpekGi
	Wbt9c2altyHH/j2br7x+jGua2gd6kXPiw2HoEAR4=
Date: Thu, 24 Nov 2016 12:51:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20161124015119.GS17795@umbus.fritz.box>
References: <1479777133-23567-1-git-send-email-ehabkost@redhat.com>
	<20161122223450.GD21830@thinpad.lan.raisama.net>
	<20161123171047.GA27297@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4PJudQiuYY5+cwwi"
Content-Disposition: inline
In-Reply-To: <20161123171047.GA27297@thinpad.lan.raisama.net>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] -nodefaults and available buses (was Re:
 [Qemu-devel] [RFC 00/15] qmp: Report supported device types on
 'query-machines')
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
	Alex Williamson <alex.williamson@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, libvir-list@redhat.com,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Laine Stump <laine@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Andrea Bolognani <abologna@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HBKahrUjdHKM


--4PJudQiuYY5+cwwi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 03:10:47PM -0200, Eduardo Habkost wrote:
> (CCing the maintainers of the machines that crash when using
> -nodefaults)
>=20
> On Tue, Nov 22, 2016 at 08:34:50PM -0200, Eduardo Habkost wrote:
> [...]
> > "default defaults" vs "-nodefault defaults"
> > -------------------------------------------
> >=20
> > Two bad news:
> >=20
> > 1) We need to differentiate buses created by the machine with
> >    "-nodefaults" and buses that are created only without
> >    "-nodefaults".
> >=20
> > libvirt use -nodefaults when starting QEMU, so knowing which
> > buses are available when using -nodefaults is more interesting
> > for them.
> >=20
> > Other software, on the other hand, might be interested in the
> > results without -nodefaults.
> >=20
> > We need to be able model both cases in the new interface.
> > Suggestions are welcome.
>=20
> The good news is that the list is short. The only[1] machines
> where the list of buses seem to change when using -nodefaults
> are:
>=20
> * mpc8544ds
> * ppce500
> * mpc8544ds
> * ppce500
> * s390-ccw-virtio-*
>=20
> On all cases above, the only difference is that a virtio bus is
> available if not using -nodefaults.

Hrm.. that's odd.  Well, it makes sense for the s390 which has special
virtio arrangements.  However, the others are all embedded ppc
machines, whose virtio should be bog-standard virtio-pci.  I'm
wondering if the addition of the virtio "bus" is a side-effect of the
NIC or storage device created without -nodefaults being virtio.

> Considering that the list is short, I plan to rename
> 'supported-device-types' to 'always-available-buses', and
> document that it will include only the buses that are not
> disabled by -nodefaults.
>=20
> [1] I mean, the only ones from the set that don't crash with
>     -nodefaults. The ones below could not be tested:
>=20
> > 2) A lot of machine-types won't start if using
> >    "-nodefaults -machine <machine>" without any extra devices or
> >    drives.
> >=20
> > Lots of machines require some drives or devices to be created
> > (especially ARM machines that require a SD drive to be
> > available).
> >=20
> > Some machines will make QEMU exit, some of them simply segfault.
> > I am looking for ways to work around it so we can still validate
> > -nodefaults-based info on the test code.
>=20
> The following machines won't work with -nodefaults:
>=20
> These make QEMU segfault:
> * cubieboard
> * petalogix-ml605
> * or32-sim
> * virtex-ml507
> * Niagara
>=20
> These exit with a "missing SecureDigital device" error:
> * akita
> * borzoi
> * cheetah
> * connex
> * mainstone
> * n800
> * n810
> * spitz
> * sx1
> * sx1-v1
> * terrier
> * tosa
> * verdex
> * z2
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4PJudQiuYY5+cwwi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYNkeUAAoJEGw4ysog2bOSf1QQANDVo0i3C+CU+wvcPCQkThIe
i1kFpw7wzRVm0bbE23kUavv5jwKLlTSOqwEbGRx7KqNSOpWjF82AJ6ro8iRQL6eM
QFA9NImOVQrR7qFHtjkThDnGb7JlHjd6ryZzKyK1wvj2YXx6r+c9DTBGRBlcRXql
lHTD+aA3nDok2fYG5ZX7iEZgvm5xX+xg8Ympj7qP995hpwEKIGKg+MJYRvU1/HXB
mSkVs5niY1eAW3O14+Le4mR7/SeMk0aSXcudOsnr1341iKq4KfQnm++LVcI/hgQP
jqRgkatW9oQO96UL3u0QHyF+BiT8MHC22S/GGA1SoxyYr265mJMxsj/TxmzffwgF
jyoC8woAb7y+L/rdGkZNwXJvciDEipHahhOScYgq43Osub8c5NkPYxEPvrciNvIp
OVmAOj6lrQI512mcHpb4DRawXE+S45whBSLpqV/kU5C0sX0xPISzq66DLkdT6GoM
78pRmekPWK65WPoFCeMJBsnljJUlk16QxssFjLW7+mhDXfGf07NjGWZIiS1E2bCV
RFcteQCtlWJF7wMTnm9EvJ7uxycFV9ibrYMwMOVy4UL3jpVCIm1VaTjECii6Vbhj
J4tOAYdRjt7wLaBaa7gfhIHnjQStAdqLxceMar0XbhP22Yd6jbbnIQYjqQnIMVrj
1CRMrDgsoaktF/vxEKGX
=WpA1
-----END PGP SIGNATURE-----

--4PJudQiuYY5+cwwi--
