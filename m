Received: by 10.25.21.96 with SMTP id l93csp315939lfi;
        Tue, 14 Jun 2016 17:59:44 -0700 (PDT)
X-Received: by 10.140.176.21 with SMTP id w21mr19988242qhw.101.1465952382987;
        Tue, 14 Jun 2016 17:59:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2si18359117qkd.182.2016.06.14.17.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 17:59:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCzBG-000832-97
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 20:59:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB9-000812-AS
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB4-0007f5-VO
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:35 -0400
Received: from ozlabs.org ([103.22.144.67]:44640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCzB3-0007dc-1X; Tue, 14 Jun 2016 20:59:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTp7Z2hYqz9t1L; Wed, 15 Jun 2016 10:59:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465952362;
	bh=b6jwUeWj9ZtGgSEFQ5xEvhxnjSbygAvyqTcnftmenEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dl2O75fPQjuneJcJQ5SdelbTg0YMS71ubkczftEoXVbl2804F4qY+OOYSMz6qsh/3
	2BmfPHOUmQaDpiCActLqexNSKSMaISywEiqgTpCEqK2zUu135HsU/BO9tejERBnsV9
	BVd7PFpOciCliBM0I21QtRQRcS2pE4ssnJaEqigI=
Date: Wed, 15 Jun 2016 10:59:01 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160615005901.GV4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-11-git-send-email-drjones@redhat.com>
	<20160614030341.GJ4882@voom.fritz.box>
	<20160614062308.r6nafsv56yy7rjf5@hawk.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xMJbWctQEcNQiBqK"
Content-Disposition: inline
In-Reply-To: <20160614062308.r6nafsv56yy7rjf5@hawk.localdomain>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 10/16] hw/ppc/spapr: don't
 use smp_cores, smp_threads
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	imammedo@redhat.com, pbonzini@redhat.com, dgibson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qu+a+uSuD/vJ


--xMJbWctQEcNQiBqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 08:23:08AM +0200, Andrew Jones wrote:
> On Tue, Jun 14, 2016 at 01:03:41PM +1000, David Gibson wrote:
> > On Fri, Jun 10, 2016 at 07:40:21PM +0200, Andrew Jones wrote:
> > > Use CPUState nr_cores,nr_threads and MachineState
> > > cores,threads instead.
> > >=20
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > ---
> > >  hw/ppc/spapr.c      | 9 +++++----
> > >  hw/ppc/spapr_rtas.c | 2 +-
> > >  2 files changed, 6 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index 063664234106e..f78276bb4b164 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -35,7 +35,6 @@
> > >  #include "net/net.h"
> > >  #include "sysemu/device_tree.h"
> > >  #include "sysemu/block-backend.h"
> > > -#include "sysemu/cpus.h"
> > >  #include "sysemu/kvm.h"
> > >  #include "sysemu/device_tree.h"
> > >  #include "kvm_ppc.h"
> > > @@ -603,7 +602,7 @@ static void spapr_populate_cpu_dt(CPUState *cs, v=
oid *fdt, int offset,
> > >      uint32_t cpufreq =3D kvm_enabled() ? kvmppc_get_clockfreq() : 10=
00000000;
> > >      uint32_t page_sizes_prop[64];
> > >      size_t page_sizes_prop_size;
> > > -    uint32_t vcpus_per_socket =3D smp_threads * smp_cores;
> > > +    uint32_t vcpus_per_socket =3D cs->nr_cores * cs->nr_threads;

This function has an 'spapr' parameter which is a subcloss of
MachineState, so you can get to the machine value from there.

> > >      uint32_t pft_size_prop[] =3D {0, cpu_to_be32(spapr->htab_shift)};
> > > =20
> > >      /* Note: we keep CI large pages off for now because a 64K capabl=
e guest
> > > @@ -1774,7 +1773,7 @@ static void ppc_spapr_init(MachineState *machin=
e)
> > >      /* Set up Interrupt Controller before we create the VCPUs */
> > >      spapr->icp =3D xics_system_init(machine,
> > >                                    DIV_ROUND_UP(max_cpus * kvmppc_smt=
_threads(),
> > > -                                               smp_threads),
> > > +                                               machine->threads),
> > >                                    XICS_IRQS, &error_fatal);
> > > =20
> > >      if (smc->dr_lmb_enabled) {
> > > @@ -2268,9 +2267,11 @@ static HotplugHandler *spapr_get_hotpug_handle=
r(MachineState *machine,
> > > =20
> > >  static unsigned spapr_cpu_index_to_socket_id(unsigned cpu_index)
> > >  {
> > > +    CPUState *cs =3D first_cpu;
> > > +
> > >      /* Allocate to NUMA nodes on a "socket" basis (not that concept =
of
> > >       * socket means much for the paravirtualized PAPR platform) */
> > > -    return cpu_index / smp_threads / smp_cores;
> > > +    return cpu_index / cs->nr_cores / cs->nr_threads;

Here you can use qdev_get_machine().  That's no more an ugly use of a
global than using first_cpu.

> > >  }
> > > =20
> > >  static void spapr_machine_class_init(ObjectClass *oc, void *data)
> > > diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> > > index 43e2c684fda8d..3fdfbb01a20dd 100644
> > > --- a/hw/ppc/spapr_rtas.c
> > > +++ b/hw/ppc/spapr_rtas.c
> > > @@ -742,7 +742,7 @@ int spapr_rtas_device_tree_setup(void *fdt, hwadd=
r rtas_addr,
> > >      lrdr_capacity[1] =3D cpu_to_be32(max_hotplug_addr & 0xffffffff);
> > >      lrdr_capacity[2] =3D 0;
> > >      lrdr_capacity[3] =3D cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE);
> > > -    lrdr_capacity[4] =3D cpu_to_be32(max_cpus/smp_threads);
> > > +    lrdr_capacity[4] =3D cpu_to_be32(max_cpus / machine->threads);
> > >      ret =3D qemu_fdt_setprop(fdt, "/rtas", "ibm,lrdr-capacity", lrdr=
_capacity,
> > >                       sizeof(lrdr_capacity));
> > >      if (ret < 0) {
> >=20
> > I think all the places that use cs->nr_* here it actually makes more
> > sense to use the value in the machine state.
>=20
> I think I used machine state whenever I (easily) could. How do I get to
> machine state from a CPU method? I will if I can, for all machines,
> and then gladly kill the CPUState->nr_cores/nr_threads.

I can't speak to all machines, but notes above on how it can be done
for spapr.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xMJbWctQEcNQiBqK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYKhVAAoJEGw4ysog2bOSE24QAKRDegYVCaB2xBYBW7YkLOlV
F9wZs4buzixpZaF8AxNmf0LPAYcv0FefskrMd1pu5CNRxSwPBnXiNQY3y/SFmykG
Q/oB1R+MFBbCb1U+u3LnULIBc96dnDhCOe7xiqOXNrT7QGWCegW726+qXE39yxUx
ryMXzEeR3ttLnv/4qPZ9ndAdOuIP0s57LZbDFuyqy5IOb4LUfaXBTJWlNWHm+Zsm
P3Tf3netngGwMYTjpipm2CzJFyHs3ky8mqC6w864QIRkJeq9W8wdHbWPFn0PE8UY
wME+gbEn3nehLk1kXhofcSVYMk9m7YOhygqbZkyKisOKto8QBUd3BdDVAtSzC1fu
eFNLQfwJrZpKjdcVJsakcw8PNIyj5uP1ArfQLvgFj2931Esx/gdcy353vaHLw3s1
qPp0ATUxMWjqjI+r9QUnbuM7OBsYP3o/UAr2pqef+Na48zPpY007p4XzUGgVEeyY
AV1MJ1jpE8YL9WDY1jDQT3RVLKjFPjjhKN5w13yEmJSEtqXNH4a87d44V+msn/V1
mpeej4n+BGdN7LPeJpc5tKKPzgPUTooG+NwX82eKWbHy/chYgKc6i0VWu9u8/xKO
ktBdUE1cVUA9pF4e53a+n9jx1OSAep8WrZXePLX74nAL3PDj+uJHDL9ChImb7HLf
gy58iufbQDKcB9gOJY/e
=72M3
-----END PGP SIGNATURE-----

--xMJbWctQEcNQiBqK--
