Received: by 10.223.172.38 with SMTP id v35csp623373wrc;
        Tue, 12 Sep 2017 22:36:12 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBqGY6w06jLoEZt/YxuxSxwZZL/3EpD0XKkQe7/q+2cofP/4ITarnGjy6b4bA/q73843K+I
X-Received: by 10.55.77.86 with SMTP id a83mr22041031qkb.172.1505280972628;
        Tue, 12 Sep 2017 22:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505280972; cv=none;
        d=google.com; s=arc-20160816;
        b=Dn+qDmRAOIuQVjpsGGIeBVVopVmtq4XQAzkOkeuz0J3raXfKQGDyJui3IUM/Gc1pGE
         5IA/5/YY6xim2qPu63DN9Bt/g+XmxbfEM9cT8s+edzq/LydK1ESwR28LtMJdJDdGK7x7
         ObyoYtgjw4gkWTbOSdsg3aHMrEgYYgNmexgsN6neGhyxkxxqDtWrgzmJeE9VHdLv0ghJ
         nHhvTRvfELdv0Nl08Q+5VHyvcTht/h1mOGS9CQieBDlY1f9fKLbJXc6LgkxEzujykS6k
         tFiopxwxgeiVQ2zo1TD6IU2jkjKlO9126XwTYifhfITKyCiqsngASagvbmpCJHCemuyU
         gG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=1zkDs7qSnJHcm9UFPkBSCnVv3q3zZQjsEQjq2VqF5FE=;
        b=TT+KmrvZw2MocN/yDeD2+xgXy3vtfxUO/ALYDS62ywN6rWe+SovNnj4NPECWPWcsgC
         1E+D1cJtDk2lOJGS2CFkRLUlyA/yR6luzb2DpCoD12MC+S5gTznsWCmwglnWSgrjSLGT
         nLZl+k0PB9b3t6fRGAO0eEqBd1bFnBSP+2RE1bxyzPqkwW/Eqx+a21DI3yUeceK5hqGz
         cVTtU3eJIYuG05WaYQQZLmlt4C/rWOLPPPeE4qwIwR9gmtfdMMSC9RMUp3Y0X0gqj84g
         hkQ+i90RugMURXIs6PCVhn5O1fxHmBdFosJmyqx358SBtf4Opt2v62X+sgwdShTD1Vvr
         LoYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=qNIK1r6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q128si767942qkb.499.2017.09.12.22.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 22:36:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=qNIK1r6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds0LK-0005kj-EF
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 01:36:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ds0L7-0005k4-CO
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 01:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1ds0L3-0004IV-6d
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 01:35:57 -0400
Received: from ozlabs.org ([103.22.144.67]:33225)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1ds0L2-0004EV-47; Wed, 13 Sep 2017 01:35:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xsVkR2v09z9t1G; Wed, 13 Sep 2017 15:35:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1505280943;
	bh=iPqLdahyJx0rSwpUNNAyP8RDJx+fw/jNJ44vKr4qTek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNIK1r6wGA/DL6r4ApqEZFNHLkw4nzRbczpyIiGYdK4fUdqZxsrVF59iaYYDMhItF
	+Y6bk6rfvCdq4hyUhXweIDPbLtM3udODihZSt7qez6HZBHlZlsrd/jQNqDNsMiecJn
	x13WTfSLGQ3zQ0ufVxL/BASKi/SvQHu2xz1kIrDE=
Date: Wed, 13 Sep 2017 15:35:33 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170913053533.GF7550@umbus.fritz.box>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912140149.7692-2-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s5/bjXLgkIwAv6Hi"
Content-Disposition: inline
In-Reply-To: <20170912140149.7692-2-lvivier@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vyZXmfKb6tpr


--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2017 at 04:01:47PM +0200, Laurent Vivier wrote:
> Running QEMU with
>     qemu-system-ppc64 -M none -nographic -m 256
> and executing
>     dump-guest-memory /dev/null 0 8192
> results in segfault
>=20
> Fix by checking if we have CPU, and exit with
> error if there is no CPU:
>=20
>     (qemu) dump-guest-memory /dev/null
>     this feature or command is not currently supported
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Applied to ppc-for-2.11.  I'm not really sure what to do with the rest
of the series though.

> ---
>  target/ppc/arch_dump.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index 8e9397aa58..95b9ab6f29 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -224,8 +224,15 @@ typedef struct NoteFuncDescStruct NoteFuncDesc;
>  int cpu_get_dump_info(ArchDumpInfo *info,
>                        const struct GuestPhysBlockList *guest_phys_blocks)
>  {
> -    PowerPCCPU *cpu =3D POWERPC_CPU(first_cpu);
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> +    PowerPCCPU *cpu;
> +    PowerPCCPUClass *pcc;
> +
> +    if (first_cpu =3D=3D NULL) {
> +        return -1;
> +    }
> +
> +    cpu =3D POWERPC_CPU(first_cpu);
> +    pcc =3D POWERPC_CPU_GET_CLASS(cpu);
> =20
>      info->d_machine =3D PPC_ELF_MACHINE;
>      info->d_class =3D ELFCLASS;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--s5/bjXLgkIwAv6Hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm4w6UACgkQbDjKyiDZ
s5I49A/8D8OoS1m+Hj9mqIIhNCXPCUoUu3JciF/6KaMDhsRf5iVHFh4f57S4JBV1
kDY3KVMgHr3XDi0Ne8NuHoOxMCvso2qHl6EJzLdzL5DDLMDF8VbRwwph/ZZsg7we
8lOEQJHGFRTc9Vm8IJ+JJO3w0gc04AHhm6cSgGXiIB1VQCwO2nJqjt4kqlinvg10
teAIca6k/3/KBO1fmoLLBcBDnNWB11WFa5AUilY42zzsMB8ZMXDILB/kN6IxmfgE
1DR/H7wHFeTr01bwlflLdY3usKthYhIypAz9+a4mZuzE4/zBc7z3elhwUeFDLZCR
0y+Uw1HtmU9h3oM6ybkMYIxoN4NS7r4XKkFwL6tYeao4mM0WnshMe0gKIf9NS8dL
XRIvbqRDyuu01JS6/fmocYcSNok1wUhzUrbqMiWrFAkc701aceBTWnPqiLm3z5xf
81f5O76CKuC0XXDAkJegjxhE603FaZg+b03gHs6Fuojjs3OfgNIjGNG3+617BZyx
EhQne7q3gvESA48oVcroDZk8jZeHKzr9JhWCWDTtvBHClxNDnJstvmqqQDjWI+D2
IxA6NZBxoI7PLJ0XgsrxuUth1F+odLxF8ZwCupVIiDfCcS2O5rUhe6CzrlXgpacz
BLDrsKXO9yaCmivQsYYqQUTNEszL2i2pPVTGyhNlJlzVB7gPJlw=
=JniD
-----END PGP SIGNATURE-----

--s5/bjXLgkIwAv6Hi--
