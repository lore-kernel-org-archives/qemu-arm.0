Received: by 10.25.15.230 with SMTP id 99csp1455977lfp;
        Mon, 27 Mar 2017 22:09:33 -0700 (PDT)
X-Received: by 10.55.192.79 with SMTP id o76mr21737798qki.272.1490677773208;
        Mon, 27 Mar 2017 22:09:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r67si2541032qka.176.2017.03.27.22.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Mar 2017 22:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1csjNs-0008Nz-MW
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 01:09:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1csjNo-0008Nd-CT
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 01:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1csjNn-0000Om-5z
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 01:09:28 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:60191)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1csjNm-0000Mu-Cv; Tue, 28 Mar 2017 01:09:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3vsf7y2jFwz9ryb; Tue, 28 Mar 2017 16:09:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1490677758;
	bh=cZOgq8ZmvgIA1/Wk5Vuxp4VDxSFefhNlU2tkExXxwWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0rmWkKx0IFNfFm9CddwxaFAwY78PcPS0YMkETtf4G3lSM5mJZ2kUVRLreG1zM9dI
	5JWoO/9LZf467fAcuRVxZssH+hKqIXEqD/wVHCDX4kzjYOVDoU84CLumFB+3/S23QG
	Ra5x5f3idqmCNxiRhyY8wuK40i5HET2+gmD5e6jM=
Date: Tue, 28 Mar 2017 15:46:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170328044633.GF21068@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-12-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IvGM3kKqwtniy32b"
Content-Disposition: inline
In-Reply-To: <1490189568-167621-12-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH for-2.10 11/23] numa: do default mapping
 based on possible_cpus instead of node_cpu bitmaps
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
X-TUID: Vpw1d6lSXnq7


--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 02:32:36PM +0100, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  numa.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/numa.c b/numa.c
> index 44057f1..ab41776 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -309,6 +309,7 @@ static void validate_numa_cpus(void)
>  void parse_numa_opts(MachineState *ms)
>  {
>      int i;
> +    const CPUArchIdList *possible_cpus;
>      MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> =20
>      for (i =3D 0; i < MAX_NODES; i++) {
> @@ -379,11 +380,6 @@ void parse_numa_opts(MachineState *ms)
> =20
>          numa_set_mem_ranges();
> =20
> -        for (i =3D 0; i < nb_numa_nodes; i++) {
> -            if (!bitmap_empty(numa_info[i].node_cpu, max_cpus)) {
> -                break;
> -            }
> -        }
>          /* Historically VCPUs were assigned in round-robin order to NUMA
>           * nodes. However it causes issues with guest not handling it ni=
ce
>           * in case where cores/threads from a multicore CPU appear on
> @@ -391,11 +387,20 @@ void parse_numa_opts(MachineState *ms)
>           * rule grouping VCPUs by socket so that VCPUs from the same soc=
ket
>           * would be on the same node.
>           */
> -        if (!mc->cpu_index_to_instance_props) {
> +        if (!mc->cpu_index_to_instance_props || !mc->possible_cpu_arch_i=
ds) {
>              error_report("default CPUs to NUMA node mapping isn't suppor=
ted");
>              exit(1);
>          }
> -        if (i =3D=3D nb_numa_nodes) {
> +
> +        possible_cpus =3D mc->possible_cpu_arch_ids(ms);
> +        for (i =3D 0; i < possible_cpus->len; i++) {
> +            if (possible_cpus->cpus[i].props.has_node_id) {
> +                break;
> +            }
> +        }
> +
> +        /* no CPUs are assigned to NUMA nodes */
> +        if (i =3D=3D possible_cpus->len) {
>              for (i =3D 0; i < max_cpus; i++) {
>                  CpuInstanceProperties props;
>                  /* fetch default mapping from board and enable it */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY2eqpAAoJEGw4ysog2bOSFzMP/25zmgP8Hm+XB1cCMJyzR/k1
NhQDzE3EMWwhul/kaUBKRRxodv9vpqZMG9gBNkJpcw4NhFO5ZtbrxrNqUWg/XUeJ
EqMM7zIDfY0GQ9+UyBhAGebGnZ6rLW+lzPs+4Ri4kvJha5x/cQiid7AAbAR9bmu1
PH4fazs7nUSJRYmhcQ+QPhnnXM60RZaozpZvNf3KD1C7WiLsno1SHhXdPDvxh8be
R72JB52r+nvJJEYxa0Z7bsyLILm8oeDO4DiiyOO8mdCXVFMMz2IFI50pcn9oSIQw
QoLljRia82DL2GzfqBCebztOlgUxsv0z1dU0ZfFZ0kehnp4wuHqtmSNr3m1lr2ZB
eYaHOeGH0JC3Q+6cs6rydKtsDwLnXECPbXqp8EI7hAZUoJT77CI3tTWywyWCFAx3
+s9xf3JLjIDO1oCc41DXYYJVYrnuzWcn8btSUU7lWicAHNzb2AD8w9h7YYD0kVbz
sVR0IdkaU+ZeKilykgUg8ysGq3c/0mSRUaTi//bQlmbrZMM6aaaq2gKNU0bmAe5C
BBVbvTAZoe2sZvTG1lL6TblaZkVmvmYqOKIBS2v+MytrauY+y3qDhsIiLFNPFWrI
b6bYRU0Hkrc82ZRTFbFVtB3lE7i7V7jIhWADBtnkpovGfgByDeE7saB94TwupA1f
CONXsWCosDb6O+oUJrWk
=JOY2
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--
