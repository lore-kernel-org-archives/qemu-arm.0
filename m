Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23653805lff;
        Mon, 6 Jan 2020 09:54:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7eWrlWuYgIwSJxwP90TkoNLvBKiRjbjqEX5ctRL3FGbbkF1nblED02iljCc4LUlq+N5H5
X-Received: by 2002:a17:906:7c58:: with SMTP id g24mr110494961ejp.112.1578333289020;
        Mon, 06 Jan 2020 09:54:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578333289; cv=none;
        d=google.com; s=arc-20160816;
        b=aP3zxCCvqLkbK03ahPE8F+sIrJJA6LmfTjUTJK3DjFPBuRWgGutBmaqTUdluIdIZyj
         GO3i+PvTyQqv1LX0pOReo2i9alf/zFuvYgM7tvaJ7G6Rxe//QWCWQH7Y7SRZcZfwGpDB
         ZA+4ikN77oYALeElXcSnFLu8ZwmS34V+e0BgpByRIUazW6vWA717J8YnjPPQ/78rnM3n
         faMycf017PXDa/fAT3exwDi2EPakStIJfsLxWW6r553igOoJmyDhpCNyXFAWp59tn4rm
         z5ZIlD5EegVLIX6mNSdhQ25yjHjvnhbacPo0uTeEwpCth2sNqtR0Gz0gNkX81lVFtomS
         spbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GC99n407uU3G9+rw6NzIvANr8v7Ucn42d7NObB6fogM=;
        b=g7hOzBeucBmyJx3kZ2VTu1x7JG/7d4MyJzUPK5GwfvpUJzqrIq6u/q2uWScbrVXC4Z
         Kyyl24rRL9PXRjegKf78C2HsIVNLf1F6rwDdcFZLspkII469IStezFCe103y6aBjMgV8
         sQcQjPjXQQOu1VSj0WYxX2oQQLLNYlWfcyHCy5wd0cZxmtAmLrXSXWj7avJIpsjLTJzA
         1L2ydJCJt3M9KQecdOP3RHniCjsuBlYMcT+HOqVakVP+0oZYj6FSXH+L7ng/dS8BPAj+
         A5wZI8x0cQSNGS02UTbXFMSuPl1bxKzDRMHJDm4KdR+vwGCXxzc2oIEOY2b0n46Tuja/
         7REA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6sWHYGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25si44245047edr.176.2020.01.06.09.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 09:54:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R6sWHYGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioWaV-0003c5-O0
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 12:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ioWaK-0003Ys-CU
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:54:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ioWaI-0005D3-Vg
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:54:36 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46229)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ioWaH-0005By-H6
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:54:33 -0500
Received: by mail-oi1-x244.google.com with SMTP id p67so16455425oib.13
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 09:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GC99n407uU3G9+rw6NzIvANr8v7Ucn42d7NObB6fogM=;
 b=R6sWHYGT8ur7yFW5JQpBBQGmuxalPhrdopnZwJneIwAOokbMdB+I57DA1WyTw5ehKj
 KNG3xeTTRAtr5+56jNB7+Y3GUlP4haxORuXlUkB07SKtl/Pu1IR7aWvb9jA/6/0rC6Jx
 NjxDW9Bvqy9o9X8uMhn35xYNH7lZ147bu0CH1k/EV6F/4Qt82KXzf/tX/iFTUdiVGStN
 txX8wz4NDZ6YbnVLuLPCbge8jLxai6SqV2JN9n64892tq673iShQIE2NHrtDEA4o6XZ7
 8ekaU0/S8K6kiGKy/Av2Ps5WEdct+oBryb+8hMxOgKaFOpbn56Q0GTpMrsrMm4m085MA
 dvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GC99n407uU3G9+rw6NzIvANr8v7Ucn42d7NObB6fogM=;
 b=ln/uMl7EB+CtK+qDKuFrNghcXhepTLfhHYzDxYQnkChHyrMCEWfermJSzBsCIfvcKQ
 kjG8aLYfGWkhXcdiIggxEQN0PIXNGaJCI2mL/m4hS2kwDW/Sli0EQdFW9x2Dmnlz2lRk
 tdFXGhCSBb6jhD0eUsyIsoYeuBxWs7a4PkTFjmhs8Jetv+euM45R8fr9rUENYbWulfSp
 bDJXo/6a6XEtUCK0lvnzJePNPqza7dGMTlB53o2RhwCJatUqWqMhzMX2/aHcDqhXWWpi
 wez1ZaLv1t5bOBkUuMxB9ZAQCYTXST9sZzai7k07QBPEESKjL4knYgVGhtqQMPUYsn8M
 ijDg==
