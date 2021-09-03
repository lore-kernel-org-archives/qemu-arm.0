Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1880434lfb;
        Fri, 3 Sep 2021 20:22:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8D6BoIIla9S6urRQOR1zhgqZCWJbz3jni99w4OMOg5YxT8qG7I0FIqUxaMrTRrzOetkPl
X-Received: by 2002:aa7:9805:0:b0:40b:2040:adef with SMTP id e5-20020aa79805000000b0040b2040adefmr1822960pfl.11.1630725770554;
        Fri, 03 Sep 2021 20:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630725770; cv=none;
        d=google.com; s=arc-20160816;
        b=Ptwgtcg0fPfc0CBlNpr3CJ1GNEzRHtiyUdn4KlNo6DKkb6sAH1CmOP8W5pKJN09Zcb
         YgvryXeWLMF57Z3Duj4vhkBYSoKNN7MQm4t/FLfuPoVC5alGja0QL2yxjmDTaxfjuMy5
         myfUxK3OeHvSWlzoeflFB7Y6fn5HVJHqHRfp4SnfgdmJwpIco9LKufWQ0HyDhR3ivJxc
         yVAwxY/k2qobqH9LVHSVpw15hfLLUn330u9xw5epf37s6YxO/2Rkv6tz02BSPQaMpGLy
         Gfl5T0E30YJOy5wVgO/gSdJJHsaqzIqQkqv5Ig//epiHg1VSpPLMRiPDTRkiuZcDNCJC
         bfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=M1wfW3POZ1s4K8pZn0Wbl43gs5jAIri4ihV3ywtcK/4=;
        b=dln+2jcYvegTWjz1QFuHCvgCZdL11JDc7qDJBrIwSwMlu+bxq0+iYFKCHpF4DNOV/d
         xp85z0aV/jooL5LizmYMFV4JBLpL3opWBDItxYUTEMa/24yZGsLabsUI6kuHQcTWKiNx
         cA2eVlM/kJ0klvOZ9uE0tCAhuEJk4Iqzbja6KxFzhHS1d4J0BsXeExx52SHEaBKRxHza
         v7Lks2iZAOEVbnZqBdxD/f/icgP6DuqN50wxl0gHOss1vjBWvHd9Lxo76HhZl0Ce7XQQ
         Wz9sS5cEIbDKLMcoW+vHj3atU09RPPwteh/I2ZZzrlYPm6Wqhu4vHTFvLQsBLY87P5Fj
         R3sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=I81nk0Ui;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id ch14si19103pjb.98.2021.09.03.20.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 20:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=I81nk0Ui;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1630725765;
	bh=M1wfW3POZ1s4K8pZn0Wbl43gs5jAIri4ihV3ywtcK/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I81nk0UiOzZIgU2SjaSKgSlsM/e7rGjfFGy9tQivEdWSh5TqZ5uLiLYB8JzYByKjv
	 MxbPgdKnoQf9dxM+y8XW1XAk/MjIQeU07GJpsnkjIbdoRZQup6VWytJ4Ofj0YM+QFw
	 e+wh8CdBLjJ1GjJWQinrN0AL6oy9lWw2IDEYlLlg=
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4H1g2s5LWjz9sRN; Sat,  4 Sep 2021 13:22:45 +1000 (AEST)
Date: Fri, 3 Sep 2021 21:45:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org, Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 26/28] target/ppc: Replace g_memdup() by g_memdup2_qemu()
Message-ID: <YTIK35r5tWqs8US/@yekko>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-27-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YrBYwP/4GpI03OJ0"
Content-Disposition: inline
In-Reply-To: <20210903110702.588291-27-philmd@redhat.com>
X-TUID: mtq/ZgXVUYD/


--YrBYwP/4GpI03OJ0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 01:07:00PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-mem=
dup2-now/5538
>=20
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
>=20
> Replace g_memdup() by the safer g_memdup2_qemu() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/mmu-hash64.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46f..2ee6025a406 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -1122,7 +1122,8 @@ void ppc_hash64_init(PowerPCCPU *cpu)
>          return;
>      }
> =20
> -    cpu->hash64_opts =3D g_memdup(pcc->hash64_opts, sizeof(*cpu->hash64_=
opts));
> +    cpu->hash64_opts =3D g_memdup2_qemu(pcc->hash64_opts,
> +                                      sizeof(*cpu->hash64_opts));
>  }
> =20
>  void ppc_hash64_finalize(PowerPCCPU *cpu)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YrBYwP/4GpI03OJ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEyCt8ACgkQbDjKyiDZ
s5KSdA/7B6R7ERH3RvRVfbpr2R9syLywVbWMy7eBD1S+XTfEIT4JcelfN11AykK5
6cqSsyTGZkPmjgguDPnzmCJDy1Xri0aJWp/oOTpwUrH5q7DT2MK3vniaZ/UEdT0k
ny/Ab9+tm5rUPHyeTskB6rWIjuLLok+d/933K/wTmTQcCUTXcKcz8tP/kG4Ni80Q
X/U+h1QM8ilyYHLpWtTzjgX7pBCh0o+mSdm0sLq7rS1y5JBPc+BKVaZIZ5RxR6LW
8Tq0/g8QhHWiiwDT8CWRttc4jAJQzDXbnnmJ2D/WWWV6q37XPZiOyTlMhMOp++Un
BJMTCnD9H0YmE76A8MDF47bfcf0GvbkHldzF9FooqGcweem2YZHgJKcRPNx2oqtD
uHlPjp5vwylH1z36twVF+MgEjXPWSLySNcSEaFmbZFTqWquRroI9JdYrp3mTEeWf
GzdAUrRczUVxEMomi5hroG6moNDcJnh13nYNh13uLazXI03YIrUjS9v9fxR42cTC
wqWtq/vVm6Lg44CNTztodnastS6RfuaNMowE2HIC66xFKWUZQmmz4IrfC4U1iiaD
U92ltytwL2ZqFZKQ5mK+YrzcL2rrP1QV6X30g7eP9HXXRta0CBKIrmX4Uy+aCaG6
ORMDyDKq9wDKJXv6nnj5aIFSevIMgEN2bpmW6EIOoxkpUT5sBMI=
=86Pt
-----END PGP SIGNATURE-----

--YrBYwP/4GpI03OJ0--
