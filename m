Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp77570ejb;
        Wed, 8 Feb 2023 14:41:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/UUIjaCaVA8v1SJpySIniZU+QdhrQdvkegGHl2Q7jrCQUL8G29wOuRi0juA7a8sZFtKLw5
X-Received: by 2002:a05:6214:f03:b0:537:4ac0:71d3 with SMTP id gw3-20020a0562140f0300b005374ac071d3mr17324853qvb.2.1675896075393;
        Wed, 08 Feb 2023 14:41:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675896075; cv=none;
        d=google.com; s=arc-20160816;
        b=GXffBYJz9G6+cdFU4O/LxkIqDj+H6O+nIB233Ae2d0pJ04KtDUY+JcZtNHeaY3NR8v
         oART16dQT/L0j7awyrLYEhjZlsfubnz6V8dv5X+W/ToBNQf95L6pA5eZmsVgWzuQGRYN
         hts8FhqBjoHQuTP/g0koiPEOBA+JbuFpSKhKCCTlvY1zjYWSx6R2WMd7v568YUT1KL1n
         QJybtNcLoTfV/mol9msyN6ZQDbnr0a8iL3ch62h9B7u34IOZCXxguX5Y2OBJ+4PXB/1v
         1jJG9ok2S399TwJhLWTZcyElPwdz+/lzEjg1ask4cnlBmuZwlg3ZbqDirxlRUp1PIDRI
         HFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rwiCJGNY2IXUhORU+STtim963mfBcLZsgIonVMZRZqU=;
        b=OeQusBT4AgFEOX908z180aurD3rjcT+cyVqYJ8Z+xsZkXe0A4ox7CnRGxq/wKw3jVG
         Xhmi7PWrrIHuX/QBUWPHm38mwRUHeaoOPyvhxCppATam9mtD0QKnJ23SDOOptXhhCY2j
         sK9XLHfGqMS/AiQm1t8j8FOKiZ2Ga5lvxqB3TRSpiCV2hM/fPBn98JvxIunSgV8l6dKK
         i/USizPcDPtVi/RpUcGehtOvFy1cpEYUEp1SP/crIJJ57Xsf4r7IvQUvmEpAWnKMIro/
         PHPEdbkYdlnr1fIwkB3N6iHGv24cUipee1Do4crMUPPLduNAt9uDOBPRHP3HaktMAPBO
         bmxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=F7ZpktwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u21-20020a05620a0c5500b0071ab2f0da46si42648qki.636.2023.02.08.14.41.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Feb 2023 14:41:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=F7ZpktwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPt7Z-0004uc-Gf; Wed, 08 Feb 2023 17:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt7U-0004tb-Hn
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:40:52 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt7S-0001uG-9u
 for qemu-arm@nongnu.org; Wed, 08 Feb 2023 17:40:52 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso2635680wmp.3
 for <qemu-arm@nongnu.org>; Wed, 08 Feb 2023 14:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwiCJGNY2IXUhORU+STtim963mfBcLZsgIonVMZRZqU=;
 b=F7ZpktwEI0kZw9wBlHmGLy/En5SufXFErsw7x5tmqd4GMOgdZlWa8muoJ7l/NwIl/W
 bCri1/81lUz1MsQF42fLCfZe+vBHjpMnKCozr1AvY6nGLlxAdYRLUVMxM5do18U/qb1x
 kAJM+NsxN2TVQyK5DQqmMkrJAQaXVqlBv1SbRkohO7uBBmBtgGULRKgwS8n+TYmRuLWY
 MiSzWR+u2/vmMzcPcWpfypUO+kEsRKBQ/yBqsrzAnFDyWWdI5yUuc0DJy0hDH8mZiAMK
 smmt+2Nm9xQGsf0pxbbmF6UVOPghcOufVhhMEjYXVgDWA8wvQvcJk+XIQjqi687B23nC
 afvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rwiCJGNY2IXUhORU+STtim963mfBcLZsgIonVMZRZqU=;
 b=JZubpp166bBuMXwRd2dsTAaYQl4f4aOYmMrNN7LdgYrVrXyi2JIy8Nw7e1H/HqVQwH
 CKSMdcErQT//JFCxfLHOkZIfgejsvlk6MCx9f2REAR9vSLGLH+cf/F2jjkc1M5rKFvs+
 YfP3F6ZIemUhqoRhbytF3hYRNib/aREcvbIctow4JbvDU+RP2VHzSmS2KXEXUiKnP/WD
 weflYNM8Ia9uuDOo8md6LgmbwZG1FEiw/r+d/8Qa46TkgXItjfi1HiNHnAwAivOPNMa6
 JA2NxOEdkzonOdlqJoUo/tbtDW2eORtQUmRW21fLAFeiFT5wXlu0YjmYvXcLgvtGCPmw
 vkdA==
