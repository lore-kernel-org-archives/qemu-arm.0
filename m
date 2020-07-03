Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2761345lfm;
        Fri, 3 Jul 2020 12:58:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBB5i1whpRGIgLuvS4XYjuAje5oGRgeBuZg26BK4gZ4CLCvtHkkeT/VmFnuhz6hcskXQL7
X-Received: by 2002:a25:8448:: with SMTP id r8mr4801538ybm.360.1593806314596;
        Fri, 03 Jul 2020 12:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593806314; cv=none;
        d=google.com; s=arc-20160816;
        b=OEShFA8+X2h6SR1G9GUHhjTt/b7arX75ageT5M9lgybp1gBuF9n/ii+hpDSx0Gt8jX
         4TZ9tIEiU4kkVybIMOkdOlGQTm9JHfoFZViZsF+P/zqxG82xS1FwRXEwvF+vHMcq10sX
         P2Tt+NELhme0KSrTpkT1fi94Cl4Tcf+ptYoT4s5BGqp/wCNuFFGihBH9ysFyaQgcB+Mo
         l8j5Hd2U6lx1K5OhAyPzbxgtLjrGRZsX6O4KSh1jf4wFA93ODhYayT4ebC3uY1+GNgx4
         famCHiYetrWy+U6FCuieywmQUQbFNNymcXqSUHcbYCEMJHTm0cB1LI4YjNj9i2+mZ8iJ
         5ULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=PYGoZUfhBksdkxJBXKsEDlmCmkkR7TlkVJgZ0UlumZs=;
        b=HOsNqr+4Vz3dDW4kkdl+o9hR8rYxgDjbZqboqaS9cl2KRWhHhRfpCKcbzmv0RPBuBd
         b96ryx/e0QApbge5RKczHWp+bvQZOtRPsE+2uV9AnH7fowQLaY5Y6P7SN3vj2uunVnpg
         RS7T9LDUkENvj+xFBzXyywYKRysIbUHTVA3b86T0IoEFUnYU/4pq4W0QBbPHHzqUAoqd
         A+Gep2wt8vEx98FnzGBiv36VMONYLSvoL1LKdU34zfj7hJhVwn+kXqfFhZS7+eIvf+fK
         e9dIriViGUA5Cpuk27ZxsRiFxDU+4kgvcfiBNUgp8uJ89FZWzVW4+APZu2hbQUAsQyVu
         gbbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8si13577979ybm.137.2020.07.03.12.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 12:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrRpR-0003Jz-Vt
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 15:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jrRpJ-0003JU-9j; Fri, 03 Jul 2020 15:58:25 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:59118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jrRpG-0005zQ-KM; Fri, 03 Jul 2020 15:58:24 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DCD0B74632B;
 Fri,  3 Jul 2020 21:58:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B42BD746307; Fri,  3 Jul 2020 21:58:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B2A5B74594E;
 Fri,  3 Jul 2020 21:58:08 +0200 (CEST)
Date: Fri, 3 Jul 2020 21:58:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/2] hw/ppc: Use TYPE_SYSBUS_OHCI instead of hardcoded
 string
In-Reply-To: <20200703184952.4918-3-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2007032149250.12670@zero.eik.bme.hu>
References: <20200703184952.4918-1-f4bug@amsat.org>
 <20200703184952.4918-3-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-665798566-1593806288=:12670"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gwsHRF6/ihEs

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-665798566-1593806288=:12670
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Jul 2020, Philippe Mathieu-Daudé wrote:
> By using the TYPE_* definitions for devices, we can:
> - quickly find where devices are used with 'git-grep'

You could just as well grep for the type name but it's true if some files 
use name and others the constant then you need to grep for both.

> - easily rename a non-user-creatable device (one-line change).

But most devices are user creatable and thus their name is part of the CLI 
so inlikely to change due to preserving backward compatibility of command 
lines. So usefulness of this change seems limited to me.

But my problem with it is not the above. It's that hcd-ohci.h is not in 
include but in hw/usb so it's internal to the implementation of the device 
model and defines things that users of the device should not need, 
therefore they should not include this header. So if you want to use the 
defined constant then that should be split off to some public header 
instead of including hw/usb/hcd-ohci.h. Maybe we need a new header for 
these TYPE_* constants similar to qemu/typedefs.h?

Regards,
BALATON Zoltan

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/display/sm501.c | 3 ++-
> hw/ppc/sam460ex.c  | 3 ++-
> 2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 9cccc68c35..c122a4eca5 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -36,6 +36,7 @@
> #include "hw/qdev-properties.h"
> #include "hw/i2c/i2c.h"
> #include "hw/display/i2c-ddc.h"
> +#include "hw/usb/hcd-ohci.h"
> #include "qemu/range.h"
> #include "ui/pixel_ops.h"
> #include "qemu/bswap.h"
> @@ -1961,7 +1962,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>     sysbus_init_mmio(sbd, &s->state.mmio_region);
>
>     /* bridge to usb host emulation module */
> -    usb_dev = qdev_new("sysbus-ohci");
> +    usb_dev = qdev_new(TYPE_SYSBUS_OHCI);
>     qdev_prop_set_uint32(usb_dev, "num-ports", 2);
>     qdev_prop_set_uint64(usb_dev, "dma-offset", s->base);
>     sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &error_fatal);
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 1a106a68de..593436937a 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -35,6 +35,7 @@
> #include "hw/char/serial.h"
> #include "hw/i2c/ppc4xx_i2c.h"
> #include "hw/i2c/smbus_eeprom.h"
> +#include "hw/usb/hcd-ohci.h"
> #include "hw/usb/hcd-ehci.h"
> #include "hw/ppc/fdt.h"
> #include "hw/qdev-properties.h"
> @@ -370,7 +371,7 @@ static void sam460ex_init(MachineState *machine)
>
>     /* USB */
>     sysbus_create_simple(TYPE_PPC4xx_EHCI, 0x4bffd0400, uic[2][29]);
> -    dev = qdev_new("sysbus-ohci");
> +    dev = qdev_new(TYPE_SYSBUS_OHCI);
>     qdev_prop_set_string(dev, "masterbus", "usb-bus.0");
>     qdev_prop_set_uint32(dev, "num-ports", 6);
>     sbdev = SYS_BUS_DEVICE(dev);
>
--3866299591-665798566-1593806288=:12670--
