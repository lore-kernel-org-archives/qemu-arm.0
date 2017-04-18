Received: by 10.25.0.144 with SMTP id 138csp1532950lfa;
        Mon, 17 Apr 2017 21:01:48 -0700 (PDT)
X-Received: by 10.233.239.18 with SMTP id d18mr10751161qkg.313.1492488108068;
        Mon, 17 Apr 2017 21:01:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l90si12747280qte.273.2017.04.17.21.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Apr 2017 21:01:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0KKp-0001vS-Gf
	for alex.bennee@linaro.org; Tue, 18 Apr 2017 00:01:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d0KKi-0001tb-A6
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 00:01:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d0KKh-0005Pu-BU
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 00:01:40 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:44093)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d0KKg-0005NA-Tp; Tue, 18 Apr 2017 00:01:39 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3w6Wf72xmXz9s2P; Tue, 18 Apr 2017 14:01:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1492488095;
	bh=CrMT98o7/gpRQpurtm+imXdXHtL07HWf+acULsFSgmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jv59rXAwCzOGZloWRC3KcjVeoaGpx1AGpz+VcL04U4j1KRKmcx9W+35ORqqADGfpo
	hYN2madB7+FcuiSQjwuKLb24tS1FJiTAsm5Dg1Aom1VCNVB9zSmmWXOOVv3aStIWrm
	hFVaF5aPHQQ+GS/oGYXOMEGumpIX9j3Zf5kEeo7k=
Date: Tue, 18 Apr 2017 13:56:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170418035630.GO12235@umbus.fritz.box>
References: <20170417215916.12431-1-ehabkost@redhat.com>
	<20170417215916.12431-8-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IpgPcFyQO6wM49Um"
Content-Disposition: inline
In-Reply-To: <20170417215916.12431-8-ehabkost@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [RFC 7/7] pci: Set phb->bus inside
 pci_bus_new_inplace()
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
	"Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>, David Gibson <dgibson@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KhBjxkvyHOKa


--IpgPcFyQO6wM49Um
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2017 at 06:59:16PM -0300, Eduardo Habkost wrote:
> Every single caller of pci_bus_new_inplace() sets phb->bus to point to
> 'bus'. Do that inside pci_bus_new_inplace() to avoid code duplication
> and make it harder to break.
>=20
> Cc: "Herv=E9 Poussineau" <hpoussin@reactos.org>
> Cc: Marcel Apfelbaum <marcel@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/prep.c      | 2 --
>  hw/pci-host/versatile.c | 1 -
>  hw/pci/pci.c            | 1 +
>  3 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 2e2cd267f4..6efa5bc5ef 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -284,8 +284,6 @@ static void raven_pcihost_initfn(Object *obj)
>      address_space_init(&s->bm_as, &s->bm, "raven-bm");
>      pci_setup_iommu(&s->pci_bus, raven_pcihost_set_iommu, s);
> =20
> -    h->bus =3D &s->pci_bus;
> -
>      object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_RAVEN_PCI_DE=
VICE);
>      pci_dev =3D DEVICE(&s->pci_dev);
>      qdev_set_parent_bus(pci_dev, BUS(&s->pci_bus));
> diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
> index 24ef87610b..630f1ac1c5 100644
> --- a/hw/pci-host/versatile.c
> +++ b/hw/pci-host/versatile.c
> @@ -389,7 +389,6 @@ static void pci_vpb_init(Object *obj)
>      pci_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), h, "pci",
>                          &s->pci_mem_space, &s->pci_io_space,
>                          PCI_DEVFN(11, 0), TYPE_PCI_BUS);
> -    h->bus =3D &s->pci_bus;
> =20
>      object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_VERSATILE_PC=
I_HOST);
>      qdev_set_parent_bus(DEVICE(&s->pci_dev), BUS(&s->pci_bus));
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 486aeb7514..ef226f8b41 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -397,6 +397,7 @@ void pci_bus_new_inplace(PCIBus *bus, size_t bus_size,
>  {
>      qbus_create_inplace(bus, bus_size, typename, DEVICE(phb), name);
>      pci_bus_init(bus, phb, address_space_mem, address_space_io, devfn_mi=
n);
> +    phb->bus =3D bus;
>  }
> =20
>  PCIBus *pci_bus_new(PCIHostState *phb, const char *name,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IpgPcFyQO6wM49Um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY9Y5uAAoJEGw4ysog2bOScxcP/3T7dGJRK5cFLxdlFQqDxNfa
eKLsjltGWV5nJT0F8M27CBKyC/z4T1b0ZMQPWukhRBlp/prXx/Rh++476O/nVXGP
0Gkb6dR2T2k3hyDfzaHf4VG7s+0gOtEgGDabqsqLzIBoynW2MgtiJCOANvMnBCM2
V0y/f6fQ87kV+g+fBW1WvIoeog4rM9iQR5K9Yd1a8DdEYYSrcxHwEJgA8ezR5ZKb
oLb2DSG/SXjI7S4wCu0AylNm2OCoU0nMBJ00fz/Dk1myxrbehMKwwhBBkv6OF4oO
r78er3ruFAOkh4uZPoGuqnChvNCUykvn5ieFeFWwpYhka4oRezVEjir/1LWD0uqZ
NhZJfVoAje+USaO9+ywp4CaQEsU7cIDgjJHhLTQ93Z47GAsi5nSSLmWgztlYKHuz
pnRL7A8xwpEPkvTf152rpTjVWJmyasLAK0l7FhEr5pKeOMeIGjh+uzs39vAYDD94
tsEtJWxjVFqjXFOaM0xst+aN1nyaWCv0bGKBND8Hq0loxaYvFd53I1blnHg8Mi8h
LxflVQHQZvryM7sk/vH1vIHTbrbw4/mxr5D8jzE5YFSvI42wp81TRUUu9FQgesj3
BJavuyKn+WDmgEg8BVoAMPbJwrVqBlEJXHdJEer1VHpCEIzCto6h5rX92ug9Nirr
mMBfqsiKzQVczUSXOgap
=JN1d
-----END PGP SIGNATURE-----

--IpgPcFyQO6wM49Um--
