Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1283733njc;
        Mon, 30 Sep 2024 07:46:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFB6W/VDLomv2sA0HjmzmgJJHNWT4nP6NRCnsHyAdbbXZN4KcJpH2LSMntgCkOuJGiL2/TnEL5lHzCeg==@linaro.org
X-Google-Smtp-Source: AGHT+IF1icn09kq9yun34bB+z4qWHphqelH5SlWODXONzENiLnEVzNJXY1ED+iwyuI5f44vmwHqo
X-Received: by 2002:a05:620a:c41:b0:7ac:a93b:9fa6 with SMTP id af79cd13be357-7ae37855ab9mr2154687885a.30.1727707584829;
        Mon, 30 Sep 2024 07:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727707584; cv=none;
        d=google.com; s=arc-20240605;
        b=OkV0XToBs/LcRlKUebBsn922FYYvQDZL9noI88vIbvoyWnsJyjyegzgUO0DUIRu4wA
         opgUrzi59kNSapqAsQqpLq59plWiDtrlzWga6VGZQ/z5oXra3qsvVJiMXYl/5XhaBn3t
         cQ2BDNltelZ4onH3wa1+PfYsTzCb1SuDrDOo++/OKP9YOVSR22CE4R45RPEmYgT17di9
         3D3X5S1I0iA6Vthj1oNsMc7FE3fvRXjGdc1ZbHh79rAR/Qmb8KljwaAX94rRgQ0wrxVN
         NYxJkSGkCJ8XnyjCQo/rjXXnxjhUcqa/4qQHpU2K9h4bNPCLEk2y7r5pR/3wpnpIykGs
         OGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3qVkvqOV5gromGge2qQxkt9hBCEBerwjtM8a+1oCHOE=;
        fh=/D3d8Xh41q/hv89DzaDK8DhEA5zJgg+yMP15a3Q3YnA=;
        b=afdjQr9Wc63DjSHJHoBeAEwHUxOlrWjhbsjjqwgGMTtFwDRoP2+rP2T0RV8ruVcqE1
         AkDvbs9vtpXATa4KIZ+4MMd9Cq5GSCn9kfexzgurBg5QHUpLFEuNHtXYax9fA9MSyP8p
         AOeGb6ZgMs41C1L2VR5/9s4/D5Ukv19eyV8sBa/VHkM2dUJHztvZQs+r84/6tvYGUr2i
         R05AtzUQt1gCS5mEh5XQFr3qqjzVQZTbQmr8hu6jGDMk8xe+EIjULg4FmXLH5Yn3LpmA
         xqk5Ml8SP2cfgz/S3YM48bITQccBt+IQosvCn2I17UMl9hz3gj/or8bMBWfJTzzWRIn9
         aL5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E+KKiYYN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae377ceacasi836707385a.143.2024.09.30.07.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Sep 2024 07:46:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E+KKiYYN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svHf0-00023F-EQ; Mon, 30 Sep 2024 10:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svHex-00020R-C7
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 10:45:59 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1svHeu-0001YB-KE
 for qemu-arm@nongnu.org; Mon, 30 Sep 2024 10:45:59 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5398f3be400so1668728e87.0
 for <qemu-arm@nongnu.org>; Mon, 30 Sep 2024 07:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727707554; x=1728312354; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3qVkvqOV5gromGge2qQxkt9hBCEBerwjtM8a+1oCHOE=;
 b=E+KKiYYNr9aEF3CSeGka/aiX15gyo/hOBd59BuB1WjEDbOKK1D2AWFs9SwzSpfZcf5
 i8hU+UtQe6jQoLgpVqdwT+aqB7afAoh+ZJ/+A4C4WxyVV1hW9VB6972BAp6ZiwzuuXqf
 8mLve92tK3fhNQTDHYWN8tto3i0zAB1PEIXTtls4YYum5qqZeWma/jTbucr/p2x2bz0R
 2zKLM2M0Uek3LcFP0GhpRK6dPjX/gPUzJD/CAOOVx5uSU7yf+OtPZxVOsqRP9oKlYgA7
 IPiuNNRyFfgQODE1QhFSjd8HXqaWBlFA9F/w46rS7VXMk/L63TFbBSv/Y5CxBcEccPRp
 ODuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727707554; x=1728312354;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3qVkvqOV5gromGge2qQxkt9hBCEBerwjtM8a+1oCHOE=;
 b=KjRao+FE283ElkeWdSBsFjCYiP4pZCe0gI0hteJUNIr4nrKcCYDrwPlWohGTdj5HHr
 zUoi3jY3QCFWwAStdyRNDQq+jB0wEGttpzGz79sU4ho4gvLy0prQdcsIFWrsU92nDkOB
 uuKDvDc95dpQ7Z0u5G1ldPxzXStcmGU0M4sEEjG6vonhwTQzyVKShjrOgyCCr7yvJuqD
 6fj/mh+f3b/Z1+zMXHOIXL6Qwsa10Wh0Ko3yXzkNGUCnQuBOuv+CyWHe577Z9KZ34Ozt
 GYDvvFmK0F40eDV9O1bjv3hYZ19oiaCgxlz89L92nqbNCt2uHY6+e20y++YAakVoxWyv
 Swig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXii6w1FCI+zhi/dR2x6ditAGxKjXk4h0nIBKgxvrb8QyrcX90q35RwX3IXDSOB21CHlXttgt1uKw==@nongnu.org
