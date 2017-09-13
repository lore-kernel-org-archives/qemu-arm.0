Received: by 10.223.172.38 with SMTP id v35csp434410wrc;
        Tue, 12 Sep 2017 19:21:40 -0700 (PDT)
X-Received: by 10.200.24.117 with SMTP id n50mr22409707qtk.6.1505269300171;
        Tue, 12 Sep 2017 19:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505269300; cv=none;
        d=google.com; s=arc-20160816;
        b=QahPghR7VdQR1T5cYtb9b4QlroiV5E3/7tWxxJKjEoCSd9Z7bwGZw7shdH/avGy4ig
         jhUfyoD6jRb2rFCUrxR5BWF7C8B02CUQo0C1u6Xhk4ncMMWQ0wR9tMW3XaOQPSnqzo2Q
         faW4qq2STGKms3pZCl4g+jSzkVcIT1K/JUPBC1TndcJuJre7DPWgiAHX6hT3qwUuGTEf
         3zHK6Wfp0TT16gYumxDvO5oUBM9dyTBpo7ZyOes8SBbD4at/VtIVOqht/0iVu2X6Cj29
         OOq47HYNpZ+fwIBQQy69q6GOIhqw6ELnP2CJH2ktZIOd6u25OESPcGaYZ/LTvSbK152Y
         fCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cVuHozTc2w8UAOVK7Hz/Z89Qx5Qd2OY4JUIL3E9XyzM=;
        b=dlvEljd+x1eU2CLT8ZYTXLIe4lxvTCCWlJBGXe2uImQug/BplyTAouaJiJwILi48J4
         icL9cBssdGFnaYJXBEot/URsD2L1wOj9hREkQ984sU1ScsfkaAZn54FKCd1pjiUwNu/g
         Fi/aBkQyuIa7lqdTvhl9Djyk8u5KqbJRlGRlPb9riwvsCz9Qo2Rwg+dGHgQZiVh+FK2f
         PBlLFwVsqi+uY7uwk9yij1KNg1Zw5IJr4REgIWRMHmLweNrSgw0LGILlOlZ4vL91eLr6
         Z6irKQG8t5yHFsdHsjQZbL4xCx70gW8sXlJTHD0lFsVoY2/IkdtPjnFH7axrOqZxWPfC
         DlyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PCgMEVLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b64si13038091qka.109.2017.09.12.19.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 19:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PCgMEVLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39665 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drxJ3-0000Vc-FB
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 22:21:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1drxIo-0000TF-Lo
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 22:21:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1drxIk-0006BQ-Tx
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 22:21:22 -0400
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:38714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1drxIc-0005xw-Iz; Tue, 12 Sep 2017 22:21:10 -0400
Received: by mail-ua0-x236.google.com with SMTP id l24so17293673uaa.5;
	Tue, 12 Sep 2017 19:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cVuHozTc2w8UAOVK7Hz/Z89Qx5Qd2OY4JUIL3E9XyzM=;
	b=PCgMEVLZAiSHB4Da1Hh+nnh1Q4gg5HMYnHX0o4BkD/ibb5gG9DH2PJKcVEkMY7te1P
	+ZsHI8rXG3tzzju4ss6e3eljvsJrXdFFXHIN44chovp8PluWqOsJRzXOhccGjvqGFZZy
	5wFEd4YpyKRV0jKY/mVkZDYlj7Ms5vftb40Gg4J0d2k6xoxj3FHk6AnQ2W5TlW71BGYl
	nKE8eGl+5/Gp80HdYR73A1CZmag2nPw14u4cGHmgsKtIVquIMQFVxIWGwDdwrXkBppwM
	bWb/JNkY/fvzlz6d2xwHg2S8OMj+Gc8UBuUgGYaCftHRUbVJYWeZI4EspioJWxiMk7l5
	24BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cVuHozTc2w8UAOVK7Hz/Z89Qx5Qd2OY4JUIL3E9XyzM=;
	b=dVAaMHIpMpHWrde1N0i6NxgD78509QuHEqLZezdipg+bWQ1im4yZmN51wjKwE43c/O
	YW7Jk01A7DYKYvEOTcc3cN/E/paGhx7DKOEWlcek10OpFnEq7Ejt1Gzd7f7FAvwusc6G
	g0BxaZmWuDW8fXIdnGIV1ZKL/Gb8a1+w+K48z1rBOtLBPJ8eMK4Li24hA5JhMXMqv+tn
	2Rmfv8SM7t2D1TprJft+dHU0wfJfIpKrFbRG6jeb2iduqR7jYuDhRjMesoRLmyVNRiXw
	re+Zi+sh6EPzeFVeqeRHt0fIjIi3zqt7qnBycQS9ugBG36MzBknzKZNuHrpBX7g9QmnL
	C/6A==
X-Gm-Message-State: AHPjjUjvGC0vlMT8x9RDelEwcmeSQ8jKxs0Bag5UBN9pPa+Ex/qKa6cz
	y2agxrAy1Kr+tXS4C5O6pRpMWElHR7MeSeeNRDE=
X-Google-Smtp-Source: ADKCNb6K19dT4hJmKxFso/EU15xkI/QJgj2wU5W6pTggBvPadPwes9XMxY+g4HaLcjOgQSZmsdicv3PKjYed/kVbm/w=
X-Received: by 10.176.3.51 with SMTP id 48mr14263759uat.67.1505269268753; Tue,
	12 Sep 2017 19:21:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Tue, 12 Sep 2017 19:21:08 -0700 (PDT)
