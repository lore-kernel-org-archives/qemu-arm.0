Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp343304ejb;
        Thu, 8 Jun 2023 06:36:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pIxv0EcdmEu1jwu2gX5ptuc9LyBuskUIr2ct5BEM+V/u8KRJ0q11eK6CdoxSlJPZmfnaT
X-Received: by 2002:a05:620a:2ccb:b0:75e:da62:ccde with SMTP id tc11-20020a05620a2ccb00b0075eda62ccdemr4041636qkn.54.1686231411364;
        Thu, 08 Jun 2023 06:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686231411; cv=none;
        d=google.com; s=arc-20160816;
        b=g2WdmY4byapiPfc54ncgXTLn4gDY71j8NOmx7LIw/LMglBlHRjL+BFhTawMC8+VS14
         reSBYS7e8IecSwFwWiS1bDI/B3c/S4tfdLlpcy5D5u9uxPWKVDo+i2wTwEJNqZtPfjwj
         YQgEHU7baQQC5S3iImJMzM4UJbMDfR1XOisjSIK47m1qnRu1JVnNJId4JL6I66Bz5wuk
         689whwOwtLgGG8Om0XEbb1yI2smOBKNQ3taTZ3/wk/rI1yhJ4Gqn18gyrZZmMYZOZp9s
         tjgbp8Z7gXpOr9ggTrlkctrjy2UNY32DPS2r4uwxjzBC3Ja0SoqOetgmE8o45NoZTZl+
         cZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oaCSIAHcbV+4he+iDkUHMV1vnskjnyZfMyUPy6EOHu8=;
        b=oYUFZ6g57gGN+Sma8mcD6RrSKxZDG4DT8QLZZBUUQfxLPutMmKOCdMuG6D2KB5eXlL
         hX9dWEGWrbrGbs+N4VCUH9gu/CPS4GR/0d9FLaMjfGSKOULoGk7pvFSTWMKPy326/BP7
         gzhuQAfPSG0V+3YdNPGRMdYMESJLLOUF6f41bYrDm9qcPPYKtOXc9Rdt5P43+AD8xSvt
         fhRzBqDhTAgzQ5XnUNUd1DPp7NLnJp4BAlV5sO3Rc+nCjuXe9RgWWyYS6nHstZ6QuVMH
         rMHHxV1UV3u/U4x5U1ZZLl0bNrlfuGIgo5IU4/3BYGSBkvasBD+AosYTaY3ye42cakW3
         kF5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAUQuVha;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pa29-20020a05620a831d00b0075ec5399093si582706qkn.738.2023.06.08.06.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 06:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAUQuVha;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Fod-0000tN-3o; Thu, 08 Jun 2023 09:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Foa-0000og-I8
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 09:36:37 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7FoU-0007PG-Kb
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 09:36:35 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51491b87565so1101669a12.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686231385; x=1688823385;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oaCSIAHcbV+4he+iDkUHMV1vnskjnyZfMyUPy6EOHu8=;
 b=JAUQuVha2nmPB3EPQ6sDaNBxV1JrqE+8GYoDIv5C8DwLE+2JgpzXAzhyMbPefHKarA
 EA0iG8f4AjbYfUjppsw/l5oLfV6NLFO7CMonlNwYW+aBU3uTnzv8qvCQ9kRrafR8VWPW
 aJ6sJREjCO/fWlzCGUpUqovkVTz5ULpjGYlPPI3bN6ZOsyfObj3QYTjTPsIlfHvN7DS3
 MGoCdNm386qPRRqqjQPuMvpeIID7TOxfGb90F6XkObbQOT5gbaNoCyP44qI6OcdElgB5
 8cGbQlNsjwTtpSZhyeXXbL3dFKIAujhvGYVS2uc7E+xjEfczoiRdtKN7BkIAmZIXVkEm
 G20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686231385; x=1688823385;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oaCSIAHcbV+4he+iDkUHMV1vnskjnyZfMyUPy6EOHu8=;
 b=WizZWBaQlGQDqH2h+iffZA7rRf3A8A/GWSW/2huGNRB0ViyNBq6EAi66TYBCUz3vSY
 NxgFhy+ajDdLtRJ48KHeWVh29WdvBI4N6mxDADMCh7cyIVW2atqEtSTo4Ow7YKEnwPkY
 HCf+p1fhKI52mGn2BtbxX5pbleQM3+oEyqaPQ+aKmbRNs6UMPJ+NgS1HFJJLvvMyZViR
 W3qMajEM99/06XuCQzAatANHS8eMLdAIR857BquPIWAbgTPOMOWucAWA1+4LZ6uZN9fF
 TDwWt6DbXZ7W7zGF5nSDVTPM3qBwe+vF86JSPnupLgIO5eCJPKRSupqbWo4ie2fbgKBk
 x6rg==
X-Gm-Message-State: AC+VfDz8BBjMUxvYPK3tPCl+r0i71s2kZ3HolCCnahHVeucOZv+4XMwq
 +5qUwTvOaRJxRSpYiFO1sdxd+Q8m5UthPvwafPhEuw==
