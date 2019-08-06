Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5759230wrv;
        Tue, 6 Aug 2019 15:12:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIuDnp5N2sPV0c2pwv507ofLCl2m213b+iFusTnDXbaPzpT+znDadjFDOCFWjCuPuMmToQ
X-Received: by 2002:a17:906:304d:: with SMTP id d13mr5334083ejd.99.1565129560369;
        Tue, 06 Aug 2019 15:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565129560; cv=none;
        d=google.com; s=arc-20160816;
        b=UDL39bDhQkAF+GpIPXGl4HIbayWtIg8v88eTB0rLE0Xch/ACHEuED7eqTjkVK/+1lw
         ZsGSeT6mVohcTjr3jJKz4fqzC6MCK3xIT/d/bNg6jXa8SKIf0hL+ung069vgF4LuZbrP
         03gQrvQPn9KI61EMk4g2YE/0NT3pNnUUVnw32V7KuO/ctbUwInSNSx/Q5otdV3GDAtYR
         rAPb43nYSVhCyEsDGpwPyJVc+LAcWm4eLCOSYZrh0EzY6miIDEcCGgJPVSbEx2mR7SJO
         4wm1wpLkVGON76Cuf5wuoWfrmP1zswFDw9N99EYYKEp6aYz1fYP7H2WyRH+AipmlBv/S
         pMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=kI6TH6JjrAXcaGbMVrJXLeFJyHxWT42ctp2347RU8LU=;
        b=za8sMZbOT0gcXO+ufQCHj1MhZJCKZvYTDX4uAJjp1w9MNW8/z1Lv3E+aTi94X5ZLBR
         3/lFr7h4x+kX7ZFoZB6B9N3JA7kZmsY2OLYpOWFmB6olulVUf69UbBcQUCa6BmWyJqjH
         E5tz1XS9bBQnLypwh3toBd34aQcR8SfJqz5cwVcr20M9QplaUVNiLV8HwnTwBPcC04sU
         lc0mrbMLxXY1vS0vSrJM/P56LnH86XNISr8FC1Dmq65I539ybeVaamhm9FiLKqCupQxg
         cvpQjxbugIep2erOhx0lduT+7F0G+qfPewkXe7Q6XUF8rXfysnUYjiokWBr5n44B1MFw
         KTiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb8si28180907ejb.192.2019.08.06.15.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 15:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hv7h9-0005SS-D8
	for alex.bennee@linaro.org; Tue, 06 Aug 2019 18:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48951)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eajames@linux.ibm.com>) id 1hv7h1-0005NE-Ft
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 18:12:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eajames@linux.ibm.com>) id 1hv7gz-0005T1-PQ
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 18:12:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41190)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eajames@linux.ibm.com>)
 id 1hv7gw-0005NU-0H; Tue, 06 Aug 2019 18:12:26 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x76MBnM1061512; Tue, 6 Aug 2019 18:12:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u7hh617rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Aug 2019 18:12:13 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x76MCD2r062282;
 Tue, 6 Aug 2019 18:12:13 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2u7hh617r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Aug 2019 18:12:12 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x76M9j3G005512;
 Tue, 6 Aug 2019 22:12:11 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 2u51w6b06q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Aug 2019 22:12:11 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x76MCB8Z18022712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Aug 2019 22:12:11 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55CF9B2068;
 Tue,  6 Aug 2019 22:12:11 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBF88B207F;
 Tue,  6 Aug 2019 22:12:10 +0000 (GMT)
Received: from [9.85.157.83] (unknown [9.85.157.83])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  6 Aug 2019 22:12:10 +0000 (GMT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1561574604-1204-1-git-send-email-eajames@linux.ibm.com>
 <CAFEAcA8W44gYFgU7qP9wOUSwZ7xFqqZ+2eWr=0hjKps=qvQMnw@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <057e55ed-c8f1-8c69-f7f0-c95df5955525@linux.ibm.com>
Date: Tue, 6 Aug 2019 17:12:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8W44gYFgU7qP9wOUSwZ7xFqqZ+2eWr=0hjKps=qvQMnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-06_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060191
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-arm] [PATCH] hw/sd/aspeed_sdhci: New device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a5RECNkHcM/z


