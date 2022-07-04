Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3231016lft;
        Mon, 4 Jul 2022 06:31:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoqWGTIKG1srKCvrtGo0KzP1IQDc8oDAZZ/tR1NGXVjVi5RVhhgkpzn5jIMRL3v7oF025y
X-Received: by 2002:a1f:1886:0:b0:36c:c60b:a4ef with SMTP id 128-20020a1f1886000000b0036cc60ba4efmr16441310vky.29.1656941484005;
        Mon, 04 Jul 2022 06:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656941484; cv=none;
        d=google.com; s=arc-20160816;
        b=pFxwR/qdTgJoOkU5D4tCtf0CggVzpNfiPFos5R6mP4eU2x/GbHU0uP0HHFOtbqLVjG
         gxA82iYbb4sHEEOLF8VyXTbP6+/LiddX/gdTRm5XKL8mYxQqBEdDwssM6g741Sz2dpAy
         DxpU0w2ndxw5eaPjTdK6YH8+SA0gi19vNl9J3sIigjAFMW0jnCe80YVlMiJ0iIfXwYoj
         sjuBqhdj+I8cYVFPSS0uT7YKgSy8rV4U88I2lyYV73LQgCUP5pt2eBRRhH2eC/eUdCs+
         kvmFswk5lBYrfVCWvc9EdN+Vn3OvUdC1XfpbArzzHg2ujmijYDtvuYKVWWnA/GQiWbK3
         JlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GSSXv2GOnwa3fwGxpHk6zrjPE8keTcYvcStfpJXPqE4=;
        b=onMLfxKZQqGlHc6tdZl2UHwVRYTCtevoCoq+zNcyxCgtoBlltFMEZiFl3wf3IFfZpC
         LFNE8Viz9KRtj/GekXMlvZYVKu5E142hMXAFv3ZbPfHXJM7e3CNx0KwTgTCKjPA36f2I
         Z/K7f1++3Ev17GQQi7HBnMBpAe2jWmfYCnIDppOdZJdfOUZkqzkHBmcYrA2F82CZ9hvY
         Xt0iIZa7jH7/5d/3v/m6VfEFrjntx9a/9BxmA1WxDlx9DBtUmkxLSJiIVxBgPKYheg27
         +rT/2de3md3tV9Ewj5fCryyHU0sfuUCF8iipimxucqRHHPRPZLau/iY5YNB2baTdQSUz
         9Ssw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LLPeKOvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s189-20020a675ec6000000b0034baaf7a6b2si8110559vsb.310.2022.07.04.06.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LLPeKOvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MAd-00031A-8v
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lt4-0006Ex-3Z
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:13:14 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lt1-0001ai-JH
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:13:13 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31c89653790so30784867b3.13
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GSSXv2GOnwa3fwGxpHk6zrjPE8keTcYvcStfpJXPqE4=;
 b=LLPeKOvQQuJ5Yb704tOZJ9+n5Q1bNnmqGOUVx64Paep5ZC1hqWAj/iAhitI7lrnlBj
 N9lKPgHE4hKZl3fOH/pvy/tEeSdtR3TgAZTfxUtPeW4jEwRDINGovmiWEC5h3KtxPxGQ
 snROSSQ2HYu7StpmYOc+UVbs08ZuF/c/l/7wieUvEGo0i7jNIbkVB6tXXyHXZJLYN1J8
 k5xVbraUovaA1uP36WgUbIDQ3fv5TNsEEEBAf+rc3D3bvD/0OP2tVE+VoHwiJGHiTyOs
 1j0u0+6H+MjO2rHvfBbUA03gF46BdmolPwR5M34hPckapdnEKRjX/3SRqEsIPMSCTxaX
 4sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GSSXv2GOnwa3fwGxpHk6zrjPE8keTcYvcStfpJXPqE4=;
 b=icGIi9EaE9E0atqdvE1jFqM4FV1FiQ1AS9k5bFM4xK9QTUqbCuUdfcBhzyy+mW3jsg
 KXKCSnVB9PBKcFOVb4020dcnfMqrwKv6eOqRmicZjBYXsZh8UOIvFo/YWWbKNHvwTBZ4
 GOFVJdQekCj/aoBBTEmNkUQ+nbKcxeOp42YBScTgd1Y3zxmhFMPcBvmp663RiIIMg+iv
 b+gkWFhU6kge3lA+R4s+qlnpAxsdO9aLt4+9WTS0bzilOqN8ZlOt+oC9mOIm19geBqdb
 2nxJ+pGZ+aQVTsg1GwH+O0vfr/SYu0/m4+bKWSjdYQ9OncQ/iRNLKkUuoHJBXrwOS0P6
 Xo2Q==
X-Gm-Message-State: AJIora8vxG6GshBjWWC0WXSzBMsST+lCMgJwS6vn4mKV5FrNCFmUOkPf
 Xo4h5Ghk2emxtdlHFH59sogP4RCaaKv7rdL9enplOw==
X-Received: by 2002:a0d:ca4b:0:b0:31b:7e6a:b77a with SMTP id
 m72-20020a0dca4b000000b0031b7e6ab77amr34074213ywd.347.1656940390402; Mon, 04
 Jul 2022 06:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-3-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-3-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:12:59 +0100
Message-ID: <CAFEAcA9SV8B5at9G2wLScgANQanQnBR=QtRGTcVviOTcBRA7JA@mail.gmail.com>
Subject: Re: [PATCH 02/40] pl050: rename pl050_keyboard_init() to
 pl050_kbd_init()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4zD3GIEkeNBB

On Wed, 29 Jun 2022 at 13:40, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This is for consistency with all of the other devices that use the PS2 keyboard
> device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pl050.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/input/pl050.c b/hw/input/pl050.c
> index c7980b6ed7..8e32b8ed46 100644
> --- a/hw/input/pl050.c
> +++ b/hw/input/pl050.c
> @@ -166,7 +166,7 @@ static void pl050_realize(DeviceState *dev, Error **errp)
>                            qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
>  }
>
> -static void pl050_keyboard_init(Object *obj)
> +static void pl050_kbd_init(Object *obj)
>  {
>      PL050State *s = PL050(obj);
>
> @@ -183,7 +183,7 @@ static void pl050_mouse_init(Object *obj)
>  static const TypeInfo pl050_kbd_info = {
>      .name          = "pl050_keyboard",
>      .parent        = TYPE_PL050,
> -    .instance_init = pl050_keyboard_init,
> +    .instance_init = pl050_kbd_init,
>  };

It's a static function so the name doesn't matter much, but
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
