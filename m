Received: by 10.223.159.82 with SMTP id f18csp769838wrg;
        Tue, 21 Nov 2017 06:48:51 -0800 (PST)
X-Google-Smtp-Source: AGs4zMa5U3IR0AMrrU4MxZihIFNsCPBboM6IG7o4tSPtQ84PBcmmWMq29kSTUWzizoEKkEpn7DC1
X-Received: by 10.37.78.130 with SMTP id c124mr9110260ybb.383.1511275731556;
        Tue, 21 Nov 2017 06:48:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511275731; cv=none;
        d=google.com; s=arc-20160816;
        b=EWnFF77aqfeCOEpaRC9vkZ+zLTtuJ5WU6YDxo/7Z/wsrGP2dDLrCL13EY7d+i3rDh/
         uH6crJF5wCrMFTcSGbqF/JXNu/UYnKsU/0b3oOSA8EVdi8LLO1asdtxL9Pk0douvYFCb
         L7evfndsrK9TV1A6ysL1W9zalNXUgj7MiDPE9Q7ZboXA4qKxmwlZIcfSxWUh9WSJwCHW
         2UPRNF/hFLIgyKFCtSrri+9kfvkucv8XFhLrx9DhSWAoryCZ3I4ZRut5pnz+ACStIN3T
         +k++qCtwKBEQ6jOQ8odJaKgHc82Z47YCAXD9op1ulNrZJwGf2ChNpffWT0lunPipAyPz
         Hyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=s/tITG8u9zFL65++G+3FxIlxD2SxE2LltyUA2lFD968=;
        b=RJS/uZTtK99QV/Pd+Gmg9/KiFeTFClvjbKwPQAkdwOviCGAQH1tRUpa2JbMi7wyzNB
         FjQRzF2zv93Og0/ThvfEDPC5/ZzaNTo0/sQE461UPm6q3YczVAEcVODoyqb5JUv4tRxI
         wW9ZS8ufNeS3u1xVLkNgVdHEHuSPWUVV0PX8Fhj1GwoJVYbVdUMbMSq4RuHFh61oTDRz
         MiuUDGHuO8ZWeHfzxbhYPST28ZFat8fa+xv0FFwDnGUGlzTtRnbXOjMF3yajJEXYhPx9
         c+deelSI9w4W6JmAqekY5NFVMQDwyQnJ6KJl5oAeSp+363hLOSM7MST+m6MOQvXolu8Q
         drVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f77XdG5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3si2916458ywl.369.2017.11.21.06.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 06:48:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f77XdG5D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eH9r1-0002WO-0Z
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 09:48:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eH9Ja-0005uO-1i
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 09:14:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eH9JU-0004hg-Ls
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 09:14:18 -0500
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:34792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eH9JU-0004hF-ES
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 09:14:12 -0500
Received: by mail-ot0-x22b.google.com with SMTP id o23so10634724otd.1
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 06:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s/tITG8u9zFL65++G+3FxIlxD2SxE2LltyUA2lFD968=;
	b=f77XdG5DVzXX1MxdXQHxWBsVCOSBUZH9DD2ywTynHa/ZcIgMrBUJumSzzB5UJCEhJK
	WB8IFHjzF+bYppXCxMA70v8tFa2fl9luvZQkZIXFWYunOQD/Fokofx9sm18kPL6obJqZ
	PIbBuhzQQF2OLgWdQ6bcr51Yf6p27rKlZ8Pss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s/tITG8u9zFL65++G+3FxIlxD2SxE2LltyUA2lFD968=;
	b=h5fCk0SD0jQRrYjte59fuGkPBvwMEOylgPdxsvweDiJ6FKfWaVSf4aM90rTwPiYP1T
	A2FZyFm4BFTW3lvMX3N0cUOW22vrtjzail7ePHB/+ot3lDEGdL13e1cgKBP7B5HxxRMz
	dRzr1wC6uiBWmb0KhyJgHgk8A+3Q4e+0Q/K4e488FaWEDnYOwXszAOQbcHETbsaEm228
	1UY13ETdcU8zsogHqOvFVAzDBqm8254gh3YnhJgcEk6puCPCYzZ4lc5xuFLXKUPzjt61
	/FJZFErV+DIWzeOimdCapJWLqkOJp1lBprzhOLCK+3q8VcxChkSZb2Vtldn5WLKA44ga
	MHXA==
