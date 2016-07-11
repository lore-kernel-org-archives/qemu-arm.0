Received: by 10.25.21.156 with SMTP id 28csp1557624lfv;
        Mon, 11 Jul 2016 09:37:47 -0700 (PDT)
X-Received: by 10.55.58.68 with SMTP id h65mr12088310qka.9.1468255066979;
        Mon, 11 Jul 2016 09:37:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m67si2208634qkc.143.2016.07.11.09.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 09:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMeDK-0006Dx-Fa
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 12:37:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bMeDF-0006DP-V9
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 12:37:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bMeDB-0007mV-Jx
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 12:37:40 -0400
Received: from 3.mo68.mail-out.ovh.net ([46.105.58.60]:40222)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bMeDA-0007mG-Nw
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 12:37:37 -0400
Received: from player788.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id 6B589FF8FE8
	for <qemu-arm@nongnu.org>; Mon, 11 Jul 2016 18:37:35 +0200 (CEST)
Received: from [9.101.4.42] (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player788.ha.ovh.net (Postfix) with ESMTPSA id 1DA2418007F;
	Mon, 11 Jul 2016 18:37:25 +0200 (CEST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	"mar.krzeminski" <mar.krzeminski@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
	<CAPokK=rK84UCNOg8K1JBOAZX6wM=YpN5ievuSwntgjNerr-b8g@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c11656cc-e5f7-68ff-dbeb-afb34bfb1497@kaod.org>
Date: Mon, 11 Jul 2016 18:37:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=rK84UCNOg8K1JBOAZX6wM=YpN5ievuSwntgjNerr-b8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 14649928117143178230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrfeehgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.58.60
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5bZrzrjx3pOF

Hello,

On 07/10/2016 01:38 AM, Peter Crosthwaite wrote:
> On Mon, Jul 4, 2016 at 10:57 AM, mar.krzeminski
> <mar.krzeminski@gmail.com> wrote:
>>
>>
>> W dniu 04.07.2016 o 14:18, C=C3=A9dric Le Goater pisze:
>>>
>>> Some SPI controllers, such as the Aspeed AST2400, have a mode in whic=
h
>>> accesses to the flash content are no different than doing MMIOs. The
>>> controller generates all the necessary commands to load (or store)
>>> data in memory.
>>>
>>> To emulate such a behavior, we need to have access to the underlying
>>> storage of the flash object. The purpose of the routine is to set the
>>> storage of a preinitialized SPI flash object, which can then be used
>>> by the object itself but also by a SPI controller to handled the
>>> MMIOs.
>>
>> Hi,
>>
>> I am not sure if this approach is correct. I can not find any datashee=
t
>> to this SPI controller, but as you mentioned in first paragraph, contr=
oller
>> generates all commands (probably ones are somehow configurable).
>> In this series you hack this behaviour and you do direct access to fil=
e.
>> IMHO you should emulate sending such commands in SPI controller
>> model.
>>
>=20
> Actually I think this is a good approach for two reasons.
>=20
> Firstly there is more than one SPI controller that does this, the
> Xilinx Zynq QSPI controller does this for its LQSPI mode. See
> lqspi_read() in hw/ssi/xilinx_spips.c, which already works the way
> Marcin proposes. That one is semi-automatic, in that there are
> software configurable registers that hold the actual command to do the
> read etc. But once setup, the interface is linear-read-only and
> software transparent. A lot of assumptions where made in writing that
> code (the buffering scheme is completely made up) and I think the
> direct approach might be cleaner. This approach can go beyond SPI, in
> that it can work for other protocols and external storage devices.

ok.


The Aspeed SPI controller could follow the SPI approach and initiate=20
SPI tranfers instead of accessing the underlying storage of the flash=20
module. This is not strictly necessary for that case.=20

But, being able to use the SPI flash module as a boot ROM (as you point
out below)  brings in extra needs. A rom memory region is required for=20
that as you need to share the storage with the flash object. Sharing=20
gives you direct access to the storage and then, generating SPI transfers=
=20
becomes a bit superfluous.=20

I tried a few other approaches, adding aliases, adding a region without
ops behind the flash object but they were not very convincing.=20


> The more interesting application of this approach though, is emulating
> boot ROMs. Multiple SoCs in tree have pty bootroms that read SD cards
> (or even SPI), mount file-systems and then blob+boot images. Rather
> than emulators having to talk SDHCI through the controller to get
> images, we should be able to go direct, and implement the boot-logic
> off the raw block device. This means that there should be a general
> approach to a machine fishing the backing block-dev out from an
> external storage device, and linear SPI is another good application if
> it.


So if I read you well, the m25p80_set_rom_storage() approach is not the=20
most hideous thing to do but it needs to be generalized.

Currently, it boils down to :

 * create a rom memory region for each flash module needing one :

        memory_region_init_rom_device(&fl->mmio, OBJECT(s), &flash_ops,
                                      fl, name, fl->size, &err);

 * if needed, storage can be saved for later usage with :

        flash->storage =3D memory_region_get_ram_ptr(&fl->mmio);


 * the memory region storage should be passed on to the flash object=20
   using m25p80_set_rom_storage() before realization of the object :

        fl->flash =3D ssi_create_slave_no_init(s->spi, flashtype);
        if (dinfo) {
            qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinfo(d=
info),
                                errp);
        }
        m25p80_set_rom_storage(fl->flash, &fl->mmio);
        qdev_init_nofail(fl->flash);


This is very m25p80 centric. A common solution could be an object=20
gathering the properties of a memory region rom device and a blk=20
device. This is a bit what the pflash_cfi* objects are proposing=20
but it is all bundled in a big specific object.


Thanks,

C.=20

> Regards,
> Peter
>=20
>> Thanks,
>> Marcin
>>
>>
>>> This is sufficient to support read only accesses. For writes, we woul=
d
>>> certainly need to externalize flash_write8() routine.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/block/m25p80.c        | 14 +++++++++++++-
>>>   include/hw/block/flash.h |  2 ++
>>>   2 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>>> index aa964280beab..fec0fd4c2228 100644
>>> --- a/hw/block/m25p80.c
>>> +++ b/hw/block/m25p80.c
>>> @@ -29,6 +29,7 @@
>>>   #include "qemu/bitops.h"
>>>   #include "qemu/log.h"
>>>   #include "qapi/error.h"
>>> +#include "hw/block/flash.h"
>>>     #ifndef M25P80_ERR_DEBUG
>>>   #define M25P80_ERR_DEBUG 0
>>> @@ -1152,7 +1153,11 @@ static void m25p80_realize(SSISlave *ss, Error
>>> **errp)
>>>         if (s->blk) {
>>>           DB_PRINT_L(0, "Binding to IF_MTD drive\n");
>>> -        s->storage =3D blk_blockalign(s->blk, s->size);
>>> +
>>> +        /* using an external storage. see m25p80_create_rom() */
>>> +        if (!s->storage) {
>>> +            s->storage =3D blk_blockalign(s->blk, s->size);
>>> +        }
>>>             if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->siz=
e) {
>>>               error_setg(errp, "failed to read the initial flash
>>> content");
>>> @@ -1259,3 +1264,10 @@ static void m25p80_register_types(void)
>>>   }
>>>     type_init(m25p80_register_types)
>>> +
>>> +void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom)
>>> +{
>>> +    Flash *s =3D M25P80(dev);
>>> +
>>> +    s->storage =3D memory_region_get_ram_ptr(rom);
>>> +}
>>> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
>>> index 50ccbbcf1352..9d780f4ae0c9 100644
>>> --- a/include/hw/block/flash.h
>>> +++ b/include/hw/block/flash.h
>>> @@ -61,4 +61,6 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
>>>   void ecc_reset(ECCState *s);
>>>   extern VMStateDescription vmstate_ecc_state;
>>>   +void m25p80_set_rom_storage(DeviceState *dev, MemoryRegion *rom);
>>> +
>>>   #endif
>>
>>

