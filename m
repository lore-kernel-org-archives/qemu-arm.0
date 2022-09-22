Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp269105ejy;
        Thu, 22 Sep 2022 06:02:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6LSh3d6hRadb29RdUpWBM7Jn8wEGZ3m4qEAbA8OqX6mwhEM0XaZdinV1o1nJxOFZH/Nhgo
X-Received: by 2002:a37:de14:0:b0:6bc:3cc0:cfe6 with SMTP id h20-20020a37de14000000b006bc3cc0cfe6mr1989810qkj.118.1663851753584;
        Thu, 22 Sep 2022 06:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663851753; cv=none;
        d=google.com; s=arc-20160816;
        b=qCUvQkv+I9mXrAsLr/xhuBxJ6hLfUcMi2Na+vm3JgQ5hFJMDq58w/e3cf3Ahy2bo8R
         Roht2Im3pt4qwYqNwfN3jgp8kNZMlO1mBaEmqBor+Jda9w3epfH1xJdLs3hPwMmuhzPn
         mzJqxV3XRXkTWq520f+jEqoUtDOOT9cB1Jl2U569GAXV/332gnGa74TjL8lwzPddr/MZ
         0wc4QcDmhtCUDpbV2pJwO9MGEeNHQDi6zGN3qXV2UTXpQOZHeo6rsdlaQr3+vBzCGk3H
         kwARzdIA3EpscU2+dj/hvlOMHW+4AYD0JGlqCwfV9TSI3S+8RrofTD5NOjtnInWfBokN
         33eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0q9R07i5Sf4SavsDCISXjgvDiaafwv+KXh2/V0r/Qi4=;
        b=TRbK+jRaSPnUGRbEiQw6iNhiv5Q+xd21d69Y+88xWHlDcUinUaknndhPHSaCU6tuMJ
         HRKD7gQiy0Nsl/hZ3hd2uqqHR/UdDJg+n7mwjSU6jTHZ+f0/+/xTVhFToreworIyBlDe
         elkA3gguQPk4fJ58wb0ci7ZgiZ6CyqW/uiEhricL43fU/yy7MPC3U5Rw/x8bD4ZrlIKc
         VhkfFOonS1/YaKLMUlfICkNpWXcWiL7YBh3HfI/kBFhlwr708Ivjj2FvLMr+GQ9hyyH7
         HzYGB+Dok3qZ2A/wWpEIIdPd8nmGXxFK7vmmCqYR9iFLRseIVAbMaTLLbUR0005rhCbO
         3YlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TZCZRhaJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt5-20020ac86905000000b00342fb840c7bsi3125000qtb.99.2022.09.22.06.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Sep 2022 06:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TZCZRhaJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1obLqb-0004Wj-1C
	for alex.bennee@linaro.org; Thu, 22 Sep 2022 09:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obLRF-0003yA-IX
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:36:24 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obLRB-000601-Ax
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 08:36:21 -0400
Received: by mail-ej1-x629.google.com with SMTP id dv25so20616980ejb.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 05:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=0q9R07i5Sf4SavsDCISXjgvDiaafwv+KXh2/V0r/Qi4=;
 b=TZCZRhaJCdKJSfGq8K2G/GgQoX1ITX0BMrfal5a7EfzuTdPkT0krxPqg90SYWk5DtX
 Jz2Fvo5blFnSNPJNJYJGl3dCJ48j5vzTbllPLeGEwuv1lYXFskj2Pk7DQfcfWDkw6COw
 21KQh8j8RAoq1wIagfTuAuZYD0LVoU6g1vO5UJIU04ND0F2aozi04AiyTvnoNSbu8WNj
 R7MeFCVLYJfdvjWu4mZVps4GxCR/YRs63J7ZHGmSmfQJ/Gqc+X5MqViJ3uf/mE71j4Tr
 7/iQYcbnTzxznyU8EUY53XvwUGagwKFiwIuG+DHMneu5lvt/LDlMVh66k6ryU5DI6OtN
 fWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0q9R07i5Sf4SavsDCISXjgvDiaafwv+KXh2/V0r/Qi4=;
 b=mGTw7vNLKH3Em9Ppev58eXqAiQ4RvHlM8qqjz4tvZ0pmDQmK3qvHgeO69UzN17cxwH
 YB9uiaBuwQgj/mdC5JmXpaiLPpboXd/lpJk33oTT9PLH1GQGkJFmztREdHrhFU8tvg5b
 HCYRyfNaHWAW+JdBWIl6xiNx/8zxeGIRCwAm+x6eN9SoUf/AOhQUNKG8KZixOEJTazve
 rQIm1Kdyuk0nN274BbK5ziqD0eBQFxsA6W4bCuc5HvViNnuv/mxkDEo/BYo/bHJZ9k+o
 1Ueh4buT6YNcfAb40SQYdg1t+ZjV7gEsCoVXhZSXZUw5E3ppUwJXZJ5+NoHX1Zx62AX2
 YU/w==
X-Gm-Message-State: ACrzQf3DTlXZoJQ50gqndRtSf/OB316RvurRTahYRc5n8hEl+GKMq+uP
 dKaBTxQd4ZaaS/bvXngcyTkoBcPtIfglKXmG+nBIbg==
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr2531275ejc.504.1663850120272; Thu, 22
 Sep 2022 05:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
In-Reply-To: <20220921234646.949273-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 13:35:09 +0100
Message-ID: <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZZh3PNsfLaN+

On Thu, 22 Sept 2022 at 00:47, Patrick Venture <venture@google.com> wrote:
>
> The MAC address set from Qemu wasn't being saved into the register space.
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>

> @@ -112,6 +115,18 @@ static void emc_reset(NPCM7xxEMCState *emc)
>
>      emc->tx_active = false;
>      emc->rx_active = false;
> +
> +    /* Set the MAC address in the register space. */
> +    uint32_t value = (emc->conf.macaddr.a[0] << 24) |
> +        (emc->conf.macaddr.a[1] << 16) |
> +        (emc->conf.macaddr.a[2] << 8) |
> +        emc->conf.macaddr.a[3];
> +    npcm7xx_emc_write(emc, REG_CAMM_BASE * sizeof(uint32_t), value,
> +                      sizeof(uint32_t));
> +
> +    value = (emc->conf.macaddr.a[4] << 24) | (emc->conf.macaddr.a[5] << 16);
> +    npcm7xx_emc_write(emc, REG_CAML_BASE * sizeof(uint32_t), value,
> +                      sizeof(uint32_t));

If I understand correctly, the issue here is that emc->regs[REG_CAMM_BASE]
and emc->regs[REG_CAML_BASE] aren't being reset correctly. If so,
I think the better approach is to simply reset them here, without
going through the register-write function, the same way we already
do for the handful of other registers which have non-zero reset values.
That's the way other devices seem to do it.

A question to which I don't know the answer: if the guest writes to
the device to change the MAC address, should that persist across
reset, or should reset revert the device to the original MAC address
as specified by the user on the command line or whatever ? At the
moment you have the former behaviour (and end up storing the MAC
address in two places as a result -- it would be neater to either
keep it in only one place, or else have emc->regs[] be the current
programmed MAC address and emc->conf.macaddr the value to reset to).

I'm not sure we're consistent between device models about that,
eg the e1000 seems to reset to the initial MAC addr, but the
imx_fec keeps the guest-set value over resets. Jason, is there
a recommended "right way" to handle guest-programmable MAC addresses
over device reset ?

thanks
-- PMM
