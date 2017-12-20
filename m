Received: by 10.223.159.74 with SMTP id f10csp4567583wrg;
        Tue, 19 Dec 2017 16:49:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBouaLv2SgU/G8gDgIajHu60Zjbom7IT3MinHXTWjB/h7i3B7YyrhYcNz47j5AUp2XnXkQ9wx
X-Received: by 10.37.214.79 with SMTP id n76mr3865277ybg.313.1513730984423;
        Tue, 19 Dec 2017 16:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513730984; cv=none;
        d=google.com; s=arc-20160816;
        b=oyL4dz9g87nYOeHo3n6ZAPyazQ7AMkwRRzfe/EMDUfmf1qajfvU8ezm3YzQ3uo2ex9
         mgK9E24047CvlzYWMw6xvbwp1iSnLeajfQ1Tf+PmbpHw+1WRX8UgfpVcNP3qRkEalTPX
         B2/g/FGMS12Nsb/aUJELoqF4CbY4ioK8NaX7MVqHdNaJaTLVuFdTub6Ds7ROZkTR1/SL
         UYJiAdiKpgpwdFjdh1hjcoJJSEF/jWssvA+xm1KgH4GCCeQ5Ny1n1ES2k5NcC8JTs7Mh
         kNPzV7ZGECe1K5OF607JmRrXkhX1UnYWb2hkhNSL8cW+eRkRUKxsHrS/OeH9aqzjyTwx
         MdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UyNqAdgz3pBLtxiv+9DrmSWC2DhJp5VIzel/mDdjjqs=;
        b=kXlz1CXoDTU3Cz3x0/zUgYwboCjx1LJ1Sy4YWC3lrzjcmvkHj/QfPEqxeVF13FjEnN
         2xMFKxIHssKW+OwWK8g/qqSMMru3icdacsY+rZKliprZugSq5W56LHvgKQRoXD/86kkT
         4skgYjJieDf++Y2cIES/uWtCDf5+O20Sqg9jYZqtGtC6617I0paBGKVTG8JIDWn82a3C
         /mnnVfgozsqMxBsx0jGkO7vMwemwokt4zVTPv071j++KRSMuENpKZ8kQRWJY1ypBKqsW
         CaL8oSiurg0MEa01HGLSQJxStYchCjc6hfDT51gz88EY8zim1HVzqTNCR3VMDf6HHE5S
         bPFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lkThp66J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v186si707440ybe.346.2017.12.19.16.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Dec 2017 16:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lkThp66J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eRSZr-0002Hp-Tn
	for alex.bennee@linaro.org; Tue, 19 Dec 2017 19:49:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eRSZe-0002HK-2r
	for qemu-devel@nongnu.org; Tue, 19 Dec 2017 19:49:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eRSZc-0007u0-UK
	for qemu-devel@nongnu.org; Tue, 19 Dec 2017 19:49:30 -0500
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:33243)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eRSZc-0007sy-K7; Tue, 19 Dec 2017 19:49:28 -0500
Received: by mail-wr0-x22e.google.com with SMTP id v21so10167935wrc.0;
	Tue, 19 Dec 2017 16:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=UyNqAdgz3pBLtxiv+9DrmSWC2DhJp5VIzel/mDdjjqs=;
	b=lkThp66J7omvfpe7b0hAUCsaIuql0wv7l9ArNUId8JMaXuE70w5d1gdt9jielOkBhH
	efXmshbz+8rIShT0p2dIKietf/9Ofq0rUEfLOqcqQAN6Ib+8FiudOZ/3CJ4HczOm0CL/
	UdgzmWT95Cr04uK1dAOwzT9uXk2yqtAVyPJDwtGHldDJV7HLGYxHig2x/aaQYs238zqy
	4+VnQw0DiemK+0AKIvukwoErfXGiwheHD6YrO4qGdoiFPKbfIks31IrEDK3jowhMngOi
	k/Alq05q6C+JjjoyajaX4P3qnoHdoQ8VjSbP0i0zjjD5yWDY4C2hGvXudwWHfHHcro/H
	I6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=UyNqAdgz3pBLtxiv+9DrmSWC2DhJp5VIzel/mDdjjqs=;
	b=q/Bogp3tRLTfHNPC1tl51GgGi9TjMOdn7ZWpZVHXiQV9dt/++trt5963z/hIEe7zEl
	UJm29zmKZrX7ob7rt3zTufdSOokAiowCLBNmsNA13xmVJinxTK1OLPaBhXc4XsOsIpw7
	g8MrMhLFRM9x8RkR240uWnkEkO+k9D3Flphs3+7hhUcjYVFeMP2U0kVm6Tosp4Xyrkic
	bb1ElcO3YGW5o0yLY5aovQ1hH0SQG0Hy5AS4HaDeg58iQyZmEDarvM9QFsjoFsGZT+cn
	gwyyKVDEAGbikGlYZJ/kEvAYW/T5fTn/AFEmJjmJQn8c6Y/B9xiSISOTWHdxgKNudgt3
	OmeQ==
