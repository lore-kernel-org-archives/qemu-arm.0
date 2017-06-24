Received: by 10.25.15.197 with SMTP id 66csp515509lfp;
        Sat, 24 Jun 2017 00:43:25 -0700 (PDT)
X-Received: by 10.200.44.150 with SMTP id 22mr13564675qtw.173.1498290205118;
        Sat, 24 Jun 2017 00:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498290205; cv=none;
        d=google.com; s=arc-20160816;
        b=f1UVaEfKBLZkIPaw2I7O3TUfLy99U08JDVevTvQY67mQC3ZwuYrGtNFb19iEqjRrF2
         WrbAgp78CQc05ez7xzGvhOhp2EhkFlxfoXJibysx8QOvBuWJjITE1LlfVbAUudR4vWKE
         n5dLjePK/Y31JYNbJhVwrZ5Rk7B1rLwtPbWcmwHP2EHk6+mMsVe0Af+hjnTJW+H5q+SH
         dWIyqjPbgAAvc3UcGCOFySNs1qtaZ5JHHcaSJgIkvJqi6Q4ErdZ3VftzrBUUoSSKqa84
         O6HlNn6FvPb+WMOyeXaCy8+AGutZZps0WEDmvbh6k29FvS0apUYhDFiSF6e1+3RaXSLa
         EdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=L677pGDkIdRpzRBq8KYzpJbZTEUDpCbGTmXPrdgI/lk=;
        b=L1DBNylDbiBQvzI0+o11eVxfF+hIdtAnD9hWbe4EZi4tacbbDBSAoT41nmbGPVxnTw
         BQ8P8F+aWeAcxlbmDSOn+zRfSgNzn/1iRfo15q1vV7llmCAQ9R4j4RxsYIarunT6hakD
         4Jxo1r54wswpIcaAJYWDHBb60dqBdXv4qLpF4GXsnr4Dz7XSCMoEReEWd7RACfH0zI9H
         G0HPNySoWfhTmk3Ip6C/gXC7ZSXzFRUkdOkBuECPJkGStCG2ynvpb4iVlybw0L7ov6M/
         PJf29/F6N6bTKP5FHPNWY7PuVQAPNaZ+phrzDq+oIEWgx8JGAhfa9OrkHElGwVxjVHKs
         68nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=K0iJ13Y/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p51si6011087qtc.73.2017.06.24.00.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Jun 2017 00:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=K0iJ13Y/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38472 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dOfiz-0005Ln-Tj
	for alex.bennee@linaro.org; Sat, 24 Jun 2017 03:43:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dOfik-0005IX-U2
	for qemu-arm@nongnu.org; Sat, 24 Jun 2017 03:43:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dOfih-0000Ra-Gf
	for qemu-arm@nongnu.org; Sat, 24 Jun 2017 03:43:06 -0400
Received: from mail-yw0-x243.google.com ([2607:f8b0:4002:c05::243]:36166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dOfia-0000Nb-3r; Sat, 24 Jun 2017 03:42:56 -0400
Received: by mail-yw0-x243.google.com with SMTP id s127so3866441ywg.3;
	Sat, 24 Jun 2017 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L677pGDkIdRpzRBq8KYzpJbZTEUDpCbGTmXPrdgI/lk=;
	b=K0iJ13Y/uI3XsirjEgl3Hc5cH9h5TrjruFNG4TzE8QTnOQvQumXVVZZDijyv/7/836
	RAD3t3Tyd+54yhv53/rIV+KeLosEYBzXzac0tyMUwQ0+h76Rgw898SQFRkXSmllezmdP
	79X4GB81pUMN8/OcMrOIotYQ+OeBUyRHnfvo7oEe4oHt5mvvgQW8szCC/deE6/AvapT0
	JSBz8jRKK7B/xlM3CDpGKTa6ZH6HcVPLvQKDN6Jgs4y9fq99yGaBdF6GYeTL851Bdaqz
	sU2Z8CQvPUk2xGCFDgOCT4AnSphubQywhmv5sLF5QUBSLj+5rQCmIuc5x58R0p8m8S6l
	BhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L677pGDkIdRpzRBq8KYzpJbZTEUDpCbGTmXPrdgI/lk=;
	b=h4dmF5PYjefIB+5hxPvs8pNZfFg0RWPlik4G98NgPcoA3yS0hbymgw/XW4mg2aMCfO
	OpXqse5LXmQyFeGGmIEfhLOjHjU+IgMnQASJZu0gkd7VyTpQ70VJe7vpGc2OwuQgAM6l
	Kg/+GeRR/lbZi7z7hN672hIbMIELa2DtV29AI9GZjvbAy0lLfhLgEg3ejkLX+CCDypnp
	jZbN4YGGKfr1Im2kaOZbe+MI8dzCkBDyJt5SR6fuAFhv4L3gVstD5oOvILR8t9lpXxB8
	oTkK5KmgG7gyxtwghWhxycGahJ/qflROSDyIEtfoiNJlCxSbl3FaQHKIajOlaoRecQ3l
	Wcfg==
X-Gm-Message-State: AKS2vOyenUWynzZ0OFWklXiatPGG3EI1KOJqpueoU1gebPCTjZO89eK5
	j0RTFUVveJYQS7iHBLwriH4YOr1usg==
X-Received: by 10.129.44.130 with SMTP id s124mr8453149yws.2.1498290173892;
	Sat, 24 Jun 2017 00:42:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.65 with HTTP; Sat, 24 Jun 2017 00:42:53 -0700 (PDT)
In-Reply-To: <88198632-0a9c-0768-dd1e-3ecf2472e2be@amsat.org>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-4-git-send-email-sundeep.lkml@gmail.com>
	<88198632-0a9c-0768-dd1e-3ecf2472e2be@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Sat, 24 Jun 2017 13:12:53 +0530
Message-ID: <CALHRZuokB2CzMhv-0f1LegdcAwq2gWEzr53WdFrJc3RPRVqx1g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a1140e0cc95e16e0552afddc3"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::243
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 3/5] msf2: Add Smartfusion2 SPI
 controller
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
X-TUID: AbByuiEwmx6T

