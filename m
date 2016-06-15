Received: by 10.25.21.96 with SMTP id l93csp315964lfi;
        Tue, 14 Jun 2016 17:59:51 -0700 (PDT)
X-Received: by 10.140.168.2 with SMTP id o2mr23280892qho.13.1465952391198;
        Tue, 14 Jun 2016 17:59:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i207si20258514qke.191.2016.06.14.17.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 17:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCzBO-00083o-IU
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 20:59:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB8-00080x-VX
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB3-0007eX-Re
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:34 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:59702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCzB2-0007dd-Vi; Tue, 14 Jun 2016 20:59:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTp7Z01PWz9t1H; Wed, 15 Jun 2016 10:59:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465952362;
	bh=EdAdTysnDuhl0Z/l+snesiXSdeEgKpRO0/jKcGUfWAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pU2t4/69GEmH+DlC0M8enKa/O2MbK5uVM9041qvu0FEMQrGGclbP0QGhqp5HtqFGM
	9sdPgsBxPc/iBHSjgNp/lTvNofi+Y/weQ/+z/kNupvyzRRpNyQFc23xAXVNvY7tbul
	IWQaquiqa9fl/FXnBt73LPWkyhWD7TFL7DyY5+Ys=
Date: Wed, 15 Jun 2016 10:37:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160615003759.GR4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-6-git-send-email-drjones@redhat.com>
	<20160614020026.GH4882@voom.fritz.box>
	<20160614060807.tkdq2dy2kw6d3bw4@hawk.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1GSL5ZULXUIqbbH1"
Content-Disposition: inline
In-Reply-To: <20160614060807.tkdq2dy2kw6d3bw4@hawk.localdomain>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 05/16] hw/core/machine: add
 smp properites
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
X-TUID: bkB0AvqdqokY


--1GSL5ZULXUIqbbH1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 08:08:07AM +0200, Andrew Jones wrote:
> On Tue, Jun 14, 2016 at 12:00:26PM +1000, David Gibson wrote:
> > On Fri, Jun 10, 2016 at 07:40:16PM +0200, Andrew Jones wrote:
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > ---
> > >  hw/core/machine.c   | 81 +++++++++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  include/hw/boards.h |  6 ++++
> > >  2 files changed, 87 insertions(+)
> > >=20
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index 3dce9020e510a..2625044002e57 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -172,6 +172,53 @@ static void machine_set_dumpdtb(Object *obj, con=
st char *value, Error **errp)
> > >      ms->dumpdtb =3D g_strdup(value);
> > >  }
> > > =20
> > > +static void machine_get_smp(Object *obj, Visitor *v, const char *nam=
e,
> > > +                            void *opaque, Error **errp)
> > > +{
> > > +    MachineState *ms =3D MACHINE(obj);
> > > +    int64_t value;
> > > +
> > > +    if (strncmp(name, "sockets", 7) =3D=3D 0) {
> > > +        value =3D ms->sockets;
> > > +    } else if (strncmp(name, "cores", 5) =3D=3D 0) {
> > > +        value =3D ms->cores;
> > > +    } else if (strncmp(name, "threads", 7) =3D=3D 0) {
> > > +        value =3D ms->threads;
> > > +    } else if (strncmp(name, "maxcpus", 7) =3D=3D 0) {
> > > +        value =3D ms->maxcpus;
> > > +    } else if (strncmp(name, "cpus", 4) =3D=3D 0) {
> > > +        value =3D ms->cpus;
> > > +    }
> > > +
> > > +    visit_type_int(v, name, &value, errp);
> > > +}
> >=20
> > Any particular for multiplexing all the set / get, rather than having
> > separate callbacks for each property?
>=20
> Not really. This way just makes denser code. But I'll go whichever
> direction people prefer.

I'd prefer not to have the multiplexer, but I don't care that much.

> Actually I should probably add an
> else { error_report(...) } in either case, which means the multifunction
> direction would still contain strncmps.

