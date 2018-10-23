Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4704690wrt;
        Tue, 23 Oct 2018 08:50:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60Gt4Mhjv3QHOONLsIEKFc3EUsU05f77lnJ6PbYE0rGRrkSj+GqlixBSYxO1lw2sq0X8LkW
X-Received: by 2002:ac8:794a:: with SMTP id r10-v6mr49773923qtt.386.1540309807979;
        Tue, 23 Oct 2018 08:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540309807; cv=none;
        d=google.com; s=arc-20160816;
        b=B176Jy8paguxZw61P+RisJzJXCJ8H+gtBc9MemJdu0BVmFvHSZNZUGyNDE1uS/ZEn0
         Te7GDpn0tBaAYzTrwh+8MB/I320e9ZqF6zdOWv5Ol9CrwQTiimAFFu+1UHS9fTrzZFbP
         C9vPodxuaTeOYKFj5ZvdMLpAUo5qQn4rbm7XxzsJLz6L0XjZItSCgkJNio5MALTVP4eI
         a1D/GiUhJCO+9iGyayexNrZdP3P14XlS5DCys6ci2jBro/Zi/WGtAqgccMdMEV6as2tl
         h9QmMehLec1m/CyJ1OTpNMOTtehD5/BySQldxUPascOpSO4jQGe+Q+Lbc+pMKou6WDt5
         Md3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=GIJI40Hq6Xbfs3C51WrSqgKPZjqtXHXS8Prqtzbj2xw=;
        b=r68pW6bkSCipMBddX8bX2oibX2Z1QOvNY9H7gmO7ZzCbVkrJoWOfdMg1sPKrJDoWBb
         3jDYr61n+np2AhKX9X/v5XYFwIECf6euT63ObaxT5QzPg5a5Ud33jxH4K2i1WRHXs1QP
         ILIgcXYurwq/Gv3Hb8LAOuVQpB+cFmreA+7UzXpE9DaPOohh7foNNsm/qMuW12pdrwdM
         uah1woULweP9XItFtxm1o7kcfL4tvSqvMVhFUGYDobhi8pPQlT41qnNin0UFB6iH+3xz
         80lKINFB4PCyFFTNPrU/W+WqEfM4HTKNpEnoorcGLSLY2lqj7ri6d+DVywYACPmTdWde
         Togg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b="F/n40Yhk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l15-v6si1392395qkj.184.2018.10.23.08.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Oct 2018 08:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b="F/n40Yhk";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEywZ-0005NN-Bb
	for alex.bennee@linaro.org; Tue, 23 Oct 2018 11:50:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEyhh-0006fy-NS
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:34:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gEybQ-0006eo-Cn
	for qemu-arm@nongnu.org; Tue, 23 Oct 2018 11:28:17 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50455)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gEybP-0006c5-2Y; Tue, 23 Oct 2018 11:28:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 42fcj65NjTz9sLt; Wed, 24 Oct 2018 02:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1540308490;
	bh=4a9TwVqDAaYOZKtkt6k5IUDW9Y/QEeQxeZ3C8NDpE0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/n40Yhk+TcqPn5y40QBmi+c1P2eNCgCEULs9UeYZvWO6YyFhIr9YygE3FVlTH+Bl
	rXcIR6K4oUdJOab0lWjL6HAozJlCMK7RczHEKsGXNmE0W+yHIklWB0X2eIUjrYu/Ji
	t1zv/WpwWPJjpZxyLZnkjIjnefZAQ+94wpACorXQ=
Date: Tue, 23 Oct 2018 16:07:30 +0100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181023150730.GC12127@umbus.hotspot.internet-for-guests.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<20181018200422.4358-5-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline
In-Reply-To: <20181018200422.4358-5-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PULL 04/45] numa: Fix QMP command set-numa-node
 error handling
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TferMHG4UHp0


