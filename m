Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4780926lfa;
        Tue, 20 Oct 2020 06:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB9j6Dp4m+lLQfKbmlrLOXUrQmO8O09X3hChre/xevgnzZ+PFW9BNxPgBXjsp5r9vz3IxJ
X-Received: by 2002:a25:d46:: with SMTP id 67mr3775066ybn.360.1603199902561;
        Tue, 20 Oct 2020 06:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603199902; cv=none;
        d=google.com; s=arc-20160816;
        b=Hj4zbdpgTAbltls8NwNUmw4mVxjsWyzRQlEyVLyStlzR1+WmpENZH8a11bEZ8uAGJJ
         XrVE6nSy1IYJybPwo0CNxXFM8ALztNaXTA/IcBqFcI8KEDGpLUjE6nvsYA3jtfORjnGG
         0CBQpY6f+yKbfuclr5Oe4+is29MYA27oQyoUGDvbfyIINwd/UGdHauEA7MF72ulI80Ya
         65nmv+7djRqdr+Z6NUNcLPf2Q7KiFXCeIvGIxsVcxmGKku3IDEWNgHRobdh8MsqoWqwg
         gmix2UHfxUAJh8vtCvIV/DdQfQlSmN/Xdq3y/BRye+PLuA3q1g+x7iLsgH1t9WScmzay
         tG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pA5MaUprdCYMP2TXqV9bLGLaHfHeBjb6jUfhZDJX5J0=;
        b=n9cgp22ekDbm2dofJOKD000VAiRETBe2Ut0spZynGKJ3cRHm9tzyR3Lny9gb02jnF/
         oZdP2w2WFPywPstfG69nlEudTKo6g7KS6X6XesbNb20yxiGDJAg1ZgTh3Q/ZKvHL67sw
         X8SNdiWImX4mTUHT1hjq7e3tQNel+piHKprSz3+nAbSMo6WGob4mzuD5gt9zZk9mju0S
         Z58xOy3N7mGBdvNOlwXtit2XlT+PM4VlJFvC2oOai179WZ2+oiPzabr9zDoRma6wnaij
         PImQkGSQ9KxwZHL78kB88OxJ1dEtRJJ2mQiQL1hTrIXCkD842eRkJOEhwbwEsU7z9hP5
         3mKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rsirwy54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si1831587ybp.255.2020.10.20.06.18.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:18:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rsirwy54;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUrWv-00036R-SR
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUrMt-00064c-MJ
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 09:07:59 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:33893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUrMi-00067v-Jk
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 09:07:52 -0400
Received: by mail-ed1-x541.google.com with SMTP id x1so1782788eds.1
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2020 06:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pA5MaUprdCYMP2TXqV9bLGLaHfHeBjb6jUfhZDJX5J0=;
 b=Rsirwy54aP+qgqKmsrt6Ti+sZucPSA24DGVeSBs/kGyCzMxKSXpv+TZOrRKhXeugbU
 qNRzCf7AmiwP2tZnw5WwpyaN3X1Eo2Yd9doq/gSbY9PR1LZLe0Xr6gfpseAIrIPV90Bi
 01hUHOjP56RD7kwA9g2aMbI32Y319zF4ZDwde6qvhlrrpr+pIsQGjxANgKfAfNH2kwVa
 kExGncG+DyITBfC1YTI3vQNAfzKX+CKG8q2FR9V3GBa6QZOSXU2I4tTqNQOEznNCscGW
 CsxYhnFT81pKb2nePK1QidC6MWMjD0ILsHOvbmBvuhzAHc0wRwvoWzqV82/LecHs69bF
 unBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pA5MaUprdCYMP2TXqV9bLGLaHfHeBjb6jUfhZDJX5J0=;
 b=cPUEy4I2wIYQAEJU8cOFCkl5LUnM6OTjLXNWaWKoXUCQeDb2U9h/wx798uzDzlj6mr
 zW4XzjBL8BRcpr0vlgI91kBQN7JuA8QL28lpwH1/79r1G1YX/B9p3XHuspwFRwCZMLOJ
 VqcQFEwap5N3J69ytVyESTwK1GiepNyZksT6q6Qci2c/g9/u5ctLuBsrBjhYZtbmQvFc
 GE/1QmsWlXJ4pem8D4VuqMSUzDXlpCzrhBTARZE1S7b/mBwKfE8pS3bmf47a80+35N4w
 YpjUVSU1PN8zxKhbjd3AzlJn+nO+GBapICGAwtaSN+WDB6EuAdG+Vz8WwPHufTeVtJQT
 TQuQ==
X-Gm-Message-State: AOAM530jA86+cyeffjKOYoYW4Hb4YXeMvOw7E2ZHehASKjYRkPO6WNNh
 er4bPElAqnYDCUyeiYDd7pmT/hD31cqYPDM/xAN/cg==
X-Received: by 2002:aa7:c302:: with SMTP id l2mr2715286edq.204.1603199259672; 
 Tue, 20 Oct 2020 06:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201008232154.94221-1-hskinnemoen@google.com>
 <20201008232154.94221-7-hskinnemoen@google.com>
In-Reply-To: <20201008232154.94221-7-hskinnemoen@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 14:07:28 +0100
Message-ID: <CAFEAcA9hp+7puCWvZfCWBUQpFhQ+uoqtTkNno6D2AA9eTVHpGA@mail.gmail.com>
Subject: Re: [PATCH 6/6] hw/gpio: Add GPIO model for Nuvoton NPCM7xx
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RUwWeAtaWEY4

On Fri, 9 Oct 2020 at 00:22, Havard Skinnemoen <hskinnemoen@google.com> wrote:
>
> The NPCM7xx chips have multiple GPIO controllers that are mostly
> identical except for some minor differences like the reset values of
> some registers. Each controller controls up to 32 pins.
>
> Each individual pin is modeled as a pair of unnamed GPIOs -- one for
> emitting the actual pin state, and one for driving the pin externally.
> Like the nRF51 GPIO controller, a gpio level may be negative, which
> means the pin is not driven, or floating.
>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> +static void npcm7xx_gpio_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *reset = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    QEMU_BUILD_BUG_ON(NPCM7XX_GPIO_REGS_END > NPCM7XX_GPIO_NR_REGS);
> +
> +    dc->desc = "NPCM7xx GPIO Controller";
> +    reset->phases.enter = npcm7xx_gpio_enter_reset;
> +    reset->phases.hold = npcm7xx_gpio_hold_reset;
> +    device_class_set_props(dc, npcm7xx_gpio_properties);
> +}

Missing vmstate struct. Otherwise device looks good.

thanks
-- PMM
