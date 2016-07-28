Received: by 10.25.21.156 with SMTP id 28csp603142lfv;
        Wed, 27 Jul 2016 21:48:43 -0700 (PDT)
X-Received: by 10.200.43.47 with SMTP id 44mr52933704qtu.66.1469681323826;
        Wed, 27 Jul 2016 21:48:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j31si6782186qtc.137.2016.07.27.21.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 21:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSdFT-0001Sb-8i
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 00:48:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSdFQ-0001QS-9P
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 00:48:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bSdFN-0005tG-4T
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 00:48:40 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:52800)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bSdFK-0005oo-OS; Thu, 28 Jul 2016 00:48:37 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 61C76BB4;
	Thu, 28 Jul 2016 00:48:20 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Thu, 28 Jul 2016 00:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=6tsLA
	Tsl9CytahDByBhPbdq05GI=; b=gumcT8qmTP9S+iOlZr4oWVFN6iB45aXcAImgd
	PvlBrJXI5yfCCrDNXbarKx1gEA9KosAxMomrZJwt85kO1y18MAJgvJ8Lyen74p5f
	U3xvKX8oYlkB2dKij9m2WBW8Siu1EGUmnPLWGUjB0lcaZEpv18qg4guBGq0bood9
	rlsslY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=6tsLATsl9CytahDByBhPbdq05GI=; b=h/xZ+
	BPoqYDpZooXpfvnFm+WcjWO09hOKX3KHOD1t6O2X6Zcm7tQsIOKtnr6IHoWpzNaD
	QZFafWdc7t4SADaYt53ejaV4alwGwc8UMQCq2WVKUuq52d4ocqqzcT37jgx66bIv
	Lix/Hyh1LjQKjVXZFAru1v3MFrmNcRCp5r588Q=
X-Sasl-enc: us05WICDpkq1UzV35CRLO47bJNNPbLhlnXPw3k5gY5DN 1469681298
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2E158CCDA6;
	Thu, 28 Jul 2016 00:48:16 -0400 (EDT)
Message-ID: <1469681289.5468.101.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 14:18:09 +0930
In-Reply-To: <1469638018-17590-3-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-3-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oqUluHRvkDjBntXt3kAA"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: Re: [Qemu-arm] [PATCH 2/6] palmetto-bmc: replace palmetto_bmc with
 aspeed
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
X-TUID: o4aEOMY7zsyG


--=-oqUluHRvkDjBntXt3kAA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
> This is mostly a name replacement to prepare ground for other socs
> specificities. It also adds a specific TypeInfo struct for the
> palmetto_bmc board with a custom initialization for the same reason.

