Received: by 10.25.15.230 with SMTP id 99csp1887292lfp;
        Tue, 28 Mar 2017 19:49:45 -0700 (PDT)
X-Received: by 10.237.37.121 with SMTP id w54mr32180847qtc.14.1490755785801;
        Tue, 28 Mar 2017 19:49:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j95si5088077qte.238.2017.03.28.19.49.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Mar 2017 19:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56199 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ct3g9-0008Tr-Ce
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 22:49:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ct3g3-0008Ra-Br
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 22:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ct3fz-0004CR-Bh
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 22:49:39 -0400
Received: from ozlabs.org ([103.22.144.67]:33809)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1ct3fy-0004Bs-MY; Tue, 28 Mar 2017 22:49:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3vtC085SPdz9vgr; Wed, 29 Mar 2017 13:49:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1490755768;
	bh=2meYuq1vx1IXF4h2HOcSL7nFx4x8T2Ih66Jl+aD9n+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYxiwi4JL6FW7BfZbSSCgafWk0UZv1DnAb8g8eiwzZUh91Gm+fQx8BBu/z3/7LlOh
	ykBU8Hemw4AvJpeQ/03UljfM2iO+L9J7fvPQxUkyBE1PiIsTQ5ci18EddqZiWypfOR
	3bouD4AOGx4gmdAWDzqvGNlzedT+buY/+PMlEsz4=
Date: Wed, 29 Mar 2017 13:24:49 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170329022449.GN21068@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-6-git-send-email-imammedo@redhat.com>
	<20170328041920.GC21068@umbus.fritz.box>
	<20170328125310.4fa3da50@Igors-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yK/6QRnH3Zanb0EF"
Content-Disposition: inline
In-Reply-To: <20170328125310.4fa3da50@Igors-MacBook-Pro.local>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH for-2.10 05/23] numa: move source of default
 CPUs to NUMA node mapping into boards
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
X-TUID: 410T7pyIJRyG


--yK/6QRnH3Zanb0EF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 12:53:10PM +0200, Igor Mammedov wrote:
> On Tue, 28 Mar 2017 15:19:20 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > On Wed, Mar 22, 2017 at 02:32:30PM +0100, Igor Mammedov wrote:
> > > Originally CPU threads were by default assigned in
> > > round-robin fashion. However it was causing issues in
> > > guest since CPU threads from the same socket/core could
> > > be placed on different NUMA nodes.
> > > Commit fb43b73b (pc: fix default VCPU to NUMA node mapping)
> > > fixed it by grouping threads within a socket on the same node
> > > introducing cpu_index_to_socket_id() callback and commit
> > > 20bb648d (spapr: Fix default NUMA node allocation for threads)
> > > reused callback to fix similar issues for SPAPR machine
> > > even though socket doesn't make much sense there.
> > >=20
> > > As result QEMU ended up having 3 default distribution rules
> > > used by 3 targets /virt-arm, spapr, pc/.
> > >=20
> > > In effort of moving NUMA mapping for CPUs into possible_cpus,
> > > generalize default mapping in numa.c by making boards decide
> > > on default mapping and let them explicitly tell generic
> > > numa code to which node a CPU thread belongs to by replacing
> > > cpu_index_to_socket_id() with @cpu_index_to_instance_props()
> > > which provides default node_id assigned by board to specified
> > > cpu_index.
> > >=20
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
[snip]
> > > +static CpuInstanceProperties
> > > +virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> > > +{
> > > +    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> > > +    const CPUArchIdList *possible_cpus =3D mc->possible_cpu_arch_ids=
(ms);
> > > +
> > > +    assert(cpu_index < possible_cpus->len);
> > > +    return possible_cpus->cpus[cpu_index].props;;
> > > +}
> > > +
> >=20
> > It seems a bit weird to have a machine specific hook to pull the
> > property information when one way or another it's coming from the
> > possible_cpus table, which is already constructed by a machine
> > specific hook.  Could we add a range or list of cpu_index values to
> > each possible_cpus entry instead, and have a generic lookup of the
> > right entry based on that?

[snip]
> > > -static unsigned pc_cpu_index_to_socket_id(unsigned cpu_index)
> > > +static CpuInstanceProperties
> > > +pc_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> > >  {
> > > -    X86CPUTopoInfo topo;
> > > -    x86_topo_ids_from_idx(smp_cores, smp_threads, cpu_index,
> > > -                          &topo);
> > > -    return topo.pkg_id;
> > > +    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> > > +    const CPUArchIdList *possible_cpus =3D mc->possible_cpu_arch_ids=
(ms);
> > > +
> > > +    assert(cpu_index < possible_cpus->len);
> > > +    return possible_cpus->cpus[cpu_index].props;;
> >=20
> > Since the pc and arm version of this are basically identical, I wonder
> > if that should actually be the default implementation.  If we need it
> > at all.
> ARM is still moving target and props are not really defined for it yet,
> so I'd like to keep it separate for now and when it stabilizes we can thi=
nk
> about generalizing it.

Fair enough.

Any thoughts on my more general query above

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yK/6QRnH3Zanb0EF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY2xrvAAoJEGw4ysog2bOSlYAP/R3QY/plG35cKCa9j0vQOxem
R6qBPoEojVFc7a+188bM8dR5SJi9HVAQ7qPvNtaPRlAAS/PqpaCpB9KdEJFlTO5D
DmvXTM8QLisJ77LgZlbsSrmnkGjE8NrdeR9663vJ6jrHoTALpeG4eEsG1IZDw0A9
cLjREmmU3xDlGPSYJfR33qaHiy5MAXg7i7I34IsLUBZxBMqVPEDetJkY6l1Ci+xb
vz56yQEg1BDyhlJbB5nz52noK+bIV1yOKhvGts/P6w5GMf0BmfNRxIfb0qJwYpNj
qAZP8gT3bb0samK1drhmt+LkGxUnFRiHJhU5yNquRRISVQ7N+DX4TXON5HSheKZA
JfkHgAgNB9n9XK9JzOBHoCbzIdzvRSQb0WGgB/e6NhG8zqTyyqxie0UhydjJKfdK
5xmaDtQNpd3EmADw4NeqmcmMNKsf4Os2pHta4A7XVsRVstGq5VHYjqPjUKuysC2Q
l9B7EGJ/Sjmaf/gEXbct2o2qBPdk8jXLxJcHKYOuXCekFz9jsmGHa2vLrwKDOuQt
KxbjbaXRRgq14AqKgr488ma82cZiyctWcnMjOLr1RlPXuF+urUDHL33JdEjBh9JP
EFz73LN39b25VIJh67topZ1j9Tq1K0nXlm1MIcS7gOZ/r8h3vtAvLLqVeTc2quFw
9VdjJzoHYWK3xsETgnxo
=KCgP
-----END PGP SIGNATURE-----

--yK/6QRnH3Zanb0EF--
