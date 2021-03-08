Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2005295lfg;
        Mon, 8 Mar 2021 08:56:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFibkbRszavMp5nZirXTdgs0aU7lpeGH8QtPIgLTNqlroBwTEblbcab22DWFhLFoZO/grz
X-Received: by 2002:aca:3606:: with SMTP id d6mr8592085oia.103.1615222599210;
        Mon, 08 Mar 2021 08:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615222599; cv=none;
        d=google.com; s=arc-20160816;
        b=WIIClNLtD+rPf20gyPY4Mhg/hJ2/2lNo7tMgl0Eg7dd1Z9I4C9e+yw6FIMMgUqwBJE
         uIw+RTZGjYr36CdvPvWgo4ySKjdNuGOVKeI/GI9hGQcWDe5S++AI0XqABoMNtWxG3KQ6
         i4bvvXHy54gLjYn0VVaYBesdSwrVsseWB75CZGWHd5J6C7XAXDIUg+qvlq68LvYZJ+Qd
         bj5DJDcjNbx96n5p7FEY6NNxTOotZ38bN6Wiv1Zs5HrgfHrLTTYrztLJo491t4GvvHeB
         ZbBq8BcNUJ3WOS16U7CxzumCP5BFyzCa6AB34y+XRKc4IVEcfCoJlyQYDc4yHd9iFXme
         vlSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3+cjnm2NMhV2lDtLBXMjHIyVu8kaD/hTsSebuRlTfu8=;
        b=cQ1OftDfkhG2xC/t/zkNR9AuVRxBNUz7WAyO6s++kvMNbWw+FQgIIlp6ycStv9JZFM
         XEdDTLsNppS2C6bW7Ois2V36FujWGtRmnNWxW1hvndP3KwgsZziNuERNOZm8Wx4ApeUD
         BdyuAGxmV8X/3rwGNfEbiG+F6vTJttFpLvZBh1rOo1/Rsj2sgPrsSPoHQ9B1x0SxXEFt
         m8nrcnhZsxJvyiOlQ/ir+57fxH1HK060autaWEaLTv2XAg8snfIPOHyP1c7p2lsk240z
         U4BxR11MerL2lCEA9k44j+jjclTk2eifXCWhmhNYTbZPqdktIvrKKtwP2e49ZX/Nag74
         BpzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P2JWzhPn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si8814321otw.136.2021.03.08.08.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Mar 2021 08:56:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P2JWzhPn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJJBO-0002si-DE
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 11:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJ9c-0002pY-2D
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:54:48 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJ9Y-0007hc-OX
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:54:47 -0500
Received: by mail-ed1-x529.google.com with SMTP id l12so15783116edt.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 08:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3+cjnm2NMhV2lDtLBXMjHIyVu8kaD/hTsSebuRlTfu8=;
 b=P2JWzhPn45CZ+FDwbyq7YBg5ZmSiqD3Q+6fWQ9IMrBC1LrTkvDGuaiFsWMP13HdtNk
 XmLMMdYerOr57AMiTynxwCiOnjk1SxLP/GVV/BFQgWpGdfol4JQAf7n5O/mauQrqf6xx
 vkm9lhozw84sMTIHni3aAEtUUcfMdeqNhTLE4Pp9qjgF6PBwwC6cIbB3YggRuqNnO2+J
 jOyTp89h4Q0pqGI3ElunwePjRJ1YKWtHk9tbXqcOfrCR8RKsktXtAWL0VcS+QP6kTB4j
 y0gxFVqgQHqXfhziBCPMWDQ52qZdxBU7qlT2l3Dgtw68clMJDP5tfK9dYjTh/0N345Wq
 5wzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+cjnm2NMhV2lDtLBXMjHIyVu8kaD/hTsSebuRlTfu8=;
 b=Lk8nFKcq/SsRe0sScpHHWEJ8CBNCumNrrNcP4JzJmSz+nkGRyrG6b8GCVYn0Db1iWy
 6cthbWKdqdxtVf1eZ7VJ0sRnFgYId4Qnv4BESMsiwewNdzujWu0dUlXtSt7etNikcUrZ
 tV/wDOWDnsrOB5cbDsIEL/ls3Wgp9+sBP+lLWRj/Y6ee7AKuJQwALXMROpR80OvxVRXK
 JfwIlhKUz/QK19xlECR/DKEFkas/B6FVmjVIDZRI8kUBbNz5YyJ6G3xNY9+zg3g/V4nq
 NZfMFCNCy0ppxcJMMoOFyVGL9f5rzeh0W0jC1T8S1k4/kd/U9uJwUSjhLNZHXtW4oJOx
 eFsA==