X-Gm-Message-State: AOJu0YycdEe6dVjIwT2rLQDjr9R6o9aCFlu4rQCwofReMg+pM6nJEqD7
 Ufa7aCf62Tz/m6FZhPgUSAphfTAKI4+FXrRy1zDxxO8eeVhW8fypFMx4tb3Vflg+KqRXgAR1yJX
 +Kaxyyb2R7YqgK11JvDB391raK/491J/wisM3Wg==
X-Received: by 2002:a05:6512:108d:b0:52c:d904:d26e with SMTP id
 2adb3069b0e04-5389fc399d3mr5972441e87.21.1727707554175; Mon, 30 Sep 2024
 07:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240919215525.22398-1-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20240919215525.22398-1-strahinja.p.jankovic@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Sep 2024 15:45:42 +0100
Message-ID: <CAFEAcA_RkwPgTksJCEP4=V0WY0wp0OiYP28PzXDJKRvpi_KWvw@mail.gmail.com>
Subject: Re: [PATCH] {hw/ssi,docs/system/arm}: Allwinner A10 SPI emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NlDwJ5WQjXA3

On Thu, 19 Sept 2024 at 22:55, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> This patch implements Allwinner A10 SPI controller emulation.
> Only master-mode functionality is implemented.
>
> Since U-Boot and Linux SPI drivers for Allwinner A10 perform only
> byte-wide CPU access (no DMA) to the peripheral, the emulated
> controller does not implement DMA control and supports only byte-wide
> access.
>
> Docs are also updated for Cubieboard to indicate SPI availability.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Hi; thanks for this patch. It generally looks good to me;
my comments below are not major.

>  docs/system/arm/cubieboard.rst     |   1 +
>  hw/arm/Kconfig                     |   1 +
>  hw/arm/allwinner-a10.c             |   8 +
>  hw/ssi/Kconfig                     |   4 +
>  hw/ssi/allwinner-a10-spi.c         | 534 +++++++++++++++++++++++++++++
>  hw/ssi/meson.build                 |   1 +
>  hw/ssi/trace-events                |  10 +
>  include/hw/arm/allwinner-a10.h     |   2 +
>  include/hw/ssi/allwinner-a10-spi.h |  56 +++

For "add new device to existing board" changes we generally
prefer them to be two commits:
 * add the new device model
 * wire up the device in the board model

Could you split this patch in two, please?

