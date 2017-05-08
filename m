Received: by 10.25.0.198 with SMTP id 189csp1201757lfa;
        Sun, 7 May 2017 22:40:36 -0700 (PDT)
X-Received: by 10.55.60.67 with SMTP id j64mr24532094qka.316.1494222036791;
        Sun, 07 May 2017 22:40:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2si11173630qkd.263.2017.05.07.22.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 May 2017 22:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d7bPQ-0000K5-89
	for alex.bennee@linaro.org; Mon, 08 May 2017 01:40:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d7bPB-0000Ef-PR
	for qemu-arm@nongnu.org; Mon, 08 May 2017 01:40:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d7bP7-00015q-JZ
	for qemu-arm@nongnu.org; Mon, 08 May 2017 01:40:21 -0400
Received: from ozlabs.org ([103.22.144.67]:58659)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d7bP6-000157-LY; Mon, 08 May 2017 01:40:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wLrtf4xbCz9s8P; Mon,  8 May 2017 15:40:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1494222010;
	bh=w2J+55fcpEmeiAl05eCz8jXHAlzHnfvxJiCopx33KbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D1jwl9y3bSUUzZDTBClkgqfGa14jmKhAxEiax6yIbWCT8wuMLQiCZMLzWhtlsvj4m
	nH3qGK2xJ+F/4CanOG8t/P3eqxVqoup/qQIzvm+9GEwrrrmbEY21FlqP1JcmSLDhvp
	Ot1A6WwYEqv251q9uHcjjBfx10A2I7nlhmEkpysM=
Date: Mon, 8 May 2017 15:40:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170508054004.GE25748@umbus.fritz.box>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-24-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Content-Disposition: inline
In-Reply-To: <1493816238-33120-24-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v2 23/24] numa: add '-numa cpu,
 ...' option for property based node mapping
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
X-TUID: OIEb9AJ7fmg/


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2017 at 02:57:17PM +0200, Igor Mammedov wrote:
> legacy cpu to node mapping is using cpu index values to map
> VCPU to node with help of '-numa node,nodeid=3Dnode,cpus=3Dx[-y]'
> option. However cpu index is internal concept and QEMU users
> have to guess /reimplement qemu's logic/ to map it to
> a concrete cpu socket/core/thread to make sane CPUs
> placement across numa nodes.
>=20
> This patch allows to map cpu objects to numa nodes using
> the same properties as used for cpus with -device/device_add
> (socket-id/core-id/thread-id/node-id).
>=20
> At present valid properties/values to address CPUs could be
> fetched using hotpluggable-cpus monitor/qmp command, it will
> require user to start qemu twice when creating domain to fetch
> possible CPUs for a machine type/-smp layout first and
> then the second time with numa explicit mapping for actual
> usage. The first step results could be saved and reused to
> set/change mapping later as far as machine type/-smp stays
> the same.
>=20
> Proposed impl. supports exact and wildcard matching to
> simplify CLI and allow to set mapping for a specific cpu
> or group of cpu objects specified by matched properties.
>=20
> For example:
>=20
>    # exact mapping x86
>    -numa cpu,node-id=3Dx,socket-id=3Dy,core-id=3Dz,thread-id=3Dn
>=20
>    # exact mapping SPAPR
>    -numa cpu,node-id=3Dx,core-id=3Dy
>=20
>    # wildcard mapping, all cpu objects that match socket-id=3Dy
>    # are mapped to node-id=3Dx
>    -numa cpu,node-id=3Dx,socket-id=3Dy
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   - use new NumaCpuOptions instead of CpuInstanceProperties in
>     NumaOptions, so that in future we could decouple both
>     if needed. (Eduardo Habkost <ehabkost@redhat.com>)
>   - clarify effect of NumaCpuOptions.node-id in qapi-schema.json
> ---
>  numa.c           | 25 +++++++++++++++++++++++++
>  qapi-schema.json | 21 +++++++++++++++++++--
>  qemu-options.hx  | 23 ++++++++++++++++++++++-
>  3 files changed, 66 insertions(+), 3 deletions(-)
>=20
> diff --git a/numa.c b/numa.c
> index 40e9f44..61521f5 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -227,6 +227,7 @@ static int parse_numa(void *opaque, QemuOpts *opts, E=
rror **errp)
>      NumaOptions *object =3D NULL;
>      MachineState *ms =3D opaque;
>      Error *err =3D NULL;
> +    CpuInstanceProperties cpu;
> =20
>      {
>          Visitor *v =3D opts_visitor_new(opts);
> @@ -246,6 +247,30 @@ static int parse_numa(void *opaque, QemuOpts *opts, =
Error **errp)
>          }
>          nb_numa_nodes++;
>          break;
> +    case NUMA_OPTIONS_TYPE_CPU:
> +        if (!object->u.cpu.has_node_id) {
> +            error_setg(&err, "Missing mandatory node-id property");
> +            goto end;
> +        }
> +        if (!numa_info[object->u.cpu.node_id].present) {
> +            error_setg(&err, "Invalid node-id=3D%" PRId64 ", NUMA node m=
ust be "
> +                "defined with -numa node,nodeid=3DID before it's used wi=
th "
> +                "-numa cpu,node-id=3DID", object->u.cpu.node_id);
> +            goto end;
> +        }
> +
> +        memset(&cpu, 0, sizeof(cpu));
> +        cpu.has_node_id =3D object->u.cpu.has_node_id;
> +        cpu.node_id =3D object->u.cpu.node_id;
> +        cpu.has_socket_id =3D object->u.cpu.has_socket_id;
> +        cpu.socket_id =3D object->u.cpu.socket_id;
> +        cpu.has_core_id =3D object->u.cpu.has_core_id;
> +        cpu.core_id =3D object->u.cpu.core_id;
> +        cpu.has_thread_id =3D object->u.cpu.has_thread_id;
> +        cpu.thread_id =3D object->u.cpu.thread_id;
> +
> +        machine_set_cpu_numa_node(ms, &cpu, &err);

