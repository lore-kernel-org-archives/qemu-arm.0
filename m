Received: by 10.25.44.15 with SMTP id s15csp4965742lfs;
        Tue, 11 Jul 2017 08:12:50 -0700 (PDT)
X-Received: by 10.200.52.57 with SMTP id u54mr490009qtb.231.1499785970062;
        Tue, 11 Jul 2017 08:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499785970; cv=none;
        d=google.com; s=arc-20160816;
        b=pKdA7I49twOp/bfEkM29ap2XC+e/oWQPsEequx6fyuxi6fP4TnyYxx+pKsKJ0EFO4O
         4RsWL6lwch3rBTdqDME6RedxyZIEtk3Ji6+eIPX+vRWEsveZKhWUqGIwuOZ57aUxh5Ek
         i3H/h/tKAENUGxR7j/4RHG94feV5WDw1cJKySomivjgXgc5gbKSGIJTKFF0/wi4aW/Tn
         D5OV8NzpVSgI/+pmj1yJyeVHP2JEUTUwK/OOt9Alm3CQn4nndhCycZwVls7qewSqi8nG
         GMZr6/qLhO/tTvZjoDi4bt1p3/Za0FpvdAsDd6byNHpQkdcc12K8PYvHo0XaNrEIZJTy
         a33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XCwc1ycbOY3LrgVLprUnRqnHcGN3FcTmVWkZ+2iLyLc=;
        b=y4xk53aY9K3bFciQtZSwdDY12tfvFKtl8BKURf4Llfp1zIeUYms45h4tCzSOUjWGcH
         2lCBKlUflyaCSW9KsxLw89IG/jnf/kD9guuxf45/bHWDjNzReLpTqyrG80iLL0Kd3ORD
         C0DyEy8bCNYKeK7q/aNctG+gTswKuwavHb1uom0OMOM7YpslZn0o6Bo2Jtc88GOzOLy8
         nBimzTc4qSkNjSR4PM/bTYPB6shHjQIRIVl0r5JAoyT46PPW+gOgNosr1aT2rjZ/BxNu
         O9JLypaZfRs6k58ljxwrx1tAeKsvFHgHaQHXTwrqLD8Tx/ads/3YcUWgzT6v7GlYeZB0
         /aog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ECOhI9yC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h42si176875qta.179.2017.07.11.08.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 08:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ECOhI9yC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUwqE-0003tP-RB
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 11:12:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dUwq9-0003rY-5V
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dUwq6-0004qb-Vm
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 11:12:41 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:35083)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dUwq6-0004qK-Md; Tue, 11 Jul 2017 11:12:38 -0400
Received: by mail-wr0-x243.google.com with SMTP id z45so535127wrb.2;
	Tue, 11 Jul 2017 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XCwc1ycbOY3LrgVLprUnRqnHcGN3FcTmVWkZ+2iLyLc=;
	b=ECOhI9yCmMs9CTDrF3aSL34DX3siApS8ohgFL2dWybJWJOhH1CnfyhopTH6o2/dr+v
	b/UU5KHT+YzZw7OsxdvkLnk49aYzqUg5vVP9ItmrLlYh/e4H6+qNP1fB7gqTjzYnyucS
	/iLjpYwfIrkY4mpYBQfKoxOIV1B3a4nZWCFvSiIJWXY/leHMtj023luz0YFo1eOQ8pTj
	j8JfN3d6sAKpKehySQgFfgfcviGBrWO96mgW8rc3kFvXoOaVqAEOJG3DMGOkIM/+A66P
	0gcWDsqBVW730QTinTDIruB0XDsCe0spU0jovqiwoBwZoJYnTA3PfI3O6Ap/CVt++LEs
	Cu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XCwc1ycbOY3LrgVLprUnRqnHcGN3FcTmVWkZ+2iLyLc=;
	b=UwcSBbTM0NjWgrBluwY2+dRV7ya6uN4gOnoEeZwYtvMV0a+JQsOtbj5T6RI4pGHAIt
	5PfC7GTKkz7eSl0/946A9+02OraoOVB+KPbpbSNXFLrTCaBEJqwaQugu5GGEe1tz9wHA
	JWg07Dlft2/jxJid7b87rN2u5HR4AUlL3OzSwnHR0mwjpOG/FvCAM3Ie9Vb0AMDOOc9m
	wCqliPf3Jmi3AakSGSLIGBV7iKpgIso/7teIuv6ondz810SIPHXRxgJERi930RIEADmC
	lpFh/FyLlXx0u/G7kk8NeO6oZMD6q2PRioNdqPaIC5uSgXklBxiDBne5mYueUacLP2GD
	HEWg==