X-Gm-Message-State: AKGB3mLOUvz+5lE26B32JczDMxUPevR711W1LTmaufpeky2U4BQzBUTz
	vGCkxjAXpe7l9tWVM1v0+6ORnb5YSV9XdLpKdMc=
X-Received: by 10.223.187.3 with SMTP id r3mr7025627wrg.34.1513730967429; Tue,
	19 Dec 2017 16:49:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Tue, 19 Dec 2017 16:48:56 -0800 (PST)
In-Reply-To: <20171214151934.3647-1-andrew.smirnov@gmail.com>
References: <20171214151934.3647-1-andrew.smirnov@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 19 Dec 2017 16:48:56 -0800
X-Google-Sender-Auth: TqRlrz_JeVOC1SH2O9VQ6LSiQ90
Message-ID: <CAKmqyKOV7kYBTDmjLaFTtKAF7KyZQ56F2LiwE5D+Hzzh9nvmxA@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-devel] [PATCH] hw/misc: Add code to emulate Xilinx Slave
 Serial port
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0qoJr0p802wG

On Thu, Dec 14, 2017 at 7:19 AM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:
> Add code to emulate Xilinx Slave Serial FPGA configuration port.
>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Hey,

Thanks for the patch!

I have some comments inline, if anything is unclear just email me back
and I can provide more information or help.

> ---
>
> Integrating this into a build system via "obj-y" might not be the best
> way. Does this code need a dedicated CONFIG_ symbol?

You probably don't need a specific one, there are already some Xilinx
ones in there you can use.

Maybe CONFIG_XILINX or CONFIG_XILINX_AXI

>
> Thanks,
> Andrey Smirnov
>
>
>  hw/misc/Makefile.objs                 |   1 +
>  hw/misc/xilinx_slave_serial.c         | 105 ++++++++++++++++++++++++++++++++++
>  include/hw/misc/xilinx_slave_serial.h |  21 +++++++
>  3 files changed, 127 insertions(+)
>  create mode 100644 hw/misc/xilinx_slave_serial.c
>  create mode 100644 include/hw/misc/xilinx_slave_serial.h

You will need to connect this to a machine as well.