X-Gm-Message-State: AJaThX50kpz3R1UHvcjOKRKaxD8OpphbnWdyyt6QgmgMZZBhS52GSZbT
	6F0uFudJniAtZgAAkErfsQMZqY7lBsCY59dfQL3CYw==
X-Received: by 10.157.37.61 with SMTP id k58mr10975206otb.110.1511273651525;
	Tue, 21 Nov 2017 06:14:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 06:13:50 -0800 (PST)
In-Reply-To: <1509107055-21978-2-git-send-email-costa@advantech.ca>
References: <1509107055-21978-1-git-send-email-costa@advantech.ca>
	<1509107055-21978-2-git-send-email-costa@advantech.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 14:13:50 +0000
Message-ID: <CAFEAcA_Tyu4mUvUQEuYq8CU03g=7HwaOStG_caXj+YCUY1ACuQ@mail.gmail.com>
To: Gabriel Costa <gabriel291075@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 1/5] arm: kinetis_k64_uart
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Mksw7EIAuFb

On 27 October 2017 at 13:24, Gabriel Costa <gabriel291075@gmail.com> wrote:

First, an apology for not having got back to this series sooner;
I've been busy with work for the upcoming 2.11 release.

> This Patch include kinetis_k64_uart.c/.h and Makefile.objs
> uart means Universal Asynchronous Receiver/Transmitter (UART)

You don't really need to say either of these things --
the git log --stat info tells people what files the patch
touches, and UART is a very common abbreviation.

"This patch implements the UART found in the Kinetis
K64 SoC family." or something similar will do.

> More information about this peripheral can be found at:
> pag 1529, K64P144M120SF5RM.pdf.

Is there a standard URL for this datasheet? (Google suggests
http://cache.freescale.com/files/microcontrollers/doc/ref_manual/K64P144M120SF5RM.pdf
perhaps?)

If so then you can quote that URL in the header comment at the top of
the file, so that future readers know where to get the datasheet.

My overall impression of this device model is that there's
an awful lot of unimplemented behaviour here. The code as
it stands is doing nothing except very basic send/receive
of characters when the guest uses the data register. The datasheet
says this device has FIFOs, interrupts and so on, but the
model is implementing none of that. We don't expect complete
emulation of all the obscure parts of the device, but I think
that FIFO and interrupt handling at least is pretty fundamental.
Logging (via qemu_log_mask(LOG_UNIMP, ...)) when the guest tries
to do something the model doesn't implement yet would also be
nice.

> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
> ---
>  hw/char/Makefile.objs              |   1 +
>  hw/char/kinetis_k64_uart.c         | 343 +++++++++++++++++++++++++++++++++++++
>  include/hw/char/kinetis_k64_uart.h |  79 +++++++++
>  3 files changed, 423 insertions(+)
>  create mode 100644 hw/char/kinetis_k64_uart.c
>  create mode 100644 include/hw/char/kinetis_k64_uart.h
>
> diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
> index 1bcd37e..75b194c 100644
> --- a/hw/char/Makefile.objs
> +++ b/hw/char/Makefile.objs
> @@ -31,3 +31,4 @@ common-obj-$(CONFIG_SCLPCONSOLE) += sclpconsole.o sclpconsole-lm.o
>
>  obj-$(CONFIG_VIRTIO) += virtio-serial-bus.o
>  obj-$(CONFIG_TERMINAL3270) += terminal3270.o
> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_uart.o
> diff --git a/hw/char/kinetis_k64_uart.c b/hw/char/kinetis_k64_uart.c
> new file mode 100644
> index 0000000..0eb3dea
> --- /dev/null
> +++ b/hw/char/kinetis_k64_uart.c
> @@ -0,0 +1,343 @@
> +/*
> + * Kinetis K64 peripheral microcontroller emulation.
> + *
> + * Copyright (c) 2017 Advantech Wireless
> + * Written by Gabriel Costa <gabriel291075@gmail.com>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "qemu/log.h"
> +#include "hw/char/kinetis_k64_uart.h"
> +
> +static const VMStateDescription vmstate_kinetis_k64_uart = {
> +    .name = TYPE_KINETIS_K64_UART,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(BDH, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(BDL, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(C1, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(C2, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(S1, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(S2, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(C3, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(D, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(MA1, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(MA2, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(C4, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(C5, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(ED, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(MODEM, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(IR, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(PFIFO, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(CFIFO, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(SFIFO, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(TWFIFO, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(TCFIFO, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(RWFIFO, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(RCFIFO, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(C7816, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(IE7816, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(IS7816, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(WP7816Tx, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(WN7816, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(WF7816, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(ET7816, kinetis_k64_uart_state),
> +        VMSTATE_UINT8(TL7816, kinetis_k64_uart_state),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void kinetis_k64_uart_reset(DeviceState *dev)
> +{
> +    kinetis_k64_uart_state *s = KINETIS_K64_UART(dev);
> +
> +    s->BDH = 0x00;
> +    s->BDL = 0x04;
> +    s->C1 = 0x00;
> +    s->C2 = 0x00;
> +    s->S1 = 0xC0;
> +    s->S2 = 0x00;
> +    s->C3 = 0x00;
> +    s->D = 0x00;
> +    s->MA1 = 0x00;
> +    s->MA2 = 0x00;
> +    s->C4 = 0x00;
> +    s->C5 = 0x00;
> +    s->ED = 0x00;
> +    s->MODEM = 0x00;
> +    s->IR = 0x00;
> +    s->PFIFO = 0x00;
> +    s->CFIFO = 0x00;
> +    s->SFIFO = 0xC0;
> +    s->TWFIFO = 0x00;
> +    s->TCFIFO = 0x00;
> +    s->RWFIFO = 0x01;
> +    s->RCFIFO = 0x00;
> +    s->C7816 = 0x00;
> +    s->IE7816 = 0x00;
> +    s->IS7816 = 0x00;
> +    s->WP7816Tx = 0x0A;
> +    s->WN7816 = 0x00;
> +    s->WF7816 = 0x01;
> +    s->ET7816 = 0x00;
> +    s->TL7816 = 0x00;
> +
> +    qemu_set_irq(s->irq, 0);
> +}
> +
> +static void kinetis_k64_uart_write(void *opaque, hwaddr offset, uint64_t value,
> +        unsigned size)
> +{
> +    kinetis_k64_uart_state *s = (kinetis_k64_uart_state *)opaque;
> +
> +    value &= 0xFF;
> +
> +    switch (offset) {
> +    case 0x00:
> +        s->BDH = value;
> +        break;
> +    case 0x01:
> +        s->BDL = value;
> +        break;
> +    case 0x02:
> +        s->C1 = value;
> +        break;
> +    case 0x03:
> +        s->C2 = value;
> +        break;
> +    case 0x05:
> +        s->S2 = value;
> +        break;
> +    case 0x06:
> +        s->C3 = value;
> +        break;
> +    case 0x07:
> +        s->D = value;
> +        qemu_chr_fe_write_all(&s->chr, &s->D, 1);

This is a blocking call. Most of our existing UART models are
still written this way, but it's a bit unfortunate as it means that
you can block the whole simulation if the thing on the other end
isn't accepting data.

The modern way to deal with this is to use qemu_chr_fe_write(),
which writes as many characters as it can without blocking,
and then if there's still pending data you can use
qemu_chr_fe_add_watch() to arrange to be called back when
you can try again. (This means you need to implement the
guest-facing FIFO and the status/interrupt bits for "FIFO is
full".) hw/char/cadence_uart.c (which has a FIFO) and
hw/char/cmsdk-apb-uart.c (which does not) are good examples
to look at.

> +        break;
> +    case 0x08:
> +        s->MA1 = value;
> +        break;
> +    case 0x09:
> +        s->MA2 = value;
> +        break;
> +    case 0x0A:
> +        s->C4 = value;
> +        break;
> +    case 0x0B:
> +        s->C5 = value;
> +        break;
> +    case 0x0D:
> +        s->MODEM = value;
> +        break;
> +    case 0x0E:
> +        s->IR = value;
> +        break;
> +    case 0x10:
> +        s->PFIFO = value;
> +        break;
> +    case 0x11:
> +        s->CFIFO = value;
> +        break;
> +    case 0x12:
> +        s->SFIFO = value;
> +        break;
> +    case 0x13:
> +        s->TWFIFO = value;
> +        break;
> +    case 0x15:
> +        s->RWFIFO = value;
> +        break;
> +    case 0x18:
> +        s->C7816 = value;
> +        break;
> +    case 0x19:
> +        s->IE7816 = value;
> +        break;
> +    case 0x1A:
> +        s->IS7816 = value;
> +        break;
> +    case 0x1B:
> +        s->WP7816Tx = value;
> +        break;
> +    case 0x1C:
> +        s->WN7816 = value;
> +        break;
> +    case 0x1D:
> +        s->WF7816 = value;
> +        break;
> +    case 0x1E:
> +        s->ET7816 = value;
> +        break;
> +    case 0x1F:
> +        s->TL7816 = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "kinetis_k64_uart: write at bad offset %"HWADDR_PRIx"\n", offset);
> +    }
> +}
> +
> +static uint64_t kinetis_k64_uart_read(void *opaque, hwaddr offset,
> +        unsigned size)
> +{
> +    kinetis_k64_uart_state *s = (kinetis_k64_uart_state *)opaque;
> +
> +    switch (offset) {
> +    case 0x00:
> +        return s->BDH;
> +    case 0x01:
> +        return s->BDL;
> +    case 0x02:
> +        return s->C1;
> +    case 0x03:
> +        return s->C2;
> +    case 0x04:
> +        return s->S1;
> +    case 0x05:
> +        return s->S2;
> +    case 0x06:
> +        return s->C3;
> +    case 0x07:
> +        s->RCFIFO = 0;
> +        qemu_chr_fe_accept_input(&s->chr);
> +        return s->D;
> +    case 0x08:
> +        return s->MA1;
> +    case 0x09:
> +        return s->MA2;
> +    case 0x0A:
> +        return s->C4;
> +    case 0x0B:
> +        return s->C5;
> +    case 0x0C:
> +        return s->ED;
> +    case 0x0D:
> +        return s->MODEM;
> +    case 0x0E:
> +        return s->IR;
> +    case 0x10:
> +        return s->PFIFO;
> +    case 0x11:
> +        return s->CFIFO;
> +    case 0x12:
> +        return s->SFIFO;
> +    case 0x13:
> +        return s->TWFIFO;
> +    case 0x14:
> +        return s->TCFIFO;
> +    case 0x15:
> +        return s->RWFIFO;
> +    case 0x16:
> +        return s->RCFIFO;
> +    case 0x18:
> +        return s->C7816;
> +    case 0x19:
> +        return s->IE7816;
> +    case 0x1A:
> +        return s->IS7816;
> +    case 0x1B:
> +        return s->WP7816Tx;
> +    case 0x1C:
> +        return s->WN7816;
> +    case 0x1D:
> +        return s->WF7816;
> +    case 0x1E:
> +        return s->ET7816;
> +    case 0x1F:
> +        return s->TL7816;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +            "kinetis_k64_uart: read at bad offset %"HWADDR_PRIx"\n", offset);
> +        return 0;
> +    }
> +}
> +
> +static const MemoryRegionOps kinetis_k64_uart_ops = {
> +    .read = kinetis_k64_uart_read,
> +    .write = kinetis_k64_uart_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +};
> +
> +static int kinetis_k64_uart_can_receive(void *opaque)
> +{
> +    kinetis_k64_uart_state *s = (kinetis_k64_uart_state *)opaque;
> +
> +    if (s->RCFIFO == 0) {
> +        return 1; /*Can read a byte*/
> +    } else {
> +        return 0; /*Cannot read a byte*/
> +    }