> diff --git a/hw/ssi/allwinner-a10-spi.c b/hw/ssi/allwinner-a10-spi.c
> new file mode 100644
> index 0000000000..ea44ae46a3
> --- /dev/null
> +++ b/hw/ssi/allwinner-a10-spi.c
> @@ -0,0 +1,534 @@
> +/*
> + *  Allwinner SPI Bus Serial Interface Emulation
> + *
> + *  Copyright (C) 2024 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> + *
> + *  This program is free software; you can redistribute it and/or modify it
> + *  under the terms of the GNU General Public License as published by the
> + *  Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful, but WITHOUT
> + *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + *  FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + *  for more details.
> + *
> + *  You should have received a copy of the GNU General Public License along
> + *  with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + * SPDX-License-Identifier: MIT

This SPDX tag does not match the human-readable license. We're OK with
either GPL-2.0-or-later or MIT, but which one do you want?

Also, the .h file license-and-copyright comment has no SPDX tag;
we don't currently insist on SPDX tags, but you might wish to
be consistent.

> +/* Control register */
> +#define SPI_CTL_SDC      (1 << 19)
> +#define SPI_CTL_TP_EN    (1 << 18)
> +#define SPI_CTL_SS_LEVEL (1 << 17)
> +#define SPI_CTL_SS_CTRL  (1 << 16)
> +#define SPI_CTL_DHB      (1 << 15)
> +#define SPI_CTL_DDB      (1 << 14)
> +#define SPI_CTL_SS       (3 << 12)
> +#define SPI_CTL_SS_SHIFT (12)
> +#define SPI_CTL_RPSM     (1 << 11)
> +#define SPI_CTL_XCH      (1 << 10)
> +#define SPI_CTL_RF_RST   (1 << 9)
> +#define SPI_CTL_TF_RST   (1 << 8)
> +#define SPI_CTL_SSCTL    (1 << 7)
> +#define SPI_CTL_LMTF     (1 << 6)
> +#define SPI_CTL_DMAMC    (1 << 5)
> +#define SPI_CTL_SSPOL    (1 << 4)
> +#define SPI_CTL_POL      (1 << 3)
> +#define SPI_CTL_PHA      (1 << 2)
> +#define SPI_CTL_MODE     (1 << 1)
> +#define SPI_CTL_EN       (1 << 0)
> +#define SPI_CTL_MASK     (0xFFFFFu)
> +#define SPI_CTL_RESET    (0x0002001Cu)

Brackets aren't necessary around single integer values,
only around expressions.


