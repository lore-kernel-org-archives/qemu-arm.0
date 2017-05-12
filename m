Received: by 10.25.0.6 with SMTP id 6csp51981lfa;
        Thu, 11 May 2017 20:54:37 -0700 (PDT)
X-Received: by 10.55.33.70 with SMTP id h67mr1877077qkh.163.1494561276930;
        Thu, 11 May 2017 20:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494561276; cv=none;
        d=google.com; s=arc-20160816;
        b=cXKdxb4/ryVJFbcBcc/wSFGDpv2QcWeqINIF/Tf76WcylRjeNDiwnvKeHkRu8kcCjL
         BwukR6cjt/dALTIhJidRjudiGl0WGtrIdC8p3ezN9De/YyZBLYvOep8zXIh3sot2alJs
         CFYMqf8bHvRTP8Mu+OoiszTwljf6L6SYdPIaK454IvCkAYL40qzapI/xNrrXzHZnyR4e
         SvdfjMOJGu4BfquQfVTNhCrvgrE5M6tvSF7pKPy8XpYf7SFVGBaffVhO5b12Dmgyb2/L
         hWEunTFvOheMLXQFqcBJxgpInbNp5RyqCQ0jMFaG9f7qT9L4W46y18xLc2R7JFQYjsIM
         ydrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=9M8vypXhX0JmZq2zZ8Th/XOt0J0cVu22CGiTlmjMkZs=;
        b=S2s6RM3tRracdDyv8PdRbWl1bOxqZgu3ErrKzZSv69zqxzVT/Uzqsj1hKskDzS98ga
         EyUZ9IR6QFdkzBL4fN2/+hJNF2eXUGRzyMYSHyrQNghcEWvCt4fpFQQCC/ribzr+qXDP
         6edAum5hylXQXfo1ZUemjNhZTFPHSX6FYuwW97JScQ5/gAys2Gbw7fuhVTbU379qLexw
         I1rcZT5Izudq3YRv9zf5ZtQlN6Njl6AUMlON5Qcau7SuNcVPBXhOoyzB9LmeGaOvEVKz
         5SRn4gbBtT0TiLFY9m06txRdRCE71LwMi98dL60csL8ciyzvh2cRuhsH0xHS/TqwiTFy
         6ECA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si2186759qkc.158.2017.05.11.20.54.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 20:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d91f2-0005C1-Cl
	for alex.bennee@linaro.org; Thu, 11 May 2017 23:54:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91eu-0005AC-9W
	for qemu-arm@nongnu.org; Thu, 11 May 2017 23:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91es-0005es-5u
	for qemu-arm@nongnu.org; Thu, 11 May 2017 23:54:28 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91em-0005a0-73; Thu, 11 May 2017 23:54:20 -0400
Received: by mail-qk0-x242.google.com with SMTP id k74so6356912qke.2;
	Thu, 11 May 2017 20:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=9M8vypXhX0JmZq2zZ8Th/XOt0J0cVu22CGiTlmjMkZs=;
	b=Frd11N5QXh8e20XmL31egdTCfT7AQHt7f9t6f4E6SqRzfVVaBPopuuYygClcO3iaJk
	gmURv7/TXjz5AAfzTaB0VI7TWvSRdDmpVGC8+/MJ6GvuI3b8eK5nglxRxBfZOl4516vk
	IOxCz9NGPYesyiygQrDbjp9YbjaywsUrbz2SD8J0HN1si7MW5d8EqKBSorUgmqCSj71w
	6Vv31i03mP2G+V1UOLObYrXlBumUPzAex3SR556/dWwSZHyxSRQqIwDemiihZVYac48K
	mVnjxF8DUY8SNQyH1VkPwt7akjpLOxER5DBpL89PsF3UYc4+Fxj4ocTO70Ws6xN00rSY
	lajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9M8vypXhX0JmZq2zZ8Th/XOt0J0cVu22CGiTlmjMkZs=;
	b=AxDULjvbKMI27syYCYQoEztUNFSg3ltPMF9bgtNvfka5dWooXOWBhhz/KltfOjiRj7
	TmS6+Tl2fZDgApQJRzkEqJuUAd1GUM2PJp1lx+a+Gkl8FiadqtSjTYYKNFHwsucicOnb
	ZyYJsMEIM9Y7g8RWsX4IqQlz0IoEtUCTbl4J3PhMA8wbNpluxTymIlSyjM/Kk3HvkESX
	2pqHm+BKN0IkfUpYVRt97COt5FkCo+uZ9Hj7edA1L3lF5Dx1kFbi44cgu+g1cr70NIsP
	y+yFXI7I2jGBtOkrizAXgD//K13A+CSWXGD/gGyQREVgBLZqwPqTSstDCI1UgSzgHTIZ
	dhjg==
