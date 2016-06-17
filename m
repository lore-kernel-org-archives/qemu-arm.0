Received: by 10.25.21.96 with SMTP id l93csp191501lfi;
        Fri, 17 Jun 2016 03:27:46 -0700 (PDT)
X-Received: by 10.237.35.152 with SMTP id j24mr1251559qtc.96.1466159266032;
        Fri, 17 Jun 2016 03:27:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q60si24076525qtd.6.2016.06.17.03.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 03:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDr05-0004IH-Gc
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 06:27:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDr01-0004I0-Uv
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:27:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDqzx-0001v7-SQ
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:27:41 -0400
Received: from 2.mo53.mail-out.ovh.net ([178.33.254.39]:57497)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bDqzx-0001uu-JJ
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:27:37 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 6088AFF9499
	for <qemu-arm@nongnu.org>; Fri, 17 Jun 2016 12:27:36 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 980056200AA;
	Fri, 17 Jun 2016 12:27:29 +0200 (CEST)
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1466152555-10406-1-git-send-email-clg@kaod.org>
	<1466152555-10406-4-git-send-email-clg@kaod.org>
	<fdae95d6-1ab4-c2a7-d95e-148c86209e53@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5763D090.9060602@kaod.org>
Date: Fri, 17 Jun 2016 12:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <fdae95d6-1ab4-c2a7-d95e-148c86209e53@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 15030763759925300179
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrledtgddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.254.39
Subject: Re: [Qemu-arm] [PATCH 3/4] ast2400: create SPI flash slaves
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yhawNDh1gsTn

On 06/17/2016 12:11 PM, Paolo Bonzini wrote:
>=20
>=20
> On 17/06/2016 10:35, C=C3=A9dric Le Goater wrote:
>> A set of SPI flash slaves is attached under the flash controllers of
>> the palmetto platform. "n25q256a" flash modules are used for the BMC
>> and "mx25l25635e" for the host. These types are common in the
>> OpenPower ecosystem.
>>
>> The segment addresses used for the memory mappings are the defaults
>> provided by the specs. They can be changed with the Segment Address
>> Register but this is not supported in the current implementation.
>=20
> Do you mind if we fix the /* FIXME */ comment, regarding adding a drive
> property to m25p80 instead of using drive_get_next?  I'll send a patch
> shortly.

Fine with me. That was on my TODO list. I will give it a try.

Thanks,

C.


