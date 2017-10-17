Received: by 10.223.197.9 with SMTP id q9csp4828714wrf;
        Tue, 17 Oct 2017 10:20:45 -0700 (PDT)
X-Received: by 10.237.58.225 with SMTP id o88mr11179506qte.190.1508260845300;
        Tue, 17 Oct 2017 10:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508260845; cv=none;
        d=google.com; s=arc-20160816;
        b=NKd9YzKhVJ44n+RJantV2ADlWEH3Esv4rVthn1UCA4KG1JFfWbw4NqddOOOgLXXLRK
         DQlS2Jdv2OGmGqMIBsyI20GPiB36S20Q1BRtrF6/54ZzHunIXZEB2lTvqAYWpgKEsDFL
         zEf/o+K+XpLwotMW+2LADA6IgDhWYozQmkE4FNyfGTZBt+8mk5M6YIYh9jBtuStxF1m7
         R/tJx2Dr6cRZ7UcaHSHX+0RWBRn/D5oKxQp1ixIhRXZjtPAwHnIxEyWJXnQoAbQkfVTY
         8iAT+/3ETZr0kjLQiyBZ1RHcl/y6umaic3skUWvFQ5ma2lnP/xDbIl2y1LiTjXx7joPp
         fUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=l9n5ReNBIN1nihOIm5ePScE6EFExQ+V/immvxV/vVXk=;
        b=LmdfKOQSGBdpt8j1BxZoGYP492G5E/d5Jo0MxUWjtmF3WOPHpRTzy9N7+u3SFjLGtz
         sAD8LJ/Etibnvfe4lwj3jDEgA+f4VtgdEzHmgBmbP94/ODtWJlk+kSiOyrkVrJe4G+2l
         HkKPEqGQ1MP9t7BJlvt9VYbOldtqRzQ/IqBo/lYfECpKJPLHjBMGJbzRG18JrYhjgait
         uvpDjX3vmH0tILzuNsJ0Jf571SjLiCaMNb4u4GMNGd3HVRUgTxQSI885CvftBG/JR1oq
         WjWDbEcQ7JTor+dJ8lbzcBCOf37WWaDOsFKfDtERcNORdgtI17Cb2yjujMxl0t/OI8Im
         VSzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j19e6iqg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u37si9070447qtj.55.2017.10.17.10.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 10:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j19e6iqg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4VXm-0004ut-Vd
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 13:20:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4VRe-0008Pm-Hw
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4VRd-0002kx-1Z
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:14:22 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:51494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4VRc-0002kC-OP
	for qemu-devel@nongnu.org; Tue, 17 Oct 2017 13:14:20 -0400
Received: by mail-wr0-x233.google.com with SMTP id j14so2448524wre.8
	for <qemu-devel@nongnu.org>; Tue, 17 Oct 2017 10:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=l9n5ReNBIN1nihOIm5ePScE6EFExQ+V/immvxV/vVXk=;
	b=j19e6iqgGxKf2mWseNNl0rPfozn9kDYDNYe4D5oe7BBw6ZHB8ZIZlRl+BkFIcgMIVZ
	4biEOm75b6gkT233waNT6+7+MTHV3cbKa2TxKIXVtMwtxC3+i3SwOVZXnTcBGEC1Fmd3
	K+TO9vHtwtnRvqyMn8YbL1kLLWKo2d+9mZppU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=l9n5ReNBIN1nihOIm5ePScE6EFExQ+V/immvxV/vVXk=;
	b=txkvr6XKkieW5hVOiAyZiWHhEJaNuNkU/ASigwfjaFcpzCGIr0Eg6QjNPPYQuj7ur2
	vF8IdQB1N/aDholYkcTtSas65VZYKzjjBPetjdFHqz2x0gHFb4kOPlgjdgg/JnTDw3uQ
	oyRwNsSdB7h43RS1UV4snN6ScpcCcwLyXdPmZNOgifmKkMiDqvd/1/aJNespedzBKVKl
	rUWissKPYr7BlXhPhE6jHNzcyKG0qqid1Xf+uIV5k73b+RLbMNLjon9QJNsNdKB9OTyx
	tULdw0pVgqtCUwyXcsI1rL5zMqatsszpmbbocG2gFWpGbnek+iLz6GPgaXfcyFiiSeai
	yF8Q==
X-Gm-Message-State: AMCzsaVgj0nOQhHX105jnmX7i3MVKJz4xpGD4HlDTYYJgWQEZ9S4SGbu
	R71aTQ4is+2rPBN3YZgfzyZQzOzXZBQf4MhqstZWHFku
X-Google-Smtp-Source: ABhQp+RQIQreWE9Ey3L9i8xs7Pseqo6ztiXL6LpHVyvZo+ACa0P+0LOfy2zRaNlU0nBlMF44i+oXIRGo9ksgYCgw2dE=
X-Received: by 10.223.147.166 with SMTP id 35mr4771224wrp.90.1508260459298;
	Tue, 17 Oct 2017 10:14:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 10:13:58 -0700 (PDT)
