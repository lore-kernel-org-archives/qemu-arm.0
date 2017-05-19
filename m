Received: by 10.25.0.6 with SMTP id 6csp89694lfa;
        Thu, 18 May 2017 19:32:41 -0700 (PDT)
X-Received: by 10.55.162.136 with SMTP id l130mr7033197qke.275.1495161161026;
        Thu, 18 May 2017 19:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495161161; cv=none;
        d=google.com; s=arc-20160816;
        b=LpzrTvMqLOo3MWmloQGyUipKFc8DFvjLTDSbhJjfS6uKnVywFzfzEGgNcw4oDscDlZ
         ULUNhVESnlhelWl3MMQv+AtQ1JbfQ5hSgg/217rJc/beD45zvoF/K14nfzUXciPZggM5
         XXtM/pTgXm4CXwOI+32j2NEroo9fbGodGXC+IRCjhhZFSdHJXiRwaPIDAslP9FosdLlF
         nCiECw79EH/Ri0VS9xVj5lbNg9mFnL82jhTJDYA1Z78HbY94kIB1qzjNAFiI1Jzgyl3f
         y8D2TeWlpNCkLpKpwdFg+g5FnYb2RpbF6sVeJDQH1ZlKrjJp9Emw8lSNKVG57Mhh0NJH
         8Gqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=Ka8sdRXkF9cvUi25YgM/0Tp+ZF8JGs4UOpE/hsmEPGA=;
        b=y2C1Eraxk37+ySnAGHsLm6sW51MwHf+Z8JyHvgecZN5q5Xk4N6SviOsQVAXVfGxLM7
         +7ZjQaGSG0tP7jWLfJ5h72UU9INTZZsJPBtdsb+T/mXztYLquE2Lp9107Dw8R/ojd+BB
         onQNromDm9d1vzTj90CqXwmlAwPKqL/IrhodmWS4W0vK9wXJyeD6pwLe28Pop3zNpsi9
         ujIhi3l5owe9b2/99CTL1dySkGRYaayHna95fA7hEweYow0QJ1V4hPze9X6Di2IcplTu
         cW4pVBDWKVM9ZgP9fXFCsqqXp0SAbAWi1JYZtxmwWKxkAhbO5bF1jW8EnBWMZLLJYQ4/
         AKVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p30si7636778qtd.207.2017.05.18.19.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 May 2017 19:32:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBXia-0001Yu-E7
	for alex.bennee@linaro.org; Thu, 18 May 2017 22:32:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dBXiP-0001Ye-Ss
	for qemu-arm@nongnu.org; Thu, 18 May 2017 22:32:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1dBXiM-00026p-Po
	for qemu-arm@nongnu.org; Thu, 18 May 2017 22:32:29 -0400
Received: from ozlabs.org ([103.22.144.67]:41903)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1dBXiL-00025O-S9; Thu, 18 May 2017 22:32:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wTXBs6fpTz9s4s; Fri, 19 May 2017 12:32:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1495161141;
	bh=NaeD2u8TaECXgSoUi1+7Krl80zH03U//+FFG0/PSK64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LlaDk4vTpCxQLASMDOLcVhFfNWl8EoYnTz8r//9wzqoQ/k+w39+kgiIhvNfYTm4TD
	fT0nk41OXZJz4giioO6pyHEDxufxxmHZmhRWC6NHseSoZMXCPmrIiZ+eVUpAtkpHkI
	fE0wJhr9YPcUlJtjk9vTHexw8wG241+XfXWp2oTE=
