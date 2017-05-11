Received: by 10.25.0.6 with SMTP id 6csp608661lfa;
        Wed, 10 May 2017 21:54:35 -0700 (PDT)
X-Received: by 10.200.47.46 with SMTP id j43mr2113662qta.255.1494478475570;
        Wed, 10 May 2017 21:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494478475; cv=none;
        d=google.com; s=arc-20160816;
        b=roLOUuZUvwO9hAfLtjb1LwiiP90HbxKS1skAfz1lT0ratawZ95UW+EILe0aidugzh2
         oHcUeFoXxEYYL3dz3UwXBnnt83tjwvNeV60FHzPUecNqy4S1ff6BEsaQ/Whm6QNtfMev
         CW4s7FZR4NV1veTe59+U5FN1KUsBp5XbfkNotJQ0xDPD7iPhOqjB0rbBS6M7LHHedtf6
         +avJx3PCigLN3kXkXfRpcBl0SByF3tCtzlOBdRhyzxJOqzkfMPHuTn55+BkKzHTWGfHC
         ryFO0D3F+S6wTIYXm/0TgEgs9wIEYBlnHHiHIu4haXpVSgLdYLF6QEXEHjVCYheXwfUT
         EXqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=/Vt8cx9dYF/kTuZGUQF3lihiH84C2sB+qG0+kVjuDBs=;
        b=DUnzXvmym4gnkQjrQ/Yn8T62fTPjFKjVhCMOYDQNHClEHZx7F5iIF9dQCcunKK3MGp
         EqCdtalSm9ywaPGLhNYGzG9N3JaOci8lxA4a8wZqCep9Ry+OdAMCuqzUf4ZJIJulHF3J
         sGG1EdaT+vbor93W48S3sB8bxa/1n3KRxTpEPeZev67jeXlFW0RJbFn6xgAn6iZ2Os7u
         3NWTX3C8Axos/6tcPd6V7xOaZTZXyWX3P0Sw9fQvzdobXJPUj79IWkA55EItjCfP1FLq
         Nr7CN+khkPNxVrZ7zR/6ogj3qfGuqifoe9ZWoaoiCNGdeItnzgdFasszKNDDqP9CZcp6
         aS7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r76si784596qkl.163.2017.05.10.21.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 21:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8g7W-0006zN-Tw
	for alex.bennee@linaro.org; Thu, 11 May 2017 00:54:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d8g7N-0006zB-BL
	for qemu-arm@nongnu.org; Thu, 11 May 2017 00:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d8g7K-0006lp-9l
	for qemu-arm@nongnu.org; Thu, 11 May 2017 00:54:25 -0400
Received: from ozlabs.org ([103.22.144.67]:52051)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d8g7J-0006i1-FZ; Thu, 11 May 2017 00:54:22 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wNgkK4GtCz9sCZ; Thu, 11 May 2017 14:54:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1494478457;
	bh=GJlYhM/9xZ452Guek/QaWFivWE0YdK84Ds0dpVvhygY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q215WL03vhs7zQCbWx7acSOhGHVGnyQh5V1RJjUSV+AENfDJF2TSGtH2rPRhnFiDw
	/jBi9dlonrjAvLlH6QL8DVdOB8Fwdv4s7sdZKfVXNfhazNiKUcKR9i4wA7CQPUc7mk
	VoJZvJUaNGPho06wvC1EquDmhHvob9EFiyX195tg=
Date: Thu, 11 May 2017 14:39:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170511043930.GH14408@umbus.fritz.box>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
	<1494415802-227633-12-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vtJ+CqYNzKB4ukR4"
Content-Disposition: inline
In-Reply-To: <1494415802-227633-12-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v3 11/18] QMP: include CpuInstanceProperties
 into query_cpus output output
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
X-TUID: Lj1YOAjCUtlU


