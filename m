Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1944116lfb;
        Fri, 3 Sep 2021 22:36:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx1kPmbqpgT78Ud8Kb4XaiTQg3Vqwh3KR3k+Fn864RSSuN1rb1u0eyiIdlcmCgRSVSSwL1
X-Received: by 2002:a17:90b:4b4d:: with SMTP id mi13mr2589409pjb.160.1630733795542;
        Fri, 03 Sep 2021 22:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630733795; cv=none;
        d=google.com; s=arc-20160816;
        b=l7EluRXwZ3k9x3Bom22cdY4siVE500bQNxyh+kLvX3xLt4+ysHGlp8QNxqPVqD/DMJ
         vZXrOyiSRQm5U8NyD7Gi0CBvhaSzr26VKBZNVHkfymDNUgIwjF5DjxAawINP51Q/W7FY
         H9cGXxAee1Y2Rb+mDKHrhA/8hee2H8wmpXZ2JETAO3sab5sQgthcNxC0RJlyG3E1YUY8
         af/pOcT5ANAWYWxBMgMdc4JBnOYTLFhlSE9Fed6FVlLihRzastkT/m2+OQ0qECQddswU
         ZgHLo2McoKCf0x4n5pZ99s+YPAxMNiHaSG8+XgNH12sYLkQjiV6FiD1xGg4w+1qUn+W0
         9Ukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=b8GPa793HERvIHCyvlk/12UCg5YhByIk5mVGZuLF3sQ=;
        b=lGL2Q28WPtsxGfiq3N8KrJuVVgzwXhYQH4D/AAhdcXTp50abkXSodXS/HEUp6qm7+4
         1JulUUxoGJ711OP8qQOlfJaCjoVK9X/dwA+c7pr0GfWh4+FzBOqJVxbhAioGXAekQi+B
         TdXB+jqQbRdqNZ/MCWyDiFbOTcxBTJmjeI55dAyiZuKSFUvr5YUePXxIgpqXH4YAkECJ
         v45ZVl/Egg1MxqY+cqd3N+IE7RA6jVJQ4B127gPyULcAF/j3aiIHlRYf7znGwUHXEJCx
         oPbI/5oIiXkY8MqBIUtnQj35yBveKGaJ1ZYN1FkBth1nWBqoNWL5Uh2VQDzU2Z/RWERg
         FTVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b="LHKek/my";
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
Return-Path: <dgibson@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org. [203.11.71.1])
        by mx.google.com with ESMTPS id z25si1645133pgk.472.2021.09.03.22.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 22:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) client-ip=203.11.71.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gibson.dropbear.id.au header.s=201602 header.b="LHKek/my";
       spf=pass (google.com: domain of dgibson@ozlabs.org designates 203.11.71.1 as permitted sender) smtp.mailfrom=dgibson@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gibson.dropbear.id.au; s=201602; t=1630733791;
	bh=b8GPa793HERvIHCyvlk/12UCg5YhByIk5mVGZuLF3sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHKek/mygRyt4s24Y0qV7/H061t6m7+6mYapj9niHVq7JY2ojeWk2Hzvyuzc9bwNf
	 nmAog/NZRJu2hBXM6Dyu059XRQm4zZziPztLFEMmdnO/1dpIhQo0Hi63pm127aHRz4
	 h1/Qk6Z8kkz8z4GX435VYmjsOALCyQnmqOs3JTQA=
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4H1k1C6THvz9sVq; Sat,  4 Sep 2021 15:36:31 +1000 (AEST)
Date: Sat, 4 Sep 2021 13:38:58 +1000
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
Subject: Re: [PATCH v3 26/28] target/ppc: Replace g_memdup() by g_memdup2()
Message-ID: <YTLqUuBIxiR3i8cy@yekko>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-27-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ob9WBRFeUsoNiH0e"
Content-Disposition: inline
In-Reply-To: <20210903174510.751630-27-philmd@redhat.com>
X-TUID: fnXeM1sySjRB


--ob9WBRFeUsoNiH0e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 07:45:08PM +0200, Philippe Mathieu-Daud=E9 wrote:
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

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/mmu-hash64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46f..bc6f8748acb 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -1122,7 +1122,7 @@ void ppc_hash64_init(PowerPCCPU *cpu)
>          return;
>      }
> =20
> -    cpu->hash64_opts =3D g_memdup(pcc->hash64_opts, sizeof(*cpu->hash64_=
opts));
> +    cpu->hash64_opts =3D g_memdup2(pcc->hash64_opts, sizeof(*cpu->hash64=
_opts));
>  }
> =20
>  void ppc_hash64_finalize(PowerPCCPU *cpu)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ob9WBRFeUsoNiH0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEy6lIACgkQbDjKyiDZ
s5LsSQ/+JGfVEGFpFsxv2JGweo6VeaL7sWpvURLQ6ka79BwX72635jgsNsnCPPRL
m2rc7dUHV8+yY+j1JVtDCHWjFiPbMS6Z6dvtbb7XxLiRr7I8PstXjW0u/ntTwXXw
qYsdpiG6UovB/z3vKapZcjjGx8zH8KWg0mblVull7pF+XszljV/Tr5dWY/+Ty6X8
e9MH0fwkUMzGn9xTpCzAY7OpgB8NTjkXAmcUjrBoF6QsWuvHrjEVrKWh8qn80RU0
DFiO+juUwWNYCOp7Fst74QnpQhHNqombifg7eDZvkVjkBFcrvROCVC+sSQp4j4iD
0dHqgSzKCfUxORACVQOsXjvuxtv8AxByi7x2CUG9lFYc1Z094NxtzCU90AsqfVXX
0qA6pbBAAGuTckGQqNcB2ajaMRNZIUr4Nlmed8p/TCIvDKgplQ7G1z5gaxs6Ph+k
eHJvvBjN2ghG19LgHwLkXWEKQ2jJpPDSqDq0flQvxeCvlmTmPlM+zDuPKAMmVPqc
MMJOe+vsYddCu/qYEydHetG/l7+etilrSgafAmOMlcKn8/EijXj6aa0ksoS5nbe8
ajFS8RXEJqHwZ+WHiyY2/+PNqWZ9ZIFpq7KUX8VG4wBJ2XWXeeqHHvzCYNMIKE/i
oiEl9LWYFFtaX3JZCI8wrKdkFCz5zbUFDLIgoJ0NZgZXtyK8IZI=
=cExo
-----END PGP SIGNATURE-----

--ob9WBRFeUsoNiH0e--