The comments aren't really necessary in my view, but if you
want to keep them, style says there should be spaces after /*
and before */.

> +}
> +
> +static void kinetis_k64_uart_receive(void *opaque, const uint8_t *buf, int size)
> +{
> +    kinetis_k64_uart_state *s = (kinetis_k64_uart_state *)opaque;
> +
> +    if (size > 0) {
> +        if (buf != NULL) {

You don't need to check these -- you can assume your caller
passes a non-NULL buffer and a positive size.

> +            s->D = buf[0];
> +            s->RCFIFO = 1;
> +        }
> +    }
> +}
> +
> +static void kinetis_k64_uart_realize(DeviceState *dev, Error **errp)
> +{
> +    kinetis_k64_uart_state *s = KINETIS_K64_UART(dev);
> +
> +    qemu_chr_fe_set_handlers(&s->chr, kinetis_k64_uart_can_receive,
> +                             kinetis_k64_uart_receive, NULL, NULL,
> +                             s, NULL, true);
> +}
> +
> +static Property kinetis_k64_uart_properties[] = {
> +    DEFINE_PROP_CHR("chardev", kinetis_k64_uart_state, chr),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void kinetis_k64_uart_init(Object *obj)
> +{
> +    kinetis_k64_uart_state *s = KINETIS_K64_UART(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &kinetis_k64_uart_ops, s,
> +            TYPE_KINETIS_K64_UART, 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);

You create a single outbound IRQ line here, but the data sheet says
that each UART has two: one for status sources, and one for error sources.

thanks
-- PMM
