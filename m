Received: by 10.25.15.230 with SMTP id 99csp4058014lfp;
        Sun, 2 Apr 2017 23:00:41 -0700 (PDT)
X-Received: by 10.200.47.9 with SMTP id j9mr15628954qta.57.1491199241268;
        Sun, 02 Apr 2017 23:00:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g192si11101294qke.289.2017.04.02.23.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Apr 2017 23:00:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cuv2c-0004x2-Qc
	for alex.bennee@linaro.org; Mon, 03 Apr 2017 02:00:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1cuv2W-0004wv-BT
	for qemu-arm@nongnu.org; Mon, 03 Apr 2017 02:00:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1cuv2V-00027e-29
	for qemu-arm@nongnu.org; Mon, 03 Apr 2017 02:00:32 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37273)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1cuv2U-00025G-7F; Mon, 03 Apr 2017 02:00:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3vxM066tvwz9s4s; Mon,  3 Apr 2017 16:00:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1491199222;
	bh=z3T2YxVQOvaCWyFt4ciBKvWV6CprwbPd82z9s+Jd1ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTOuLcQikOlKVT1TFe2wyonDcPRGk5sB4Y7jt9807QVnXwY/GrD0h6dH45weK7nFH
	XdMuL5Uk2oxTM8dbOXvnQsbzdeeC9Xb6jnGWX7HT5bu/B6XOFmW1BGIynFiYN1if7U
	fF3+0kH1FjXns6LaM8hN50oOSqsrgZFmM96Dhks0=
Date: Mon, 3 Apr 2017 14:40:17 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170403044017.GF10997@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-23-git-send-email-imammedo@redhat.com>
	<20170328051602.GK21068@umbus.fritz.box>
	<20170328130911.78c2edc6@Igors-MacBook-Pro.local>
	<20170329022723.GO21068@umbus.fritz.box>
	<20170329140858.0e8b7e24@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/aVve/J9H4Wl5yVO"
Content-Disposition: inline
In-Reply-To: <20170329140858.0e8b7e24@nial.brq.redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH for-2.10 22/23] numa: add '-numa cpu,
 ...' option for property based node mapping
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7aU1wpywhyw+


--/aVve/J9H4Wl5yVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2017 at 02:08:58PM +0200, Igor Mammedov wrote:
> On Wed, 29 Mar 2017 13:27:23 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Tue, Mar 28, 2017 at 01:09:11PM +0200, Igor Mammedov wrote:
> > > On Tue, 28 Mar 2017 16:16:02 +1100
> > > David Gibson <david@gibson.dropbear.id.au> wrote:
> > >  =20
> > > > On Wed, Mar 22, 2017 at 02:32:47PM +0100, Igor Mammedov wrote: =20
> > > > > legacy cpu to node mapping is using cpu index values to map
> > > > > VCPU to node with help of '-numa node,nodeid=3Dnode,cpus=3Dx[-y]'
> > > > > option. However cpu index is internal concept and QEMU users
> > > > > have to guess /reimplement qemu's logic/ to map it to
> > > > > a concrete cpu socket/core/thread to make sane CPUs
> > > > > placement across numa nodes.
> > > > >=20
> > > > > This patch allows to map cpu objects to numa nodes using
> > > > > the same properties as used for cpus with -device/device_add
> > > > > (socket-id/core-id/thread-id/node-id).
> > > > >=20
> > > > > At present valid properties/values to address CPUs could be
> > > > > fetched using hotpluggable-cpus monitor/qmp command, it will
> > > > > require user to start qemu twice when creating domain to fetch
> > > > > possible CPUs for a machine type/-smp layout first and
> > > > > then the second time with numa explicit mapping for actual
> > > > > usage. The first step results could be saved and reused to
> > > > > set/change mapping later as far as machine type/-smp stays
> > > > > the same.
> > > > >=20
> > > > > Proposed impl. supports exact and wildcard matching to
> > > > > simplify CLI and allow to set mapping for a specific cpu
> > > > > or group of cpu objects specified by matched properties.
> > > > >=20
> > > > > For example:
> > > > >=20
> > > > >    # exact mapping x86
> > > > >    -numa cpu,node-id=3Dx,socket-id=3Dy,core-id=3Dz,thread-id=3Dn
> > > > >=20
> > > > >    # exact mapping SPAPR
> > > > >    -numa cpu,node-id=3Dx,core-id=3Dy
> > > > >=20
> > > > >    # wildcard mapping, all cpu objects that match socket-id=3Dy
> > > > >    # are mapped to node-id=3Dx
> > > > >    -numa cpu,node-id=3Dx,socket-id=3Dy
> > > > >=20
> > > > > Signed-off-by: Igor Mammedov <imammedo@redhat.com> =20
> > > >=20
> > > > What's the rationale for adding a new CLI, rather than adding node-=
id
> > > > properties to the appropriate objects with -device, -global or -set=
 as
