Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1944117lfb;
        Fri, 3 Sep 2021 22:36:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz31XrJDtz0yxtGL/OKVAN6oD8DFEJ4/wS1rdSqOs/taRnsxKegtTFFDhQC4vcMeIOHmIBZ
X-Received: by 2002:a63:7405:: with SMTP id p5mr2242539pgc.426.1630733795806;
        Fri, 03 Sep 2021 22:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630733795; cv=none;
        d=google.com; s=arc-20160816;
        b=tcsU88GDRXwu7M9YJb4U2KdgAbgXTi0H0CyXOeDJzHl+ZLwCex6RB3bld4rh+llKZs
         KoJSHQmIkDj3Lc396l9+Ndob7UGeT9ex3L8O+N7TQzkTsF/IcpITYNYEvhyz51OlK72U
         BPb+Lvos7AxH3mhZ48gBfCfUsG2WrRsDSuCe7x9Qm5yGlM/vwW4umsW8/GV60wKYmW/l
         ntjQFlZRnOEO+igN296vRQXQttnXQZf81XdOF3HxUd5XMmVtLvUpgYqJ0GD8TDeL1GC0
         l/tYn1HncM4n1Kk6pkHRk5CRoaqjSnq51DN85MyjjzG1BoiKtLw8jTfInuZf0FxUP3e7
         LVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=hODncbRxZb+5J14YcZnIgq6EXW9tP5Fmu8R04Gf2lsE=;
        b=YsAYJN6KUJiQeWSL+oUokci0uPpGdBZ/QAUsZDX+IGMejuLORUJAN0UFJCzcVE0480
         wVeGfEzoQOsllddT4oIPe7nDVm6ftBgqmG+lOBKDHdcsP0pibA/g+jJc4stEY9qRtpuV
         TZ9AvqlhY+lHkj4q9TvvuujC7im7y2Qqj7B12uW2ewPF70Ggrj4TACWdKAGP/YFr/HCp
         AtrMMdXt1KkwgCsMph9p78aEuVckyD4AKm6pL3603lpi3vz2R4Gd7ZvUkg3fYkIfaAgC
         3RqThaZl+B7WfBZLnRtNqBxWJP8ObrGKLU+ftz64baxi+feypMVVtSFAFLkFEQSjCJJO
         g0rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=eULuJIkw;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (ozlabs.org. [203.11.71.1])
        by mx.google.com with ESMTPS id p128si8392170pfg.274.2021.09.03.22.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 22:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) client-ip=203.11.71.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=eULuJIkw;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1630733791;
	bh=hODncbRxZb+5J14YcZnIgq6EXW9tP5Fmu8R04Gf2lsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eULuJIkwjFK1cuIpwPcSOeBngDp84uxzYSVQKOLf3dvQj+dUDJeY2pm+7wFEf+Boz
	 BMXLliSV61bFVXVzXEEwACAGilcGPpuDq3MbFV9ViPDCLisCOeVwfpZlp2hSH7G+lf
	 L6tn5RqPNyygvXd9SsKukwE64RtqbKEw8jEJHYs0=
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4H1k1C5wJfz9sW5; Sat,  4 Sep 2021 15:36:31 +1000 (AEST)
Date: Sat, 4 Sep 2021 13:38:36 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
	qemu-ppc@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v3 16/28] hw/ppc/spapr_pci: Replace g_memdup() by
 g_memdup2()
Message-ID: <YTLqPHswPmg0yFQW@yekko>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-17-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M3+GtE8/tO4A26e2"
Content-Disposition: inline
In-Reply-To: <20210903174510.751630-17-philmd@redhat.com>
X-TUID: q08vz9STYxp3


--M3+GtE8/tO4A26e2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 07:44:58PM +0200, Philippe Mathieu-Daud=E9 wrote:
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
> Replace g_memdup() by the safer g_memdup2() wrapper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

Acked-by: David Gibson <david@gibson.dropber.id.au>

> ---
>  hw/ppc/spapr_pci.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7430bd63142..8e36cffab79 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2201,10 +2201,9 @@ static int spapr_pci_post_load(void *opaque, int v=
ersion_id)
>      int i;
> =20
>      for (i =3D 0; i < sphb->msi_devs_num; ++i) {
> -        key =3D g_memdup(&sphb->msi_devs[i].key,
> -                       sizeof(sphb->msi_devs[i].key));
> -        value =3D g_memdup(&sphb->msi_devs[i].value,
> -                         sizeof(sphb->msi_devs[i].value));
> +        key =3D g_memdup2(&sphb->msi_devs[i].key, sizeof(sphb->msi_devs[=
i].key));
> +        value =3D g_memdup2(&sphb->msi_devs[i].value,
> +                          sizeof(sphb->msi_devs[i].value));
>          g_hash_table_insert(sphb->msi, key, value);
>      }
>      g_free(sphb->msi_devs);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--M3+GtE8/tO4A26e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEy6jwACgkQbDjKyiDZ
s5J7ixAAsneh6qhvTS9tA+ZAoRedPtcXclRP5xkl0BUJ4PHYARVO2BgOPK5GsxCF
qFmwoX5ipNASF9PAlheCrIUVzLOGxWqGqbDdA9xQjbzZGOaK34GJrGFwI9EBX3Bm
Goro0bp9j4ns5d1igU7MyIpY73yPTXwRYdNQea7p4FD6LdLnOteJTImbesKHJEFG
BFoOPsihbl0LFOeT5B5pX6xmuN5oNBc3ylARXZ79S/pCQuP4o8P0OveSnUAEODGd
WooYtcEgbQl5moe+1qZ3vKL+WqLubg4OJjHjeD5XOgHNvaf7XnJwHciBw/QGDm3F
xh9k9JeojX8Jd0VpvCt7et7nt82BkzPFn8c6VdcLw5Pk6fNh//AMvgJ8PxpSrr5V
8SRs/MkJlh07s8hbQLWo7KSrs9ecb9m1PSykWaHryiYA06rKpw6ePHkvrb7WpcQi
A83F6P7d92oe/HM9nxJfZCoxClphDzShw1zjXlwZZ7xXVIOO4xopziLYc/ZKIeeO
4wATZtriWub27Mqk04N4gc2wsMed1mljBMPrg5HjzG+6GTbyrn4L98deosxmjx68
XUkI7AT1Gd38TVHUxkdOoEdiuOIT98SnEc1de5loknay1+NPFMNLi2onlzYfaRhT
j9qva+td5VLYjgtlveTBM7983yDGr3pgjayAjtHkPDzUTtd9kXA=
=ub2z
-----END PGP SIGNATURE-----

--M3+GtE8/tO4A26e2--