In-Reply-To: <CAKmqyKPbqO-6-B_k7vp9yjJ_BPMNPpZ8YcANXpiccXmmqBijpw@mail.gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-4-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPbqO-6-B_k7vp9yjJ_BPMNPpZ8YcANXpiccXmmqBijpw@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 13 Sep 2017 07:51:08 +0530
Message-ID: <CALHRZup=Dmt28Qt41a58rmMKo0eQ4dgwv1=oxx93QEL=RdW9fA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="001a113518880e31ce055908d0fe"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 3/5] msf2: Add Smartfusion2 SPI
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/PIThj10Xjb

--001a113518880e31ce055908d0fe
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

On Wed, Sep 13, 2017 at 5:20 AM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Thu, Sep 7, 2017 at 12:24 PM, Subbaraya Sundeep
> <sundeep.lkml@gmail.com> wrote:
> > Modelled Microsemi's Smartfusion2 SPI controller.
> >
> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Thank you,
Sundeep


> Thanks,
> Alistair
>
> > ---
> >  hw/ssi/Makefile.objs     |   1 +
> >  hw/ssi/mss-spi.c         | 404 ++++++++++++++++++++++++++++++
> +++++++++++++++++
> >  include/hw/ssi/mss-spi.h |  58 +++++++
> >  3 files changed, 463 insertions(+)
> >  create mode 100644 hw/ssi/mss-spi.c
> >  create mode 100644 include/hw/ssi/mss-spi.h
> >
> > diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs
> > index 487add2..f5bcc65 100644
> > --- a/hw/ssi/Makefile.objs
> > +++ b/hw/ssi/Makefile.objs
> > @@ -4,6 +4,7 @@ common-obj-$(CONFIG_XILINX_SPI) += xilinx_spi.o
> >  common-obj-$(CONFIG_XILINX_SPIPS) += xilinx_spips.o
> >  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_smc.o
> >  common-obj-$(CONFIG_STM32F2XX_SPI) += stm32f2xx_spi.o
> > +common-obj-$(CONFIG_MSF2) += mss-spi.o
> >
> >  obj-$(CONFIG_OMAP) += omap_spi.o
> >  obj-$(CONFIG_IMX) += imx_spi.o
> > diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
> > new file mode 100644
> > index 0000000..5a8e308
> > --- /dev/null
> > +++ b/hw/ssi/mss-spi.c
> > @@ -0,0 +1,404 @@
> > +/*
> > + * Block model of SPI controller present in
> > + * Microsemi's SmartFusion2 and SmartFusion SoCs.
> > + *
> > + * Copyright (C) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/ssi/mss-spi.h"
> > +#include "qemu/log.h"
> > +
> > +#ifndef MSS_SPI_ERR_DEBUG
> > +#define MSS_SPI_ERR_DEBUG   0
> > +#endif
> > +
> > +#define DB_PRINT_L(lvl, fmt, args...) do { \
> > +    if (MSS_SPI_ERR_DEBUG >= lvl) { \
> > +        qemu_log("%s: " fmt "\n", __func__, ## args); \
> > +    } \
> > +} while (0);
> > +
> > +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
> > +
> > +#define FIFO_CAPACITY         32
> > +
> > +#define R_SPI_CONTROL         0
> > +#define R_SPI_DFSIZE          1
> > +#define R_SPI_STATUS          2
> > +#define R_SPI_INTCLR          3
> > +#define R_SPI_RX              4
> > +#define R_SPI_TX              5
> > +#define R_SPI_CLKGEN          6
> > +#define R_SPI_SS              7
> > +#define R_SPI_MIS             8
> > +#define R_SPI_RIS             9
> > +
> > +#define S_TXDONE             (1 << 0)
> > +#define S_RXRDY              (1 << 1)
> > +#define S_RXCHOVRF           (1 << 2)
> > +#define S_RXFIFOFUL          (1 << 4)
> > +#define S_RXFIFOFULNXT       (1 << 5)
> > +#define S_RXFIFOEMP          (1 << 6)
> > +#define S_RXFIFOEMPNXT       (1 << 7)
> > +#define S_TXFIFOFUL          (1 << 8)
> > +#define S_TXFIFOFULNXT       (1 << 9)
> > +#define S_TXFIFOEMP          (1 << 10)
> > +#define S_TXFIFOEMPNXT       (1 << 11)
> > +#define S_FRAMESTART         (1 << 12)
> > +#define S_SSEL               (1 << 13)
> > +#define S_ACTIVE             (1 << 14)
> > +
> > +#define C_ENABLE             (1 << 0)
> > +#define C_MODE               (1 << 1)
> > +#define C_INTRXDATA          (1 << 4)
> > +#define C_INTTXDATA          (1 << 5)
> > +#define C_INTRXOVRFLO        (1 << 6)
> > +#define C_SPS                (1 << 26)
> > +#define C_BIGFIFO            (1 << 29)
> > +#define C_RESET              (1 << 31)
> > +
> > +#define FRAMESZ_MASK         0x1F
> > +#define FMCOUNT_MASK         0x00FFFF00
> > +#define FMCOUNT_SHIFT        8
> > +
> > +static void txfifo_reset(MSSSpiState *s)
> > +{
> > +    fifo32_reset(&s->tx_fifo);
> > +
> > +    s->regs[R_SPI_STATUS] &= ~S_TXFIFOFUL;
> > +    s->regs[R_SPI_STATUS] |= S_TXFIFOEMP;
> > +}
> > +
> > +static void rxfifo_reset(MSSSpiState *s)
> > +{
> > +    fifo32_reset(&s->rx_fifo);
> > +
> > +    s->regs[R_SPI_STATUS] &= ~S_RXFIFOFUL;
> > +    s->regs[R_SPI_STATUS] |= S_RXFIFOEMP;
> > +}
> > +
> > +static void set_fifodepth(MSSSpiState *s)
> > +{
> > +    unsigned int size = s->regs[R_SPI_DFSIZE] & FRAMESZ_MASK;
> > +
> > +    if (size <= 8) {
> > +        s->fifo_depth = 32;
> > +    } else if (size <= 16) {
> > +        s->fifo_depth = 16;
> > +    } else if (size <= 32) {
> > +        s->fifo_depth = 8;
> > +    } else {
> > +        s->fifo_depth = 4;
> > +    }
> > +}
> > +
> > +static void update_mis(MSSSpiState *s)
> > +{
> > +    uint32_t reg = s->regs[R_SPI_CONTROL];
> > +    uint32_t tmp;
> > +
> > +    /*
> > +     * form the Control register interrupt enable bits
> > +     * same as RIS, MIS and Interrupt clear registers for simplicity
> > +     */
> > +    tmp = ((reg & C_INTRXOVRFLO) >> 4) | ((reg & C_INTRXDATA) >> 3) |
> > +           ((reg & C_INTTXDATA) >> 5);
> > +    s->regs[R_SPI_MIS] |= tmp & s->regs[R_SPI_RIS];
> > +}
> > +
> > +static void spi_update_irq(MSSSpiState *s)
> > +{
> > +    int irq;
> > +
> > +    update_mis(s);
> > +    irq = !!(s->regs[R_SPI_MIS]);
> > +
> > +    qemu_set_irq(s->irq, irq);
> > +}
> > +
> > +static void mss_spi_reset(DeviceState *d)
> > +{
> > +    MSSSpiState *s = MSS_SPI(d);
> > +
> > +    memset(s->regs, 0, sizeof s->regs);
> > +    s->regs[R_SPI_CONTROL] = 0x80000102;
> > +    s->regs[R_SPI_DFSIZE] = 0x4;
> > +    s->regs[R_SPI_STATUS] = S_SSEL | S_TXFIFOEMP | S_RXFIFOEMP;
> > +    s->regs[R_SPI_CLKGEN] = 0x7;
> > +    s->regs[R_SPI_RIS] = 0x0;
> > +
> > +    s->fifo_depth = 4;
> > +    s->frame_count = 1;
> > +    s->enabled = false;
> > +
> > +    rxfifo_reset(s);
> > +    txfifo_reset(s);
> > +}
> > +
> > +static uint64_t
> > +spi_read(void *opaque, hwaddr addr, unsigned int size)
> > +{
> > +    MSSSpiState *s = opaque;
> > +    uint32_t ret = 0;
> > +
> > +    addr >>= 2;
> > +    switch (addr) {
> > +    case R_SPI_RX:
> > +        s->regs[R_SPI_STATUS] &= ~S_RXFIFOFUL;
> > +        s->regs[R_SPI_STATUS] &= ~S_RXCHOVRF;
> > +        ret = fifo32_pop(&s->rx_fifo);
> > +        if (fifo32_is_empty(&s->rx_fifo)) {
> > +            s->regs[R_SPI_STATUS] |= S_RXFIFOEMP;
> > +        }
> > +        break;
> > +
> > +    case R_SPI_MIS:
> > +        update_mis(s);
> > +        ret = s->regs[R_SPI_MIS];
> > +        break;
> > +
> > +    default:
> > +        if (addr < ARRAY_SIZE(s->regs)) {
> > +            ret = s->regs[addr];
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n",
> __func__,
> > +                         addr * 4);
> > +            return ret;
> > +        }
> > +        break;
> > +    }
> > +
> > +    DB_PRINT("addr=0x%" HWADDR_PRIx " = 0x%" PRIx32, addr * 4, ret);
> > +    spi_update_irq(s);
> > +    return ret;
> > +}
> > +
> > +static void assert_cs(MSSSpiState *s)
> > +{
> > +    qemu_set_irq(s->cs_line, 0);
> > +}
> > +
> > +static void deassert_cs(MSSSpiState *s)
> > +{
> > +    qemu_set_irq(s->cs_line, 1);
> > +}
> > +
> > +static void spi_flush_txfifo(MSSSpiState *s)
> > +{
> > +    uint32_t tx;
> > +    uint32_t rx;
> > +    bool sps = !!(s->regs[R_SPI_CONTROL] & C_SPS);
> > +
> > +    /*
> > +     * Chip Select(CS) is automatically controlled by this controller.
> > +     * If SPS bit is set in Control register then CS is asserted
> > +     * until all the frames set in frame count of Control register are
> > +     * transferred. If SPS is not set then CS pulses between frames.
> > +     * Note that Slave Select register specifies which of the CS line
> > +     * has to be controlled automatically by controller. Bits SS[7:1]
> are for
> > +     * masters in FPGA fabric since we model only Microcontroller
> subsystem
> > +     * of Smartfusion2 we control only one CS(SS[0]) line.
> > +     */
> > +    while (!fifo32_is_empty(&s->tx_fifo) && s->frame_count) {
> > +        assert_cs(s);
> > +
> > +        s->regs[R_SPI_STATUS] &= ~(S_TXDONE | S_RXRDY);
> > +
> > +        tx = fifo32_pop(&s->tx_fifo);
> > +        DB_PRINT("data tx:0x%" PRIx32, tx);
> > +        rx = ssi_transfer(s->spi, tx);
> > +        DB_PRINT("data rx:0x%" PRIx32, rx);
> > +
> > +        if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
> > +            s->regs[R_SPI_STATUS] |= S_RXCHOVRF;
> > +            s->regs[R_SPI_RIS] |= S_RXCHOVRF;
> > +        } else {
> > +            fifo32_push(&s->rx_fifo, rx);
> > +            s->regs[R_SPI_STATUS] &= ~S_RXFIFOEMP;
> > +            if (fifo32_num_used(&s->rx_fifo) == (s->fifo_depth - 1)) {
> > +                s->regs[R_SPI_STATUS] |= S_RXFIFOFULNXT;
> > +            } else if (fifo32_num_used(&s->rx_fifo) == s->fifo_depth) {
> > +                s->regs[R_SPI_STATUS] |= S_RXFIFOFUL;
> > +            }
> > +        }
> > +        s->frame_count--;
> > +        if (!sps) {
> > +            deassert_cs(s);
> > +        }
> > +    }
> > +
> > +    if (!s->frame_count) {
> > +        s->frame_count = (s->regs[R_SPI_CONTROL] & FMCOUNT_MASK) >>
> > +                            FMCOUNT_SHIFT;
> > +        deassert_cs(s);
> > +        s->regs[R_SPI_RIS] |= S_TXDONE | S_RXRDY;
> > +        s->regs[R_SPI_STATUS] |= S_TXDONE | S_RXRDY;
> > +   }
> > +}
> > +
> > +static void spi_write(void *opaque, hwaddr addr,
> > +            uint64_t val64, unsigned int size)
> > +{
> > +    MSSSpiState *s = opaque;
> > +    uint32_t value = val64;
> > +
> > +    DB_PRINT("addr=0x%" HWADDR_PRIx " =0x%" PRIx32, addr, value);
> > +    addr >>= 2;
> > +
> > +    switch (addr) {
> > +    case R_SPI_TX:
> > +        /* adding to already full FIFO */
> > +        if (fifo32_num_used(&s->tx_fifo) == s->fifo_depth) {
> > +            break;
> > +        }
> > +        s->regs[R_SPI_STATUS] &= ~S_TXFIFOEMP;
> > +        fifo32_push(&s->tx_fifo, value);
> > +        if (fifo32_num_used(&s->tx_fifo) == (s->fifo_depth - 1)) {
> > +            s->regs[R_SPI_STATUS] |= S_TXFIFOFULNXT;
> > +        } else if (fifo32_num_used(&s->tx_fifo) == s->fifo_depth) {
> > +            s->regs[R_SPI_STATUS] |= S_TXFIFOFUL;
> > +        }
> > +        if (s->enabled) {
> > +            spi_flush_txfifo(s);
> > +        }
> > +        break;
> > +
> > +    case R_SPI_CONTROL:
> > +        s->regs[R_SPI_CONTROL] = value;
> > +        if (value & C_BIGFIFO) {
> > +            set_fifodepth(s);
> > +        } else {
> > +            s->fifo_depth = 4;
> > +        }
> > +        s->enabled = value & C_ENABLE;
> > +        s->frame_count = (value & FMCOUNT_MASK) >> FMCOUNT_SHIFT;
> > +        if (value & C_RESET) {
> > +            mss_spi_reset(DEVICE(s));
> > +        }
> > +        break;
> > +
> > +    case R_SPI_DFSIZE:
> > +        if (s->enabled) {
> > +            break;
> > +        }
> > +        s->regs[R_SPI_DFSIZE] = value;
> > +        break;
> > +
> > +    case R_SPI_INTCLR:
> > +        s->regs[R_SPI_INTCLR] = value;
> > +        if (value & S_TXDONE) {
> > +            s->regs[R_SPI_RIS] &= ~S_TXDONE;
> > +        }
> > +        if (value & S_RXRDY) {
> > +            s->regs[R_SPI_RIS] &= ~S_RXRDY;
> > +        }
> > +        if (value & S_RXCHOVRF) {
> > +            s->regs[R_SPI_RIS] &= ~S_RXCHOVRF;
> > +        }
> > +        break;
> > +
> > +    case R_SPI_MIS:
> > +    case R_SPI_STATUS:
> > +    case R_SPI_RIS:
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                         "%s: Write to read only register 0x%"
> HWADDR_PRIx "\n",
> > +                         __func__, addr * 4);
> > +        break;
> > +
> > +    default:
> > +        if (addr < ARRAY_SIZE(s->regs)) {
> > +            s->regs[addr] = value;
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n",
> __func__,
> > +                         addr * 4);
> > +        }
> > +        break;
> > +    }
> > +
> > +    spi_update_irq(s);
> > +}
> > +
> > +static const MemoryRegionOps spi_ops = {
> > +    .read = spi_read,
> > +    .write = spi_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +    .valid = {
> > +        .min_access_size = 1,
> > +        .max_access_size = 4
> > +    }
> > +};
> > +
> > +static void mss_spi_realize(DeviceState *dev, Error **errp)
> > +{
> > +    MSSSpiState *s = MSS_SPI(dev);
> > +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> > +
> > +    s->spi = ssi_create_bus(dev, "spi");
> > +
> > +    sysbus_init_irq(sbd, &s->irq);
> > +    ssi_auto_connect_slaves(dev, &s->cs_line, s->spi);
> > +    sysbus_init_irq(sbd, &s->cs_line);
> > +
> > +    memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
> > +                          TYPE_MSS_SPI, R_SPI_MAX * 4);
> > +    sysbus_init_mmio(sbd, &s->mmio);
> > +
> > +    fifo32_create(&s->tx_fifo, FIFO_CAPACITY);
> > +    fifo32_create(&s->rx_fifo, FIFO_CAPACITY);
> > +}
> > +
> > +static const VMStateDescription vmstate_mss_spi = {
> > +    .name = TYPE_MSS_SPI,
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_FIFO32(tx_fifo, MSSSpiState),
> > +        VMSTATE_FIFO32(rx_fifo, MSSSpiState),
> > +        VMSTATE_UINT32_ARRAY(regs, MSSSpiState, R_SPI_MAX),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static void mss_spi_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    dc->realize = mss_spi_realize;
> > +    dc->reset = mss_spi_reset;
> > +    dc->vmsd = &vmstate_mss_spi;
> > +}
> > +
> > +static const TypeInfo mss_spi_info = {
> > +    .name           = TYPE_MSS_SPI,
> > +    .parent         = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size  = sizeof(MSSSpiState),
> > +    .class_init     = mss_spi_class_init,
> > +};
> > +
> > +static void mss_spi_register_types(void)
> > +{
> > +    type_register_static(&mss_spi_info);
> > +}
> > +
> > +type_init(mss_spi_register_types)
> > diff --git a/include/hw/ssi/mss-spi.h b/include/hw/ssi/mss-spi.h
> > new file mode 100644
> > index 0000000..f0cf324
> > --- /dev/null
> > +++ b/include/hw/ssi/mss-spi.h
> > @@ -0,0 +1,58 @@
> > +/*
> > + * Microsemi SmartFusion2 SPI
> > + *
> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#ifndef HW_MSS_SPI_H
> > +#define HW_MSS_SPI_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "hw/ssi/ssi.h"
> > +#include "qemu/fifo32.h"
> > +
> > +#define TYPE_MSS_SPI   "mss-spi"
> > +#define MSS_SPI(obj)   OBJECT_CHECK(MSSSpiState, (obj), TYPE_MSS_SPI)
> > +
> > +#define R_SPI_MAX             16
> > +
> > +typedef struct MSSSpiState {
> > +    SysBusDevice parent_obj;
> > +
> > +    MemoryRegion mmio;
> > +
> > +    qemu_irq irq;
> > +
> > +    qemu_irq cs_line;
> > +
> > +    SSIBus *spi;
> > +
> > +    Fifo32 rx_fifo;
> > +    Fifo32 tx_fifo;
> > +
> > +    int fifo_depth;
> > +    uint32_t frame_count;
> > +    bool enabled;
> > +
> > +    uint32_t regs[R_SPI_MAX];
> > +} MSSSpiState;
> > +
> > +#endif /* HW_MSS_SPI_H */
> > --
> > 2.5.0
> >
>

