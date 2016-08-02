Received: by 10.25.21.156 with SMTP id 28csp457366lfv;
        Tue, 2 Aug 2016 16:57:26 -0700 (PDT)
X-Received: by 10.55.19.206 with SMTP id 75mr41657961qkt.29.1470182246566;
        Tue, 02 Aug 2016 16:57:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k9si3146280qte.22.2016.08.02.16.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 16:57:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59442 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUjYs-0000xc-06
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 19:57:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bUjYn-0000xU-4N
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 19:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bUjYj-0006Dm-WC
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 19:57:21 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40185)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bUjYh-000652-Lz; Tue, 02 Aug 2016 19:57:17 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id BE99020491;
	Tue,  2 Aug 2016 19:57:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Tue, 02 Aug 2016 19:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=s3AQ9
	t7ChW3IExO86K0ny+Oy0fM=; b=ECFzBBcot8yJa+lt0XpojT2T475kgZR3CUXyE
	YhesnIBsp7pQPqr4wImFFshevNE9AEWmVBbKDvGhPV1lIeN/yb8/Xw6ZwMfXMNSa
	Gj3nsciY/npQu7fTvxBLG/JY2X6NbbJsBzeLtZQGkeWGp8voNZO1TNymvdriaKUm
	ml+588=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=s3AQ9t7ChW3IExO86K0ny+Oy0fM=; b=BaaaB
	/G9qCYQJMEug+6JCvGjy/MvTxOfw5qYyFBwG85jQZcFWMGBGfx8JpZYWB+JdIawv
	OwwxQYrvGLXO+W6nyUISA6WaAbMu9meMGoIOzeFzSBMktrZeOLNpfxSCGlIhxM8k
	p9K3ysqg8DiePsC/eF6pft63+mn0VTkmfnP9Z0=
X-Sasl-enc: yyGfy+vTWssnPTZ/tCZu9G4DyDrqERx9IHojfbotBg2B 1470182222
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id A8D5FF29D9;
	Tue,  2 Aug 2016 19:57:01 -0400 (EDT)
Message-ID: <1470182206.4428.38.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Wed, 03 Aug 2016 09:26:46 +0930
In-Reply-To: <1470158147-16378-6-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-6-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-SeqsrNLAQ9r/j6oJRbzC"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.29
Subject: Re: [Qemu-arm] [PATCH v3 05/10] palmetto-bmc: replace palmetto_bmc
 with aspeed
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2JcwqrV27tgk


--=-SeqsrNLAQ9r/j6oJRbzC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-08-02 at 19:15 +0200, C=C3=A9dric Le Goater wrote:
> This is mostly a name replacement to prepare ground for other SoCs
> specificities. It also adds a TypeInfo struct for the palmetto-bmc
> board with a custom initialization for the same reason.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed.c | 56 +++++++++++++++++++++++++++++++++++++---------=
----------
> =C2=A01 file changed, 37 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 531c266d9449..ad0a062b5624 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -21,16 +21,16 @@
> =C2=A0#include "sysemu/block-backend.h"
> =C2=A0#include "sysemu/blockdev.h"
> =C2=A0
> -static struct arm_boot_info palmetto_bmc_binfo =3D {
> +static struct arm_boot_info aspeed_board_binfo =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.nb_cpus =3D 1,
> =C2=A0};
> =C2=A0
> -typedef struct PalmettoBMCState {
> +typedef struct AspeedBoardState {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState soc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion ram;
> -} PalmettoBMCState;
> +} AspeedBoardState;
> =C2=A0
> -static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
> +static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0Error **errp)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i ;
> @@ -56,12 +56,12 @@ static void palmetto_bmc_init_flashes(AspeedSMCState =
*s, const char *flashtype,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> =C2=A0
> -static void palmetto_bmc_init(MachineState *machine)
> +static void aspeed_board_init(MachineState *machine)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0PalmettoBMCState *bmc;
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedBoardState *bmc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCClass *sc;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0bmc =3D g_new0(PalmettoBMCState, 1);
> +=C2=A0=C2=A0=C2=A0=C2=A0bmc =3D g_new0(AspeedBoardState, 1);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&bmc->soc, (sizeof(bmc->s=
oc)), "ast2400-a0");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(OBJECT(machine), =
"soc", OBJECT(&bmc->soc),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&error_abort);
> @@ -78,22 +78,29 @@ static void palmetto_bmc_init(MachineState *machine)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&bmc->soc),=
 true, "realized",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&error_abort);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q25=
