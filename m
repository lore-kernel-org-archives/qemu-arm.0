Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4074278wrm;
        Mon, 7 Oct 2019 10:24:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVtL7J92Vj5qX/yv8ylduyPyzIhmfCPOmdoqTE5QgUg6yQWWIrBYnoDaLyoZU/BiSnPT2t
X-Received: by 2002:a17:906:c742:: with SMTP id fk2mr25477920ejb.44.1570469059145;
        Mon, 07 Oct 2019 10:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570469059; cv=none;
        d=google.com; s=arc-20160816;
        b=DztdB59zYxfMym7qi7kTUg/rIUBvGDcFqV43kWexaTfUT3rj4C0qu0FmP44tNyadzQ
         hqo64XnE53l60qbR78K/J7FDHxdSPO/NZmpMmE5XfG9rN1tnOUAF6jpORGz9fmKqMtwP
         Xwmdg6DdRQzkcMQ9QGDuWVe9AiL01OZqlacf3d2P4QE9PUY6dusHymAbA/IFimlWjWWz
         LlXQGImorXh7NcBFUtG9byP+70y5j22F7sYVSbbRFkJDwN73RykMjRG5/WZ+o4bia4rC
         DAbVmZrA/SjgtCX7xGbq/5xfv/uie1hKsebWK+Uf7lLijo6V4G1B0Gs7HcxwOvBfvpU3
         AHbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=esktorrmETKGJQnLtRmNYkpV0I20/H1qzqkxgYkgLj8=;
        b=KOVYnOWZAjGHtRugGhMslN8Ccw60mCtGL4ZI+OavNs3bcSmoad2W6izbecrR8RcZa1
         nalgrvGZkfECnNWKNqOivAzB+QnyBsRVvcGgsxhle6jJ9pnCEj/CfrRsMxbxL7RIJSM6
         d/+CrY6gLUbohb19E/xD+ADwmTZtKU+CNIlXOIjO8Gy2PZvPdgd6i82MkZWj081wo5sV
         +Gx672yv5k2XDLIrlT+0IqTW+7gJdy9FJlkzYGGJ511Y0j5Jd5EV7Cm3u++VrXi7PWJc
         CWUHzdjOl10qfffwyfPfuRHedt6mfey+elPfpy1Tk0mU0UGKuDDxH1ZydcfsIfxQY2Kx
         RwIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si9136386edb.394.2019.10.07.10.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2019 10:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHWk6-0005kk-1J
	for alex.bennee@linaro.org; Mon, 07 Oct 2019 13:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1iHWju-0005gY-SI
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:24:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1iHWjs-00039W-Ey
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:24:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1iHWjs-00037K-6A
 for qemu-arm@nongnu.org; Mon, 07 Oct 2019 13:24:04 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EFF2B2D6A0D
 for <qemu-arm@nongnu.org>; Mon,  7 Oct 2019 17:24:01 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id 190so118609wme.4
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2019 10:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=esktorrmETKGJQnLtRmNYkpV0I20/H1qzqkxgYkgLj8=;
 b=KtRPi2NIb4j4KmWZkUvF+ptzBytf9g7pUL3pV3E/7hF0btv/Z3PPJLv2gYUVXAq7aL
 T1YvoZHhE69Gq0uYSwiOAmtqUi6krwqJERkl83yti+MA7X4Teaq6Y+WGjvpxSmw0bfgN
 2NFxUu2nBV0qnvvmS+M8cswKnw9VD7XPgGjjE7h43s69eRkAefYKZVeA3A7IR4ShOlfr
 ZXOcq6+EmmEtbT221AYDNU4hn7O3dJkOatzzzxEF3wtVH1vfnXYaUu8SDDBjvFaZPXwa
 zsMcshok1dkQzCDDsPtLkt/SK0w9S781VTfqxgDwyFRmVHnNSq1xOTLTKx8ElClt+Pfd
 0/tA==
