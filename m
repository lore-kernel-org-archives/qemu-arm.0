Received: by 10.25.141.12 with SMTP id p12csp3157lfd;
        Mon, 13 Jun 2016 20:02:47 -0700 (PDT)
X-Received: by 10.200.52.157 with SMTP id w29mr11996759qtb.99.1465873367649;
        Mon, 13 Jun 2016 20:02:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s20si17052600qks.271.2016.06.13.20.02.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 20:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCecp-0008Uu-3M
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 23:02:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCecg-0008RO-Ds
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 23:02:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bCece-0006z9-0I
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 23:02:37 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:43585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bCecc-0006y9-S1; Mon, 13 Jun 2016 23:02:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rTDw41sXHz9t0t; Tue, 14 Jun 2016 13:02:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1465873348;
	bh=AFYjgdmUluJAQqChfQjioradsY01lWubVppSKiHVAFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlhEiGBU5//egDZTGW6q+AHv2Wu44ituq6XPHWsgbA9mJHpUvc/juhajVh2JAYd7e
	Zrf08QtWzlPdxFo02bgg08vLLiwBfpjPb+MhLYMahS+gNTKkYW4aYNQC3t7GduQH3G
	Ypg7KjSqRKlP+MWmd7D7mSXubkuG1p5LSk2MG0zY=
Date: Tue, 14 Jun 2016 12:00:26 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160614020026.GH4882@voom.fritz.box>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-6-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tcC6YSqBgqqkz7Sb"
Content-Disposition: inline
In-Reply-To: <1465580427-13596-6-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH RFC 05/16] hw/core/machine: add smp properites
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
X-TUID: 6jx+AAtweiZq


--tcC6YSqBgqqkz7Sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 07:40:16PM +0200, Andrew Jones wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c   | 81 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/boards.h |  6 ++++
>  2 files changed, 87 insertions(+)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 3dce9020e510a..2625044002e57 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -172,6 +172,53 @@ static void machine_set_dumpdtb(Object *obj, const c=
har *value, Error **errp)
>      ms->dumpdtb =3D g_strdup(value);
>  }
> =20
> +static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    MachineState *ms =3D MACHINE(obj);
> +    int64_t value;
> +
> +    if (strncmp(name, "sockets", 7) =3D=3D 0) {
> +        value =3D ms->sockets;
> +    } else if (strncmp(name, "cores", 5) =3D=3D 0) {
> +        value =3D ms->cores;
> +    } else if (strncmp(name, "threads", 7) =3D=3D 0) {
> +        value =3D ms->threads;
> +    } else if (strncmp(name, "maxcpus", 7) =3D=3D 0) {
> +        value =3D ms->maxcpus;
> +    } else if (strncmp(name, "cpus", 4) =3D=3D 0) {
> +        value =3D ms->cpus;
> +    }
> +
> +    visit_type_int(v, name, &value, errp);
> +}

Any particular for multiplexing all the set / get, rather than having
separate callbacks for each property?

> +
> +static void machine_set_smp(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    MachineState *ms =3D MACHINE(obj);
> +    Error *error =3D NULL;
> +    int64_t value;
> +
> +    visit_type_int(v, name, &value, &error);
> +    if (error) {
> +        error_propagate(errp, error);
> +        return;
> +    }
> +
> +    if (strncmp(name, "sockets", 7) =3D=3D 0) {
> +        ms->sockets =3D value;
> +    } else if (strncmp(name, "cores", 5) =3D=3D 0) {
> +        ms->cores =3D value;;
> +    } else if (strncmp(name, "threads", 7) =3D=3D 0) {
> +        ms->threads =3D value;
> +    } else if (strncmp(name, "maxcpus", 7) =3D=3D 0) {
> +        ms->maxcpus =3D value;
> +    } else if (strncmp(name, "cpus", 4) =3D=3D 0) {
> +        ms->cpus =3D value;
> +    }
> +}
> +
>  static void machine_get_phandle_start(Object *obj, Visitor *v,
>                                        const char *name, void *opaque,
>                                        Error **errp)
> @@ -368,8 +415,18 @@ static void machine_init_notify(Notifier *notifier, =
void *data)
>      foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
>  }
> =20
> +static void machine_set_smp_parameters(MachineState *ms)
> +{
> +    if (ms->sockets !=3D -1 || ms->cores !=3D -1 || ms->threads !=3D -1 =
||
> +        ms->maxcpus !=3D -1 || ms->cpus !=3D -1) {
> +        error_report("warning: cpu topology: "
> +                     "machine properties currently ignored");
> +    }
> +}
> +
>  static void machine_pre_init(MachineState *ms)
>  {
> +    machine_set_smp_parameters(ms);
>  }
> =20
>  static void machine_class_init(ObjectClass *oc, void *data)
> @@ -403,6 +460,11 @@ static void machine_initfn(Object *obj)
>      ms->dump_guest_core =3D true;
>      ms->mem_merge =3D true;
>      ms->enable_graphics =3D true;
> +    ms->sockets =3D -1;
> +    ms->cores =3D -1;
> +    ms->threads =3D -1;
> +    ms->maxcpus =3D -1;
> +    ms->cpus =3D -1;
> =20
>      object_property_add_str(obj, "accel",
>                              machine_get_accel, machine_set_accel, NULL);
> @@ -462,6 +524,25 @@ static void machine_initfn(Object *obj)
>      object_property_set_description(obj, "dt-compatible",
>                                      "Overrides the \"compatible\" proper=
ty of the dt root node",
>                                      NULL);
> +    object_property_add(obj, "sockets", "int", machine_get_smp,
> +                        machine_set_smp, NULL, NULL, NULL);
> +    object_property_set_description(obj, "sockets", "Number of sockets",=
 NULL);
