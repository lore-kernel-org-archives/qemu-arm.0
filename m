Received: by 10.25.141.12 with SMTP id p12csp3131lfd;
        Mon, 13 Jun 2016 20:02:43 -0700 (PDT)
X-Received: by 10.55.107.6 with SMTP id g6mr17181530qkc.166.1465873362996;
        Mon, 13 Jun 2016 20:02:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n123si8667167qkb.269.2016.06.13.20.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 20:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCeck-0008Rh-Fl
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 23:02:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCece-0008RJ-Q8
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 23:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCecc-0006ya-Kf
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 23:02:35 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCecb-0006y8-Px; Mon, 13 Jun 2016 23:02:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTDw42LMNz9t0X; Tue, 14 Jun 2016 13:02:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465873348;
	bh=/KIGeAG4ZApK0mFV9XnaBJxs6JBIpL2R8dBt+nlg/a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/ajE/utXUZNquayyJdWcQvL3mCUNQNiA1evFWsj994iFwKEXdlZhKMsc6XMyAywM
	TMp4/HBTt5PaORQmgOx79euMXIslORMqV/5ajlZ1ZG6CHKrMEzud91nriIYooTLEj2
	ypiBQ8SdOwr8ZjqJyccA5hbmRLSyWm5wMObHhh6w=
Date: Tue, 14 Jun 2016 12:12:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160614021216.GI4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-8-git-send-email-drjones@redhat.com>
	<575BB5AB.3010509@redhat.com>
	<20160612134810.posa6p4wyxhit4yt@hawk.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3U8TY7m7wOx7RL1F"
Content-Disposition: inline
In-Reply-To: <20160612134810.posa6p4wyxhit4yt@hawk.localdomain>
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
	ehabkost@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Bharata B Rao <bharata@linux.vnet.ibm.com>, pbonzini@redhat.com,
	dgibson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4esEk8t9oJOW


--3U8TY7m7wOx7RL1F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 12, 2016 at 03:48:10PM +0200, Andrew Jones wrote:
> On Sat, Jun 11, 2016 at 08:54:35AM +0200, Thomas Huth wrote:
> > On 10.06.2016 19:40, Andrew Jones wrote:
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > ---
> > >  qom/cpu.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >=20
> > > diff --git a/qom/cpu.c b/qom/cpu.c
> > > index 751e992de8823..024cda3eb98c8 100644
> > > --- a/qom/cpu.c
> > > +++ b/qom/cpu.c
> > > @@ -28,6 +28,7 @@
> > >  #include "exec/log.h"
> > >  #include "qemu/error-report.h"
> > >  #include "sysemu/sysemu.h"
> > > +#include "hw/qdev-properties.h"
> > > =20
> > >  bool cpu_exists(int64_t id)
> > >  {
> > > @@ -342,6 +343,12 @@ static int64_t cpu_common_get_arch_id(CPUState *=
cpu)
> > >      return cpu->cpu_index;
> > >  }
> > > =20
> > > +static Property cpu_common_properties[] =3D {
> > > +    DEFINE_PROP_INT32("nr-cores", CPUState, nr_cores, 1),
> > > +    DEFINE_PROP_INT32("nr-threads", CPUState, nr_threads, 1),
> > > +    DEFINE_PROP_END_OF_LIST()
> > > +};
> >=20
> > Are you aware of the current CPU hotplug discussion that is going on?
>=20
> I'm aware of it going on, but haven't been following it.
>=20
> > I'm not very involved there, but I think some of these reworks also move
> > "nr_threads" into the CPU state already, e.g. see:
>=20
> nr_threads (and nr_cores) are already state in CPUState. This patch just
> exposes that state via properties.
>=20
> >=20
> > https://github.com/dgibson/qemu/commit/9d07719784ecbeebea71
> >=20
> > ... so you might want to check these patches first to see whether you
> > can base your rework on them?
>=20
> Every cpu, and thus every machine, uses CPUState for its cpus. I'm
> not sure every machine will want to use that new abstract core class
> though. If they did, then we could indeed use nr_threads from there
> instead (and remove it from CPUState), but we'd still need nr_cores
> from the abstract cpu package class (CPUState).

Hmm.  Since the CPUState object represents just a single thread, it
seems weird to me that it would have nr_threads and nr_cores
information.

Exposing those as properties makes that much worse, because it's now
ABI, rather than internal detail we can clean up at some future time.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--3U8TY7m7wOx7RL1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX2f/AAoJEGw4ysog2bOS5j0P/jCBQHMxLkUxmwPo1UpokiaP
9gq/w5tq1dAs/wxQqSZVa02kYkjQ1Qyu/OTuMeqk6CYB2m1/LGO3x6/DDNINdbOC
n6EtCfUn/vD1RXk//IbFGKjfMCGwTcJFa0Gd+xn5G9rl7p1yzmFiq2t4iKqtZH1N
XLGR21GSYRWC7NZigvcX4uP012013i3JzqUWnskP14ngbeF0lsij9ZlpCjUi2pd3
UzSkFcPsm/srNz+ujUdD5+174Z07NoVE0zOEzbyr4ec4WLQq3x5a2ZUoqgR3isnu
6Zbuo4PWKXKUjgF5kqaHMtG0tNbL/9ynuZH1MzMAUKAgAJy8tuB8wFD0KTsQ8z2z
VVN0HTPeuH2IbqEFpNFSVJs67NjdRTfbb/MNBccfjkzoWLgSrH+6ADz0Eu5Pxf/1
5Y4dTbA5EdP9sEp8RIyhl2RyaoEElrPZgvrMof9PMI9vz4gaowblL2ihAfNL+M65
CZnc2KzWq21ObBpys8ECPMR1spLnIvw0MxojK04eB+/tvimgR1IYQ/TlhByl2HW2
jYWx5DQ9ncj7fHeCuJPMeYIP02Gl8cSWTMovWDB/yYL2cuLAReho7L/kGIAcOlis
4p2nikke8j4hbQ93NOKETzzATglyfRfgMzOmadZiQXwXlCi2a25PiAyOGL7GkNIW
JT7M/O2OjaDIC1Xk3d2h
=kge2
-----END PGP SIGNATURE-----

--3U8TY7m7wOx7RL1F--
