Received: by 10.223.197.9 with SMTP id q9csp1919535wrf;
        Sun, 8 Oct 2017 17:04:27 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDIeRUS18YTjIQTpssYFu+KD4zVhYe9J8zWVbWTRlPaVAEaOATUcdk2G8VWvkW7y87IjxmE
X-Received: by 10.55.92.195 with SMTP id q186mr6634844qkb.154.1507507467854;
        Sun, 08 Oct 2017 17:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507507467; cv=none;
        d=google.com; s=arc-20160816;
        b=HWknNkguGAWziytbXDo9irJuFygBOWF8cVOHStvoGqUdzgzzZmXzooTt5h9QSfpFL/
         /TjeQzRT1QMLTO3P1Z5Q/TJJrXw9XRxC7wuStaJLCueEVrrgl5YclXpqTSiOD/SMOdHj
         jeBSneCJcuXtfnOqQ8dSQuUB36RG8c5NlRFUPU5T49gPnbgAmtiSCVNR2onUkaYQtxw3
         vIqfdsynKm6qbizEMeMbgU4+3IdYkh7JBwx6BtVCjZ23+h8eXwhP9nWJFdIIEfSro4Ps
         diIF1NOh8MK4znBklBw9OzJAnFC8ce6HOlrBq10IzCIosgPufjn734yBoopn/HYoHswp
         sV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=DYZhfeR/pzFk8uG7GC4IAjG78JdtY3lcvZL2vFqE834=;
        b=vGv23N/y2rL+0TFqD8uAhAilbayjdu4fpgoBf3lw8PDH3W2K4AfvzKJtZraUN8z8VL
         APfLIP8kQUIlCTZwh/a64tPkDSVAbbU3WtVpAoBq6ZwUxx/h7mTuVli7IWh90xBpyHDv
         pTvp8fPw9eqA8BGqjEGz4b7FccpyTUo2lnQwWsvRyfQ1LfOlHNALXLKl/XI4j1lxY0Rg
         SV4GCax/cJoxU/bP/97Z9eV3v946rlzvf7XoRgXFabBhe+M0hODdlMevhVgi9S7Pv40T
         PacwBm0hyl+U2gJGVNQbtUzX1Mx8DInapHyTiBZ6AR2viMQeP2kG4emcgx4Gxjn+56ID
         VrOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=cl+j2slr;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=VlMiErvk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6si3104773qkd.88.2017.10.08.17.04.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Oct 2017 17:04:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=cl+j2slr;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=VlMiErvk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1LYZ-0007DR-EA
	for alex.bennee@linaro.org; Sun, 08 Oct 2017 20:04:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e1LYS-0007DL-T1
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e1LYP-0004Ls-Ni
	for qemu-arm@nongnu.org; Sun, 08 Oct 2017 20:04:20 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58137)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1e1LYP-0004Ku-Ak; Sun, 08 Oct 2017 20:04:17 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 69F0F20BF3;
	Sun,  8 Oct 2017 20:04:15 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Sun, 08 Oct 2017 20:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=DYZhfeR/pzFk8uG7GC4IAjG78JdtY3lcvZL2vFqE8
	34=; b=cl+j2slrecZrax30sEnBhMPFO8bfTKXSaHODLb5FgeOmG59SqVbh1ZOHJ
	Akj7WVG+cFPZ+E5Rc+oXCen+GeTfXjed6oKykfXTJK/f5qC5X29BWM5QkhLuVKoU
	ZTNKAl4Nvd0pGBigr2ZALk3/1uL/Sh82QL2Qq5hjNXgEZsw5NOwlfUBlw1zh4ypT
	Pvy+O0hwEhU+yvl64YY2DQvtQmygi4pObpDARtWMSuVVM5FZV+VmPoDwCALWeGb1
	7QUSXJvcCKjnW6CFbMqgLi7mrZtxKkPSgpr/odqTbrNcqnY9+TJglt2vHTdClKk0
	xNW5M2GbWR33YH/WzGndEIXfJ0knQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=DYZhfeR/pzFk8uG7GC
	4IAjG78JdtY3lcvZL2vFqE834=; b=VlMiErvk1OEWNIvZvXx9b2gbLvz01aZRvC
	2aF3vQJB+3B1fPHoQNYcLKpLnM5fz7VvhVvFkTP8LSjA6iCyMxz6mpz1BhZcGZTu
	kkXyxKXgtZAJYA8so1yu7s7e8SBhCClDROByTnNjnn9csa74pP1iI7XyMdjvSEHS
	Qv1jwycswIsHc542vqUxidbrkhnzvSVyroeAy4Uzh6I9/17Gm/NeTrgJ9PK5NYqX
	74qEs9OvmHVmR0ej9Ufpq55hs3FZwncr/XOHpCmnGozUD/URNYolA9oNIj3v3YKY
	CgB7U9DEe0eHXGxNt2pGA5U3de7+7Xjuo5xbmpG0qTfhOtyOf3FQ==
X-ME-Sender: <xms:_7zaWf5CPW3GyF1pLTbYogI_J-HJJnITr9RA5RMUIp1i4pAL4F6GCw>
X-Sasl-enc: 3j+RDnvhjyOMJ2atWo534EArwPADI1/4miRfriiDY8X4 1507507454
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id E42FA247A6;
	Sun,  8 Oct 2017 20:04:12 -0400 (EDT)
Message-ID: <1507507449.5452.147.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Mon, 09 Oct 2017 10:34:09 +1030
In-Reply-To: <20170920070135.31379-2-clg@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oY3VsICoF9BwTCvYHlV6"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
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
Cc: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GHgvvnwsrLH9


