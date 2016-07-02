Received: by 10.25.21.96 with SMTP id l93csp832800lfi;
        Sat, 2 Jul 2016 10:53:13 -0700 (PDT)
X-Received: by 10.200.41.122 with SMTP id z55mr6828207qtz.34.1467481993602;
        Sat, 02 Jul 2016 10:53:13 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l88si1030141qki.120.2016.07.02.10.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jul 2016 10:53:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJP6P-0003Jx-2q
	for alex.bennee@linaro.org; Sat, 02 Jul 2016 13:53:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50066)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bJP5U-00031s-Ei
	for qemu-devel@nongnu.org; Sat, 02 Jul 2016 13:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1bJP5R-0001h0-J8
	for qemu-devel@nongnu.org; Sat, 02 Jul 2016 13:52:15 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>)
	id 1bJP5J-0001ga-Vs; Sat, 02 Jul 2016 13:52:06 -0400
Received: by mail-lf0-x242.google.com with SMTP id l188so13999228lfe.0;
	Sat, 02 Jul 2016 10:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=sNYhnwHoNjL88hAaXezWnACprAf8z9hawh3zpwJfHX4=;
	b=nFbQXB4xX7dddJC4AlT9yCfFAMa5/NmiLZuwzKlUUQpbic7ShF1Rw5gbVDTcxowiVI
	vmFl9Zz8K1CHYRiiPZ14oMBDtaNdsVE1bnvMD9xZYY/x2GzT/emIHePwhPcYW0tXAh3f
	u22TQmSGLn9+VWaG4MJ6nYA34q/QaLYE6j10GKvGN/Ii5t8V1RWPE8OUJHPrLfHymQPs
	pkymGOOl93w02t7CzKXkdOY3CZIA90AR8toRkRcPMkmSJwkLc7FG9i722+xI2HMKy655
	8i9EG25AJHbTtGO114vzEGWB3eMInJb/sE8/VJG3ycOA12y4qAwpGEbVEHCV0qpX+wWO
	3sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=sNYhnwHoNjL88hAaXezWnACprAf8z9hawh3zpwJfHX4=;
	b=TZdFmQkoyUm9b8tlpQM6dYjVFYHVeb2Mihs9G70idBcNdcDX6F+uhKOOEEBd2LnnFg
	WB1mMe0Z84pDgVzvN9K9H2LnpDUx9n73ugJGUPIVRIn3e/Pktv9U9IDpBbKLpyPAkNY8
	m81jnp1ZkaJSgioAi5Wa5YQhyuh7TlrzEodkE0StuTDNEjKgFnwhk4F0ZS1gkIi5oxHt
	VFj/L3sub5/TfEzOR6b9iqVgrkKNyE+xApWAoot4+O7EGiPpdNOyIQhpUJi+yIzQ+zOr
	dli7lL2HUgJeRLoP9fso3sY/3CYnHDqLgnkMS5xtX8+bZuvf7tBei84vkywr4CD+JdIt
	xXbw==
X-Gm-Message-State: ALyK8tLvP6sAape7D30I6THaO2B8GJxBasaq3Oa07EP4W2lOHQOpkvw9Yed8yWj0xxYLeg==
X-Received: by 10.25.26.10 with SMTP id a10mr762137lfa.97.1467481921733;
	Sat, 02 Jul 2016 10:52:01 -0700 (PDT)
Received: from [192.168.75.104] (31-178-123-4.dynamic.chello.pl.
	[31.178.123.4]) by smtp.gmail.com with ESMTPSA id
	u124sm3175090lja.11.2016.07.02.10.52.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jul 2016 10:52:00 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-8-git-send-email-clg@kaod.org>
	<5777F4F7.9020804@gmail.com>
From: "mar.krzeminski" <mar.krzeminski@gmail.com>
Message-ID: <5777FF3F.9050002@gmail.com>
Date: Sat, 2 Jul 2016 19:51:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <5777F4F7.9020804@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-devel] [PATCH v5 7/9] ast2400: add SPI flash slaves
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w46KKi2SXAF3