Hrm.. that would seem an odd choice to me if you didn't have the
multiplex.  Not including the strncmp() means you can change the
property name (or add aliases) in a single place, without changing the
callback functions.

Note also that the current set of strncmp()s is only correct because
there is a limited set of things bound to this callback.  Remember
that strncmp(name, "sockets", 7) will match "socketsfoo".

> > > +
> > > +static void machine_set_smp(Object *obj, Visitor *v, const char *nam=
e,
> > > +                            void *opaque, Error **errp)
> > > +{
> > > +    MachineState *ms =3D MACHINE(obj);
> > > +    Error *error =3D NULL;
> > > +    int64_t value;
> > > +
> > > +    visit_type_int(v, name, &value, &error);
> > > +    if (error) {
> > > +        error_propagate(errp, error);
> > > +        return;
> > > +    }
> > > +
> > > +    if (strncmp(name, "sockets", 7) =3D=3D 0) {
> > > +        ms->sockets =3D value;
> > > +    } else if (strncmp(name, "cores", 5) =3D=3D 0) {
> > > +        ms->cores =3D value;;
> > > +    } else if (strncmp(name, "threads", 7) =3D=3D 0) {
> > > +        ms->threads =3D value;
> > > +    } else if (strncmp(name, "maxcpus", 7) =3D=3D 0) {
> > > +        ms->maxcpus =3D value;
> > > +    } else if (strncmp(name, "cpus", 4) =3D=3D 0) {
> > > +        ms->cpus =3D value;
> > > +    }
> > > +}
> > > +
> > >  static void machine_get_phandle_start(Object *obj, Visitor *v,
> > >                                        const char *name, void *opaque,
> > >                                        Error **errp)
> > > @@ -368,8 +415,18 @@ static void machine_init_notify(Notifier *notifi=
er, void *data)
> > >      foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
> > >  }
> > > =20
> > > +static void machine_set_smp_parameters(MachineState *ms)
> > > +{
> > > +    if (ms->sockets !=3D -1 || ms->cores !=3D -1 || ms->threads !=3D=
 -1 ||
> > > +        ms->maxcpus !=3D -1 || ms->cpus !=3D -1) {
> > > +        error_report("warning: cpu topology: "
> > > +                     "machine properties currently ignored");
> > > +    }
> > > +}
> > > +
> > >  static void machine_pre_init(MachineState *ms)
> > >  {
> > > +    machine_set_smp_parameters(ms);
> > >  }
> > > =20
> > >  static void machine_class_init(ObjectClass *oc, void *data)
> > > @@ -403,6 +460,11 @@ static void machine_initfn(Object *obj)
> > >      ms->dump_guest_core =3D true;
> > >      ms->mem_merge =3D true;
> > >      ms->enable_graphics =3D true;
> > > +    ms->sockets =3D -1;
> > > +    ms->cores =3D -1;
> > > +    ms->threads =3D -1;
> > > +    ms->maxcpus =3D -1;
> > > +    ms->cpus =3D -1;
> > > =20
> > >      object_property_add_str(obj, "accel",
> > >                              machine_get_accel, machine_set_accel, NU=
LL);
> > > @@ -462,6 +524,25 @@ static void machine_initfn(Object *obj)
> > >      object_property_set_description(obj, "dt-compatible",
> > >                                      "Overrides the \"compatible\" pr=
operty of the dt root node",
> > >                                      NULL);
> > > +    object_property_add(obj, "sockets", "int", machine_get_smp,
> > > +                        machine_set_smp, NULL, NULL, NULL);
> > > +    object_property_set_description(obj, "sockets", "Number of socke=
ts", NULL);
> > > +    object_property_add(obj, "cores", "int", machine_get_smp,
> > > +                        machine_set_smp, NULL, NULL, NULL);
> > > +    object_property_set_description(obj, "cores",
> > > +                                    "Number of cores per socket", NU=
LL);
> > > +    object_property_add(obj, "threads", "int", machine_get_smp,
> > > +                        machine_set_smp, NULL, NULL, NULL);
> > > +    object_property_set_description(obj, "threads",
> > > +                                    "Number of threads per core", NU=
LL);
> > > +    object_property_add(obj, "maxcpus", "int", machine_get_smp,
> > > +                        machine_set_smp, NULL, NULL, NULL);
> > > +    object_property_set_description(obj, "maxcpus", "Maximum number =
of cpus",
> > > +                                    NULL);
> > > +    object_property_add(obj, "cpus", "int", machine_get_smp,
> > > +                        machine_set_smp, NULL, NULL, NULL);
> > > +    object_property_set_description(obj, "cpus", "Number of online c=
pus",
> > > +                                    NULL);
> > >      object_property_add_bool(obj, "dump-guest-core",
> > >                               machine_get_dump_guest_core,
> > >                               machine_set_dump_guest_core,
> > > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > > index 4e8dc68b07a24..53adbfe2a3099 100644
> > > --- a/include/hw/boards.h
> > > +++ b/include/hw/boards.h
> > > @@ -166,6 +166,12 @@ struct MachineState {
> > >      char *initrd_filename;
> > >      const char *cpu_model;
> > >      AccelState *accelerator;
> > > +
> > > +    int sockets;
> > > +    int cores;
> > > +    int threads;
> > > +    int maxcpus;
> > > +    int cpus;
> >=20
> > Hrm.. as the tests added in earlier patches highlight, essentially one
> > of these properties is redundant.  Is there a reason to include them
> > all, rather than to pick one to drop?
>=20
> Well, IMO, only maxcpus could be dropped. I'd prefer not to though
> because it's a convenient state to have pre-calculated, and possibly
> error prone to leave to all users to re-calculate.

Sorry, to clarify.  I have no problem with having all 5 variables,
with one precalculated from the others.  What I'm not convinced is a
good idea is exposing all 5 as settable properties.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--1GSL5ZULXUIqbbH1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYKNnAAoJEGw4ysog2bOSobsP/2US8wGM6sQShEtVQRJ5bk3n
SiSMzgldvs6u2Ky7Q2bUPY2wRd4laLWGq6d28m3TER24PcR0SM5de6ob4aCMMmCl
/Wwel+dznkKiYyar0ikxbmhk5/y8HlgHl2MWmwldas+kr7tE+s2v8ECUYykggKbQ
Bv54tBiHuH+C6xbtNgXjX8ttvLqje3BVD6DQEE5F/QFm0Pb+dnNLhF7qgUsYwjDT
wU2KA0dLXEjhf8uoKsEZew1mrLZp47vFtn/uTLIta1LeW0y/uDuR0DjoAqbGBa/O
M3DVT5IYmsgBk3VrrSVFWnu5bfber6gdY5JfrtXRAX1X/fGEKaElnllu10t7C5LF
dh3oV1RfxG/L+o83yxhPo208iFg+DjwN7KPpwke8b8no8eA3smw0+ZCB0JsG/wA8
nLjwtkj/nQmMquSMBf8B7WK9vauIp7FtaeHzCjnXcmHvLdXoEPa6Tr8z9KOYhJjF
a8yxf4unC1RdwA8le+lL/zlB9oMa5RfHXdHbxD6jxDu80Zq1pC1TerkI00D3E0fH
1TbxHN+nt7vxDpYmdk8q1Uzf7f62oqfztrulDOYDkGihbEIRc5r010dW4Ckm3VRT
nkcvK4DdoTtnS7eRLRKgmaOMKEJCWN9opOQsT7YzkFX8XmG4ZCIR1aeyXCtID2cv
yWrJUiiGnoE0Y6KNFwdM
=UzTy
-----END PGP SIGNATURE-----

--1GSL5ZULXUIqbbH1--
