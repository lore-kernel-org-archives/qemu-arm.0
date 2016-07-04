Received: by 10.25.21.96 with SMTP id l93csp1564927lfi;
        Mon, 4 Jul 2016 08:04:11 -0700 (PDT)
X-Received: by 10.55.4.23 with SMTP id 23mr15676204qke.179.1467644650418;
        Mon, 04 Jul 2016 08:04:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e35si2268543qtb.53.2016.07.04.08.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 08:04:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK5Pt-0002Qn-Qe
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 11:04:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK5L7-0006QJ-6B
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 10:59:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK5L3-0006EG-1A
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 10:59:12 -0400
Received: from 3.mo3.mail-out.ovh.net ([46.105.44.175]:58818)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK5L2-0006E5-Mf
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 10:59:08 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 4665AFFBD9D
	for <qemu-devel@nongnu.org>; Mon,  4 Jul 2016 16:59:07 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 3EE53480084;
	Mon,  4 Jul 2016 16:59:01 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-7-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e6ab97e2-36e4-1723-5ca6-daf7d688d2dc@kaod.org>
Date: Mon, 4 Jul 2016 16:58:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1467634738-28642-7-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 8771604702271408908
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.44.175
Subject: Re: [Qemu-devel] [PATCH 6/7] ast2400: use contents of first SPI
 flash as a rom
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, mar.krzeminski@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pM/2ouf9k4ja

On 07/04/2016 02:18 PM, C=C3=A9dric Le Goater wrote:
> This provides support for U-Boot images which are loaded at 0x0.
>=20
> A Palmetto BMC guest can now be simply booted with :
>=20
>   $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  \
> 	-mtdblock ./flash-palmetto-20160512040959  \
> 	-mtdblock ./palmetto.pnor
>=20
> The first block device uses the file './flash-palmetto-20160512040959'
> which will act as a SPI flash module for the BMC, handled by the
> SMC/FMC controller. The second block device uses the file
> './palmetto.pnor' which is an OpenPower firmware image for a palmetto
> OpenPower system. This one will be handled by the SMC/SPI controller.
>=20
> The flash images can be grabbed here :
>=20
>     https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dpa=
lmetto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
>     https://openpower.xyz/job/openpower-op-build/distro=3Dubuntu,target=
=3Dpalmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor
>=20
> We could add a second BMC SPI flash by changing the 'num-cs' property
> of the controller and emulate a golden image flash module.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/palmetto-bmc.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index b00757dcbc69..fcbb4f197162 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -33,6 +33,8 @@ typedef struct PalmettoBMCState {
>      MemoryRegion ram;
>  } PalmettoBMCState;
> =20
> +static bool palmetto_bmc_has_flash0;
> +
>  static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *f=
lashtype,
>                                        Error **errp)
>  {
> @@ -51,6 +53,7 @@ static void palmetto_bmc_init_flashes(AspeedSMCState =
*s, const char *flashtype,
>          if (dinfo) {
>              qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinf=
o(dinfo),
>                                  errp);
> +            palmetto_bmc_has_flash0 =3D true;
>          }
>          m25p80_set_rom_storage(fl->flash, &fl->mmio);
>          qdev_init_nofail(fl->flash);
> @@ -82,6 +85,21 @@ static void palmetto_bmc_init(MachineState *machine)
>      palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort)=
;
>      palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l25635f", &error_abo=
rt);
> =20
> +    /*
> +     * Install first SMC/FMC flash content as a rom.
> +     */
> +    if (palmetto_bmc_has_flash0) {
> +        AspeedSMCFlash *flash0 =3D &bmc->soc.smc.flashes[0];
> +        MemoryRegion *flash0alias =3D g_new(MemoryRegion, 1);
> +
> +        memory_region_init_alias(flash0alias, OBJECT(&bmc->soc.smc),
> +                                 "flash0alias", &flash0->mmio, 0,
> +                                 flash0->size);
> +
> +        memory_region_add_subregion(get_system_memory(), 0, flash0alia=
s);
> +        palmetto_bmc_binfo.firmware_loaded =3D true;


This should not be there. It will break qemu when a kernel is specified o=
n=20
the command line.

I will drop it in the next round.

Thanks,

C.

> +    }
> +
>      palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
>      palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
>      palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
>=20

