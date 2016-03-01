Received: by 10.25.208.211 with SMTP id h202csp1785373lfg;
        Tue, 1 Mar 2016 11:03:35 -0800 (PST)
X-Received: by 10.140.93.65 with SMTP id c59mr28123632qge.101.1456859015660;
        Tue, 01 Mar 2016 11:03:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r71si32101755qha.48.2016.03.01.11.03.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 11:03:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:51796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aapa3-00026K-6C
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 14:03:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aapZq-0001oz-KY
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 14:03:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aapZp-0000FH-0e
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 14:03:22 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aapZo-0000FB-ID
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 14:03:20 -0500
Received: by mail-vk0-x235.google.com with SMTP id e6so177670012vkh.2
	for <qemu-arm@nongnu.org>; Tue, 01 Mar 2016 11:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VKtdE5xv0b0KxY7OnSFMatPmumjcbpdhkQes9FJJLYw=;
	b=BpK12FHAzsjSzjkKPtjsD7K7gRAQlgDsdmg7QKZf+PSzLiVE98+UhTblFuIsAi3c6h
	QLt8MNumbz6XL1ORP/IQkmPv7J8/zsU17MbBBf+o24twCoZRU6f4bkOJcJxhwvoFd8qa
	Nx2QXikchuLVV2v9i1ZdexG902kF49grw0i/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VKtdE5xv0b0KxY7OnSFMatPmumjcbpdhkQes9FJJLYw=;
	b=ZMjcy6OWiDZxrJktuYkfnv/PM+P8Z51rafaVzQoIeImhowH9zrSi/Vk4/5sKysLf/V
	sy4yPOJ/AIvN5G5cEkSTWqoJ44vt0bAkA95PqC6xu02YHROJXIZtStK4/3N5kwabqE/6
	Knc/OqiDK6ZqiEeqJiSU5U4ks8Ik3W0r7gbsiTHegZZyrXkDHpqnzaAHKhUMrs38BY8k
	G8FyOhoSmYcmXfo4P6n0WRGrqFo2R3oaLYIJbCcDQL5t1qdCbL8XFvVNzQ2MyFcfbc/v
	YcHZbA8uedRUefhao9bfvS405uy6dwlsZ/T8JDxm6gWhdbcdGWNg3n+UkgaxvZxOiU8/
	rZdQ==
X-Gm-Message-State: AD7BkJL2xG119v4QBAojEuAexEowxyxGiXPNR/dCdtYETEd5a4RHg2smWEeJFHu0uYjVKrcus8hBDh2Y5sYPnQlv
X-Received: by 10.31.180.85 with SMTP id d82mr14310792vkf.83.1456859000097;
	Tue, 01 Mar 2016 11:03:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 1 Mar 2016 11:03:00 -0800 (PST)
In-Reply-To: <1456532174-17432-3-git-send-email-Andrew.Baumann@microsoft.com>
References: <1456532174-17432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1456532174-17432-3-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2016 19:03:00 +0000
Message-ID: <CAFEAcA_BhNXfKfcCXZ0O6K=BbL2kOoprPddcYq2eHeujaaQ02A@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 2/4] bcm2835_aux: add emulation of BCM2835
	AUX (aka UART1) block
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4A9gW2bys/y6

On 27 February 2016 at 00:16, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:

This bit of the commit message is a good place to list the
"not yet implemented" parts of the device.

> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> +/*
> + * BCM2835 (Raspberry Pi / Pi 2) Aux block (mini UART and SPI).
> + * Copyright (c) 2015, Microsoft
> + * Written by Andrew Baumann
> + * Based on pl011.c, copyright terms below:
> + *
> + * Arm PrimeCell PL011 UART
> + *
> + * Copyright (c) 2006 CodeSourcery.
> + * Written by Paul Brook
> + *
> + * This code is licensed under the GPL.
> + */
>

I'm looking at the documentation at
https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2835/BCM2835-ARM-Peripherals.pdf
for my review...