On 8/5/19 9:31 AM, Peter Maydell wrote:
> On Wed, 26 Jun 2019 at 19:43, Eddie James <eajames@linux.ibm.com> wrote:
>> The Aspeed SOCs have two SD/MMC controllers. Add a device that
>> encapsulates both of these controllers and models the Aspeed-specific
>> registers and behavior.
>>
>> Both controllers use a single HW interrupt. In order to trigger that
>> interrupt, a function pointer was added to the generic SDHCI structure.
>> This function (if the pointer is set) is called when the SDHCI model
>> changes it's interrupt status, allowing the user (the Aspeed SDHCI
>> model in this case) to set it's own interrupt.
>>
>> This goes on top of Cedric's set of Aspeed changes.
>>
>> Tested, booted, and read from /dev/mmcblk0 and /dev/mmcblk1:
>> ./arm-softmmu/qemu-system-arm -M ast2500-evb -nographic \
>>   -drive file=flash-romulus,format=raw,if=mtd \
>>   -drive file=<some file>,format=raw,if=sd \
>>   -drive file=<some file>,format=raw,if=sd \
>>   -kernel zImage \
>>   -dtb aspeed-ast2500-evb.dtb \
>>   -initrd romulus.cpio.lzma \
>>   -d trace:sdhci* -no-reboot
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> (Apologies for the rather delayed review -- combination of the
> 4.1 release work, and hoping one of the other Aspeed developers
> would get to it.)


No problem, thanks for the review!


>
>
>>   #define aspeed_soc_ast2500_irqmap aspeed_soc_ast2400_irqmap
>> @@ -378,6 +381,16 @@ static void aspeed_soc_init(Object *obj)
>>           sysbus_init_child_obj(obj, "fsi[*]", OBJECT(&s->fsi[0]),
>>                                 sizeof(s->fsi[0]), TYPE_ASPEED_FSI);
>>       }
>> +
>> +    sysbus_init_child_obj(obj, "sdhci", OBJECT(&s->sdhci), sizeof(s->sdhci),
>> +                          TYPE_ASPEED_SDHCI);
>> +
>> +    for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
>> +        sysbus_init_child_obj(obj, "sdhci_slot[*]",
>> +                              OBJECT(&s->sdhci.slots[i].sdhci),
>> +                              sizeof(s->sdhci.slots[i].sdhci),
>> +                              TYPE_SYSBUS_SDHCI);
>> +    }
> This seems a bit odd. Why does the SoC init the slots[i].sdhci
> objects, rather than letting the TYPE_ASPEED_SDHCI object itself
> take care of initializing and realizing its own child objects?


I couldn't get it to work with the actual sdhci objects underneath the 
Aspeed object. Qemu wouldn't start with an sd card drive in the command 
line. I'm thinking it can't find the actual sdhci objects if they're not 
on that parent bus?


>
>>   }
>>
>>   static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>> @@ -699,6 +712,60 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>           sysbus_connect_irq(SYS_BUS_DEVICE(&s->fsi[0]), 0,
>>                              aspeed_soc_get_irq(s, ASPEED_FSI1));
>>       }
>> +
>> +    /* SD/SDIO */
>> +    for (i = 0; i < ASPEED_SDHCI_NUM_SLOTS; i++) {
>> +        hwaddr hci_addr = sc->info->memmap[ASPEED_SDHCI] + (0x100 * (i + 1));
>> +        DriveInfo *di;
>> +        BlockBackend *blk;
>> +        DeviceState *card;
>> +
>> +        /*
>> +         * Compatible with:
>> +         * - SD Host Controller Specification Version 2.0
>> +         * - SDIO Specification Version 2.0
>> +         * - MMC Specification Version 4.3
>> +         */
>> +        object_property_set_int(OBJECT(&s->sdhci.slots[i].sdhci), 2,
>> +                                "sd-spec-version", &err);
>> +        if (err) {
>> +            error_propagate(errp, err);
>> +            return;
>> +        }
>> +
>> +        object_property_set_uint(OBJECT(&s->sdhci.slots[i].sdhci),
>> +                                 ASPEED_SDHCI_CAPABILITIES, "capareg", &err);
>> +        if (err) {
>> +            error_propagate(errp, err);
>> +            return;
>> +        }
>> +
>> +        object_property_set_bool(OBJECT(&s->sdhci.slots[i].sdhci), true,
>> +                                 "realized", &err);
>> +        if (err) {
>> +            error_propagate(errp, err);
>> +            return;
>> +        }
>> +
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci.slots[i].sdhci), 0, hci_addr);
>> +
>> +        di = drive_get_next(IF_SD);
>> +        blk = di ? blk_by_legacy_dinfo(di) : NULL;
>> +        card = qdev_create(qdev_get_child_bus(DEVICE(&s->sdhci.slots[i].sdhci),
>> +                                              "sd-bus"), TYPE_SD_CARD);
>> +        qdev_prop_set_drive(card, "drive", blk, &error_fatal);
>> +        object_property_set_bool(OBJECT(card), true, "realized", &error_fatal);
> Code at the SoC level shouldn't be calling drive_get_next() or
> creating SD card objects directly itself -- it should leave this
> up to either the board code or to the command line.


OK.


