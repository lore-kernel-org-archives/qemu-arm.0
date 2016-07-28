Received: by 10.25.21.156 with SMTP id 28csp646730lfv;
        Thu, 28 Jul 2016 00:04:40 -0700 (PDT)
X-Received: by 10.55.12.1 with SMTP id 1mr40562725qkm.136.1469689480687;
        Thu, 28 Jul 2016 00:04:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z186si7091575qke.27.2016.07.28.00.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 00:04:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSfN2-0007Ee-4s
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 03:04:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSfMw-0007C1-Us
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:04:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSfMq-0002Nm-Qc
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:04:33 -0400
Received: from 4.mo7.mail-out.ovh.net ([178.32.122.254]:42669)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSfMq-0002NO-GV
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:04:28 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6645DFFCDE3
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 09:04:27 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 099935C007F;
	Thu, 28 Jul 2016 09:04:23 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-3-git-send-email-clg@kaod.org>
	<1469681289.5468.101.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <29dfa786-0d50-50fb-ad91-00e7d14c36d2@kaod.org>
Date: Thu, 28 Jul 2016 09:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1469681289.5468.101.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 12572642785622657968
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieeigdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.122.254
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
X-TUID: /k/R7mzGuKoU

On 07/28/2016 06:48 AM, Andrew Jeffery wrote:
> On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
>> This is mostly a name replacement to prepare ground for other socs
>> specificities. It also adds a specific TypeInfo struct for the
>> palmetto_bmc board with a custom initialization for the same reason.
>=20
> I think we should rename the file, it feels a bit confusing having the
> ast2500 machine glue (added later in the series) in palmetto-bmc.c. You
> mentioned in the cover letter that moving it would break history but it
> isn't necessarily so, you can follow renames in the logs with `git log
> --follow`. It's a git switch that feels like it should be a default but
> isn't :/

Ah. nice option indeed :) I was not aware of it.

> Maybe create a commit that renames the file, then add these changes
> after?

yes. rename then add changes, I will do that in v2.

Thanks,

C.=20

> Andrew
>=20
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>
>>  Should we change the name of the file to aspeed.c ? I am not found of
>>  such renames as it is then difficult to track code changes.
>>
>>  hw/arm/palmetto-bmc.c | 54 ++++++++++++++++++++++++++++++++++--------=
---------
>>  1 file changed, 36 insertions(+), 18 deletions(-)
>>
>> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
>> index 1ee13d578899..f80a15733864 100644
>> --- a/hw/arm/palmetto-bmc.c
>> +++ b/hw/arm/palmetto-bmc.c
>> @@ -21,19 +21,19 @@
>>  #include "sysemu/block-backend.h"
>>  #include "sysemu/blockdev.h"
>> =20
>> -static struct arm_boot_info palmetto_bmc_binfo =3D {
>> +static struct arm_boot_info aspeed_binfo =3D {
>>      .loader_start =3D AST2400_SDRAM_BASE,
>>      .board_id =3D 0,
>>      .nb_cpus =3D 1,
>>  };
>> =20
>> -typedef struct PalmettoBMCState {
>> +typedef struct AspeedBoardState {
>>      AST2400State soc;
>>      MemoryRegion ram;
>> -} PalmettoBMCState;
>> +} AspeedBoardState;
>> =20
>> -static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *=
flashtype,
>> -                                      Error **errp)
>> +static void aspeed_init_flashes(AspeedSMCState *s, const char *flasht=
ype,
>> +                                Error **errp)
>>  {
>>      int i ;
>> =20
>> @@ -58,11 +58,11 @@ static void palmetto_bmc_init_flashes(AspeedSMCSta=
te *s, const char *flashtype,
>>      }
>>  }
>> =20
>> -static void palmetto_bmc_init(MachineState *machine)
>> +static void aspeed_init(MachineState *machine)
>>  {
>> -    PalmettoBMCState *bmc;
>> +    AspeedBoardState *bmc;
>> =20
>> -    bmc =3D g_new0(PalmettoBMCState, 1);
>> +    bmc =3D g_new0(AspeedBoardState, 1);
>>      object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
>>      object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->so=
c),
>>                                &error_abort);
>> @@ -79,19 +79,26 @@ static void palmetto_bmc_init(MachineState *machin=
e)
>>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>>                               &error_abort);
>> =20
>> -    palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort=
);
>> -    palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_ab=
ort);
>> +    aspeed_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
>> +    aspeed_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort);
>> +
>> +    aspeed_binfo.kernel_filename =3D machine->kernel_filename;
>> +    aspeed_binfo.initrd_filename =3D machine->initrd_filename;
>> +    aspeed_binfo.kernel_cmdline =3D machine->kernel_cmdline;
>> +    aspeed_binfo.ram_size =3D ram_size;
>> +    arm_load_kernel(ARM_CPU(first_cpu), &aspeed_binfo);
>> +}
>> =20
>> -    palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
>> -    palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
>> -    palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
>> -    palmetto_bmc_binfo.ram_size =3D ram_size;
>> -    arm_load_kernel(ARM_CPU(first_cpu), &palmetto_bmc_binfo);
>> +static void palmetto_bmc_init(MachineState *machine)
>> +{
>> +    aspeed_init(machine);
>>  }
>> =20
>> -static void palmetto_bmc_machine_init(MachineClass *mc)
>> +static void palmetto_bmc_class_init(ObjectClass *oc, void *data)
>>  {
>> -    mc->desc =3D "OpenPOWER Palmetto BMC";
>> +    MachineClass *mc =3D MACHINE_CLASS(oc);
>> +
>> +    mc->desc =3D "OpenPOWER Palmetto BMC (ARM926EJ-S)";
>>      mc->init =3D palmetto_bmc_init;
>>      mc->max_cpus =3D 1;
>>      mc->no_sdcard =3D 1;
>> @@ -101,4 +108,15 @@ static void palmetto_bmc_machine_init(MachineClas=
s *mc)
>>      mc->no_parallel =3D 1;
>>  }
>> =20
>> -DEFINE_MACHINE("palmetto-bmc", palmetto_bmc_machine_init);
>> +static const TypeInfo palmetto_bmc_type =3D {
>> +    .name =3D MACHINE_TYPE_NAME("palmetto-bmc"),
>> +    .parent =3D TYPE_MACHINE,
>> +    .class_init =3D palmetto_bmc_class_init,
>> +};
>> +
>> +static void aspeed_machine_init(void)
>> +{
>> +    type_register_static(&palmetto_bmc_type);
>> +}
>> +
>> +type_init(aspeed_machine_init)