You should say in a comment that only the UART parts are
currently implemented.

> +#include "qemu/osdep.h"
> +#include "hw/char/bcm2835_aux.h"
> +
> +#define AUX_ENABLES     0x4
> +#define AUX_MU_IO_REG   0x40
> +#define AUX_MU_IER_REG  0x44
> +#define AUX_MU_IIR_REG  0x48
> +#define AUX_MU_LSR_REG  0x54
> +#define AUX_MU_STAT_REG 0x64
> +
> +static void bcm2835_aux_update(BCM2835AuxState *s)
> +{
> +    bool status = (s->rx_int_enable && s->read_count != 0) || s->tx_int_enable;
> +    qemu_set_irq(s->irq, status);

Could use a comment somewhere to the effect that since we model the
tx fifo as instantly-draining the 'tx fifo register empty' interrupt
is always asserted.

> +}
> +
> +static uint64_t bcm2835_aux_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    BCM2835AuxState *s = opaque;
> +    uint32_t c, res;
> +
> +    switch (offset) {

No AUX_IRQ implementation? (You need the current interrupt
status anyway for one of the other register bits.)

> +    case AUX_ENABLES:
> +        return 1; /* mini UART enabled */
> +
> +    case AUX_MU_IO_REG:
> +        c = s->read_fifo[s->read_pos];

The datasheet says this is a byte UART but you've implemented
the read_fifo and c as 32-bit.

> +        if (s->read_count > 0) {
> +            s->read_count--;
> +            if (++s->read_pos == 8) {
> +                s->read_pos = 0;
> +            }
> +        }
> +        if (s->chr) {
> +            qemu_chr_accept_input(s->chr);
> +        }
> +        bcm2835_aux_update(s);

This doesn't implement the "if line control DLAB bit is set, then read/write
the LS 8 bits of the baudrate register" behaviour described in the datasheet.

> +        return c;
> +
> +    case AUX_MU_IER_REG:
> +        res = 0;
> +        if (s->rx_int_enable) {
> +            res |= 0x2;
> +        }
> +        if (s->tx_int_enable) {
> +            res |= 0x1;
> +        }

I suspect you'll find the code is clearer generally if you model this
register with a uint8_t ier in the state structure rather than two bools
(for instance "is interrupt asserted" is generally "enables | status".)

Doesn't implement "DLAB bit set means access MS 8 bits of the baudrate
register".

> +        return res;
> +
> +    case AUX_MU_IIR_REG:
> +        res = 0xc0;
> +        if (s->tx_int_enable) {
> +            res |= 0x1;
> +        } else if (s->rx_int_enable && s->read_count != 0) {
> +            res |= 0x2;
> +        }

This is kind of repeating the logic in bcm2835_aux_update(), would
be nice to factor it out.

The data sheet says that the bit allocation here is different:
bit 0 is zero when an interrupt is pending, and bits 1 and 2 are
the read and write information.

The data sheet also says that 0b11 for bits [2:1] is not possible, though
it doesn't say why. It's not clear what the hardware reads as if
the transmit holding register is empty *and* the receiver has a
valid byte...

> +        return res;
> +
> +    case AUX_MU_LSR_REG:
> +        res = 0x60; /* tx idle, empty */
> +        if (s->read_count != 0) {
> +            res |= 0x1;
> +        }
> +        return res;
> +
> +    case AUX_MU_STAT_REG:
> +        res = 0x302; /* space in the output buffer, empty tx fifo */

Shouldn't we set the "transmitter idle" bit too?

> +        if (s->read_count > 0) {
> +            res |= 0x1; /* data in input buffer */
> +            assert(s->read_count < 8);
> +            res |= ((uint32_t)s->read_count) << 16; /* rx fifo fill level */
> +        }
> +        return res;
> +

No AUX_MU_LCR_REG ? No AUX_MU_MCR_REG ? No AUX_MU_MSR_REG ?
AUX_MU_SCRATCH ? AUX_MU_CNTL_REG ? AUX_MU_BAUD ?

At least implementing them to log unimplemented would be nice.

> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +        return 0;
> +    }
> +}
> +
> +static void bcm2835_aux_write(void *opaque, hwaddr offset, uint64_t value,
> +                              unsigned size)
> +{
> +    BCM2835AuxState *s = opaque;
> +    unsigned char ch;
> +
> +    switch (offset) {
> +    case AUX_ENABLES:
> +        if (value != 1) {
> +            qemu_log_mask(LOG_UNIMP, "%s: unsupported attempt to enable SPI "
> +                          "or disable UART\n", __func__);
> +        }
> +        break;
> +
> +    case AUX_MU_IO_REG:
> +        ch = value;
> +        if (s->chr) {
> +            qemu_chr_fe_write(s->chr, &ch, 1);
> +        }
> +        break;
> +
> +    case AUX_MU_IER_REG:
> +        s->rx_int_enable = (value & 0x2) != 0;
> +        s->tx_int_enable = (value & 0x1) != 0;
> +        break;
> +
> +    case AUX_MU_IIR_REG:
> +        if (value & 0x1) {
> +            s->read_count = 0;
> +        }

Datasheet says bit 0 is read only, bit 1 clears the rx fifo.

> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
> +                      __func__, offset);
> +    }
> +
> +    bcm2835_aux_update(s);
> +}
> +
> +static int bcm2835_aux_can_receive(void *opaque)
> +{
> +    BCM2835AuxState *s = opaque;
> +
> +    return s->read_count < 8;
> +}
> +
> +static void bcm2835_aux_put_fifo(void *opaque, uint32_t value)
> +{
> +    BCM2835AuxState *s = opaque;
> +    int slot;
> +
> +    slot = s->read_pos + s->read_count;
> +    if (slot >= 8) {
> +        slot -= 8;
> +    }
> +    s->read_fifo[slot] = value;
> +    s->read_count++;
> +    if (s->read_count == 8) {
> +        /* buffer full */
> +    }
> +    bcm2835_aux_update(s);
> +}
> +
> +static void bcm2835_aux_receive(void *opaque, const uint8_t *buf, int size)
> +{
> +    bcm2835_aux_put_fifo(opaque, *buf);
> +}
> +
> +static void bcm2835_aux_event(void *opaque, int event)
> +{
> +    if (event == CHR_EVENT_BREAK) {
> +        bcm2835_aux_put_fifo(opaque, 0x400);
> +    }

Data sheet says the UART does not have break detection.

> +}
> +
> +static const MemoryRegionOps bcm2835_aux_ops = {
> +    .read = bcm2835_aux_read,
> +    .write = bcm2835_aux_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +};
> +
> +static const VMStateDescription vmstate_bcm2835_aux = {
> +    .name = TYPE_BCM2835_AUX,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(read_fifo, BCM2835AuxState, 8),
> +        VMSTATE_UINT8(read_pos, BCM2835AuxState),
> +        VMSTATE_UINT8(read_count, BCM2835AuxState),
> +        VMSTATE_BOOL(rx_int_enable, BCM2835AuxState),
> +        VMSTATE_BOOL(tx_int_enable, BCM2835AuxState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm2835_aux_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    BCM2835AuxState *s = BCM2835_AUX(obj);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_aux_ops, s,
> +                          TYPE_BCM2835_AUX, 0x100);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +}
> +
> +static void bcm2835_aux_realize(DeviceState *dev, Error **errp)
> +{
> +    BCM2835AuxState *s = BCM2835_AUX(dev);
> +    /* FIXME use a qdev chardev prop instead of qemu_char_get_next_serial() */

Good idea :-)  imx_serial.c has an example, you use
DEFINE_PROP_CHR and then wire it up in the board construction with
qdev_prop_set_chr(). (You probably want to create an alias property on
the SoC object as we now do for spi etc; see the xilinx soc for
an example.)

> +    s->chr = qemu_char_get_next_serial();

thanks
-- PMM