X-Gm-Message-State: APjAAAUMUOyL9dSxoU8WpVtigkeiG2wNjq28UIkUCh4A45JYJUS6TVds
 B4Yv/OBPKnV9di43uuY/xFUCzJ2RG6UtnY3ke/R3Mg4XISK+lCE7+yOYihiO32FUXfU1Qh8hKx0
 XIFFFLcv9FvDB/ANojFCwV/NgHmE7
X-Received: by 2002:a5d:440d:: with SMTP id z13mr5957059wrq.176.1570469040630; 
 Mon, 07 Oct 2019 10:24:00 -0700 (PDT)
X-Received: by 2002:a5d:440d:: with SMTP id z13mr5957033wrq.176.1570469040384; 
 Mon, 07 Oct 2019 10:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-13-f4bug@amsat.org>
 <9a814d3e-0ae0-08a4-9d43-1d157712029f@redhat.com>
In-Reply-To: <9a814d3e-0ae0-08a4-9d43-1d157712029f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Mon, 7 Oct 2019 19:23:49 +0200
Message-ID: <CAP+75-XdU6ZhE+Yivg=VT8EmtRPHmV7J5owifYCh-jut1rioNA@mail.gmail.com>
Subject: Re: [PATCH 12/19] hw/arm/bcm2835_peripherals: Add Clock/Power/Reset
 Manager blocks
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>, Pekka Enberg <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cCXmZOcJofhb

