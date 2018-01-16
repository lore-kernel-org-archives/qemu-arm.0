Received: by 10.28.173.206 with SMTP id w197csp3385873wme;
        Mon, 15 Jan 2018 17:51:20 -0800 (PST)
X-Google-Smtp-Source: ACJfBotffcYxSGUJaK/UhFF/2LqIlwgQbbd8oG08zoPL9AT6p2o/Pq7gICrrKjIx6DXBz0EhTvpp
X-Received: by 10.37.18.197 with SMTP id 188mr35713053ybs.492.1516067480524;
        Mon, 15 Jan 2018 17:51:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516067480; cv=none;
        d=google.com; s=arc-20160816;
        b=xEV9F9mGl+xK8bMF1czwh3wUxHrpHJL6ZnmTgIfc0AVUyo/nJXEMg1/0mQWVgh6TSu
         uu+utQCOMiru6C+OqLzEj25veAHipQPS/fMs4Um649wz5mgWlM3o/zu+3V2x74Ru4+Tq
         QPLRUephq9oRdusg6iZDrx07kdmAdwWo4wopgjCc8TaxuxvSIYjiDow6Paho7DQt21Dk
         tkx3Q3UWRzEGB+wE9XLX3JuDLSSMdgzBBv+/R9R4mIamQZmFKTJo0nJxcx/+O8K4yQQA
         XG4Oewc/TtQBXFrVAHeGwryKavdBVvkViPjfCoGcQPdQW+04FSYISe1o6keq+SHd0XeE
         bItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZlhyN0LMr//CaDuzijGtmOq490o+ojk6ABTdYSR/Cs8=;
        b=jHA21D+oLrDhqHml+PDAMNL4J4KvdSMvFg6JogSFh7MJEQ6MJxaw+0KocgQYDrG+Fe
         pwf9jsPg/3iO4phj00bLT+g6blRUjZUljaVK+zxirixxl1+tJpSvYIQip7FpTv3fZwxl
         TtBOr7/XIj01kONjKPfbDydqbhWyo6owXryjWyB7+oRzzHrmXmnU4tgCJ933voMOsYay
         E1Ptmed3u0cfXoZcilUvFp8SjjBpNbApnOzo0CJyMLqCUOZ8VN0Yw+FFD5gojz6FQuME
         EWZadSUtjSFiuwTHcRb4G+I9OY9fAAR9rfoahFZoaZf/VNXE1/EBzgaP9a4PrioHR0RE
         4QgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tkQnetPd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t138si225391ywc.390.2018.01.15.17.51.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:51:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tkQnetPd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGPH-0000ZE-U9
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:51:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGP7-0000XO-Qh
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:51:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGP6-0004zc-9n
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:51:09 -0500
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:33184)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGP3-0004yT-17; Mon, 15 Jan 2018 20:51:05 -0500
Received: by mail-qt0-x231.google.com with SMTP id e2so16461008qti.0;
	Mon, 15 Jan 2018 17:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZlhyN0LMr//CaDuzijGtmOq490o+ojk6ABTdYSR/Cs8=;
	b=tkQnetPdTpXFgUaG4PLhKaRomTM7GwUZN1Zs7ngxP+YDs6F7vMXEu+gM9qnVyi8eT0
	RA46X9cWrU9gTgx+x5Qq1sxoQuqqMOKbVd/g2rZnFTNAcoQk0kQxPEC8Om5fMb4Hyd9P
	5fFC2Tfs5yq4oAWqbFbMdOIV28WQO5sYN32KDXjWoW6+rBAMOXR/6IwwjMa177xQC+i3
	VBR5L3gLCYB8t1KbjWUcizj1k5P1Y8DCmM9BlSgUXAiC7jLxerbbpz0CxXTknsJqNVbZ
	J3HltbwLyicqfgHnGUe18ofmlfonQPnteAfuAfKDHOjgkshCGHQfZZWlWhT4y2jt2tdl
	e/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZlhyN0LMr//CaDuzijGtmOq490o+ojk6ABTdYSR/Cs8=;
	b=IpSUUesnoowRMiJyPX+FpikbwUeUB+TedloC8mnzKZ6jLgA84FWlPPK98favnZQZuz
	2miGijrnhWZ99Uw5SAqu2AJLtll7vhGXQBO4sxDh0x2xJaEg0tf6ONd7cN9668+s1PlL
	B/W7cMIPyKPCX6o6UrPJKyjObK6GT1jUdYX7164I4ShJ/ENx9DItGr3KaLfziKFFWmab
	u+tQ1rbVKnEmS9DGusP1cj6hECmkIPwhDvAjS3PlMRr0R4aZnKH4nsbPCQZNFr0hJsHl
	yl7//7rWjClsoxKQ4KPgpbBKsdYwe6h5+yXuvGH6i6Cb0UgoyYQnSa+ZbEMxpM9R7JkC
	OSdw==
