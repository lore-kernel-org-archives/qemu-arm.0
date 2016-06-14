Received: by 10.25.85.209 with SMTP id j200csp1480372lfb;
        Mon, 13 Jun 2016 18:36:07 -0700 (PDT)
X-Received: by 10.140.143.79 with SMTP id 76mr17329808qhp.72.1465868167449;
        Mon, 13 Jun 2016 18:36:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q79si8819946qhb.121.2016.06.13.18.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 18:36:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCdGw-0002Et-Pl
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 21:36:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCdGq-0002CI-DQ
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 21:36:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCdGo-0007E9-8U
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 21:35:59 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:58268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCdGn-0007Da-SI; Mon, 13 Jun 2016 21:35:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTC086gk9z9t10; Tue, 14 Jun 2016 11:35:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465868152;
	bh=14CE/abHGxgIoyJbrV+B7Nnt5EfqhkrYKSveqf+v0M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aL6nDYsOt1IgY0ELJuO3apXebjRWR8fEwyvAplg64m1nXOv/4DtUTmgL2T/QJLJGJ
	GF29HuFr6QzK9q+BGmXQ+CcJWCadE+cPRzTtDGl4eL28eAxp1Y6uPXyD06wZSis5Wd
	ldJ0AoA8PKQFYkZsiT4t6ty0xZrFMcM7ZJSFWHhU=
Date: Tue, 14 Jun 2016 11:15:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160614011526.GE4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-2-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Content-Disposition: inline
In-Reply-To: <1465580427-13596-2-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH RFC 01/16] vl: smp_parse: cleanups
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, imammedo@redhat.com, dgibson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cCspdbEEIxjZ


--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 07:40:12PM +0200, Andrew Jones wrote:
> No functional changes; only some code movement and removal of
> dead code (impossible conditions). Also, max_cpus can be
> initialized to 1, like smp_cpus, because it's either set by the
> user or set to smp_cpus, when smp_cpus is set by the user, or
> set to 1, when nothing is set.
>=20
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  vl.c | 34 +++++++++++++++-------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>=20
> diff --git a/vl.c b/vl.c
> index b0bcc255ee9a5..7b96e787922f9 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -154,7 +154,7 @@ CharDriverState *sclp_hds[MAX_SCLP_CONSOLES];
>  int win2k_install_hack =3D 0;
>  int singlestep =3D 0;
>  int smp_cpus =3D 1;
> -int max_cpus =3D 0;
> +int max_cpus =3D 1;
>  int smp_cores =3D 1;
>  int smp_threads =3D 1;
>  int acpi_enabled =3D 1;
> @@ -1223,7 +1223,6 @@ static QemuOptsList qemu_smp_opts =3D {
>  static void smp_parse(QemuOpts *opts)
>  {
>      if (opts) {
> -
>          unsigned cpus    =3D qemu_opt_get_number(opts, "cpus", 0);
>          unsigned sockets =3D qemu_opt_get_number(opts, "sockets", 0);
>          unsigned cores   =3D qemu_opt_get_number(opts, "cores", 0);
> @@ -1251,6 +1250,17 @@ static void smp_parse(QemuOpts *opts)
>          }
> =20
>          max_cpus =3D qemu_opt_get_number(opts, "maxcpus", cpus);
> +
> +        if (max_cpus > MAX_CPUMASK_BITS) {
> +            error_report("unsupported number of maxcpus");
> +            exit(1);
> +        }
> +
> +        if (max_cpus < cpus) {
> +            error_report("maxcpus must be equal to or greater than smp");
> +            exit(1);
> +        }
> +
>          if (sockets * cores * threads > max_cpus) {
>              error_report("cpu topology: "
>                           "sockets (%u) * cores (%u) * threads (%u) > "
> @@ -1260,25 +1270,11 @@ static void smp_parse(QemuOpts *opts)
>          }
> =20
>          smp_cpus =3D cpus;
> -        smp_cores =3D cores > 0 ? cores : 1;
> -        smp_threads =3D threads > 0 ? threads : 1;
> -
> -    }
> -
> -    if (max_cpus =3D=3D 0) {
> -        max_cpus =3D smp_cpus;
> -    }
> -
> -    if (max_cpus > MAX_CPUMASK_BITS) {
> -        error_report("unsupported number of maxcpus");
> -        exit(1);
> -    }
> -    if (max_cpus < smp_cpus) {
> -        error_report("maxcpus must be equal to or greater than smp");
> -        exit(1);
> +        smp_cores =3D cores;
> +        smp_threads =3D threads;
>      }
> =20
> -    if (smp_cpus > 1 || smp_cores > 1 || smp_threads > 1) {
> +    if (smp_cpus > 1) {
>          Error *blocker =3D NULL;
>          error_setg(&blocker, QERR_REPLAY_NOT_SUPPORTED, "smp");
>          replay_add_blocker(blocker);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX1quAAoJEGw4ysog2bOSAqUP/R2Q/tX70QgME0XMJYxRo0b0
/zuniIHTGIyOcRltwTq2ZG3i+8iN+EFabyitOvUZVPlIgObCbE6MPATIDrl1ZeMp
SpAAKrE7nPkjuTIcWo2Zi4xoWrxjPucMukoKXIUW7hoN8eR12fQQzmiz7c4hUuWq
FAZqvEGNYdJUG3BN6+mBpNl4l5/Uk7/W6b1tDrHiTiyFo1OhFu/SYiz+5z15jNWn
8BrCsk9cj6PKEHQNVmB62C97gOfmBhCFckFqlYf9hdNOgj1ANaIcDVjzX2uoXo7Y
plrW8MLelJOv6Ign9fvngkWlapqA0QYxUeWOe9WwK7yBuFLYbu1osW4mmALQyEpL
N91Qst/QpCk+wUaITysOsPNHjmN9nJYxuNysFBEBLLYMAcJUZYiClp7QDR9n+SL8
wqKD+6J4Q5FjIrdrDA7XoEC1O54gNZyQuLO/OxOAwp9HWUGivk3qV0ATuMfDuJz5
9Yw0U0OJRbPNbMo2eDSVCPk7hPc8GqM/W9Ih2JfuqpiRjol+oaFF1pRgBiueaGjg
6fRTqSBwRPnEwpLRfd7+tHSX706huv6ARX2rTNUQmmcglzyLvGVfrIaxesx5YTno
qoFJq0K3j9AiKyUaVd9I8LpgUX8gn9VjOM2rAiLOlOiOZLjUdn+NtQMFywi420Rz
yO2t4h5L8D/ofe/2/mal
=Dq9h
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--
