Received: by 10.25.21.156 with SMTP id 28csp663032lfv;
        Thu, 28 Jul 2016 00:52:01 -0700 (PDT)
X-Received: by 10.200.35.44 with SMTP id a41mr56613282qta.25.1469692321448;
        Thu, 28 Jul 2016 00:52:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x142si7171990qka.115.2016.07.28.00.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 00:52:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSg6q-0004wp-TQ
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 03:52:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSg6n-0004vN-69
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:51:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSg6g-0003Ty-Ch
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:51:55 -0400
Received: from 18.mo7.mail-out.ovh.net ([188.165.56.163]:60582)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSg6g-0003Tq-2u
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 03:51:50 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id EB93D101013A
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 09:51:44 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 607395C0077;
	Thu, 28 Jul 2016 09:51:41 +0200 (CEST)
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
	<1469638018-17590-2-git-send-email-clg@kaod.org>
	<1469672053.5468.81.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9316329d-c22d-aab1-c5d9-e10ab306ffb8@kaod.org>
Date: Thu, 28 Jul 2016 09:51:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1469672053.5468.81.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 13371187295660575664
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieeigdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.56.163
Subject: Re: [Qemu-arm] [PATCH 1/6] palmetto-bmc: add a "silicon-rev"
 property at the soc level
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
X-TUID: PXNDDRmDcE8g

On 07/28/2016 04:14 AM, Andrew Jeffery wrote:
> On Wed, 2016-07-27 at 18:46 +0200, C=C3=A9dric Le Goater wrote:
>> The SCU controler holds the board revision number in its 0x7C
>> register. Let's use an alias to link a "silicon-rev" property of the
>> soc to the "silicon-rev" property of the SCU controler.
>>
>> The SDMC controler "silicon-rev" property is derived from the SCU one
>> at realize time. I did not find a better way to handle this part.
>> Links and aliases being a one-to-one relation, I could not use one of
>> them. I might wrong though.
>=20
> Are we trying to over-use the silicon-rev value (it would seem so at
> least in the face of the link/alias constraints)? We know which SDMC
> revision we need for each SoC and we'll be modelling an explicit SoC
> revision, so should we instead set a separate property on the SDMC in
> the SoCs' respective initialise functions (and leave silicon-rev to the
> SCU)?=20

This is the case. no ?=20

SCU holds the silicon-rev value. The patch adds a property alias to the=20
SCU 'silicon-rev' property at the soc level. This is convenient for the
platform to initialize the soc. This is similar to what the rpi2 does,
which goes one level in the aliasing.

Then, at initialize time, the SCU 'silicon-rev' property value is read
to initialize the SDMC controller. If we have more controllers in the=20
future needing 'silicon-rev,  we could follow the same pattern. Not=20
saying this is perfect.=20

What I would have liked to do, is to link all the 'silicon-rev' do
the SCU one. I did not find a way.

> My thought was the silicon-rev value is reflective of the SoC
> design rather than the other way around - but maybe that's splitting
> hairs.=20

ah. is your concern about which object is holding the value ? If so,
I thought that keeping it where it belongs on real HW was the better=20
option, that is in SCU, and then build from there.

> It would also be trading off a bit of ugliness in this patch for
> potential bugs if the properties get out of sync.

This is the exact the purpose of the patch ! I failed to make it feel
that way :)=20

Thanks,

C.=20

>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/ast2400.c      | 18 +++++++++++++-----
>>  hw/arm/palmetto-bmc.c |  2 ++
>>  2 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
>> index 136bf6464e1d..fa535065f765 100644
>> --- a/hw/arm/ast2400.c
>> +++ b/hw/arm/ast2400.c
>> @@ -84,8 +84,8 @@ static void ast2400_init(Object *obj)
>>      object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
>>      object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
>>      qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
>> -    qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
>> -                         AST2400_A0_SILICON_REV);
>> +    object_property_add_alias(obj, "silicon-rev", OBJECT(&s->scu),
>> +                              "silicon-rev", &error_abort);
>>      object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
>>                                "hw-strap1", &error_abort);
>>      object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
>> @@ -102,8 +102,6 @@ static void ast2400_init(Object *obj)
>>      object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
>>      object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
>>      qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
>> -    qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
>> -                         AST2400_A0_SILICON_REV);
>>  }
>> =20
>>  static void ast2400_realize(DeviceState *dev, Error **errp)
>> @@ -111,6 +109,7 @@ static void ast2400_realize(DeviceState *dev, Erro=
r **errp)
>>      int i;
>>      AST2400State *s =3D AST2400(dev);
>>      Error *err =3D NULL, *local_err =3D NULL;
>> +    uint32_t silicon_rev;
>> =20
>>      /* IO space */
>>      memory_region_init_io(&s->iomem, NULL, &ast2400_io_ops, NULL,
>> @@ -192,7 +191,16 @@ static void ast2400_realize(DeviceState *dev, Err=
or **errp)
>>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, AST2400_SPI_FLASH_BAS=
E);
>> =20
>>      /* SDMC - SDRAM Memory Controller */
>> -    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err=
);
>> +    silicon_rev =3D (uint32_t)
>> +        object_property_get_int(OBJECT(&s->scu), "silicon-rev", &err)=
;
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +
>> +    object_property_set_int(OBJECT(&s->sdmc), silicon_rev, "silicon-r=
ev", &err);
>> +    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &loc=
al_err);
>> +    error_propagate(&err, local_err);
>>      if (err) {
>>          error_propagate(errp, err);
>>          return;
>> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
>> index 54e29a865d88..1ee13d578899 100644
>> --- a/hw/arm/palmetto-bmc.c
>> +++ b/hw/arm/palmetto-bmc.c
>> @@ -74,6 +74,8 @@ static void palmetto_bmc_init(MachineState *machine)
>>                                     &error_abort);
>>      object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1=
",
>>                              &error_abort);
>> +    object_property_set_int(OBJECT(&bmc->soc), AST2400_A0_SILICON_REV=
,
>> +                            "silicon-rev", &error_abort);
>>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>>                               &error_abort);
>> =20