X-Gm-Message-State: AODbwcCP8TvSlGDhhS+VzLzQfx1AFi+NIJyjMkJ9cJ8WGtGzWVT0nnLA
	/22ZVVqBIoB5SQ==
X-Received: by 10.233.232.213 with SMTP id a204mr1769998qkg.173.1494561259300; 
	Thu, 11 May 2017 20:54:19 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	l14sm1523285qtf.40.2017.05.11.20.54.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 20:54:18 -0700 (PDT)
To: sundeep subbaraya <sundeep.lkml@gmail.com>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-4-git-send-email-sundeep.lkml@gmail.com>
	<1c2aa7d5-be0c-77e4-50f7-2c30b84fb1ed@amsat.org>
	<CALHRZurisA17Y=Gh1PVxrZ1eU72j19HiPeks5gtu7ndVHxetpA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f6367afb-3b4a-a5f8-e0c7-39de42f522b7@amsat.org>
Date: Fri, 12 May 2017 00:54:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CALHRZurisA17Y=Gh1PVxrZ1eU72j19HiPeks5gtu7ndVHxetpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel PATCH 3/5] msf2: Add
 Smartfusion2 SPI controller
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ngMNYrahVv0H

Hi Subbaraya,

On 05/12/2017 12:31 AM, sundeep subbaraya wrote:
> Hi Philippe,
>
> On Wed, May 10, 2017 at 5:42 PM, Philippe Mathieu-Daudé <f4bug@amsat.org>
> wrote:
>
>> Hi Subbaraya,
>>
>> Like my comment for the timer model, I'd name this model "mss_spi".
>> The only difference I see in the SF2 is the STAT8 register.
>> No need to register both devices now but maybe you can add a comment about
>> it?
>>
>
> Ok I will register only SPI0 in SoC file as of now and will add comment.
>

What I mean is the difference I know between mss_spi from SmartFusion 
versus mss_spi from the SmartFusion2 is the STAT8 register.
Your file is SmartFusion2-specific just because of this unused register.

Now since you have the mss_spi modeled and you want to model the SF2 
SoC, you should register both SPI_0 and SPI_1, my comment was not about 
that.

Well forget about this comment about STAT8 difference :) This is not a 
problem and can be improved in the future.

>>
>> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
>>
>>> Modelled Microsemi's Smartfusion2 SPI controller.
>>>
>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> ---
>>>  hw/ssi/Makefile.objs      |   1 +
>>>  hw/ssi/msf2-spi.c         | 378 ++++++++++++++++++++++++++++++
>>> ++++++++++++++++
>>>  include/hw/ssi/msf2-spi.h | 105 +++++++++++++
>>>  3 files changed, 484 insertions(+)
>>>  create mode 100644 hw/ssi/msf2-spi.c
>>>  create mode 100644 include/hw/ssi/msf2-spi.h
>>>
>>> diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
>>> index 487add2..3105c4b 100644
>>> --- a/hw/ssi/Makefile.objs
>>> +++ b/hw/ssi/Makefile.objs
>>> @@ -4,6 +4,7 @@ common-obj-$(CONFIG_XILINX_SPI) += xilinx_spi.o
>>>  common-obj-$(CONFIG_XILINX_SPIPS) += xilinx_spips.o
>>>  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_smc.o
>>>  common-obj-$(CONFIG_STM32F2XX_SPI) += stm32f2xx_spi.o
>>> +common-obj-$(CONFIG_MSF2) += msf2-spi.o
>>>
>>
>> Not a big deal but his define only appears after applying the next patch.
>
> Do I need to reorder the patches?
>

