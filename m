Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2094523wrt;
        Sun, 21 Oct 2018 12:11:15 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62BHyaPnINjgqd8csqyowJTyTdXVa5nPHfFZs8ERaqwPalJFnpHKmLe5Y8GjqCLqTrLAMBW
X-Received: by 2002:aed:25f7:: with SMTP id y52-v6mr4786146qtc.217.1540149075160;
        Sun, 21 Oct 2018 12:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540149075; cv=none;
        d=google.com; s=arc-20160816;
        b=YrEQfeRy0PeQ5Q6ZpotGrlRFNeMp0EJOGAQKOMcCUb7Ag3x2sAw6epMlyq/52xkFCo
         h+o38qzAKmtJQG1g0zTkKw/UVn63lDvzMmIpTiYdQi2t/ZpdOLJJC9Qxai3Ye+M8NPV1
         8f1Z74FcVgrR8oEzmQiCf6ImMy+kw+LRVZVBjEpX7EuvUSidM5VOcZ9RnCiWadm3rS7t
         e5NjpO+XQEWYgB/xMZjLTNpT1tShaKxRg/m5XZNiwHBYLe5FnxFvNPQOvPpneme4Tn5h
         W2/1pTwqjvUgEQnzqhNOo5nxq32gn+LxEqKHfNXH+qr91BG61xoEdXlQBualo0tudsoD
         lEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=ONHw2U0hbjN5On2g5jOKpD+NXdHWWl04UBa7hve4mLE=;
        b=o4igAdulzKgcalvrpdjpnD0RZ8T2/jnB7vrSzGRFfPgKBFdx+lcK1JN6uO2e5FNqfg
         30UINwo3eg7hJtN9IruD8+4gyq1H+L8i3T+GofH1rQuoZiT3tu9LSpFLnPItI+GE9VVn
         bV/cXVapl5gn1TZJWMz5IDRpYUltCUTDqwRrF09y3VB72sXjjRvvEEldBpjxu0G58CwO
         44WKGg7jBZ2eLCasQLAZrjcqN3Vhdq6BGWipWCnjFqclzPNBExXZBN76yp5pUmmlYQxN
         YyRGjTnczOIf4xlipvDc6x5O9nxDO1APJ3EfMNmVAIMY1Dio04E9ejv9bTqNLlEfeVhv
         8XDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Jjh6+npQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s86-v6si2001186qki.14.2018.10.21.12.11.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 Oct 2018 12:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=Jjh6+npQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEJ86-00043N-Kq
	for alex.bennee@linaro.org; Sun, 21 Oct 2018 15:11:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEJ6J-00037Y-Bl
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 15:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEJ55-0000Xc-Cf
	for qemu-devel@nongnu.org; Sun, 21 Oct 2018 15:08:08 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:48521)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEJ53-0000Uw-5x; Sun, 21 Oct 2018 15:08:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42dTgc559rz9sC2; Mon, 22 Oct 2018 06:07:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540148876;
	bh=BiDDW0Bm7MnmVzBtPVuenX7Yf7OWOGd2SPldKhUlhII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jjh6+npQ/mh3N1zCmj+cBucqh7CysMwASGfokGwTPM9aFBjZNhbcyI0ApgLWBURD7
	dHJeWeSxY2bDoDg9bkBjGWowxLjWMkrP85hB8ErEy+f9KS5K9t/sOR8EuYWbZ3dZ+o
	q5kUzejMKgYG2dfdCVReNdJ6N7iLjo5lXlmmMRUU=
Date: Sun, 21 Oct 2018 18:38:20 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181021173820.GD2215@umbus>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-3-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a2FkP9tdjPU2nyhF"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-3-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PULL 02/45] vl.c deprecate incorrect CPUs topology
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
X-TUID: +zFPYJa20AT7


