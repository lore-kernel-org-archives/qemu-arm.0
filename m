Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1687801lfm;
        Thu, 23 Apr 2020 02:42:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypJKbxHe10SiEH8BhZ35PisY8MnWJlF2bmCY+QoA9j3A0DSDHRoraPDxJWaC6dIi7OxjJeq0
X-Received: by 2002:a0c:b31b:: with SMTP id s27mr3277458qve.158.1587634937099;
        Thu, 23 Apr 2020 02:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587634937; cv=none;
        d=google.com; s=arc-20160816;
        b=E0GeqSHCu1nM+DDV8uBmoZ5xQ9of9ZQD+OrDPQKgIfdHuTnErHJnfmnFjAvnm2Ujlf
         J3pEETgdwIosOT++z+q0lvutCHWTF2j/Ny2AYT/HgTwLHGFs6VHYUGPCvDUEnUqt3nN2
         LSdr9fulK6ci7qhCL2lHFID0c4URustWdcZPt+QANUATaIojpduKRCA1SmCKj3ulPNgP
         UMsa2TSQepVrn76CNMCtOO+n9L5eSFFEYqyKdWhruI6pDKGf+RkOE7i2N2tNtZ649kFJ
         XQHEAoaluLUbkkbLC3vP+9YpZkNKe+iGl5S8DoaxI1hwpckvVvJ0dzPWucIWeQfGUcnT
         AGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=0xshtJGFmIVpnTFVR1yoPS4cLrAg5tMlLKvvDBmyaBo=;
        b=oZzrecbrjadr3ht5NLSy56/e77AuggSLlTTkKucFbQuc6/A1IINCeF7UmITCDI/u4g
         q+4m3rdN5SdnPWVlMM0V2lYr/bZfzaD4fvl5QB96p/rKCTzoMgz/XwuDOBQ9AYWppBCY
         XvCiDXUnjYz/W96i4fKDAfOLbvvAldluqEk1pcKfuokY4nboRO2IbWDSUUbaf/bwAxKR
         qa/Nt9ijSW9EdGb4E/XpiXT3L9+KFLCVu5/h+e9jc1uW+iWz6mAmQ03hY8rq/r8SWxIG
         AeUWq5zj4Ha+zUt29NOjN3rOXp7OhnYE0pq/W+GPTqJ8t3PvEtLZaQKV/N1tn6ZFQWJu
         bnhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p55si989620qtk.60.2020.04.23.02.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 02:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRYN6-00038O-DJ
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 05:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1jRYMa-0002VZ-65
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1jRYMZ-0001vL-Ey
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:41:43 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:43018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1jRYMY-0001ut-Vk; Thu, 23 Apr 2020 05:41:43 -0400
Received: by mail-ot1-f65.google.com with SMTP id g14so4941147otg.10;
 Thu, 23 Apr 2020 02:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0xshtJGFmIVpnTFVR1yoPS4cLrAg5tMlLKvvDBmyaBo=;
 b=F/6NkKUWHzfro7TRRrjXexMtA912l6kc60qelB2UW2Xka6XCN7JFM/RREZcJyKgobl
 F3JOSaeQ4brT3O0OV4KgMnBJikyTNZAgFgG4/j5n8pnu3BM+Gd526NBfF7AXYF46LbUS
 stFXZCq4+QfUwps3eeEJD819w7fQHS0SLoHVVWPVqjrDlsaoFIzEzF+U/uxrhVjvh3mY
 x39/Qla1IIRrt3WLFFtIGte/0CjezIuvtzA2OFZMELYIsOAGNO4BcLhhwoP6u+xpwLNZ
 /KHDd1Znr1VR5+Yy57cxG6h2FAyEClc2bkKVTDt0jxfaR6bIMn8JUmh6gZ3BawTEl3sI
 b2CA==
X-Gm-Message-State: AGi0PuaM2qqCxjObmQA+WmuCaFigVoLQAXAqu1Rit7mFsUTLXYiJZre9
 v1H9RzEgtU+DpvNXfOq2ea82CMDRSTJceJ2r7mg=
