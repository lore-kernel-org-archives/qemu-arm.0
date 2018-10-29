Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4865176wro;
        Mon, 29 Oct 2018 16:50:47 -0700 (PDT)
X-Google-Smtp-Source: AJdET5daGF5HnN/4PMdmYnWFuLhS9SYr4lT5QGb5bTYabS1ExmbkrtMyypO60XebiFXt4Dm7+Oc+
X-Received: by 2002:ac8:21b6:: with SMTP id 51-v6mr463685qty.122.1540857047541;
        Mon, 29 Oct 2018 16:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540857047; cv=none;
        d=google.com; s=arc-20160816;
        b=KZnKbqMZ4E6qwdNje6gQTqikeCeYWJYuozWNkt8Q5T40FSrgnvH2whqXR8+duOLgk1
         cQTt6faVe+VLj3vcuYJmgHy0UFae5jVt8gWY/SwkeHy0TJ3ViiAjjeEhM9hrzGKMMdDY
         jvfU73gIh3a73zAE4fWqwIiGJgJYp8WPjbgUMv7uY75fydYzoTfjyKrlrbnPpfqSu5zr
         UUKmW59V2+Nd2mLXOgVCYC+xW7EDWXixd9csUvteTIqknumOkhUVdECCbcu8/JQ++mBR
         dzpP2VLyVL5fZTxN15/66ggf0rkaxQUMQwI7ewXb7rt39oXROwmbdDyosTrNJz75+lf0
         EU7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=+8zCGymrjutdwFrimWnSUDR1Jw0AAvI/HFI46JyjGPk=;
        b=JgshFASgq2+BMzwy/MhQ8CyV8sxjfyVHg8p9516VtM19NYG7G9/4sVvIAS+mc1pjBf
         4gVR9ZY9jdUgQlZK5dclJS6tzIcARmTLq3YRwS7/Cv/L8v2jDxqTItUiUx1bKczhxefX
         uz6AzEEYLajdAMs+o6Imp8ulRMWQB2IUXIAa6vu2e+PBO+cII/8BRCe1XSBIdw1FU3Ue
         62RRuz1hwwAqzMyhnXIuCE9z8EiRLQzmEhFuSLuGycm+pv2lafj2FEhs6gvl2kneO9D4
         aBarVV4Gi5RAEePp7MkZVmG6CVENRYuhO7gao9fOzSl9SFdQ31ME7Q4AG2V6zhCVple2
         ypNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pQRL7liX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j16-v6si12410358qtr.152.2018.10.29.16.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 16:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pQRL7liX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHHJ1-0000aQ-38
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 19:50:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHHIB-00005b-TH
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:49:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHHIA-0006yd-Ra
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:49:55 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:43492)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHHIA-0006y2-J9; Mon, 29 Oct 2018 19:49:54 -0400
Received: by mail-lf1-x144.google.com with SMTP id u18so7446316lff.10;
	Mon, 29 Oct 2018 16:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+8zCGymrjutdwFrimWnSUDR1Jw0AAvI/HFI46JyjGPk=;
	b=pQRL7liXeE7PD0EW8ytHcAxzGsiOL7sLrbOhpHlyyJ4WBUP/Oj5AxlyxkNq1MnXQdb
	JytjpVxZpGUqNoUmmXAknCy4odseNZL8wLbnvPY+gqc25zZ3LloCu5uvSwMXuXZJ6Iek
	IyyjYW38vOZLD+f+qBFxWqbfwjAyfGw09p4PEnIg9F4gK2d5D6sTVIF6WlvuUG6l1cFg
	85Wqo9eb/RA1504usHRW3Oizdup6r1/WuYv0B7MkSqjWWi4mBY8WO5BEMU/NoPbER123
	OXIY0KqTFgbLYUc5BWd5YZqx3HkhpoIunTgO6ComTm9rCicBj6phO/4auCJ+gK3PAocn
	9Tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+8zCGymrjutdwFrimWnSUDR1Jw0AAvI/HFI46JyjGPk=;
	b=j+zxu2QD1lQB+uGl8YEa1atAdy+4MRuZ684OifwQdKAPo9Lgmd1igGyj9PE4WnzzWs
	h8cU+1rQWj7YdPpyF6wyZeeaBu8p67ADqm0H+4pWyzszyKQ8gq1FOCyuwEbf+W0oFC5i
	Gx2twdv+blzzABJWXhTOccLJvw350KITkD6LRVJ2n8gsNWxMh4ANLVbULgWjlZ2wNlOh
	Jx5mSi/dr6zYKdYwilj4/Y4UnVapyzrdIqrSdIw5GapXUa25Fx7DrjDCTHRAUMKH+u6V
	I7fMHuGPyRVfAltQDbKZOEOLCzdd3HQP7a7VswEsEeYChWxz2I1K1rHj6K/krkmyPPy7
	4QyA==
X-Gm-Message-State: AGRZ1gJ7Wbra3LuUYSTY0mwcdDdt5N71bWTyomOlLjrl2YifKlGNEIIX
	PJHM8H2pjeP0wFbvEx2H6BPhC/8tMEoacJ8zxKA=
X-Received: by 2002:a19:ae03:: with SMTP id f3mr473488lfc.86.1540856993195;
	Mon, 29 Oct 2018 16:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-3-philmd@redhat.com>