>=20
> Paolo
>=20
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>  hw/arm/palmetto-bmc.c       |  3 +++
>>  hw/ssi/aspeed_smc.c         | 60 ++++++++++++++++++++++++++++++++++++=
++++++---
>>  include/hw/ssi/aspeed_smc.h | 10 ++++++++
>>  3 files changed, 70 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
>> index a51d960510ee..0aed97a7d9cf 100644
>> --- a/hw/arm/palmetto-bmc.c
>> +++ b/hw/arm/palmetto-bmc.c
>> @@ -47,6 +47,9 @@ static void palmetto_bmc_init(MachineState *machine)
>>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>>                               &error_abort);
>> =20
>> +    aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
>> +    aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abor=
t);
>> +
>>      palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
>>      palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
>>      palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 6a02906c8f97..f7ef69418c0c 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -98,13 +98,32 @@
>>  #define R_SPI_MISC_CRTL   (0x10 / 4)
>>  #define R_SPI_TIMINGS     (0x14 / 4)
>> =20
>> +/*
>> + * Default segments mappings and size for each slave
>> + */
>> +static const AspeedSegments aspeed_segments_legacy[] =3D {
>> +    { 0x14000000, 32 * 1024 * 1024 },
>> +};
>> +
>> +static const AspeedSegments aspeed_segments_fmc[] =3D {
>> +    { 0x20000000, 64 * 1024 * 1024 },
>> +    { 0x24000000, 32 * 1024 * 1024 },
>> +    { 0x26000000, 32 * 1024 * 1024 },
>> +    { 0x28000000, 32 * 1024 * 1024 },
>> +    { 0x2A000000, 32 * 1024 * 1024 }
>> +};
>> +
>> +static const AspeedSegments aspeed_segments_spi[] =3D {
>> +    { 0x30000000, 64 * 1024 * 1024 },
>> +};
>> +
>>  static const AspeedSMCController controllers[] =3D {
>>      { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
>> -      CONF_ENABLE_W0, 5 },
>> +      CONF_ENABLE_W0, 5, aspeed_segments_legacy },
>>      { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
>> -      CONF_ENABLE_W0, 5 },
>> +      CONF_ENABLE_W0, 5, aspeed_segments_fmc },
>>      { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
>> -      SPI_CONF_ENABLE_W0, 1 },
>> +      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi },
>>  };
>> =20
>>  static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
>> @@ -254,6 +273,8 @@ static int aspeed_smc_init(SysBusDevice *sbd)
>>      memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>>                            s->ctrl->name, ASPEED_SMC_R_MAX * 4);
>>      sysbus_init_mmio(sbd, &s->mmio);
>> +
>> +    s->flashes =3D g_new0(AspeedSMCFlashState *, s->num_cs);
>>      return 0;
>>  }
>> =20
>> @@ -395,3 +416,36 @@ static void aspeed_smc_flash_register_types(void)
>>  }
>> =20
>>  type_init(aspeed_smc_flash_register_types)
>> +
>> +void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype=
,
>> +                             Error **errp)
>> +{
>> +    int i ;
>> +    char name[32];
>> +
>> +    for (i =3D 0; i < s->num_cs; ++i) {
>> +        Object *obj =3D object_new(TYPE_ASPEED_SMC_FLASH);
>> +        AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(obj);
>> +        qemu_irq cs_line;
>> +
>> +        s->flashes[i] =3D fl;
>> +
>> +        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
>> +
>> +        fl->id =3D i;
>> +        fl->controller =3D s;
>> +        fl->size =3D s->ctrl->segments[i].size;
>> +
>> +        /* backing region */
>> +        memory_region_init_io(&fl->mmio, obj, &aspeed_smc_flash_ops, =
fl, name,
>> +                              fl->size);
>> +        sysbus_init_mmio(SYS_BUS_DEVICE(fl), &fl->mmio);
>> +
>> +        /* SPI Flash module */
>> +        fl->flash =3D ssi_create_slave(s->spi, flashtype);
>> +        cs_line =3D qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0)=
;
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
>> +
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(fl), 0, s->ctrl->segments[i].a=
ddr);
>> +    }
>> +}
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index abd0005b01c2..2636c775c90f 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -43,6 +43,11 @@ typedef struct AspeedSMCFlashState {
>>  #define ASPEED_SMC_FLASH(obj) \
>>      OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
>> =20
>> +typedef struct AspeedSegments {
>> +    hwaddr addr;
>> +    uint32_t size;
>> +} AspeedSegments;
>> +
>>  typedef struct AspeedSMCController {
>>      const char *name;
>>      uint8_t r_conf;
>> @@ -51,6 +56,7 @@ typedef struct AspeedSMCController {
>>      uint8_t r_timings;
>>      uint8_t conf_enable_w0;
>>      uint8_t max_slaves;
>> +    const AspeedSegments *segments;
>>  } AspeedSMCController;
>> =20
>>  #define TYPE_ASPEED_SMC "aspeed.smc"
>> @@ -90,6 +96,10 @@ typedef struct AspeedSMCState {
>>      uint8_t r_ctrl0;
>>      uint8_t r_timings;
>>      uint8_t conf_enable_w0;
>> +
>> +    AspeedSMCFlashState **flashes;
>>  } AspeedSMCState;
>> =20
>> +extern void aspeed_smc_init_flashes(AspeedSMCState *s, const char *fl=
ashtype,
>> +                                    Error **errp);
>>  #endif /* ASPEED_SMC_H */
>>