X-Gm-Message-State: AIVw111JABPyd+Jsm35oLuoQ2l0SBHdhUIyz3BWYC/Z2Wv8QzNG4KTE2
	mp1BFDH2ibiFdDmw7b75LkIfSMqC4g==
X-Received: by 10.223.161.204 with SMTP id v12mr215309wrv.125.1499785957359;
	Tue, 11 Jul 2017 08:12:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Tue, 11 Jul 2017 08:12:06 -0700 (PDT)
In-Reply-To: <1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-3-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jul 2017 17:12:06 +0200
Message-ID: <CAKmqyKPn+JEVWmpzypZt=8kH80aNa+aNAZLhPSWvHy+h5gyd=Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] hw/char/cmsdk-apb-uart.c:
 Implement CMSDK APB UART
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2P3UuNw0yu8l

On Tue, Jul 11, 2017 at 1:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Implement a model of the simple "APB UART" provided in
> the Cortex-M System Design Kit (CMSDK).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/char/Makefile.objs            |   1 +
>  include/hw/char/cmsdk-apb-uart.h |  78 ++++++++
>  hw/char/cmsdk-apb-uart.c         | 390 +++++++++++++++++++++++++++++++++++++++
>  default-configs/arm-softmmu.mak  |   2 +
>  hw/char/trace-events             |   9 +
>  5 files changed, 480 insertions(+)
>  create mode 100644 include/hw/char/cmsdk-apb-uart.h
>  create mode 100644 hw/char/cmsdk-apb-uart.c
>
> diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
> index 55fcb68..1bcd37e 100644
> --- a/hw/char/Makefile.objs
> +++ b/hw/char/Makefile.objs
> @@ -19,6 +19,7 @@ obj-$(CONFIG_DIGIC) += digic-uart.o
>  obj-$(CONFIG_STM32F2XX_USART) += stm32f2xx_usart.o
>  obj-$(CONFIG_RASPI) += bcm2835_aux.o
>
> +common-obj-$(CONFIG_CMSDK_APB_UART) += cmsdk-apb-uart.o
>  common-obj-$(CONFIG_ETRAXFS) += etraxfs_ser.o
>  common-obj-$(CONFIG_ISA_DEBUG) += debugcon.o
>  common-obj-$(CONFIG_GRLIB) += grlib_apbuart.o
> diff --git a/include/hw/char/cmsdk-apb-uart.h b/include/hw/char/cmsdk-apb-uart.h
> new file mode 100644
> index 0000000..c41fba9
> --- /dev/null
> +++ b/include/hw/char/cmsdk-apb-uart.h
> @@ -0,0 +1,78 @@
> +/*
> + * ARM CMSDK APB UART emulation
> + *
> + * Copyright (c) 2017 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#ifndef CMSDK_APB_UART_H
> +#define CMSDK_APB_UART_H
> +
> +#include "hw/sysbus.h"
> +#include "chardev/char-fe.h"
> +
> +#define TYPE_CMSDK_APB_UART "cmsdk-apb-uart"
> +#define CMSDK_APB_UART(obj) OBJECT_CHECK(CMSDKAPBUART, (obj), \
> +                                         TYPE_CMSDK_APB_UART)
> +
> +typedef struct {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    CharBackend chr;
> +    qemu_irq txint;
> +    qemu_irq rxint;
> +    qemu_irq txovrint;
> +    qemu_irq rxovrint;
> +    qemu_irq uartint;
> +    guint watch_tag;
> +    uint32_t pclk_frq;
> +
> +    uint32_t state;
> +    uint32_t ctrl;
> +    uint32_t intstatus;
> +    uint32_t bauddiv;
> +    /* This UART has no FIFO, only a 1-character buffer for each of Tx and Rx */
> +    uint8_t txbuf;
> +    uint8_t rxbuf;
> +} CMSDKAPBUART;

