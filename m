Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1880427lfb;
        Fri, 3 Sep 2021 20:22:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtyQXt86v1Wfs3xhSGUF/PeQOtYCh7h9gCwu9b+GXAvfFg60ilUcSXbbeKlovSXBl4OahY
X-Received: by 2002:a65:5a81:: with SMTP id c1mr1879180pgt.74.1630725770041;
        Fri, 03 Sep 2021 20:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630725770; cv=none;
        d=google.com; s=arc-20160816;
        b=w0xdwXPmyEl6KjkXVu0Uun53ERsd+y5qT3Y0dJr5B0E9rQ7U3lww+oLm15YGfGKAap
         aWc7LE8Y8kCpvUnywJJWbZRkzvtMp+PcVU01OjGXoUNtIzfg9n/bQbRsp+yp6ZMR/NZS
         zhK62fXMtJlYiZodvQT5SFqjL7tEoocJ4WJn6qI28bVvWxOvPMeH2TH5GRnJDdHXSzGb
         YNyxWpiFMnKNo2OQ2nRx5t8Uo5De0Kb37RLeMSpDMPPAIpChxXKw6z8vtRjOV84M9XC2
         g2i3A+MwIFo2anKi6voOPQbsyNp8U8KQ1PGd+GqEpYBrMckzVSAFsKGSHCgAM/89dod9
         yVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=4H3eQ3QsA05/VW7kGkCpNxug8epEW37imp3Hj13ukA0=;
        b=ei/3TYYN9dt+RuSO8mVL3oexucFuHyqoO2/qd5nhOOD01qC+EoRw+8FN5qmOTb+YvU
         2vxB4h314vVg89kuzPXVLUPI/Wp+Mzl1/kMEtb0U+H59GEC8434sb3Ljl+mtHGj6qjyQ
         deTOJbz8qEjyzsxLGvn3NCAnnf4YWepu37+BGN3nNxJ+P0dc0jRr+BKRLZB6M2kBHOQu
         +PL63vT9u+yRBRFLB70TbWjXnuP2Vit20JGejI3LmWgHl8WZHH2YGdXrSSSJGNgNrtso
         v3nUVN+JLg2pi53f2gmnYmKzRIcvjUuAz3hTkTIbfTGN1a7HuMFZK0ZI/mb1DY7V1Bs0
         csQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=FhKBtH09;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [2401:3900:2:1::2])
        by mx.google.com with ESMTPS id v135si1033281pgb.632.2021.09.03.20.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 20:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) client-ip=2401:3900:2:1::2;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b=FhKBtH09;
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 2401:3900:2:1::2 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1630725765;
	bh=4H3eQ3QsA05/VW7kGkCpNxug8epEW37imp3Hj13ukA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhKBtH09mz70UpeBBQN1+nw0AkeP2Z7ZfguDZhFy+fXhUB93xK0BBaLDHnG+tah+Z
	 oY61PGYG7PqAiiZjPDD1zSCBoefNvzdGgGHNE8EbWB2Pwhq3DGTECIbY9rzGEtOeX2
	 8xjKK2rV7xNBW5LiVqh5EADK6/XaYMdqvUNmbe5E=
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4H1g2s4S8bz9sVq; Sat,  4 Sep 2021 13:22:45 +1000 (AEST)
Date: Fri, 3 Sep 2021 21:45:05 +1000
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
Subject: Re: [PATCH 16/28] hw/ppc/spapr_pci: Replace g_memdup() by
 g_memdup2_qemu()
Message-ID: <YTIKwQAIfb35upnI@yekko>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-17-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="467AKG5kT2VkpE+f"
Content-Disposition: inline
In-Reply-To: <20210903110702.588291-17-philmd@redhat.com>
X-TUID: BHuLMI8Fu1h8


--467AKG5kT2VkpE+f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 01:06:50PM +0200, Philippe Mathieu-Daud=E9 wrote:
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
>  hw/ppc/spapr_pci.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7430bd63142..79c0e8d4f98 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -2201,10 +2201,10 @@ static int spapr_pci_post_load(void *opaque, int =
version_id)
>      int i;
> =20
>      for (i =3D 0; i < sphb->msi_devs_num; ++i) {
> -        key =3D g_memdup(&sphb->msi_devs[i].key,
> -                       sizeof(sphb->msi_devs[i].key));
> -        value =3D g_memdup(&sphb->msi_devs[i].value,
> -                         sizeof(sphb->msi_devs[i].value));
> +        key =3D g_memdup2_qemu(&sphb->msi_devs[i].key,
> +                             sizeof(sphb->msi_devs[i].key));
> +        value =3D g_memdup2_qemu(&sphb->msi_devs[i].value,
> +                               sizeof(sphb->msi_devs[i].value));
>          g_hash_table_insert(sphb->msi, key, value);
>      }
>      g_free(sphb->msi_devs);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--467AKG5kT2VkpE+f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEyCr4ACgkQbDjKyiDZ
s5JQMw/9EgSrnPgRxc/R/Ui5DGXjZmF6ieBr0Sb+CICEvlJ0c0wOsuBLwkRfg2kN
OLr/Mj6S4Klz91l4pGDCJBkqsivYnCLg8rMoCISZu/o30Y6bH4r1jx6qfySVadzn
GpgRhEMqBTMBnhBqXslGjecD886ICIGxmZhYTN0RQjD2RPTfwlk7fesfUQKuh4O/
wjpfLY94qUnO6nqo2lsR8N3k082bsUO1EniGpZ1xAk4i06NlLSaukLJ3AR+4YrJ0
c7d58BZA3i2RZFDnFYuQU7vYoS5Amop9wVgCOTcLGwwo7NChLY73G/RZnUNTbdz/
tVz8gEiRCkiotfF4r4dRwycDKzjm07h0uXvCFYSwzDGhKt7AitioLXi0HKp/e/OV
Jci9uYLHgjCRRPYzzb5ly9YW9Laa0HECAYCc5WHoOCigEquEKXvWKQJdQd1PQ/Xx
OUaLzfGnCB+WEzJho3BnLaD7KkEMlg6hk6zKF0l+WcS/Tl/pUQKM2k96dU6QlWtV
kpMVMDJfoQDb7Og9QZZ0yxd28sYNObIfzUkfsIV4klpEToEtyUZC+JL+CQN3XDbK
94bDR4KvU2ziw8LeDsxoi0UxcvZjOqtRbNLnI3wS4oOAdif6iDVnWzfbU902AWI0
ojeJ7aZC98t3T0hVtyyC3B5aB6ADWKaIkizvmFtqz+hjCa/l/Lw=
=3mpO
-----END PGP SIGNATURE-----

--467AKG5kT2VkpE+f--
