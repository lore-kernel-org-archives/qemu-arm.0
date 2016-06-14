Received: by 10.25.141.12 with SMTP id p12csp4964lfd;
        Mon, 13 Jun 2016 20:09:55 -0700 (PDT)
X-Received: by 10.237.50.199 with SMTP id z65mr13642389qtd.24.1465873795351;
        Mon, 13 Jun 2016 20:09:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j93si17090827qte.56.2016.06.13.20.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 20:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCeji-0003Tw-Pr
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 23:09:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCejd-0003S1-68
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 23:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCejY-0008P3-2y
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 23:09:48 -0400
Received: from ozlabs.org ([103.22.144.67]:42692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCejX-0008Oz-Nq; Mon, 13 Jun 2016 23:09:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTF4P5ZYvz9t0q; Tue, 14 Jun 2016 13:09:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465873781;
	bh=tDWHuzKwYlIrI+CNB2POVW/gCA1dM7CDeR39U57P0hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WwNZrX0OzjrPL4Pb1IOL5HlRrkp1GBHaoZ38xbCNPm2gOQMdcBsB9/UNL5Rj56UjY
	Ww0eu6CRKTct6POlwgONvV1iEYaGTWoPUDRZKYZNvssfGgeMdL24o4Y2X9bJB+08wz
	UMnEjmhoFjk9WLskv2rr6zuiXBLpg7jInMR7ACpY=
Date: Tue, 14 Jun 2016 13:03:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160614030341.GJ4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-11-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yr/DzoowOgTDcSCF"
Content-Disposition: inline
In-Reply-To: <1465580427-13596-11-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH RFC 10/16] hw/ppc/spapr: don't use smp_cores,
 smp_threads
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
X-TUID: SddJb7Zikbcj


--yr/DzoowOgTDcSCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 07:40:21PM +0200, Andrew Jones wrote:
> Use CPUState nr_cores,nr_threads and MachineState
> cores,threads instead.
>=20
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/ppc/spapr.c      | 9 +++++----
>  hw/ppc/spapr_rtas.c | 2 +-
>  2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 063664234106e..f78276bb4b164 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -35,7 +35,6 @@
>  #include "net/net.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/block-backend.h"
> -#include "sysemu/cpus.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/device_tree.h"
>  #include "kvm_ppc.h"
> @@ -603,7 +602,7 @@ static void spapr_populate_cpu_dt(CPUState *cs, void =
*fdt, int offset,
>      uint32_t cpufreq =3D kvm_enabled() ? kvmppc_get_clockfreq() : 100000=
0000;
>      uint32_t page_sizes_prop[64];
>      size_t page_sizes_prop_size;
> -    uint32_t vcpus_per_socket =3D smp_threads * smp_cores;
> +    uint32_t vcpus_per_socket =3D cs->nr_cores * cs->nr_threads;
>      uint32_t pft_size_prop[] =3D {0, cpu_to_be32(spapr->htab_shift)};
> =20
>      /* Note: we keep CI large pages off for now because a 64K capable gu=
est
> @@ -1774,7 +1773,7 @@ static void ppc_spapr_init(MachineState *machine)
>      /* Set up Interrupt Controller before we create the VCPUs */
>      spapr->icp =3D xics_system_init(machine,
>                                    DIV_ROUND_UP(max_cpus * kvmppc_smt_thr=
eads(),
> -                                               smp_threads),
> +                                               machine->threads),
>                                    XICS_IRQS, &error_fatal);
> =20
>      if (smc->dr_lmb_enabled) {
> @@ -2268,9 +2267,11 @@ static HotplugHandler *spapr_get_hotpug_handler(Ma=
chineState *machine,
> =20
>  static unsigned spapr_cpu_index_to_socket_id(unsigned cpu_index)
>  {
> +    CPUState *cs =3D first_cpu;
> +
>      /* Allocate to NUMA nodes on a "socket" basis (not that concept of
>       * socket means much for the paravirtualized PAPR platform) */
> -    return cpu_index / smp_threads / smp_cores;
> +    return cpu_index / cs->nr_cores / cs->nr_threads;
>  }
> =20
>  static void spapr_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 43e2c684fda8d..3fdfbb01a20dd 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -742,7 +742,7 @@ int spapr_rtas_device_tree_setup(void *fdt, hwaddr rt=
as_addr,
>      lrdr_capacity[1] =3D cpu_to_be32(max_hotplug_addr & 0xffffffff);
>      lrdr_capacity[2] =3D 0;
>      lrdr_capacity[3] =3D cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE);
> -    lrdr_capacity[4] =3D cpu_to_be32(max_cpus/smp_threads);
> +    lrdr_capacity[4] =3D cpu_to_be32(max_cpus / machine->threads);
>      ret =3D qemu_fdt_setprop(fdt, "/rtas", "ibm,lrdr-capacity", lrdr_cap=
acity,
>                       sizeof(lrdr_capacity));
>      if (ret < 0) {

I think all the places that use cs->nr_* here it actually makes more
sense to use the value in the machine state.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yr/DzoowOgTDcSCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX3QNAAoJEGw4ysog2bOSgtsQAOLuQPBzbDU4BGtowsGHTLl3
KvjHZv0J+fNOFwexC8sPFC8Zva/+51R9a4h8bmIGGdTByqXMsIN3ipr5JeeFUhNC
jBLJ9EcVPtWw+Eonh78kW4J6NINEU38/zoCi3Fz1zzxMIp4MWobzuj/N5cGQiUun
W5HRonBFXaPT9+Hlem6fTFoNYS1FVCinvtt5blwyBkBkZFbJrbcSIoSN6sEJ3UCz
oODmus66V/WZQ3CmGwRU61SmS4KP9zF7lXDy9S3+ALd9sZewhpTjm7MMEy2d3pcd
5UsdPw41mryUg5Vy2yCe1wEcY10RcNCiy0qGi9WlSj1H0kOtn5qrwGJ6RDUD4kF/
nlh3eDEW0E0tAHy2DF+Mqnr6cur4yRpswp/DHVFFqKDYMrfL7S1e4NwbyKPBkd41
TNoKNx7wvgo+VasdoYyOghQpraXkncEnXYTIBprpwidrD9t6ZNWp/z/4SKJd/jlt
TJv/JqeCKRX1V9Bre3u1uVinSAMXZRu6+fEC0cjkExWJde44yhuTpj75kV6Z7hXH
nZ4psH/9ubyvsaHW/UPaQMdLJwV+GUJDf3e13s/CDOv/i8HDL15bS1yowxEsefaQ
3z/5IJcRULagKmpeUPOe2xUC6xKmGekoQJB2CD+/xU4B9+SdRRhqbz7l4keqrZRJ
nL++7dkpzes1XpfqWgRm
=WjpQ
-----END PGP SIGNATURE-----

--yr/DzoowOgTDcSCF--
