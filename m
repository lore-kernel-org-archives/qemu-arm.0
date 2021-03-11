Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp229027lfg;
        Thu, 11 Mar 2021 04:09:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsUHIXmJQVXNhaw27kdA/hKPomnqr2NtdUBxEA5jGIdVgPGFxMzmgE1c4ya6KFqLlbNAKD
X-Received: by 2002:a5d:8493:: with SMTP id t19mr6250201iom.28.1615464559213;
        Thu, 11 Mar 2021 04:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615464559; cv=none;
        d=google.com; s=arc-20160816;
        b=HFe9mEQYbh7XonaAPHgHocQO54sdn6Hevmy3qQXOq6BrWt16RLTQEDAsci6pxN0xwp
         nbnTyGl1Wt7YwXc/CriR7RcxnmXCnuBJm/uBNiwqW5w7EqCkptx5S0IyPJ8RYlxiTvGd
         wkK40TjnYbrRfdDf4JiWk/SsjPJ75iiKVGNoTDboXB3q1NGduQEUb6rD8UAAbJXjlXMg
         076l/hRgJDe8Lq056XPzOfWnzWCHgokK4lLXY1UIxeB72D2ckW0H+Pv6gR9oVYubLovA
         BurVPUWI56VYRYa5AiM9hILP09Agsm3AZaD2tp5bVCb8UroW4RnQKsxK39BdNPDszPgi
         F7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GUv/k0ojAsaGUDmDHU9JsLpEK89ntt/ZoFGbNC1QYcY=;
        b=q1n/aU8lD8X1ihTzVaa31TmArFKd8YYCyl/Kc/N6zpmVH3eiKiKk+3R3U9/6uVetvw
         RL++6FuLa0/gfKepDzvb0e0S/03CG0d5gphkgVfF2e8NLlWNv3LvsS1IU5PkpbtbmiUZ
         lqKcqpKvR+aAH57hotqX5ShIrgp0F6XS1pjbnCzD0eYsYzKmpc2M51OAzTa698qVxvIe
         SsEtq4BZ0YgkHg5M6z4re+05zhk3xYhZb+LJHPCr/3entsqaP7bpvDfTeDdJ54BCayNt
         LO6V934bDOjKNGJxEz4lVKenuIzDm+9H841eVc/iupF0v2BeKSsErgfb4pmRPFGjQ181
         wrFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OrDs9Psf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r25si2509537iog.48.2021.03.11.04.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 04:09:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OrDs9Psf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKK7y-0006Ak-BL
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 07:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK7l-0006A5-01
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 07:09:05 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKK7j-0007FY-Fx
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 07:09:04 -0500
Received: by mail-ej1-x636.google.com with SMTP id bm21so45718221ejb.4
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 04:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GUv/k0ojAsaGUDmDHU9JsLpEK89ntt/ZoFGbNC1QYcY=;
 b=OrDs9Psf6nVOhM0WVWXYK98qxm1CzssDb0RTMa3IjRXA1BXsx1g29oXpPAzRqP9g7W
 o+7F3tanP2qv7MUeywwD+PS0nr11cu0yLZegrIGNC3+Q5mQJQg76h6SPZokISHdhthpi
 PJRVEWHWoOD3HQwMPfu+gHRe3N236u0cQW1QzCv4k1aFWEcqZ6TYuJwthV0w2hiawLIC
 sgsdVswDQEFuj1S9yEoe4S0sY8BiTP0i+JQKW4xtI6CzebsHd3N/RO+sKRCFadvXs+74
 9WjvKc8+U6RPTvbVgMNaI4gO0LaXVgDmgtdbspsYUzSfQdHxs6rXRsuxDWGx/vJm7cE0
 TTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GUv/k0ojAsaGUDmDHU9JsLpEK89ntt/ZoFGbNC1QYcY=;
 b=fKxoVPA42mB8Y28e6HlzMGXw2LU0kTDHxf0cgLCWC0qGWmMufbvTBGgdbeEnlbaHgI
 ocqYmFltBKWijgZyiAAhZpY75ZhzxMfHM6zRKBU1VLhQzI1sxNFzSa3KNMh7CD+58Ov4
 JjlUNMYBUNH82AyerZs1PrwKWLn+0JPjQylAF9EswIhF633WAlMj5Eipmd8q2pKirecj
 GxAhLm2RBVwDVpN1LmakQFlZGr5YQGDISuuJVCXlRujD8XNBYdxPGkfG5YMRNdrKtgfp
 wEeNA9OaUA7mHKo6iwM3ciPJ6wgo9EKycNRewIMH2pUrM5imEUziKKqGx6CrkZwWrmct
 6j5g==
X-Gm-Message-State: AOAM531/U5OIgdZ+5KTyWDJt5o5IOTUyN9wamx8pYeRubmKONMXxfCsh
 A8/cvGDLCdEP59oIdCiDMXjzZ0aIYQYYlp4vxyKwmA==
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr2835455ejb.56.1615464541849; 
 Thu, 11 Mar 2021 04:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20210305183857.3120188-1-wuhaotsh@google.com>
 <20210305183857.3120188-4-wuhaotsh@google.com>
In-Reply-To: <20210305183857.3120188-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 12:08:43 +0000
Message-ID: <CAFEAcA-NqB8ngBVqSeF_pNH_-J6rn5nGaQw9zazFn2rTBtnJGQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Connect PWM fans in NPCM7XX boards
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEKwMU9sALp3

On Fri, 5 Mar 2021 at 18:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch adds fan_splitters (split IRQs) in NPCM7XX boards. Each fan
> splitter corresponds to 1 PWM output and can connect to multiple fan
> inputs (MFT devices).
> In NPCM7XX boards(NPCM750 EVB and Quanta GSJ boards), we initializes
> these splitters and connect them to their corresponding modules
> according their specific device trees.
>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/arm/npcm7xx_boards.c  | 99 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/npcm7xx.h | 11 ++++-
>  2 files changed, 109 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index fbf6ce8e02..e22fe4bf8f 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -21,6 +21,7 @@
>  #include "hw/core/cpu.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/loader.h"
> +#include "hw/qdev-core.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> @@ -116,6 +117,64 @@ static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
>      i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
>  }
>
> +static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
> +                                      NPCM7xxState *soc, const int *fan_counts)
> +{
> +    SplitIRQ *splitters = machine->fan_splitter;
> +
> +    /*
> +     * PWM 0~3 belong to module 0 output 0~3.
> +     * PWM 4~7 belong to module 1 output 0~3.
> +     */
> +    for (int i = 0; i < NPCM7XX_NR_PWM_MODULES; ++i) {
> +        for (int j = 0; j < NPCM7XX_PWM_PER_MODULE; ++j) {
> +            int splitter_no = i * NPCM7XX_PWM_PER_MODULE + j;
> +            DeviceState *splitter;
> +
> +            if (fan_counts[splitter_no] < 1) {
> +                continue;
> +            }
> +            object_initialize_child(OBJECT(machine), "fan-splitter[*]",
> +                                    &splitters[splitter_no], TYPE_SPLIT_IRQ);
> +            splitter = DEVICE(&splitters[splitter_no]);
> +            qdev_prop_set_uint16(splitter, "num-lines",
> +                                 fan_counts[splitter_no]);
> +            qdev_realize(splitter, NULL, &error_abort);
> +            qdev_connect_gpio_out_named(DEVICE(&soc->pwm[i]), "duty-gpio-out",
> +                                        j, qdev_get_gpio_in(splitter, 0));

This will rather pointlessly create a splitter with a single input
if fan_counts[n] is 1, but conveniently you never actually do
that, so it's not a big deal.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