--001a113518880e31ce055908d0fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, Sep 13, 2017 at 5:20 AM, Alistair Francis <span di=
r=3D"ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">ali=
stair23@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On Thu, Sep 7, 2017 at 12:24 PM, Subbaraya Sundeep<br>
&lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt=
; wrote:<br>
&gt; Modelled Microsemi&#39;s Smartfusion2 SPI controller.<br>
&gt;<br>
&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gm=
ail.com">sundeep.lkml@gmail.com</a>&gt;<br>
<br>
</span>Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis=
@xilinx.com">alistair.francis@xilinx.com</a>&gt;<br>
<br></blockquote><div>Thank you,<br></div><div>Sundeep<br>=C2=A0<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
Thanks,<br>
Alistair<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 hw/ssi/Makefile.objs=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/ssi/mss-spi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 404 ++++++++=
++++++++++++++++++++++<wbr>+++++++++++++++++<br>
&gt;=C2=A0 include/hw/ssi/mss-spi.h |=C2=A0 58 +++++++<br>
&gt;=C2=A0 3 files changed, 463 insertions(+)<br>
&gt;=C2=A0 create mode 100644 hw/ssi/mss-spi.c<br>
&gt;=C2=A0 create mode 100644 include/hw/ssi/mss-spi.h<br>
&gt;<br>
&gt; diff --git a/hw/ssi/Makefile.objs b/hw/ssi/Makefile.objs<br>
&gt; index 487add2..f5bcc65 100644<br>
&gt; --- a/hw/ssi/Makefile.objs<br>
&gt; +++ b/hw/ssi/Makefile.objs<br>
&gt; @@ -4,6 +4,7 @@ common-obj-$(CONFIG_XILINX_<wbr>SPI) +=3D xilinx_spi.o=
<br>
&gt;=C2=A0 common-obj-$(CONFIG_XILINX_<wbr>SPIPS) +=3D xilinx_spips.o<br>
&gt;=C2=A0 common-obj-$(CONFIG_ASPEED_<wbr>SOC) +=3D aspeed_smc.o<br>
&gt;=C2=A0 common-obj-$(CONFIG_STM32F2XX_<wbr>SPI) +=3D stm32f2xx_spi.o<br>
&gt; +common-obj-$(CONFIG_MSF2) +=3D mss-spi.o<br>
&gt;<br>
&gt;=C2=A0 obj-$(CONFIG_OMAP) +=3D omap_spi.o<br>
&gt;=C2=A0 obj-$(CONFIG_IMX) +=3D imx_spi.o<br>
&gt; diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..5a8e308<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/ssi/mss-spi.c<br>
&gt; @@ -0,0 +1,404 @@<br>
&gt; +/*<br>
&gt; + * Block model of SPI controller present in<br>
&gt; + * Microsemi&#39;s SmartFusion2 and SmartFusion SoCs.<br>
&gt; + *<br>
&gt; + * Copyright (C) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;hw/ssi/mss-spi.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +<br>
&gt; +#ifndef MSS_SPI_ERR_DEBUG<br>
&gt; +#define MSS_SPI_ERR_DEBUG=C2=A0 =C2=A00<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#define DB_PRINT_L(lvl, fmt, args...) do { \<br>
&gt; +=C2=A0 =C2=A0 if (MSS_SPI_ERR_DEBUG &gt;=3D lvl) { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt &quot;\n&qu=
ot;, __func__, ## args); \<br>
&gt; +=C2=A0 =C2=A0 } \<br>
&gt; +} while (0);<br>
&gt; +<br>
&gt; +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<br>
&gt; +<br>
&gt; +#define FIFO_CAPACITY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A032<br>
&gt; +<br>
&gt; +#define R_SPI_CONTROL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; +#define R_SPI_DFSIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; +#define R_SPI_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
&gt; +#define R_SPI_INTCLR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
&gt; +#define R_SPI_RX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br=
>
&gt; +#define R_SPI_TX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br=
>
&gt; +#define R_SPI_CLKGEN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6<br>
&gt; +#define R_SPI_SS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7<br=
>
&gt; +#define R_SPI_MIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08<br=
>
&gt; +#define R_SPI_RIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09<br=
>
&gt; +<br>
&gt; +#define S_TXDONE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &l=
t;&lt; 0)<br>
&gt; +#define S_RXRDY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &l=
t;&lt; 1)<br>
&gt; +#define S_RXCHOVRF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt=
; 2)<br>
&gt; +#define S_RXFIFOFUL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 4)<=
br>
&gt; +#define S_RXFIFOFULNXT=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 5)<br>
&gt; +#define S_RXFIFOEMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 6)<=
br>
&gt; +#define S_RXFIFOEMPNXT=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br>
&gt; +#define S_TXFIFOFUL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 8)<=
br>
&gt; +#define S_TXFIFOFULNXT=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 9)<br>
&gt; +#define S_TXFIFOEMP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 10)=
<br>
&gt; +#define S_TXFIFOEMPNXT=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 11)<br>
&gt; +#define S_FRAMESTART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 12)=
<br>
&gt; +#define S_SSEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1 &lt;&lt; 13)<br>
&gt; +#define S_ACTIVE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &l=
t;&lt; 14)<br>
&gt; +<br>
&gt; +#define C_ENABLE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &l=
t;&lt; 0)<br>
&gt; +#define C_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(1 &lt;&lt; 1)<br>
&gt; +#define C_INTRXDATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 4)<=
br>
&gt; +#define C_INTTXDATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 5)<=
br>
&gt; +#define C_INTRXOVRFLO=C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 6)<br>
&gt; +#define C_SPS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
(1 &lt;&lt; 26)<br>
&gt; +#define C_BIGFIFO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt=
; 29)<br>
&gt; +#define C_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &l=
t;&lt; 31)<br>
&gt; +<br>
&gt; +#define FRAMESZ_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x1F<br>
&gt; +#define FMCOUNT_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00FFFF00<br>
&gt; +#define FMCOUNT_SHIFT=C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
&gt; +<br>
&gt; +static void txfifo_reset(MSSSpiState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 fifo32_reset(&amp;s-&gt;tx_fifo);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~S_TXFIFOFUL;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D S_TXFIFOEMP;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void rxfifo_reset(MSSSpiState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 fifo32_reset(&amp;s-&gt;rx_fifo);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~S_RXFIFOFUL;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D S_RXFIFOEMP;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void set_fifodepth(MSSSpiState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 unsigned int size =3D s-&gt;regs[R_SPI_DFSIZE] &amp; FR=
AMESZ_MASK;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (size &lt;=3D 8) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 32;<br>
&gt; +=C2=A0 =C2=A0 } else if (size &lt;=3D 16) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 16;<br>
&gt; +=C2=A0 =C2=A0 } else if (size &lt;=3D 32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 8;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void update_mis(MSSSpiState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t reg =3D s-&gt;regs[R_SPI_CONTROL];<br>
&gt; +=C2=A0 =C2=A0 uint32_t tmp;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* form the Control register interrupt enable bits=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* same as RIS, MIS and Interrupt clear registers =
for simplicity<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 tmp =3D ((reg &amp; C_INTRXOVRFLO) &gt;&gt; 4) | ((reg =
&amp; C_INTRXDATA) &gt;&gt; 3) |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((reg &amp; C_INTTXDATA) &gt=
;&gt; 5);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_MIS] |=3D tmp &amp; s-&gt;regs[R_SPI_R=
IS];<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void spi_update_irq(MSSSpiState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int irq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 update_mis(s);<br>
&gt; +=C2=A0 =C2=A0 irq =3D !!(s-&gt;regs[R_SPI_MIS]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(s-&gt;irq, irq);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void mss_spi_reset(DeviceState *d)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSSSpiState *s =3D MSS_SPI(d);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memset(s-&gt;regs, 0, sizeof s-&gt;regs);<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_CONTROL] =3D 0x80000102;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_DFSIZE] =3D 0x4;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] =3D S_SSEL | S_TXFIFOEMP | S_R=
XFIFOEMP;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_CLKGEN] =3D 0x7;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] =3D 0x0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;frame_count =3D 1;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;enabled =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 rxfifo_reset(s);<br>
&gt; +=C2=A0 =C2=A0 txfifo_reset(s);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t<br>
&gt; +spi_read(void *opaque, hwaddr addr, unsigned int size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSSSpiState *s =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 addr &gt;&gt;=3D 2;<br>
&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt; +=C2=A0 =C2=A0 case R_SPI_RX:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~S_RXFI=
FOFUL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~S_RXCH=
OVRF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fifo32_pop(&amp;s-&gt;rx_fifo);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_is_empty(&amp;s-&gt;rx_fifo)) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=
=3D S_RXFIFOEMP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_SPI_MIS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 update_mis(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[R_SPI_MIS];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; ARRAY_SIZE(s-&gt;regs)) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[addr];<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;%s: Bad offset 0x%&quot; HWADDR_PRIx &quot;\n&qu=
ot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0addr * 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;addr=3D0x%&quot; HWADDR_PRIx &quot; =3D =
0x%&quot; PRIx32, addr * 4, ret);<br>
&gt; +=C2=A0 =C2=A0 spi_update_irq(s);<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void assert_cs(MSSSpiState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(s-&gt;cs_line, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void deassert_cs(MSSSpiState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(s-&gt;cs_line, 1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void spi_flush_txfifo(MSSSpiState *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t tx;<br>
&gt; +=C2=A0 =C2=A0 uint32_t rx;<br>
&gt; +=C2=A0 =C2=A0 bool sps =3D !!(s-&gt;regs[R_SPI_CONTROL] &amp; C_SPS);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Chip Select(CS) is automatically controlled by =
this controller.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* If SPS bit is set in Control register then CS i=
s asserted<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* until all the frames set in frame count of Cont=
rol register are<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* transferred. If SPS is not set then CS pulses b=
etween frames.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Note that Slave Select register specifies which=
 of the CS line<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* has to be controlled automatically by controlle=
r. Bits SS[7:1] are for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* masters in FPGA fabric since we model only Micr=
ocontroller subsystem<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* of Smartfusion2 we control only one CS(SS[0]) l=
ine.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 while (!fifo32_is_empty(&amp;s-&gt;tx_fifo) &amp;&amp; =
s-&gt;frame_count) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_cs(s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~(S_TXD=
ONE | S_RXRDY);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tx =3D fifo32_pop(&amp;s-&gt;tx_fifo);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;data tx:0x%&quot; PRIx32, =
tx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rx =3D ssi_transfer(s-&gt;spi, tx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 DB_PRINT(&quot;data rx:0x%&quot; PRIx32, =
rx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-&gt;rx_fifo) =
=3D=3D s-&gt;fifo_depth) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=
=3D S_RXCHOVRF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] |=3D =
S_RXCHOVRF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo32_push(&amp;s-&gt;rx_f=
ifo, rx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &a=
mp;=3D ~S_RXFIFOEMP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-=
&gt;rx_fifo) =3D=3D (s-&gt;fifo_depth - 1)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_=
SPI_STATUS] |=3D S_RXFIFOFULNXT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (fifo32_num_used(=
&amp;s-&gt;rx_fifo) =3D=3D s-&gt;fifo_depth) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_=
SPI_STATUS] |=3D S_RXFIFOFUL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;frame_count--;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sps) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deassert_cs(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!s-&gt;frame_count) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;frame_count =3D (s-&gt;regs[R_SPI_C=
ONTROL] &amp; FMCOUNT_MASK) &gt;&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FMCOUNT_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 deassert_cs(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] |=3D S_TXDONE | S_R=
XRDY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=3D S_TXDONE | =
S_RXRDY;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void spi_write(void *opaque, hwaddr addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val64, unsigned in=
t size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSSSpiState *s =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 uint32_t value =3D val64;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;addr=3D0x%&quot; HWADDR_PRIx &quot; =3D0=
x%&quot; PRIx32, addr, value);<br>
&gt; +=C2=A0 =C2=A0 addr &gt;&gt;=3D 2;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt; +=C2=A0 =C2=A0 case R_SPI_TX:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* adding to already full FIFO */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-&gt;tx_fifo) =
=3D=3D s-&gt;fifo_depth) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] &amp;=3D ~S_TXFI=
FOEMP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fifo32_push(&amp;s-&gt;tx_fifo, value);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fifo32_num_used(&amp;s-&gt;tx_fifo) =
=3D=3D (s-&gt;fifo_depth - 1)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=
=3D S_TXFIFOFULNXT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (fifo32_num_used(&amp;s-&gt;tx_=
fifo) =3D=3D s-&gt;fifo_depth) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_STATUS] |=
=3D S_TXFIFOFUL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi_flush_txfifo(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_SPI_CONTROL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_CONTROL] =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; C_BIGFIFO) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_fifodepth(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;fifo_depth =3D 4;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;enabled =3D value &amp; C_ENABLE;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;frame_count =3D (value &amp; FMCOUN=
T_MASK) &gt;&gt; FMCOUNT_SHIFT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; C_RESET) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mss_spi_reset(DEVICE(s));<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_SPI_DFSIZE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_DFSIZE] =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_SPI_INTCLR:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_INTCLR] =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; S_TXDONE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] &amp;=
=3D ~S_TXDONE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; S_RXRDY) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] &amp;=
=3D ~S_RXRDY;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; S_RXCHOVRF) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[R_SPI_RIS] &amp;=
=3D ~S_RXCHOVRF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_SPI_MIS:<br>
&gt; +=C2=A0 =C2=A0 case R_SPI_STATUS:<br>
&gt; +=C2=A0 =C2=A0 case R_SPI_RIS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;%s: Write to read only register 0x%&quot; HWADDR=
_PRIx &quot;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0__func__, addr * 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; ARRAY_SIZE(s-&gt;regs)) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[addr] =3D value;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&quot;%s: Bad offset 0x%&quot; HWADDR_PRIx &quot;\n&qu=
ot;, __func__,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0addr * 4);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 spi_update_irq(s);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const MemoryRegionOps spi_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D spi_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D spi_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
&gt; +=C2=A0 =C2=A0 .valid =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void mss_spi_realize(DeviceState *dev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSSSpiState *s =3D MSS_SPI(dev);<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;spi =3D ssi_create_bus(dev, &quot;spi&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;irq);<br>
&gt; +=C2=A0 =C2=A0 ssi_auto_connect_slaves(dev, &amp;s-&gt;cs_line, s-&gt;=
spi);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;s-&gt;cs_line);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;<wbr>mmio, OBJECT(s), =
&amp;spi_ops, s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 TYPE_MSS_SPI, R_SPI_MAX * 4);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;s-&gt;mmio);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 fifo32_create(&amp;s-&gt;tx_fifo, FIFO_CAPACITY);<br>
&gt; +=C2=A0 =C2=A0 fifo32_create(&amp;s-&gt;rx_fifo, FIFO_CAPACITY);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const VMStateDescription vmstate_mss_spi =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_MSS_SPI,<br>
&gt; +=C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_FIFO32(tx_fifo, MSSSpiState),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_FIFO32(rx_fifo, MSSSpiState),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, MSSSpiState, R=
_SPI_MAX),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void mss_spi_class_init(ObjectClass *klass, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;realize =3D mss_spi_realize;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;reset =3D mss_spi_reset;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_mss_spi;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo mss_spi_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TYPE_=
MSS_SPI,<br>
&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TYPE_SYS_B=
US_DEVICE,<br>
&gt; +=C2=A0 =C2=A0 .instance_size=C2=A0 =3D sizeof(MSSSpiState),<br>
&gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =C2=A0=3D mss_spi_class_init,<=
br>
&gt; +};<br>
&gt; +<br>
&gt; +static void mss_spi_register_types(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;mss_spi_<wbr>info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(mss_spi_register_<wbr>types)<br>
&gt; diff --git a/include/hw/ssi/mss-spi.h b/include/hw/ssi/mss-spi.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f0cf324<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/ssi/mss-spi.h<br>
&gt; @@ -0,0 +1,58 @@<br>
&gt; +/*<br>
&gt; + * Microsemi SmartFusion2 SPI<br>
&gt; + *<br>
&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef HW_MSS_SPI_H<br>
&gt; +#define HW_MSS_SPI_H<br>
&gt; +<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +#include &quot;hw/ssi/ssi.h&quot;<br>
&gt; +#include &quot;qemu/fifo32.h&quot;<br>
&gt; +<br>
&gt; +#define TYPE_MSS_SPI=C2=A0 =C2=A0&quot;mss-spi&quot;<br>
&gt; +#define MSS_SPI(obj)=C2=A0 =C2=A0OBJECT_CHECK(MSSSpiState, (obj), TYP=
E_MSS_SPI)<br>
&gt; +<br>
&gt; +#define R_SPI_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016<b=
r>
&gt; +<br>
&gt; +typedef struct MSSSpiState {<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion mmio;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_irq irq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_irq cs_line;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 SSIBus *spi;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Fifo32 rx_fifo;<br>
&gt; +=C2=A0 =C2=A0 Fifo32 tx_fifo;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 int fifo_depth;<br>
&gt; +=C2=A0 =C2=A0 uint32_t frame_count;<br>
&gt; +=C2=A0 =C2=A0 bool enabled;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint32_t regs[R_SPI_MAX];<br>
&gt; +} MSSSpiState;<br>
&gt; +<br>
&gt; +#endif /* HW_MSS_SPI_H */<br>
&gt; --<br>
&gt; 2.5.0<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a113518880e31ce055908d0fe--