--001a1140e0cc95e16e0552afddc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Tue, May 30, 2017 at 6:45 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

>
>
> On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>
>> Modelled Microsemi's Smartfusion2 SPI controller.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>  hw/ssi/Makefile.objs     |   1 +
>>  hw/ssi/mss-spi.c         | 378 ++++++++++++++++++++++++++++++
>> +++++++++++++++++
>>  include/hw/ssi/mss-spi.h | 104 +++++++++++++
>>  3 files changed, 483 insertions(+)
>>  create mode 100644 hw/ssi/mss-spi.c
>>  create mode 100644 include/hw/ssi/mss-spi.h
>>
>> diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
>> index 487add2..f5bcc65 100644
>> --- a/hw/ssi/Makefile.objs
>> +++ b/hw/ssi/Makefile.objs
>> @@ -4,6 +4,7 @@ common-obj-$(CONFIG_XILINX_SPI) +=3D xilinx_spi.o
>>  common-obj-$(CONFIG_XILINX_SPIPS) +=3D xilinx_spips.o
>>  common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_smc.o
>>  common-obj-$(CONFIG_STM32F2XX_SPI) +=3D stm32f2xx_spi.o
>> +common-obj-$(CONFIG_MSF2) +=3D mss-spi.o
>>
>>  obj-$(CONFIG_OMAP) +=3D omap_spi.o
>>  obj-$(CONFIG_IMX) +=3D imx_spi.o
>> diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
>> new file mode 100644
>> index 0000000..0b88ec9
>> --- /dev/null
>> +++ b/hw/ssi/mss-spi.c
>> @@ -0,0 +1,378 @@
>> +/*
>> + * Block model of SPI controller present in
>> + * Microsemi's SmartFusion2 and SmartFusion SoCs.
>> + *
>> + * Copyright (C) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "hw/ssi/mss-spi.h"
>> +
>> +#ifndef MSS_SPI_ERR_DEBUG
>> +#define MSS_SPI_ERR_DEBUG   0
>> +#endif
>> +
>> +#define DB_PRINT_L(lvl, fmt, args...) do { \
>> +    if (MSS_SPI_ERR_DEBUG >=3D lvl) { \
>> +        qemu_log("%s: " fmt, __func__, ## args); \
>>
>
> Since you use newline in all your calls, you could move it here:
>
>     qemu_log("%s: " fmt "\n", __func__, ## args);
>
> Ok

> +    } \
>> +} while (0);
>> +
>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> +
>> +static void txfifo_reset(MSSSpiState *s)
>> +{
>> +    fifo32_reset(&s->tx_fifo);
>> +
>> +    s->regs[R_SPI_STATUS] &=3D ~S_TXFIFOFUL;
>> +    s->regs[R_SPI_STATUS] |=3D S_TXFIFOEMP;
>> +}
>> +
>> +static void rxfifo_reset(MSSSpiState *s)
>> +{
>> +    fifo32_reset(&s->rx_fifo);
>> +
>> +    s->regs[R_SPI_STATUS] &=3D ~S_RXFIFOFUL;
>> +    s->regs[R_SPI_STATUS] |=3D S_RXFIFOEMP;
>> +}
>> +
>> +static void set_fifodepth(MSSSpiState *s)
>> +{
>> +    int size =3D s->regs[R_SPI_DFSIZE] & FRAMESZ_MASK;
>>
>
> This size is unsigned, isn't it?


Yes will change it.

>
>
> +
>> +    if (0 <=3D size && size <=3D 8) {
>>
>
> So "if (size <=3D 8)"
>
> +        s->fifo_depth =3D 32;
>> +    }
>> +    if (9 <=3D size && size <=3D 16) {
>>
>
> "else if (size <=3D 16)"
>
> +        s->fifo_depth =3D 16;
>> +    }
>> +    if (17 <=3D size && size <=3D 32) {
>>
>
> else if
>
> +        s->fifo_depth =3D 8;
>> +    }
>>
>
> else
>
> s->fifo_depth =3D 4;
>
> ?
>
> Ok will change it.

> +}
>> +
>> +static void mss_spi_do_reset(MSSSpiState *s)
>> +{
>> +    memset(s->regs, 0, sizeof s->regs);
>> +    s->regs[R_SPI_CONTROL] =3D 0x80000102;
>> +    s->regs[R_SPI_DFSIZE] =3D 0x4;
>> +    s->regs[R_SPI_STATUS] =3D 0x2440;
>>
>
> " =3D S_SSEL | S_TXFIFOEMP | S_RXFIFOEMP;"


OK.

>
>
> +    s->regs[R_SPI_CLKGEN] =3D 0x7;
>> +    s->regs[R_SPI_RIS] =3D 0x0;
>> +
>> +    s->fifo_depth =3D 4;
>>
>
> Resetting R_SPI_DFSIZE to 4, shouldn't fifo_depth be 32?


FIFO depth is 4 by default and  it varies based on BIGFIFO bit in control
register and frame size.

>
>
> +    s->frame_count =3D 1;
>> +    s->enabled =3D false;
>> +
>> +    rxfifo_reset(s);
>> +    txfifo_reset(s);
>> +}
>> +
>> +static void update_mis(MSSSpiState *s)
>> +{
>> +    uint32_t reg =3D s->regs[R_SPI_CONTROL];
>> +    uint32_t tmp;
>> +
>> +    /*
>> +     * form the Control register interrupt enable bits
>> +     * same as RIS, MIS and Interrupt clear registers for simplicity
>> +     */
>> +    tmp =3D ((reg & C_INTRXOVRFLO) >> 4) | ((reg & C_INTRXDATA) >> 3) |
>> +           ((reg & C_INTTXDATA) >> 5);
>> +    s->regs[R_SPI_MIS] |=3D tmp & s->regs[R_SPI_RIS];
>> +}
>> +
>> +static void spi_update_irq(MSSSpiState *s)
>> +{
>> +    int irq;
>> +
>> +    update_mis(s);
>> +    irq =3D !!(s->regs[R_SPI_MIS]);
>> +
>> +    qemu_set_irq(s->irq, irq);
>> +}
>> +
>> +static void mss_spi_reset(DeviceState *d)
>> +{
>> +    mss_spi_do_reset(MSS_SPI(d));
>> +}
>> +
>> +static uint64_t
>> +spi_read(void *opaque, hwaddr addr, unsigned int size)
>> +{
>> +    MSSSpiState *s =3D opaque;
>> +    uint32_t ret =3D 0;
>> +
>> +    addr >>=3D 2;
>> +    switch (addr) {
>> +    case R_SPI_RX:
>> +        s->regs[R_SPI_STATUS] &=3D ~S_RXFIFOFUL;
>> +        s->regs[R_SPI_STATUS] &=3D ~RXCHOVRF;
>> +        ret =3D fifo32_pop(&s->rx_fifo);
>> +        if (fifo32_is_empty(&s->rx_fifo)) {
>> +            s->regs[R_SPI_STATUS] |=3D S_RXFIFOEMP;
>> +        }
>> +        break;
>> +
>> +    case R_SPI_MIS:
>> +        update_mis(s);
>> +        ret =3D s->regs[R_SPI_MIS];
>> +        break;
>> +
>> +    default:
>> +        if (addr < ARRAY_SIZE(s->regs)) {
>> +            ret =3D s->regs[addr];
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func_=
_,
>> +                         addr * 4);
>> +        }
>> +        break;
>> +    }
>> +
>> +    DB_PRINT("addr=3D0x%" HWADDR_PRIx " =3D 0x%" PRIx32 "\n", addr * 4,=
 ret);