X-Gm-Message-State: AO0yUKVAW2BygHT1cC64hRjWV5qOxAfDmvLiTdPcFOGFzs32kNbPyiax
 JIGh4yUKSdvrRx+xHGMWxGf6Kb/cmxts2hE6TnnbwA==
X-Received: by 2002:a05:600c:4e4f:b0:3dc:53cf:13ee with SMTP id
 e15-20020a05600c4e4f00b003dc53cf13eemr285901wmq.180.1675896048784; Wed, 08
 Feb 2023 14:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20230206194936.168843-1-titusr@google.com>
 <20230206194936.168843-2-titusr@google.com>
 <3863220f-08b2-6cf2-20e7-eb67691d525b@linaro.org>
In-Reply-To: <3863220f-08b2-6cf2-20e7-eb67691d525b@linaro.org>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 8 Feb 2023 14:40:00 -0800
Message-ID: <CAMvPwGqsB3vMRhdMLiBJs51Xhy7izQ_wVUWu6UfL=8Q2UGHmLA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=titusr@google.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 9gxYwuYDWpcR

On Mon, 6 Feb 2023 at 13:38, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi Titus,
>
> On 6/2/23 20:49, Titus Rwantare wrote:
> > This is a simple i2c device that allows i2c capable devices to have
> > GPIOs.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Titus Rwantare <titusr@google.com>
> > ---
> >   hw/arm/Kconfig                  |   1 +
> >   hw/gpio/meson.build             |   1 +
> >   hw/gpio/pca_i2c_gpio.c          | 362 +++++++++++++++++++++++++++++++=
+
> >   hw/gpio/trace-events            |   5 +
> >   hw/i2c/Kconfig                  |   4 +
> >   include/hw/gpio/pca_i2c_gpio.h  |  72 +++++++
> >   tests/qtest/meson.build         |   1 +
> >   tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++++++
> >   8 files changed, 615 insertions(+)
> >   create mode 100644 hw/gpio/pca_i2c_gpio.c
> >   create mode 100644 include/hw/gpio/pca_i2c_gpio.h
> >   create mode 100644 tests/qtest/pca_i2c_gpio-test.c
>
>
> > +/* slave to master */
> > +static uint8_t pca6416_recv(I2CSlave *i2c)
> > +{
> > +    PCAGPIOState *ps =3D PCA_I2C_GPIO(i2c);
> > +    uint8_t data;

> > +    default:
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: reading from unsupported register 0x%02x",
>
> Some of your qemu_log_mask() calls miss the trailing newline.


Fixed.

>
>
> > +static int pca_i2c_event(I2CSlave *i2c, enum i2c_event event)
> > +{
> > +    PCAGPIOState *ps =3D PCA_I2C_GPIO(i2c);
> > +
> > +    switch (event) {
> > +    case I2C_START_RECV:
> > +        trace_pca_i2c_event(DEVICE(ps)->canonical_path, "START_RECV");
>
> Maybe add the canonical_path to trace_i2c_event() so this is useful
> for all I2C devices.

I've added a patch that does this.

>
>
> > +static void pca_i2c_realize(DeviceState *dev, Error **errp)
> > +{
> > +    PCAGPIOState *ps =3D PCA_I2C_GPIO(dev);
> > +    pca_i2c_update_irqs(ps);
>
> There is no reset() handler, is that on purpose?

No, I've added one.

>
> > +static void pca6416_gpio_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> > +    PCAGPIOClass *pc =3D PCA_I2C_GPIO_CLASS(klass);
> > +
> > +    dc->desc =3D "PCA6416 16-bit I/O expander";
>
> Why not set these 3 ...:
>
> > +    dc->realize =3D pca_i2c_realize;
> > +    dc->vmsd =3D &vmstate_pca_i2c_gpio;
> > +
> > +    k->event =3D pca_i2c_event;
>
> ... in a base abstract class pca_i2c_gpio_class_init()?
>

Right, the code evolved. This makes more sense to do now.


>
> > diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> > index 14886b35da..b59a79fddf 100644
> > --- a/hw/i2c/Kconfig
> > +++ b/hw/i2c/Kconfig
> > @@ -42,6 +42,10 @@ config PCA954X
> >       bool
> >       select I2C
> >
> > +config PCA_I2C_GPIO
> > +    bool
> > +    select I2C
>
> This should be 'depends on I2C'.
>
> Apparently various entries are incorrect in this file.
>
> Per docs/devel/kconfig.rst:
>
>    Devices *depend on* the bus that they lie on, for example a PCI
>    device would specify ``depends on PCI``.  An MMIO device will likely
>    have no ``depends on`` directive.  Devices also *select* the buses
>    that the device provides, for example a SCSI adapter would specify
>    ``select SCSI``.

I've moved the entry to hw/gpio and fixed it.

> > diff --git a/include/hw/gpio/pca_i2c_gpio.h b/include/hw/gpio/pca_i2c_g=
pio.h
> > new file mode 100644
> > index 0000000000..a10897c0e0
> > --- /dev/null
> > +++ b/include/hw/gpio/pca_i2c_gpio.h
> > @@ -0,0 +1,72 @@
> > +/*
> > + * NXP PCA6416A
> > + * Low-voltage translating 16-bit I2C/SMBus GPIO expander with interru=
pt output,
> > + * reset, and configuration registers
> > + *
> > + * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
> > + *
> > + * Note: Polarity inversion emulation not implemented
> > + *
> > + * Copyright 2021 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +#ifndef PCA_I2C_GPIO_H
> > +#define PCA_I2C_GPIO_H
> > +
> > +#include "hw/i2c/i2c.h"
> > +#include "qom/object.h"
> > +
> > +#define PCA6416_NUM_PINS         16
>
> ^ This is specific to TYPE_PCA6416_GPIO, and you set
> PCAGPIOClass::num_pins to it in pca6416_gpio_class_init(), ...
>
> > +
> > +typedef struct PCAGPIOClass {
> > +    I2CSlaveClass parent;
> > +
> > +    uint8_t num_pins;
> > +} PCAGPIOClass;
> > +
> > +typedef struct PCAGPIOState {
>
> ... but this defines the generic TYPE_PCA_I2C_GPIO ...
>
> > +    I2CSlave parent;
> > +
> > +    uint16_t polarity_inv;
> > +    uint16_t config;
> > +
> > +    /* the values of the gpio pins are mirrored in these integers */
> > +    uint16_t curr_input;
> > +    uint16_t curr_output;
> > +    uint16_t new_input;
> > +    uint16_t new_output;
> > +
> > +    /*
> > +     * Note that these outputs need to be consumed by some other input
> > +     * to be useful, qemu ignores writes to disconnected gpio pins
> > +     */
> > +    qemu_irq output[PCA6416_NUM_PINS];
>
> ... which is now clamped to 16 pins.
>
> Maybe define/use PCA_I2C_GPIO_MAX_PINS instead here, and assert
> PCAGPIOClass::num_pins <=3D PCA_I2C_GPIO_MAX_PINS in
> pca_i2c_gpio_class_init() or a realize?
>
> Actually we don't need PCA6416_NUM_PINS, PCA_I2C_GPIO_MAX_PINS is
> enough; and we can set 'pc->num_pins =3D 16' in pca6416_gpio_class_init()
> or use PCA6416_NUM_PINS but restrict its definition in pca_i2c_gpio.c.

I've redone class_init in v2.

> > +    /* i2c transaction info */
> > +    uint8_t command;
> > +    bool i2c_cmd;
> > +
> > +} PCAGPIOState;
> > +
> > +#define TYPE_PCA_I2C_GPIO "pca_i2c_gpio"
> > +OBJECT_DECLARE_TYPE(PCAGPIOState, PCAGPIOClass, PCA_I2C_GPIO)
> > +
> > +#define PCA6416_INPUT_PORT_0                 0x00 /* read */
> > +#define PCA6416_INPUT_PORT_1                 0x01 /* read */
> > +#define PCA6416_OUTPUT_PORT_0                0x02 /* read/write */
> > +#define PCA6416_OUTPUT_PORT_1                0x03 /* read/write */
> > +#define PCA6416_POLARITY_INVERSION_PORT_0    0x04 /* read/write */
> > +#define PCA6416_POLARITY_INVERSION_PORT_1    0x05 /* read/write */
> > +#define PCA6416_CONFIGURATION_PORT_0         0x06 /* read/write */
> > +#define PCA6416_CONFIGURATION_PORT_1         0x07 /* read/write */
> > +
> > +#define PCA6416_OUTPUT_DEFAULT               0xFFFF
> > +#define PCA6416_CONFIG_DEFAULT               0xFFFF
> > +
> > +#define PCA_I2C_OUTPUT_DEFAULT               0xFFFF
> > +#define PCA_I2C_CONFIG_DEFAULT               0xFFFF
>
> (These register definitions could be kept internal in pca_i2c_gpio.c).

I put these here to use them in the qtests.

> > +#define TYPE_PCA6416_GPIO "pca6416"
> > +
> > +#endif
>
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index e97616d327..49f406af6b 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -241,6 +241,7 @@ qos_test_ss.add(
> >     'ne2000-test.c',
> >     'tulip-test.c',
> >     'nvme-test.c',
> > +  'pca_i2c_gpio-test.c',
>
> Should this be conditional to
> config_all_devices.has_key('CONFIG_PCA_I2C_GPIO')?

Is that the guidance for qos tests? All these tests would also need to
be separated out.

> >     'pca9552-test.c',
> >     'pci-test.c',
> >     'pcnet-test.c',
>
> Mostly nitpicking, LGTM otherwise :)
>
> Regards,
>
> Phil.


Thanks for the review.

-Titus
