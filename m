Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1374495wrq;
        Wed, 20 Jun 2018 17:38:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJY5z03M1ZBFamRpH7po5F01aoORc4icyWDmLEKpu+aXDDRaUxnBDc6/H8HWbosexrQNh01
X-Received: by 2002:ac8:24fa:: with SMTP id t55-v6mr21729159qtt.196.1529541537061;
        Wed, 20 Jun 2018 17:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529541537; cv=none;
        d=google.com; s=arc-20160816;
        b=HCt2+lc85WcuFhaV2OhHw+5klWpkPe5eBQe6YMpTqIFKYaqw+6NHjx/+qNNwkvumRS
         zVtJRE0jpUqctJTdrpkRUl1RDXrdpl3knJS4NoNDO2UccP9e3/IemV8CLt78ks/MrCg0
         mk4JPNIfsrk3/MHN/0OmkyhL1HBI3sDMhClDkUYkASrQkQ2zPaDbdPonFvmPwXnXjtb7
         Ai+umTNK23USWdmT0tYBeAgI1VEdzMSRmo5YnOGVAseHHrjdbUJvLN52qkNARUliui4J
         Mv4rwGN2I3xZnFRM4NapDDUh4pJ8dOMrFcrP07sg1HqvR5jtfJ7XgOYHVcLOLbqQceyK
         TGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=Vr13yIe8Yj2J2M8+f3Na39TjPFtr/QA0Ld9t+wyXm4M=;
        b=CfUnAudJyZ9UX9cGEON7Xyv8AXuhoj/S9tXGYsqWqwAwVzQrrK474+I2KPp/iEq48l
         PHgdYWjtEzKg4/tU20pCSXP4/upqvNB4HWc9VMnlJ5ZFvyX3SwOXggqF8abrsODixOKY
         3iWuPGokqmqka4/znbGXvaPou6tBnpI6doRFwE3zw2y5dH9ZFDny6fVMAJsiuTCeuTdt
         nZVi6hgtO8fY/z3b9GWNdVjgT5iJgTTPymFr/22v7mYHTNOHX8tK4CKDJRjOsbFO3gNZ
         M9PJsDG4Q4veyXD1pusLTSOSNAaPvOrxXf2EkmWvq0tlH5e7M+TmqP9q4D0aJC2448HG
         0FPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Ne5MTOJ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d36-v6si1461951qtk.281.2018.06.20.17.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 17:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Ne5MTOJ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVncm-0005LI-JY
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 20:38:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fVncc-0005KN-AB
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 20:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1fVncZ-0006IJ-5w
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 20:38:46 -0400
Received: from ozlabs.org ([203.11.71.1]:43805)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1fVncY-0006AY-35; Wed, 20 Jun 2018 20:38:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 41B2qv1Sxfz9s3T; Thu, 21 Jun 2018 10:38:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1529541515;
	bh=tmxkQY/f1j3A7Q5mlcZux+0CDhQIU4n25PqUxIR4Ok8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ne5MTOJ8AgKzhr65c9kEKgSUpFob2HsGuW0KerjlsvgLFUU4vbn57tnzuzCAWb0E+
	Sr18raQnWbUeYrLDvs7JVQBklp2oWn+cB9XHpqdSUF5pxP0bxjaf7aLlJDHRkOxmvM
	KXRB4GEzhtT8uj1u7VVW0Ht0nwAeYPR7tWEr3fQk=
Date: Thu, 21 Jun 2018 10:36:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180621003656.GA32328@umbus.fritz.box>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-3-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline
In-Reply-To: <1529500053-21704-3-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-arm] [RFC 2/6] hw/boards: Add a MachineState parameter to
 kvm_type callback
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, suzuki.poulose@arm.com,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CCisbijuY7j9


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2018 at 03:07:29PM +0200, Eric Auger wrote:
1;5202;0c> On ARM, the kvm_type will be resolved by querying the KVMState.
> Let's add the MachineState handle to the callback so that we
> can retrieve the  KVMState handle. in kvm_init, when the callback
> is called, the kvm_state variable is not yet set.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