In-Reply-To: <20171013142852.916-6-clg@kaod.org>
References: <20171013142852.916-1-clg@kaod.org>
	<20171013142852.916-6-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 18:13:58 +0100
Message-ID: <CAFEAcA-Xwz1nrdkvMhK7+uJNpYssvC_juYF6mEviAo_T6ujF7Q@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: Re: [Qemu-devel] [PATCH v3 5/6] misc: add pca9552 LED blinker model
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /y2wn/hEtXZd

On 13 October 2017 at 15:28, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Specs are available here :
>
>   https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf
>
> This is a simple model supporting the basic registers for led and GPIO
> mode. The device also supports two blinking rates but not the model
> yet.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Changes since v2:
>
>  - removed comments on the I2C buffer size, but kept the array. I did
>    not want to rewrite the buffer handling
>
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/pca9552.c               | 212 ++++++++++++++++++++++++++++++++++=
++++++
>  include/hw/misc/pca9552.h       |  32 ++++++
>  4 files changed, 246 insertions(+)
>  create mode 100644 hw/misc/pca9552.c
>  create mode 100644 include/hw/misc/pca9552.h
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index 5059d134c816..d868d1095a6c 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -16,6 +16,7 @@ CONFIG_TSC2005=3Dy
>  CONFIG_LM832X=3Dy
>  CONFIG_TMP105=3Dy
>  CONFIG_TMP421=3Dy
> +CONFIG_PCA9552=3Dy
>  CONFIG_STELLARIS=3Dy
>  CONFIG_STELLARIS_INPUT=3Dy
>  CONFIG_STELLARIS_ENET=3Dy
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index e8f0a02f35af..e4e22880dbbc 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -7,6 +7,7 @@ common-obj-$(CONFIG_SGA) +=3D sga.o
>  common-obj-$(CONFIG_ISA_TESTDEV) +=3D pc-testdev.o
>  common-obj-$(CONFIG_PCI_TESTDEV) +=3D pci-testdev.o
>  common-obj-$(CONFIG_EDU) +=3D edu.o
> +common-obj-$(CONFIG_PCA9552) +=3D pca9552.o
>
>  common-obj-y +=3D unimp.o
>
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> new file mode 100644
> index 000000000000..22460f4c14fe
> --- /dev/null
> +++ b/hw/misc/pca9552.c
> @@ -0,0 +1,212 @@
> +/*
> + * PCA9552 I2C LED blinker
> + *
> + * Copyright (c) 2017, IBM Corporation.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later. See the COPYING file in the top-level directory.

Adding the url of the datasheet in the header comment
would also be useful.

> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/hw.h"
> +#include "hw/misc/pca9552.h"
> +
> +#define PCA9552_INPUT0   0 /* read only input register 0 */
> +#define PCA9552_INPUT1   1 /* read only input register 1  */
> +#define PCA9552_PSC0     2 /* read/write frequency prescaler 0 */
> +#define PCA9552_PWM0     3 /* read/write PWM register 0 */
> +#define PCA9552_PSC1     4 /* read/write frequency prescaler 1 */
> +#define PCA9552_PWM1     5 /* read/write PWM register 1 */
> +#define PCA9552_LS0      6 /* read/write LED0 to LED3 selector */
> +#define PCA9552_LS1      7 /* read/write LED4 to LED7 selector */
> +#define PCA9552_LS2      8 /* read/write LED8 to LED11 selector */
> +#define PCA9552_LS3      9 /* read/write LED12 to LED15 selector */
> +
> +#define PCA9552_LED_ON   0x0
> +#define PCA9552_LED_OFF  0x1
> +#define PCA9552_LED_PWM0 0x2
> +#define PCA9552_LED_PWM1 0x3
> +
> +static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
> +{
> +    uint8_t reg   =3D PCA9552_LS0 + (pin / 4);
> +    uint8_t shift =3D (pin % 4) << 1;
> +
> +    return (s->regs[reg] >> shift) & 0x3;

extract32() is probably more readable than handcoded
shift-and-mask.

> +}
> +
> +static void pca9552_update_pin_input(PCA9552State *s)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < 16; i++) {
> +        uint8_t input_reg =3D PCA9552_INPUT0 + (i / 8);
> +        uint8_t input_shift =3D (i % 8);
> +        uint8_t config =3D pca9552_pin_get_config(s, i);
> +
> +        switch (config) {
> +        case PCA9552_LED_ON:
> +            s->regs[input_reg] |=3D 1 << input_shift;
> +            break;
> +        case PCA9552_LED_OFF:
> +            s->regs[input_reg] &=3D ~(1 << input_shift);
> +            break;
> +        case PCA9552_LED_PWM0:
> +        case PCA9552_LED_PWM1:
> +            /* ??? */
> +        default:
> +            break;
> +        }
> +    }
> +}
> +
> +static void pca9552_read(PCA9552State *s)
> +{
> +    uint8_t reg =3D s->pointer & 0xf;
> +
> +    s->len =3D 0;
> +
> +    switch (reg) {
> +    case PCA9552_INPUT0:
> +    case PCA9552_INPUT1:
> +    case PCA9552_PSC0:
> +    case PCA9552_PWM0:
> +    case PCA9552_PSC1:
> +    case PCA9552_PWM1:
> +    case PCA9552_LS0:
> +    case PCA9552_LS1:
> +    case PCA9552_LS2:
> +    case PCA9552_LS3:
> +        s->buf[s->len++] =3D s->regs[reg];
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected read to register =
%d\n",
> +                      __func__, reg);
> +    }
> +}
> +
> +static void pca9552_write(PCA9552State *s)
> +{
> +    uint8_t reg =3D s->pointer & 0xf;
> +
> +    switch (reg) {
> +    case PCA9552_PSC0:
> +    case PCA9552_PWM0:
> +    case PCA9552_PSC1:
> +    case PCA9552_PWM1:
> +        s->regs[reg] =3D s->buf[0];
> +        break;
> +
> +    case PCA9552_LS0:
> +    case PCA9552_LS1:
> +    case PCA9552_LS2:
> +    case PCA9552_LS3:
> +        s->regs[reg] =3D s->buf[0];
> +        pca9552_update_pin_input(s);
> +        break;
> +
> +    case PCA9552_INPUT0:
> +    case PCA9552_INPUT1:
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: unexpected write to register=
 %d\n",
> +                      __func__, reg);
> +    }
> +}
> +
> +static int pca9552_recv(I2CSlave *i2c)
> +{
> +    PCA9552State *s =3D PCA9552(i2c);
> +
> +    if (s->len < sizeof(s->buf)) {
> +        return s->buf[s->len++];
> +    } else {
> +        return 0xff;
> +    }
> +}
> +
> +static int pca9552_send(I2CSlave *i2c, uint8_t data)
> +{
> +    PCA9552State *s =3D PCA9552(i2c);
> +
> +    if (s->len =3D=3D 0) {
> +        s->pointer =3D data;
> +        s->len++;
> +    } else {
> +        if (s->len <=3D sizeof(s->buf)) {
> +            s->buf[s->len - 1] =3D data;
> +        }
> +        s->len++;
> +        pca9552_write(s);
> +    }
> +
> +    return 0;
> +}
> +
> +static int pca9552_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    PCA9552State *s =3D PCA9552(i2c);
> +
> +    if (event =3D=3D I2C_START_RECV) {
> +        pca9552_read(s);
> +    }
> +
> +    s->len =3D 0;
> +    return 0;
> +}