--vtJ+CqYNzKB4ukR4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2017 at 01:29:55PM +0200, Igor Mammedov wrote:
> if board supports CpuInstanceProperties, report them for
> each CPU thread listed. Main motivation for this is to
> provide these properties introspection via QMP interface
> for using in test cases to verify numa node to cpu mapping,
> which includes not only boards that support cpu hotplug
> and have this info in query-hotpluggable-cpus (pc/spapr)
> but also for boards that don't not support hotpluggable-cpus
> but support numa mapping (virt-arm).
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> v2:
>   * fix checkpatch error and remove extra space after =3D (Eric)
> ---
>  cpus.c           | 10 ++++++++++
>  qapi-schema.json |  6 +++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>=20
> diff --git a/cpus.c b/cpus.c
> index 740b8dc..4f91d25 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -50,6 +50,7 @@
>  #include "qapi-event.h"
>  #include "hw/nmi.h"
>  #include "sysemu/replay.h"
> +#include "hw/boards.h"
> =20
>  #ifdef CONFIG_LINUX
> =20
> @@ -1859,6 +1860,8 @@ void list_cpus(FILE *f, fprintf_function cpu_fprint=
f, const char *optarg)
> =20
>  CpuInfoList *qmp_query_cpus(Error **errp)
>  {
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
> +    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
>      CpuInfoList *head =3D NULL, *cur_item =3D NULL;
>      CPUState *cpu;
> =20
> @@ -1909,6 +1912,13 @@ CpuInfoList *qmp_query_cpus(Error **errp)
>  #else
>          info->value->arch =3D CPU_INFO_ARCH_OTHER;
>  #endif
> +        info->value->has_props =3D !!mc->cpu_index_to_instance_props;
> +        if (info->value->has_props) {
> +            CpuInstanceProperties *props;
> +            props =3D g_malloc0(sizeof(*props));
> +            *props =3D mc->cpu_index_to_instance_props(ms, cpu->cpu_inde=
x);
> +            info->value->props =3D props;
> +        }
> =20
>          /* XXX: waiting for the qapi to support GSList */
>          if (!cur_item) {
> diff --git a/qapi-schema.json b/qapi-schema.json
> index bf48873..f1bcebe 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -1325,6 +1325,9 @@
>  #
>  # @thread_id: ID of the underlying host thread
>  #
> +# @props: properties describing to which node/socket/core/thread
> +#         virtual CPU belongs to, provided if supported by board (since =
2.10)
> +#
>  # @arch: architecture of the cpu, which determines which additional fiel=
ds
>  #        will be listed (since 2.6)
>  #
> @@ -1335,7 +1338,8 @@
>  ##
>  { 'union': 'CpuInfo',
>    'base': {'CPU': 'int', 'current': 'bool', 'halted': 'bool',
> -           'qom_path': 'str', 'thread_id': 'int', 'arch': 'CpuInfoArch' =
},
> +           'qom_path': 'str', 'thread_id': 'int',
> +           '*props': 'CpuInstanceProperties', 'arch': 'CpuInfoArch' },
>    'discriminator': 'arch',
>    'data': { 'x86': 'CpuInfoX86',
>              'sparc': 'CpuInfoSPARC',

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vtJ+CqYNzKB4ukR4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZE+sCAAoJEGw4ysog2bOSp60QAJ9NhVZZcYbkgm2HOu0LyXyl
995TwhAkv6VRO5b2sfqi5MxUhWGNh0fi6yYoD0bF1cREwc9uJ8aTGMLuil+pIFQy
YX3JkS9y1wXtB4vhB577VH9iPJcmsANlLBPW24g6VUWmmg5Soc9Gsqo7ECRDtt3V
P4Mn4ntyDctaljsrhjiiowZHJUlHb0qE5m3gASZaCAknt5qcMF2AWm/yZTc7CYDU
FTznJkIZju22J3ED6klUWbvyoVoBQZgYegKCDGBw0qH0nj9jkknE8VrV5zZ4yxaQ
VxOVKriIYccByrlIOGvFZsBUxBXFwEchysBOeBPn3kpKXcV1pFYJ6up4Mv3ssSc3
TgaMp6HFT+q9zYuF4IB/YTCc4yo3DO1id20LEeHSehrFbgzfDQ7J7zN6td+AwJmp
e/rBT+CqhYiFDd0oi8n7AVOulrVjOQuar3v4oE6LES99xRBQ4v4n0XCqDPtU9nGz
p0rnLDLPd5R3L91rinXPFECeq1+44e3BSXQuX6SbRqw61M7BuW2CgLZw0PcROfWv
pJVvgQbOBDpRJahbS8hjCxx9gWi7G9C7TPBtrorkZv9vOJmhClS13GjMZpCIUeaz
/3Y6Y+mzT5R5/0DajhHw+o5A239s0KIPn2OElY8oeU0a6XGobDKbqaLoDPIVq2jP
2svn3w80KozS9ewQA/PP
=dQP1
-----END PGP SIGNATURE-----

--vtJ+CqYNzKB4ukR4--