In-Reply-To: <20181029232100.8454-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Oct 2018 16:49:26 -0700
Message-ID: <CAKmqyKM5p26jF2ZASmEiE-qDJOc5g7Znw9EsgOi3keGu9NjMXA@mail.gmail.com>
To: philmd@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/dma/pl330: Factor out
 pl330_init() from hw/arm/xilinx_zynq.c
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
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cYQDvoMJ1oUZ

On Mon, Oct 29, 2018 at 4:24 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS            |  1 +
>  hw/arm/xilinx_zynq.c   | 18 ++----------------
>  hw/dma/pl330.c         |  2 +-
>  include/hw/dma/pl330.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 45 insertions(+), 17 deletions(-)
>  create mode 100644 include/hw/dma/pl330.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d794bd7a66..647e2aa0d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -452,6 +452,7 @@ F: hw/display/pl110*
>  F: hw/dma/pl080.c
>  F: include/hw/dma/pl080.h
>  F: hw/dma/pl330.c
> +F: include/hw/dma/pl330.h
>  F: hw/gpio/pl061.c
>  F: hw/input/pl050.c
>  F: hw/intc/pl190.c
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 57497b0c4d..a4c4d44f00 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -34,6 +34,7 @@
>  #include "hw/char/cadence_uart.h"
>  #include "hw/net/cadence_gem.h"
>  #include "hw/cpu/a9mpcore.h"
> +#include "hw/dma/pl330.h"
>
>  #define NUM_SPI_FLASHES 4
>  #define NUM_QSPI_FLASHES 2
> @@ -278,22 +279,7 @@ static void zynq_init(MachineState *machine)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
>      sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);
>
> -    dev =3D qdev_create(NULL, "pl330");
> -    qdev_prop_set_uint8(dev, "num_chnls",  8);
> -    qdev_prop_set_uint8(dev, "num_periph_req",  4);
> -    qdev_prop_set_uint8(dev, "num_events",  16);
> -
> -    qdev_prop_set_uint8(dev, "data_width",  64);
> -    qdev_prop_set_uint8(dev, "wr_cap",  8);
> -    qdev_prop_set_uint8(dev, "wr_q_dep",  16);
> -    qdev_prop_set_uint8(dev, "rd_cap",  8);
> -    qdev_prop_set_uint8(dev, "rd_q_dep",  16);
> -    qdev_prop_set_uint16(dev, "data_buffer_dep",  256);
> -
> -    qdev_init_nofail(dev);
> -    busdev =3D SYS_BUS_DEVICE(dev);
> -    sysbus_mmio_map(busdev, 0, 0xF8003000);
> -    sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line=
 */
> +    pl330_init(0xf8003000, pic[45 - IRQ_OFFSET], 4); /* abort irq line *=
/
>      for (n =3D 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
>          sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET])=
;
>      }
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index d071049233..711cf9a605 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -20,6 +20,7 @@
>  #include "qemu/timer.h"
>  #include "sysemu/dma.h"
>  #include "qemu/log.h"
> +#include "hw/dma/pl330.h"
>
>  #ifndef PL330_ERR_DEBUG
>  #define PL330_ERR_DEBUG 0
> @@ -271,7 +272,6 @@ struct PL330State {
>
>  };
>
> -#define TYPE_PL330 "pl330"
>  #define PL330(obj) OBJECT_CHECK(PL330State, (obj), TYPE_PL330)
>
>  static const VMStateDescription vmstate_pl330 =3D {
> diff --git a/include/hw/dma/pl330.h b/include/hw/dma/pl330.h
> new file mode 100644
> index 0000000000..9a586c0df9
> --- /dev/null
> +++ b/include/hw/dma/pl330.h
> @@ -0,0 +1,41 @@
> +/*
> + * ARM PrimeCell PL330 DMA Controller
> + *
> + * Copyright (c) 2009 Samsung Electronics.
> + * Contributed by Kirill Batuzov <batuzovk@ispras.ru>
> + * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogi=
x.com)
> + * Copyright (c) 2012 PetaLogix Pty Ltd.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_DMA_PL330_H
> +#define HW_DMA_PL330_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_PL330 "pl330"
> +
> +static inline void pl330_init(uint32_t base, qemu_irq irq, int nreq)
> +{
> +    SysBusDevice *busdev;
> +    DeviceState *dev;
> +
> +    dev =3D qdev_create(NULL, TYPE_PL330);
> +    qdev_prop_set_uint8(dev, "num_chnls", 8);
> +    qdev_prop_set_uint8(dev, "num_periph_req", nreq);
> +    qdev_prop_set_uint8(dev, "num_events", 16);
> +    qdev_prop_set_uint8(dev, "data_width", 64);
> +    qdev_prop_set_uint8(dev, "wr_cap", 8);
> +    qdev_prop_set_uint8(dev, "wr_q_dep", 16);
> +    qdev_prop_set_uint8(dev, "rd_cap", 8);
> +    qdev_prop_set_uint8(dev, "rd_q_dep", 16);
> +    qdev_prop_set_uint16(dev, "data_buffer_dep", 256);
> +    qdev_init_nofail(dev);
> +
> +    busdev =3D SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, base);
> +    sysbus_connect_irq(busdev, 0, irq);
> +}
> +
> +#endif /* HW_DMA_PL330_H */
> --
> 2.17.2
>
>
