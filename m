Received: by 10.25.21.96 with SMTP id l93csp315909lfi;
        Tue, 14 Jun 2016 17:59:37 -0700 (PDT)
X-Received: by 10.55.25.155 with SMTP id 27mr23856987qkz.61.1465952377407;
        Tue, 14 Jun 2016 17:59:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o34si20317679qtd.10.2016.06.14.17.59.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 17:59:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCzBA-000816-Rn
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 20:59:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB6-00080m-K1
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCzB4-0007f6-VZ
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 20:59:32 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:48377)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCzB2-0007de-Vm; Tue, 14 Jun 2016 20:59:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTp7Z1vRKz9t1J; Wed, 15 Jun 2016 10:59:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465952362;
	bh=hZnma3uy1iUjrZQKovXeY2PtMgByruECM4HHETSFlXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsjX69BanPtdgz2B1dwtYeKLqjubExRVPv23Yeu/Jl4Pvr7cczuAwg1JG1f7osNRB
	jL52WdFxk0iyUMJH9MgJmd8QhYisLXiJ/VaFi2xN242N5hQmbaHRtKHuz9zGo4FLp9
	KEnhZyfRCXBjmVK71Ndb+rJdTmwAUaPUSWLTlUCU=
Date: Wed, 15 Jun 2016 10:56:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160615005620.GU4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-8-git-send-email-drjones@redhat.com>
	<575BB5AB.3010509@redhat.com>
	<20160612134810.posa6p4wyxhit4yt@hawk.localdomain>
	<20160614021216.GI4882@voom.fritz.box>
	<20160614061949.eh45x57tdimt6obr@hawk.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FoibaoN3dya3u5fy"
Content-Disposition: inline
In-Reply-To: <20160614061949.eh45x57tdimt6obr@hawk.localdomain>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 07/16] qom/cpu: make
 nr-cores, nr-threads real properties
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
	ehabkost@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Bharata B Rao <bharata@linux.vnet.ibm.com>, imammedo@redhat.com,
	dgibson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RY9uWyG3cW3G


--FoibaoN3dya3u5fy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 08:19:49AM +0200, Andrew Jones wrote:
> On Tue, Jun 14, 2016 at 12:12:16PM +1000, David Gibson wrote:
> > On Sun, Jun 12, 2016 at 03:48:10PM +0200, Andrew Jones wrote:
> > > On Sat, Jun 11, 2016 at 08:54:35AM +0200, Thomas Huth wrote:
> > > > On 10.06.2016 19:40, Andrew Jones wrote:
> > > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > > ---
> > > > >  qom/cpu.c | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >=20
> > > > > diff --git a/qom/cpu.c b/qom/cpu.c
> > > > > index 751e992de8823..024cda3eb98c8 100644
> > > > > --- a/qom/cpu.c
> > > > > +++ b/qom/cpu.c
> > > > > @@ -28,6 +28,7 @@
> > > > >  #include "exec/log.h"
> > > > >  #include "qemu/error-report.h"
> > > > >  #include "sysemu/sysemu.h"
> > > > > +#include "hw/qdev-properties.h"
> > > > > =20
> > > > >  bool cpu_exists(int64_t id)
> > > > >  {
> > > > > @@ -342,6 +343,12 @@ static int64_t cpu_common_get_arch_id(CPUSta=
te *cpu)
> > > > >      return cpu->cpu_index;
> > > > >  }
> > > > > =20
> > > > > +static Property cpu_common_properties[] =3D {
> > > > > +    DEFINE_PROP_INT32("nr-cores", CPUState, nr_cores, 1),
> > > > > +    DEFINE_PROP_INT32("nr-threads", CPUState, nr_threads, 1),
> > > > > +    DEFINE_PROP_END_OF_LIST()
> > > > > +};
> > > >=20
> > > > Are you aware of the current CPU hotplug discussion that is going o=
n?
> > >=20
> > > I'm aware of it going on, but haven't been following it.
> > >=20
> > > > I'm not very involved there, but I think some of these reworks also=
 move
