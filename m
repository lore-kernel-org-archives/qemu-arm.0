Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2093627wrt;
        Sun, 21 Oct 2018 12:10:13 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61YyxASsYSkZotY1pcUEBFJZbsY9pY08YrtV6AV486yQU6TTxZEYtNJKxxhZvm3IK9IbM82
X-Received: by 2002:a0c:93c5:: with SMTP id g5mr42535031qvg.136.1540149013310;
        Sun, 21 Oct 2018 12:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540149013; cv=none;
        d=google.com; s=arc-20160816;
        b=f2B6qRJ0J2Psnjb1clpd/ln54NXs/5qO1wwHXQ33+nrkMFwJHPZRmi6xizUK/3HCC7
         /ewEcwuCkhOdTttxkXmXYwFewWHkmbhkCsCEd3T26wQ54FLTQQXZSh/TLdIakKW3woI9
         xnO/oEW8hOtTJny9ZCZdwA+RCGD7gGb1d25tq+iTT/uB/uMhgWvxBAecYT95qZ3STFkP
         UIExIDuzFzUDOwPfKJJwaEwS5oY71L0JU6QNnVx+ZMa8aV1bi9Dum9vqlJR9CiVhA/l6
         iO7+v8BUYWu6BKWVaigQq0u59pTv856uY1aWH8T0Ji0yo/Y3pDdywbDh+uIJXIozhYCK
         CURA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=1zyTRUGjxmCoWpFc/LoeecqtGzbwXb88vWz2x96J+4I=;
        b=AYflM7789T0OrcRY0lgL5oc6Nx9ANrXs7qm+dM5imaWXJ6xbvJHLZxFBrBRfeg3FhT
         0Z3Ar7eZVqEh8AL833SAxYq/5vc3V6hzLR8XFi3k0Ly4qCYy4LjYGmIh73h9z9G+pDS6
         T6s8BPY966bvYaADBS0cQXdbXhNx1KDYbHgZAe0kDiHmBFG4wPemPaL89/tks/41Veku
         1dd6/vEClR4Z+ckyyC4jJuYHqCKYbVnnJqs8bIjVVZWHivZ5nDQhiUgmP9TdGoiz2cYm
         Lr/VK3GoQeFatiwOBgh+/iiDBXi+9PdOmqKxRCQLHw9vwPWNe503zo6cLHb0QJuEChKL
         YNPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=LN++PutY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o48si1147047qvc.181.2018.10.21.12.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Oct 2018 12:10:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=LN++PutY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEJ76-0003Ap-Pc
	for alex.bennee@linaro.org; Sun, 21 Oct 2018 15:10:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEJ6H-00037Y-Hn
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 15:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEJ58-0000YD-7c
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 15:08:11 -0400
Received: from ozlabs.org ([203.11.71.1]:59807)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEJ53-0000Us-5w; Sun, 21 Oct 2018 15:08:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42dTgc4K0hz9sCt; Mon, 22 Oct 2018 06:07:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540148876;
	bh=I25YpT/SmCCUBx/fBNmeeWiT6hFSLbNsTxUtWPtFs+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LN++PutYvuZWwn46NxIfen0kqWnI9UFTaOPpj94C4IB/VFZScwF98zJmuQZ4hgWeN
	ASU9ZcS8r3YwQEM5yavORrDHUAOd/NB0HLwwkWF7pP+VXx6L/Q2ymtNK0h+0ZFcsfz
	vgUKPAEJU+pSmRs/9jD5yZg6O0NPOUMy8itBaH9s=
Date: Sun, 21 Oct 2018 18:37:25 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181021173723.GC2215@umbus>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-2-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-2-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PULL 01/45] hostmem-file: fixed the memory leak
 while get pmem path.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Markus Armbruster <armbru@redhat.com>,
	Zhang Yi <yi.z.zhang@linux.intel.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4kxIxyDOHdpm


--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:38PM -0300, Eduardo Habkost wrote:
> From: Zhang Yi <yi.z.zhang@linux.intel.com>
>=20
> object_get_canonical_path_component() returns a string which
> must be freed using g_free().
>=20
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Zhang Yi <yi.z.zhang@linux.intel.com>
> Message-Id: <7328fb16c394eaf5d65437d11c2a9343647b6d3d.1535471899.git.yi.z=
=2Ezhang@linux.intel.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  backends/hostmem-file.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index e64074954f..639c8d4307 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -145,20 +145,26 @@ static void file_memory_backend_set_pmem(Object *o,=
 bool value, Error **errp)
>      HostMemoryBackendFile *fb =3D MEMORY_BACKEND_FILE(o);
> =20
>      if (host_memory_backend_mr_inited(backend)) {
> +        char *path =3D object_get_canonical_path_component(o);
> +
>          error_setg(errp, "cannot change property 'pmem' of %s '%s'",
>                     object_get_typename(o),
> -                   object_get_canonical_path_component(o));
> +                   path);
> +        g_free(path);
>          return;
>      }
> =20
>  #ifndef CONFIG_LIBPMEM
>      if (value) {
>          Error *local_err =3D NULL;
> +        char *path =3D object_get_canonical_path_component(o);
> +
>          error_setg(&local_err,
>                     "Lack of libpmem support while setting the 'pmem=3Don=
'"
>                     " of %s '%s'. We can't ensure data persistence.",
>                     object_get_typename(o),
> -                   object_get_canonical_path_component(o));
> +                   path);
> +        g_free(path);
>          error_propagate(errp, local_err);
>          return;
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvMuU0ACgkQbDjKyiDZ
s5KQVRAAujLtGt2u14Wco4jGuGQbcGdgHa7R+y/ybLvp5daHKuQ4TX5hufFEAunj
tthwhwnyqXYzZaZaGmAAkdM9keMYwYMcHqGJmVO7psRbg1PKzIui7GvQn+n2HSZw
tEOP5xOE+8hDTF8/mTJ3AZxR43qZEBvVSFB5ZaFguVvLcBxlkcG+jHSL1HlBeh0I
wrVQ8JOFmxlJuiY9BKAJqHu2Lu+7JKKao6wglT8pX+LpNSVKU/ejn2nMs2W68IP4
JQQlD/3WzgKv09vGDQR3hji+2edBepvkTTp8p4TJFq3QYDe4MJrIOdcYQ5wcI3Jt
+2vsUA4efWMT9MtEa+MPhmLoedYN5M9IZdoj1cv1G0/hs/LrFBhImtMQSRvOYkhg
0TXbYcB3rKdC5ip1T/1nqZs/nikDhNv8oDYJogK+sUeZFytHKs1UXi78UyqVPvNq
tQP2YaChH54jHYwrvMzgmAaBpt+KTB8sMerpEpexI4R6/phO8Ry7Lb0fKxnwaDVg
1mFbf0GOTN6C7nKfhsqSqWLhcyf+DuBCZj5VxoCn1IHpwT+B4gmc+iED4xvP6uvx
dFi6t5VGZsnbRyPtx0iRzY8dVhvguXgDayWEkGOX+biUJ8DsY9XVqmwBGE6RH4FH
EKuwWQK9Ulcabl2e1pF0aTL6DXMBY9XY/iCGG4Z6H/wxg+IdVoM=
=WsnR
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--