--a2FkP9tdjPU2nyhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:39PM -0300, Eduardo Habkost wrote:
> From: Igor Mammedov <imammedo@redhat.com>
>=20
> -smp [cpus],sockets/cores/threads[,maxcpus] should describe topology
> so that total number of logical CPUs [sockets * cores * threads]
> would be equal to [maxcpus], however historically we didn't have
> such check in QEMU and it is possible to start VM with an invalid
> topology.
> Deprecate invalid options combination so we can make sure that
> the topology VM started with is always correct in the future.
> Users with an invalid sockets/cores/threads/maxcpus values should
> fix their CLI to make sure that
>    [sockets * cores * threads] =3D=3D [maxcpus]
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Message-Id: <1536836762-273036-2-git-send-email-imammedo@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  vl.c                 |  7 +++++++
>  qemu-deprecated.texi | 12 ++++++++++++
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/vl.c b/vl.c
> index 4e25c78bff..027d04c7ca 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1235,6 +1235,13 @@ static void smp_parse(QemuOpts *opts)
>              exit(1);
>          }
> =20
> +        if (sockets * cores * threads !=3D max_cpus) {
> +            warn_report("Invalid CPU topology deprecated: "
> +                        "sockets (%u) * cores (%u) * threads (%u) "
> +                        "!=3D maxcpus (%u)",
> +                        sockets, cores, threads, max_cpus);
> +        }
> +
>          smp_cpus =3D cpus;
>          smp_cores =3D cores;
>          smp_threads =3D threads;
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 11b870c5c1..5d2d7a3588 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -86,6 +86,18 @@ for these file types is 'host_cdrom' or 'host_device' =
as appropriate.
>  The @option{name} parameter of the @option{-net} option is a synonym
>  for the @option{id} parameter, which should now be used instead.
> =20
> +@subsection -smp (invalid topologies) (since 3.1)
> +
> +CPU topology properties should describe whole machine topology including
> +possible CPUs.
> +
> +However, historically it was possible to start QEMU with an incorrect to=
pology
> +where @math{@var{n} <=3D @var{sockets} * @var{cores} * @var{threads} < @=
var{maxcpus}},
> +which could lead to an incorrect topology enumeration by the guest.
> +Support for invalid topologies will be removed, the user must ensure
> +topologies described with -smp include all possible cpus, i.e.
> +  @math{@var{sockets} * @var{cores} * @var{threads} =3D @var{maxcpus}}.
> +
>  @section QEMU Machine Protocol (QMP) commands
> =20
>  @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--a2FkP9tdjPU2nyhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvMuYwACgkQbDjKyiDZ
s5JDig/5AU+8EdxrE6ysYLety6twLv162003yw1dC/ZcWhwZEVO18rYmld22uS1S
qPVx2sCJrXh82xQNra2wajNAMHqMRdg0empoDb9AuFlQR6uVqfYNt1rbCue47/O0
+IHUh3V8DWV6P/gzUTvPUTqhwRXJpakoogCbLnEBLgixAmTZRuiatqiiB1CQLn4H
1eR1rQt6yg1GFpFmlo1UR5RKNa8tl01e2qj3hcktSnaeKQWCE+PHOKVZCsSWkhvc
qv67wZ26Q9Wyn4RWw4THbUsA1U2h4n0k2QFPtea59p+2Kl49EZzekpKkPeV43Dd2
MSvdWfvP102sEjlgftrN8FWeQJX7jq8FNQOgAq2a5h+J4zjLvJoxFNh8F9ZfsFOj
WwpJe2L2Y1eJmJR1lmUvVdii61NUO5uvQDI5opB2xReajrCTfeIFryqiTd3Kmg4G
cAtY8YXBhG4SC24PSaWDLCzgevoWIaGvxj3wFW7JlqpDq32YJEJcY7wAxBQEskY4
AVqRuwyulSgjsvlKkqPCwWDWT3shZR9u4iYUj/mQKegmeWYU0I2MIbKahf5xxQJW
cXdeZovywR3UjIL2SXi+jP3pSUfi7WUbF12pNm2mQweMxfbBqT+RaYIrVGNpgtsF
6p01oY0EGUhS586EBsQ1U5SfUhK+pddPWwRX5iw9M3PxpWHq7rI=
=IaX3
-----END PGP SIGNATURE-----

--a2FkP9tdjPU2nyhF--