Date: Fri, 19 May 2017 12:20:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170519022020.GB12284@umbus.fritz.box>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-2-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <1495094971-177754-2-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH 1/3] numa: consolidate cpu_preplug
 fixups/checks for pc/arm/spapr
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jSj/hijojah5


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 10:09:29AM +0200, Igor Mammedov wrote:
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/sysemu/numa.h |  1 +
>  hw/arm/virt.c         | 16 ++--------------
>  hw/i386/pc.c          | 17 +----------------
>  hw/ppc/spapr.c        | 17 +----------------
>  numa.c                | 22 ++++++++++++++++++++++
>  5 files changed, 27 insertions(+), 46 deletions(-)
>=20
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 7ffde5b..610eece 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -35,4 +35,5 @@ void numa_legacy_auto_assign_ram(MachineClass *mc, Node=
Info *nodes,
>                                   int nb_nodes, ram_addr_t size);
>  void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
>                                    int nb_nodes, ram_addr_t size);
> +void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **=
errp);
>  #endif
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index c7c8159..ce676df 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1351,7 +1351,6 @@ static void machvirt_init(MachineState *machine)
>      for (n =3D 0; n < possible_cpus->len; n++) {
>          Object *cpuobj;
>          CPUState *cs;
> -        int node_id;
> =20
>          if (n >=3D smp_cpus) {
>              break;
> @@ -1364,19 +1363,8 @@ static void machvirt_init(MachineState *machine)
>          cs =3D CPU(cpuobj);
>          cs->cpu_index =3D n;
> =20
> -        node_id =3D possible_cpus->cpus[cs->cpu_index].props.node_id;
> -        if (!possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
> -            /* by default CPUState::numa_node was 0 if it's not set via =
CLI
> -             * keep it this way for now but in future we probably should
> -             * refuse to start up with incomplete numa mapping */
> -             node_id =3D 0;
> -        }
> -        if (cs->numa_node =3D=3D CPU_UNSET_NUMA_NODE_ID) {
> -            cs->numa_node =3D node_id;
> -        } else {
> -            /* CPU isn't device_add compatible yet, this shouldn't happe=
n */
> -            error_setg(&error_abort, "user set node-id not implemented");
> -        }
> +        numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cp=
uobj),
> +                          &error_fatal);
> =20
>          if (!vms->secure) {
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index e36a375..d83c158 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1895,7 +1895,6 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug=
_dev,
>                              DeviceState *dev, Error **errp)
>  {
>      int idx;
> -    int node_id;
>      CPUState *cs;
>      CPUArchId *cpu_slot;
>      X86CPUTopoInfo topo;
> @@ -1986,21 +1985,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplu=
g_dev,
>      cs =3D CPU(cpu);
>      cs->cpu_index =3D idx;
> =20
> -    node_id =3D cpu_slot->props.node_id;
> -    if (!cpu_slot->props.has_node_id) {
> -        /* by default CPUState::numa_node was 0 if it's not set via CLI
> -         * keep it this way for now but in future we probably should
> -         * refuse to start up with incomplete numa mapping */
> -        node_id =3D 0;
> -    }
> -    if (cs->numa_node =3D=3D CPU_UNSET_NUMA_NODE_ID) {
> -        cs->numa_node =3D node_id;
> -    } else if (cs->numa_node !=3D node_id) {
> -            error_setg(errp, "node-id %d must match numa node specified"
> -                "with -numa option for cpu-index %d",
> -                cs->numa_node, cs->cpu_index);
> -            return;
> -    }
> +    numa_cpu_pre_plug(cpu_slot, dev, errp);
>  }
> =20
>  static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 0980d73..c7fee8b 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2831,11 +2831,9 @@ static void spapr_core_pre_plug(HotplugHandler *ho=
tplug_dev, DeviceState *dev,
>      MachineClass *mc =3D MACHINE_GET_CLASS(hotplug_dev);
>      Error *local_err =3D NULL;
>      CPUCore *cc =3D CPU_CORE(dev);
> -    sPAPRCPUCore *sc =3D SPAPR_CPU_CORE(dev);
>      char *base_core_type =3D spapr_get_cpu_core_type(machine->cpu_model);
>      const char *type =3D object_get_typename(OBJECT(dev));
>      CPUArchId *core_slot;
> -    int node_id;
>      int index;
> =20
>      if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
> @@ -2870,20 +2868,7 @@ static void spapr_core_pre_plug(HotplugHandler *ho=
tplug_dev, DeviceState *dev,
>          goto out;
>      }
> =20
> -    node_id =3D core_slot->props.node_id;
> -    if (!core_slot->props.has_node_id) {
> -        /* by default CPUState::numa_node was 0 if it's not set via CLI
> -         * keep it this way for now but in future we probably should
> -         * refuse to start up with incomplete numa mapping */
> -        node_id =3D 0;
> -    }
> -    if (sc->node_id =3D=3D CPU_UNSET_NUMA_NODE_ID) {
> -        sc->node_id =3D node_id;
> -    } else if (sc->node_id !=3D node_id) {
> -        error_setg(&local_err, "node-id %d must match numa node specifie=
d"
> -            "with -numa option for cpu-index %d", sc->node_id, cc->core_=
id);
> -        goto out;
> -    }
> +    numa_cpu_pre_plug(core_slot, dev, &local_err);
> =20
>  out:
>      g_free(base_core_type);
> diff --git a/numa.c b/numa.c
> index ca73145..0115bfd 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -534,6 +534,28 @@ void parse_numa_opts(MachineState *ms)
>      }
>  }
> =20
> +void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **=
errp)
> +{
> +    int node_id =3D object_property_get_int(OBJECT(dev), "node-id", errp=
);
> +
> +    if (node_id =3D=3D CPU_UNSET_NUMA_NODE_ID) {
> +        /* by default CPUState::numa_node was 0 if it wasn't set explici=
tly
> +         * TODO: make it error when incomplete numa mapping support is r=
emoved
> +         */
> +        node_id =3D 0;
> +
> +        /* due to bug in libvirt, it doesn't pass node-id from props on
> +         * device_add as expected, so we have to fix it up here */
> +        if (slot->props.has_node_id) {
> +            node_id =3D slot->props.node_id;
> +        }
> +        object_property_set_int(OBJECT(dev), node_id, "node-id", errp);
> +    } else if (node_id !=3D slot->props.node_id) {
> +        error_setg(errp, "node-id=3D%d must match numa node specified "
> +                   "with -numa option", node_id);
> +    }
> +}
> +
>  static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *own=
er,
>                                             const char *name,
>                                             uint64_t ram_size)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZHlZiAAoJEGw4ysog2bOSEtYP/RNvOSPJHGw7Eph/vSwG0cAa
0qH6qwybcR17o1tbC2eoUgmHLBT+cKPsEV1KnuoXLj/1872Pinx9SXvTAcwlH+lz
JaCrwQH7hsBaAdnkt6hI6RN3quRNMBMi7sJuqV3aAkrwU+SdGHDr624oCz/0Ur9x
F9heJbgb5dyaMlNchuIcMq2yXQAX2ddlBDht0ozm7+a9wahWmwawm5zbcRlX4uIS
F/KDEPLo8NnOFvy1h1WLDCK6VHsdog9D7fBVkYiMs1YqzJt0i/75+LttWZqo+Lvo
jxZEt059BXx2vZRglwJeCsyuneRvMJAHUd5ALx3aN3u1INhuWZllSZ7NfuD4mnSQ
uztlGPmSxzi6HqfMvT8FfEnXDxMlRoAJ0WSlwOUhLQ82JpaFCoStCJvACJ8cOKOH
wLqaJMavBpmjLZRpWfVvuyJwj3z4KXOD1oJFywHMkaG8b0ybx0rMs5vONeDrUMoR
urQVhrg3bcYPhV51KjSbF7Hc9BKlWhfI3SN0hAoTmG0TV8y5VZPjz1aO7F1E+HKR
FN2rY9A/PHPOex0eiYs8G+CIDuWdwtmNLnshUr7hc9leCwhMIdcsD0+TaiN/AXCm
C39RgKnv3lD6BTvlPSvjzc6PFTM0tyz2yrP18iz73u+Csq/s3JnhIscyYjGtOQJ3
yGs0B9jxkU0XBlz/8ATz
=DVLI
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
