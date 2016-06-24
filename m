Received: by 10.25.21.96 with SMTP id l93csp977102lfi;
        Fri, 24 Jun 2016 03:53:50 -0700 (PDT)
X-Received: by 10.237.34.213 with SMTP id q21mr3634926qtc.53.1466765630802;
        Fri, 24 Jun 2016 03:53:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p184si4434649qkb.238.2016.06.24.03.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 03:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGOkA-00042T-AL
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 06:53:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGOk5-00042O-Tz
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 06:53:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGOk2-0002LQ-Ko
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 06:53:45 -0400
Received: from 20.mo1.mail-out.ovh.net ([188.165.45.168]:40660)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bGOk2-0002L3-AL
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 06:53:42 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id CB054FF990E
	for <qemu-arm@nongnu.org>; Fri, 24 Jun 2016 12:53:39 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 43BA62C0097;
	Fri, 24 Jun 2016 12:53:35 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
	<1466744305-23163-4-git-send-email-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <afd865a5-4c8b-aeab-3e10-f1f8c4c8f0ee@kaod.org>
Date: Fri, 24 Jun 2016 12:53:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466744305-23163-4-git-send-email-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 1239334326018476976
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdekgdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.45.168
Subject: Re: [Qemu-arm] [PATCH v3 3/3] palmetto-bmc: Configure the SCU's
 hardware strapping register
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
Cc: qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ay9/RzYCAszG

On 06/24/2016 06:58 AM, Andrew Jeffery wrote:
> The magic constant configures the following options:
>=20
> * 28:27: Configure DRAM size as 256MB
> * 26:24: DDR3 SDRAM with CL =3D 6, CWL =3D 5
> * 23: Configure 24/48MHz CLKIN
> * 22: Disable GPIOE pass-through mode
> * 21: Disable GPIOD pass-through mode
> * 20: Enable LPC decode of SuperIO 0x2E/0x4E addresses
> * 19: Disable ACPI
> * 18: Configure 48MHz CLKIN
> * 17: Disable BMC 2nd boot watchdog timer
> * 16: Decode SuperIO address 0x2E
> * 15: VGA Class Code
> * 14: Enable LPC dedicated reset pin
> * 13:12: Enable SPI Master and SPI Slave to AHB Bridge
> * 11:10: Select CPU:AHB ratio =3D 2:1
> * 9:8: Select 384MHz H-PLL
> * 7: Configure MAC#2 for RMII/NCSI
> * 6: Configure MAC#1 for RMII/NCSI
> * 5: No VGA BIOS ROM
> * 4: Boot using 32bit SPI address mode
> * 3:2: Select 16MB VGA memory
> * 1:0: Boot from SPI flash memory

As the previous patchset was not setting the silicon version, we did not=20
see that should be skipping the SPI Flash checks in U-Boot. So, with this=
=20
little change :

	-    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
	+    object_property_set_int(OBJECT(&bmc->soc), 0x120CE414, "hw-strap1",

We reach a point where U-Boot is ready to load a kernel :

	U-Boot 2013.07 (Jun 07 2016 - 01:33:14)

	I2C:   ready
	DRAM:  256 MiB
	WARNING: Caches not enabled
	Flash: SPI Flash ID: 19ba20=20
	32 MiB
	In:    serial
	Out:   serial
	Err:   serial
	H/W:   AST2400 series chip Rev. 00=20
	Watchdog: 300s
	Net:   aspeednic#0
	Warning: aspeednic#0 (eth0) using random MAC address - aa:36:26:50:30:9c

	Hit any key to stop autoboot:  0=20
	boot#   =20


I will see if it is worth adding what is required in the SMC controller t=
o=20
support this. Else, we have the quick solution above.=20

Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C. =20

=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/palmetto-bmc.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index a51d960510ee..b8eed21348d8 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -44,6 +44,8 @@ static void palmetto_bmc_init(MachineState *machine)
>                                  &bmc->ram);
>      object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&b=
mc->ram),
>                                     &error_abort);
> +    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1"=
,
> +                            &error_abort);
>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>                               &error_abort);
> =20
>=20