>
>> +    }
>> +
>> +    object_property_set_bool(OBJECT(&s->sdhci), true, "realized", &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci), 0,
>> +                    sc->info->memmap[ASPEED_SDHCI]);
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
>> +                       aspeed_soc_get_irq(s, ASPEED_SDHCI));
>>   }
>>   static Property aspeed_soc_properties[] = {
>>       DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
>> diff --git a/hw/sd/Makefile.objs b/hw/sd/Makefile.objs
>> index 0665727..a884c23 100644
>> --- a/hw/sd/Makefile.objs
>> +++ b/hw/sd/Makefile.objs
>> @@ -8,3 +8,4 @@ obj-$(CONFIG_MILKYMIST) += milkymist-memcard.o
>>   obj-$(CONFIG_OMAP) += omap_mmc.o
>>   obj-$(CONFIG_PXA2XX) += pxa2xx_mmci.o
>>   obj-$(CONFIG_RASPI) += bcm2835_sdhost.o
>> +obj-$(CONFIG_ASPEED_SOC) += aspeed_sdhci.o
>> diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
>> new file mode 100644
>> index 0000000..f684b12
>> --- /dev/null
>> +++ b/hw/sd/aspeed_sdhci.c
>> @@ -0,0 +1,163 @@
>> +/*
>> + * Aspeed SD Host Controller
>> + * Eddie James <eajames@linux.ibm.com>
>> + *
>> + * Copyright (C) 2019 IBM Corp
>> + * SPDX-License-Identifer: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "qemu/error-report.h"
>> +#include "hw/sd/aspeed_sdhci.h"
>> +#include "qapi/error.h"
>> +
>> +#define ASPEED_SDHCI_INFO            0x00
>> +#define  ASPEED_SDHCI_INFO_RESET     0x00030000
>> +#define ASPEED_SDHCI_DEBOUNCE        0x04
>> +#define  ASPEED_SDHCI_DEBOUNCE_RESET 0x00000005
>> +#define ASPEED_SDHCI_BUS             0x08
>> +#define ASPEED_SDHCI_SDIO_140        0x10
>> +#define ASPEED_SDHCI_SDIO_148        0x18
>> +#define ASPEED_SDHCI_SDIO_240        0x20
>> +#define ASPEED_SDHCI_SDIO_248        0x28
>> +#define ASPEED_SDHCI_WP_POL          0xec
>> +#define ASPEED_SDHCI_CARD_DET        0xf0
>> +#define ASPEED_SDHCI_IRQ_STAT        0xfc
>> +
>> +#define TO_REG(addr) ((addr) / sizeof(uint32_t))
>> +
>> +static uint64_t aspeed_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
>> +{
>> +    uint32_t val = 0;
>> +    AspeedSDHCIState *sdhci = opaque;
>> +
>> +    switch (addr) {
>> +    case ASPEED_SDHCI_SDIO_140:
>> +        val = (uint32_t)sdhci->slots[0].sdhci.capareg;
>> +        break;
>> +    case ASPEED_SDHCI_SDIO_148:
>> +        val = (uint32_t)sdhci->slots[0].sdhci.maxcurr;
>> +        break;
>> +    case ASPEED_SDHCI_SDIO_240:
>> +        val = (uint32_t)sdhci->slots[1].sdhci.capareg;
>> +        break;
>> +    case ASPEED_SDHCI_SDIO_248:
>> +        val = (uint32_t)sdhci->slots[1].sdhci.maxcurr;
>> +        break;
>> +    default:
>> +        if (addr < ASPEED_SDHCI_REG_SIZE) {
>> +            val = sdhci->regs[TO_REG(addr)];
>> +        }
>> +    }
>> +
>> +    return (uint64_t)val;
>> +}
>> +
>> +static void aspeed_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
>> +                               unsigned int size)
>> +{
>> +    AspeedSDHCIState *sdhci = opaque;
>> +
>> +    switch (addr) {
>> +    case ASPEED_SDHCI_SDIO_140:
>> +        sdhci->slots[0].sdhci.capareg = (uint64_t)(uint32_t)val;
>> +        break;
>> +    case ASPEED_SDHCI_SDIO_148:
>> +        sdhci->slots[0].sdhci.maxcurr = (uint64_t)(uint32_t)val;
>> +        break;
>> +    case ASPEED_SDHCI_SDIO_240:
>> +        sdhci->slots[1].sdhci.capareg = (uint64_t)(uint32_t)val;
>> +        break;
>> +    case ASPEED_SDHCI_SDIO_248:
>> +        sdhci->slots[1].sdhci.maxcurr = (uint64_t)(uint32_t)val;
>> +        break;
>> +    default:
>> +        if (addr < ASPEED_SDHCI_REG_SIZE) {
>> +            sdhci->regs[TO_REG(addr)] = (uint32_t)val;
>> +        }
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps aspeed_sdhci_ops = {
>> +    .read = aspeed_sdhci_read,
>> +    .write = aspeed_sdhci_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .valid.min_access_size = 4,
>> +    .valid.max_access_size = 4,
>> +};
>> +
>> +static void aspeed_sdhci_irq_notify(SDHCIState *s, int level)
>> +{
>> +    AspeedSDHCISlotState *as = container_of(s, AspeedSDHCISlotState, sdhci);
>> +    AspeedSDHCIState *sdhci = container_of(as, AspeedSDHCIState,
>> +                                           slots[as->slot]);
>> +
>> +    if (level) {
>> +        sdhci->regs[TO_REG(ASPEED_SDHCI_IRQ_STAT)] |= BIT(as->slot);
>> +
>> +        qemu_irq_raise(sdhci->irq);
>> +    } else {
>> +        sdhci->regs[TO_REG(ASPEED_SDHCI_IRQ_STAT)] &= ~BIT(as->slot);
>> +
>> +        qemu_irq_lower(sdhci->irq);
>> +    }
>> +}
>> +
>> +static void aspeed_sdhci_realize(DeviceState *dev, Error **errp)
>> +{
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>> +    AspeedSDHCIState *sdhci = ASPEED_SDHCI(dev);
>> +
>> +    sysbus_init_irq(sbd, &sdhci->irq);
>> +    memory_region_init_io(&sdhci->iomem, OBJECT(sdhci), &aspeed_sdhci_ops,
>> +                          sdhci, TYPE_ASPEED_SDHCI, ASPEED_SDHCI_REG_SIZE);
>> +    sysbus_init_mmio(sbd, &sdhci->iomem);
>> +
>> +    sdhci->slots[0].slot = 0;
>> +    sdhci->slots[0].sdhci.irq_notify = aspeed_sdhci_irq_notify;
>> +
>> +    sdhci->slots[1].slot = 1;
>> +    sdhci->slots[1].sdhci.irq_notify = aspeed_sdhci_irq_notify;
>> +}
>> +
>> +static void aspeed_sdhci_reset(DeviceState *dev)
>> +{
>> +    AspeedSDHCIState *sdhci = ASPEED_SDHCI(dev);
>> +
>> +    memset(sdhci->regs, 0, ASPEED_SDHCI_REG_SIZE);
>> +    sdhci->regs[TO_REG(ASPEED_SDHCI_INFO)] = ASPEED_SDHCI_INFO_RESET;
>> +    sdhci->regs[TO_REG(ASPEED_SDHCI_DEBOUNCE)] = ASPEED_SDHCI_DEBOUNCE_RESET;
>> +}
>> +
>> +static const VMStateDescription vmstate_aspeed_sdhci = {
>> +    .name = TYPE_ASPEED_SDHCI,
>> +    .version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32_ARRAY(regs, AspeedSDHCIState, ASPEED_SDHCI_NUM_REGS),
>> +        VMSTATE_END_OF_LIST(),
>> +    },
>> +};
>> +
>> +static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(classp);
>> +
>> +    dc->realize = aspeed_sdhci_realize;
>> +    dc->reset = aspeed_sdhci_reset;
>> +    dc->vmsd = &vmstate_aspeed_sdhci;
>> +}
>> +
>> +static TypeInfo aspeed_sdhci_info = {
>> +    .name          = TYPE_ASPEED_SDHCI,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(AspeedSDHCIState),
>> +    .class_init    = aspeed_sdhci_class_init,
>> +};
>> +
>> +static void aspeed_sdhci_register_types(void)
>> +{
>> +    type_register_static(&aspeed_sdhci_info);
>> +}
>> +
>> +type_init(aspeed_sdhci_register_types)
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index 7b80b1d..51a733b 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -213,7 +213,13 @@ static uint8_t sdhci_slotint(SDHCIState *s)
>>
>>   static inline void sdhci_update_irq(SDHCIState *s)
>>   {
>> -    qemu_set_irq(s->irq, sdhci_slotint(s));
>> +    int level = sdhci_slotint(s);
>> +
>> +    qemu_set_irq(s->irq, level);
>> +
>> +    if (s->irq_notify) {
>> +        s->irq_notify(s, level);
>> +    }
> Rather than doing this, just wire the irq lines from
> the SDHCIState device up to your AspeedSDHCIState device,
> and then have that update the register state and assert
> its own irq lines outbound.


Sorry I don't follow you at all. Isn't that what I'm doing here? Surely 
I need to take action when sdhci_update_irq is called. I don't see any 
way other way to have my code called at this time.


Thanks,

Eddie


>
>>   }
> thanks
> -- PMM
>
