Received: by 10.25.0.6 with SMTP id 6csp1901524lfa;
        Tue, 30 May 2017 09:41:48 -0700 (PDT)
X-Received: by 10.55.163.88 with SMTP id m85mr22564464qke.118.1496162508775;
        Tue, 30 May 2017 09:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496162508; cv=none;
        d=google.com; s=arc-20160816;
        b=eT0GE9R/rw0qnqXaBFoYvtuZSufMRhl7HOGEmm4al5DjEQv4e10QyVaw7kmHN1aKx+
         H2NQ5bsCwfu8PJV4NeOKer2ZxZ3nD8L63ys1WldgXG8n9yIK5oVC9uIeDkhWI8CydXbq
         +1fhVab1YS84QlnuYJ9UjK8UMHI2cjQm/9/RUgZTdA+drpmXvU4WiH0u8eUZ/zT+ksTM
         t5HhJ6MZd8gryrVYOg+ODm6siTzwmAmR6JPBzRJmR12YURm7nD34isxa5B5i4hhI6Ag8
         4QtzlvpxcRto5Hyplr9SoNjDV6v0Yn08NwjWG9mkFgY45nW0KewgGWAMlKmLYsGD8s4P
         9wCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=juY/4VHF3Tu3C3K3MO22R+HLJPRftxbN7crnr7L4ZNY=;
        b=aBKzTJxA670IAtlDJ4W3+HgaTZU6niRHdngHRxmThK85fu6GkxRNjm6gw1yyRhTPfJ
         DyzBA6cjMobe994oRhgvqCQjhl6zirfTmkQZxUnh1/RKi55IkxXZpr6/ZfYvUQ7Qspyf
         6nj+uLbltN7Px0dnRAfwRBPAzRXnz7f0ujpkF10uI6z6C7/OCNBYuuOEgaYCqRSYbXsv
         jjQ9k4L5C1+lRoOk8XTpZ68XViJ9mtVYGx3sK0GEL8xpi/fs6HomC5gqvRA6Y2rJSR/J
         pk41K36PVLc0uoCW96NOI07vo2VnBZqq0pkdGOTFS3UpkiV8ULsMGXDbzamt6C1biGEA
         HSBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4si12910136qtg.228.2017.05.30.09.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 09:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFkDM-0008Jj-9Z
	for alex.bennee@linaro.org; Tue, 30 May 2017 12:41:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dFkCJ-0007s5-Li
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:40:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1dFkCF-0004KN-6m
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:40:43 -0400
Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144]:56373)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1dFkCE-0004I4-GH
	for qemu-devel@nongnu.org; Tue, 30 May 2017 12:40:39 -0400
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 7038C1001FF
	for <qemu-devel@nongnu.org>; Tue, 30 May 2017 18:40:30 +0200 (CEST)
Received: from bahia.ttt.fr.ibm.com (gar31-1-82-66-74-139.fbx.proxad.net
	[82.66.74.139]) (Authenticated sender: groug@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id DD5C652008B;
	Tue, 30 May 2017 18:40:23 +0200 (CEST)
Date: Tue, 30 May 2017 18:40:22 +0200
From: Greg Kurz <groug@kaod.org>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170530184022.4d17218a@bahia.ttt.fr.ibm.com>
In-Reply-To: <1496161442-96665-7-git-send-email-imammedo@redhat.com>
References: <1496161442-96665-1-git-send-email-imammedo@redhat.com>
	<1496161442-96665-7-git-send-email-imammedo@redhat.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/TwaYBt3u1oFZ_zhMq79sY_d";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 11564680895817750894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrgeeggddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.174.144
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH v3 6/7] spapr: cleanup
 spapr_fixup_cpu_numa_dt() usage
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tZOlVhZvvLp5

--Sig_/TwaYBt3u1oFZ_zhMq79sY_d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 30 May 2017 18:24:01 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> even though spapr_fixup_cpu_numa_dt() has no effect on FDT
> if numa is disabled, don't call it uselessly. It makes it
> obvious at call sites that function is need only when numa

s/need/needed

> is enabled.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 34bb03d..96a2a74 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -178,10 +178,8 @@ static int spapr_fixup_cpu_smt_dt(void *fdt, int off=
set, PowerPCCPU *cpu,
>      return ret;
>  }
> =20
> -static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, CPUState *cs)
> +static int spapr_fixup_cpu_numa_dt(void *fdt, int offset, PowerPCCPU *cp=
u)
>  {
> -    int ret =3D 0;
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
>      int index =3D ppc_get_vcpu_dt_id(cpu);
>      uint32_t associativity[] =3D {cpu_to_be32(0x5),
>                                  cpu_to_be32(0x0),
> @@ -191,12 +189,8 @@ static int spapr_fixup_cpu_numa_dt(void *fdt, int of=
fset, CPUState *cs)
>                                  cpu_to_be32(index)};
> =20
>      /* Advertise NUMA via ibm,associativity */
> -    if (nb_numa_nodes > 1) {
> -        ret =3D fdt_setprop(fdt, offset, "ibm,associativity", associativ=
ity,
> +    return fdt_setprop(fdt, offset, "ibm,associativity", associativity,
>                            sizeof(associativity));
> -    }
> -
> -    return ret;
>  }
> =20
>  /* Populate the "ibm,pa-features" property */
> @@ -321,9 +315,11 @@ static int spapr_fixup_cpu_dt(void *fdt, sPAPRMachin=
eState *spapr)
>              return ret;
>          }
> =20
> -        ret =3D spapr_fixup_cpu_numa_dt(fdt, offset, cs);
> -        if (ret < 0) {
> -            return ret;
> +        if (nb_numa_nodes > 1) {
> +            ret =3D spapr_fixup_cpu_numa_dt(fdt, offset, cpu);
> +            if (ret < 0) {
> +                return ret;
> +            }
>          }
> =20
>          ret =3D spapr_fixup_cpu_smt_dt(fdt, offset, cpu, compat_smt);
> @@ -538,7 +534,9 @@ static void spapr_populate_cpu_dt(CPUState *cs, void =
*fdt, int offset,
>      _FDT((fdt_setprop(fdt, offset, "ibm,pft-size",
>                        pft_size_prop, sizeof(pft_size_prop))));
> =20
> -    _FDT(spapr_fixup_cpu_numa_dt(fdt, offset, cs));
> +    if (nb_numa_nodes > 1) {
> +        _FDT(spapr_fixup_cpu_numa_dt(fdt, offset, cpu));
> +    }
> =20
>      _FDT(spapr_fixup_cpu_smt_dt(fdt, offset, cpu, compat_smt));
> =20


--Sig_/TwaYBt3u1oFZ_zhMq79sY_d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlktoHYACgkQAvw66wEB28JlrwCfU4yPte3Enl81bZ9orbUKLwZh
HfwAmgMTv6N9i+uKzPiHku7PIljsbqhU
=apUd
-----END PGP SIGNATURE-----

--Sig_/TwaYBt3u1oFZ_zhMq79sY_d--