On Tue, Oct 1, 2019 at 11:51 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 9/26/19 7:34 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Add basic support for BCM283x CPRMAN. Provide support for reading and
> > writing CPRMAN registers and initialize registers with sensible default
> > values. During runtime retain any written values.
> >
> > Basic CPRMAN support is necessary and sufficient to boot Linux on raspi=
2
> > and raspi3 systems.
> >
> > Based on:
> > https://github.com/raspberrypi/linux/blob/rpi-5.3.y/drivers/clk/bcm/clk=
-bcm2835.c
> > https://github.com/u-boot/u-boot/blob/v2019.07/include/dt-bindings/cloc=
k/bcm2835.h
> > https://github.com/arisena-com/rpi_src/blob/master/apps/i2s_test/src/i2=
s_test.c#L273
> >
> > Co-developed-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >   hw/arm/bcm2835_peripherals.c         |  20 +-
> >   hw/misc/Makefile.objs                |   1 +
> >   hw/misc/bcm2835_cprman.c             | 383 ++++++++++++++++++++++++++=
+
> >   hw/misc/trace-events                 |   8 +
> >   include/hw/arm/bcm2835_peripherals.h |   4 +-
> >   include/hw/misc/bcm2835_cprman.h     |  32 +++
> >   6 files changed, 444 insertions(+), 4 deletions(-)
> >   create mode 100644 hw/misc/bcm2835_cprman.c
> >   create mode 100644 include/hw/misc/bcm2835_cprman.h
> >
> > diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
> > new file mode 100644
> > index 0000000000..6c3b5b6837
> > --- /dev/null
> > +++ b/hw/misc/bcm2835_cprman.c
> > @@ -0,0 +1,383 @@
> > +/*
> > + * BCM2835 Clock/Power/Reset Manager subsystem (poor man's version)
> > + *
> > + * Copyright (C) 2018 Guenter Roeck <linux@roeck-us.net>
> > + * Copyright (C) 2018 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "sysemu/runstate.h"
> > +#include "hw/registerfields.h"
> > +#include "hw/misc/bcm2835_cprman.h"
> > +#include "trace.h"
> > +
> > +#define CPRMAN_PASSWD 'Z'
> > +
> > +FIELD(CPRMAN, PASSWD,   24, 8)
> > +
[...]
> > +REG32(A2W_PLL_CTRL, 0x00)
> > +FIELD(A2W_PLL_CTRL, NDIV,                   0, 12)
> > +FIELD(A2W_PLL_CTRL, PDIV,                   12, 3)
> > +FIELD(A2W_PLL_CTRL, POWER_DOWN,             16, 1)
> > +FIELD(A2W_PLL_CTRL, POWER_RESET_DISABLE,    17, 1)
> > +
> > +REG32(A2W_PLL_ANA0, 0x10)
> > +
> > +FIELD(A2W_PLL_FRAC, DIV,                    0, 20)
> > +
> > +FIELD(A2W_PLL_CHAN, DIV,                    0, 8)
> > +FIELD(A2W_PLL_CHAN, DISABLE,                8, 1)
> > +
> > +static const char *a2w_name(hwaddr addr)
> > +{
> > +    if (addr >=3D 0x300) {
> > +        return "CHANx";
> > +    }
> > +    if (addr >=3D 0x200) {
> > +        return "FRACx";
> > +    }
> > +    switch (addr & 0x1f) {
> > +    case A_A2W_PLL_CTRL:
> > +        return "CTRL";
> > +    case A_A2W_PLL_ANA0:
> > +        return "ANA0";
> > +    default:
> > +        return "UNKN";
> > +    }
> > +}
> > +
> > +static const char *pll_name(int idx)
> > +{
> > +    static const char *pll_names[8] =3D {
> > +        [0] =3D "PLLA",
> > +        [1] =3D "PLLC",
> > +        [2] =3D "PLLD",
> > +        [3] =3D "PLLH",
> > +        [7] =3D "PLLB",
> > +    };
> > +    return pll_names[idx] ? pll_names[idx] : "UNKN";
> > +}
> > +
> > +static uint64_t bcm2835_cprman_a2w_read(void *opaque, hwaddr addr,
> > +                                        unsigned size)
> > +{
> > +    uint32_t res =3D 0;
> > +
> > +    if (addr < 0x200) {
> > +        /* Power */
> > +        switch (addr & 0x1f) {
> > +        case A_A2W_PLL_CTRL:
> > +            res =3D R_A2W_PLL_CTRL_POWER_DOWN_MASK; /* On */

This should be R_A2W_PLL_CTRL_POWER_RESET_DISABLE_MASK.

> > +            break;
> > +        case A_A2W_PLL_ANA0:
> > +            break;
> > +        }
> > +    } else {
> > +        /* addr < 0x300 is FREQ, else CHANNEL */
> > +        qemu_log_mask(LOG_UNIMP, "%s: bad offset 0x%" HWADDR_PRIx "\n"=
,
> > +                      __func__, addr);
> > +    }
> > +    trace_bcm2835_cprman_read(size << 3, addr, "A2W", a2w_name(addr),
> > +                              pll_name((addr >> 5) & 7), res);
> > +
> > +    return res;
> > +}
> > +
> > +static void bcm2835_cprman_a2w_write(void *opaque, hwaddr addr,
> > +                                     uint64_t value, unsigned size)
> > +{
> > +    if (FIELD_EX32(value, CPRMAN, PASSWD) !=3D CPRMAN_PASSWD) {
> > +        qemu_log_mask(LOG_GUEST_ERROR, "[CPRMAN]: password key error w=
%02d"
> > +                                       " *0x%04"HWADDR_PRIx" =3D 0x%"P=
RIx64"\n",
> > +                      size << 3, addr, value);
> > +        return;
> > +    }
> > +    value &=3D ~R_CPRMAN_PASSWD_MASK;
> > +
> > +    trace_bcm2835_cprman_write_a2w(addr, a2w_name(addr),
> > +                                   pll_name((addr >> 5) & 7), value);
> > +}
> > +
> > +static const MemoryRegionOps bcm2835_cprman_a2w_ops =3D {
> > +    .read =3D bcm2835_cprman_a2w_read,
> > +    .write =3D bcm2835_cprman_a2w_write,
> > +    .impl.max_access_size =3D 4,
> > +    .valid.min_access_size =3D 4,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > +};
[...]