>> +    spi_update_irq(s);
>> +    return ret;
>> +}
>> +
>> +static void assert_cs(MSSSpiState *s)
>> +{
>> +    qemu_set_irq(s->cs_line, 0);
>> +}
>> +
>> +static void deassert_cs(MSSSpiState *s)
>> +{
>> +    qemu_set_irq(s->cs_line, 1);
>> +}
>> +
>> +static void spi_flush_txfifo(MSSSpiState *s)
>> +{
>> +    uint32_t tx;
>> +    uint32_t rx;
>> +    bool sps =3D !!(s->regs[R_SPI_CONTROL] & C_SPS);
>> +
>> +    /*
>> +     * Chip Select(CS) is automatically controlled by this controller.
>> +     * If SPS bit is set in Control register then CS is asserted
>> +     * until all the frames set in frame count of Control register are
>> +     * transferred. If SPS is not set then CS pulses between frames.
>> +     * Note that Slave Select register specifies which of the CS line
>> +     * has to be controlled automatically by controller. Bits SS[7:1]
>> are for
>> +     * masters in FPGA fabric since we model only Microcontroller
>> subsystem
>> +     * of Smartfusion2 we control only one CS(SS[0]) line.
>> +     */
>> +    while (!fifo32_is_empty(&s->tx_fifo) && s->frame_count) {
>> +        assert_cs(s);
>> +
>> +        s->regs[R_SPI_STATUS] &=3D ~TXDONE;
>> +        s->regs[R_SPI_STATUS] &=3D ~RXRDY;
>>
>
> You can simplify as "&=3D ~(S_TXDONE | S_RXRDY);"


Ok.

>
>
> +
>> +        tx =3D fifo32_pop(&s->tx_fifo);
>> +        DB_PRINT("data tx:0x%" PRIx32 "\n", tx);
>> +        rx =3D ssi_transfer(s->spi, tx);
>> +        DB_PRINT("data rx:0x%" PRIx32 "\n", rx);
>> +
>> +        if (fifo32_num_used(&s->rx_fifo) =3D=3D s->fifo_depth) {
>> +            s->regs[R_SPI_STATUS] |=3D RXCHOVRF;
>> +            s->regs[R_SPI_RIS] |=3D RXCHOVRF;
>> +        } else {
>> +            fifo32_push(&s->rx_fifo, rx);
>> +            s->regs[R_SPI_STATUS] &=3D ~S_RXFIFOEMP;
>> +            if (fifo32_num_used(&s->rx_fifo) =3D=3D (s->fifo_depth - 1)=
) {
>> +                s->regs[R_SPI_STATUS] |=3D S_RXFIFOFULNXT;
>> +            }
>> +            if (fifo32_num_used(&s->rx_fifo) =3D=3D s->fifo_depth) {
>> +                s->regs[R_SPI_STATUS] |=3D S_RXFIFOFUL;
>> +            }
>> +        }
>> +        s->frame_count--;
>> +        if (!sps) {
>> +            deassert_cs(s);
>> +            assert_cs(s);
>> +        }
>> +    }
>> +
>> +    if (!sps) {
>> +        deassert_cs(s);
>> +    }
>> +
>> +    if (!s->frame_count) {
>> +        s->frame_count =3D (s->regs[R_SPI_CONTROL] & FMCOUNT_MASK) >>
>> +                            FMCOUNT_SHIFT;
>> +        if (sps) {
>> +            deassert_cs(s);
>> +        }
>> +        s->regs[R_SPI_RIS] |=3D TXDONE;
>> +        s->regs[R_SPI_RIS] |=3D RXRDY;
>>
>
> Same, "|=3D S_TXDONE | S_RXDRY;"


Ok.

>
>
> +        s->regs[R_SPI_STATUS] |=3D TXDONE;
>> +        s->regs[R_SPI_STATUS] |=3D RXRDY;
>> +   }
>> +}
>> +
>> +static void spi_write(void *opaque, hwaddr addr,
>> +            uint64_t val64, unsigned int size)
>> +{
>> +    MSSSpiState *s =3D opaque;
>> +    uint32_t value =3D val64;
>> +
>> +    DB_PRINT("addr=3D0x%" HWADDR_PRIx " =3D0x%" PRIx32 "\n", addr, valu=
e);
>> +    addr >>=3D 2;
>> +
>> +    switch (addr) {
>> +    case R_SPI_TX:
>> +        /* adding to already full FIFO */
>> +        if (fifo32_num_used(&s->tx_fifo) =3D=3D s->fifo_depth) {
>> +            break;
>> +        }
>> +        s->regs[R_SPI_STATUS] &=3D ~S_TXFIFOEMP;
>> +        fifo32_push(&s->tx_fifo, value);
>> +        if (fifo32_num_used(&s->tx_fifo) =3D=3D (s->fifo_depth - 1)) {
>> +            s->regs[R_SPI_STATUS] |=3D S_TXFIFOFULNXT;
>> +        }
>> +        if (fifo32_num_used(&s->tx_fifo) =3D=3D s->fifo_depth) {
>> +            s->regs[R_SPI_STATUS] |=3D S_TXFIFOFUL;
>> +        }
>> +        if (s->enabled) {
>> +            spi_flush_txfifo(s);
>> +        }
>> +        break;
>> +
>> +    case R_SPI_CONTROL:
>> +        s->regs[R_SPI_CONTROL] =3D value;
>> +        if (value & C_BIGFIFO) {
>> +            set_fifodepth(s);
>> +        } else {
>> +            s->fifo_depth =3D 4;
>> +        }
>> +        if (value & C_ENABLE) {
>> +            s->enabled =3D true;
>> +        } else {
>> +            s->enabled =3D false;
>> +        }
>>
>
> "s->enabled =3D value & C_ENABLE;" ?


Ok.

>
>
> +        s->frame_count =3D (value & FMCOUNT_MASK) >> FMCOUNT_SHIFT;
>> +        if (value & C_RESET) {
>> +            mss_spi_do_reset(s);
>> +        }
>> +        break;
>> +
>> +    case R_SPI_DFSIZE:
>> +        if (s->enabled) {
>> +            break;
>> +        }
>> +        s->regs[R_SPI_DFSIZE] =3D value;
>> +        break;
>> +
>> +    case R_SPI_INTCLR:
>> +        s->regs[R_SPI_INTCLR] =3D value;
>> +        if (value & TXDONE) {
>> +            s->regs[R_SPI_RIS] &=3D ~TXDONE;
>> +        }
>> +        if (value & RXRDY) {
>> +            s->regs[R_SPI_RIS] &=3D ~RXRDY;
>> +        }
>> +        if (value & RXCHOVRF) {
>> +            s->regs[R_SPI_RIS] &=3D ~RXCHOVRF;
>> +        }
>> +        break;
>> +
>> +    case R_SPI_MIS:
>> +    case R_SPI_STATUS:
>> +    case R_SPI_RIS:
>> +        break;
>>
>
> Those registers are read-only right? Maybe you should LOG_GUEST_ERROR her=
e
> too?


Ok.

>
>
> +
>> +    default:
>> +        if (addr < ARRAY_SIZE(s->regs)) {
>> +            s->regs[addr] =3D value;
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func_=
_,
>> +                         addr * 4);
>> +        }
>> +        break;
>> +    }
>> +
>> +    spi_update_irq(s);
>> +}
>> +
>> +static const MemoryRegionOps spi_ops =3D {
>> +    .read =3D spi_read,
>> +    .write =3D spi_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +    .valid =3D {
>> +        .min_access_size =3D 1,
>> +        .max_access_size =3D 4
>> +    }
>> +};
>> +
>> +static void mss_spi_realize(DeviceState *dev, Error **errp)
>> +{
>> +    MSSSpiState *s =3D MSS_SPI(dev);
>> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
>> +
>> +    DB_PRINT("\n");
>> +
>> +    s->spi =3D ssi_create_bus(dev, "spi0");
>>
>
> "0" is the Linux representation?


Yeah will remove 0.

>
>
> +
>> +    sysbus_init_irq(sbd, &s->irq);
>> +    ssi_auto_connect_slaves(dev, &s->cs_line, s->spi);
>> +    sysbus_init_irq(sbd, &s->cs_line);
>> +
>> +    memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
>> +                          TYPE_MSS_SPI, R_SPI_MAX * 4);
>> +    sysbus_init_mmio(sbd, &s->mmio);
>> +
>> +    fifo32_create(&s->tx_fifo, FIFO_CAPACITY);
>> +    fifo32_create(&s->rx_fifo, FIFO_CAPACITY);
>> +}
>> +
>> +static const VMStateDescription vmstate_mss_spi =3D {
>> +    .name =3D TYPE_MSS_SPI,
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_FIFO32(tx_fifo, MSSSpiState),
>> +        VMSTATE_FIFO32(rx_fifo, MSSSpiState),
>> +        VMSTATE_UINT32_ARRAY(regs, MSSSpiState, R_SPI_MAX),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void mss_spi_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->realize =3D mss_spi_realize;
>> +    dc->reset =3D mss_spi_reset;
>> +    dc->vmsd =3D &vmstate_mss_spi;
>> +}
>> +
>> +static const TypeInfo mss_spi_info =3D {
>> +    .name           =3D TYPE_MSS_SPI,
>> +    .parent         =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size  =3D sizeof(MSSSpiState),
>> +    .class_init     =3D mss_spi_class_init,
>> +};
>> +
>> +static void mss_spi_register_types(void)
>> +{
>> +    type_register_static(&mss_spi_info);
>> +}
>> +
>> +type_init(mss_spi_register_types)
>> diff --git a/include/hw/ssi/mss-spi.h b/include/hw/ssi/mss-spi.h
>> new file mode 100644
>> index 0000000..091307a
>> --- /dev/null
>> +++ b/include/hw/ssi/mss-spi.h
>> @@ -0,0 +1,104 @@
>> +/*
>> + * Microsemi SmartFusion2 SPI
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef HW_MSS_SPI_H
>> +#define HW_MSS_SPI_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/hw.h"
>> +#include "hw/ssi/ssi.h"
>> +#include "qemu/fifo32.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qemu/log.h"
>> +
>> +#define FIFO_CAPACITY     32
>> +#define FIFO_CAPACITY     32
>> +
>> +#define R_SPI_CONTROL         0
>> +#define R_SPI_DFSIZE          1
>> +#define R_SPI_STATUS          2
>> +#define R_SPI_INTCLR          3
>> +#define R_SPI_RX              4
>> +#define R_SPI_TX              5
>> +#define R_SPI_CLKGEN          6
>> +#define R_SPI_SS              7
>> +#define R_SPI_MIS             8
>> +#define R_SPI_RIS             9
>> +#define R_SPI_MAX             16
>> +
>> +#define S_RXFIFOFUL       (1 << 4)
>> +#define S_RXFIFOFULNXT    (1 << 5)
>> +#define S_RXFIFOEMP       (1 << 6)
>> +#define S_RXFIFOEMPNXT    (1 << 7)
>> +#define S_TXFIFOFUL       (1 << 8)
>> +#define S_TXFIFOFULNXT    (1 << 9)
>> +#define S_TXFIFOEMP       (1 << 10)
>> +#define S_TXFIFOEMPNXT    (1 << 11)
>> +#define S_FRAMESTART      (1 << 12)
>> +#define S_SSEL            (1 << 13)
>> +#define S_ACTIVE          (1 << 14)
>> +
>> +#define C_ENABLE          (1 << 0)
>> +#define C_MODE            (1 << 1)
>> +#define C_INTRXDATA       (1 << 4)
>> +#define C_INTTXDATA       (1 << 5)
>> +#define C_INTRXOVRFLO     (1 << 6)
>> +#define C_SPS             (1 << 26)
>> +#define C_BIGFIFO         (1 << 29)
>> +#define C_RESET           (1 << 31)
>> +
>> +#define FRAMESZ_MASK      0x1F
>> +#define FMCOUNT_MASK      0x00FFFF00
>> +#define FMCOUNT_SHIFT     8
>> +
>>
>
> Try to keep the previous definitions in the C source, since there are not
> useful outside of it. Except R_SPI_MAX I think you can move all of them.
>
> OK

> +#define TXDONE            (1 << 0)
>> +#define RXRDY             (1 << 1)
>> +#define RXCHOVRF          (1 << 2)
>> +
>>
>
> These last 3 seems to be S_TXDONE, S_RXRDY, S_RXCHOVRF.
>
>
> Ok

Thanks,
Sundeep

>
> +#define TYPE_MSS_SPI   "mss-spi"
>> +#define MSS_SPI(obj)   OBJECT_CHECK(MSSSpiState, (obj), TYPE_MSS_SPI)
>> +
>> +typedef struct MSSSpiState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion mmio;
>> +
>> +    qemu_irq irq;
>> +
>> +    qemu_irq cs_line;
>> +
>> +    SSIBus *spi;
>> +
>> +    Fifo32 rx_fifo;
>> +    Fifo32 tx_fifo;
>> +
>> +    int fifo_depth;
>> +    uint32_t frame_count;
>> +    bool enabled;
>> +
>> +    uint32_t regs[R_SPI_MAX];
>> +} MSSSpiState;
>> +
>> +#endif /* HW_MSS_SPI_H */
>>
>>
> Regards,
>
> Phil.
>

