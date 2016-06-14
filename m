Received: by 10.25.85.209 with SMTP id j200csp1480388lfb;
        Mon, 13 Jun 2016 18:36:09 -0700 (PDT)
X-Received: by 10.55.174.198 with SMTP id x189mr9426778qke.71.1465868168799;
        Mon, 13 Jun 2016 18:36:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u20si16924871qke.28.2016.06.13.18.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 18:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60371 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCdGy-0002Fx-6V
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 21:36:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCdGr-0002DW-Op
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 21:36:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCdGm-0007Dm-K2
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 21:36:00 -0400
Received: from ozlabs.org ([103.22.144.67]:54103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCdGm-0007DX-95; Mon, 13 Jun 2016 21:35:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTC08615Yz9t0X; Tue, 14 Jun 2016 11:35:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465868152;
	bh=dQTJl8AlN+AP2qlgonFsg58/qb52MG2bzVSv+9ESG+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0uM5w89yipSLby3Wc4uHFrnvluIqk9zdQdOruQ5Z7nUmsKW7sFCSjd5/krpcY6GO
	QDuTetBtlRAkpypY2UU7ZUT0hoNpv5qCsX8xSiVXBahvlb4NZAR8b01RUlD0Nm+lPy
	pnxsFGmTXK8Y1GgdnJPBv4U3y7J4ztQdSPEsJpzw=
Date: Tue, 14 Jun 2016 11:28:52 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160614012852.GF4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-3-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rWhLK7VZz0iBluhq"
Content-Disposition: inline
In-Reply-To: <1465580427-13596-3-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH RFC 02/16] vl: smp: add checks for maxcpus
 based topologies
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
X-TUID: LS+kNb4NedcU


--rWhLK7VZz0iBluhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 07:40:13PM +0200, Andrew Jones wrote:
> smp_parse computes missing smp options. Unfortunately cores and
> threads are computed by dividing smp_cpus, instead of max_cpus.
> This is incorrect because the topology doesn't leave room for
> hotplug. More unfortunately, we can't change it easily, as doing
> so would impact existing command lines. This patch adds a warning
> when the topology doesn't add up, and then checks that the topology
> at least computes when sockets are recalculated. If not, then it
> does fail.
>=20
> Adding the new failure is justified by the fact that we don't
> store the number of input sockets, and thus all consumers of
> cpu topology information recalculate it. If they choose to
> (correctly) calculate it based on maxcpus, then we need to
> guard them against building topologies which provide more cpu
> slots than are the maximum allowed cpus.
>=20
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Hmm.. this makes sense to me.  Except that I've never been clear if
sockets=3D was supposed to match initial cpus or maxcpus.

> ---
>  vl.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/vl.c b/vl.c
> index 7b96e787922f9..8d482cb1bf020 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -1227,6 +1227,7 @@ static void smp_parse(QemuOpts *opts)
>          unsigned sockets =3D qemu_opt_get_number(opts, "sockets", 0);
>          unsigned cores   =3D qemu_opt_get_number(opts, "cores", 0);
>          unsigned threads =3D qemu_opt_get_number(opts, "threads", 0);
> +        bool sockets_input =3D sockets > 0;
> =20
>          /* compute missing values, prefer sockets over cores over thread=
s */
>          if (cpus =3D=3D 0 || sockets =3D=3D 0) {
> @@ -1269,6 +1270,24 @@ static void smp_parse(QemuOpts *opts)
>              exit(1);
>          }
> =20
> +        if (sockets_input && sockets * cores * threads !=3D max_cpus) {
> +            unsigned sockets_rounded =3D DIV_ROUND_UP(max_cpus, cores * =
threads);
> +
> +            error_report("warning: cpu topology: "
> +                         "sockets (%u) * cores (%u) * threads (%u) !=3D "
> +                         "maxcpus (%u). Trying sockets=3D%u.",
> +                         sockets, cores, threads, max_cpus, sockets_roun=
ded);
> +            sockets =3D sockets_rounded;
> +
> +            if (sockets * cores * threads > max_cpus) {
> +                error_report("cpu topology: "
> +                             "sockets (%u) * cores (%u) * threads (%u) >=
 "
> +                             "maxcpus (%u)",
> +                             sockets, cores, threads, max_cpus);
> +                exit(1);
> +            }
> +        }
> +
>          smp_cpus =3D cpus;
>          smp_cores =3D cores;
>          smp_threads =3D threads;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rWhLK7VZz0iBluhq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX13UAAoJEGw4ysog2bOSFdwQAMzJmz+pZN639n1ate/Dd7kq
BVeOO5MCYUz/AHeWrwiqWyuzYB4VJRg+UdZh/hIZXpw4JDQvYzPzeWK8ZTENuKfL
hhGlGQTLC9VZ+69t5FiT5awqUR7vAghsZ897RpcoC356IriLnRrOO3yQVgqrBtwm
Znyyy7xBpm0BJGId/N4Fg1tkQY5EUzeBugq6PiYlbrWS27X99bK/o1UeAvQwG1MZ
q26Kbz9svdvyNDq58Z/B/f7xHsxj34bGzEFcb/SFCXXhJedDz34lz0xszZLJ5jrK
YxESsBMIGE90qq+A/6ROEuOcp4OgWe6uBbj5yD24ZQKCeHJzVvSK0UCPVtXwK9op
GDuauiO7HsfX0WxQ8yfqERvMN1l3nofUkKZtIbyk4pomaIB6PkBYNcJcaCE3piY2
vVVtiyEaCRoSwOZ5SEUdkO97ZOmaM4p8+KR1ZwyGnILKeBmyUj7i3bhb27Cuedvr
yk9eTPdZFlqWayjZERa1gcMNLjzjpT7N3p1o9CHrOmFJthG+40OZw9BP9Y4ze5BG
6H7oSvFYBHt1FRWdPHu6SZeKKVvrBW5TFxVbjy6CshsiFLNkvuijvREJUlRP8bAa
G9kwgf0GWufHtxQwijLFyhDat/nU9ZawYe7Bc8ywvFJua92JOyVLtDmu9WE/WNij
ehKHbvyo+4Q+9285NzCQ
=5Hzb
-----END PGP SIGNATURE-----

--rWhLK7VZz0iBluhq--