>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index a68a201083..4599288e55 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -38,6 +38,7 @@ obj-$(CONFIG_IMX) += imx7_ccm.o
>  obj-$(CONFIG_IMX) += imx2_wdt.o
>  obj-$(CONFIG_IMX) += imx7_snvs.o
>  obj-$(CONFIG_IMX) += imx7_gpr.o
> +obj-y += xilinx_slave_serial.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
>  obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
>  obj-$(CONFIG_MAINSTONE) += mst_fpga.o
> diff --git a/hw/misc/xilinx_slave_serial.c b/hw/misc/xilinx_slave_serial.c
> new file mode 100644
> index 0000000000..607674fb60
> --- /dev/null
> +++ b/hw/misc/xilinx_slave_serial.c
> @@ -0,0 +1,105 @@
> +/*
> + * Copyright (c) 2017, Impinj, Inc.
> + *
> + * Code to emulate programming "port" of Xilinx FPGA in Slave Serial
> + * configuration connected via SPI, for more deatils see (p. 27):
> + *
> + * See https://www.xilinx.com/support/documentation/user_guides/ug380.pdf

Ah, so this is for a Spartan-6 device. We don't have any QEMU support
for Spartan-6. What are you trying to use this for?

> + *
> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/misc/xilinx_slave_serial.h"
> +#include "qemu/log.h"
> +
> +enum {
> +    XILINX_SLAVE_SERIAL_STATE_RESET,
> +    XILINX_SLAVE_SERIAL_STATE_RECONFIGURATION,
> +    XILINX_SLAVE_SERIAL_STATE_DONE,
> +};
> +
> +static void xilinx_slave_serial_update_outputs(XilinxSlaveSerialState *xlnxss)

For function names try to use xlnx instead of xilinx, it just saves line length.

> +{
> +    qemu_set_irq(xlnxss->done,
> +                 xlnxss->state == XILINX_SLAVE_SERIAL_STATE_DONE);
> +}
> +
> +static void xilinx_slave_serial_reset(DeviceState *dev)
> +{
> +    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(dev);

This is generally just called 's'.

> +
> +    xlnxss->state = XILINX_SLAVE_SERIAL_STATE_RESET;
> +
> +    xilinx_slave_serial_update_outputs(xlnxss);
> +}
> +
> +static void xilinx_slave_serial_prog_b(void *opaque, int n, int level)
> +{
> +    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(opaque);
> +    assert(n == 0);
> +
> +    if (level) {
> +        xlnxss->state = XILINX_SLAVE_SERIAL_STATE_RECONFIGURATION;
> +    }
> +
> +    xilinx_slave_serial_update_outputs(xlnxss);
> +}
> +
> +static void xilinx_slave_serial_realize(SSISlave *ss, Error **errp)
> +{
> +    DeviceState *dev = DEVICE(ss);
> +    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(ss);
> +
> +    qdev_init_gpio_in_named(dev,
> +                            xilinx_slave_serial_prog_b,
> +                            XILINX_SLAVE_SERIAL_GPIO_PROG_B,
> +                            1);
> +    qdev_init_gpio_out_named(dev, &xlnxss->done,
> +                             XILINX_SLAVE_SERIAL_GPIO_DONE, 1);
> +}
> +
> +static uint32_t xilinx_slave_serial_transfer(SSISlave *ss, uint32_t tx)
> +{
> +    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(ss);
> +
> +    if (xlnxss->state == XILINX_SLAVE_SERIAL_STATE_RECONFIGURATION) {
> +        xlnxss->state = XILINX_SLAVE_SERIAL_STATE_DONE;
> +    }
> +
> +    xilinx_slave_serial_update_outputs(xlnxss);
> +    return 0;
> +}
> +
> +static void xilinx_slave_serial_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass   *dc = DEVICE_CLASS(klass);
> +    SSISlaveClass *k  = SSI_SLAVE_CLASS(klass);
> +
> +    dc->reset      = xilinx_slave_serial_reset;
> +    dc->desc       = "Xilinx Slave Serial";
> +    k->realize     = xilinx_slave_serial_realize;
> +    k->transfer    = xilinx_slave_serial_transfer;
> +    /*
> +     * Slave Serial configuration is not technically SPI and there's
> +     * no CS signal
> +     */
> +    k->set_cs      = NULL;
> +    k->cs_polarity = SSI_CS_NONE;
> +}
> +
> +static const TypeInfo xilinx_slave_serial_info = {
> +    .name          = TYPE_XILINX_SLAVE_SERIAL,
> +    .parent        = TYPE_SSI_SLAVE,
> +    .instance_size = sizeof(XilinxSlaveSerialState),
> +    .class_init    = xilinx_slave_serial_class_init,
> +};
> +
> +static void xilinx_slave_serial_register_type(void)
> +{
> +    type_register_static(&xilinx_slave_serial_info);
> +}
> +type_init(xilinx_slave_serial_register_type)
> diff --git a/include/hw/misc/xilinx_slave_serial.h b/include/hw/misc/xilinx_slave_serial.h
> new file mode 100644
> index 0000000000..f7b2e22be3
> --- /dev/null
> +++ b/include/hw/misc/xilinx_slave_serial.h
> @@ -0,0 +1,21 @@
> +#ifndef XILINX_SLAVE_SERIAL_H
> +#define XILINX_SLAVE_SERIAL_H
> +
> +#include "hw/ssi/ssi.h"
> +
> +typedef struct XilinxSlaveSerialState {
> +    /*< private >*/
> +    SSISlave parent_obj;
> +
> +    qemu_irq done;
> +    int state;
> +} XilinxSlaveSerialState;
> +
> +#define TYPE_XILINX_SLAVE_SERIAL "xilinx:slave-serial"

Full stop instead of colon.

Overall the model looks fine, I'm just not sure what you are using it
for as it isn't connected to anything.

Thanks,
Alistair

> +#define XILINX_SLAVE_SERIAL(obj) \
> +    OBJECT_CHECK(XilinxSlaveSerialState, (obj), TYPE_XILINX_SLAVE_SERIAL)
> +
> +#define XILINX_SLAVE_SERIAL_GPIO_DONE   "xilinx:slave-serial:done"
> +#define XILINX_SLAVE_SERIAL_GPIO_PROG_B "xilinx:slave-serial:prog-b"
> +
> +#endif /* XILINX_SLAVE_SERIAL_H */
> --
> 2.14.3
>
>