X-Gm-Message-State: AKwxytfpr9je8Ku52d/BQRTdiL2mwmGP3sP1N4vP6Nx5BX4wQ4RP4oL0
	MjpU8kZQMmFDNsucbJktHMuoeT4rLhHslWeUr7w=
X-Received: by 10.200.45.228 with SMTP id q33mr8646253qta.126.1516067464138;
	Mon, 15 Jan 2018 17:51:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.39 with HTTP; Mon, 15 Jan 2018 17:51:03 -0800 (PST)
In-Reply-To: <CAKmqyKOV7kYBTDmjLaFTtKAF7KyZQ56F2LiwE5D+Hzzh9nvmxA@mail.gmail.com>
References: <20171214151934.3647-1-andrew.smirnov@gmail.com>
	<CAKmqyKOV7kYBTDmjLaFTtKAF7KyZQ56F2LiwE5D+Hzzh9nvmxA@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 15 Jan 2018 17:51:03 -0800
Message-ID: <CAHQ1cqFhHRVNOT4Fo+AbF9CXYn77Npy2g6hzWJ+Lh90aRxT=0A@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/misc: Add code to emulate
 Xilinx Slave Serial port
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
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dEQpaPfB46R1

On Tue, Dec 19, 2017 at 4:48 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Thu, Dec 14, 2017 at 7:19 AM, Andrey Smirnov
> <andrew.smirnov@gmail.com> wrote:
>> Add code to emulate Xilinx Slave Serial FPGA configuration port.
>>
>> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
>> Cc: Alistair Francis <alistair.francis@xilinx.com>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>
> Hey,
>
> Thanks for the patch!
>
> I have some comments inline, if anything is unclear just email me back
> and I can provide more information or help.
>
>> ---
>>
>> Integrating this into a build system via "obj-y" might not be the best
>> way. Does this code need a dedicated CONFIG_ symbol?
>
> You probably don't need a specific one, there are already some Xilinx
> ones in there you can use.
>
> Maybe CONFIG_XILINX or CONFIG_XILINX_AXI
>

OK, will do if I ever re-spin this patch