> +    object_property_add(obj, "cores", "int", machine_get_smp,
> +                        machine_set_smp, NULL, NULL, NULL);
> +    object_property_set_description(obj, "cores",
> +                                    "Number of cores per socket", NULL);
> +    object_property_add(obj, "threads", "int", machine_get_smp,
> +                        machine_set_smp, NULL, NULL, NULL);
> +    object_property_set_description(obj, "threads",
> +                                    "Number of threads per core", NULL);
> +    object_property_add(obj, "maxcpus", "int", machine_get_smp,
> +                        machine_set_smp, NULL, NULL, NULL);
> +    object_property_set_description(obj, "maxcpus", "Maximum number of c=
pus",
> +                                    NULL);
> +    object_property_add(obj, "cpus", "int", machine_get_smp,
> +                        machine_set_smp, NULL, NULL, NULL);
> +    object_property_set_description(obj, "cpus", "Number of online cpus",
> +                                    NULL);
>      object_property_add_bool(obj, "dump-guest-core",
>                               machine_get_dump_guest_core,
>                               machine_set_dump_guest_core,
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 4e8dc68b07a24..53adbfe2a3099 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -166,6 +166,12 @@ struct MachineState {
>      char *initrd_filename;
>      const char *cpu_model;
>      AccelState *accelerator;
> +
> +    int sockets;
> +    int cores;
> +    int threads;
> +    int maxcpus;
> +    int cpus;

Hrm.. as the tests added in earlier patches highlight, essentially one
of these properties is redundant.  Is there a reason to include them
all, rather than to pick one to drop?

>  };
> =20
>  #define DEFINE_MACHINE(namestr, machine_initfn) \

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tcC6YSqBgqqkz7Sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX2U6AAoJEGw4ysog2bOSSk0P/jA9zwr7KKoNvj2LNxrKkBGl
kFa0eLw3fQzEmLfhKY4pUyIx29IiUTpePdjkAxcCEHubwxzDVDGL48ZKrmkASwLA
bZCkLVAN9h+J03TWNeqqgbflnvT2nxypePG26bSLpyT3Q2z74nzohRqXygrSlhxT
kzPDE4zQxeM02ZiloRWTQ4BMtf5X8dQ4nqoPrnS2bQLeYBckNFUudVd/BYlQy/tL
b03MiMvsErCTRxRMYZCk3D9PjkVhzKLZl/r7qgcRRmW/RarTzFQXTSv72UKs8hoq
Lk9dD2CPGnmxDf3WnAPLi9carIJwrlfXs7abkZYcTbd1LtCqYKuVgpE2HdvdBKI4
48eIhXOaL/HootuTv/LRz1+PICU3hsLUnhc141ZQhW8UJISIKQtAXtzzeNJV8xiC
Vi9CbH8FlKpMZ9vNGXNpGNVhGEClkTJHbggqSuNfUztKrQ/Tz3pUOfOc37ASwdK3
xY1WX51nQZO0xKJjZnENGMS1TTbQJAnIRE1jGtLJjz3FZKribcnYpnqC83SowUT+
SfoInbarBI1UkBFHUPeXztqtn9LjOsqozvoE03oZY7QKhxIygJAc4X5nKYseSC8A
bX1IpHkY7KTVUkSA7gqWC5qokvwjhGLiPYSUqnHK0vqoj8XdRPSYIsI8ZPlteTxo
ZD9m5748pabwzXNe6Pzk
=9Vis
-----END PGP SIGNATURE-----

--tcC6YSqBgqqkz7Sb--