--001a1140e0cc95e16e0552afddc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Tue, May 30, 2017 at 6:45 PM, Philippe Mathieu-Daud=C3=A9 <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4=
bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
class=3D"m_4987516660966386481m_-6144861094152341240HOEnZb"><div class=3D"m=
_4987516660966386481m_-6144861094152341240h5"><br>
<br>
On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Modelled Microsemi&#39;s Smartfusion2 SPI controller.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/ssi/Makefile.objs=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/ssi/mss-spi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 378 +++++++++++++=
+++++++++++++++++<wbr>+++++++++++++++++<br>
=C2=A0include/hw/ssi/mss-spi.h | 104 +++++++++++++<br>
=C2=A03 files changed, 483 insertions(+)<br>
=C2=A0create mode 100644 hw/ssi/mss-spi.c<br>
=C2=A0create mode 100644 include/hw/ssi/mss-spi.h<br>
<br>
diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs<br>
index 487add2..f5bcc65 100644<br>
--- a/hw/ssi/Makefile.objs<br>
+++ b/hw/ssi/Makefile.objs<br>
@@ -4,6 +4,7 @@ common-obj-$(CONFIG_XILINX_SPI<wbr>) +=3D xilinx_spi.o<br>
=C2=A0common-obj-$(CONFIG_XILINX_SP<wbr>IPS) +=3D xilinx_spips.o<br>
=C2=A0common-obj-$(CONFIG_ASPEED_SO<wbr>C) +=3D aspeed_smc.o<br>
=C2=A0common-obj-$(CONFIG_STM32F2XX<wbr>_SPI) +=3D stm32f2xx_spi.o<br>
+common-obj-$(CONFIG_MSF2) +=3D mss-spi.o<br>
<br>
=C2=A0obj-$(CONFIG_OMAP) +=3D omap_spi.o<br>
=C2=A0obj-$(CONFIG_IMX) +=3D imx_spi.o<br>
diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c<br>
new file mode 100644<br>
index 0000000..0b88ec9<br>
--- /dev/null<br>
+++ b/hw/ssi/mss-spi.c<br>
@@ -0,0 +1,378 @@<br>
+/*<br>
+ * Block model of SPI controller present in<br>
+ * Microsemi&#39;s SmartFusion2 and SmartFusion SoCs.<br>
+ *<br>
+ * Copyright (C) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#include &quot;hw/ssi/mss-spi.h&quot;<br>
+<br>
+#ifndef MSS_SPI_ERR_DEBUG<br>
+#define MSS_SPI_ERR_DEBUG=C2=A0 =C2=A00<br>
+#endif<br>
+<br>
+#define DB_PRINT_L(lvl, fmt, args...) do { \<br>
+=C2=A0 =C2=A0 if (MSS_SPI_ERR_DEBUG &gt;=3D lvl) { \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt, __func__, ## ar=
gs); \<br>
</blockquote>
<br></div></div>
Since you use newline in all your calls, you could move it here:<br>
<br>
=C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt &quot;\n&quot;, __func__, ## ar=
gs);<span><br>
<br></span></blockquote><div>Ok=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 } \<br>
+} while (0);<br>
+<br>
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<br>
+<br>
+static void txfifo_reset(MSSSpiState *s)<br>
+{<br>
+=C2=A0 =C2=A0 fifo32_reset(&amp;s-&gt;tx_fifo);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~S_TXFIFOFUL;<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D S_TXFIFOEMP;<br>
+}<br>
+<br>
+static void rxfifo_reset(MSSSpiState *s)<br>
+{<br>
+=C2=A0 =C2=A0 fifo32_reset(&amp;s-&gt;rx_fifo);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~S_RXFIFOFUL;<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D S_RXFIFOEMP;<br>
+}<br>
+<br>
+static void set_fifodepth(MSSSpiState *s)<br>
+{<br>
+=C2=A0 =C2=A0 int size =3D s-&gt;regs[R_SPI_DFSIZE] &amp; FRAMESZ_MASK;<br=
>
</blockquote>
<br></span>
This size is unsigned, isn&#39;t it?</blockquote><div><br></div><div>Yes wi=
ll change it.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 if (0 &lt;=3D size &amp;&amp; size &lt;=3D 8) {<br>
</blockquote>
<br></span>
So &quot;if (size &lt;=3D 8)&quot;<span><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 32;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (9 &lt;=3D size &amp;&amp; size &lt;=3D 16) {<br>
</blockquote>
<br></span>
&quot;else if (size &lt;=3D 16)&quot;<span><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 16;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (17 &lt;=3D size &amp;&amp; size &lt;=3D 32) {<br>
</blockquote>
<br></span>
else if<span><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 8;<br>
+=C2=A0 =C2=A0 }<br>
</blockquote>
<br></span>
else<br>
<br>
s-&gt;fifo_depth =3D 4;<br>
<br>
?<span><br>
<br></span></blockquote><div>Ok will change it.=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><span>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+}<br>
+<br>
+static void mss_spi_do_reset(MSSSpiState *s)<br>
+{<br>
+=C2=A0 =C2=A0 memset(s-&gt;regs, 0, sizeof s-&gt;regs);<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_CONTROL] =3D 0x80000102;<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_DFSIZE] =3D 0x4;<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] =3D 0x2440;<br>
</blockquote>
<br></span>
&quot; =3D S_SSEL | S_TXFIFOEMP | S_RXFIFOEMP;&quot;</blockquote><div><br><=
/div><div>OK.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_CLKGEN] =3D 0x7;<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] =3D 0x0;<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
</blockquote>
<br></span>
Resetting R_SPI_DFSIZE to 4, shouldn&#39;t fifo_depth be 32?</blockquote><d=
iv><br></div><div>FIFO depth is 4 by default and =C2=A0it varies based on B=
IGFIFO bit in control</div><div>register and frame size.=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div><div class=3D"m_4987516660966386481m_-61448610=
94152341240h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 s-&gt;frame_count =3D 1;<br>
+=C2=A0 =C2=A0 s-&gt;enabled =3D false;<br>
+<br>
+=C2=A0 =C2=A0 rxfifo_reset(s);<br>
+=C2=A0 =C2=A0 txfifo_reset(s);<br>
+}<br>
+<br>
+static void update_mis(MSSSpiState *s)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t reg =3D s-&gt;regs[R_SPI_CONTROL];<br>
+=C2=A0 =C2=A0 uint32_t tmp;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* form the Control register interrupt enable bits<br>
+=C2=A0 =C2=A0 =C2=A0* same as RIS, MIS and Interrupt clear registers for s=
implicity<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 tmp =3D ((reg &amp; C_INTRXOVRFLO) &gt;&gt; 4) | ((reg &amp;=
 C_INTRXDATA) &gt;&gt; 3) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((reg &amp; C_INTTXDATA) &gt;&gt;=
 5);<br>
+=C2=A0 =C2=A0 s-&gt;regs[R_SPI_MIS] |=3D tmp &amp; s-&gt;regs[R_SPI_RIS];<=
br>
+}<br>
+<br>
+static void spi_update_irq(MSSSpiState *s)<br>
+{<br>
+=C2=A0 =C2=A0 int irq;<br>
+<br>
+=C2=A0 =C2=A0 update_mis(s);<br>
+=C2=A0 =C2=A0 irq =3D !!(s-&gt;regs[R_SPI_MIS]);<br>
+<br>
+=C2=A0 =C2=A0 qemu_set_irq(s-&gt;irq, irq);<br>
+}<br>
+<br>
+static void mss_spi_reset(DeviceState *d)<br>
+{<br>
+=C2=A0 =C2=A0 mss_spi_do_reset(MSS_SPI(d));<br>
+}<br>
+<br>
+static uint64_t<br>
+spi_read(void *opaque, hwaddr addr, unsigned int size)<br>
+{<br>
+=C2=A0 =C2=A0 MSSSpiState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 addr &gt;&gt;=3D 2;<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case R_SPI_RX:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~S_RXFIFOFUL=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~RXCHOVRF;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fifo32_pop(&amp;s-&gt;rx_fifo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_is_empty(&amp;s-&gt;rx_fifo)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D S_=
RXFIFOEMP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_SPI_MIS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_mis(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[R_SPI_MIS];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[addr];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;%s: Bad offset 0x%&quot; HWADDR_PRIx &quot;\n&quot;,=
 __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0addr * 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;addr=3D0x%&quot; HWADDR_PRIx &quot; =3D 0x%&q=
uot; PRIx32 &quot;\n&quot;, addr * 4, ret);<br>
+=C2=A0 =C2=A0 spi_update_irq(s);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void assert_cs(MSSSpiState *s)<br>
+{<br>
+=C2=A0 =C2=A0 qemu_set_irq(s-&gt;cs_line, 0);<br>
+}<br>
+<br>
+static void deassert_cs(MSSSpiState *s)<br>
+{<br>
+=C2=A0 =C2=A0 qemu_set_irq(s-&gt;cs_line, 1);<br>
+}<br>
+<br>
+static void spi_flush_txfifo(MSSSpiState *s)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t tx;<br>
+=C2=A0 =C2=A0 uint32_t rx;<br>
+=C2=A0 =C2=A0 bool sps =3D !!(s-&gt;regs[R_SPI_CONTROL] &amp; C_SPS);<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Chip Select(CS) is automatically controlled by this =
controller.<br>
+=C2=A0 =C2=A0 =C2=A0* If SPS bit is set in Control register then CS is ass=
erted<br>
+=C2=A0 =C2=A0 =C2=A0* until all the frames set in frame count of Control r=
egister are<br>
+=C2=A0 =C2=A0 =C2=A0* transferred. If SPS is not set then CS pulses betwee=
n frames.<br>
+=C2=A0 =C2=A0 =C2=A0* Note that Slave Select register specifies which of t=
he CS line<br>
+=C2=A0 =C2=A0 =C2=A0* has to be controlled automatically by controller. Bi=
ts SS[7:1] are for<br>
+=C2=A0 =C2=A0 =C2=A0* masters in FPGA fabric since we model only Microcont=
roller subsystem<br>
+=C2=A0 =C2=A0 =C2=A0* of Smartfusion2 we control only one CS(SS[0]) line.<=
br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 while (!fifo32_is_empty(&amp;s-&gt;tx_fifo) &amp;&amp; s-&gt=
;frame_count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_cs(s);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~TXDONE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~RXRDY;<br>
</blockquote>
<br></div></div>
You can simplify as &quot;&amp;=3D ~(S_TXDONE | S_RXRDY);&quot;</blockquote=
><div><br></div><div>Ok.</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div clas=
s=3D"m_4987516660966386481m_-6144861094152341240h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tx =3D fifo32_pop(&amp;s-&gt;tx_fifo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;data tx:0x%&quot; PRIx32 &quot;=
\n&quot;, tx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rx =3D ssi_transfer(s-&gt;spi, tx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;data rx:0x%&quot; PRIx32 &quot;=
\n&quot;, rx);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-&gt;rx_fifo) =3D=3D=
 s-&gt;fifo_depth) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D RX=
CHOVRF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] |=3D RXCHO=
VRF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo32_push(&amp;s-&gt;rx_fifo, =
rx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=
=3D ~S_RXFIFOEMP;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-&gt;r=
x_fifo) =3D=3D (s-&gt;fifo_depth - 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_S=
TATUS] |=3D S_RXFIFOFULNXT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-&gt;r=
x_fifo) =3D=3D s-&gt;fifo_depth) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_S=
TATUS] |=3D S_RXFIFOFUL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;frame_count--;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sps) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deassert_cs(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_cs(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!sps) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deassert_cs(s);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!s-&gt;frame_count) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;frame_count =3D (s-&gt;regs[R_SPI_CONTRO=
L] &amp; FMCOUNT_MASK) &gt;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 FMCOUNT_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sps) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deassert_cs(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] |=3D TXDONE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] |=3D RXRDY;<br>
</blockquote>
<br></div></div>
Same, &quot;|=3D S_TXDONE | S_RXDRY;&quot;</blockquote><div><br></div><div>=
Ok.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"m_49875166=
60966386481m_-6144861094152341240h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D TXDONE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D RXRDY;<br>
+=C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static void spi_write(void *opaque, hwaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val64, unsigned int siz=
e)<br>
+{<br>
+=C2=A0 =C2=A0 MSSSpiState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t value =3D val64;<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;addr=3D0x%&quot; HWADDR_PRIx &quot; =3D0x%&qu=
ot; PRIx32 &quot;\n&quot;, addr, value);<br>
+=C2=A0 =C2=A0 addr &gt;&gt;=3D 2;<br>
+<br>
+=C2=A0 =C2=A0 switch (addr) {<br>
+=C2=A0 =C2=A0 case R_SPI_TX:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* adding to already full FIFO */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-&gt;tx_fifo) =3D=3D=
 s-&gt;fifo_depth) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~S_TXFIFOEMP=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo32_push(&amp;s-&gt;tx_fifo, value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-&gt;tx_fifo) =3D=3D=
 (s-&gt;fifo_depth - 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D S_=
TXFIFOFULNXT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-&gt;tx_fifo) =3D=3D=
 s-&gt;fifo_depth) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D S_=
