Received: by 10.25.0.144 with SMTP id 138csp564359lfa;
        Wed, 19 Apr 2017 22:05:22 -0700 (PDT)
X-Received: by 10.237.55.5 with SMTP id i5mr6038581qtb.76.1492664722082;
        Wed, 19 Apr 2017 22:05:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z32si4729009qtg.73.2017.04.19.22.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 22:05:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d14HR-00059g-J3
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 01:05:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d14HK-00059X-Vg
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 01:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d14HJ-00008y-Jh
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 01:05:14 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37977)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d14HI-00005R-SL; Thu, 20 Apr 2017 01:05:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3w7myT1Mm7z9s7F; Thu, 20 Apr 2017 15:05:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1492664705;
	bh=3c6eVu7ljYE0RDiFNsfxQYj0p2zkMAjfqJASYeigsxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQUA90ny6VPgJfAcvnRh9VCu3mlrGnqPDWa1IRuAc3KLqMYPIU452vNtGKGpsrN4r
	L7c/3hGCGP5M3AL0tewi8FhtJrJD+4uKIBRS5Wa0HH41Ecvs9nPTTJcQyjzJZgRp6c
	6nezl/eGD7/jp07OZNExti6tBi9kmaZB8iCi/2sU=
Date: Thu, 20 Apr 2017 15:04:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170420050429.GD13992@umbus.fritz.box>
References: <20170418221724.5707-1-ehabkost@redhat.com>
	<20170418221724.5707-4-ehabkost@redhat.com>
	<CAFEAcA_Ky5SecogNFq3+RO8pX4sqxvsSbw0KihAv=8teqCSJbw@mail.gmail.com>
	<20170419125001.GU25239@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline
In-Reply-To: <20170419125001.GU25239@thinpad.lan.raisama.net>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [RFC v2 3/6] pci: Rename and change signatures of
 pci_bus_new() & related functions
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
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Paul Burton <paul.burton@imgtec.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Yongbok Kim <yongbok.kim@imgtec.com>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Scott Wood <scottwood@freescale.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>, David Gibson <dgibson@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1evgn8MLMlNs


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2017 at 09:50:01AM -0300, Eduardo Habkost wrote:
> On Wed, Apr 19, 2017 at 09:41:42AM +0100, Peter Maydell wrote:
> > On 18 April 2017 at 23:17, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > pci_bus_new*() and pci_register_bus() work only when the 'parent'
> > > argument is a PCI_HOST_BRIDGE object. Rename them to reflect that they
> > > are meant to initialize a bus that's in a PCI host bridge.
> > >
> > > The new function names are:
> > > * pci_host_bus_init() (replacing pci_bus_new())
> > > * pci_host_bus_init_inplace() (replacing pci_bus_new_inplace())
> > > * pci_host_bus_init_irqs() (replacing pci_register_bus())
> >=20
> > This is moving these functions away from the convention that
> > we seem to mostly follow for buses (eg ISA, SCSI) of
> > foo_bus_new() to allocate and return a new bus, and
> > foo_bus_new_inplace() to initialize a bus that's inline in
> > some other struct.
> >=20
> > I'm not sure this is a good idea unless we have a plan to
> > convert all the other QOM buses and document that this is
> > the right way to implement init for a bus.
>=20
> The point of the rename is that those functions are doing more
> than just allocating a PCIBus. They do some initialization of
> PCIHostState as well. That's why non-root PCI buses can't be
> created by pci_bus_new*() today.

Hm, yeah.

So.. for what's now pci_register_bus() is it even worth keeping a
helper?  Could we just require that callers call the other init
function then call pci_bus_irqs().  That would be one less name to
come up with.

For the others, what about
	pci_common_root_bus_new()
	pci_common_root_bus_init_inplace()
?

> Maybe the answer here is to move the PCI_HOST_BRIDGE-specific
> code somewhere else, and make pci_bus_new*() more generic. This
> would allow us to reuse pci_bus_new*() when creating non-root PCI
> buses, later.

That might work even better.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY+EFdAAoJEGw4ysog2bOSXqUQAJc6NVR9euDF5VoL3+4bIU5u
vtNWoK6pISy831mbKsKSIpLQQ+x+lrZaOrtlP8IjLoQWwxywNKybg+EIw8KEwmlW
R4zJll5gxGdr3On6qI4TJ9QowRc1nWKNZAk0DLRlq26+Hcucb7hU4pwbnL9448RT
eCOioV00nV5pKk1PsnNXu89EpvklwASUWB52nSIuFbg4p4xzBEZnWFq5Uh/rS2aH
gkBD2pyxb736tl30SsEAYBOjQUmQS4ULnfu6GkNaMpD0+VmTChiF8eUoixdU1z3k
0LIFSh4uaSiBDlD/CnlyTMQ0f9/g3HFepqpzW+QMS1KJ5xESKw4l8kAukICdNci+
luKT0j7FEkTzThLUp+26DfTx59yxSOqt3l87Z0BC3MYV8vzwqReTxyIwBZ0DALli
QCNzJLODndxLByqO6WNIzrGarMbLis8IUXbF427AUBVepLh/Cs7eEe1ohLCk4NtP
/xOLVcu3mRdVoeeTOjrI8Trr+P9NEkD9BULRQkcEKX6P5oAD8/iag3dDO6YOC45D
nyP2LgN7KqccnjQnZxWu/kBU2uBw/dAi/8GIh/q2xakuIcb7NGqAcjIM0PrPThSW
ErcK9JJ9rlHHWcNUfUJfjmRHtuQb1WE+tlgeBGzrhpd80kZeJP1zDfy52mRv1nx3
+AwjG2nhvfCbkymP3xGJ
=csp7
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
