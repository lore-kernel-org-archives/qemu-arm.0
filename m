Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp258845lff;
        Thu, 12 Aug 2021 04:12:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1fAjGd3wAT8WwWnOxQcjopCAqbiPA0WUA4w/ceoHt1Z3sAQZiVav++GIsACKzTxkFIpoQ
X-Received: by 2002:a67:f550:: with SMTP id z16mr2106966vsn.23.1628766720198;
        Thu, 12 Aug 2021 04:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628766720; cv=none;
        d=google.com; s=arc-20160816;
        b=xgDREs/h2Q998q9nFTSR62KcP9SmA50LUAw08mcfKnTMAuODFc0hhdcGxtS+WamYH2
         suKuG3yEX3VVfz8++VCpctpbom44g13ZPPTT/gS6bJLyVMcdlB/So8xsP+zuHJAYdSDC
         OyZwEnWZbgLCZgs15Ug+sTGcVV45OTLuusSl3HtH/onTFB+rkO7atXKOd0Fjlg+JX/Xu
         oGy4X5Y0uoS+QhChbnLv4U8STTFpWI4oiyjeu6NFcXgSiOqsUOngWWX8+NrgdWW5+cQD
         0B5fwxKBm7FrRzyjt/BVz58kLRxIF3NwXHjf7byZqLhMsz47fD7eM1PkROyIQEoyodco
         Z4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BnMZ5/l7Xa/tJLNjzFQ5kQZ8kLnP3BLkYUUjoj+0CGc=;
        b=AMjtXNVb2fPFr5CdxNmFxM6poxcw1C5uBb5n21pfMUHQoRIhuSPJVKKjra8CH+U0i8
         V8z9I95Mw/Sb1950sS4Fqck1NEU3iWQnQ8le+KgvRNwTzQZzKMYFofKDE3M2QUZpDuff
         TatkqGdkMHsFCjbp0SnBozg0eV2vcnM+wk66MbvOYVrekwCS7oRy9vC8625uOkuwaZmu
         h33hIWfpVI4CPVIRSl0tIAqUHvaAVJTCqDXd4lPIkRbD9m7dVmxUh45MsEZ6CWQT2CSa
         aef3JsUPJ4xUddx6ZtwfGtX1+pPlFcR/CNixgioOjrurXv1topUuVhRZ9cjf/wWPVPw1
         Bp9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ps2ertKX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si709795vsr.65.2021.08.12.04.11.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 04:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ps2ertKX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE8cx-0007fj-GK
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 07:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE8ba-0006l9-JC
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 07:10:34 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE8bY-0006J4-RY
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 07:10:34 -0400
Received: by mail-ej1-x62c.google.com with SMTP id z20so10804667ejf.5
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnMZ5/l7Xa/tJLNjzFQ5kQZ8kLnP3BLkYUUjoj+0CGc=;
 b=ps2ertKXjz+RMOrkCBHhS6x4p+M8UHT6xvZfpm4VntieGrVuGZmGEEcGZXeMvtQzFV
 fH7eWdc/ZQZyNXkMzAsfUXp54Wczl8GJSq19b8JAGAzJ+wfYWvPNwKXyidJ9marEyikI
 VwgihyaGhlw7XMrDgtc76TUfnFJc3bfVU/OFmLT21gXgpknJOi8lJqoKaXdENBNcA9re
 3fxZ8iNIlCPEszcdcrZ8CZe9MsPB7c5r3AaPtg0UHQ32kgtpw0jJzsOZOI8aNXUm5Ipz
 hrpnlcmw77xWHYehckalRI8RPhVxl5mm/CXhKx+QG6BWQ39YaxLb1uZYtSinuLkppSmO
 XhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnMZ5/l7Xa/tJLNjzFQ5kQZ8kLnP3BLkYUUjoj+0CGc=;
 b=lmlRIBl8M13nT1CzwokvR2zTmcWlxq43qM3tVCd6dJ9TDVTFX4Sb9Rh4agep0nFAgC
 Uw6Cdp+7n3QPvoDUPXGFdmjm7aluMK6z2KEbx/s/BPItSzDCFt9GzTnkuMDJ2fjT+J9u
 q+03hwkA8ssJwNk966Ta0ffXN+dVjOEyd9LQJnIsFzsO/eerdXTGf9S4Zdhk/aSIWYAx
 jxFOGj5limQzsTHaFg5vm3pD03PRCmGwg40OQyPZLxlthmH2RXx02ICAycr+t3vW1ejH
 hnwA8exL8bSTNOGRa56XxCyR03Z8FIudjJxWGTzrRjr52xdVH+wfRfrvaS8dmsxIzpGm
 pSow==