TXFIFOFUL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi_flush_txfifo(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_SPI_CONTROL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_CONTROL] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; C_BIGFIFO) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_fifodepth(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; C_ENABLE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;enabled =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;enabled =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
</blockquote>
<br></div></div>
&quot;s-&gt;enabled =3D value &amp; C_ENABLE;&quot; ?</blockquote><div><br>=
</div><div>Ok.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D=
"m_4987516660966386481m_-6144861094152341240h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;frame_count =3D (value &amp; FMCOUNT_MAS=
K) &gt;&gt; FMCOUNT_SHIFT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; C_RESET) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mss_spi_do_reset(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_SPI_DFSIZE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_DFSIZE] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_SPI_INTCLR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_INTCLR] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; TXDONE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] &amp;=3D ~=
TXDONE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; RXRDY) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] &amp;=3D ~=
RXRDY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; RXCHOVRF) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] &amp;=3D ~=
RXCHOVRF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case R_SPI_MIS:<br>
+=C2=A0 =C2=A0 case R_SPI_STATUS:<br>
+=C2=A0 =C2=A0 case R_SPI_RIS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
</blockquote>
<br></div></div>
Those registers are read-only right? Maybe you should LOG_GUEST_ERROR here =
too?</blockquote><div><br></div><div>Ok.=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div><div class=3D"m_4987516660966386481m_-6144861094152341240h5"><=
br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[addr] =3D value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;%s: Bad offset 0x%&quot; HWADDR_PRIx &quot;\n&quot;,=
 __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0addr * 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 spi_update_irq(s);<br>