> > > > appropriate? =20
> > >  '-global' applies to all cpus, while '-device,-set' applies to prese=
nt
> > >  at boot time cpus only. So they do not work for the case of possible=
 but
> > >  not present at boot time objects. =20
> >=20
> > Ah!  Of course.
> >=20
> > > For ACPI based targets, we need to have
> > >  numa mapping at boot time to build ACPI SRAT table.
> > >  I don't know if it's important for spapr/fdt, =20
> >=20
> > Not in the same way.  For spapr the device tree fragment for the new
> > cpu is supplied to the guest at hotplug time rather than having to be
> > in the initial device tree.  So for us, node could be supplied with
> > device_add.
> I've implemented cpu.node-id check in the same way for all targets
> for spapr it's patch patch 06/23 which forces cpu.node-id to match
> whatever mapping has been provided with -numa cpu[s]
> OR
> with implied default /0/ if mapping for cpu hasn't been specified
> with -numa explicitly.
>=20
> That way it won't break legacy machines and on compat code is necessary,
> I'd would leave it up to you with patch on top of this to lift restrictio=
n/make
> it more relaxed for spapr if you think it won't break anything.
>=20
> Although from libvirt pov, I'd prefer to treat all targets uniformly,
> which narrows choice down to '-numa' mapping approach that it uses
> now.

Yeah, that makes sense.  If we ever have a compelling reason to allow
node designation at device_add time on Power, we can relax the
restrictions then.  I doubt it will ever happen.

>=20
> > > but it uses current predefined
> > >  mapping with -numa node,cpus=3Dx-y and new CLI hides from user inter=
nal
> > >  cpu_index and allows to use the same properties as we use for -devic=
e cpu,...
> > >  to define mapping to numa nodes for present/possible cpus.
> ...
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/aVve/J9H4Wl5yVO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY4dIxAAoJEGw4ysog2bOS4yUP/RCoTxlgPAIkoVah1Zzn8JVy
pHlb6RnzHhkhGe2oBVXLpVcQzQmkB/s9OUuFHi8VAWyb+6Aq3evmC5L8HqsvL5UF
lZ9bJh3S/SsdnhEZov7DTt8WvfWtAOK5Vj6p0z1eR2shqnOcGgiFq6xMxri0L8aE
iQslnmdAOTCGUlM0aAf1IFpovtumIQEF/t54ofHJEGRGE60Rzcf27qWo+OFFnZ0R
CVyCtaKc7B0wXVUA0OhUQaoYOEtOfYqPs5nAfgs1HyJyIfWdnN5hl36vp52DUL3Y
I62Jr0GWYXcZjQ5QRzf2SPWLE9gB4QCrNhZQTJgKTjaqLdlajttFrvUGgABjFbu4
9PG5vjXY0be0GGCGtVmSUCJqjQK9+tO9qMK+OfPfpHQQG+utOQvVoCF52wDmhjpv
5lZAenJdds6Owzb2yWkVGesEzJO8YcE9mPrP5fFasujmSEn2sh5+RBFfEP1zn+j9
zIrzsA4IR+X98xh/7ZVTIliHIcKI9sCFZ6jC+qeiTpO/iHP5KgK7AVmldBbhReHq
aSaCG3PWI9D+hl3PMMTsXgaBmutHAA+FxfBBKlQ4N4G9y5fp4iDL3VFU2ZYUz+6e
Kqxbv5hGNus/cKfQvf/+rxdVTGxXybPWik1EQ3M4IZrcjNG2bnJKKJj59X7K6s2/
TzAvlSTa563e/3OoU+Pp
=jOOD
-----END PGP SIGNATURE-----

--/aVve/J9H4Wl5yVO--