X-Gm-Message-State: AOAM530abad+pNgStkGeitAVyQ5p6CtsJs/N9Bal5NJZB+cQAnHT0TqV
 zAuUvXB6bB0Y3A+z+4j2aj6zuCgwkLo8AuG76iqIlQ==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr3758973edt.36.1615222482706; 
 Mon, 08 Mar 2021 08:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20210302110955.1810487-1-edgar.iglesias@gmail.com>
 <20210302110955.1810487-2-edgar.iglesias@gmail.com>
In-Reply-To: <20210302110955.1810487-2-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 16:54:26 +0000
Message-ID: <CAFEAcA-Bquwni3NN6BLfXjCntCwUqXuXx9=-RSpZgfHS+RgxqQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] hw/misc: versal: Add a model of the XRAM controller
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, francisco.iglesias@xilinx.com,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3uyZlmKcJ1hU

On Tue, 2 Mar 2021 at 11:09, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a model of the Xilinx Versal Accelerator RAM (XRAM).
> This is mainly a stub to make firmware happy. The size of
> the RAMs can be probed. The interrupt mask logic is
> modelled but none of the interrups will ever be raised
> unless injected.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  include/hw/misc/xlnx-versal-xramc.h | 102 +++++++++++
>  hw/misc/xlnx-versal-xramc.c         | 253 ++++++++++++++++++++++++++++
>  hw/misc/meson.build                 |   1 +
>  3 files changed, 356 insertions(+)
>  create mode 100644 include/hw/misc/xlnx-versal-xramc.h
>  create mode 100644 hw/misc/xlnx-versal-xramc.c
>
> diff --git a/include/hw/misc/xlnx-versal-xramc.h b/include/hw/misc/xlnx-versal-xramc.h
> new file mode 100644
> index 0000000000..68163cf330
> --- /dev/null
> +++ b/include/hw/misc/xlnx-versal-xramc.h
> @@ -0,0 +1,102 @@
> +/*
> + * QEMU model of the Xilinx XRAM Controller.
> + *
> + * Copyright (c) 2021 Xilinx Inc.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> + */
> +
> +#ifndef XLNX_VERSAL_XRAMC_H
> +#define XLNX_VERSAL_XRAMC_H
> +
> +#include "qemu/osdep.h"

Headers must never include osdep.h.

> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +#include "qemu/bitops.h"
> +#include "qemu/log.h"
> +#include "migration/vmstate.h"
> +#include "hw/irq.h"

I bet you don't really need all of these includes in the header file;
some of them belong in the .c file.

> +static void xram_ctrl_init(Object *obj)
> +{
> +    XlnxXramCtrl *s = XLNX_XRAM_CTRL(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    RegisterInfoArray *reg_array;
> +
> +    memory_region_init(&s->iomem, obj, TYPE_XLNX_XRAM_CTRL,
> +                       XRAM_CTRL_R_MAX * 4);
> +    reg_array =
> +        register_init_block32(DEVICE(obj), xram_ctrl_regs_info,
> +                              ARRAY_SIZE(xram_ctrl_regs_info),
> +                              s->regs_info, s->regs,
> +                              &xram_ctrl_ops,
> +                              XLNX_XRAM_CTRL_ERR_DEBUG,
> +                              XRAM_CTRL_R_MAX * 4);
> +    memory_region_add_subregion(&s->iomem,
> +                                0x0,
> +                                &reg_array->mem);

Isn't this just creating a container region that contains
exactly one subregion that is the same size as it? Do we
need to do this so that the reg_array is disposed of via
refcounting or something ?

> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +}

thanks
-- PMM
