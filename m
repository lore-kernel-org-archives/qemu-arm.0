Received: by 10.25.21.156 with SMTP id 28csp650714lfv;
        Thu, 28 Jul 2016 00:15:29 -0700 (PDT)
X-Received: by 10.200.47.253 with SMTP id m58mr53846685qta.60.1469690129220;
        Thu, 28 Jul 2016 00:15:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127si7085159qkc.186.2016.07.28.00.15.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 00:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSfXU-0006XE-Mq
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 03:15:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSfXQ-0006Wq-Jx
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:15:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSfXL-0004ia-Eb
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:15:23 -0400
Received: from 8.mo7.mail-out.ovh.net ([46.105.77.114]:54216)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSfXL-0004iM-4N
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:15:19 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 1C6101008FD0
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 09:15:18 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 8142E5C0077;
	Thu, 28 Jul 2016 09:15:14 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-7-git-send-email-clg@kaod.org>
	<1469682716.5468.114.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <947a8251-7bb6-ea6e-8bd0-05bdd89b9bc0@kaod.org>
Date: Thu, 28 Jul 2016 09:15:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1469682716.5468.114.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 12755882996012321712
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieeigdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.77.114
Subject: Re: [Qemu-arm] [PATCH 6/6] arm: add support for an ast2500
 evaluation board
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
X-TUID: UGLemQs2zskX

On 07/28/2016 07:11 AM, Andrew Jeffery wrote:
> On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/palmetto-bmc.c    | 32 +++++++++++++++++++++++++++++++-
>>  include/hw/arm/ast2400.h |  5 +++++
>>  2 files changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
>> index cd8aa59756b9..8d8bfeb571e2 100644
>> --- a/hw/arm/palmetto-bmc.c
>> +++ b/hw/arm/palmetto-bmc.c
>> @@ -37,12 +37,15 @@ typedef struct AspeedBoardConfig {
>>  } AspeedBoardConfig;
>> =20
>>  enum {
>> -    PALMETTO_BMC
>> +    PALMETTO_BMC,
>> +    AST2500_EDK
>=20
> It was called 'ast2500-edk' in the out-of-tree patches, but can we
> rename it 'ast2500-evb'? This would make it consistent with patches we
> have in our Linux trees.

yes. I feel the same also.

>=20
>>  };
>> =20
>>  static const AspeedBoardConfig aspeed_boards[] =3D {
>>      [ PALMETTO_BMC ] =3D { 0x120CE416, AST2400_A0_SILICON_REV,
>>                           AST2400_SDRAM_BASE },
>> +    [ AST2500_EDK ]  =3D { 0x00000200, AST2500_A1_SILICON_REV,
>> +                         AST2500_SDRAM_BASE },
>=20
> Can we include the strap value from the board for completeness?
>=20
> Also, the meaning of the bits have changed from the AST2400 - they
> probably should be documented somewhere?

So you want me send to an updated version of :

	http://lists.nongnu.org/archive/html/qemu-arm/2016-06/msg00698.html

as a prereq ?=20

Now that we have done the cleanups in U-Boot, we can pull from :

https://github.com/openbmc/u-boot/blob/v2016.07-aspeed-openbmc/arch/arm/i=
nclude/asm/arch-aspeed/regs-scu.h

to get the definitions. I will add that.
=20
> Finally, checkpatch complained here too regarding the whitespace, I ran
> into the issue replacing the strap value.

ok.

>>  };
>> =20
>>  static void aspeed_init_flashes(AspeedSMCState *s, const char *flasht=
ype,
>> @@ -133,9 +136,36 @@ static const TypeInfo palmetto_bmc_type =3D {
>>      .class_init =3D palmetto_bmc_class_init,
>>  };
>> =20
>> +static void ast2500_edk_init(MachineState *machine)
>> +{
>> +    machine->cpu_model =3D "arm1176";
>> +    aspeed_init(machine, AST2500_EDK);
>> +}
>> +
>> +static void ast2500_edk_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc =3D MACHINE_CLASS(oc);
>> +
>> +    mc->desc =3D "Aspeed AST2500 EDK (ARM1176)";
>> +    mc->init =3D ast2500_edk_init;
>> +    mc->max_cpus =3D 1;
>> +    mc->no_sdcard =3D 1;
>> +    mc->no_floppy =3D 1;
>> +    mc->no_cdrom =3D 1;
>> +    mc->no_sdcard =3D 1;
>=20
> mc->no_sdcard is already assigned a couple of lines up. I think this
> may be the case for palmetto config as well...

That was a blind copy paste. I will remove the extra sdcard.

Thanks,

C.=20

> Cheers,
>=20
> Andrew
>=20
>> +    mc->no_parallel =3D 1;
>> +}
>> +
>> +static const TypeInfo ast2500_edk_type =3D {
>> +    .name =3D MACHINE_TYPE_NAME("ast2500-edk"),
>> +    .parent =3D TYPE_MACHINE,
>> +    .class_init =3D ast2500_edk_class_init,
>> +};
>> +
>>  static void aspeed_machine_init(void)
>>  {
>>      type_register_static(&palmetto_bmc_type);
>> +    type_register_static(&ast2500_edk_type);
>>  }
>> =20
>>  type_init(aspeed_machine_init)
>> diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
>> index e68807d475b7..2e6864f88790 100644
>> --- a/include/hw/arm/ast2400.h
>> +++ b/include/hw/arm/ast2400.h
>> @@ -41,4 +41,9 @@ typedef struct AST2400State {
>> =20
>>  #define AST2400_SDRAM_BASE       0x40000000
>> =20
>> +/*
>> + * for Aspeed AST2500 SOC and higher
>> + */
>> +#define AST2500_SDRAM_BASE       0x80000000
>> +
>>  #endif /* AST2400_H */

