Received: by 10.25.15.230 with SMTP id 99csp1538038lfp;
        Tue, 28 Mar 2017 02:59:20 -0700 (PDT)
X-Received: by 10.237.34.59 with SMTP id n56mr25593485qtc.231.1490695160690;
        Tue, 28 Mar 2017 02:59:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t188si3023226qkh.308.2017.03.28.02.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Mar 2017 02:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1csnuK-0000Xu-3B
	for alex.bennee@linaro.org; Tue, 28 Mar 2017 05:59:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1csnu9-0000QM-7c
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 05:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1csnu6-000827-52
	for qemu-arm@nongnu.org; Tue, 28 Mar 2017 05:59:09 -0400
Received: from ozlabs.org ([103.22.144.67]:36935)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1csnu5-00080D-9t; Tue, 28 Mar 2017 05:59:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3vsmZC3lPRz9s7b; Tue, 28 Mar 2017 20:58:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1490695139;
	bh=rPABezG/iX86gUjVMJmuGY+LtYs3QxKwgMFQwQuVv+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRoLU1JJfdA9QrPf15dRjAaP1VM1WaBs6qDnrqLxx4bwQSRfJFpM8OB48HruyCb7j
	74KHn4ruBiX/FZNrUsTH1Dmr3JT+0LMHBhATkunpmhxABd+fiwV4k3y+dlSZyGTXnJ
	kj8DsEF88QTbp3prPsbvSZjGCgYcYUQqZkyD/WS0=
Date: Tue, 28 Mar 2017 16:16:02 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170328051602.GK21068@umbus.fritz.box>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-23-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ee6FjwWxuMujAVRe"
Content-Disposition: inline
In-Reply-To: <1490189568-167621-23-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH for-2.10 22/23] numa: add '-numa cpu,
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
X-TUID: s2PUwXLfv+nv


--ee6FjwWxuMujAVRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2017 at 02:32:47PM +0100, Igor Mammedov wrote:
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

What's the rationale for adding a new CLI, rather than adding node-id
properties to the appropriate objects with -device, -global or -set as
appropriate?

> ---
>  numa.c           | 13 +++++++++++++
>  qapi-schema.json |  7 +++++--
>  qemu-options.hx  | 23 ++++++++++++++++++++++-
>  3 files changed, 40 insertions(+), 3 deletions(-)
>=20
> diff --git a/numa.c b/numa.c
> index 088fae3..588586b 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -246,6 +246,19 @@ static int parse_numa(void *opaque, QemuOpts *opts, =
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
> +        machine_set_cpu_numa_node(ms, &object->u.cpu, &err);
> +        break;
>      default:
>          abort();
>      }
> diff --git a/qapi-schema.json b/qapi-schema.json
> index a6b5955..a9a1d5e 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -5673,10 +5673,12 @@
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
> @@ -5689,7 +5691,8 @@
>    'base': { 'type': 'NumaOptionsType' },
>    'discriminator': 'type',
>    'data': {
> -    'node': 'NumaNodeOptions' }}
> +    'node': 'NumaNodeOptions',
> +    'cpu': 'CpuInstanceProperties' }}
> =20
>  ##
>  # @NumaNodeOptions:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 99af8ed..2185c34 100644
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
> +@samp{cpu} option is new alternative to @samp{cpus} option
> +uses @samp{socket-id|core-id|thread-id} properties to assign
> +CPU objects to a @var{node} using topology layout properties of CPU.
> +Set of properties is machine specific, and depends on used machine
> +type/@samp{smp} options. It could be queried with @samp{hotpluggable-cpu=
s}
> +monitor command.
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

--ee6FjwWxuMujAVRe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJY2fGRAAoJEGw4ysog2bOSkw0P/Ak+fhVdaQyiqZouRuNwf5sF
nLkWmCmQ1nu6slOGNW6n5/60QpV2HVfWBh+S1o5vK4FKukqwzTTP6YRnbgSODt0r
oHTpZ25rnZSzdgXIX79YdMoQxSUII4q4Cw6m1XI55CFa9Op0fSgVdKH6lEzXQTPC
oCcNyDCl4lxKuN2Kfsj0Vb9kiCwzmRMB4rrxFUp7nQiXZFEHWQZyVAxZBQAEz7wh
jtBOOZidwK+D4f7Oy5aiWIX5wtSYRQBsvLzXar6qHTYzKdehFAExELuL++6YYaKu
txaaVQVD+AsulWCgO1DmDY4Skpri/MrJSRkndthiG/9Pzh8UQdoxzhruqzC0zh7l
mW1dmAzbWo21jm4kBAELhJGLOeLSYoK/REmDWKDoY/i9mrX+Fe9L+txPRzeLr08n
KHZHzIUE5Xk1KpSGkeO+sWerLPQtcoQvV7PJ9/Wt7sw0BnFoZIQkEVLaryxMopoB
sSPVpWVhO+RB5ohvPK3pdcf/J1mz6bUFDrc4EmXZhuG/cXPNR4FX78Qt2OnspZGf
oIH/T7wITsZl7q0wU1+zxaddZgEDA45mAOB5bidk+UbZoACKcIAW6LYunP2VJC4B
vwbdscJkpI1keajlGWXAmkhWLRevSMhcf6uLW1EIZ5Q08oQ6FP5XVlo5Uord4AFO
GiUNT1IyqnIZUqmbvOiN
=xhuc
-----END PGP SIGNATURE-----

--ee6FjwWxuMujAVRe--
