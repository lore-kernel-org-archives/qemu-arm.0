Received: by 10.25.21.96 with SMTP id l93csp1053585lfi;
        Fri, 24 Jun 2016 06:42:58 -0700 (PDT)
X-Received: by 10.55.183.129 with SMTP id h123mr4712198qkf.105.1466775778414;
        Fri, 24 Jun 2016 06:42:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6si4953383qtb.44.2016.06.24.06.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 06:42:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGRNp-0001Qv-Nr
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 09:42:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGRNl-0001Ll-2e
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 09:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bGRNf-0004Bp-0U
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 09:42:52 -0400
Received: from 8.mo1.mail-out.ovh.net ([178.33.110.239]:36973)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bGRNe-0004Bi-M2
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 09:42:46 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id C37ACFF976D
	for <qemu-arm@nongnu.org>; Fri, 24 Jun 2016 15:42:45 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 40A522C0079;
	Fri, 24 Jun 2016 15:42:39 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
	<1466699607-30406-5-git-send-email-clg@kaod.org>
	<CAFEAcA-5cN57rrcCw=dXbdDE+Pk33pG=8=+LjvXht8GMy_4vcg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dd402a76-cc73-8498-d2a7-134aaae5ecf1@kaod.org>
Date: Fri, 24 Jun 2016 15:42:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-5cN57rrcCw=dXbdDE+Pk33pG=8=+LjvXht8GMy_4vcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 4095179439995194283
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdekgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.110.239
Subject: Re: [Qemu-arm] [PATCH v3 4/5] ast2400: create SPI flash slaves
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TPb6O1m3f0jV

On 06/23/2016 08:48 PM, Peter Maydell wrote:
> On 23 June 2016 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> A set of SPI flash slaves is attached under the flash controllers of
>> the palmetto platform. "n25q256a" flash modules are used for the BMC
>> and "mx25l25635e" for the host. These types are common in the
>> OpenPower ecosystem.
>>
>> The segment addresses used for the memory mappings are the defaults
>> provided by the specs. They can be changed with the Segment Address
>> Register but this is not supported in the current implementation.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>=20
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index d97c077565c3..6be911ed36d0 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -98,13 +98,32 @@
>>  #define R_SPI_MISC_CRTL   (0x10 / 4)
>>  #define R_SPI_TIMINGS     (0x14 / 4)
>>
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
>>
>>  static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
>> @@ -217,6 +236,8 @@ static const MemoryRegionOps aspeed_smc_ops =3D {
>>      .valid.unaligned =3D true,
>>  };
>>
>> +static const MemoryRegionOps aspeed_smc_flash_ops;
>> +
>>  static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>>  {
>>      SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>> @@ -254,6 +275,27 @@ static void aspeed_smc_realize(DeviceState *dev, =
Error **errp)
>>      memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>>                            s->ctrl->name, ASPEED_SMC_R_MAX * 4);
>>      sysbus_init_mmio(sbd, &s->mmio);
>> +
>> +    s->flashes =3D g_new0(AspeedSMCFlashState *, s->num_cs);
>> +
>> +    for (i =3D 0; i < s->num_cs; ++i) {
>> +        Object *obj =3D object_new(TYPE_ASPEED_SMC_FLASH);
>> +        AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(obj);
>> +        char name[32];
>> +
>> +        s->flashes[i] =3D fl;
>> +
>> +        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
>> +
>> +        fl->id =3D i;
>> +        fl->controller =3D s;
>> +        fl->size =3D s->ctrl->segments[i].size;
>> +
>> +        memory_region_init_io(&fl->mmio, obj, &aspeed_smc_flash_ops, =
fl, name,
>> +                              fl->size);
>> +        sysbus_init_mmio(SYS_BUS_DEVICE(fl), &fl->mmio);
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(fl), 0, s->ctrl->segments[i].a=
ddr);
>=20
> Device code shouldn't call sysbus_mmio_map() -- the system memory map i=
s
> the board's responsibility.

ok. It's here because it was easy to reuse the address segments[i].addr w=
hich=20
should not change, even if is reconfigurable at run time by the guest.

I will rethink the structures and find way.

Thanks,

C.