Reading the data sheet, it doesn't look like this is
correctly implementing reads and writes of more than one byte.
If you look at figures 11, 12 and 13 the guest can:
 * read or write multiple registers at once with a
   single transaction with multiple bytes, using the
   autoincrement (AI) bit in the command byte
 * read or writes multiple bytes of data from a port
   configured for GPIO with a single transaction
   (in this case AI would be clear)

There's a clearer description in the application note:
https://www.nxp.com/docs/en/application-note/AN264.pdf
(on page 12).

I think to implement this you don't need buf[] at all
(and len is only there to distinguish "first byte" from
"not first byte").

Rather than calling pca9552_read() from pca9552_event()
you should call it from pca9552_recv(), which means that
it gets called for each byte requested and you don't
need to stuff the value into buf[] and then fish it
back out again.

Similarly, rather than pca9552_send() writing the data
into s->buf[] and then pca9552_write() fishing it out,
you can just pass it directly to pca9552_write().

In both cases you want to implement the "increment
pointer as required if AI bit is set" so multibyte
transfers step through the register set, rolling over
from 9 to 0.

I don't think the Linux driver bothers to use this, but it's
worth getting it right from the start because it affects how
we represent the device state and thus migration compat.

> +static const VMStateDescription pca9552_vmstate =3D {
> +    .name =3D "PCA9552",
> +    .version_id =3D 0,
> +    .minimum_version_id =3D 0,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT8(len, PCA9552State),
> +        VMSTATE_UINT8(pointer, PCA9552State),
> +        VMSTATE_UINT8_ARRAY(buf, PCA9552State, 1),
> +        VMSTATE_UINT8_ARRAY(regs, PCA9552State, PCA9552_NR_REGS),
> +        VMSTATE_I2C_SLAVE(i2c, PCA9552State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void pca9552_reset(DeviceState *dev)
> +{
> +    PCA9552State *s =3D PCA9552(dev);
> +
> +    s->regs[PCA9552_PSC0] =3D 0xFF;
> +    s->regs[PCA9552_PWM0] =3D 0x80;
> +    s->regs[PCA9552_PSC1] =3D 0xFF;
> +    s->regs[PCA9552_PWM1] =3D 0x80;
> +    s->regs[PCA9552_LS0] =3D 0x55; /* all OFF */
> +    s->regs[PCA9552_LS1] =3D 0x55;
> +    s->regs[PCA9552_LS2] =3D 0x55;
> +    s->regs[PCA9552_LS3] =3D 0x55;
> +
> +    pca9552_update_pin_input(s);

Don't we also need to reset the pointer and len fields?


thanks
-- PMM