--=-oY3VsICoF9BwTCvYHlV6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-20 at 09:01 +0200, C=C3=A9dric Le Goater wrote:
> The Witherspoon boards are OpenPOWER system hosting POWER9 Processors.
> Let's add support for their BMC including a couple of I2C devices as
> found on real HW.
>=C2=A0
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
> =C2=A0hw/arm/aspeed.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++=
+++
> =C2=A01 file changed, 49 insertions(+)
>=C2=A0
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ab895ad490af..81f522f711ae 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -46,6 +46,7 @@ enum {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PALMETTO_BMC,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST2500_EVB,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ROMULUS_BMC,
> +=C2=A0=C2=A0=C2=A0=C2=A0WITHERSPOON_BMC,
> =C2=A0};
> =C2=A0
> =C2=A0/* Palmetto hardware value: 0x120CE416 */
> @@ -83,8 +84,12 @@ enum {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_AST2500_HW_STRA=
P_ACPI_ENABLE |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_HW_STRAP_SPI_MO=
DE(SCU_HW_STRAP_SPI_MASTER))
> =C2=A0
> +/* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
> +#define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> +
> =C2=A0static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
> =C2=A0static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
> =C2=A0
> =C2=A0static const AspeedBoardConfig aspeed_boards[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[PALMETTO_BMC] =3D {
> @@ -110,6 +115,14 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D "mx6=
6l1g45g",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=C2=A0=
=C2=A0=C2=A0=3D 2,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> +=C2=A0=C2=A0=C2=A0=C2=A0[WITHERSPOON_BMC]=C2=A0=C2=A0=3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.soc_name=C2=A0=C2=A0=3D=
 "ast2500-a1",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hw_strap1 =3D WITHERSPO=
ON_BMC_HW_STRAP1,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fmc_model =3D "mx25l256=
35e",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D "mx66l1g4=
5g",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=C2=A0=C2=
=A0=C2=A0=3D 2,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.i2c_init=C2=A0=C2=A0=3D=
 witherspoon_bmc_i2c_init,
> +=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0};
> =C2=A0
> =C2=A0#define FIRMWARE_ADDR 0x0
> @@ -337,11 +350,47 @@ static const TypeInfo romulus_bmc_type =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D romulus_bmc_class_init,
> =C2=A0};
> =C2=A0
> +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 4), "tmp423", 0x4c);
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 5), "tmp423", 0x4c);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc-=
>i2c), 9), "tmp105", 0x4a);

Looks like I need to track down newer versions of the schematics I have.

> +}
> +
> +static void witherspoon_bmc_init(MachineState *machine)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_init(machine, &aspeed_boards[WITHER=
SPOON_BMC]);
> +}
> +
> +static void witherspoon_bmc_class_init(ObjectClass *oc, void *data)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0MachineClass *mc =3D MACHINE_CLASS(oc);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->desc =3D "OpenPOWER Witherspoon BMC (ARM1176=
)";
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->init =3D witherspoon_bmc_init;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->max_cpus =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_sdcard =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_floppy =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_cdrom =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->no_parallel =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0mc->ignore_memory_transaction_failures =3D true;

Aside from the issue with the above as pointed out by Peter,

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> +}
> +
> +static const TypeInfo witherspoon_bmc_type =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0.name =3D MACHINE_TYPE_NAME("witherspoon-bmc"),
> +=C2=A0=C2=A0=C2=A0=C2=A0.parent =3D TYPE_MACHINE,
> +=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D witherspoon_bmc_class_init,
> +};
> +
> =C2=A0static void aspeed_machine_init(void)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&palmetto_bmc_type);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&ast2500_evb_type);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&romulus_bmc_type);
> +=C2=A0=C2=A0=C2=A0=C2=A0type_register_static(&witherspoon_bmc_type);
> =C2=A0}
> =C2=A0
> =C2=A0type_init(aspeed_machine_init)
--=-oY3VsICoF9BwTCvYHlV6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ2rz5AAoJEJ0dnzgO5LT5NGwQAJRBPI/LN5+DXxFkXTKijyeR
gaYlkVmp0dvTh+5AhV2oEoruY/uEcZReiEeN+f9mI4Fp2JCln9QlV0V+UBkv66Xo
zNA/+cPtvo43DkzKKSwilInWvB7h1xvyiJaPGjUc510ivfVYP2SnB6MCMsiStS+r
AjUqUY9BcDua17UjmrJ5X/gomt+tUr+qYZoCT5Cg4SeogP9CbKauLHR0zwzGH8eS
4NTgmwXQc50mtnSfipzzxgMJzZlbxR79vMollMpvEgvYVXkphQwlmiEr2XFYZ26v
vLLaC2r3gegajihb552eoRHoN/DM/l2PXgNPSMst65C3LBwpii4xCcNOReosbeTk
Y6eOa8NGlb0ylUoXd5cnikhsdeJkdLQVDPfDW+XsnyK3gMnpqevjnsLx65+ihGHx
PWa0e99yhvDB8oy0e5GoPfPmlOYiIPitgdZRa6STonpTYkUwN+SPBuf7ZmUyVDwh
JNcBOrE4bYWSmR+Gylw4jGJnrazsyZAOjXcANCvfn3d+sSk3Lci8frXXRu76Hbhj
00DurB8nVQcxnh84oLZQ9Vv2uWlSLRChSbe0KNtIXFv09kZRQ9yhOlvH5GFMG+1g
jJ3JKCBwhbSauYisXu6p2sOOQJUcDP2hdtE7F7b9EusWavUWHrV1kc5Ww07H427W
+iGKo3UggKWMXJq/H0sK
=o0nP
-----END PGP SIGNATURE-----

--=-oY3VsICoF9BwTCvYHlV6--