--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2018 at 05:03:41PM -0300, Eduardo Habkost wrote:
> From: Markus Armbruster <armbru@redhat.com>
>=20
> Calling error_report() in a function that takes an Error ** argument
> is suspicious.  parse_numa_node() does that, and then exit()s.  It
> also passes &error_fatal to machine_set_cpu_numa_node().  Both wrong.
> Attempting to configure numa when the machine doesn't support it kills
> the VM:
>=20
>     $ qemu-system-x86_64 -nodefaults -S -display none -M none -preconfig =
-qmp stdio
>     {"QMP": {"version": {"qemu": {"micro": 50, "minor": 0, "major": 3}, "=
package": "v3.0.0-837-gc5e4e49258"}, "capabilities": []}}
>     {"execute": "qmp_capabilities"}
>     {"return": {}}
>     {"execute": "set-numa-node", "arguments": {"type": "node"}}
>     NUMA is not supported by this machine-type
>     $ echo $?
>     1
>=20
> Messed up when commit 64c2a8f6d3f and 7c88e65d9e9 (v2.10.0) added
> incorrect error handling right next to correct examples.  Latent bug
> until commit f3be67812c2 (v3.0.0) made it accessible via QMP.  Fairly
> harmless in practice, because it's limited to RUN_STATE_PRECONFIG.
> The fix is obvious: replace error_report(); exit() by error_setg();
> return.
>=20
> This affects parse_numa_node()'s other caller
> numa_complete_configuration(): since it ignores errors, the "NUMA is
> not supported by this machine-type" is now ignored, too.  But that
> error is as unexpected there as any other.  Change it to abort on
> error instead.
>=20
> Fixes: f3be67812c226162f86ce92634bd913714445420
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20181008173125.19678-15-armbru@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  numa.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/numa.c b/numa.c
> index 81542d4ebb..1d7c49ad43 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -60,6 +60,7 @@ NodeInfo numa_info[MAX_NODES];
>  static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>                              Error **errp)
>  {
> +    Error *err =3D NULL;
>      uint16_t nodenr;
>      uint16List *cpus =3D NULL;
>      MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> @@ -82,8 +83,8 @@ static void parse_numa_node(MachineState *ms, NumaNodeO=
ptions *node,
>      }
> =20
>      if (!mc->cpu_index_to_instance_props || !mc->get_default_cpu_node_id=
) {
> -        error_report("NUMA is not supported by this machine-type");
> -        exit(1);
> +        error_setg(errp, "NUMA is not supported by this machine-type");
> +        return;
>      }
>      for (cpus =3D node->cpus; cpus; cpus =3D cpus->next) {
>          CpuInstanceProperties props;
> @@ -97,7 +98,11 @@ static void parse_numa_node(MachineState *ms, NumaNode=
Options *node,
>          props =3D mc->cpu_index_to_instance_props(ms, cpus->value);
>          props.node_id =3D nodenr;
>          props.has_node_id =3D true;
> -        machine_set_cpu_numa_node(ms, &props, &error_fatal);
> +        machine_set_cpu_numa_node(ms, &props, &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>      }
> =20
>      if (node->has_mem && node->has_memdev) {
> @@ -367,7 +372,7 @@ void numa_complete_configuration(MachineState *ms)
>      if (ms->ram_slots > 0 && nb_numa_nodes =3D=3D 0 &&
>          mc->auto_enable_numa_with_memhp) {
>              NumaNodeOptions node =3D { };
> -            parse_numa_node(ms, &node, NULL);
> +            parse_numa_node(ms, &node, &error_abort);
>      }
> =20
>      assert(max_numa_nodeid <=3D MAX_NODES);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ABTtc+pdwF7KHXCz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlvPOTEACgkQbDjKyiDZ
s5Kkfg/1F7EiKb6PzQLitWENFPMhvZYtuMoM8Qzjjm/c7n/Gyq9u3u46R46966sz
WBpeS2iZUEHV9omRjt+lvvLSkfLXakVHg0FJUNEahJfkI7FfTtNKMcOYOwIdMBod
8rce7miZBDkMbiLpG2/1WSb94vdAgV4JDvp5362AIdDyALJoe7LgIIruYKIdiUgw
36llXm4ttdJcUAcAAU4H81Q6jGYWvE/YsU3fFWjfQn0mcBt7R0oWEFR1rrD8LnMa
IN+TG62MZA+ENbYtbiLIQAMZP+TsMHbufLKeipHAm3P0yi9SXUQYIIfbg8ckXfn9
4p3xR1QQbUUonczrGvU00Zu+V9Ywv/xEYmHtKRYEKRxed90dF7uz8fjP6vG1Hgzz
NEyEMsa2qMwcXH8yT887pxl7Negb2TszYpSRCD0iqzkpLe4ceVT1eDEMeXkWqJec
WJETZjY/O+GiqCS3OQ/C69XJPsVY3PIqr9ypgBccatMj781RT1UZXZWWz78ikQCh
ww4rPpDL/iVujaRUnKAHXsh5zXrq9WkI39GXUw/pAxXgEJOw13+1eztgyJGB6FR8
M1hQR7K/+DrLueTh/k+j6ug1BDHuO7DI5i7SxhcJu1Hsi9y1iMIaPQ1/C+FhdAjz
G079KAhmc3NuQ4g7TeefI5NiJch9pZEiDK6ga3UvDH4sJ8xwaw==
=mhXp
-----END PGP SIGNATURE-----

--ABTtc+pdwF7KHXCz--
