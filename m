Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1449135ejb;
        Thu, 27 Jul 2023 10:25:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFMWd6CfVLfKHbUvgqu5ZSUOM1dIbmLWaAy9hiHot1m7KcQ/t9GoQTL0v/BFaXUbnbLdsp/
X-Received: by 2002:ac8:4e85:0:b0:403:a9aa:571f with SMTP id 5-20020ac84e85000000b00403a9aa571fmr207991qtp.16.1690478737553;
        Thu, 27 Jul 2023 10:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690478737; cv=none;
        d=google.com; s=arc-20160816;
        b=ufHMAaUHQ9M3yG8KxcWtczjS4GgQgO32sJeim3JhDAksHI+xNtRgTiIiQAMc+jsZYN
         bMGXzqVN/l7pywVSmS6w1bzwV1IVF/bnlp75XvbMW0mxaufZDQbTfyHxCmffOBI6uOuj
         rlMEy75Z54SO04xk5Ddk/JpZ95QX0evat8FpQEP2pANBaC6VniKcpcQqANMCJsvIX5H0
         oiyZaUVr1zwMMLU8etQVsp2tD5YXOuhjhDZrifk3zlGCRcnzjgxH1cL8B/N2pp98szlp
         ZKZV7Lg0IA0afuWaRoySBX1+00gDX27Gff9SJVIcrq5Q4p5+/adigr+qZJUWTijoiHR7
         rxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4Gog43nmYGFaOfneXZzqhRpcKKnJfPIUhs1hwzsNkXM=;
        fh=vaDpLBJmz5JjobJK3RXWYZonZ7WwqDVHFeS4aZ+rLcg=;
        b=WqAV8cue8S7QU3Ug4wDOryAU4VPswxS15EbH/Tqg9GdurY2kjKxGInZdz9IKxCeDj8
         YNV2gadkdj4zFacHlGaGFZomhdvLvflRm1JaMKExhVp69MOR+htPvtdNTS29t/3auNtI
         EMuBNFFzsBPrkdKMBARfIzfJd+h09EFPkxuAE0bQn+2rrBB++pr9X4j+geizo+SXwTFV
         xFIWKAqzQxKeSGeu0ck5XY3usyRrTGE45Kmurdc3AXYJujCrN+OZkWqq1CroVQcc+0ai
         agpkBPVYHE3FFnsUmEK88RAdvxil3CWUAIhNeM+DbkD+E5ay6b7BMzZHFJrebXGizALb
         nkBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHuuaLg3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a05622a178b00b00403eb3bb829si1110262qtk.352.2023.07.27.10.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 10:25:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHuuaLg3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qP4BY-0003Bp-RN; Thu, 27 Jul 2023 12:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP4BW-000380-8q
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:49:54 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP4BU-0006vr-1f
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:49:53 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5222bc916acso1473434a12.3
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 09:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690476590; x=1691081390;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4Gog43nmYGFaOfneXZzqhRpcKKnJfPIUhs1hwzsNkXM=;
 b=pHuuaLg3SRndfzM+A1Eq6ZRvtLL/wY4K7jxog0OAH4Y62kY8wJzUfOjD6NOLpd1VSi
 V+oz0n8JbxdgFfal3pNQ4CuDVrZMn8o+NdF2NP25+FlcDgUgbBlGHPF7Oxwj1vpratLs
 nj2H4e2//df+Ii6Quq7t2F8yTerlAjljVzr3OHESYgQbty2vYd1ShbM0Ex1yZUVo1tG6
 zP4yJzbpPBGG/FLzQzFC6THt8dn29Na/HTml1ekFocEbI0cWB8SEI5Hs2GnXpooaZK61
 vOd5oo0EeGiGgicJd+eCiwmYhLBN8CEi+I/UMOlgzWysjoOCM5ap/shlpqUc7lrarJTs
 hh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690476590; x=1691081390;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Gog43nmYGFaOfneXZzqhRpcKKnJfPIUhs1hwzsNkXM=;
 b=j83dBZJ+0Erz81D+KUK+Lc1R/OMu7kAYDIu1SQy/4S9Vl8S3GTCb0SzVJSlw03ahfX
 e1NdrgCjZiQ/XscZoCFjsqls+uxKINiVyD4Bx1mKLRxsQyH4PqqFhmhB+t03JBubPjJ+
 /APPu8WYGfNqi8Jt95yPZiyvuY3eAzMiHu2S/ddKCsRZe56UrUwo+hXO2T4hCQ2cnbSb
 jd/4yeawWPIAu14x3dCRb5IHYKOWA6kSWyhnelMjbUuu2ACk3CpvxU0dqIpr5fZ24X5Q
 EjDwmdsoiJqwXOew1DgMCgqOi1ppDchCCnkHI4I1Z+wcA7eYPYMkwjJsSndMJsKJ4TBZ
 HpeA==