X-Received: by 2002:aa7:de16:0:b0:514:abb9:7ab1 with SMTP id
 h22-20020aa7de16000000b00514abb97ab1mr7260635edv.8.1686231385589; Thu, 08 Jun
 2023 06:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230517081204.30333-1-m.elsayed4420@gmail.com>
 <20230517081204.30333-3-m.elsayed4420@gmail.com>
In-Reply-To: <20230517081204.30333-3-m.elsayed4420@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 14:36:14 +0100
Message-ID: <CAFEAcA_tOGAU2wu_Pj_tq1zP--UTsKKeeGbnZ+SqGBk0X5HvQA@mail.gmail.com>
Subject: Re: [PATCH 2/8] tiva c usart module implementation
To: Mohamed ElSayed <m.elsayed4420@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: NtCw4mZKw6rE

On Wed, 17 May 2023 at 09:13, Mohamed ElSayed <m.elsayed4420@gmail.com> wrote:
>
> Signed-off-by: Mohamed ElSayed <m.elsayed4420@gmail.com>
> ---
>  hw/char/tm4c123_usart.c         | 381 ++++++++++++++++++++++++++++++++
>  hw/char/trace-events            |   4 +
>  include/hw/char/tm4c123_usart.h | 124 +++++++++++

Patches that add new device source files should also have
the changes to the Kconfig and meson.build files that tie
them in to the build system (which you currently have put
all together in patch 8).

>  3 files changed, 509 insertions(+)
>  create mode 100644 hw/char/tm4c123_usart.c
>  create mode 100644 include/hw/char/tm4c123_usart.h
>
> diff --git a/hw/char/tm4c123_usart.c b/hw/char/tm4c123_usart.c
> new file mode 100644
> index 0000000000..21bfe781b0
> --- /dev/null
> +++ b/hw/char/tm4c123_usart.c
> @@ -0,0 +1,381 @@
> +/*
> + * TM4C123 USART
> + *
> + * Copyright (c) 2023 Mohamed ElSayed <m.elsayed4420@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */

TI don't explicitly say so, but this UART is a variant of the PL011.
So I think instead of a completely separate model for it, we should
extend the hw/char/pl011.c code to handle any specific new behaviour
we need for this variant. There's already handling in pl011.c
for the TYPE_PL011_LUMINARY, which is an older TI-specific PL011
flavour, so you have a pattern to work with. For that variant the
only thing we needed to override was the ID register values; you
might need a little bit more for this one, but likely not much.

So below I've only noted a few things rather than doing a review
of the whole device.

> +#include "qemu/osdep.h"
> +#include "hw/char/tm4c123_usart.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-properties-system.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "trace.h"
> +
> +#define LOG(mask, fmt, args...) qemu_log_mask(mask, "%s: " fmt, __func__, ## args)

Please don't hide simple calls to qemu_log_mask() behind
macros like this.

> +#define READONLY LOG(LOG_GUEST_ERROR, "0x%"HWADDR_PRIx" is a readonly field\n.", addr)

If you put all the readonly registers together and let them
fall through, ie.
   case USART_FR:
   case USART_RIS:
       /* etc */
       qemu_log_mask(...);

then you only need one line which reports the write to a read-only
register, and the macro isn't really necessary.

(Also, stray trailing '.' after the newline.)


> +
> +static bool usart_clock_enabled(TM4C123SysCtlState *s, hwaddr addr)
> +{
> +    switch (addr) {
> +        case USART_0:
> +            return s->sysctl_rcgcuart & (1 << 0);
> +            break;
> +        case USART_1:
> +            return s->sysctl_rcgcuart & (1 << 1);
> +            break;
> +        case USART_2:
> +            return s->sysctl_rcgcuart & (1 << 2);
> +            break;
> +        case USART_3:
> +            return s->sysctl_rcgcuart & (1 << 3);
> +            break;
> +        case USART_4:
> +            return s->sysctl_rcgcuart & (1 << 4);
> +            break;
> +        case USART_5:
> +            return s->sysctl_rcgcuart & (1 << 5);
> +            break;
> +        case USART_6:
> +            return s->sysctl_rcgcuart & (1 << 6);
> +            break;
> +        case USART_7:
> +            return s->sysctl_rcgcuart & (1 << 7);
> +            break;
> +    }
> +    return false;
> +}

The UART device shouldn't have a direct pointer to the sysctl
device like this, and it shouldn't be poking around inside
its MMIORegion to find out its physical address either.

The "right" approach here is that the sysctl device has a
bunch of clock outputs for the various UART clocks, the SoC
code wires up each clock output to the appropriate UART
device, and the UART device calls clock_is_enabled() on
its input clock.

The simple approach is to say "we'll just assume the
UART clock has been enabled", because correct guest code
will do that anyway and the device implementation doesn't
much care what the clock is. That's what we usually do
with UART models.

thanks
-- PMM
