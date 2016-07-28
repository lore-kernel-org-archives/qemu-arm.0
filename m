Received: by 10.25.21.156 with SMTP id 28csp646250lfv;
        Thu, 28 Jul 2016 00:03:30 -0700 (PDT)
X-Received: by 10.55.152.135 with SMTP id a129mr40663068qke.199.1469689409936;
        Thu, 28 Jul 2016 00:03:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o10si7078948qki.98.2016.07.28.00.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 00:03:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSfLt-0005xu-5m
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 03:03:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSfJy-00045A-6C
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:01:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSfJs-0001bR-Aj
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:01:29 -0400
Received: from 8.mo7.mail-out.ovh.net ([46.105.77.114]:53901)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSfJs-0001b7-0K
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:01:24 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id F28A3100CCEB
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 09:01:22 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id B13D35C0083;
	Thu, 28 Jul 2016 09:01:19 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-5-git-send-email-clg@kaod.org>
	<1469673943.5468.94.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <db2531ba-0514-a153-6dcc-9c0c4cd44eee@kaod.org>
Date: Thu, 28 Jul 2016 09:01:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1469673943.5468.94.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 12520569916794702768
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieeigdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.77.114
Subject: Re: [Qemu-arm] [PATCH 4/6] palmetto-bmc: add board specific
 configuration
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
X-TUID: EaeI0JjuVZIO

On 07/28/2016 04:45 AM, Andrew Jeffery wrote:
> On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
>> aspeed_init() now uses a board identifier to customize some values
>> specific to the board, ram base, board revision number, etc.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Looks okay to me, some minor comments below:
>=20
>> ---
>>  hw/arm/palmetto-bmc.c | 34 ++++++++++++++++++++++++++--------
>>  1 file changed, 26 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
>> index 8a3ff5568575..cd8aa59756b9 100644
>> --- a/hw/arm/palmetto-bmc.c
>> +++ b/hw/arm/palmetto-bmc.c
>> @@ -22,8 +22,6 @@
>>  #include "sysemu/blockdev.h"
>> =20
>>  static struct arm_boot_info aspeed_binfo =3D {
>> -    .loader_start =3D AST2400_SDRAM_BASE,
>> -    .board_id =3D 0,
>>      .nb_cpus =3D 1,
>>  };
>> =20
>> @@ -32,6 +30,21 @@ typedef struct AspeedBoardState {
>>      MemoryRegion ram;
>>  } AspeedBoardState;
>> =20
>> +typedef struct AspeedBoardConfig {
>> +    uint32_t hw_strap1;
>> +    uint32_t silicon_rev;
>> +    hwaddr sdram_base;
>> +} AspeedBoardConfig;
>> +
>> +enum {
>> +    PALMETTO_BMC
>> +};
>> +
>> +static const AspeedBoardConfig aspeed_boards[] =3D {
>> +    [ PALMETTO_BMC ] =3D { 0x120CE416, AST2400_A0_SILICON_REV,
>> +                         AST2400_SDRAM_BASE },
>=20
> I was playing around before and my test scripts noticed checkpatch
> complained about the spacing with the array indexing: "[PALMETTO_BMC]"
> fixed the error.

sigh. I am not sure I checkpatched this one.

>> +};
>> +
>>  static void aspeed_init_flashes(AspeedSMCState *s, const char *flasht=
ype,
>>                                  Error **errp)
>>  {
>> @@ -58,7 +71,7 @@ static void aspeed_init_flashes(AspeedSMCState *s, c=
onst char *flashtype,
>>      }
>>  }
>> =20
>> -static void aspeed_init(MachineState *machine)
>> +static void aspeed_init(MachineState *machine, int board_model)
>=20
> I feel like we should pass a "struct AspeedBoardConfig *" rather than
> the "int board_model", cleaning up the repeated indexing into
> aspeed_boards the body. Thoughts? </bikeshed>

yep. I agree. Will change that.

Thanks,

C.=20


> Andrew
>=20
>>  {
>>      AspeedBoardState *bmc;
>> =20
>> @@ -68,13 +81,16 @@ static void aspeed_init(MachineState *machine)
>>                                &error_abort);
>> =20
>>      memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_=
size);
>> -    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BA=
SE,
>> +    memory_region_add_subregion(get_system_memory(),
>> +                                aspeed_boards[board_model].sdram_base=
,
>>                                  &bmc->ram);
>>      object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&=
bmc->ram),
>>                                     &error_abort);
>> -    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1=
",
>> -                            &error_abort);
>> -    object_property_set_int(OBJECT(&bmc->soc), AST2400_A0_SILICON_REV=
,
>> +    object_property_set_int(OBJECT(&bmc->soc),
>> +                            aspeed_boards[board_model].hw_strap1,
>> +                            "hw-strap1", &error_abort);
>> +    object_property_set_int(OBJECT(&bmc->soc),
>> +                            aspeed_boards[board_model].silicon_rev,
>>                              "silicon-rev", &error_abort);
>>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>>                               &error_abort);
>> @@ -86,13 +102,15 @@ static void aspeed_init(MachineState *machine)
>>      aspeed_binfo.initrd_filename =3D machine->initrd_filename;
>>      aspeed_binfo.kernel_cmdline =3D machine->kernel_cmdline;
>>      aspeed_binfo.ram_size =3D ram_size;
>> +    aspeed_binfo.loader_start =3D aspeed_boards[board_model].sdram_ba=
se,
>> +    aspeed_binfo.board_id =3D aspeed_boards[board_model].silicon_rev,
>>      arm_load_kernel(ARM_CPU(first_cpu), &aspeed_binfo);
>>  }
>> =20
>>  static void palmetto_bmc_init(MachineState *machine)
>>  {
>>      machine->cpu_model =3D "arm926";
>> -    aspeed_init(machine);
>> +    aspeed_init(machine, PALMETTO_BMC);
>>  }
>> =20
>>  static void palmetto_bmc_class_init(ObjectClass *oc, void *data)

