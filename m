Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1165979ejb;
        Thu, 3 Aug 2023 09:32:00 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEFwxcpbg4Py5ewbMcQmw9Ga6ql4nQWBMBhnzJYPt4VP5hmkBW8Mz/r7kuu1uUoakJbq3lD
X-Received: by 2002:a0d:e907:0:b0:577:3561:8a81 with SMTP id s7-20020a0de907000000b0057735618a81mr19101922ywe.22.1691080320364;
        Thu, 03 Aug 2023 09:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691080320; cv=none;
        d=google.com; s=arc-20160816;
        b=cK1zBw2ilFgTLMycNEzDWUwwc4A4XmPY126k2YfhqosBihodTPIEWYMOxPbpe+dBKs
         ty5jKj3v00VATj0wbjPJQxKP56GFMYSXloRuiaQSljEvpSUZZ70taJZaq/1chQ7RedjD
         VPRLGgrR1OclrJeaXBPPa2eUSPoQkyuJgcbZc60UpetcsbaLiX6+7BALypB0C0yC1MOM
         wiZWjzDWJMZgqbAWHSgxAHlyZnzrLG51dHWRrbujZTDXa77b10Vvdi19M/kKtdkd6LBq
         kcDc3MoHH1sjRppxJoBwm5DuuQY75OAB8kB7ZSXRVqRksC6bxLzgFIpRsUcAyC3YkrBQ
         +rXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8ML4c12rEx1eZW5TZLSmBhtPzewN8g7REXOd4fE7o8Y=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=rIA8WydAqFbJjuHySkofPeJomiRYyjmZNfj3N8mzdXbC3j6048UY0yBuZZFcsX9/az
         CTT34LbyvJGvKk8qvlelKULm5hdgxmD9gRud2imKIOAtzy7s/uQn2mIqtKmHYih8d7Hp
         MXwwpUnNnQEV0WgljW30xS+FnJEgGEotoU63g9/7H/Et4a96LeW8gPESavNLHA/eGwAC
         sh4zlUU3on6xCcIZ5iiwqrOJDl28xx+CjQWzBuQCUDsAxCKsiNFrWl1Np0+5IAM2Endp
         FA6TuBd/rIRWAwfIA84gaA76IH4+sVqWnZLBLXdW2r1k9Ds7eN4Ag8tLda3LG1vYaBCB
         EXPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rz5nBSiA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11-20020ac859cb000000b004036139c672si111788qtf.85.2023.08.03.09.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 09:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rz5nBSiA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRbEq-00028H-B9; Thu, 03 Aug 2023 12:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRbEn-00020V-7s
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 12:31:45 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRbEl-0004z0-H0
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 12:31:44 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-52164adea19so1459925a12.1
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 09:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691080299; x=1691685099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8ML4c12rEx1eZW5TZLSmBhtPzewN8g7REXOd4fE7o8Y=;
 b=Rz5nBSiAzbBus3cJF9UAHmrqvQSf41WNfxdQX3Hvex/OA+NTezCzk6DkGmVnF1Q4N4
 wet9iswzKF581gNq+ZnZ9kmDK2jusp3JIL3iE9tTBg5jAA5J3eIyEhbf5t9XBw5ID6Ys
 ZZS9O7AZlKLlGuYOaqlR9nX5fN7QLbc8kArGvlaIJpusI0MFPOJ/EKBjcfLVGrDu3VxX
 Yamk1QAYYb5A1LESAjDM2CzqH/ZoC0w7GPoY/TToJyj8ubDMnLQiylGkqssrlf3ZckDq
 4bWgYKGLO5WVvFhqqSq0MCcl4OWd5nLaH2WDHV0ObJBRC7vMLCMOzHtg/7xGsO5KRWfe
 F6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691080299; x=1691685099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ML4c12rEx1eZW5TZLSmBhtPzewN8g7REXOd4fE7o8Y=;
 b=HjquMoFOkRRxRrKMeOichIk3mXctrpvJEakA5h89otk+T+oPxItR2mXjx7z7vwFbMk
 YQKDashoJVISWBRyECbgUcoJM6ssLoyewmiveQ9kei2suvcy0fm+xhPjzXi4nEyQKSmr
 cI88HgNoGExFdyDkrSwmT12QDnO6yZC38YJQhPkkpzQClhEwIP2sqQWEQ9JXJbrKwFP6
 4IKA6C/3eqZWL/fPxww7R29uKnjbthmJMy3VEBl7TrluPA2YKNO/18jV0hM8alFf4Puq
 zkwJJuoau5I6NpEUcPvStRoLl76D/7zeC1xSua4bhpFLe9V1Nk/V20RCILC6HO6O1FO3
 kGvA==
X-Gm-Message-State: ABy/qLa/7EvArFcxYNGSmGADrnqvKMg1RN8endRZMXZNCy2hn+/1z15M
 HcyoImj2tyFdgM41uwPmbSfkUHQtIx+HHpRnTBsYog==
X-Received: by 2002:aa7:cd74:0:b0:521:9d92:5863 with SMTP id
 ca20-20020aa7cd74000000b005219d925863mr6323146edb.42.1691080298772; Thu, 03
 Aug 2023 09:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-5-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-5-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Aug 2023 17:31:27 +0100
Message-ID: <CAFEAcA8h3Kv1oSOeidufLAjjmDanp-nR=YJRutejNWOXTS8u8Q@mail.gmail.com>
Subject: Re: [PATCH 04/44] Introduce BCM2838 SoC
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: UDKPwUjf1RGs

On Wed, 26 Jul 2023 at 14:52, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838.c                     | 110 +++++++++++++++++++++++++++
>  hw/arm/bcm2838_peripherals.c         |  72 ++++++++++++++++++
>  hw/arm/meson.build                   |   2 +
>  include/hw/arm/bcm2838.h             |  26 +++++++
>  include/hw/arm/bcm2838_peripherals.h |  36 +++++++++
>  5 files changed, 246 insertions(+)
>  create mode 100644 hw/arm/bcm2838.c
>  create mode 100644 hw/arm/bcm2838_peripherals.c
>  create mode 100644 include/hw/arm/bcm2838.h
>  create mode 100644 include/hw/arm/bcm2838_peripherals.h
>
> diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
> new file mode 100644
> index 0000000000..dd650c8148
> --- /dev/null
> +++ b/hw/arm/bcm2838.c
> @@ -0,0 +1,110 @@
> +/*
> + * BCM2838 SoC emulation
> + *
> + * Copyright (C) 2022 Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +#include "hw/arm/raspi_platform.h"
> +#include "hw/sysbus.h"
> +#include "hw/arm/bcm2838.h"
> +#include "trace.h"
> +
> +struct BCM2838Class {
> +    /*< private >*/
> +    BCM283XBaseClass parent_class;
> +    /*< public >*/
> +    hwaddr peri_low_base; /* Lower peripheral base address seen by the CPU */
> +    hwaddr gic_base; /* GIC base address inside ARM local peripherals region */

Are these actually variable across different BCM2838 versions?
If not, don't bother making them configurable like this, just
have a #define of the address values and use it directly.
The BCM283[567] code only does this for peri_base and
ctrl_base so it can have one class that handles all three SoCs.

> +};

thanks
-- PMM