+}<br>
+<br>
+static const MemoryRegionOps spi_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D spi_read,<br>
+=C2=A0 =C2=A0 .write =3D spi_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+=C2=A0 =C2=A0 .valid =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void mss_spi_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 MSSSpiState *s =3D MSS_SPI(dev);<br>
+=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);<br>
+<br>
+=C2=A0 =C2=A0 DB_PRINT(&quot;\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;spi =3D ssi_create_bus(dev, &quot;spi0&quot;);<br>
</blockquote>
<br></div></div>
&quot;0&quot; is the Linux representation?</blockquote><div><br>Yeah will r=
emove 0.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"m_49875=
16660966386481m_-6144861094152341240h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;irq);<br>
+=C2=A0 =C2=A0 ssi_auto_connect_slaves(dev, &amp;s-&gt;cs_line, s-&gt;spi);=
<br>
+=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;cs_line);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;mmio<wbr>, OBJECT(s), &amp;=
spi_ops, s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 TYPE_MSS_SPI, R_SPI_MAX * 4);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;mmio);<br>
+<br>
+=C2=A0 =C2=A0 fifo32_create(&amp;s-&gt;tx_fifo, FIFO_CAPACITY);<br>
+=C2=A0 =C2=A0 fifo32_create(&amp;s-&gt;rx_fifo, FIFO_CAPACITY);<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_mss_spi =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_MSS_SPI,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_FIFO32(tx_fifo, MSSSpiState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_FIFO32(rx_fifo, MSSSpiState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, MSSSpiState, R_SPI_=
MAX),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void mss_spi_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D mss_spi_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D mss_spi_reset;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_mss_spi;<br>
+}<br>
+<br>
+static const TypeInfo mss_spi_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TYPE_MSS_S=
PI,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TYPE_SYS_BUS_DE=
VICE,<br>
+=C2=A0 =C2=A0 .instance_size=C2=A0 =3D sizeof(MSSSpiState),<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0=3D mss_spi_class_init,<br>
+};<br>
+<br>
+static void mss_spi_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;mss_spi_<wbr>info);<br>
+}<br>
+<br>
+type_init(mss_spi_register_ty<wbr>pes)<br>
diff --git a/include/hw/ssi/mss-spi.h b/include/hw/ssi/mss-spi.h<br>
new file mode 100644<br>
index 0000000..091307a<br>
--- /dev/null<br>
+++ b/include/hw/ssi/mss-spi.h<br>
@@ -0,0 +1,104 @@<br>
+/*<br>
+ * Microsemi SmartFusion2 SPI<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#ifndef HW_MSS_SPI_H<br>
+#define HW_MSS_SPI_H<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/hw.h&quot;<br>
+#include &quot;hw/ssi/ssi.h&quot;<br>
+#include &quot;qemu/fifo32.h&quot;<br>
+#include &quot;sysemu/sysemu.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+<br>
+#define FIFO_CAPACITY=C2=A0 =C2=A0 =C2=A032<br>
+#define FIFO_CAPACITY=C2=A0 =C2=A0 =C2=A032<br>
+<br>
+#define R_SPI_CONTROL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
+#define R_SPI_DFSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
+#define R_SPI_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
+#define R_SPI_INTCLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
+#define R_SPI_RX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
+#define R_SPI_TX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
+#define R_SPI_CLKGEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6<br>
+#define R_SPI_SS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7<br>
+#define R_SPI_MIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<br>
+#define R_SPI_RIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09<br>
+#define R_SPI_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016<br>
+<br>
+#define S_RXFIFOFUL=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 4)<br>
+#define S_RXFIFOFULNXT=C2=A0 =C2=A0 (1 &lt;&lt; 5)<br>
+#define S_RXFIFOEMP=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 6)<br>
+#define S_RXFIFOEMPNXT=C2=A0 =C2=A0 (1 &lt;&lt; 7)<br>
+#define S_TXFIFOFUL=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 8)<br>
+#define S_TXFIFOFULNXT=C2=A0 =C2=A0 (1 &lt;&lt; 9)<br>
+#define S_TXFIFOEMP=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 10)<br>
+#define S_TXFIFOEMPNXT=C2=A0 =C2=A0 (1 &lt;&lt; 11)<br>
+#define S_FRAMESTART=C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 12)<br>
+#define S_SSEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 13)<br=
>
+#define S_ACTIVE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 14)<br>
+<br>
+#define C_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>
+#define C_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 1)<br>
+#define C_INTRXDATA=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 4)<br>
+#define C_INTTXDATA=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 5)<br>
+#define C_INTRXOVRFLO=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 6)<br>
+#define C_SPS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2=
6)<br>
+#define C_BIGFIFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 29)<br>
+#define C_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 31)<br=
>
+<br>
+#define FRAMESZ_MASK=C2=A0 =C2=A0 =C2=A0 0x1F<br>
+#define FMCOUNT_MASK=C2=A0 =C2=A0 =C2=A0 0x00FFFF00<br>
+#define FMCOUNT_SHIFT=C2=A0 =C2=A0 =C2=A08<br>
+<br>
</blockquote>
<br></div></div>
Try to keep the previous definitions in the C source, since there are not u=
seful outside of it. Except R_SPI_MAX I think you can move all of them.<spa=
n><br>
<br></span></blockquote><div>OK <br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+#define TXDONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>
+#define RXRDY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 1=
)<br>
+#define RXCHOVRF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 2)<br>
+<br>
</blockquote>
<br></span>
These last 3 seems to be S_TXDONE, S_RXRDY, S_RXCHOVRF.<div><div class=3D"m=
_4987516660966386481m_-6144861094152341240h5"><br>
<br></div></div></blockquote><div>Ok<br><br></div><div>Thanks,<br></div><di=
v>Sundeep <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"m_498=
7516660966386481m_-6144861094152341240h5">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+#define TYPE_MSS_SPI=C2=A0 =C2=A0&quot;mss-spi&quot;<br>
+#define MSS_SPI(obj)=C2=A0 =C2=A0OBJECT_CHECK(MSSSpiState, (obj), TYPE_MSS=
_SPI)<br>
+<br>
+typedef struct MSSSpiState {<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion mmio;<br>
+<br>
+=C2=A0 =C2=A0 qemu_irq irq;<br>
+<br>
+=C2=A0 =C2=A0 qemu_irq cs_line;<br>
+<br>
+=C2=A0 =C2=A0 SSIBus *spi;<br>
+<br>
+=C2=A0 =C2=A0 Fifo32 rx_fifo;<br>
+=C2=A0 =C2=A0 Fifo32 tx_fifo;<br>
+<br>
+=C2=A0 =C2=A0 int fifo_depth;<br>
+=C2=A0 =C2=A0 uint32_t frame_count;<br>
+=C2=A0 =C2=A0 bool enabled;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t regs[R_SPI_MAX];<br>
+} MSSSpiState;<br>
+<br>
+#endif /* HW_MSS_SPI_H */<br>
<br>
</blockquote>
<br></div></div>
Regards,<br>
<br>
Phil.<br>
</blockquote></div><br></div></div>

--001a1140e0cc95e16e0552afddc3--
