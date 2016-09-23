Received: by 10.80.163.71 with SMTP id 65csp307361edn;
        Fri, 23 Sep 2016 01:10:11 -0700 (PDT)
X-Received: by 10.200.40.91 with SMTP id 27mr6369133qtr.46.1474618210988;
        Fri, 23 Sep 2016 01:10:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18si4368253qtc.24.2016.09.23.01.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 01:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnLYg-0000M4-9a
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 04:10:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bnKm4-0000Wc-Pk
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 03:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bnKm1-0000yE-IY
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 03:19:56 -0400
Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171]:57796)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bnKm1-0000y3-80
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 03:19:53 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 55C06FFAAE8
	for <qemu-arm@nongnu.org>; Fri, 23 Sep 2016 09:19:51 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id B1B553C0091;
	Fri, 23 Sep 2016 09:19:45 +0200 (CEST)
To: "mar.krzeminski" <mar.krzeminski@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2c52c156-2a32-b437-acd2-af13faaef55d@kaod.org>
Date: Fri, 23 Sep 2016 09:19:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <577AA388.3060100@gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 15534885440936446891
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrtdeigdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.49.171
Subject: Re: [Qemu-arm] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
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
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EVOcVmD9PPqr

Hello,

On 07/04/2016 07:57 PM, mar.krzeminski wrote:
>=20
>=20
> W dniu 04.07.2016 o 14:18, C=C3=A9dric Le Goater pisze:
>> Some SPI controllers, such as the Aspeed AST2400, have a mode in which
>> accesses to the flash content are no different than doing MMIOs. The
>> controller generates all the necessary commands to load (or store)
>> data in memory.
>>
>> To emulate such a behavior, we need to have access to the underlying
>> storage of the flash object. The purpose of the routine is to set the
>> storage of a preinitialized SPI flash object, which can then be used
>> by the object itself but also by a SPI controller to handled the
>> MMIOs.
> Hi,
>=20
> I am not sure if this approach is correct. I can not find any datasheet
> to this SPI controller, but as you mentioned in first paragraph, contro=
ller
> generates all commands (probably ones are somehow configurable).
> In this series you hack this behaviour and you do direct access to file=
.
> IMHO you should emulate sending such commands in SPI controller
> model.

I took some time to implement what you proposed, that is to emulate all=20
the SPI commands needed to handle the read access. This is easily tested=20
through the monitor. Looks good.

But the goal is to boot from the device, so I added a memory region alias=
=20
at 0 to trigger the flash module mmios at boot time, as this is where=20
u-boot expects to be.=20

and I fell in this trap :/

	aspeed_smc_flash_read: To 0x0 of size 1: 0xbe mode:0
	Bad ram pointer (nil)
	Aborted (core dumped)

There is a failure in get_page_addr_code(), possibly because qemu uses
byte per byte reads of the code (cpu_ldub_code). But this is beyond my=20
understanding of qemu's internal.


It seems that we do need a ROM. This is how firmwares are handled, with=20
a load_image_targphys(), and also the pflash devices, through a ROM devic=
e=20
region.


The proposal below allows to modify the backing region of the flash devic=
e
model for this purpose. A ROM device region can be used to enable booting=
=20
from the device. It also allows some shortcuts in the model, like reading=
=20
directly from the storage for the benefit of speed. This is what Peter=20
Crosthwaite mentioned in a previous email. But this is not the primary=20
use. Being able to use a ROM memory region is.

Shall I resend ? or are there strong objections ?=20

Thanks,

C.=20



> Thanks,
> Marcin
>=20
>> This is sufficient to support read only accesses. For writes, we would
>> certainly need to externalize flash_write8() routine.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>   hw/block/m25p80.c        | 14 +++++++++++++-
>>   include/hw/block/flash.h |  2 ++
>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index aa964280beab..fec0fd4c2228 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -29,6 +29,7 @@
>>   #include "qemu/bitops.h"
>>   #include "qemu/log.h"
>>   #include "qapi/error.h"
>> +#include "hw/block/flash.h"
>>     #ifndef M25P80_ERR_DEBUG
>>   #define M25P80_ERR_DEBUG 0
>> @@ -1152,7 +1153,11 @@ static void m25p80_realize(SSISlave *ss, Error =
**errp)
>>         if (s->blk) {
>>           DB_PRINT_L(0, "Binding to IF_MTD drive\n");
>> -        s->storage =3D blk_blockalign(s->blk, s->size);
>> +
>> +        /* using an external storage. see m25p80_create_rom() */
>> +        if (!s->storage) {
>> +            s->storage =3D blk_blockalign(s->blk, s->size);
>> +        }
>>             if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->size=
) {
>>               error_setg(errp, "failed to read the initial flash conte=
nt");
>> @@ -1259,3 +1264,10 @@ static void m25p80_register_types(void)
>>   }
>>     type_init(m25p80_register_types)
>> +
>> +void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom)
>> +{
>> +    Flash *s =3D M25P80(dev);
>> +
>> +    s->storage =3D memory_region_get_ram_ptr(rom);
>> +}
>> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
>> index 50ccbbcf1352..9d780f4ae0c9 100644
>> --- a/include/hw/block/flash.h
>> +++ b/include/hw/block/flash.h
>> @@ -61,4 +61,6 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
>>   void ecc_reset(ECCState *s);
>>   extern VMStateDescription vmstate_ecc_state;
>>   +void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom);
>> +
>>   #endif
>=20

