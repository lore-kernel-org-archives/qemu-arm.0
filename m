Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1137324ejb;
        Thu, 3 Aug 2023 08:48:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH+jb4Df5pEdcPHyEp8mAuYoD0BpIXyVneENBeWcgAmY9WJY1IN8JdkC3BgOgKQW0n2lbb5
X-Received: by 2002:a05:6358:9185:b0:135:4003:784d with SMTP id j5-20020a056358918500b001354003784dmr10234500rwa.20.1691077732028;
        Thu, 03 Aug 2023 08:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691077732; cv=none;
        d=google.com; s=arc-20160816;
        b=CXudZm9/jOohOpNkzN48YZZ9nQtCEt9MQHCKEM+jb339UxwQaXQKWzzLArQ4kn7PB4
         p20xKzKVzEOHErBoOAhJa5k0ScxWl5NIIEV0RCMBtB6i/cByPp5oeqLM8Mb5oWIzSk9D
         syYoqO6L60ryYTl4wHmACDLd/ujSvzsEecbXWREQLPmJ7LKC58zIaJcaqszQqTOEe5M3
         e6oU2u4SsteW1KPoUbSOJShVi0gLN7U5H71dxX0yRIDLUFpy6TT1OMGLZ+O0o/N0Ehb8
         D76L4shCtna2fgdpDaKzPXLDu5sbCv3H4IUDdtgXwW8K0CSGsMoN023ObRqoqjxe8ugh
         y2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oejRUpYx72UgLnW62FCu4THu1bceCcihCNNC2+sRW6c=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=prymfpAS1+z+pC1tzHX5SS6GgKQGR4N0nvEa7FmvkQUhWOYW5AX1yVH/nkHKOH886Z
         Y8zTCcluY+9Y1fQTXozavpt/syH5ohCpgulnYvtrAHATc6K9+KNRcDyLFpnNMHZYmGCy
         nLTB1G8wgjLwrB1cj8CzOUIyveKJTPXKd4WHby7kpIcdiyGAGYu8BXuVhGJR/GQbd6ip
         vInH/opD9tp4RvHPwlQtWxZubMsBDyMc4QnVp6Knp2m+SJHclf8iUl9OJ1GOnhC4eHwz
         0MrqFYBF5ovNX7/GmO3T7gpPcJ1gRSmZxC4kSMiOCtaXZugGQR7vc5OCtPO4ZHH8Kqoo
         9Zxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p69jfSb+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020a0cf189000000b0063d4cfb4d53si7586044qvl.438.2023.08.03.08.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 08:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p69jfSb+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRaZ9-0000HK-RY; Thu, 03 Aug 2023 11:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRaZ6-0000F0-3N
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 11:48:40 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRaZ4-0002IM-6Q
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 11:48:39 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52307552b03so1493021a12.0
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691077715; x=1691682515;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oejRUpYx72UgLnW62FCu4THu1bceCcihCNNC2+sRW6c=;
 b=p69jfSb+A0CUVWPbRzCzxoBVlJU4KViRyouw52FKwADDxjf5DTtH4NjHJMx466KJQF
 bxpgmQLiVXo5f2q/NEVWPIe01HK8C00PkW+CryhooqXxsOqhZKUI9bFuOZXRiweCc4QV
 U67csSTMUhz674tdmlZGgqPR/IMLKSPNLvF89k8ClE9IP8ud9C9Ozq5xVluFzB3ald+v
 fe/6kej8t+ZHDu+83hXRQwQqcWS3VwnBAfSdisrtMy/1nlME8AfUip2IFwIGZMfYC4L3
 9qFHO17G/1VQa3J7MCOXI+nSS3CszpSIsawbhStqxfFcztF9fGw+HdlNs6SJ2kVO65E6
 Z3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691077715; x=1691682515;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oejRUpYx72UgLnW62FCu4THu1bceCcihCNNC2+sRW6c=;
 b=f5FZUbKhlyl+SzcC2WNvRuX3Sea94x0tX2fNB9Mw9iXjkv/xJylGvLwUP4tjJ9yGup
 FPcK9cuMoC2K/wfA0P+a4ZgueCHoNc5wgKKRSrG3Io6xUADLX6wpjywXZyYhfJLCvRUj
 96pyBYSL65Bn+QOfK90J5VBqw7dm0g6hPlDlE1fmxXoEaf3V4sICkVMK8IigBd/Q8/ko
 2RgSo5mwnBwEI3haHRw00Dfm+VmezSkTQQXTepSRlWq+LudUJ8lB4694bJ5boveoH/Oi
 BgSEGvCWMOo2MxXrxi81wzxBnTg5NMHaQFekq7nvtYkfa0Sbno1G8irWo5Qvcp+kMmkY
 1oEQ==