It is probably not important, but for what it's worth if you checkout 
your tree at this patch 3/5 and build, the msf2-spi.o is not compiled.

Although I'm not sure it could bother bissecting an issue in your code.

>>
>>>  obj-$(CONFIG_OMAP) += omap_spi.o
>>>  obj-$(CONFIG_IMX) += imx_spi.o
>>> diff --git a/hw/ssi/msf2-spi.c b/hw/ssi/msf2-spi.c
>>> new file mode 100644
>>> index 0000000..2059ed9
>>> --- /dev/null
>>> +++ b/hw/ssi/msf2-spi.c
>>> @@ -0,0 +1,378 @@
>>> +/*
>>> + * SPI controller model of Microsemi SmartFusion2.
>>> + *
>>> + * Copyright (C) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining
>>> a copy
>>> + * of this software and associated documentation files (the "Software"),
>>> to deal
>>> + * in the Software without restriction, including without limitation the
>>> rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>>> sell
>>> + * copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be
>>> included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>> EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>> MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>>> SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>> OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>> ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>> DEALINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#include "hw/ssi/msf2-spi.h"
>>> +
>>> +#ifndef MSF2_SPI_ERR_DEBUG
>>> +#define MSF2_SPI_ERR_DEBUG   0
>>> +#endif
>>> +
>>> +#define DB_PRINT_L(lvl, fmt, args...) do { \
>>> +    if (MSF2_SPI_ERR_DEBUG >= lvl) { \
>>> +        qemu_log("%s: " fmt, __func__, ## args); \
>>> +    } \
>>> +} while (0);
>>> +
>>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>>> +
>>> +static void txfifo_reset(MSF2SpiState *s)
>>> +{
>>> +    fifo32_reset(&s->tx_fifo);
>>> +
>>> +    s->regs[R_SPI_STATUS] &= ~S_TXFIFOFUL;
>>> +    s->regs[R_SPI_STATUS] |= S_TXFIFOEMP;
>>> +}
>>> +
>>> +static void rxfifo_reset(MSF2SpiState *s)
>>> +{
>>> +    fifo32_reset(&s->rx_fifo);
>>> +
>>> +    s->regs[R_SPI_STATUS] &= ~S_RXFIFOFUL;
>>> +    s->regs[R_SPI_STATUS] |= S_RXFIFOEMP;
>>> +}
>>> +
>>> +static void set_fifodepth(MSF2SpiState *s)
>>> +{
>>> +    int size = s->regs[R_SPI_DFSIZE] & FRAMESZ_MASK;
>>> +
>>> +    if (0 <= size && size <= 8) {
>>> +        s->fifo_depth = 32;
>>> +    }
>>> +    if (9 <= size && size <= 16) {
>>> +        s->fifo_depth = 16;
>>> +    }
>>> +    if (17 <= size && size <= 32) {
>>> +        s->fifo_depth = 8;
>>> +    }
>>> +}
>>> +
>>> +static void msf2_spi_do_reset(MSF2SpiState *s)
>>> +{
>>> +    memset(s->regs, 0, sizeof s->regs);
>>> +    s->regs[R_SPI_CONTROL] = 0x80000102;
>>> +    s->regs[R_SPI_DFSIZE] = 0x4;
>>> +    s->regs[R_SPI_STATUS] = 0x2440;
>>> +    s->regs[R_SPI_CLKGEN] = 0x7;
>>> +    s->regs[R_SPI_STAT8] = 0x7;
>>> +    s->regs[R_SPI_RIS] = 0x0;
>>> +
>>> +    s->fifo_depth = 4;
>>> +    s->frame_count = 1;
>>> +    s->enabled = false;
>>> +
>>> +    rxfifo_reset(s);
>>> +    txfifo_reset(s);
>>> +}
>>> +
>>> +static void update_mis(MSF2SpiState *s)
>>> +{
>>> +    uint32_t reg = s->regs[R_SPI_CONTROL];
>>> +    uint32_t tmp;
>>> +
>>> +    /*
>>> +     * form the Control register interrupt enable bits
>>> +     * same as RIS, MIS and Interrupt clear registers for simplicity
>>> +     */
>>> +    tmp = ((reg & C_INTRXOVRFLO) >> 4) | ((reg & C_INTRXDATA) >> 3) |
>>> +           ((reg & C_INTTXDATA) >> 5);
>>> +    s->regs[R_SPI_MIS] |= tmp & s->regs[R_SPI_RIS];
>>> +}
>>> +
>>> +static void spi_update_irq(MSF2SpiState *s)
>>> +{
>>> +    int irq;
>>> +
>>> +    update_mis(s);
>>> +    irq = !!(s->regs[R_SPI_MIS]);
>>> +
>>> +    qemu_set_irq(s->irq, irq);
>>> +}
>>> +
>>> +static void msf2_spi_reset(DeviceState *d)
>>> +{
>>> +    msf2_spi_do_reset(MSF2_SPI(d));
>>> +}
>>> +
>>> +static uint64_t
>>> +spi_read(void *opaque, hwaddr addr, unsigned int size)
>>> +{
>>> +    MSF2SpiState *s = opaque;
>>> +    uint32_t ret = 0;
>>> +
>>> +    addr >>= 2;
>>> +    switch (addr) {
>>> +    case R_SPI_RX:
>>> +        s->regs[R_SPI_STATUS] &= ~S_RXFIFOFUL;
>>> +        s->regs[R_SPI_STATUS] &= ~RXCHOVRF;
>>> +        ret = fifo32_pop(&s->rx_fifo);
>>> +        if (fifo32_is_empty(&s->rx_fifo)) {
>>> +            s->regs[R_SPI_STATUS] |= S_RXFIFOEMP;
>>> +        }
>>> +        break;
>>> +
>>> +    case R_SPI_MIS:
>>> +        update_mis(s);
>>> +        ret = s->regs[R_SPI_MIS];
>>> +        break;
>>> +
>>> +    default:
>>> +        if (addr < ARRAY_SIZE(s->regs)) {
>>> +            ret = s->regs[addr];
>>> +        } else {
>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
>>> +                         addr * 4);
>>>
>>
>> Drop '\n' while calling qemu_log_mask().
>
> Ok.
>
>>
>>
>> +        }
>>> +        break;
>>> +    }
>>> +
>>> +    DB_PRINT("addr=0x%" HWADDR_PRIx " = 0x%" PRIx32 "\n", addr * 4, ret);
>>> +    spi_update_irq(s);
>>> +    return ret;
>>> +}
>>> +
>>> +static void assert_cs(MSF2SpiState *s)
>>> +{
>>> +    qemu_set_irq(s->cs_line, 0);
>>> +}
>>> +
>>> +static void deassert_cs(MSF2SpiState *s)
>>> +{
>>> +    qemu_set_irq(s->cs_line, 1);
>>> +}
>>> +
>>> +static void spi_flush_txfifo(MSF2SpiState *s)
>>> +{
>>> +    uint32_t tx;
>>> +    uint32_t rx;
>>> +    bool sps = !!(s->regs[R_SPI_CONTROL] & C_SPS);
>>> +
>>> +    /*
>>> +     * Chip Select(CS) is automatically controlled by this controller.
>>> +     * If SPS bit is set in Control register then CS is asserted
>>> +     * until all the frames set in frame count of Control register are
>>> +     * transferred. If SPS is not set then CS pulses between frames.
>>> +     * Note that Slave Select register specifies which of the CS line
>>> +     * has to be controlled automatically by controller. Bits SS[7:1]
>>> are for
>>> +     * masters in FPGA fabric since we model only Microcontroller
>>> subsystem
>>> +     * of Smartfusion2 we control only one CS(SS[0]) line.
>>> +     */
>>> +    while (!fifo32_is_empty(&s->tx_fifo) && s->frame_count) {
>>> +        assert_cs(s);
>>> +
>>> +        s->regs[R_SPI_STATUS] &= ~TXDONE;
>>> +        s->regs[R_SPI_STATUS] &= ~RXRDY;
>>> +
>>> +        tx = fifo32_pop(&s->tx_fifo);
>>> +        DB_PRINT("data tx:0x%" PRIx32 "\n", tx);
>>> +        rx = ssi_transfer(s->spi, tx);
>>> +        DB_PRINT("data rx:0x%" PRIx32 "\n", rx);
>>> +
>>> +        if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
>>> +            s->regs[R_SPI_STATUS] |= RXCHOVRF;
>>> +            s->regs[R_SPI_RIS] |= RXCHOVRF;
>>> +        } else {
>>> +            fifo32_push(&s->rx_fifo, rx);
>>> +            s->regs[R_SPI_STATUS] &= ~S_RXFIFOEMP;
>>> +            if (fifo32_num_used(&s->rx_fifo) == (s->fifo_depth - 1)) {
>>> +                s->regs[R_SPI_STATUS] |= S_RXFIFOFULNXT;
>>> +            }
>>> +            if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
>>> +                s->regs[R_SPI_STATUS] |= S_RXFIFOFUL;
>>> +            }
>>> +        }
>>> +        s->frame_count--;
>>> +        if (!sps) {
>>> +            deassert_cs(s);
>>> +            assert_cs(s);
>>> +        }
>>> +    }
>>> +
>>> +    if (!sps) {
>>> +        deassert_cs(s);
>>> +    }
>>> +
>>> +    if (!s->frame_count) {
>>> +        s->frame_count = (s->regs[R_SPI_CONTROL] & FMCOUNT_MASK) >>
>>> +                            FMCOUNT_SHIFT;
>>> +        if (sps) {
>>> +            deassert_cs(s);
>>> +        }
>>> +        s->regs[R_SPI_RIS] |= TXDONE;
>>> +        s->regs[R_SPI_RIS] |= RXRDY;
>>> +        s->regs[R_SPI_STATUS] |= TXDONE;
>>> +        s->regs[R_SPI_STATUS] |= RXRDY;
>>> +   }
>>> +}
>>> +
>>> +static void spi_write(void *opaque, hwaddr addr,
>>> +            uint64_t val64, unsigned int size)
>>> +{
>>> +    MSF2SpiState *s = opaque;
>>> +    uint32_t value = val64;
>>> +
>>> +    DB_PRINT("addr=0x%" HWADDR_PRIx " =0x%" PRIx32 "\n", addr, value);
>>> +    addr >>= 2;
>>> +
>>> +    switch (addr) {
>>> +    case R_SPI_TX:
>>> +        /* adding to already full FIFO */
>>> +        if (fifo32_num_used(&s->tx_fifo) == s->fifo_depth) {
>>> +            break;
>>> +        }
>>> +        s->regs[R_SPI_STATUS] &= ~S_TXFIFOEMP;
>>> +        fifo32_push(&s->tx_fifo, value);
>>> +        if (fifo32_num_used(&s->tx_fifo) == (s->fifo_depth - 1)) {
>>> +            s->regs[R_SPI_STATUS] |= S_TXFIFOFULNXT;
>>> +        }
>>> +        if (fifo32_num_used(&s->tx_fifo) == s->fifo_depth) {
>>> +            s->regs[R_SPI_STATUS] |= S_TXFIFOFUL;
>>> +        }
>>> +        if (s->enabled) {
>>> +            spi_flush_txfifo(s);
>>> +        }
>>> +        break;
>>> +
>>> +    case R_SPI_CONTROL:
>>> +        s->regs[R_SPI_CONTROL] = value;
>>> +        if (value & C_BIGFIFO) {
>>> +            set_fifodepth(s);
>>> +        } else {
>>> +            s->fifo_depth = 4;
>>> +        }
>>> +        if (value & C_ENABLE) {
>>> +            s->enabled = true;
>>> +        } else {
>>> +            s->enabled = false;
>>> +        }
>>> +        s->frame_count = (value & FMCOUNT_MASK) >> FMCOUNT_SHIFT;
>>> +        if (value & C_RESET) {
>>> +            msf2_spi_do_reset(s);
>>> +        }
>>> +        break;
>>> +
>>> +    case R_SPI_DFSIZE:
>>> +        if (s->enabled) {
>>> +            break;
>>> +        }
>>> +        s->regs[R_SPI_DFSIZE] = value;
>>> +        break;
>>> +
>>> +    case R_SPI_INTCLR:
>>> +        s->regs[R_SPI_INTCLR] = value;
>>> +        if (value & TXDONE) {
>>> +            s->regs[R_SPI_RIS] &= ~TXDONE;
>>> +        }
>>> +        if (value & RXRDY) {
>>> +            s->regs[R_SPI_RIS] &= ~RXRDY;
>>> +        }
>>> +        if (value & RXCHOVRF) {
>>> +            s->regs[R_SPI_RIS] &= ~RXCHOVRF;
>>> +        }
>>> +        break;
>>> +
>>> +    case R_SPI_MIS:
>>> +    case R_SPI_STATUS:
>>> +    case R_SPI_RIS:
>>> +        break;
>>> +
>>> +    default:
>>> +        if (addr < ARRAY_SIZE(s->regs)) {
>>> +            s->regs[addr] = value;
>>> +        } else {
>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
>>> +                         addr * 4);
>>> +        }
>>> +        break;
>>> +    }
>>> +
>>> +    spi_update_irq(s);
>>> +}
>>> +
>>> +static const MemoryRegionOps spi_ops = {
>>> +    .read = spi_read,
>>> +    .write = spi_write,
>>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>> +    .valid = {
>>> +        .min_access_size = 4,
>>> +        .max_access_size = 4
>>> +    }
>>> +};
>>> +
>>> +static void msf2_spi_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    MSF2SpiState *s = MSF2_SPI(dev);
>>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>> +
>>> +    DB_PRINT("\n");
>>> +
>>> +    s->spi = ssi_create_bus(dev, "spi0");
>>> +
>>> +    sysbus_init_irq(sbd, &s->irq);
>>> +    ssi_auto_connect_slaves(dev, &s->cs_line, s->spi);
>>> +    sysbus_init_irq(sbd, &s->cs_line);
>>> +
>>> +    memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
>>> +                          TYPE_MSF2_SPI, R_SPI_MAX * 4);
>>> +    sysbus_init_mmio(sbd, &s->mmio);
>>> +
>>> +    fifo32_create(&s->tx_fifo, FIFO_CAPACITY);
>>> +    fifo32_create(&s->rx_fifo, FIFO_CAPACITY);
>>> +}
>>> +
>>> +static const VMStateDescription vmstate_msf2_spi = {
>>> +    .name = TYPE_MSF2_SPI,
>>> +    .version_id = 1,
>>> +    .minimum_version_id = 1,
>>> +    .fields = (VMStateField[]) {
>>> +        VMSTATE_FIFO32(tx_fifo, MSF2SpiState),
>>> +        VMSTATE_FIFO32(rx_fifo, MSF2SpiState),
>>> +        VMSTATE_UINT32_ARRAY(regs, MSF2SpiState, R_SPI_MAX),
>>> +        VMSTATE_END_OF_LIST()
>>> +    }
>>> +};
>>> +
>>> +static void msf2_spi_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +
>>> +    dc->realize = msf2_spi_realize;
>>> +    dc->reset = msf2_spi_reset;
>>> +    dc->vmsd = &vmstate_msf2_spi;
>>> +}
>>> +
>>> +static const TypeInfo msf2_spi_info = {
>>> +    .name           = TYPE_MSF2_SPI,
>>> +    .parent         = TYPE_SYS_BUS_DEVICE,
>>> +    .instance_size  = sizeof(MSF2SpiState),
>>> +    .class_init     = msf2_spi_class_init,
>>> +};
>>> +
>>> +static void msf2_spi_register_types(void)
>>> +{
>>> +    type_register_static(&msf2_spi_info);
>>> +}
>>> +
>>> +type_init(msf2_spi_register_types)
>>> diff --git a/include/hw/ssi/msf2-spi.h b/include/hw/ssi/msf2-spi.h
>>> new file mode 100644
>>> index 0000000..585edde
>>> --- /dev/null
>>> +++ b/include/hw/ssi/msf2-spi.h
>>> @@ -0,0 +1,105 @@
>>> +/*
>>> + * Microsemi SmartFusion2 SPI
>>> + *
>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining
>>> a copy
>>> + * of this software and associated documentation files (the "Software"),
>>> to deal
>>> + * in the Software without restriction, including without limitation the
>>> rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>>> sell
>>> + * copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be
>>> included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>> EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>> MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>>> SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>> OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>> ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>> DEALINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#ifndef HW_MSF2_SPI_H
>>> +#define HW_MSF2_SPI_H
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "hw/sysbus.h"
>>> +#include "hw/hw.h"
>>> +#include "hw/ssi/ssi.h"
>>> +#include "qemu/fifo32.h"
>>> +#include "sysemu/sysemu.h"
>>> +#include "qemu/log.h"
>>> +
>>> +#define FIFO_CAPACITY     32
>>> +#define FIFO_CAPACITY     32
>>> +
>>> +#define R_SPI_CONTROL         0
>>> +#define R_SPI_DFSIZE          1
>>> +#define R_SPI_STATUS          2
>>> +#define R_SPI_INTCLR          3
>>> +#define R_SPI_RX              4
>>> +#define R_SPI_TX              5
>>> +#define R_SPI_CLKGEN          6
>>> +#define R_SPI_SS              7
>>> +#define R_SPI_MIS             8
>>> +#define R_SPI_RIS             9
>>> +#define R_SPI_STAT8           15
>>> +#define R_SPI_MAX             16
>>> +
>>> +#define S_RXFIFOFUL       (1 << 4)
>>> +#define S_RXFIFOFULNXT    (1 << 5)
>>> +#define S_RXFIFOEMP       (1 << 6)
>>> +#define S_RXFIFOEMPNXT    (1 << 7)
>>> +#define S_TXFIFOFUL       (1 << 8)
>>> +#define S_TXFIFOFULNXT    (1 << 9)
>>> +#define S_TXFIFOEMP       (1 << 10)
>>> +#define S_TXFIFOEMPNXT    (1 << 11)
>>> +#define S_FRAMESTART      (1 << 12)
>>> +#define S_SSEL            (1 << 13)
>>> +#define S_ACTIVE          (1 << 14)
>>> +
>>> +#define C_ENABLE          (1 << 0)
>>> +#define C_MODE            (1 << 1)
>>> +#define C_INTRXDATA       (1 << 4)
>>> +#define C_INTTXDATA       (1 << 5)
>>> +#define C_INTRXOVRFLO     (1 << 6)
>>> +#define C_SPS             (1 << 26)
>>> +#define C_BIGFIFO         (1 << 29)
>>> +#define C_RESET           (1 << 31)
>>> +
>>> +#define FRAMESZ_MASK      0x1F
>>> +#define FMCOUNT_MASK      0x00FFFF00
>>> +#define FMCOUNT_SHIFT     8
>>> +
>>> +#define TXDONE            (1 << 0)
>>> +#define RXRDY             (1 << 1)
>>> +#define RXCHOVRF          (1 << 2)
>>> +
>>> +#define TYPE_MSF2_SPI   "msf2-spi"
>>> +#define MSF2_SPI(obj)   OBJECT_CHECK(MSF2SpiState, (obj), TYPE_MSF2_SPI)
>>> +
>>> +typedef struct MSF2SpiState {
>>> +    SysBusDevice parent_obj;
>>> +
>>> +    MemoryRegion mmio;
>>> +
>>> +    qemu_irq irq;
>>> +
>>> +    qemu_irq cs_line;
>>> +
>>> +    SSIBus *spi;
>>> +
>>> +    Fifo32 rx_fifo;
>>> +    Fifo32 tx_fifo;
>>> +
>>> +    int fifo_depth;
>>> +    uint32_t frame_count;
>>> +    bool enabled;
>>> +
>>> +    uint32_t regs[R_SPI_MAX];
>>> +} MSF2SpiState;
>>> +
>>> +#endif /* HW_MSF2_SPI_H */
>>>
>>>
>> Regards,
>>
>> Phil.
>>
> Thanks,
> Sundeep
>