It's possible I've confused myself by not looking at this whole series
at once.

But, would it be possible to make a single machine hook which maps a
constructed cpu property set to a "canonical" cpu property set from
the table of CPU slots (or errors, of course).  That would let you do
what you need here, and I suspect in other places, without multiple
hooks.

> +        break;
>      default:
>          abort();
>      }
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 76d137d..5baf3a4 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -5680,10 +5680,12 @@
>  ##
>  # @NumaOptionsType:
>  #
> +# @cpu: property based CPU(s) to node mapping (Since: 2.10)
> +#
>  # Since: 2.1
>  ##
>  { 'enum': 'NumaOptionsType',
> -  'data': [ 'node' ] }
> +  'data': [ 'node', 'cpu' ] }
> =20
>  ##
>  # @NumaOptions:
> @@ -5696,7 +5698,8 @@
>    'base': { 'type': 'NumaOptionsType' },
>    'discriminator': 'type',
>    'data': {
> -    'node': 'NumaNodeOptions' }}
> +    'node': 'NumaNodeOptions',
> +    'cpu': 'NumaCpuOptions' }}
> =20
>  ##
>  # @NumaNodeOptions:
> @@ -5725,6 +5728,20 @@
>     '*memdev': 'str' }}
> =20
>  ##
> +# @NumaCpuOptions:
> +#
> +# Option "-numa cpu" overrides default cpu to node mapping.
> +# It accepts the same set of cpu properties as returned by
> +# query-hotpluggable-cpus[].props, where node-id could be used to
> +# override default node mapping.
> +#
> +# Since: 2.10
> +##
> +{ 'struct': 'NumaCpuOptions',
> +   'base': 'CpuInstanceProperties',
> +   'data' : {} }
> +
> +##
>  # @HostMemPolicy:
>  #
>  # Host memory policy types
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 787b9c3..e88f534 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -139,13 +139,16 @@ ETEXI
> =20
>  DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>      "-numa node[,mem=3Dsize][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode]=
\n"
> -    "-numa node[,memdev=3Did][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode=
]\n", QEMU_ARCH_ALL)
> +    "-numa node[,memdev=3Did][,cpus=3Dfirstcpu[-lastcpu]][,nodeid=3Dnode=
]\n"
> +    "-numa cpu,node-id=3Dnode[,socket-id=3Dx][,core-id=3Dy][,thread-id=
=3Dz]\n", QEMU_ARCH_ALL)
>  STEXI
>  @item -numa node[,mem=3D@var{size}][,cpus=3D@var{firstcpu}[-@var{lastcpu=
}]][,nodeid=3D@var{node}]
>  @itemx -numa node[,memdev=3D@var{id}][,cpus=3D@var{firstcpu}[-@var{lastc=
pu}]][,nodeid=3D@var{node}]
> +@itemx -numa cpu,node-id=3D@var{node}[,socket-id=3D@var{x}][,core-id=3D@=
var{y}][,thread-id=3D@var{z}]
>  @findex -numa
>  Define a NUMA node and assign RAM and VCPUs to it.
> =20
> +Legacy VCPU assignment uses @samp{cpus} option where
>  @var{firstcpu} and @var{lastcpu} are CPU indexes. Each
>  @samp{cpus} option represent a contiguous range of CPU indexes
>  (or a single VCPU if @var{lastcpu} is omitted). A non-contiguous
> @@ -159,6 +162,24 @@ a NUMA node:
>  -numa node,cpus=3D0-2,cpus=3D5
>  @end example
> =20
> +@samp{cpu} option is a new alternative to @samp{cpus} option
> +which uses @samp{socket-id|core-id|thread-id} properties to assign
> +CPU objects to a @var{node} using topology layout properties of CPU.
> +The set of properties is machine specific, and depends on used
> +machine type/@samp{smp} options. It could be queried with
> +@samp{hotpluggable-cpus} monitor command.
> +@samp{node-id} property specifies @var{node} to which CPU object
> +will be assigned, it's required for @var{node} to be declared
> +with @samp{node} option before it's used with @samp{cpu} option.
> +
> +For example:
> +@example
> +-M pc \
> +-smp 1,sockets=3D2,maxcpus=3D2 \
> +-numa node,nodeid=3D0 -numa node,nodeid=3D1 \
> +-numa cpu,node-id=3D0,socket-id=3D0 -numa cpu,node-id=3D1,socket-id=3D1
> +@end example
> +
>  @samp{mem} assigns a given RAM amount to a node. @samp{memdev}
>  assigns RAM from a given memory backend device to a node. If
>  @samp{mem} and @samp{memdev} are omitted in all nodes, RAM is

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZEAS0AAoJEGw4ysog2bOSiRoP/29YTjdHhEJgDO0/3T9GdKr/
sjVNBR49DGq4FcN+dMhDFqN6VAuTzZkC2Blxjxjad4Sf0E+prwb4em9o338ClzTq
DXcjflUjXncCtWdsoD5C6LvYDLEXjg7mutYEqZHrkNp/ZX2UbUUFEsovH8IaQuLJ
9jd6rjwzQxOcf9eTut2srgtY6e2M7oKFcXbSvJGoRhpLU2ouKZ3S+FO06/SU4qqX
mMcWUJs9xfiuPm1g00t0Tm80Z+qmeopykGxADW0B+cMC+n/TCMaHB7RsYhRR984R
IzXn1Kw9Q8hPhiCg0CA90XArOtKNJ2NHK7l/sJL4nIej42gFAHDY0umKWwivJI7Q
1tJo62v7V/uk45lJhU4y4FPH7OjahFsHXFRPunw986hVTkHvX4AfmT+nx/6bj8/h
bfh7gvYsPwkwOoEb037CKxpM85oK6/bTWMWiBMMlozS44Fx1xzN/Stcba0zRvkLa
fAqP0MJ1ZwRNHJC2PxHlEuP9u0OXSOPMOKmMlS9eZRFc5Ue8jYC92XX7ZaXRnwFE
zGonajhGy4XUglEbXMpEt5BmcrSvemp+7KBTFYG2q1GoHlfBL4nPz/ENU8Cjri4S
G5BsoyGVQzzL/nQpAStLrC9DMLAKJ1Zy/TCtuWoQfBtIYfCDyuFfzvQn53mMa8qZ
Y5JrjSmTkgrQNptNKb+b
=dOtd
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