X-Received: by 2002:aca:d50f:: with SMTP id m15mr2367854oig.54.1587634901058; 
 Thu, 23 Apr 2020 02:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-4-geert+renesas@glider.be>
 <5dbfd026-3807-b122-ce60-1339a5252fca@amsat.org>
In-Reply-To: <5dbfd026-3807-b122-ce60-1339a5252fca@amsat.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2020 11:41:29 +0200
Message-ID: <CAMuHMdWf2RfGvSizXKonmAB84kPyAPwZ3mF1PayK_mdn=wwRkw@mail.gmail.com>
Subject: Re: [PATCH QEMU v2 3/5] Add a GPIO backend using libgpiod
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.65;
 envelope-from=geert.uytterhoeven@gmail.com; helo=mail-ot1-f65.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 05:41:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 209.85.210.65
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alexander Graf <graf@amazon.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Bartosz Golaszewski <bartekgola@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +WPg1tfTPgrN

Hi Philippe,

Thanks for your comments!

On Thu, Apr 23, 2020 at 11:28 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
> > Add a GPIO controller backend, to connect virtual GPIOs on the guest to
> > physical GPIOs on the host.  This allows the guest to control any
> > external device connected to the physical GPIOs.
> >
> > Features and limitations:
> >   - The backend uses libgpiod on Linux,
> >   - For now only GPIO outputs are supported,
> >   - The number of GPIO lines mapped is limited to the number of GPIO
> >     lines available on the virtual GPIO controller.
> >
> > Future work:
> >   - GPIO inputs,
> >   - GPIO line configuration,
> >   - Optimizations for controlling multiple GPIO lines at once,
> >   - ...
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/backends/gpiodev.c
> > @@ -0,0 +1,94 @@
> > +/*
> > + * QEMU GPIO Backend
> > + *
> > + * Copyright (C) 2018-2020 Glider bv
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include <errno.h>
>
> <errno.h> probably not needed.

It is indeed included by one of the other header files.
What is the QEMU policy w.r.t. that?

>
> > +#include <gpiod.h>
>
> Please move this one...
>
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/config-file.h"
> > +#include "qemu/cutils.h"

I forgot to remove the two above...

> > +#include "qemu/error-report.h"
> > +#include "qemu/module.h"
> > +#include "qemu/option.h"

... and the two above.

> > +#include "qapi/error.h"
> > +
> > +#include "sysemu/gpiodev.h"
> > +
> > +#include "hw/irq.h"
> > +#include "hw/qdev-core.h"
>
> ... here:
>
> #include <gpiod.h>

OK.

> > --- a/configure
> > +++ b/configure
> > @@ -509,6 +509,7 @@ libpmem=3D""
> >  default_devices=3D"yes"
> >  plugins=3D"no"
> >  fuzzing=3D"no"
> > +gpio=3D""
>
> Maybe name this feature 'libgpiod'?

Makes sense.

> >
> >  supported_cpu=3D"no"
> >  supported_os=3D"no"
> > @@ -1601,6 +1602,10 @@ for opt do
> >    ;;
> >    --gdb=3D*) gdb_bin=3D"$optarg"
> >    ;;
> > +  --disable-gpio) gpio=3D"no"
> > +  ;;
> > +  --enable-gpio) gpio=3D"yes"
>
> Ditto: --enable-libgpiod, because else it seems rather confusing.

OK.

> > --- /dev/null
> > +++ b/include/sysemu/gpiodev.h
> > @@ -0,0 +1,12 @@
> > +/*
> > + * QEMU GPIO Backend
> > + *
> > + * Copyright (C) 2018-2020 Glider bv
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/typedefs.h"
>
> "qemu/typedefs.h" not needed in includes.

While removing that works, it does mean the header file is no longer
self-contained:

include/sysemu/gpiodev.h:10:23: error: unknown type name =E2=80=98DeviceSta=
te=E2=80=99

> > +
> > +void qemu_gpiodev_add(DeviceState *dev, const char *name, unsigned int=
 maxgpio,
> > +                      Error **errp);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
