Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9917954wrt;
        Wed, 5 Dec 2018 14:41:03 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WcCfvUWRZf7+i0aR2s6SBVhnmrkiSmOmwBhjPha4QwsiX9ZGGBYJJtlMdGAqPlWbeONdYa
X-Received: by 2002:a37:4cd7:: with SMTP id z206mr24917627qka.233.1544049663676;
        Wed, 05 Dec 2018 14:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544049663; cv=none;
        d=google.com; s=arc-20160816;
        b=r3ZZyEXyTc9x2kjKHzg/DrU/m3GPQOVfnIPcBX0oEoLZPsf+N4YRJtuKzMDq2KiibT
         XWx7m1lZ8KMdbJASuirEC0SMLHbGohdnnk7JMD6VCdSUCEgBrTg0JXSl/1xVdwyECtmD
         huWRTgtFYuGOG4Y/ycHX2sPSHwjN+s7aVSc5zHULcaIvsvLxV/3h4KTETt8XJPM8Za/n
         eZGOAazcmRraB96P6q7gZph1mpw7Dx9QWN/5WIKmHnWG5o1VminlV6LCpa4MehLK0Wj+
         icHyN15Bsfk5GT0q8rzwyg+P3gWSWwAk4D6CdtY4x9AmODqi1vUmuNAvPEDk90QM5/Zm
         7q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=EzKyT1WUtLmoSnCzSAE7saoXUJb7xFMRBYFsBSB7oIs=;
        b=xEgCHVt+XQZYuL/2oB54oUBFse+luNRvPQ77VzAgc3zJidiicEj2e8CUIc8vlUScX6
         yyEerdPWyw0wAmsFmFFlkQF7CW6GEJyolsNGDi6B0DuGZdLX04/q8La0siWf0MkLP6hs
         H0cQJ+PbY6kR8MA84J8uKvox41NdZqUmFTYOBc+1hdF42H6yGahnlzlyHdpktBUbD1sX
         qaU1R/RZF3zRuKQw5e/FAYeJkLWkZBM4UXC2OqJUtxwaskuXtqIUTS1Ui6QA0cQzXn98
         pVy3gzl932qhPjBrjE8NARhMavxpcKsKB9nIg8/cVFo9j6zOUfdc2/mZwndjEuxGBYlj
         rfRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b="Z7tU/7cV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m13si2291184qtq.259.2018.12.05.14.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 14:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b="Z7tU/7cV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUfqp-0001En-2H
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 17:41:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gUfoi-0007u0-Bo
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 17:38:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gUfof-00052k-Hv
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 17:38:52 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:53281)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gUfoe-0004Ao-Ru; Wed, 05 Dec 2018 17:38:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 439DCz6HnYz9s6w; Thu,  6 Dec 2018 09:38:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1544049519;
	bh=Vwec+5Lb9Ch8zzuIgHRFM8G52ilv6BuKZUvi6aqgsPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7tU/7cVQ9fhB6NfMwNBQu2FGuMC7IkL7JsQSlwRGimu4hom1MsUthKmt88DZaB4y
	FwEBbl5LMf7dmFUEjkKTb7iJXbyRXOgYt33rEkviAdhbiMxLvOI8cjaVk6Fe4tUDKD
	kFG3L5UvXMhN3aWQUgyucXXMllet7i8vXoRrIBHo=
Date: Thu, 6 Dec 2018 09:29:48 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181205222948.GG768@umbus.fritz.box>
References: <20181205205827.19387-1-ehabkost@redhat.com>
	<20181205205827.19387-4-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z9ECzHErBrwFF8sy"
Content-Disposition: inline
In-Reply-To: <20181205205827.19387-4-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH for-4.0 3/5] spapr: Use default_machine_opts
 to set suppress_vmdesc
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ybKHnhCUPyn


--z9ECzHErBrwFF8sy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 06:58:25PM -0200, Eduardo Habkost wrote:
> Instead of setting suppress_vmdesc at instance_init time, set
> default_machine_opts on spapr_machine_2_2_class_options() to
> implement equivalent behavior.
>=20
> This will let us eliminate the need for separate instance_init
> functions for each spapr machine-type.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index f6b60e6fbd..0c3b27a8cc 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4368,13 +4368,13 @@ DEFINE_SPAPR_MACHINE(2_3, "2.3", false);
>  static void spapr_machine_2_2_instance_options(MachineState *machine)
>  {
>      spapr_machine_2_3_instance_options(machine);
> -    machine->suppress_vmdesc =3D true;
>  }
> =20
>  static void spapr_machine_2_2_class_options(MachineClass *mc)
>  {
>      spapr_machine_2_3_class_options(mc);
>      SET_MACHINE_COMPAT(mc, SPAPR_COMPAT_2_2);
> +    mc->default_machine_opts =3D "modern-hotplug-events=3Doff,suppress-v=
mdesc=3Don";
>  }
>  DEFINE_SPAPR_MACHINE(2_2, "2.2", false);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--z9ECzHErBrwFF8sy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlwIUVwACgkQbDjKyiDZ
s5Jh0RAAjEWhdwXw6e4q3OY47a6vraX1Ce5YZ/ZX4dD1yw1dORiI5j8aLqQpK8GJ
t2ezZocEasi2GGiWbyfLxworJ5zE4hRhOXnGLXtPEFdvSX0fe5qfgb+8tdVcN9z4
kPl1eEWtrnzuTvNilLwFHP7sbnLmhqRfv1eLh+64Bm6q0DqnTEoIxsub+JYnso+H
6bb02rP9ynx58nj2DEp2PU7Ucdrbky1wuhbXyttDOKakfLgCObMlQblKGZ+k4Ynt
BYYX9rkVByRZAjJemfAc6KnEnUVORPBOKkkJz71JGoF/kpn2XjiEOOXTe8/Jl1PE
rik95eUSFCrvm/u2yat492ukZ6NoHIgNVm+2k1yVydPAOR31oPxjjJ2ksF1rS+pJ
OxCoygBF+HTksypQCUfJZe0yyZe+VYdt4rd27PslhocvhoILw9fQjiFUI2+nc3nY
yEYv6erDMuUuH6U7uFvgwANzdLTqSuUnuj4SXRHBt/O6htZPsfFq0JdFG3D1mX1z
0WWOblK3ULPk8+AcocgK9lQ1U9o4kS4imL8Fm3pk5AnBtp2y1B8wyTVPryODsxd/
CEO3P3kMLqU45OUpx3hvZYj8bo53GQqJoVtvVETCQz7dC72LQSV2P+DorzHgpoh1
/WmQnaEZ85aX4C15ICkOjhrsWHwPhYfOqe+JgzqadWQvqDJmVs4=
=/aQo
-----END PGP SIGNATURE-----

--z9ECzHErBrwFF8sy--