> > > > "nr_threads" into the CPU state already, e.g. see:
> > >=20
> > > nr_threads (and nr_cores) are already state in CPUState. This patch j=
ust
> > > exposes that state via properties.
> > >=20
> > > >=20
> > > > https://github.com/dgibson/qemu/commit/9d07719784ecbeebea71
> > > >=20
> > > > ... so you might want to check these patches first to see whether y=
ou
> > > > can base your rework on them?
> > >=20
> > > Every cpu, and thus every machine, uses CPUState for its cpus. I'm
> > > not sure every machine will want to use that new abstract core class
> > > though. If they did, then we could indeed use nr_threads from there
> > > instead (and remove it from CPUState), but we'd still need nr_cores
> > > from the abstract cpu package class (CPUState).
> >=20
> > Hmm.  Since the CPUState object represents just a single thread, it
> > seems weird to me that it would have nr_threads and nr_cores
> > information.
> >=20
> > Exposing those as properties makes that much worse, because it's now
> > ABI, rather than internal detail we can clean up at some future time.
>=20
> CPUState is supposed to be "State of one CPU core or thread", which
> justifies having nr_threads state, as it may be describing a core.

Um.. does it ever actually represent a (multithread) core in practice?
It would need to have duplicated register state for every thread were
that the case.

> I guess there's no justification for having nr_cores in there though.
> I agree adding the Core class is a good idea, assuming it will get used
> by all machines, and CPUState then gets changed to a Thread class. The
> question then, though, is do we also create a Socket class that contains
> nr_cores?

That was roughly our intention with the way the cross platform hotplug
stuff is evolving.  But the intention was that the Socket objects
would only need to be constructed for machine types where it makes
sense.  So for example on the paravirt pseries platform, we'll only
have Core objects, because the socket distinction isn't really
meaningful.

> And how will a Thread method get that information when it
> needs to emulate, e.g. CPUID, that requires it? It's a bit messy, so
> I'm open to all suggestions on it.

So, if the Thread needs this information, I'm not opposed to it having
it internally (presumably populated earlier from the Core object).
But I am opposed to it being a locked in part of the interface by
having it as an exposed property.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FoibaoN3dya3u5fy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYKe0AAoJEGw4ysog2bOSwO4P/1vM//FgUqPKewA/GbIwKYeu
qay2TaOlziY99Y6lx33aVmJJI40ZE5Y4w1Eh2pU/2KJjhhtnNYgVXamiEPF02c7y
PBIOn3JkZD6xUxalooG5CmshWph8TcENrK36rX2CaEHTxyl+JgTB6tLFnIt/4Bne
79ushym5BobGBnqDJMJU4IZpuE9gj3mWdo6wMJ7Q1q2+EE6cJ7fXq+PLw+aR3/jQ
xMA3OWgzch6pfbkAgRnzdvjyw6DcqhSPQSu4Lq6OPCHmZQBOXysR6SJWWqqettBI
E4GQTlf9POxCjuujh06Ebp5QhhrN9lDn+1bM4W0opSLCiCZHeFNyzSaUYljSf7R4
yx/49kGENAOs3probhGYVqbQONpXEyPOCcPuzXMrWWYVL6Hxo3xD/r/rmYS4Vx48
CByw739HcHSz2PPax5Bi05Dpi02Z4VI6/6rJFp7cewpwjBACB6I37qdOto3DNb9q
zegft6iUBvGG/Haz8N/aymdmGTfC9CPsWo1ck4guSvUuZXicRE524kEW1COq8pTF
VzNhRe1MTTUGGMo2lUl/AsfFmM5G8FanVp0lyiYck6qNTmIjRrIwq68GQ32j2DW2
gLlCZuZ5W1pgCqNATAyzTkTvyliAmeJpkw2emHPWYjg8oTwNqpfnZJXvUptkh6QE
QqGyF7obxLW758MR6pUs
=WUiE
-----END PGP SIGNATURE-----

--FoibaoN3dya3u5fy--