This should be CamelCase.

> +
> +/**
> + * cmsdk_apb_uart_create - convenience function to create TYPE_CMSDK_APB_UART
> + * @addr: location in system memory to map registers
> + * @chr: Chardev backend to connect UART to, or NULL if no backend
> + * @pclk_frq: frequency in Hz of the PCLK clock (used for calculating baud rate)
> + */
> +static inline DeviceState *cmsdk_apb_uart_create(hwaddr addr,
> +                                                 qemu_irq txint,
> +                                                 qemu_irq rxint,
> +                                                 qemu_irq txovrint,
> +                                                 qemu_irq rxovrint,
> +                                                 qemu_irq uartint,
> +                                                 Chardev *chr,
> +                                                 uint32_t pclk_frq)
> +{
> +    DeviceState *dev;
> +    SysBusDevice *s;
> +
> +    dev = qdev_create(NULL, TYPE_CMSDK_APB_UART);
> +    s = SYS_BUS_DEVICE(dev);
> +    qdev_prop_set_chr(dev, "chardev", chr);
> +    qdev_prop_set_uint32(dev, "pclk-frq", pclk_frq);
> +    qdev_init_nofail(dev);
> +    sysbus_mmio_map(s, 0, addr);
> +    sysbus_connect_irq(s, 0, txint);
> +    sysbus_connect_irq(s, 1, rxint);
> +    sysbus_connect_irq(s, 2, txovrint);
> +    sysbus_connect_irq(s, 3, rxovrint);
> +    sysbus_connect_irq(s, 4, uartint);
> +    return dev;
> +}
> +
> +#endif
> diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
> new file mode 100644
> index 0000000..a2f55db
> --- /dev/null
> +++ b/hw/char/cmsdk-apb-uart.c
> @@ -0,0 +1,390 @@
> +/*
> + * ARM CMSDK APB UART emulation
> + *
> + * Copyright (c) 2017 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +/* This is a model of the "APB UART" which is part of the Cortex-M
> + * System Design Kit (CMSDK) and documented in the Cortex-M System
> + * Design Kit Technical Reference Manual (ARM DDI0479C):
> + * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit

I can't find the spec from this site. Is it possible to link directly
to the guides? I have found a few dead links from some of these
marketing focused site.

> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "trace.h"
> +#include "hw/sysbus.h"
> +#include "hw/registerfields.h"
> +#include "chardev/char-fe.h"
> +#include "chardev/char-serial.h"
> +#include "hw/char/cmsdk-apb-uart.h"
> +
> +REG32(DATA, 0)
> +REG32(STATE, 4)
> +    FIELD(STATE, TXFULL, 0, 1)
> +    FIELD(STATE, RXFULL, 1, 1)
> +    FIELD(STATE, TXOVERRUN, 2, 1)
> +    FIELD(STATE, RXOVERRUN, 3, 1)
> +REG32(CTRL, 8)
> +    FIELD(CTRL, TX_EN, 0, 1)
> +    FIELD(CTRL, RX_EN, 1, 1)
> +    FIELD(CTRL, TX_INTEN, 2, 1)
> +    FIELD(CTRL, RX_INTEN, 3, 1)
> +    FIELD(CTRL, TXO_INTEN, 4, 1)
> +    FIELD(CTRL, RXO_INTEN, 5, 1)
> +    FIELD(CTRL, HSTEST, 6, 1)
> +REG32(INTSTATUS, 0xc)
> +    FIELD(INTSTATUS, TX, 0, 1)
> +    FIELD(INTSTATUS, RX, 1, 1)
> +    FIELD(INTSTATUS, TXO, 2, 1)
> +    FIELD(INTSTATUS, RXO, 3, 1)
> +REG32(BAUDDIV, 0x10)
> +REG32(PID4, 0xFD0)
> +REG32(PID5, 0xFD4)
> +REG32(PID6, 0xFD8)
> +REG32(PID7, 0xFDC)
> +REG32(PID0, 0xFE0)
> +REG32(PID1, 0xFE4)
> +REG32(PID2, 0xFE8)
> +REG32(PID3, 0xFEC)
> +REG32(CID0, 0xFF0)
> +REG32(CID1, 0xFF4)
> +REG32(CID2, 0xFF8)
> +REG32(CID3, 0xFFC)
> +
> +/* PID/CID values */
> +static const int uart_id[] = {
> +    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
> +    0x21, 0xb8, 0x1b, 0x00, /* PID0..PID3 */
> +    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
> +};
> +
> +static void uart_update_parameters(CMSDKAPBUART *s)
> +{
> +    QEMUSerialSetParams ssp;
> +
> +    /* This UART is always 8N1 but the baud rate is programmable.
> +     * The minimum permitted bauddiv setting is 16, so we just ignore
> +     * settings below that (usually this means the device has just
> +     * been reset and not yet programmed).
> +     */
> +    if (s->bauddiv < 16 || s->bauddiv > s->pclk_frq) {
> +        return;
> +    }

This seems like it should deserve a guest error print.

> +
> +    ssp.data_bits = 8;
> +    ssp.parity = 'N';
> +    ssp.stop_bits = 1;
> +    ssp.speed = s->pclk_frq / s->bauddiv;
> +    qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
> +    trace_cmsdk_apb_uart_set_params(ssp.speed);
> +}
> +
> +static void cmsdk_apb_uart_update(CMSDKAPBUART *s)
> +{
> +    /* update outbound irqs, including handling the way the rxo and txo
> +     * interrupt status bits are just logical AND of the overrun bit in
> +     * STATE and the overrun interrupt enable bit in CTRL.
> +     */
> +    uint32_t omask = (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK);
> +    s->intstatus &= ~omask;
> +    s->intstatus |= (s->state & (s->ctrl >> 2) & omask);
> +
> +    qemu_set_irq(s->txint, !!(s->intstatus & R_INTSTATUS_TX_MASK));
> +    qemu_set_irq(s->rxint, !!(s->intstatus & R_INTSTATUS_RX_MASK));
> +    qemu_set_irq(s->txovrint, !!(s->intstatus & R_INTSTATUS_TXO_MASK));
> +    qemu_set_irq(s->rxovrint, !!(s->intstatus & R_INTSTATUS_RXO_MASK));
> +    qemu_set_irq(s->uartint, !!(s->intstatus));
> +}
> +
> +static int uart_can_receive(void *opaque)
> +{
> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
> +
> +    /* We can take a char if RX is enabled and the buffer is empty */
> +    if (s->ctrl & R_CTRL_RX_EN_MASK && !(s->state & R_STATE_RXFULL_MASK)) {
> +        return 1;
> +    }
> +    return 0;
> +}
> +
> +static void uart_receive(void *opaque, const uint8_t *buf, int size)
> +{
> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
> +
> +    trace_cmsdk_apb_uart_receive(*buf);
> +
> +    if (!(s->ctrl & R_CTRL_RX_EN_MASK)) {
> +        /* Just drop the character on the floor */
> +        return;

Doesn't this also deserve a guest error print.

> +    }
> +
> +    if (s->state & R_STATE_RXFULL_MASK) {
> +        s->state |= R_STATE_RXOVERRUN_MASK;
> +    }
> +
> +    s->rxbuf = *buf;
> +    s->state |= R_STATE_RXFULL_MASK;
> +    if (s->ctrl & R_CTRL_RX_INTEN_MASK) {
> +        s->intstatus |= R_INTSTATUS_RX_MASK;
> +    }
> +    cmsdk_apb_uart_update(s);
> +}
> +
> +static uint64_t uart_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
> +    uint64_t r;
> +
> +    switch (offset) {
> +    case A_DATA:
> +        r = s->rxbuf;
> +        s->state &= ~R_STATE_RXFULL_MASK;
> +        cmsdk_apb_uart_update(s);
> +        break;
> +    case A_STATE:
> +        r = s->state;
> +        break;
> +    case A_CTRL:
> +        r = s->ctrl;
> +        break;
> +    case A_INTSTATUS:
> +        r = s->intstatus;
> +        break;
> +    case A_BAUDDIV:
> +        r = s->bauddiv;
> +        break;

You used pasrt of the register API but not the second part. This seems
like a greaet device to use the register API on.

> +    case A_PID4 ... A_CID3:
> +        r = uart_id[offset / 4 - A_PID4];

I think this is the one you already found in the cover letter.

> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "CMSDK APB UART read: bad offset %x\n", (int) offset);
> +        r = 0;
> +        break;
> +    }
> +    trace_cmsdk_apb_uart_read(offset, r, size);
> +    return r;
> +}
> +
> +/* Try to send tx data, and arrange to be called back later if
> + * we can't (ie the char backend is busy/blocking).
> + */
> +static gboolean uart_transmit(GIOChannel *chan, GIOCondition cond, void *opaque)
> +{
> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
> +    int ret;
> +
> +    s->watch_tag = 0;
> +
> +    if (!(s->ctrl & R_CTRL_TX_EN_MASK) || !(s->state & R_STATE_TXFULL_MASK)) {
> +        return FALSE;
> +    }
> +
> +    ret = qemu_chr_fe_write(&s->chr, &s->txbuf, 1);
> +    if (ret <= 0) {
> +        s->watch_tag = qemu_chr_fe_add_watch(&s->chr, G_IO_OUT | G_IO_HUP,
> +                                             uart_transmit, s);
> +        if (!s->watch_tag) {
> +            /* Most common reason to be here is "no chardev backend":
> +             * just insta-drain the buffer, so the serial output
> +             * goes into a void, rather than blocking the guest.
> +             */
> +            goto buffer_drained;
> +        }
> +        /* Transmit pending */
> +        trace_cmsdk_apb_uart_tx_pending();
> +        return FALSE;
> +    }
> +
> +buffer_drained:
> +    /* Character successfully sent */
> +    trace_cmsdk_apb_uart_tx(s->txbuf);
> +    s->state &= ~R_STATE_TXFULL_MASK;
> +    /* Going from TXFULL set to clear triggers the tx interrupt */
> +    if (s->ctrl & R_CTRL_TX_INTEN_MASK) {
> +        s->intstatus |= R_INTSTATUS_TX_MASK;
> +    }
> +    cmsdk_apb_uart_update(s);
> +    return FALSE;
> +}
> +
> +static void uart_cancel_transmit(CMSDKAPBUART *s)
> +{
> +    if (s->watch_tag) {
> +        g_source_remove(s->watch_tag);
> +        s->watch_tag = 0;
> +    }
> +}
> +
> +static void uart_write(void *opaque, hwaddr offset, uint64_t value,
> +                       unsigned size)
> +{
> +    CMSDKAPBUART *s = CMSDK_APB_UART(opaque);
> +
> +    trace_cmsdk_apb_uart_write(offset, value, size);
> +
> +    switch (offset) {
> +    case A_DATA:
> +    {
> +        s->txbuf = value;
> +        if (s->state & R_STATE_TXFULL_MASK) {
> +            /* Buffer already full -- note the overrun and let the
> +             * existing pending transmit callback handle the new char.
> +             */
> +            s->state |= R_STATE_TXOVERRUN_MASK;
> +            cmsdk_apb_uart_update(s);
> +        } else {
> +            s->state |= R_STATE_TXFULL_MASK;
> +            uart_transmit(NULL, G_IO_OUT, s);
> +        }
> +        break;
> +    }

Why is this case inside braces?

Thanks,
Alistair