I think we should rename the file, it feels a bit confusing having the
ast2500 machine glue (added later in the series) in palmetto-bmc.c. You
mentioned in the cover letter that moving it would break history but it
isn't necessarily so, you can follow renames in the logs with `git log
--follow`. It's a git switch that feels like it should be a default but
isn't :/

Maybe create a commit that renames the file, then add these changes
after?

Andrew

>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>=20
> =C2=A0Should we change the name of the file to aspeed.c ? I am not found =
of
> =C2=A0such renames as it is then difficult to track code changes.
>=20
> =C2=A0hw/arm/palmetto-bmc.c | 54 ++++++++++++++++++++++++++++++++++------=
-----------
> =C2=A01 file changed, 36 insertions(+), 18 deletions(-)
>=20
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index 1ee13d578899..f80a15733864 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -21,19 +21,19 @@
> =C2=A0#include "sysemu/block-backend.h"
> =C2=A0#include "sysemu/blockdev.h"
> =C2=A0
> -static struct arm_boot_info palmetto_bmc_binfo =3D {
> +static struct arm_boot_info aspeed_binfo =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.loader_start =3D AST2400_SDRAM_BASE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.board_id =3D 0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.nb_cpus =3D 1,
> =C2=A0};
> =C2=A0
> -typedef struct PalmettoBMCState {
> +typedef struct AspeedBoardState {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST2400State soc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0MemoryRegion ram;
> -} PalmettoBMCState;
> +} AspeedBoardState;
> =C2=A0
> -static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0Error **errp)
> +static void aspeed_init_flashes(AspeedSMCState *s, const char *flashtype=
,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Error **errp)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int i ;
> =C2=A0
> @@ -58,11 +58,11 @@ static void palmetto_bmc_init_flashes(AspeedSMCState =
*s, const char *flashtype,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> =C2=A0
> -static void palmetto_bmc_init(MachineState *machine)
> +static void aspeed_init(MachineState *machine)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0PalmettoBMCState *bmc;
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedBoardState *bmc;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0bmc =3D g_new0(PalmettoBMCState, 1);
> +=C2=A0=C2=A0=C2=A0=C2=A0bmc =3D g_new0(AspeedBoardState, 1);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&bmc->soc, (sizeof(bmc->s=
oc)), TYPE_AST2400);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(OBJECT(machine), =
"soc", OBJECT(&bmc->soc),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&error_abort);
> @@ -79,19 +79,26 @@ static void palmetto_bmc_init(MachineState *machine)
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
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_init_flashes(&bmc->soc.smc, "n25q256a", &=
error_abort);
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_init_flashes(&bmc->soc.spi, "mx25l25635e"=
, &error_abort);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_binfo.kernel_filename =3D machine->kernel=
_filename;
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_binfo.initrd_filename =3D machine->initrd=
_filename;
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_binfo.kernel_cmdline =3D machine->kernel_=
cmdline;
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_binfo.ram_size =3D ram_size;
> +=C2=A0=C2=A0=C2=A0=C2=A0arm_load_kernel(ARM_CPU(first_cpu), &aspeed_binf=
o);
> +}
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.kernel_filename =3D machine->=
kernel_filename;
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.initrd_filename =3D machine->=
initrd_filename;
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.kernel_cmdline =3D machine->k=
ernel_cmdline;
> -=C2=A0=C2=A0=C2=A0=C2=A0palmetto_bmc_binfo.ram_size =3D ram_size;
> -=C2=A0=C2=A0=C2=A0=C2=A0arm_load_kernel(ARM_CPU(first_cpu), &palmetto_bm=
c_binfo);
> +static void palmetto_bmc_init(MachineState *machine)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_init(machine);
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
> @@ -101,4 +108,15 @@ static void palmetto_bmc_machine_init(MachineClass *=
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
--=-oqUluHRvkDjBntXt3kAA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmY6KAAoJEJ0dnzgO5LT5BkoP/Azv+fr+BjVoWc+y0MWIc0Pl
EKjh2V0ZiVx2mfagZuqC3FsYKrLXU94DYdBDlFAmEnLgxqPE1bbIF8yGnnSnckXf
eZBk/Emd083gnIcNxXB0003CGoM1AXsclaLzdwCqYKME5X64pnqKGFGVamNWKPUp
KOG2vu98lGlmlgYoUVeoRpHusMd0FFrnWtBCXDFr1mX4mk2j2lswcC5f1vBELBVA
2qDpEegcyE6SzY18g/WBmb/y+4nrsiKRTlNCGyjIvrk2Heyjk8pXoOq3s/CU3YQx
43vy9/7QpmViPuGe0LAI1bB8yVFaAuqmHqrHPGRp1/MVNxC7xA86hMy5NS3HLZgp
BMUR9Gy6p27tRYhs2Rg9Da5M5DHrwDqPeTbynkPNdYUATAEvYv0i/+Luv+8uyFL+
WIzg4paKDfcjZFFb95/ViuA/WDFJ8TUwznkFH9dnmXwSm8P+mP752BrEoucPc+R2
ePJqi6kRj/0ASVmGl0Flhhz718DcfyYc7g2knEIpl4eSUkm/2JoQgG/+owM3YoD8
831qSxt5kQ/irIrfY2trmkBzx7euR9/07NuqzIHuzSJQgc9WMFqrU6o9+snwLo1v
NZqrTJ6JoDKyFPIuHoDVujN0RXfaxDAjaJUV3RTf5JSrDR++a4a6KpAGwD9zuUqN
/wx9OB9Z+f8bys7fUhlC
=l6Ai
-----END PGP SIGNATURE-----

--=-oqUluHRvkDjBntXt3kAA--

