Received: by 10.25.15.230 with SMTP id 99csp1538009lfp;
        Tue, 28 Mar 2017 02:59:13 -0700 (PDT)
X-Received: by 10.55.46.5 with SMTP id u5mr22178238qkh.162.1490695153283;
        Tue, 28 Mar 2017 02:59:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l40si3035909qtc.192.2017.03.28.02.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Mar 2017 02:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1csnuC-0000Qi-OZ
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 05:59:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1csnu7-0000Q6-JU
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 05:59:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1csnu6-00082J-8P
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 05:59:07 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47235)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1csnu5-00080G-Q7; Tue, 28 Mar 2017 05:59:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3vsmZC22CVz9s7N; Tue, 28 Mar 2017 20:58:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1490695139;
	bh=oKpIrjoL3DpWztskABEX6+rnyIp5yq+Ti/jdH5dDHHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4Hi9bYP8YG33OMBIbT7pk08GE0NPo/ZxIjWA67IlXP1erHfRnBMOzsxcsGpVGETt
	xnRC0s5OsX+hG7bviIWJA1b/cztctva0QizSyvNubD/PvXyT/bryVPmiMaXHxgex6u
	ERxbvnnKLvs+p4yB7kszsrA6UYhKJ+4IV46Gnjvo=
Date: Tue, 28 Mar 2017 16:13:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170328051305.GI21068@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-21-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UthUFkbMtH2ceUK2"
Content-Disposition: inline
In-Reply-To: <1490189568-167621-21-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH for-2.10 20/23] numa: use possible_cpus for
 not mapped CPUs check
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
X-TUID: /Odvb5YDmsAb


--UthUFkbMtH2ceUK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 02:32:45PM +0100, Igor Mammedov wrote:
> and remove corresponding part in numa.c that uses
> node_cpu bitmaps.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> It's one more less user of node_cpu bitmpas, following
> commit will remove the last user along with
> node_cpu itself.
> ---
>  hw/core/machine.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  numa.c            | 10 ----------
>  2 files changed, 58 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d284a63..ab51d2c 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -19,6 +19,7 @@
>  #include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
>  #include "qemu/cutils.h"
> +#include "sysemu/numa.h"
> =20
>  static char *machine_get_accel(Object *obj, Error **errp)
>  {
> @@ -643,9 +644,66 @@ bool machine_mem_merge(MachineState *machine)
>      return machine->mem_merge;
>  }
> =20
> +static char *cpu_slot_to_string(const CPUArchId *cpu)
> +{
> +    GString *s =3D g_string_new(NULL);
> +    if (cpu->props.has_socket_id) {
> +        g_string_append_printf(s, "socket-id: %"PRId64, cpu->props.socke=
t_id);
> +    }
> +    if (cpu->props.has_core_id) {
> +        if (s->len) {
> +            g_string_append_printf(s, ", ");
> +        }
> +        g_string_append_printf(s, "core-id: %"PRId64, cpu->props.core_id=
);
> +    }
> +    if (cpu->props.has_thread_id) {
> +        if (s->len) {
> +            g_string_append_printf(s, ", ");
> +        }
> +        g_string_append_printf(s, "thread-id: %"PRId64, cpu->props.threa=
d_id);
> +    }
> +    return g_string_free(s, false);
> +}
> +
> +static void machine_numa_validate(MachineState *machine)
> +{
> +    int i;
> +    GString *s =3D g_string_new(NULL);
> +    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> +    const CPUArchIdList *possible_cpus =3D mc->possible_cpu_arch_ids(mac=
hine);
> +
> +    assert(nb_numa_nodes);
> +    for (i =3D 0; i < possible_cpus->len; i++) {
> +        const CPUArchId *cpu_slot =3D &possible_cpus->cpus[i];
> +
> +        /* at this point numa mappings are initilized by CLI options
> +         * or with default mappings so it's sufficient to list
> +         * all not yet mapped CPUs here */
> +        /* TODO: make it hard error in future */
> +        if (!cpu_slot->props.has_node_id) {
> +            char *cpu_str =3D cpu_slot_to_string(cpu_slot);
> +            g_string_append_printf(s, "%sCPU %d [%s]", s->len ? ", " : "=
", i,
> +                                   cpu_str);
> +            g_free(cpu_str);
> +        }
> +    }
> +    if (s->len) {
> +        error_report("warning: CPU(s) not present in any NUMA nodes: %s",
> +                     s->str);
> +        error_report("warning: All CPU(s) up to maxcpus should be descri=
bed "
> +                     "in NUMA config, ability to start up with partial N=
UMA "
> +                     "mappings is obsoleted and will be removed in futur=
e");
> +    }
> +    g_string_free(s, true);
> +}
> +
>  void machine_run_board_init(MachineState *machine)
>  {
>      MachineClass *machine_class =3D MACHINE_GET_CLASS(machine);
> +
> +    if (nb_numa_nodes) {
> +        machine_numa_validate(machine);
> +    }
>      machine_class->init(machine);
>  }
> =20
> diff --git a/numa.c b/numa.c
> index 8461c96..523558f 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -293,16 +293,6 @@ static void validate_numa_cpus(void)
>          bitmap_or(seen_cpus, seen_cpus,
>                    numa_info[i].node_cpu, max_cpus);
>      }
> -
> -    if (!bitmap_full(seen_cpus, max_cpus)) {
> -        char *msg;
> -        bitmap_complement(seen_cpus, seen_cpus, max_cpus);
> -        msg =3D enumerate_cpus(seen_cpus, max_cpus);
> -        error_report("warning: CPU(s) not present in any NUMA nodes: %s"=
, msg);
> -        error_report("warning: All CPU(s) up to maxcpus should be descri=
bed "
> -                     "in NUMA config");
> -        g_free(msg);
> -    }
>      g_free(seen_cpus);
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--UthUFkbMtH2ceUK2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY2fDeAAoJEGw4ysog2bOSRKwQAMEVh0COgsrGX2dYy1mw/r+E
bgod+6TZmRut9oyuG1N/hYtsHVe5BPeby3kGZ9FbkWhiWFBRvjPpjpQBQPuuW3WT
tggdxXLevp/zaisaaZ5RojdACnDd6mudAOcasALAupvFdi6uoUBThWjpbg5w3/p2
Nn/MDtVjwUlC13jwp5UpnKno/cOR/2Buxk3PZwVsq10YKa7r1v8smYoD8nslLh1b
73tZpg3ezSatYjmfLTO2w1YHjMoN0tYhHeQ2G4TTSuYQmFyGG4Qx3uVtBp6HQJT9
acXIdX2VPR9tZWq/cbR0DbzTie+j2xRWj9PwjMTPjzKxvvaMWHZHjxd9INNO10mF
jVicyH+t2PQiCF44hci31omPpgK9cS7Mp00cGAC0lxPLi/+6uZnZdHfm2lPg+2Kf
0djalBqH4vPJbAGDk1z5up7BBE81jQKZFzk5v73nDvdObpjIWvPUHBZYuisNkjAB
AVoBmex9ITf7211W4xNxSfBfEAmy6IyZk+l54OjIv+PSLWpbrBZXGeTm/uKmRpIN
cYySR5o7qvtfevAM9teGND6AVnQdJl9zfIB//ZpRWhmcCf493ZRzaR12t39Xivs1
3gABvgzPkde/zXwz9x60N+KaEe7s2NbltHMS5LbRIci/3MFbFufp+maQN4/aZuxT
Wdsz9Q0qZ1pLKf7jTD9I
=ZzvV
-----END PGP SIGNATURE-----

--UthUFkbMtH2ceUK2--
