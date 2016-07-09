Received: by 10.25.21.156 with SMTP id 28csp851159lfv;
        Sat, 9 Jul 2016 16:39:17 -0700 (PDT)
X-Received: by 10.237.47.228 with SMTP id m91mr18239727qtd.35.1468107557741;
        Sat, 09 Jul 2016 16:39:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si268315qtu.73.2016.07.09.16.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jul 2016 16:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bM1q9-0008En-4l
	for alex.bennee@linaro.org; Sat, 09 Jul 2016 19:39:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1bM1p9-0007wY-5Q
	for qemu-devel@nongnu.org; Sat, 09 Jul 2016 19:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1bM1p6-0001nZ-TR
	for qemu-devel@nongnu.org; Sat, 09 Jul 2016 19:38:14 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:32781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1bM1p6-0001n1-Mo; Sat, 09 Jul 2016 19:38:12 -0400
Received: by mail-oi0-x244.google.com with SMTP id w141so13624687oia.0;
	Sat, 09 Jul 2016 16:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yFmsPlk7aNw48uYqghxdiEgsmtwRlDgx8X+WL1yt//M=;
	b=cU5Hp9F5u+wlANoXhAfyEuB9qkiQAOOSUDmtCif99LLIaWd92sxQLqobpKcDODr0SA
	PCrUj4IGNCyBk1uz0VMr8XogqYpjjfTwEZxCHKIOo1vc2YXxQU361URUI7+dZZzvDA/b
	R3NHnhEuuuYHAAmr7Ruvhuid/eo0QFLqsffj/SNIl0hWpmklnuSI/Sd2cBucFYQlsvY/
	A9hamOCowFuEkjHaQHGaAgUBCdLhzz4NvjR6LrMMlUWkhcyYN54MZprK0+u+y++1J/3z
	3aVMpR8zX0WKNJGIvTfgFApHl24wGwofj6uxoglyCvmURRnM4UStgEO/ySS5Hkm8DtAP
	xmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yFmsPlk7aNw48uYqghxdiEgsmtwRlDgx8X+WL1yt//M=;
	b=T5knYlVujD3R31DbDEiZsb8z9Z1jJAPqu8kJ3zw600na5vOfy/BFqQyhrUIjTVCvAj
	L2dJKpSankE/YvZBM5sU0toVeCtCtKsp7X3wOBG/BFMBlFDyfcjSspQNrGUNZV/TJGh5
	cYC3HWfvHrs6VdqSsMGvGMFLxkLRGUJujS/5QP3MjQ7d13Bh2V/WvEpkkmDI8otCNndJ
	drC2Jp6YEy71V9pcHYxMJbxfnlNWV0CrK6QjGwY5CV16/MyPfgozzzN+yLWLoCLIuo5V
	AWtUvwNHGjcAoyV0I39j+IeTNVxXnLvYGEDapKG97isabZxJtDWMSx/ECRObhXVSaAXN
	FJvA==
X-Gm-Message-State: ALyK8tISoj8ynFS1z0qyd7i16MD5NklmE92Lun8q8chXkNcDz0MKy0Cxkb+XS7MOJH4aPETK1+No1FrwVmuVgw==
X-Received: by 10.202.231.11 with SMTP id e11mr6097836oih.99.1468107488623;
	Sat, 09 Jul 2016 16:38:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.11.16 with HTTP; Sat, 9 Jul 2016 16:38:08 -0700 (PDT)
In-Reply-To: <577AA388.3060100@gmail.com>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
	<1467634738-28642-5-git-send-email-clg@kaod.org>
	<577AA388.3060100@gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Date: Sat, 9 Jul 2016 16:38:08 -0700
Message-ID: <CAPokK=rK84UCNOg8K1JBOAZX6wM=YpN5ievuSwntgjNerr-b8g@mail.gmail.com>
To: "mar.krzeminski" <mar.krzeminski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [PATCH 4/7] m25p80: add a m25p80_set_rom_storage()
 routine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Qemu-block <qemu-block@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LIMaV6KVw4Nq

On Mon, Jul 4, 2016 at 10:57 AM, mar.krzeminski
<mar.krzeminski@gmail.com> wrote:
>
>
> W dniu 04.07.2016 o 14:18, C=C3=A9dric Le Goater pisze:
>>
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
>
> Hi,
>
> I am not sure if this approach is correct. I can not find any datasheet
> to this SPI controller, but as you mentioned in first paragraph, controll=
er
> generates all commands (probably ones are somehow configurable).
> In this series you hack this behaviour and you do direct access to file.
> IMHO you should emulate sending such commands in SPI controller
> model.
>

Actually I think this is a good approach for two reasons.

Firstly there is more than one SPI controller that does this, the
Xilinx Zynq QSPI controller does this for its LQSPI mode. See
lqspi_read() in hw/ssi/xilinx_spips.c, which already works the way
Marcin proposes. That one is semi-automatic, in that there are
software configurable registers that hold the actual command to do the
read etc. But once setup, the interface is linear-read-only and
software transparent. A lot of assumptions where made in writing that
code (the buffering scheme is completely made up) and I think the
direct approach might be cleaner. This approach can go beyond SPI, in
that it can work for other protocols and external storage devices.

The more interesting application of this approach though, is emulating
boot ROMs. Multiple SoCs in tree have pty bootroms that read SD cards
(or even SPI), mount file-systems and then blob+boot images. Rather
than emulators having to talk SDHCI through the controller to get
images, we should be able to go direct, and implement the boot-logic
off the raw block device. This means that there should be a general
approach to a machine fishing the backing block-dev out from an
external storage device, and linear SPI is another good application if
it.

Regards,
Peter

> Thanks,
> Marcin
>
>
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
>> @@ -1152,7 +1153,11 @@ static void m25p80_realize(SSISlave *ss, Error
>> **errp)
>>         if (s->blk) {
>>           DB_PRINT_L(0, "Binding to IF_MTD drive\n");
>> -        s->storage =3D blk_blockalign(s->blk, s->size);
>> +
>> +        /* using an external storage. see m25p80_create_rom() */
>> +        if (!s->storage) {
>> +            s->storage =3D blk_blockalign(s->blk, s->size);
>> +        }
>>             if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->size) =
{
>>               error_setg(errp, "failed to read the initial flash
>> content");
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
>
>
