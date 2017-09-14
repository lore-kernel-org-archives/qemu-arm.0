Received: by 10.223.172.38 with SMTP id v35csp278717wrc;
        Wed, 13 Sep 2017 17:48:34 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAxSAa285syyXrPl2bjunzP66Dzkdf4/Dpicmiej9nnxvIzgrbX3sUBrG4CHpD0as7f7uKs
X-Received: by 10.55.33.216 with SMTP id f85mr501006qki.176.1505350114800;
        Wed, 13 Sep 2017 17:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505350114; cv=none;
        d=google.com; s=arc-20160816;
        b=RFEuryOG3P81g6UTWX1znWr7KCOf3GHeZsjjlXp0cD/rbcXCbv6VJivznN6jofarj2
         q4hBEYW542F2pi10/vVw8ZQevPOh9FvVAh7BLe/ROPtrPjUPuJimlWHi3xZBdldyLT6s
         T/SjGZw0hn3v2FnKR4R7yPhuIymWPXeJSjPGnCD7jsnbVnSNNDVrO5VHyhrqS9xllMUM
         55Zs8490S7A5f2FNy/pTxK7DgAR0iNbgzHaMj9UvyqKoZWkYecJ9n6ZcLVo2v00aro1N
         lkNTUBzXHTqVB3Sa4ebV37Ue7ifGIFZEHRuSSKRkoWCXj7G9BzG86wXvQY8VOFrptrbV
         Cxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=zTFqalfxkXsLUFLG0gCQkbJYMHnoYYkSAPwdC7rOIU4=;
        b=yQTF8u1P/pE1Qgy5Fhusz6ltPTAmHmS/fUYVpHMBTs4R1uC1haWrDDyd7E3ULf+rvY
         OSOQ4QjmnpIRzzZR+rw/tpjLwUUa3gpVnjm4Qp72Zq61GPKakngMIETJPUZrqPANMwBg
         LYw6WB6WUW1y/y/Gui4mCU1GhDKawkRg9voS1O5dgvP0fKkMP3L5uh/Zxr3ApNZO7W54
         nL4NuauYMRoOEYL28vQcHB0CxmW32XmkmNLUPcH+jUhiBWaR6aXlUz3PL4azwrwhViJ/
         6jHUgpcadJEeLM3k6GEaLbyWyrRknjT4t+CQ47Si3M94Go/GO1FIhhsRfcHCHKnfea5M
         8kvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=oQt68j4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m89si16340085qtd.228.2017.09.13.17.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 17:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=oQt68j4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsIKW-0004vg-6i
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 20:48:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dsIKG-0004u6-Gs
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 20:48:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dsIKA-0007NF-Dh
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 20:48:14 -0400
Received: from ozlabs.org ([103.22.144.67]:32845)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1dsIK9-0007LV-NU; Wed, 13 Sep 2017 20:48:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3xt0J52mRKz9t2h; Thu, 14 Sep 2017 10:48:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1505350085;
	bh=Eb1YwhwXLCVWynkpRxJN8XLUMtMLGyNxhf+o3DLt7Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQt68j4b9/5Gdw7zD/IUaniJ66rUAJBP3SK8dj/fwq5Gkw5gbThCh/2kImHYiby6r
	gdfow9oZKYumNLCi3g8/v+UYTlQauVfqsRJbFvjWHbgbcOOzh8lG1/owCxA5y2Ksv8
	fQLUf/frvVVo4I1bgsXUrQ6Cb5av8ypoaVsO+/rs=
Date: Thu, 14 Sep 2017 10:14:09 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170914001409.GG3972@umbus.fritz.box>
References: <20170913142036.2469-1-lvivier@redhat.com>
	<20170913142036.2469-2-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kjpMrWxdCilgNbo1"
Content-Disposition: inline
In-Reply-To: <20170913142036.2469-2-lvivier@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v4 1/4] hmp: fix "dump-quest-memory" segfault
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
	Cornelia Huck <cohuck@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0qzfEcrzZe3I


--kjpMrWxdCilgNbo1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2017 at 04:20:33PM +0200, Laurent Vivier wrote:
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
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

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

--kjpMrWxdCilgNbo1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlm5yc4ACgkQbDjKyiDZ
s5KfFBAArG6NHKIXQhjW4z6VFtPr1Xe972lUA2yf/KLetpA7zXMOmRur21WoqVFv
xSuANg8hDaN8dZXlDzYOsOe9nhkuViMsk6K2nABhPMGR6HRl2MLE9/36Id/V2b0R
cLTPJMw2xMN/VftSROkLt0aghTHS/kEzyEyldrgiwVovotEwlWL477WBs/T2s6b/
UQrEKdvrrIw3T/CSWF29DNvMhzNCyTO+NADaaX+qPC7+ZD39MPtASwj8RyRaIic7
xvREhXIDdcHitMbH165ul+/UF7SKDLeVU5C6RjGRy2wypxAsV72sll9suJoi26h2
/6U906ORIjojRIPTz7VGYNXPSlGKfQ95Vk/wP8G0ck2KLN6n9M9uXWWL/n6iF8uE
+OImJHvUloOTvhaIR7ioCiIdaC7sDuWFgnNU0yV/aOQhGITyBL/w/3YvKUjH+yWx
rjrC8eTVQ43G15/iSLsspydIJoBxdFLgVmX7kUHIp6iD0cGdqqbTB+59qAldgcer
EbmC50HvPq7R1LrT4MEUZp79Y1y81jZyT4HmyHsUPvhoV5GdXRqVstG7t93ijwKs
W15FXb6p68RqpUJMu402Gt342sgBCknj/k9TMbtqw272Su/8glzybuy8tZ9K4DwU
ElYVozE6npGTKug0IxvGwTwACgaABmy9F0kOkxTISvBMmZTiUFs=
=pphb
-----END PGP SIGNATURE-----

--kjpMrWxdCilgNbo1--
