Received: by 10.25.0.198 with SMTP id 189csp24398lfa;
        Thu, 4 May 2017 23:37:56 -0700 (PDT)
X-Received: by 10.233.222.134 with SMTP id s128mr5031526qkf.190.1493966275955;
        Thu, 04 May 2017 23:37:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o1si3707084qte.164.2017.05.04.23.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 23:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6WsD-0003lQ-AT
	for alex.bennee@linaro.org; Fri, 05 May 2017 02:37:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d6Ws8-0003lH-Lh
	for qemu-arm@nongnu.org; Fri, 05 May 2017 02:37:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d6Ws7-0007Vf-KT
	for qemu-arm@nongnu.org; Fri, 05 May 2017 02:37:48 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55601)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d6Ws6-0007Tx-SR; Fri, 05 May 2017 02:37:47 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wK2JM5qJDz9s8W; Fri,  5 May 2017 16:37:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1493966259;
	bh=cqbCIjzjthSuIAbrriyWbW++ieFydkHROSfqspR05TQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ0ICfKXz+/vr88KzgnP6a3Qo0biSTxrDR6vYljxznjREPUCyKahxWfleP/xX4git
	UTLXtPvBL6RaPeJgFaFyuBN/r4UjwRc33zZkeGfWmXwksCaJzvuHwqnkiiQJiTgLPj
	4ttCeFpH6cHXK7fCnzjt53yNhuLOa36l2PuOQqjc=
Date: Fri, 5 May 2017 13:23:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170505032306.GN14413@umbus.fritz.box>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-21-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Y142/9l9nQlBiaj"
Content-Disposition: inline
In-Reply-To: <1493816238-33120-21-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH v2 20/24] machine: call machine init from
 wrapper
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
X-TUID: Webh7vHHnvUf


--4Y142/9l9nQlBiaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2017 at 02:57:14PM +0200, Igor Mammedov wrote:
> add machine_run_board_init() wrapper that calls machine
> init for now but in follow up patches it will be used
> to run generic machine code that should run before
> machine init.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/hw/boards.h | 1 +
>  hw/core/machine.c   | 6 ++++++
>  vl.c                | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 1f518a1..0e74484 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -32,6 +32,7 @@ void memory_region_allocate_system_memory(MemoryRegion =
*mr, Object *owner,
>  MachineClass *find_default_machine(void);
>  extern MachineState *current_machine;
> =20
> +void machine_run_board_init(MachineState *machine);
>  bool machine_usb(MachineState *machine);
>  bool machine_kernel_irqchip_allowed(MachineState *machine);
>  bool machine_kernel_irqchip_required(MachineState *machine);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a63f17b..217b4f4 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -648,6 +648,12 @@ bool machine_mem_merge(MachineState *machine)
>      return machine->mem_merge;
>  }
> =20
> +void machine_run_board_init(MachineState *machine)
> +{
> +    MachineClass *machine_class =3D MACHINE_GET_CLASS(machine);
> +    machine_class->init(machine);
> +}
> +
>  static void machine_class_finalize(ObjectClass *klass, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(klass);
> diff --git a/vl.c b/vl.c
> index fe4741d..ac46d6e 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4562,7 +4562,7 @@ int main(int argc, char **argv, char **envp)
>      current_machine->boot_order =3D boot_order;
>      current_machine->cpu_model =3D cpu_model;
> =20
> -    machine_class->init(current_machine);
> +    machine_run_board_init(current_machine);
> =20
>      realtime_init();
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4Y142/9l9nQlBiaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZC/AaAAoJEGw4ysog2bOSv4AP/ih8nLvhqX3v0Mta1ipbgc52
91vfhfXjmSe6Uv2342PrDduQ8iJXxplHeIkNcqdmMlRwUQ+fQgDyCjolu+tH78aK
q6MXPjQ9MPTltPeOq+1jLxynWuTAZ6WTbcCFmDR4TLOWU7aAZXTEx7+Lwoo1p7im
Jeq7YXDM/7p/h9bMDVZd5ktPV4qpm+8jTeO5POURKrP2gthrDlaihWLFvZrkNdb3
Arhs6K/pte3bxW1yThNRgbbLJQo5f6NyXxQGfHNftZxmR2xK3OBFzc4xQEu3XELi
ZXxBEX5neVIr2VaqzzW6ccc+/mKkDrEXp5Zh1Cj8NgO7bVcblAqhY16Bp88BkAoR
kD2tlviUBiD8CVCh+mFHiX/JdrlRH4f34qBNipCcUfPKnatNW7VaS+cSVNNAx7ad
3KAZbA0Jx5EPk3RhLMwJyLihufYhMU8TPneDJM2Y3gM1UQajMsryPJW9s5V1Vn42
/ShK3xoDueiAXqYKHGgBCArVBeLeZ/1xIOmAb0cmM5pfxlJKwTFROs+PCTVlvM7G
bxF5L8qNNn6l+L/g/qkYw8MJ6NaE9iebpSTbdeuo9z/oyvdYf0CUJZhPeEiruW23
iQUWAqh0Gm1AtDHdd4MpzEATIPKVAoBIEK6NhGt3h1P5dyCdJykSHccNZY89Ui+P
x4nwn+NbcWtMeo3H7QBD
=nnjb
-----END PGP SIGNATURE-----

--4Y142/9l9nQlBiaj--