X-Gm-Message-State: APjAAAW8rNV5JVfKcdXYT0k8KWi3q8B8iCwDxerai2u01kYFYdjF2p9G
 tov3G3IsSoGU2brFqtNSvLN7VORDBDxPkpjUN1ybPgQXbrg=
X-Received: by 2002:aca:570d:: with SMTP id l13mr5776120oib.146.1578333272437; 
 Mon, 06 Jan 2020 09:54:32 -0800 (PST)
MIME-Version: 1.0
References: <20191226175132.28116-1-martin@kaiser.cx>
In-Reply-To: <20191226175132.28116-1-martin@kaiser.cx>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jan 2020 17:54:21 +0000
Message-ID: <CAFEAcA-JTxqGid8EW=Vu=xePrEVgxD9pZRNAg0BehFVhYKfebw@mail.gmail.com>
Subject: Re: [PATCH] i.MX: add an emulation for RNGC
To: Martin Kaiser <martin@kaiser.cx>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B3UL4dmeImmS

On Thu, 26 Dec 2019 at 17:52, Martin Kaiser <martin@kaiser.cx> wrote:
>
> Add an emulation for the RNGC random number generator and the compatible
> RNGB variant. These peripherals are included (at least) in imx25 and
> imx35 chipsets.
>
> The emulation supports the initial self test, reseeding the prng and
> reading random numbers.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Thanks for this patch; it looks good to me -- the only
major missing item is a VMStateDescription, which should
be easy to add. (I haven't checked the actual device
functionality against a datasheet, but it all looks plausible.)
There were also a couple of minor nits which I've listed inline below.

> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index ba898a5781..2b28f8c096 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -42,6 +42,7 @@ common-obj-$(CONFIG_IMX) += imx7_ccm.o
>  common-obj-$(CONFIG_IMX) += imx2_wdt.o
>  common-obj-$(CONFIG_IMX) += imx7_snvs.o
>  common-obj-$(CONFIG_IMX) += imx7_gpr.o
> +common-obj-$(CONFIG_IMX) += imx_rngc.o
>  common-obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
>  common-obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
>  common-obj-$(CONFIG_MAINSTONE) += mst_fpga.o
> diff --git a/hw/misc/imx_rngc.c b/hw/misc/imx_rngc.c
> new file mode 100644
> index 0000000000..f935ec46a6
> --- /dev/null
> +++ b/hw/misc/imx_rngc.c
> @@ -0,0 +1,262 @@
> +/*
> + * Freescale i.MX RNGC emulation
> + *
> + * Copyright (C) 2019 Martin Kaiser <martin@kaiser.cx>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * This driver provides the minimum functionality to initialize and seed
> + * an rngc and to read random numbers. The rngb that is found in imx25
> + * chipsets is also supported.
> + */
> +
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"

Do you really need main-loop.h ?

> +#include "qemu/module.h"
> +#include "qemu/log.h"
> +#include "qemu/guest-random.h"
> +#include "hw/irq.h"
> +#include "hw/misc/imx_rngc.h"

> +static void __imx_rngc_reset(IMXRNGCState *s)

Don't use __ prefixes for function names, please.

> +{
> +    s->op_self_test = OP_IDLE;
> +    s->op_seed = OP_IDLE;
> +    s->mask = 0;
> +    s->auto_seed = false;
> +}
> +
> +static void imx_rngc_write(void *opaque, hwaddr offset, uint64_t value,
> +                           unsigned size)
> +{
> +    IMXRNGCState *s = IMX_RNGC(opaque);
> +
> +    switch (offset) {
> +    case RNGC_COMMAND:
> +        if (value & RNGC_CMD_BIT_SW_RST) {
> +            __imx_rngc_reset(s);
> +        }
> +
> +        /*
> +         * For now, both CLR_ERR and CLR_INT clear the interrupt. We
> +         * don't report any erors yet.

"errors"

> +         */
> +        if (value & (RNGC_CMD_BIT_CLR_ERR | RNGC_CMD_BIT_CLR_INT)) {
> +            qemu_irq_lower(s->irq);
> +        }

> +static void imx_rngc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = imx_rngc_realize;
> +    dc->reset = imx_rngc_reset;
> +    dc->desc = "i.MX RNGC";

You need also to set dc->vmsd to a VMStateDescription
which describes the variable state of the device that
needs to be migrated.

> +}
> +
> +static const TypeInfo imx_rngc_info = {
> +    .name          = TYPE_IMX_RNGC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(IMXRNGCState),
> +    .class_init    = imx_rngc_class_init,
> +};
> +
> +static void imx_rngc_register_types(void)
> +{
> +    type_register_static(&imx_rngc_info);
> +}

thanks
-- PMM
