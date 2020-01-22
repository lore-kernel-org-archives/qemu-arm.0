Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2291844lfp;
        Tue, 21 Jan 2020 19:31:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqzd5/LaNbuZeHFY6ClzFnzKMwxrDUUHrAsi/EcQnaJfNIh4/kdnYcRJPzVlDPzZsTQ95yIU
X-Received: by 2002:ae9:f714:: with SMTP id s20mr8000767qkg.236.1579663876348;
        Tue, 21 Jan 2020 19:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579663876; cv=none;
        d=google.com; s=arc-20160816;
        b=bvQ7UkA2uPQEZKhN586V7cirH5q2SVZDep9W73DzFVwQjGcIVh7muR7q3JnO+yCxyl
         lvIU1tpvjL00fUw3WfDt7/e6u8O0QpErdppyHgbeq0isVfytwg3DbQ1h85QVclHvYFts
         UPt8tVw9pXNj0TLzUzFITVZm6X8SUl5Vn65G1NVPRSFAvPWr7hZqI57CFZofM17RsodY
         4M6dwmQOqllYn0TmLkPp7zBhYczJNms6Ypmfxr/s14/j05qyWX/N0r6e2IMTeYe3kAzQ
         xzwekjyTnepurw7XiMXmmvub3d041B2/UfcVy2EuRqVLSlmBBuIKo7uFx0Co7uDd21s3
         KXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=zqM5DV3+uzIKn1hZBTd2kUUD5Ce5V9BAhoEa5aZlQIo=;
        b=dWB7wLRCGVEhlkVcIK12yqlFJl2+L7z9NaPcE96mcatnXiYppKrWld/PoqGGhbtEYQ
         hrMwKZCz64zSYwozW0V+5h83LU1suiz8phMYA+2ikPhk8utdB+8XA4TBCL38vWFJ1aP3
         p0Q5pz8UDy1nuHo0l91cHheow268R1YDFjjGbp90NnK+wvdJlhqUtGFiJYEVZVlLEekd
         otd9m75+ahinXmXBhi3CdYoQbq9KfT5Hm0QMdZBO1oDsQspGTbaBz661siPntB+pEn3U
         dWaAzCkFXTxjtrokl2QniFsAb2muvO5msCTEzby2wxnnstusWdF9owvI/0NWp6GfcHRm
         cFKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=V2AIv1Yi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si23275878qkf.79.2020.01.21.19.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2020 19:31:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=V2AIv1Yi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iu6jb-0006bu-GT
	for alex.bennee@linaro.org; Tue, 21 Jan 2020 22:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iu6iJ-0005WH-MU
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 22:29:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iu6iI-0001b5-EO
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 22:29:55 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38617 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iu6iE-0001U0-Mp; Tue, 21 Jan 2020 22:29:51 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 482W9j65swz9sRl; Wed, 22 Jan 2020 14:29:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1579663785;
 bh=gjTAxwHzUT9Y2XJryNV78jmmw6wmxlDJiwWlvkg8lD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V2AIv1YiSaTJxJGYcpG5GJARvNowCbcT45DfepJElLR2zyBT4ytQXyeDoGsp7hhQr
 ZRoc7UyjSMLji4w6HepmTURDCG/wvRq8zPhdrg+sO/0uLcWQBdjbz4vzWm9CJ8zsV3
 xmbeWCr1uXGe51xePb+KTd9Z0xNo8wn4lwo1yhzc=
Date: Wed, 22 Jan 2020 14:27:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 03/10] hw/ppc/spapr_rtas: Remove local variable
Message-ID: <20200122032758.GH2347@umbus.fritz.box>
References: <20200121110349.25842-1-philmd@redhat.com>
 <20200121110349.25842-4-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="smOfPzt+Qjm5bNGJ"
Content-Disposition: inline
In-Reply-To: <20200121110349.25842-4-philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RNYCQ+TNM+nR


--smOfPzt+Qjm5bNGJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 12:03:42PM +0100, Philippe Mathieu-Daud=E9 wrote:
> We only access this variable in the RTAS_SYSPARM_SPLPAR_CHARACTERISTICS
> case. Use it in place and remove the local declaration.
>=20
> Suggested-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>


> ---
> v2: Do not reduce MachineState variable scope (David Gibson)
> ---
>  hw/ppc/spapr_rtas.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 6f06e9d7fe..85135e0e1a 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -268,7 +268,6 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU =
*cpu,
>  {
>      PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
>      MachineState *ms =3D MACHINE(spapr);
> -    unsigned int max_cpus =3D ms->smp.max_cpus;
>      target_ulong parameter =3D rtas_ld(args, 0);
>      target_ulong buffer =3D rtas_ld(args, 1);
>      target_ulong length =3D rtas_ld(args, 2);
> @@ -280,10 +279,10 @@ static void rtas_ibm_get_system_parameter(PowerPCCP=
U *cpu,
>                                            "DesMem=3D%" PRIu64 ","
>                                            "DesProcs=3D%d,"
>                                            "MaxPlatProcs=3D%d",
> -                                          max_cpus,
> +                                          ms->smp.max_cpus,
>                                            ms->ram_size / MiB,
>                                            ms->smp.cpus,
> -                                          max_cpus);
> +                                          ms->smp.max_cpus);
>          if (pcc->n_host_threads > 0) {
>              char *hostthr_val, *old =3D param_val;
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--smOfPzt+Qjm5bNGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4nwT4ACgkQbDjKyiDZ
s5IHpQ//cLXRksjKykIvTGt/oULaExpniGSv6KKkSZeN5dVrMLas9BRslr7kNOlU
gTud6nZVcIcbM7nP3p9Y040xstHR7v8MOFaz+gwWMjY4xxKNV2J3lTY8X+281t/K
LymrQkiLVJyHZEqspswbLrEBsD2+IEhovCstFuQPtj8zqZSy/XUp5OSDhxckgLlg
W9L0pYp5djFhXKbCHblGHFR22ziHioysWA/9hUTJiym4CpatX9/em18/pDlh8otO
I29lce+FMX1m1oNt3kI8UAUJdYt5j2Vh8V5SbVCLQZkLa7UVRJzkE3hL+3W0hxai
paHbXfsmySYKguxCsbzvlNaSFFUO8epSaG2DxCbFPJmGzzIN0wMjIep+vsnawSGt
KjDQWJGa0L0VMQ+fIp+UMFTddY2VM6pO99MyFcrKJoYsCHhOTEnLkxQwfZ5nlpaK
ch3qgPKTSjeE0R6nLki7aZQNdXP35is2TA9zgNwuEicvR4ECDfKNPLNSmzmZyaFi
vp8rAjCDX3A3gyFsE/0B8DmYA8+vEANrwW7Z+dfeL+47Bi5KO7FD0SK/N3QK31gm
Hz5otN6Ck857g/OIImzfzyf4+ZIF6YAQLCi03o2KdWOiUd2oJ9zCKfPE4jZCOez6
pXHvqZ+SP5c7rpS2IsZdmQ98+G+LLkyLQHJTZwX/eZwRMXM9G6Y=
=80hk
-----END PGP SIGNATURE-----

--smOfPzt+Qjm5bNGJ--