X-Gm-Message-State: AOAM532k2W9Pxq09Or66Q/NTaFMwLK1+cXDNaZ9343SpHFi/oCHcgrXc
 I0dcXmzYzHjKqz2AJXTzWxZVsHwmZB5+V9+gepVyI6jWd4A=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3059428ejy.407.1628766630791; 
 Thu, 12 Aug 2021 04:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-2-peter.maydell@linaro.org>
 <d712c8dc-1976-c197-2ecb-75cf35ac1f29@crans.org>
In-Reply-To: <d712c8dc-1976-c197-2ecb-75cf35ac1f29@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 12:09:45 +0100
Message-ID: <CAFEAcA_QHYhFnNknzEe_jY=3tvQyYZg6ozG2f7270rg9yFrfFw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 01/25] arm: Move M-profile RAS register block into
 its own device
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XgDBN6mtZRe7

On Thu, 12 Aug 2021 at 12:08, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> > Currently we implement the RAS register block within the NVIC device.
> > It isn't really very tightly coupled with the NVIC proper, so instead
> > move it out into a sysbus device of its own and have the top level
> > ARMv7M container create it and map it into memory at the right
> > address.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   include/hw/arm/armv7m.h       |  2 +
> >   include/hw/intc/armv7m_nvic.h |  1 -
> >   include/hw/misc/armv7m_ras.h  | 37 ++++++++++++++
> >   hw/arm/armv7m.c               | 12 +++++
> >   hw/intc/armv7m_nvic.c         | 56 ---------------------
> >   hw/misc/armv7m_ras.c          | 93 +++++++++++++++++++++++++++++++++++
> >   MAINTAINERS                   |  2 +
> >   hw/misc/meson.build           |  2 +
> >   8 files changed, 148 insertions(+), 57 deletions(-)
> >   create mode 100644 include/hw/misc/armv7m_ras.h
> >   create mode 100644 hw/misc/armv7m_ras.c
> >
> > diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> > index bc6733c5184..4cae0d7eeaa 100644
> > --- a/include/hw/arm/armv7m.h
> > +++ b/include/hw/arm/armv7m.h
> > @@ -12,6 +12,7 @@
> >
> >   #include "hw/sysbus.h"
> >   #include "hw/intc/armv7m_nvic.h"
> > +#include "hw/misc/armv7m_ras.h"
> >   #include "target/arm/idau.h"
> >   #include "qom/object.h"
> >
> > @@ -58,6 +59,7 @@ struct ARMv7MState {
> >       NVICState nvic;
> >       BitBandState bitband[ARMV7M_NUM_BITBANDS];
> >       ARMCPU *cpu;
> > +    ARMv7MRAS ras;
> >
> >       /* MemoryRegion we pass to the CPU, with our devices layered on
> >        * top of the ones the board provides in board_memory.
> > diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
> > index 39c71e15936..33b6d8810c7 100644
> > --- a/include/hw/intc/armv7m_nvic.h
> > +++ b/include/hw/intc/armv7m_nvic.h
> > @@ -83,7 +83,6 @@ struct NVICState {
> >       MemoryRegion sysreg_ns_mem;
> >       MemoryRegion systickmem;
> >       MemoryRegion systick_ns_mem;
> > -    MemoryRegion ras_mem;
> >       MemoryRegion container;
> >       MemoryRegion defaultmem;
> >
> > diff --git a/include/hw/misc/armv7m_ras.h b/include/hw/misc/armv7m_ras.h
> > new file mode 100644
> > index 00000000000..f8773e65b14
> > --- /dev/null
> > +++ b/include/hw/misc/armv7m_ras.h
> > @@ -0,0 +1,37 @@
> > +/*
> > + * Arm M-profile RAS block
> > + *
> > + * Copyright (c) 2021 Linaro Limited
> > + *
> > + *  This program is free software; you can redistribute it and/or modify
> > + *  it under the terms of the GNU General Public License version 2 or
> > + *  (at your option) any later version.
> > + */
>
> Maybe it would be a good idea here to change to "Arm M-profile RAS
> (Reliability, Availability, and Serviceability) block" to define the
> acronym at least once in the device code?

Yeah, we could perhaps put a comment in there somewhere.
Though really you need to look in the spec to understand
what the block is doing, at which point you'll find out what
the register block is for.

> > +static void armv7m_ras_class_init(ObjectClass *klass, void *data)
> > +{
> > +    /* This device has no state: no need for vmstate or reset */
> > +}
> > +
> > +static const TypeInfo armv7m_ras_info = {
> > +    .name = TYPE_ARMV7M_RAS,
> > +    .parent = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(ARMv7MRAS),
> > +    .instance_init = armv7m_ras_init,
> > +    .class_init = armv7m_ras_class_init,
> > +};
>
> Pure curiosity: is `.class_init` defined because it needs to be defined
> or is it only a good practise in QEMU code to always define it?

It's optional, and in this case it's only there because it makes
a place to put the comment, I guess.

-- PMM
