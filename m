Received: by 10.25.21.96 with SMTP id l93csp1640935lfi;
        Mon, 4 Jul 2016 11:12:28 -0700 (PDT)
X-Received: by 10.200.55.219 with SMTP id e27mr21329213qtc.93.1467655948243;
        Mon, 04 Jul 2016 11:12:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n14si2820924qtb.0.2016.07.04.11.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 11:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK8M7-0004wN-Jc
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 14:12:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK8M3-0004w1-RE
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 14:12:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK8Lz-0001E1-JP
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 14:12:22 -0400
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:58035)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK8Lz-0001Dm-AB
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 14:12:19 -0400
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 3676AFFCD25
	for <qemu-arm@nongnu.org>; Mon,  4 Jul 2016 20:12:18 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player789.ha.ovh.net (Postfix) with ESMTPSA id 7C06E260073;
	Mon,  4 Jul 2016 20:12:12 +0200 (CEST)
To: "mar.krzeminski" <mar.krzeminski@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <daf14775-cbd6-3f5d-a384-e50b1dc7830b@kaod.org>
Date: Mon, 4 Jul 2016 20:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <577AA388.3060100@gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 12034181157794778027
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.251.80
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
X-TUID: 8p80W16c5e4P

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

yes. see this patch :

	http://lists.nongnu.org/archive/html/qemu-devel/2016-06/msg08229.html

	/* CEx Control Register */
	#define R_CTRL0           (0x10 / 4)
	#define   CTRL_CMD_SHIFT           16
	#define   CTRL_CMD_MASK            0xff


> In this series you hack this behaviour and you do direct access to file=
.

It is true it is not very respectful of the m25p80 interface.

> IMHO you should emulate sending such commands in SPI controller
> model.

I will give it a try. I don't think the alternative is a complex=20
change anyhow.

Thanks,

C.

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

