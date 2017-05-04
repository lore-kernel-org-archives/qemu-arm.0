Received: by 10.25.0.198 with SMTP id 189csp634548lfa;
        Thu, 4 May 2017 08:22:57 -0700 (PDT)
X-Received: by 10.31.98.196 with SMTP id w187mr371908vkb.96.1493911377378;
        Thu, 04 May 2017 08:22:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 102si1031605uac.41.2017.05.04.08.22.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 08:22:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42512 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6Iam-0000wq-Og
	for alex.bennee@linaro.org; Thu, 04 May 2017 11:22:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d6Iaf-0000uQ-PZ
	for qemu-arm@nongnu.org; Thu, 04 May 2017 11:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d6Iae-0007KU-AH
	for qemu-arm@nongnu.org; Thu, 04 May 2017 11:22:49 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38131)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d6Iad-0007Ic-SS; Thu, 04 May 2017 11:22:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wJf0h3M5qz9s3s; Fri,  5 May 2017 01:22:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1493911364;
	bh=wfWAVeVpTuG0YZfq7+6eCxsdnUoxtk00sVvebpjHchs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqM9juZWsCZmcspw+4uuq2J5TXZtA74hjdMrrQhdA+NTBAfBAovAkJrZpKgdmv6CS
	qNvPDAmTgwmEBwnZlG1sHd18KLuV19d1W6bYLoRqGQty8NrIWxXXlfw8T7w1afyqE4
	Jlztfa2txtq2mbpbQ+muF7XysrXWLFVxriHjHRRY=
Date: Thu, 4 May 2017 17:32:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170504073213.GE14413@umbus.fritz.box>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-6-git-send-email-imammedo@redhat.com>
	<20170503144240.GL3482@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline
In-Reply-To: <20170503144240.GL3482@thinpad.lan.raisama.net>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH v2 05/24] numa: move source of default CPUs
 to NUMA node mapping into boards
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
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YXD9Jk+l4Klz


--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2017 at 11:42:40AM -0300, Eduardo Habkost wrote:
> On Wed, May 03, 2017 at 02:56:59PM +0200, Igor Mammedov wrote:
> > Originally CPU threads were by default assigned in
> > round-robin fashion. However it was causing issues in
> > guest since CPU threads from the same socket/core could
> > be placed on different NUMA nodes.
> > Commit fb43b73b (pc: fix default VCPU to NUMA node mapping)
> > fixed it by grouping threads within a socket on the same node
> > introducing cpu_index_to_socket_id() callback and commit
> > 20bb648d (spapr: Fix default NUMA node allocation for threads)
> > reused callback to fix similar issues for SPAPR machine
> > even though socket doesn't make much sense there.
> >=20
> > As result QEMU ended up having 3 default distribution rules
> > used by 3 targets /virt-arm, spapr, pc/.
> >=20
> > In effort of moving NUMA mapping for CPUs into possible_cpus,
> > generalize default mapping in numa.c by making boards decide
> > on default mapping and let them explicitly tell generic
> > numa code to which node a CPU thread belongs to by replacing
> > cpu_index_to_socket_id() with @cpu_index_to_instance_props()
> > which provides default node_id assigned by board to specified
> > cpu_index.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>=20
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>=20
> Just two extra comments below:
>=20
> [...]
> > +static CpuInstanceProperties
> > +virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> > +{
> > +    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> > +    const CPUArchIdList *possible_cpus =3D mc->possible_cpu_arch_ids(m=
s);
> > +
> > +    assert(cpu_index < possible_cpus->len);
> > +    return possible_cpus->cpus[cpu_index].props;;
> > +}
> > +
> [...]
> > +static CpuInstanceProperties
> > +pc_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> >  {
> > +    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> > +    const CPUArchIdList *possible_cpus =3D mc->possible_cpu_arch_ids(m=
s);
> > +
> > +    assert(cpu_index < possible_cpus->len);
> > +    return possible_cpus->cpus[cpu_index].props;;
> >  }
>=20
> The fact that these two implementations look exactly the same
> made me wonder:
>=20
> 1) Why this isn't the default implementation;
> 2) Why exactly spapr needs a different implementation.
>=20
> Then I noticed that there's nothing in the common machine code
> that specifies that possible_cpus->cpus[] is indexed by
> cpu_index. This means it is indeed safer to require each machine
> to provide its own cpu_index_to_props implementation than having
> a default implementation that can unexpectedly break (e.g. if
> granularity at possible_cpus is not at VCPU/thread level).
>=20
> I would still like to have an abstraction that wouldn't require
> writing machine-specific code (e.g. cpu_index ranges to
> possible_cpus like David suggested), but that's for a follow-up
> series.

Yeah, that similarity bothered me to, but like you I realised the
problem is that spapr simply doesn't have the same granularity of
information as x86 and ARM - there's only one entry per core for PAPR
instead of one per thread.

So, we do need a machine specific mapping of cpu_index to location
properties, which is what the callback is for.

It does occur to me that another way of accomplishing that would be
for possible_cpu_arch_ids() to create a cpu_index->props mapping as a
simple array ofpointers, in addition to the list of possiblee props
structures.

Not sure if that would end up looking better or not.

> [...]
> > +static CpuInstanceProperties
> > +spapr_cpu_index_to_props(MachineState *machine, unsigned cpu_index)
> >  {
> > +    CPUArchId *core_slot;
> > +    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> > +
> > +    /* make sure possible_cpu are intialized */
> > +    mc->possible_cpu_arch_ids(machine);
> > +    core_slot =3D spapr_find_cpu_slot(machine, cpu_index, NULL);
> > +    assert(core_slot);
> > +    return core_slot->props;
> >  }
>=20
> If you need to submit v3, maybe a comment here explaining why
> spapr needs a different cpu_index_to_props implementation would
> be helpful. I took a while to figure it out.
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZCtj9AAoJEGw4ysog2bOSo7oP/0k4x31sVyXtnHIuuK6tOTgd
hK+UsIyxIDYD9U513sEypfb3hNd4bX4ZLECQPtZYrwf05KkW2Ul499SoKcxYxCYM
Vdb1WSUfNhhzcaNgk3bo5ID9b6+MqI3o8e2qFOWMLFqWlBNpPRezC1jWr0KXrBlj
VgLUpjRXubZ6hBKZsp4Zbu0SpW8lUqu/n2FujGQQRrdFS+y/rvyIIzOlqz9U6Ar8
rzYJhQ44Teamq5Q7d5gFg11fIZnSmtKxocqYkZ+rjaPGD79OftQ7nRYxWHwRI7US
w6kH7wx4hQOsaE1z+LVlq+58EX77UlkD2YExY8GHYyXxjQOO0ljEJKGfqPSi47eV
0PcCM7c1F6RkZYcuZ1e6NvEOGhQ5LbfNpxJwcD2git0xBajTfijzuJwN8Gz0IsHX
dLZ6qhIYWN+hOSv8Qy9ZlA16cW+O5Z7ZS6n031vd93HitTwzE/014greViNM+gw2
Tijs1KZo2kENA7cbmZP+VRlBG96/ME+oI8+NIGsyvFd6QE9+n2chdvETxi/ieoRe
kGf9cg597DBhJFF/UV7fbkLOMHQzSQdZ8UhhkKx63kVebtax9vNrxqJBv/KCzPgm
3+4tgH+nUdMrdn56UBJKA4BhbyHmVFmMQyyn5+1PoVNOizaAni86/DUMYQvgCM8Y
NW/wvaOv9+OC8Azh1HZw
=QDpq
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
