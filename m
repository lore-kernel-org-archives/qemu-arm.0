Received: by 10.25.21.96 with SMTP id l93csp386469lfi;
        Fri, 1 Jul 2016 09:44:54 -0700 (PDT)
X-Received: by 10.237.53.51 with SMTP id a48mr7341180qte.54.1467391494165;
        Fri, 01 Jul 2016 09:44:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x63si2849960qke.12.2016.07.01.09.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 09:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ1Yj-0002NI-Jw
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 12:44:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bJ1Ye-0002My-SO
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 12:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bJ1Ya-0000vR-Ll
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 12:44:47 -0400
Received: from 9.mo53.mail-out.ovh.net ([87.98.186.128]:52229)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bJ1Ya-0000v4-B9
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 12:44:44 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 50E26FF9510
	for <qemu-arm@nongnu.org>; Fri,  1 Jul 2016 18:44:42 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id 9310A620075;
	Fri,  1 Jul 2016 18:44:35 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-8-git-send-email-clg@kaod.org>
	<CAFEAcA_8+XubTSH2sstoyoXi6s1DkZySckyUqrt0BGiMALC4+Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d63ffd58-7006-5eb1-bbfa-fa62fb1797be@kaod.org>
Date: Fri, 1 Jul 2016 18:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_8+XubTSH2sstoyoXi6s1DkZySckyUqrt0BGiMALC4+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 11383411011802270635
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudelgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.186.128
Subject: Re: [Qemu-arm] [PATCH v5 7/9] ast2400: add SPI flash slaves
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
X-TUID: pz1A4fxmoT2Z

On 07/01/2016 06:24 PM, Peter Maydell wrote:
> On 28 June 2016 at 19:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> Each controller on the ast2400 has a memory range on which it maps its
>> flash module slaves. Each slave is assigned a memory segment for its
>> mapping that can be changed at bootime with the Segment Address
>> Register. This is not supported in the current implementation so we
>> are using the defaults provided by the specs.
>>
>> Each SPI flash slave can then be accessed in two modes: Command and
>> User. When in User mode, accesses to the memory segment of the slaves
>> are translated in SPI transfers. When in Command mode, the HW
>> generates the SPI commands automatically and the memory segment is
>> accessed as if doing a MMIO. Other SPI controllers call that mode
>> linear addressing mode.
>>
>> For this purpose, we are adding below each crontoller an array of
>> structs gathering for each SPI flash module, a segment rank, a
>> MemoryRegion to handle the memory accesses and the associated SPI
>> slave device, which should be a m25p80.
>>
>> Only the User mode is supported for now but we are preparing ground
>> for the Command mode. The framework is sufficient to support Linux.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
>> +/*
>> + * Default segments mapping addresses and size for each slave per
>> + * controller. These can be changed when board is initialized with th=
e
>> + * Segment Address Registers but they don't seem do be used on the
>> + * field.
>> + */
>> +static const AspeedSegments aspeed_segments_legacy[] =3D {
>> +    { 0x10000000, 32 * 1024 * 1024 },
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
>=20
> If I understand this correctly, and the Segment Address Registers
> are part of the SMC controller, then eventually if we want to
> implement making these writable then the correct approach is
> probably to have a container memory region which the SMC controller
> provides to the board (and which the board then maps into the
> system memory space), and then the controller is responsible for
> mapping and unmapping the individual memory regions inside that
> container. This is basically how we do PCI controllers, which also
> allow guests to write to PCI BARs to map and unmap bits of memory.

OK. I will take a look at the approach. The default setting seems to=20
satisfy the different implementations I know of.  =20

> This will be fine for now, though.
>=20
>>  static bool aspeed_smc_is_ce_stop_active(const AspeedSMCState *s, int=
 cs)
>> @@ -237,6 +353,8 @@ static void aspeed_smc_realize(DeviceState *dev, E=
rror **errp)
>>      AspeedSMCState *s =3D ASPEED_SMC(dev);
>>      AspeedSMCClass *mc =3D ASPEED_SMC_GET_CLASS(s);
>>      int i;
>> +    char name[32];
>> +    hwaddr offset =3D 0;
>>
>>      s->ctrl =3D mc->ctrl;
>>
>> @@ -270,6 +388,32 @@ static void aspeed_smc_realize(DeviceState *dev, =
Error **errp)
>>      memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>>                            s->ctrl->name, ASPEED_SMC_R_MAX * 4);
>>      sysbus_init_mmio(sbd, &s->mmio);
>> +
>> +    /*
>> +     * Memory region where flash modules are remapped
>> +     */
>> +    snprintf(name, sizeof(name), "%s.flash", s->ctrl->name);
>> +
>> +    memory_region_init_io(&s->mmio_flash, OBJECT(s),
>> +                          &aspeed_smc_flash_default_ops, s, name,
>> +                          s->ctrl->mapping_window_size);
>> +    sysbus_init_mmio(sbd, &s->mmio_flash);
>> +
>> +    s->flashes =3D g_malloc0(sizeof(AspeedSMCFlash) * s->num_cs);
>=20
> This should be g_new0(AspeedSMCFlash, s->num_cs);  -- multiplying
> in a g_malloc0() is usually a sign you should use g_new0 instead.

ah yes. I have changed that back and forth and kept the wrong one ...

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>=20
> so I'll just fix that when I put the series in target-arm.next.

I have some extra patches to use a rom device and boot from flash0.
That is for next week.=20

Thanks,

C.


=20
> thanks
> -- PMM
>=20

