Received: by 10.223.172.38 with SMTP id v35csp1011048wrc;
        Wed, 13 Sep 2017 05:54:45 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB1ZCX8s3QCSLqqykOUMqyO7ugfPr4I3Tu0VndaN946fhGbEe7l48UiFXF/YWXBaMEvFNxr
X-Received: by 10.200.46.124 with SMTP id s57mr9810727qta.182.1505307284966;
        Wed, 13 Sep 2017 05:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505307284; cv=none;
        d=google.com; s=arc-20160816;
        b=B1IwcH8rQZeEaddPAUCPCEHJgpBcC8fOAjsoBwQ5uQzVyG+hDq3d/QJWa5sMKCJOTy
         98F0UeOgjUktR1IoAYP28VZlAv0o5bh5AyPMOKWfBvybObw2pdKKofF/FeIcZ3uxQ3Fd
         O6pcZS5Hvs3r1EWIswQ/j6kHb/w+EmyfPZ0EYnlZ9GLSPvfpRxPZGV/v+BNvpSpQfAF4
         54d84Qc4/ndqjz9Sjd/u8aA3DAkZuLHGS38FO0GlmJIx4un5ZimcIsFeABXakCpWWpNg
         nVLmMaTrOSfJlHSLQeJrUsfJ0dhALLgbym6gpx7D1gASIkDfAQksSbsWji0vl/kgwxL+
         LS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=J/4/722sM7/gDbL5f5QcmbG3L1QxhLmMvZ7jHaDwdyw=;
        b=yjG3Eg3z4gdPQfjbCCtk8088b77FYiJJUastmffCZTh10NO3kDpw1XH1vRbM/iZM5s
         EWYGspoqz6XLNhnIRDo10ykVPh2e/cSXDNBgKedtobVa/opZ2ii4ZtGcs948PpJCmUzG
         Y4A3jv709+HtCp72KFBlbMNcmyNdtTwj3gP0JSndZGxDozYr0vLzQLxs3agKoBdgR4os
         CuQd5yed7og84n56WA1Vv42XbGWJ9pF5iMyN7hz/pd2arLgKoJUFt9LqHQqQAu40l/0k
         NK0FV+jQLaAIUFIKiQ5c0vi8sdnTPy3N6JQFF1jl6li0EE6uN/wppDowUcnEnPmMnuwd
         ZrRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=oUl4oGep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y2si14303853qkc.14.2017.09.13.05.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 05:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=oUl4oGep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds7Bi-0003hn-HU
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 08:54:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ds7BW-0003g7-LZ
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 08:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ds7BS-0003m4-NX
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 08:54:30 -0400
Received: from ozlabs.org ([103.22.144.67]:54361)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1ds7BS-0003jQ-7D; Wed, 13 Sep 2017 08:54:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xshSb1Smpz9sNr; Wed, 13 Sep 2017 22:54:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1505307263;
	bh=5nnesn5c52zszyYAu2HRH6+ikLQJK8yMQbKTeWos8WU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oUl4oGepxXkk+IFTWdAtg0uY+tfKfK1ahkyAD5MhLmVEgatZbnJROFiQzyy/mXnVj
	+FsC9pj+hXe31oAdx091zi4UADhSNTR8KFtdG1LdtWXPt5233zm2bPwDFSBQGOUg/X
	sj65AIIU29nRunyhvhAAg0eepp0JUffOKf20rn+A=
Date: Wed, 13 Sep 2017 22:54:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20170913125404.GE3972@umbus.fritz.box>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
	<20170913053533.GF7550@umbus.fritz.box>
	<20170913124456.GB2096@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gDGSpKKIBgtShtf+"
Content-Disposition: inline
In-Reply-To: <20170913124456.GB2096@work-vm>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hmp: fix "dump-quest-memory" segfault
 (ppc)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /983NzVE63ZH


--gDGSpKKIBgtShtf+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2017 at 01:44:57PM +0100, Dr. David Alan Gilbert wrote:
> * David Gibson (david@gibson.dropbear.id.au) wrote:
> > On Tue, Sep 12, 2017 at 04:01:47PM +0200, Laurent Vivier wrote:
> > > Running QEMU with
> > >     qemu-system-ppc64 -M none -nographic -m 256
> > > and executing
> > >     dump-guest-memory /dev/null 0 8192
> > > results in segfault
> > >=20
> > > Fix by checking if we have CPU, and exit with
> > > error if there is no CPU:
> > >=20
> > >     (qemu) dump-guest-memory /dev/null
> > >     this feature or command is not currently supported
> > >=20
> > > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >=20
> > Applied to ppc-for-2.11.  I'm not really sure what to do with the rest
> > of the series though.
>=20
> I can take the whole set through HMP.

Great, thanks.

>=20
> Dave
>=20
> > > ---
> > >  target/ppc/arch_dump.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> > > index 8e9397aa58..95b9ab6f29 100644
> > > --- a/target/ppc/arch_dump.c
> > > +++ b/target/ppc/arch_dump.c
> > > @@ -224,8 +224,15 @@ typedef struct NoteFuncDescStruct NoteFuncDesc;
> > >  int cpu_get_dump_info(ArchDumpInfo *info,
> > >                        const struct GuestPhysBlockList *guest_phys_bl=
ocks)
> > >  {
> > > -    PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
> > > -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> > > +    PowerPCCPU *cpu;
> > > +    PowerPCCPUClass *pcc;
> > > +
> > > +    if (first_cpu =3D=3D NULL) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    cpu =3D POWERPC_CPU(first_cpu);
> > > +    pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> > > =20
> > >      info->d_machine =3D PPC_ELF_MACHINE;
> > >      info->d_class =3D ELFCLASS;
> >=20
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--gDGSpKKIBgtShtf+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm5KmwACgkQbDjKyiDZ
s5IZzhAAhk3qwxJmwrlO68yggZAs7JP7bQc40GOiBRXgCVMADTWwO0Zjym5/2kLm
szuGxwLaGkUM+I9cLYqdxERV3C6nRMCe2UDtrQx8foXyFaygT1V+DL5Gt2vmT7iy
z6ZTCstyS0wCWWg2VP0x0ZsPzuoJbnRd4xIvQhI7IyVQFkJrm/5TTftjoHf/xD54
52xG2P2c5UVxUjQ5UPwTNCIE9m+foP8ipX0bQLqWdnHhVuBygDSlNKFeiNMFw3NN
625wulMzb7pet8rFoIC4AVtXD8NlRYxrRlSmBbjjsoRf7fOEtDrhrW0jUEeseJzt
ZZBF+qzqaZ8qeH3VeISLQH5ja3Vq76yw9QyJo2QaWurSYaa3PhXRQBNBAlvi0Y9u
cXL90PibW+5Zu8oXiyQRg//SxOYegLTDtA5jjQODjEBZOPEJRZZ31pKE2PnzPk4u
BruMOd641ewVQFTRTz7Q7OCHZW33GnqpYaoXHwdytz/YHoY0HcvMJ7aLCjWt72AA
dcyRCDzSQDCcB6JE0Hlm8igIg+mw435X0QHIygdpoSm0qUPd8RGFgSQHcgtkoh48
U259lfDP3Eu8yvQ18ogbmyQ9kNciRHYYdnjd1Mf3ZdCLuYuSiwPZ1wOZ5xJjOqD7
OBwO3ZqGSMr1M3M9lABUjNEXeaXnYrWYFjIT4imbm5NVPLEk1V0=
=+XJF
-----END PGP SIGNATURE-----

--gDGSpKKIBgtShtf+--