6a", &error_abort);
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l2=
5635e", &error_abort);
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_init_flashes(&bmc->soc.smc, "n25q25=
6a", &error_abort);
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_init_flashes(&bmc->soc.spi, "mx25l2=
5635e", &error_abort);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_binfo.kernel_filename =3D machine->=
kernel_filename;
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_binfo.initrd_filename =3D machine->=
initrd_filename;
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_binfo.kernel_cmdline =3D machine->k=
ernel_cmdline;
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_binfo.ram_size =3D ram_size;
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_binfo.board_id =3D sc->info->silico=
n_rev;
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_binfo.loader_start =3D sc->info->sd=
ram_base;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.kernel_filename =3D machine->=
kernel_filename;
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.initrd_filename =3D machine->=
initrd_filename;
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.kernel_cmdline =3D machine->k=
ernel_cmdline;
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.ram_size =3D ram_size;
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.board_id =3D sc->info->silico=
n_rev;
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.loader_start =3D sc->info->sd=
ram_base;
> +=C2=A0=C2=A0=C2=A0=C2=A0arm_load_kernel(ARM_CPU(first_cpu), &aspeed_boar=
d_binfo);
> +}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0arm_load_kernel(ARM_CPU(first_cpu), &palmetto_bm=
c_binfo);
> +static void palmetto_bmc_init(MachineState *machine)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_init(machine);
> =C2=A0}
> =C2=A0
> -static void palmetto_bmc_machine_init(MachineClass *mc)
> +static void palmetto_bmc_class_init(ObjectClass *oc, void *data)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0mc->desc =3D "OpenPOWER Palmetto BMC";
> +=C2=A0=C2=A0=C2=A0=C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->desc =3D "OpenPOWER Palmetto BMC (ARM926EJ-S=
)";
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mc->init =3D palmetto_bmc_init;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mc->max_cpus =3D 1;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mc->no_sdcard =3D 1;
> @@ -103,4 +110,15 @@ static void palmetto_bmc_machine_init(MachineClass *=
mc)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mc->no_parallel =3D 1;
> =C2=A0}
> =C2=A0
> -DEFINE_MACHINE("palmetto-bmc", palmetto_bmc_machine_init);
> +static const TypeInfo palmetto_bmc_type =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name =3D MACHINE_TYPE_NAME("palmetto-bmc"),
> +=C2=A0=C2=A0=C2=A0=C2=A0.parent =3D TYPE_MACHINE,
> +=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D palmetto_bmc_class_init,
> +};
> +
> +static void aspeed_machine_init(void)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&palmetto_bmc_type);
> +}
> +
> +type_init(aspeed_machine_init)
--=-SeqsrNLAQ9r/j6oJRbzC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXoTM+AAoJEJ0dnzgO5LT5H0kP/R/unIXQg2dzcO27WsxEyuHx
Kzvt1slze5fm45MkdV3VzQJ2opCx/qG+Vx1VPLVOpKAghVCH7zMNQzQp4elhzYNn
kpWMncQQoV+kQqrk93HheFNkS85hMeDVXb+/tFJsuD/cWGMShEXoE7hXb4kzc4r9
JEYAa/B40ZUI0jbrRuKrKqBeoVzJ91RtQsJCXeUGZ6M1Ib5MrM7g1bBGNi1u6R4I
9/KZB7ZRwRlyTuZEk5FMJm3z9LsRUnZ762wl/kdaxyvfoe1/FXmVX5GmVI5bkufe
Vk4YdafOmlpgBprsiGg5BzDrjnq2s4ZGNwwIxR+ssp4IXgwq7C5mhlc/7rZJw/OK
oveJLHmtnbc+/2U/QU6v9ZZDtrU0tjSiaBtBMH5FlnwLRbxTEq9dygr1kimyWlUG
y2YKqEGppMmqzZv/NEGx1P3NdYfbiOgYV/z1Ew3iNpBhmwErQ/ODDxLK8CWA79+K
82YGHAUSGYoWZJr1Xg90282Tcca0SBlvl/rJT4EYe7AdZJieN/c/pJZ65W+nMQWD
f8ceA6vSU2Y/rL9R+n5t8SnTdo8McpT/ZuJYwMwJZ9rdyljBF8dBuy7XoBuKbRsn
riEG3o6f07RsuMg/blHEylXv+/mqRUs60ECKrSeG4EEjX/ueqwD+8R2NMYiFYPBz
reO+3rzfqJa3g2QlO3fx
=YcgU
-----END PGP SIGNATURE-----

--=-SeqsrNLAQ9r/j6oJRbzC--