> +static void allwinner_a10_spi_update_irq(AWA10SPIState *s)
> +{
> +    int level;
> +
> +    if (fifo8_is_empty(&s->rx_fifo)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_RR;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_RR;
> +    }
> +
> +    if (fifo8_num_used(&s->rx_fifo) >= (AW_A10_SPI_FIFO_SIZE >> 2)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_RF14;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_RF14;
> +    }
> +
> +    if (fifo8_num_used(&s->rx_fifo) >= (AW_A10_SPI_FIFO_SIZE >> 1)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_RHF;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_RHF;
> +    }
> +
> +    if (fifo8_num_free(&s->rx_fifo) <= (AW_A10_SPI_FIFO_SIZE >> 2)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_RF34;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_RF34;
> +    }
> +
> +    if (fifo8_is_full(&s->rx_fifo)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_RF;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_RF;
> +    }
> +
> +    if (fifo8_is_empty(&s->tx_fifo)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_TE;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_TE;
> +    }
> +
> +    if (fifo8_num_free(&s->tx_fifo) >= (AW_A10_SPI_FIFO_SIZE >> 2)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_TE14;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_TE14;
> +    }
> +
> +    if (fifo8_num_free(&s->tx_fifo) >= (AW_A10_SPI_FIFO_SIZE >> 1)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_THE;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_THE;
> +    }
> +
> +    if (fifo8_num_used(&s->tx_fifo) <= (AW_A10_SPI_FIFO_SIZE >> 2)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_TE34;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_TE34;
> +    }
> +
> +    if (fifo8_is_full(&s->rx_fifo)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_TF;
> +    } else {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~SPI_INT_STA_TF;
> +    }
> +
> +    level = s->regs[REG_INDEX(SPI_INT_STA_REG)] &
> +                    s->regs[REG_INDEX(SPI_INTCTL_REG)] ?
> +                1 :
> +                0;

If you declare 'level' as a 'bool' you can avoid this
awkward "? 1 : 0" expression.

> +
> +    qemu_set_irq(s->irq, level);
> +
> +    trace_allwinner_a10_spi_update_irq(level);
> +}
> +
> +static void allwinner_a10_spi_flush_txfifo(AWA10SPIState *s)
> +{
> +    uint8_t tx;
> +    uint8_t rx;
> +    uint32_t burst_count = s->regs[REG_INDEX(SPI_BC_REG)];
> +    uint32_t tx_burst = s->regs[REG_INDEX(SPI_TC_REG)];
> +    trace_allwinner_a10_spi_burst_length(tx_burst);
> +
> +    trace_allwinner_a10_spi_flush_txfifo_begin(fifo8_num_used(&s->tx_fifo),
> +                                               fifo8_num_used(&s->rx_fifo));
> +
> +    while (!fifo8_is_empty(&s->tx_fifo)) {
> +        tx = fifo8_pop(&s->tx_fifo);
> +        rx = 0;
> +        bool fill_rx = true;

Variable declarations should always go at the start of a block,
not in the middle of one. (Since tx and rx are not used
outside the loop, you could fix this by declaring them
here rather than at the top of the function if you like.)

> +
> +        trace_allwinner_a10_spi_tx(tx);
> +
> +        /* Write one byte at a time */
> +        rx = ssi_transfer(s->bus, tx);
> +
> +        trace_allwinner_a10_spi_rx(rx);
> +
> +        /* Check DHB here to determing if RX bytes should be stored */

Typo: "determine"

> +        if (s->regs[REG_INDEX(SPI_CTL_REG)] & SPI_CTL_DHB) {
> +            /* Store rx bytes only after WTC transfers */
> +            if (tx_burst > 0u) {
> +                fill_rx = false;
> +                tx_burst--;
> +            }
> +        }
> +
> +        if (fill_rx) {
> +            if (fifo8_is_full(&s->rx_fifo)) {
> +                s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_RF;
> +            } else {
> +                fifo8_push(&s->rx_fifo, rx);
> +            }
> +        }
> +
> +        allwinner_a10_spi_update_irq(s);
> +
> +        burst_count--;
> +
> +        if (burst_count == 0) {
> +            s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_TC;
> +            s->regs[REG_INDEX(SPI_CTL_REG)] &= ~SPI_CTL_XCH;
> +            break;
> +        }
> +    }
> +
> +    if (fifo8_is_empty(&s->tx_fifo)) {
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] |= SPI_INT_STA_TC;
> +        s->regs[REG_INDEX(SPI_CTL_REG)] &= ~SPI_CTL_XCH;
> +    }
> +
> +    trace_allwinner_a10_spi_flush_txfifo_end(fifo8_num_used(&s->tx_fifo),
> +                                             fifo8_num_used(&s->rx_fifo));
> +}
> +
> +static uint64_t allwinner_a10_spi_read(void *opaque, hwaddr offset,
> +                                       unsigned size)
> +{
> +    uint32_t value = 0;
> +    AWA10SPIState *s = opaque;
> +    uint32_t index = offset >> 2;

The MemoryRegionOps defines that size == 1 is permitted,
but this calculation of index without any validation
of offset means that if the guest writes a byte to
offset 1 we will treat that identically to writing a byte
to offset 0. This probably isn't what the hardware does.

> +
> +    if (offset > SPI_FIFO_STA_REG) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "[%s]%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
> +                      TYPE_AW_A10_SPI, __func__, offset);
> +        return 0;
> +    }
> +
> +    value = s->regs[index];
> +
> +    if (allwinner_a10_spi_is_enabled(s)) {
> +        switch (offset) {
> +        case SPI_RXDATA_REG:
> +            if (fifo8_is_empty(&s->rx_fifo)) {
> +                /* value is undefined */
> +                value = 0xdeadbeef;
> +            } else {
> +                /* read from the RX FIFO */
> +                value = fifo8_pop(&s->rx_fifo);
> +            }
> +            break;
> +        case SPI_TXDATA_REG:
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "[%s]%s: Trying to read from TX FIFO\n",
> +                          TYPE_AW_A10_SPI, __func__);
> +
> +            /* Reading from TXDATA gives 0 */
> +            break;
> +        case SPI_FIFO_STA_REG:
> +            /* Read current tx/rx fifo data count */
> +            value = fifo8_num_used(&s->tx_fifo) << SPI_FIFO_STA_TF_CNT_SHIFT |
> +                    fifo8_num_used(&s->rx_fifo) << SPI_FIFO_STA_RF_CNT_SHIFT;
> +        default:
> +            break;
> +        }
> +
> +        allwinner_a10_spi_update_irq(s);
> +    }
> +    trace_allwinner_a10_spi_read(allwinner_a10_spi_get_regname(offset), value);
> +
> +    return (uint64_t)value;