W dniu 02.07.2016 o 19:08, mar.krzeminski pisze:
>
>
> W dniu 28.06.2016 o 20:24, Cédric Le Goater pisze:
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
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>   Changes since v3:
>>
>>   - Fixed error logging
>>   - Constantified a couple of routine arguments
>>   - Sorted out what was need for migration (nothing apriori, but flash
>>     module object will need some care)
>>   - Reworked the structures handling the IOs on the flash modules :
>>     . Replaced the SysBusDevice object with a simple struct
>>     . Added a global memory region for the flash memory address space
>>     . Added sub regions for each segment
>>     . Moved mapping in SOC initialization
>>   - Rephrased commit log
>>
>>   hw/arm/ast2400.c            |   5 ++
>>   hw/ssi/aspeed_smc.c         | 150 
>> +++++++++++++++++++++++++++++++++++++++++++-
>>   include/hw/ssi/aspeed_smc.h |  21 +++++++
>>   3 files changed, 173 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
>> index b16ba2d0c516..9c30b45f87a9 100644
>> --- a/hw/arm/ast2400.c
>> +++ b/hw/arm/ast2400.c
>> @@ -31,6 +31,9 @@
>>   #define AST2400_TIMER_BASE       0x1E782000
>>   #define AST2400_I2C_BASE         0x1E78A000
>>   +#define AST2400_FMC_FLASH_BASE   0x20000000
>> +#define AST2400_SPI_FLASH_BASE   0x30000000
>> +
>>   #define AST2400_A0_SILICON_REV   0x02000303
>>     static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
>> @@ -167,6 +170,7 @@ static void ast2400_realize(DeviceState *dev, 
>> Error **errp)
>>           return;
>>       }
>>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 1, 
>> AST2400_FMC_FLASH_BASE);
>>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
>> qdev_get_gpio_in(DEVICE(&s->vic), 19));
>>   @@ -179,6 +183,7 @@ static void ast2400_realize(DeviceState *dev, 
>> Error **errp)
>>           return;
>>       }
>>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, 
>> AST2400_SPI_FLASH_BASE);
>>   }
>>     static void ast2400_class_init(ObjectClass *oc, void *data)
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 537635e18d64..cb0b23750bcf 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -127,13 +127,129 @@
>>   #define R_SPI_MISC_CTRL   (0x10 / 4)
>>   #define R_SPI_TIMINGS     (0x14 / 4)
>>   +/*
>> + * Default segments mapping addresses and size for each slave per
>> + * controller. These can be changed when board is initialized with the
>> + * Segment Address Registers but they don't seem do be used on the
>> + * field.
>> + */
>> +static const AspeedSegments aspeed_segments_legacy[] = {
>> +    { 0x10000000, 32 * 1024 * 1024 },
>> +};
>> +
>> +static const AspeedSegments aspeed_segments_fmc[] = {
>> +    { 0x20000000, 64 * 1024 * 1024 },
>> +    { 0x24000000, 32 * 1024 * 1024 },
>> +    { 0x26000000, 32 * 1024 * 1024 },
>> +    { 0x28000000, 32 * 1024 * 1024 },
>> +    { 0x2A000000, 32 * 1024 * 1024 }
>> +};
>> +
>> +static const AspeedSegments aspeed_segments_spi[] = {
>> +    { 0x30000000, 64 * 1024 * 1024 },
>> +};
>> +
>>   static const AspeedSMCController controllers[] = {
>>       { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
>> -      CONF_ENABLE_W0, 5 },
>> +      CONF_ENABLE_W0, 5, aspeed_segments_legacy, 0x6000000 },
>>       { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
>> -      CONF_ENABLE_W0, 5 },
>> +      CONF_ENABLE_W0, 5, aspeed_segments_fmc, 0x10000000 },
>>       { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
>> -      SPI_CONF_ENABLE_W0, 1 },
>> +      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi, 0x10000000 },
>> +};
>> +
>> +static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr 
>> addr,
>> +                                              unsigned size)
>> +{
>> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of 
>> size %u"
>> +                  PRIx64 "\n", __func__, addr, size);
>> +    return 0;
>> +}
>> +
>> +static void aspeed_smc_flash_default_write(void *opaque, hwaddr addr,
>> +                                           uint64_t data, unsigned 
>> size)
>> +{
>> +   qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of size 
>> %u: 0x%"
>> +                 PRIx64 "\n", __func__, addr, size, data);
>> +}
>> +
>> +static const MemoryRegionOps aspeed_smc_flash_default_ops = {
>> +    .read = aspeed_smc_flash_default_read,
>> +    .write = aspeed_smc_flash_default_write,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +    .valid = {
>> +        .min_access_size = 1,
>> +        .max_access_size = 4,
>> +    },
>> +};
>> +
>> +static inline int aspeed_smc_flash_mode(const AspeedSMCState *s, int 
>> cs)
>> +{
>> +    return s->regs[s->r_ctrl0 + cs] & CTRL_CMD_MODE_MASK;
>> +}
>> +
>> +static inline bool aspeed_smc_is_usermode(const AspeedSMCState *s, 
>> int cs)
>> +{
>> +    return aspeed_smc_flash_mode(s, cs) == CTRL_USERMODE;
>> +}
>> +
>> +static inline bool aspeed_smc_is_writable(const AspeedSMCState *s, 
>> int cs)
>> +{
>> +    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
>> +}
>> +
>> +static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, 
>> unsigned size)
>> +{
>> +    AspeedSMCFlash *fl = opaque;
>> +    const AspeedSMCState *s = fl->controller;
>> +    uint64_t ret = 0;
>> +    int i;
>> +
>> +    if (aspeed_smc_is_usermode(s, fl->id)) {
>> +        for (i = 0; i < size; i++) {
>> +            ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
>> +        }
>> +    } else {
>> +        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
>> +                      __func__);
>> +        ret = -1;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void aspeed_smc_flash_write(void *opaque, hwaddr addr, 
>> uint64_t data,
>> +                           unsigned size)
>> +{
>> +    AspeedSMCFlash *fl = opaque;
>> +    const AspeedSMCState *s = fl->controller;
>> +    int i;
>> +
>> +    if (!aspeed_smc_is_writable(s, fl->id)) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: flash is not writable at 
>> 0x%"
>> +                      HWADDR_PRIx "\n", __func__, addr);
>> +        return;
>> +    }
>> +
>> +    if (!aspeed_smc_is_usermode(s, fl->id)) {
>> +        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
>> +                      __func__);
>> +        return;
>> +    }
>> +
>> +    for (i = 0; i < size; i++) {
>> +        ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
> Hi,
>
> I think the error with m25p80 tests is here.
> The flash device I know (eg. n25q*) takes address in BE, MSB first.
> Since we do not care about MSB/LSB stuff, we should fallow BE/LE.
> If your machine is BE, you will start to send address backwards.
>
> Regard,
> Marcin
Sorry, I have just noticed DEVICE_LITTLE_ENDIAN functionality...

Regards,
Marcin

>
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps aspeed_smc_flash_ops = {
>> +    .read = aspeed_smc_flash_read,
>> +    .write = aspeed_smc_flash_write,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +    .valid = {
>> +        .min_access_size = 1,
>> +        .max_access_size = 4,
>> +    },
>>   };
>>     static bool aspeed_smc_is_ce_stop_active(const AspeedSMCState *s, 
>> int cs)
>> @@ -237,6 +353,8 @@ static void aspeed_smc_realize(DeviceState *dev, 
>> Error **errp)
>>       AspeedSMCState *s = ASPEED_SMC(dev);
>>       AspeedSMCClass *mc = ASPEED_SMC_GET_CLASS(s);
>>       int i;
>> +    char name[32];
>> +    hwaddr offset = 0;
>>         s->ctrl = mc->ctrl;
>>   @@ -270,6 +388,32 @@ static void aspeed_smc_realize(DeviceState 
>> *dev, Error **errp)
>>       memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>>                             s->ctrl->name, ASPEED_SMC_R_MAX * 4);
>>       sysbus_init_mmio(sbd, &s->mmio);
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
>> +    s->flashes = g_malloc0(sizeof(AspeedSMCFlash) * s->num_cs);
>> +
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        AspeedSMCFlash *fl = &s->flashes[i];
>> +
>> +        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
>> +
>> +        fl->id = i;
>> +        fl->controller = s;
>> +        fl->size = s->ctrl->segments[i].size;
>> +        memory_region_init_io(&fl->mmio, OBJECT(s), 
>> &aspeed_smc_flash_ops,
>> +                              fl, name, fl->size);
>> +        memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
>> +        offset += fl->size;
>> +    }
>>   }
>>     static const VMStateDescription vmstate_aspeed_smc = {
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index c4a4960cd880..def3b4507e75 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -27,6 +27,12 @@
>>     #include "hw/ssi/ssi.h"
>>   +typedef struct AspeedSegments {
>> +    hwaddr addr;
>> +    uint32_t size;
>> +} AspeedSegments;
>> +
>> +struct AspeedSMCState;
>>   typedef struct AspeedSMCController {
>>       const char *name;
>>       uint8_t r_conf;
>> @@ -35,8 +41,20 @@ typedef struct AspeedSMCController {
>>       uint8_t r_timings;
>>       uint8_t conf_enable_w0;
>>       uint8_t max_slaves;
>> +    const AspeedSegments *segments;
>> +    uint32_t mapping_window_size;
>>   } AspeedSMCController;
>>   +typedef struct AspeedSMCFlash {
>> +    const struct AspeedSMCState *controller;
>> +
>> +    uint8_t id;
>> +    uint32_t size;
>> +
>> +    MemoryRegion mmio;
>> +    DeviceState *flash;
>> +} AspeedSMCFlash;
>> +
>>   #define TYPE_ASPEED_SMC "aspeed.smc"
>>   #define ASPEED_SMC(obj) OBJECT_CHECK(AspeedSMCState, (obj), 
>> TYPE_ASPEED_SMC)
>>   #define ASPEED_SMC_CLASS(klass) \
>> @@ -57,6 +75,7 @@ typedef struct AspeedSMCState {
>>       const AspeedSMCController *ctrl;
>>         MemoryRegion mmio;
>> +    MemoryRegion mmio_flash;
>>         qemu_irq irq;
>>       int irqline;
>> @@ -74,6 +93,8 @@ typedef struct AspeedSMCState {
>>       uint8_t r_ctrl0;
>>       uint8_t r_timings;
>>       uint8_t conf_enable_w0;
>> +
>> +    AspeedSMCFlash *flashes;
>>   } AspeedSMCState;
>>     #endif /* ASPEED_SMC_H */
>

