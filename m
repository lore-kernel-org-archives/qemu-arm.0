Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5465130wro;
        Tue, 30 Oct 2018 04:49:39 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e77fDyTwNZRzzdFjN8NZLMUT0ptyVvLCdAThtZk6mMPt1qZyd8BNEUiGSDmT4QVAU8KNx9
X-Received: by 2002:a37:4d89:: with SMTP id a131-v6mr15591037qkb.181.1540900179572;
        Tue, 30 Oct 2018 04:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540900179; cv=none;
        d=google.com; s=arc-20160816;
        b=IRf82ZZX+1XamtYpIaZ13UTsVdhPL78INubsZdqH6AqIG9NelxO2Yfzy+VcYrjn+lu
         CmBWG9/yzna08IsngSkaBzAqO+S13rQ60U9LNOzZA8dmRY03xQq1Vnks1eRTaRuo+oMI
         yWTBM1qKT4wLq2JPzoV7gJDFzHyC1o0VFP2ZlEtKhxWLFAbfXempmWGl0LN1RXImxXrd
         10OQ8jmEE4p+tAWIebWvtO3sgZMycrYFLbS/Ned5gZ9kCxe6K3nMkEbI2CbUz+aIHKDQ
         UUBZ3hx+MfXqp0GTNA9YSRTYm4rrxH3XCqBzLdVSN/vp7iTSmzRAgimAYBzOV85xw3D4
         Rv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=42y5puaPKJ/V6NHteZ8TlsQtEUTUStMurh5XV+13IPU=;
        b=jqvlpeQ1U1bU2diVzhqxttDTAtVRQRYJhaKKjyw1F78ot4UBzVM1T7ut1ouJoADvhO
         timEDa9eOLQb2Asq1bcZ7PQOWaI8Y3K8ojNNw/HWu5iPYh4E2cU9YHXJ6hxMGuBk4Y+Z
         rUg0EHxMrzgs/WxziyaXRipb1fwZVejhbN1yQIeQu60whqCx1BVdNxIf3MfUCT2NH2fQ
         p9bZ7rxF4aiIdpOWZe8WPsRUQexqMsS7mxrFmMDxm3KIGEBgM06GRieqzbwE33UuJ7h1
         ZNgcd/WZgPT/92cCk62IswC8gumxnr7lSLeSPWJthffQVi+/lDJiZp6fehMGspqHDqfU
         QF3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2-v6si7513209qkb.48.2018.10.30.04.49.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 04:49:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52421 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHSWg-00017K-NK
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 07:49:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSAY-0003ND-As
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 07:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHSAQ-0006co-2p
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 07:26:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHSAN-00065J-1k
	for qemu-devel@nongnu.org; Tue, 30 Oct 2018 07:26:36 -0400
Received: by mail-wr1-f68.google.com with SMTP id i17-v6so12107371wre.7
	for <qemu-devel@nongnu.org>; Tue, 30 Oct 2018 04:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=42y5puaPKJ/V6NHteZ8TlsQtEUTUStMurh5XV+13IPU=;
	b=fAxZGXLASF7Fa2w8gWEv/1B1/7vbSQOSF4cNBiN11LyCHyh3hcdwsLJIu8qLMoycXl
	WYEG2d/XbLk7kniZysexjsUX2PEGbcZe/Tt4xSvPkQmNisdaAlk3WhZhmNQiY+chmHLu
	zByolBSSD7XlgDjlH4qj0cKIp29f7iB0bRVrgyD9xDHpnCqYFEWYdIhyzZOKjabZ8XT6
	H3xHZhO4MEjdwDakms3/MDT+GSFC63wnZv9YwRSx1+0zXY36HCy0ImzuMsDMcqrnN7qK
	9pv4hAXt02v1iNPtipF5jOLnDN6Ahr5DqyNIbMlMhRTRZ2iYXytM2EoWplsxGSVuYvRg
	SFxg==
X-Gm-Message-State: AGRZ1gLmO/phFJAZhDmyDnie1vn8Y4oOrvTx7kRsI1QIhpC2LMf5Cc+h
	xNSaKu2N4RAcQEkkwy9mzl6bWQ==
X-Received: by 2002:a5d:6750:: with SMTP id
	l16-v6mr12025521wrw.152.1540898780797; 
	Tue, 30 Oct 2018 04:26:20 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	y19-v6sm10003124wma.7.2018.10.30.04.26.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 04:26:20 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
References: <20181029232100.8454-1-philmd@redhat.com>
	<20181029232100.8454-3-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <69ec2631-8f45-ce68-2337-02e60ffb780c@redhat.com>
Date: Tue, 30 Oct 2018 12:26:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181029232100.8454-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH 2/3] hw/dma/pl330: Factor out pl330_init()
 from hw/arm/xilinx_zynq.c
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pam4vM2T6+LI

On 30/10/18 0:20, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   MAINTAINERS            |  1 +
>   hw/arm/xilinx_zynq.c   | 18 ++----------------
>   hw/dma/pl330.c         |  2 +-
>   include/hw/dma/pl330.h | 41 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 45 insertions(+), 17 deletions(-)
>   create mode 100644 include/hw/dma/pl330.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d794bd7a66..647e2aa0d5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -452,6 +452,7 @@ F: hw/display/pl110*
>   F: hw/dma/pl080.c
>   F: include/hw/dma/pl080.h
>   F: hw/dma/pl330.c
> +F: include/hw/dma/pl330.h
>   F: hw/gpio/pl061.c
>   F: hw/input/pl050.c
>   F: hw/intc/pl190.c
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 57497b0c4d..a4c4d44f00 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -34,6 +34,7 @@
>   #include "hw/char/cadence_uart.h"
>   #include "hw/net/cadence_gem.h"
>   #include "hw/cpu/a9mpcore.h"
> +#include "hw/dma/pl330.h"
>   
>   #define NUM_SPI_FLASHES 4
>   #define NUM_QSPI_FLASHES 2
> @@ -278,22 +279,7 @@ static void zynq_init(MachineState *machine)
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
>       sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);
>   
> -    dev = qdev_create(NULL, "pl330");
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
> -    busdev = SYS_BUS_DEVICE(dev);
> -    sysbus_mmio_map(busdev, 0, 0xF8003000);
> -    sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line */
> +    pl330_init(0xf8003000, pic[45 - IRQ_OFFSET], 4); /* abort irq line */
>       for (n = 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
>           sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET]);

Sorry, this is a buggy patch   ^ busdev is now invalid.

>       }
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index d071049233..711cf9a605 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -20,6 +20,7 @@
>   #include "qemu/timer.h"
>   #include "sysemu/dma.h"
>   #include "qemu/log.h"
> +#include "hw/dma/pl330.h"
>   
>   #ifndef PL330_ERR_DEBUG
>   #define PL330_ERR_DEBUG 0
> @@ -271,7 +272,6 @@ struct PL330State {
>   
>   };
>   
> -#define TYPE_PL330 "pl330"
>   #define PL330(obj) OBJECT_CHECK(PL330State, (obj), TYPE_PL330)
>   
>   static const VMStateDescription vmstate_pl330 = {
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
> + * Copyright (c) 2012 Peter A.G. Crosthwaite (peter.crosthwaite@petalogix.com)
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
> +    dev = qdev_create(NULL, TYPE_PL330);
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
> +    busdev = SYS_BUS_DEVICE(dev);
> +    sysbus_mmio_map(busdev, 0, base);
> +    sysbus_connect_irq(busdev, 0, irq);
> +}
> +
> +#endif /* HW_DMA_PL330_H */
> 