ppc parts

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  accel/kvm/kvm-all.c   | 2 +-
>  hw/ppc/mac_newworld.c | 2 +-
>  hw/ppc/mac_oldworld.c | 2 +-
>  hw/ppc/spapr.c        | 2 +-
>  include/hw/boards.h   | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index ffee68e..0590986 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1550,7 +1550,7 @@ static int kvm_init(MachineState *ms)
> =20
>      kvm_type =3D qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
>      if (mc->kvm_type) {
> -        type =3D mc->kvm_type(kvm_type);
> +        type =3D mc->kvm_type(ms, kvm_type);
>      } else if (kvm_type) {
>          ret =3D -EINVAL;
>          fprintf(stderr, "Invalid argument kvm-type=3D%s\n", kvm_type);
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 744acdf..1409d9e 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -492,7 +492,7 @@ static void ppc_core99_init(MachineState *machine)
>      qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>  }
> =20
> -static int core99_kvm_type(const char *arg)
> +static int core99_kvm_type(MachineState *ms, const char *arg)
>  {
>      /* Always force PR KVM */
>      return 2;
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 4608bab..1211fcd 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -363,7 +363,7 @@ static void ppc_heathrow_init(MachineState *machine)
>      qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>  }
> =20
> -static int heathrow_kvm_type(const char *arg)
> +static int heathrow_kvm_type(MachineState *ms, const char *arg)
>  {
>      /* Always force PR KVM */
>      return 2;
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index f59999d..faf078e 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2834,7 +2834,7 @@ static void spapr_machine_init(MachineState *machin=
e)
>      }
>  }
> =20
> -static int spapr_kvm_type(const char *vm_type)
> +static int spapr_kvm_type(MachineState *ms, const char *vm_type)
>  {
>      if (!vm_type) {
>          return 0;
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index ef7457f..78f90a1 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -170,7 +170,7 @@ struct MachineClass {
>      void (*init)(MachineState *state);
>      void (*reset)(void);
>      void (*hot_add_cpu)(const int64_t id, Error **errp);
> -    int (*kvm_type)(const char *arg);
> +    int (*kvm_type)(MachineState *ms, const char *arg);
> =20
>      BlockInterfaceType block_default_type;
>      int units_per_default_bus;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlsq8yUACgkQbDjKyiDZ
s5Kq3g/+IxbVReMLAbG4RO+aldpkcs/GZqoDwq+QmQ08f3PWdF84Pm7yJHHmtX3G
HOOuXFEImplbWxhu3PVTvrir9MxO7uWqFwga/7s9kTjt19p+WOnsBt+7rQYaqgDp
wTxHtEmNeAjWR9Do4RQXpHq/l4NXVXiBlUQMTfmdjtia5HEB3zNbHlr6K0udt3Ey
kAu5Dy76dnKjiprucFVb1xSK9SM5ONjExgtSzFXpB4JPH7/Lq0jIqiKHApSGu6ZV
Hh1qdUpFbtNwFWRMqG5HEtw7TYAD86WXyVWfIVIxupIGH3PcaeM3Tkj0yBgL+5Sy
amorhzGquYMR3lupnKXGcZ/XX4fB5Iu3OdUmiPOCyE25O9QT5BMJEMV7kUWSotho
fki63HC2mNW6KLdphBx7a9MMmSFJYj7A4tbEXx/sMlOyVAhIbQNeEdtPrDbFEBuW
YY05U05jNuG1wQg/eH4ktnoACpqRC4Fu1fL99jmLbvCmAF1xInAeMwdH27q0kpD+
tPPWiKUXyxCxkiBNOkNXRDZGaApsA7FaDRGBh9WXww9Ol04zVGQa0IWptbsuKzJC
wCF05+gWJYuEHxLruWLb38u9L0q4X2Fw3Qj233iXrpV8JSp1W1/RE/U5O7jraFae
LBJxLSJns6oYqsxkr9ojyH5UZhO8KhjEzhPipvSFJsJ7X5XSpY4=
=xsrl
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