X-Gm-Message-State: ABy/qLb5cbFOUehzrxPlsYqgr/og7KDW/g00JM4HQZlRZy9x1mN2i2nq
 pnQEMWuv/oETDgSdn9jVpnlriqTNLXV6AiiXwfJ75Q==
X-Received: by 2002:a05:6402:1859:b0:51b:c714:a2a1 with SMTP id
 v25-20020a056402185900b0051bc714a2a1mr8777155edy.7.1691077715479; Thu, 03 Aug
 2023 08:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20230726132512.149618-2-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-2-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Aug 2023 16:48:24 +0100
Message-ID: <CAFEAcA9Q6N38ScEj26EYBCQH9PYrQjOgxQ3iNYNbZ5HArceYcA@mail.gmail.com>
Subject: Re: [PATCH 01/44] Split out common part of BCM283X classes
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: Wd6o3zKqnUJs

On Wed, 26 Jul 2023 at 14:43, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2836.c         | 102 ++++++++++++++++++++++-----------------
>  hw/arm/raspi.c           |   2 +-
>  include/hw/arm/bcm2836.h |  26 +++++++++-
>  3 files changed, 83 insertions(+), 47 deletions(-)

> @@ -230,11 +238,17 @@ static const TypeInfo bcm283x_types[] = {
>  #endif
>      }, {
>          .name           = TYPE_BCM283X,
> -        .parent         = TYPE_DEVICE,
> +        .parent         = TYPE_BCM283X_BASE,
>          .instance_size  = sizeof(BCM283XState),
> -        .instance_init  = bcm2836_init,
> -        .class_size     = sizeof(BCM283XClass),
> -        .class_init     = bcm283x_class_init,
> +        .instance_init  = bcm283x_init,
> +        .abstract       = true,
> +    }, {
> +        .name           = TYPE_BCM283X_BASE,
> +        .parent         = TYPE_DEVICE,
> +        .instance_size  = sizeof(BCM283XBaseState),
> +        .instance_init  = bcm283x_base_init,
> +        .class_size     = sizeof(BCM283XBaseClass),
> +        .class_init     = bcm283x_base_class_init,
>          .abstract       = true,
>      }
>  };
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> +
> +struct BCM283XBaseClass {
> +    /*< private >*/
> +    DeviceClass parent_class;
> +    /*< public >*/
> +    const char *name;
> +    const char *cpu_type;
> +    unsigned core_count;
> +    hwaddr peri_base; /* Peripheral base address seen by the CPU */
> +    hwaddr ctrl_base; /* Interrupt controller and mailboxes etc. */
> +    int clusterid;
> +};
> +
> +struct BCM283XState {
> +    /*< private >*/
> +    BCM283XBaseState parent_obj;
> +    /*< public >*/
>      BCM2835PeripheralState peripherals;
>  };
>

This gives us a slightly odd class hierarchy where we have
two "common between bcmxxxx SoCs" types:

   TYPE_BCM283X_BASE --> TYPE_BCM283X --> TYPE_BCM2835
                     |                |-> TYPE_BCM2836
                     |                \-> TYPE_BCM2837
                     \-> TYPE_BCM2838

The only thing TYPE_BCM283X seems to be doing here that
TYPE_BCM283X_BASE is not is handling the BCM2835PeripheralState
object. Would it be clearer to keep the existing
class hierarchy where everything inherits from
TYPE_BCM283X, and accept a little code duplication for
the 3 subclasses that use the same BCM2835PeripheralState?
I'm not sure...

thanks
-- PMM
