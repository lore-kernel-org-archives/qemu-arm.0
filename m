Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3249254lfg;
        Sun, 21 Mar 2021 21:21:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxlLmvvfs5EbeGeutx7lPnUUkKYoDW/s/VoUPKbnoHT8Q65wEc3FhjBwALzrcs6zoe8OVt
X-Received: by 2002:a25:390:: with SMTP id 138mr21380727ybd.130.1616386907115;
        Sun, 21 Mar 2021 21:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616386907; cv=none;
        d=google.com; s=arc-20160816;
        b=NXt/2M/6X5kAD/DpFHrhyz0q+d7Oi79zpItnG8GXUjYYHXQ5pVFhf7rGcKwh3hxVgi
         tTAZIegUxEHpCtdi9Y4TcJGzwD9tr8Ce047Fs4QGN1D7kXzAxLp/d5txKk+r2M2L2wSB
         0Cc+x6MtMovAXv8pBK3XG4JjXmpBq26Jl/ykp7lUf+OaMt6OGN5xGcvKIjtsFNd/wuk7
         P1ivhLpZdJlEAbfPMMksmBAsGfYVQgItbWxro1C2WxKkVKSnxtPLguYoEMKSbFs4Cgtx
         Wxx/bFwPvm5bkM69jDZgbbVOuSi+rjDzGxfMWXP06Qanp1vLUzSatOzlAr010tQfUw5g
         b8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5MfN4hdfD/egf1lqEOywr2N7XajaHMM5bsV1hTaDCss=;
        b=LE0r88jSkVFuG7WZxpiDvpVpdR9jOG3pqTS+r0vNtNNew3/MkFooTmN0NdCh+CCx7E
         i+n4Ki5lAGwbF5oi7SfhE7bdebkzNzln+qI4hMY0bzGeG5G6k7HVbK/cfppSicrT1NHL
         BsejK9vZfGNT8wBjR8ZLMDeoL0ip7Ec0BLcHqyWCFKqsYcZWz3WVwxoNZZ8H7+ItQILc
         fWSyTLbkhL7mhGEz9zEvhv/JAcYb0EZtIluiMioQdOwtG1Oo68h6K/FakF3kzbNf67NL
         32PDKJ/BKC2fR4VqU4tcKmmLTb3PGqeu1v2ybTau4KofBqxuynsn78pejbduy7aDs3IG
         3OhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=NI2IvXvg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25si12478135ybj.255.2021.03.21.21.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Mar 2021 21:21:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=NI2IvXvg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOC4Y-0007H9-CQ
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 00:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBvE-0006Wv-5D; Mon, 22 Mar 2021 00:12:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37973 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lOBvB-0004nf-Ra; Mon, 22 Mar 2021 00:12:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzz3zjKz9sXh; Mon, 22 Mar 2021 15:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386303;
 bh=T4qvdjGft+2avBeFt64UWG/a4S+/8YBdg6fWr8jRx9U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NI2IvXvgRMEPTR7snJ7sGIEg2Ba7g3zDQ+fIDeC5du7wGuCFEYa/+XzY7NCfTVFSH
 C9VqvCCZxwEYMknq6MEEOdH7Tzm44EptrHCb1ABYmzvdD6hvz4feg0261hbFVh2Shn
 2oN3X5STs2Lw3bAD1iKrOZHzcOx8eRwVQv6n3X0M=
Date: Mon, 22 Mar 2021 15:11:06 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/5] hw/pci-host/prep: Do not directly map bus-master
 region onto main bus
Message-ID: <YFgY2nnHJI8Iy0cd@yekko.fritz.box>
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9LJxFh5SeNSNxtIz"
Content-Disposition: inline
In-Reply-To: <20210312182851.1922972-5-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RPEcQEOh/TX9


--9LJxFh5SeNSNxtIz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 07:28:50PM +0100, Philippe Mathieu-Daud=E9 wrote:
> The raven bus-master memory region is exposed as an AddressSpace.
> AddressSpaces root MemoryRegion must not be mapped into other
> MemoryRegion, therefore map the region using its alias.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/prep.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 00a28c2d18c..6eaf9242bd8 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -295,8 +295,6 @@ static void raven_pcihost_initfn(Object *obj)
>      memory_region_add_subregion(address_space_mem, 0x80000000,
>                                  &s->pci_io_non_contiguous);
>      memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_m=
emory);
> -    pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj=
), NULL,
> -                             &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS=
);
> =20
>      /* Bus master address space */
>      memory_region_init(&s->bm, obj, "bm-raven", 4 * GiB);
> @@ -308,6 +306,10 @@ static void raven_pcihost_initfn(Object *obj)
>      memory_region_add_subregion(&s->bm, 0         , &s->bm_pci_memory_al=
ias);
>      memory_region_add_subregion(&s->bm, 0x80000000, &s->bm_ram_alias);
>      address_space_init(&s->bm_as, &s->bm, "raven-bm");
> +
> +    pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj=
), NULL,
> +                             &s->bm_pci_memory_alias, &s->pci_io, 0,
> +                             TYPE_PCI_BUS);
>      pci_setup_iommu(&s->pci_bus, raven_pcihost_set_iommu, s);
> =20
>      h->bus =3D &s->pci_bus;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9LJxFh5SeNSNxtIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYGNoACgkQbDjKyiDZ
s5JIJg//ZnfNhePOBQNMB8VZYrnBsf1CKCRm6j/ID5alfvBAnkafJycgg5+wZGyD
f7GFrZMwB+r7jbp2dfEYnCPqH5G25rKPsQCYyEi2y3T3wOeGNfPyHV0Z139OuR0t
CSv0L5FQbQtjOL1cTspLLgpYdqglAVes26MpUTK+IfzrZ46Eujzcc4iexmty3iP+
Us1okNGobFvCKrFSfnyE7N/CDyB9/AyNmcHDtG9pPPdjrfzb03AfJbxraa0kPbsH
7GHbFv91E2Djv095ZnNU7djj8vSCnzQ8uhdNUwevA0+xZRDmRyku/PCGy8n7DfIM
KnTXgZHeYcIJNJ+wzlrK8EZy0My3CMoNxD0jVniKy/o4bqA3KrY7KpB3OISUtHN7
OWlpvtRsJL1Fqh/TjfcbDsWOEEiYlFpVh9HsQceFUgsgXow5sRgpew693X3Ist7H
p/rxntqCWjlO/PdYIDqcStLb74njXX6V1QuR1/qxCRzbLRyYK1sQ89ibCJf2n9DP
7Bszcuv9sZ/1lzGY9gWZWaXc013ZTWqC8EO00IWsmJHAJJR69c+YKrpGmosx4bXd
OtxRMpJmHmpuNRJyNpyDis7X+VCasf5ZHk1kJ+DAI124xl+apC0u3O3rS/TfeH1p
l+fbON00mmZnOAkcXXYsQtmOaciyhKYY7PaX3cMTqLYCbl5ujYo=
=t5Vq
-----END PGP SIGNATURE-----

--9LJxFh5SeNSNxtIz--
