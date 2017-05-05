Received: by 10.25.0.198 with SMTP id 189csp879765lfa;
        Thu, 4 May 2017 20:16:06 -0700 (PDT)
X-Received: by 10.55.137.193 with SMTP id l184mr11998079qkd.122.1493954166617;
        Thu, 04 May 2017 20:16:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t72si3439695qkt.211.2017.05.04.20.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 20:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6Tit-0005Mf-Uh
	for alex.bennee@linaro.org; Thu, 04 May 2017 23:16:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d6Tin-0005MN-Qa
	for qemu-arm@nongnu.org; Thu, 04 May 2017 23:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d6Tik-0004kG-DG
	for qemu-arm@nongnu.org; Thu, 04 May 2017 23:15:57 -0400
Received: from ozlabs.org ([103.22.144.67]:32815)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d6Tij-0004jw-By; Thu, 04 May 2017 23:15:54 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wJxqS3w5Dz9s9c; Fri,  5 May 2017 13:15:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1493954148;
	bh=IgjnEi6XUa6ggvDdoG0t74kI5pHukVV5JN3Xq7o7AM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNrA3po821smfD6Rv/40aGiYx9MWOeYTaoIhf5WUYpvJPLIxP4bZV9nHn+1JYt3G6
	oN335fv5XaSAHUeiwyVNuOJlUEHH9sMEFbWv2Eam40GS0PuDnZJx+DmBafX7KyeD3G
	AGG3SqE+MbA91EfsqPYF4rYkV5/mXgQEPGGVr4rU=
Date: Fri, 5 May 2017 13:15:32 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170505031532.GL14413@umbus.fritz.box>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-15-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RNGrj7vazCqBHNw7"
Content-Disposition: inline
In-Reply-To: <1493816238-33120-15-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v2 14/24] spapr: get numa node mapping from
 possible_cpus instead of numa_get_node_for_cpu()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ezvLfHMkSgbN


--RNGrj7vazCqBHNw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2017 at 02:57:08PM +0200, Igor Mammedov wrote:
> it's safe to remove thread node_id !=3D core node_id error
> branch as machine_set_cpu_numa_node() also does mismatch
> check and is called even before any CPU is created.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr.c          |  4 ++--
>  hw/ppc/spapr_cpu_core.c | 14 ++------------
>  2 files changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 7f58ee4..bcb91e7 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2863,8 +2863,8 @@ static void spapr_core_pre_plug(HotplugHandler *hot=
plug_dev, DeviceState *dev,
>          goto out;
>      }
> =20
> -    node_id =3D numa_get_node_for_cpu(cc->core_id);
> -    if (node_id =3D=3D nb_numa_nodes) {
> +    node_id =3D core_slot->props.node_id;
> +    if (!core_slot->props.has_node_id) {
>          /* by default CPUState::numa_node was 0 if it's not set via CLI
>           * keep it this way for now but in future we probably should
>           * refuse to start up with incomplete numa mapping */
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 9de7a56..a17ea07 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -181,7 +181,6 @@ static void spapr_cpu_core_realize(DeviceState *dev, =
Error **errp)
> =20
>      sc->threads =3D g_malloc0(size * cc->nr_threads);
>      for (i =3D 0; i < cc->nr_threads; i++) {
> -        int node_id;
>          char id[32];
>          CPUState *cs;
> =20
> @@ -191,17 +190,8 @@ static void spapr_cpu_core_realize(DeviceState *dev,=
 Error **errp)
>          cs =3D CPU(obj);
>          cs->cpu_index =3D cc->core_id + i;
> =20
> -        /* Set NUMA node for the added CPUs  */
> -        node_id =3D numa_get_node_for_cpu(cs->cpu_index);
> -        if (node_id !=3D sc->node_id) {
> -            error_setg(&local_err, "Invalid node-id=3D%d of thread[cpu-i=
ndex: %d]"
> -                " on CPU[core-id: %d, node-id: %d], node-id must be the =
same",
> -                 node_id, cs->cpu_index, cc->core_id, sc->node_id);
> -            goto err;
> -        }
> -        if (node_id < nb_numa_nodes) {
> -            cs->numa_node =3D node_id;
> -        }
> +        /* Set NUMA node for the threads belonged to core  */
> +        cs->numa_node =3D sc->node_id;
> =20
>          snprintf(id, sizeof(id), "thread[%d]", i);
>          object_property_add_child(OBJECT(sc), id, obj, &local_err);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RNGrj7vazCqBHNw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZC+5QAAoJEGw4ysog2bOSjeMQAKk3TNS2uIGaheLJliuEDZVX
/cM6elEU+IVVVF+4Gt6hD5g1Car5lKzwFvSxjJLXSol71WMAKv6bCcVRRfThi/10
7zrr1d4DsWpWv5zq+FuaeOcK8npNckKcRiDxDTBjsussJEGHwrXcix8ZxLP4W3af
vOhEt0sYTSTdo6Fl9BqUTMQ2UY4ORXxPCoRoR9FV8+TNj/JLmWSpAuEwEMplrqwz
rSiN29/eFnmwM766Lz55h7FzxaujAiXUHZjLbMo6PuXkUWCGwbqSg4DM0WXN2mOd
D4Bkb0/TOhTsU/aEwYfevyxm7541McZYFPeE5nffbEqYwJol9UJlarVKvpgLDkwN
iGYPOdPRhXS9EWGxciItHB1msVWaa6Cd66eEqX/74cpl26FhW9JJMbQddR9IX/29
NQr+BMt9rBiNJsuQD7Vpf7X6roNphrekMpIxrAGLAy8B/8rf3aMT2Ci3MG4v/Q0i
8jy+w+mmnmE28i4VHPmFOBbhaKNZG3+eGmguffjqtBW8UwC174C7eFKDGsT8NjPY
s779c47l/7Gk1Q+DusXKwwUD0CDyE08HPzPwLxbZSuWWYge+VAUxy0bo2Ki8Yhfd
tchtP5vc1simfy96Ue7wrxh21MfEAsFvrCE68R9wL5ka/oguYzruW0puWABoF40U
Btd0ZxZLDN6bfrRzaZtS
=fg33
-----END PGP SIGNATURE-----

--RNGrj7vazCqBHNw7--
