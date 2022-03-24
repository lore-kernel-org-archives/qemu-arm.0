Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3472104lfb;
        Thu, 24 Mar 2022 11:56:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzo2CvusOeS3YYPjkY0L5GjEfGXTUUUqVOJfk79qnvzU3kw2BlU5ewx8maTLqep1i++gzpB
X-Received: by 2002:ac8:5c84:0:b0:2e1:ceaa:d134 with SMTP id r4-20020ac85c84000000b002e1ceaad134mr5784239qta.247.1648148218857;
        Thu, 24 Mar 2022 11:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648148218; cv=none;
        d=google.com; s=arc-20160816;
        b=iR8fceZs2SjyeWMLF2QcQNi+oeRAyVuOZIpJw6azcW2HZ6NB03tnagOiDkfw0atdqC
         e1jdlpjbOJA9qvdoyY+70ikZIOp2TysxA2heZw8oebvULfJR8ZunUr8QV5+f/SS8+Glc
         QbdeqPmNN2c39TDknMNDkWvZ2lx6oCMt3iE772s0SHZ1MvPsvXmP/BsOM4wjE/6VA32B
         a3NZeUe15RvNC5PIii87L0dU2G+UUB6O4lgxOZDvH2RZIy/PToH7NqW+4c9uB/1UVYb5
         wlNWYFe8NpTvyc2GT6wTN1P13pcxDEXJKvfqXkjQq8wKbGkNEqO6auzrwd0SJYlrd52I
         lJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+nNX5PVqUaKMriNKsqTEKDYcnWC9Um6fex5Z0ZRMg2Q=;
        b=ttzUzkUA1aVlWjno8Hk5jc1Dm34AhuVTefoAZbfMpcmttQKfxJbUT/aHaQsiEpyoIU
         SjbzbC0By8j08Fj1gm70x98FNr3SuqaUwa+yQmxoGTMyQaVLuIikhbeCtVlo3l4Hf4JO
         4onOYXvIx5IJTPKA1dxi/S9QeVE5xGUA5NmJ61/v4ZlRjz9oCgCUfB4V5fxcjmRVl0Qh
         +qqI28VktriZkGS5ubB+bAvdzI/EodxH2qG1gpvnCmcTRqPusUFcShylfkjP6CYIETcY
         RWjZPFeE8Yc0bFjDwVQMDj5p9KPzz4pdAeTk8aFDS+Z8DQPnouHUIo5DL0Vv7imfdmk+
         7m3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xavnYDu3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y22-20020ac87096000000b002e1fbf3be7fsi26994qto.112.2022.03.24.11.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 11:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xavnYDu3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXSdm-0007ah-BK
	for alex.bennee@linaro.org; Thu, 24 Mar 2022 14:56:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXSdU-0007Ws-IY
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 14:56:40 -0400
Received: from [2607:f8b0:4864:20::1132] (port=38306
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXSdS-00028s-UL
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 14:56:40 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e592e700acso61065457b3.5
 for <qemu-arm@nongnu.org>; Thu, 24 Mar 2022 11:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+nNX5PVqUaKMriNKsqTEKDYcnWC9Um6fex5Z0ZRMg2Q=;
 b=xavnYDu30MNPMdj6EEhrKMXaP2Y5nOgAW8sbnBO4x1/YHa/CUAdIWDqXmub6+LZ7en
 1HHytxfr/1sNdSMeTinM0DdLw1P7Yo7jnF7LgDULuz6f4sLn84NhkkdPolFCUkzFxXvs
 /cEBtMECIF6v3kuHiuDUHocFCSa3HJ3wnDhoEcb08msf8AAb8hfk2SyJhgsojhbUKFEb
 NSvqRwNzKo0GRzzjzRDynTisvRo4oeEsCqonh9lcxPUhR0SYMfabJv0zLCVmfDxwQeWp
 eEHon+wzAW3JU18MrPWaxb9USKFlk97Bgr+iP2fwP8xwXd7teT5SRjZ3CKVqZ/EcHaC1
 gQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+nNX5PVqUaKMriNKsqTEKDYcnWC9Um6fex5Z0ZRMg2Q=;
 b=wQVDeGOtxRN4JxkoY+3sjyVvD8bYWEOGE5Hm+isHCLTf+vif79TDgbeJL9vICCUzhg
 gOijFRwZrF7GAQPtABSVpg3BZr5LcWAskmpXfDnEvtYXX3ONQhD+tlmWXHqngda8/gk2
 gFn3vFkPTCKm8/YWy44t7eFLkcHKe0odVWQr4GH7EbRPqpcuVlYRlIrWK5unP5n9EMD8
 vxUQYC4ozUN9DEJ92SlxY+7mG1jeFbaPSezx1IEsMjDu9djEiAsnzbaI/7amMuk2GX6e
 kTsB6Txkdowd8mqkVGO+HknSoyVa2ZFfDe/gEbZ0hw3GHPamIJJlBp3JboHZjosTJxn8
 KZVA==
X-Gm-Message-State: AOAM533//HW8M4rWmFy4nYGdp1NKiFU+ce5Mc2O9iVpFCX+WDdgjPKxs
 yLVwIJIqVxr3BTHpK8p+76d7z39W5KpAuF6PlTvCew==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr6496469ywb.257.1648148197651; Thu, 24 Mar
 2022 11:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
 <20220324171756.196654-4-zongyuan.li@smartx.com>
In-Reply-To: <20220324171756.196654-4-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 18:56:24 +0000
Message-ID: <CAFEAcA9GA79yUQj3i5MdLWK6+r3bDObKQS+8_bfx=47TKbLHJQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: woinJZH6QB4c

On Thu, 24 Mar 2022 at 17:18, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> ---
>  hw/arm/exynos4210.c           | 26 ++++++++++++
>  hw/intc/exynos4210_combiner.c | 79 +++++++++++++++++++++++++++--------
>  hw/intc/exynos4210_gic.c      | 36 ++++++++++++----
>  include/hw/arm/exynos4210.h   | 11 ++---
>  include/hw/core/split-irq.h   |  5 +--
>  5 files changed, 124 insertions(+), 33 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index 0299e81f85..10826706b2 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -288,6 +288,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
>      for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
>          sysbus_connect_irq(busdev, n, s->irqs.int_gic_irq[n]);
>      }
> +    // SplitIRQ for internal irq realized here
>      exynos4210_combiner_get_gpioin(&s->irqs, dev, 0);
>      sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
>
> @@ -299,6 +300,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
>      for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
>          sysbus_connect_irq(busdev, n, s->irqs.ext_gic_irq[n]);
>      }
> +    // SplitIRQ for external irq realized here
>      exynos4210_combiner_get_gpioin(&s->irqs, dev, 1);
>      sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);

This all looks very odd. I'll have a closer look at it later.

> diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
> index ff8852f407..eb485dd7a6 100644
> --- a/include/hw/core/split-irq.h
> +++ b/include/hw/core/split-irq.h
> @@ -42,9 +42,6 @@
>
>  #define MAX_SPLIT_LINES 16
>
> -
> -OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> -
>  struct SplitIRQ {
>      DeviceState parent_obj;
>
> @@ -52,4 +49,6 @@ struct SplitIRQ {
>      uint16_t num_lines;
>  };
>
> +OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
> +

What's this change for ?

thanks
-- PMM