The cast here is unnecessary as the function return type is uint64_t.

> +}
> +
> +static void allwinner_a10_spi_write(void *opaque, hwaddr offset, uint64_t value,
> +                                    unsigned size)
> +{
> +    AWA10SPIState *s = opaque;
> +    uint32_t index = offset >> 2;

Similar remarks here about byte and halfword writes to
non-4-aligned offsets.

> +    int i = 0;
> +
> +    if (offset > SPI_FIFO_STA_REG) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "[%s]%s: Bad register at offset 0x%" HWADDR_PRIx "\n",
> +                      TYPE_AW_A10_SPI, __func__, offset);
> +        return;
> +    }
> +
> +    trace_allwinner_a10_spi_write(allwinner_a10_spi_get_regname(offset),
> +                                  (uint32_t)value);
> +
> +    if (!allwinner_a10_spi_is_enabled(s)) {
> +        /* Block is disabled */
> +        if (offset != SPI_CTL_REG) {
> +            /* Ignore access */
> +            return;
> +        }
> +    }
> +
> +    switch (offset) {
> +    case SPI_RXDATA_REG:
> +        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Trying to write to RX FIFO\n",
> +                      TYPE_AW_A10_SPI, __func__);
> +        break;
> +    case SPI_TXDATA_REG:
> +        if (fifo8_is_full(&s->tx_fifo)) {
> +            /* Ignore writes if queue is full */
> +            break;
> +        }
> +
> +        fifo8_push(&s->tx_fifo, (uint8_t)value);
> +
> +        break;
> +    case SPI_INT_STA_REG:
> +        /* Handle W1C bits - everything except SPI_INT_STA_INT_CBF. */
> +        value &= ~SPI_INT_STA_INT_CBF;
> +        s->regs[REG_INDEX(SPI_INT_STA_REG)] &= ~(value & SPI_INT_STA_MASK);
> +        break;
> +    case SPI_CTL_REG:
> +        s->regs[REG_INDEX(SPI_CTL_REG)] = value;
> +
> +        for (i = 0; i < AW_A10_SPI_CS_LINES_NR; i++) {
> +            qemu_set_irq(
> +                s->cs_lines[i],
> +                i == allwinner_a10_spi_selected_channel(s) ?
> +                    !!(s->regs[REG_INDEX(SPI_CTL_REG)] & SPI_CTL_SS_LEVEL) :
> +                    !(s->regs[REG_INDEX(SPI_CTL_REG)] & SPI_CTL_SSPOL));

This might be easier to read if we factored out the ?:
expression into a function with a descriptive name.

> +        }
> +
> +        if (s->regs[REG_INDEX(SPI_CTL_REG)] & SPI_CTL_XCH) {
> +            /* Request to start emitting */
> +            allwinner_a10_spi_flush_txfifo(s);
> +        }
> +        if (s->regs[REG_INDEX(SPI_CTL_REG)] & SPI_CTL_TF_RST) {
> +            allwinner_a10_spi_txfifo_reset(s);
> +            s->regs[REG_INDEX(SPI_CTL_REG)] &= ~SPI_CTL_TF_RST;
> +        }
> +        if (s->regs[REG_INDEX(SPI_CTL_REG)] & SPI_CTL_RF_RST) {
> +            allwinner_a10_spi_rxfifo_reset(s);
> +            s->regs[REG_INDEX(SPI_CTL_REG)] &= ~SPI_CTL_RF_RST;
> +        }
> +        break;
> +    default:
> +        s->regs[index] = value;
> +        break;
> +    }
> +
> +    allwinner_a10_spi_update_irq(s);
> +}
> +
> +static const MemoryRegionOps allwinner_a10_spi_ops = {
> +    .read = allwinner_a10_spi_read,
> +    .write = allwinner_a10_spi_write,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
> +static const VMStateDescription allwinner_a10_spi_vmstate = {
> +    .name = TYPE_AW_A10_SPI,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields =
> +        (const VMStateField[]){
> +            VMSTATE_FIFO8(tx_fifo, AWA10SPIState),
> +            VMSTATE_FIFO8(rx_fifo, AWA10SPIState),
> +            VMSTATE_UINT32_ARRAY(regs, AWA10SPIState, AW_A10_SPI_REGS_NUM),
> +            VMSTATE_END_OF_LIST() }

Our usual indent for this is
    .fields = (const VMStateField[]) {
         VMSTATE_FOO(...),
         ...
         VMSTATE_END_OF_LIST()
    }

> +};
> +

> --- a/hw/ssi/trace-events
> +++ b/hw/ssi/trace-events
> @@ -53,3 +53,13 @@ pnv_spi_rx_read_N2frame(void) ""
>  pnv_spi_shift_rx(uint8_t byte, uint32_t index) "byte = 0x%2.2x into RDR from payload index %d"
>  pnv_spi_sequencer_stop_requested(const char* reason) "due to %s"
>  pnv_spi_RDR_match(const char* result) "%s"
> +
> +# allwinner_a10_spi.c
> +allwinner_a10_spi_update_irq(uint32_t level) "IRQ level is %d"
> +allwinner_a10_spi_flush_txfifo_begin(uint32_t tx, uint32_t rx) "Begin: TX Fifo Size = %d, RX Fifo Size = %d"
> +allwinner_a10_spi_flush_txfifo_end(uint32_t tx, uint32_t rx) "End: TX Fifo Size = %d, RX Fifo Size = %d"
> +allwinner_a10_spi_burst_length(uint32_t len) "Burst length = %d"
> +allwinner_a10_spi_tx(uint8_t byte) "write 0x%02x"
> +allwinner_a10_spi_rx(uint8_t byte) "read 0x%02x"
> +allwinner_a10_spi_read(const char* regname, uint32_t value) "reg[%s] => 0x%" PRIx32
> +allwinner_a10_spi_write(const char* regname, uint32_t value) "reg[%s] <= 0x%" PRIx32

Be consistent about whether you want to use PRI* macros
for uint32_t types or not, please. (Admittedly QEMU itself is
not super consistent here either, but I think the more common
option is to use %d, %x etc for uint32_t, because we can assume
that 'int' is a 32-bit type. It's only uint64_t that requires the
PRI macros.)

thanks
-- PMM