>>
>> Thanks,
>> Andrey Smirnov
>>
>>
>>  hw/misc/Makefile.objs                 |   1 +
>>  hw/misc/xilinx_slave_serial.c         | 105 ++++++++++++++++++++++++++++++++++
>>  include/hw/misc/xilinx_slave_serial.h |  21 +++++++
>>  3 files changed, 127 insertions(+)
>>  create mode 100644 hw/misc/xilinx_slave_serial.c
>>  create mode 100644 include/hw/misc/xilinx_slave_serial.h
>
> You will need to connect this to a machine as well.
>
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index a68a201083..4599288e55 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -38,6 +38,7 @@ obj-$(CONFIG_IMX) += imx7_ccm.o
>>  obj-$(CONFIG_IMX) += imx2_wdt.o
>>  obj-$(CONFIG_IMX) += imx7_snvs.o
>>  obj-$(CONFIG_IMX) += imx7_gpr.o
>> +obj-y += xilinx_slave_serial.o
>>  obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
>>  obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
>>  obj-$(CONFIG_MAINSTONE) += mst_fpga.o
>> diff --git a/hw/misc/xilinx_slave_serial.c b/hw/misc/xilinx_slave_serial.c
>> new file mode 100644
>> index 0000000000..607674fb60
>> --- /dev/null
>> +++ b/hw/misc/xilinx_slave_serial.c
>> @@ -0,0 +1,105 @@
>> +/*
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * Code to emulate programming "port" of Xilinx FPGA in Slave Serial
>> + * configuration connected via SPI, for more deatils see (p. 27):
>> + *
>> + * See https://www.xilinx.com/support/documentation/user_guides/ug380.pdf
>
> Ah, so this is for a Spartan-6 device. We don't have any QEMU support
> for Spartan-6. What are you trying to use this for?
>

The use-case for this patch is to fool FPGA configuration tools
running on the guest into beliving that they successfully configure
Spartan-6 device. I tested this code against
"drivers/fpga/xilinx-spi.c" from Linux kernel.

>> + *
>> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/misc/xilinx_slave_serial.h"
>> +#include "qemu/log.h"
>> +
>> +enum {
>> +    XILINX_SLAVE_SERIAL_STATE_RESET,
>> +    XILINX_SLAVE_SERIAL_STATE_RECONFIGURATION,
>> +    XILINX_SLAVE_SERIAL_STATE_DONE,
>> +};
>> +
>> +static void xilinx_slave_serial_update_outputs(XilinxSlaveSerialState *xlnxss)
>
> For function names try to use xlnx instead of xilinx, it just saves line length.

Will fix if I re-spin this patch.

>
>> +{
>> +    qemu_set_irq(xlnxss->done,
>> +                 xlnxss->state == XILINX_SLAVE_SERIAL_STATE_DONE);
>> +}
>> +
>> +static void xilinx_slave_serial_reset(DeviceState *dev)
>> +{
>> +    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(dev);
>
> This is generally just called 's'.

OK, will fix if I re-spin this patch

>
>> +
>> +    xlnxss->state = XILINX_SLAVE_SERIAL_STATE_RESET;
>> +
>> +    xilinx_slave_serial_update_outputs(xlnxss);
>> +}
>> +
>> +static void xilinx_slave_serial_prog_b(void *opaque, int n, int level)
>> +{
>> +    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(opaque);
>> +    assert(n == 0);
>> +
>> +    if (level) {
>> +        xlnxss->state = XILINX_SLAVE_SERIAL_STATE_RECONFIGURATION;
>> +    }
>> +
>> +    xilinx_slave_serial_update_outputs(xlnxss);
>> +}
>> +
>> +static void xilinx_slave_serial_realize(SSISlave *ss, Error **errp)
>> +{
>> +    DeviceState *dev = DEVICE(ss);
>> +    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(ss);
>> +
>> +    qdev_init_gpio_in_named(dev,
>> +                            xilinx_slave_serial_prog_b,
>> +                            XILINX_SLAVE_SERIAL_GPIO_PROG_B,
>> +                            1);
>> +    qdev_init_gpio_out_named(dev, &xlnxss->done,
>> +                             XILINX_SLAVE_SERIAL_GPIO_DONE, 1);
>> +}
>> +
>> +static uint32_t xilinx_slave_serial_transfer(SSISlave *ss, uint32_t tx)
>> +{
>> +    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(ss);
>> +
>> +    if (xlnxss->state == XILINX_SLAVE_SERIAL_STATE_RECONFIGURATION) {
>> +        xlnxss->state = XILINX_SLAVE_SERIAL_STATE_DONE;
>> +    }
>> +
>> +    xilinx_slave_serial_update_outputs(xlnxss);
>> +    return 0;
>> +}
>> +
>> +static void xilinx_slave_serial_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass   *dc = DEVICE_CLASS(klass);
>> +    SSISlaveClass *k  = SSI_SLAVE_CLASS(klass);
>> +
>> +    dc->reset      = xilinx_slave_serial_reset;
>> +    dc->desc       = "Xilinx Slave Serial";
>> +    k->realize     = xilinx_slave_serial_realize;
>> +    k->transfer    = xilinx_slave_serial_transfer;
>> +    /*
>> +     * Slave Serial configuration is not technically SPI and there's
>> +     * no CS signal
>> +     */
>> +    k->set_cs      = NULL;
>> +    k->cs_polarity = SSI_CS_NONE;
>> +}
>> +
>> +static const TypeInfo xilinx_slave_serial_info = {
>> +    .name          = TYPE_XILINX_SLAVE_SERIAL,
>> +    .parent        = TYPE_SSI_SLAVE,
>> +    .instance_size = sizeof(XilinxSlaveSerialState),
>> +    .class_init    = xilinx_slave_serial_class_init,
>> +};
>> +
>> +static void xilinx_slave_serial_register_type(void)
>> +{
>> +    type_register_static(&xilinx_slave_serial_info);
>> +}
>> +type_init(xilinx_slave_serial_register_type)
>> diff --git a/include/hw/misc/xilinx_slave_serial.h b/include/hw/misc/xilinx_slave_serial.h
>> new file mode 100644
>> index 0000000000..f7b2e22be3
>> --- /dev/null
>> +++ b/include/hw/misc/xilinx_slave_serial.h
>> @@ -0,0 +1,21 @@
>> +#ifndef XILINX_SLAVE_SERIAL_H
>> +#define XILINX_SLAVE_SERIAL_H
>> +
>> +#include "hw/ssi/ssi.h"
>> +
>> +typedef struct XilinxSlaveSerialState {
>> +    /*< private >*/
>> +    SSISlave parent_obj;
>> +
>> +    qemu_irq done;
>> +    int state;
>> +} XilinxSlaveSerialState;
>> +
>> +#define TYPE_XILINX_SLAVE_SERIAL "xilinx:slave-serial"
>
> Full stop instead of colon.

Good to know, will fix if I re-spin this patch

>
> Overall the model looks fine, I'm just not sure what you are using it
> for as it isn't connected to anything.

I think this patch is similar to another one I submitted
https://lists.gnu.org/archive/html/qemu-devel/2017-12/msg02513.html in
a sense that there's no board in upstream codebase that needs this
feature and I am not yet upstreaming the code for the board that I use
it for. Given the situation, I think I'll put this patch on hold until
I have some other code to justify its inclusion.

Thanks,
Andrey Smrinov