X-Gm-Message-State: ABy/qLY5vnju8jo4BHFpiewHoGcUjMGAT4EHM7RVRv399RsIxBW/zmi0
 aGggsHzYH52qBvootp9v9Sz2SFZuyxaR0gLIs+nq/w==
X-Received: by 2002:aa7:d303:0:b0:522:1eab:e466 with SMTP id
 p3-20020aa7d303000000b005221eabe466mr1978291edq.28.1690476590202; Thu, 27 Jul
 2023 09:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690385928.git.jcd@tribudubois.net>
 <d620c9fcf72507db73a3f31df9065bd417f72704.1690385928.git.jcd@tribudubois.net>
In-Reply-To: <d620c9fcf72507db73a3f31df9065bd417f72704.1690385928.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jul 2023 17:49:39 +0100
Message-ID: <CAFEAcA_4wa5afcgSz6uZ3wHSj0oxjum60V5g9RBxkaX6LyTY+Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] Add i.MX7 SRC device implementation
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: cM8tdFQSmgkn

On Wed, 26 Jul 2023 at 16:54, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> From: jcdubois <jcd@tribudubois.net>
>
> The SRC device is normaly used to start the secondary CPU.
>
> When running Linux directly, Qemu is emulating a PSCI interface that UBOOT
> is installing at boot time and therefore the fact that the SRC device is
> unimplemented is hidden as Qemu respond directly to PSCI requets without
> using the SRC device.
>
> But if you try to run a more bare metal application (maybe uboot itself),
> then it is not possible to start the secondary CPU as the SRC is an
> unimplemented device.
>
> This patch adds the ability to start the secondary CPU through the SRC
> device so that you can use this feature in bare metal application.
>
> Signed-off-by: jcdubois <jcd@tribudubois.net>

I have a few style-type comments below, but overall this looks good.

> ---
>  hw/arm/fsl-imx7.c          |   9 +-
>  hw/misc/imx7_src.c         | 289 +++++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build        |   1 +
>  include/hw/arm/fsl-imx7.h  |   2 +
>  include/hw/misc/imx7_src.h |  68 +++++++++
>  5 files changed, 368 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/imx7_src.c
>  create mode 100644 include/hw/misc/imx7_src.h
>
> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index 05cdd4831e..db103069e1 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -82,6 +82,11 @@ static void fsl_imx7_init(Object *obj)
>       */
>      object_initialize_child(obj, "gpcv2", &s->gpcv2, TYPE_IMX_GPCV2);
>
> +    /*
> +     * SRC
> +     */
> +    object_initialize_child(obj, "src", &s->src, TYPE_IMX7_SRC);
> +
>      /*
>       * ECSPIs
>       */
> @@ -90,6 +95,7 @@ static void fsl_imx7_init(Object *obj)
>          object_initialize_child(obj, name, &s->spi[i], TYPE_IMX_SPI);
>      }
>
> +
>      /*
>       * I2Cs
>       */

Stray whitespace change.

> @@ -490,7 +496,8 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
>      /*
>       * SRC
>       */
> -    create_unimplemented_device("src", FSL_IMX7_SRC_ADDR, FSL_IMX7_SRC_SIZE);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->src), &error_abort);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->src), 0, FSL_IMX7_SRC_ADDR);
>
>      /*
>       * Watchdogs


> +#define DPRINTF(fmt, args...) \
> +    do { \
> +        if (DEBUG_IMX7_SRC) { \
> +            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX7_SRC, \
> +                                             __func__, ##args); \
> +        } \
> +    } while (0)

Please don't add DEBUG/DPRINTF macros in new code. Use
tracepoints instead.

> +#define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)

Please don't define new wrappers around extract32() and
friends. If you want to have something name based, use
FIELD_EX32() from hw/registerfields.h.

thanks
-- PMM
