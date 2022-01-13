Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp3125191lfj;
        Thu, 13 Jan 2022 03:52:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJHY+FRxG1u86EW7BTzaTBUKdIVvyIuddQa7/jvKYHycGN3ZD1NP6hQDQAhlfKDLSqXrCr
X-Received: by 2002:a5b:550:: with SMTP id r16mr5195974ybp.403.1642074741456;
        Thu, 13 Jan 2022 03:52:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642074741; cv=none;
        d=google.com; s=arc-20160816;
        b=swwx9ApbMwP8kBDk+mh8oEfclZ6D+IGbMkI4gv7UW/n6qQR7rMa/jDxKkbOIZZ4jqj
         pZjjANIpSytPPR/YRv0bbaptVUC4Qn72UmpxiO8da1Ehp8NeQz9XremuCoeWC7S29/HD
         HHqHENS+0sMKVxk7slx7tSYBC/XqKy0XB/jn4nC+Vn6VR5gT8GHVz4yu6IHnSnIfgnx5
         5tQ9uVobkGzJyYmEru6ZXZobzJ7wAqXZALKYgZybYfem7c4W6xif9SA/cfSu9RGVnfQS
         TVofniC5lUDR4cEDTLEfDFnna/BbJLgsgRW1707mgK8smkBcNsu+jc5ouqIl2Opp5wSR
         ylDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wBTofGQOkoCWqrBNZ3OLFG/KpQB8lzD81aXGusDirtI=;
        b=WWOo/4lxpihqrEin91+TukLVou58FO4HpCcPVilx7KXFuzbR5fFI34DNNRCMo+DpYU
         vOkyV+o1lGtPIbgQ3Li5Ke7HK45P9EUQOGgWHOJJVk8tx6n++3qI/wT2xWU5hBQjpGXN
         cniC4vCVdFuwZSLRZOAknrfE/PPYd0PufrGqk68ywEcSQD0RwA8l4pVcUCUhsVX9Z3jj
         v4QwE8UA05pT5KAGpXEZVJqIvN0HFiKGbwlF0PcBLFuwXgvixTH4OA3NS/NAwvvzpUcC
         Uc25Os4oYUpPH3UYNKP+7KUZ5s1RpJdqNXeSFBNzpNKgEZgDE5ptIHYnasArP7NULQhd
         QHxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BUk34Grp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si2110338ybg.696.2022.01.13.03.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jan 2022 03:52:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BUk34Grp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n7yeS-0001xL-RV
	for alex.bennee@linaro.org; Thu, 13 Jan 2022 06:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yWf-0006qq-BQ
 for qemu-arm@nongnu.org; Thu, 13 Jan 2022 06:44:17 -0500
Received: from [2a00:1450:4864:20::42f] (port=45912
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7yWZ-0003Ox-Ht
 for qemu-arm@nongnu.org; Thu, 13 Jan 2022 06:44:14 -0500
Received: by mail-wr1-x42f.google.com with SMTP id q8so9515189wra.12
 for <qemu-arm@nongnu.org>; Thu, 13 Jan 2022 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wBTofGQOkoCWqrBNZ3OLFG/KpQB8lzD81aXGusDirtI=;
 b=BUk34Grp3KXU7BKiBr9h2kNZWqh+MV2eFdUtQMETnM8nEwVblVYkqvUbFV1BbIJ2+C
 /SqOUXSkeNOEIXnk6td/eRii4rErgb2Y0G804wEP5Qi4CQS3DZ0lY0DJj1k2iR6V2pY5
 CEEQiw0bXmQ7J5XE8FR+J0rHGROutFlvJKll4W5a3diFSypUd3uuVeFvd6UNKp7icOMA
 LBBDM39shLDJGpHwF5E4nxXATxL4x6VnOyL2jnDvDCpOAYJIF+j4rNjgTUukFpIZ4AP0
 S26UQN5bcnE4XxCtJ93fm+UoGzCWamZjMWYzKfxtyGyjXOd9RBxiNllr1/XC2bqFPH8g
 /61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wBTofGQOkoCWqrBNZ3OLFG/KpQB8lzD81aXGusDirtI=;
 b=wQTFYQgWU23fod6QLVtiV6TZAh073Hh8PoqMnAZ9n1mXA90QCcUJ4lj9fFpIGCte+S
 nSDBaLDtug0lffDxo7tXxcaBhehS1jLN2bckShC1QROoqcaFIo9VcEn4ddP9fQGpGjZ+
 J3NHg7Gv4IPw5+y7SBiiSNNwh7yqYPkJ3wIBAfkeBzrTc1cDXw6Ip/ijaoZrJ/lARf1t
 PBOAcSLhngeb/BvXmxuUkkhykahccsxNzzBI2eVse+IlSrqexZOXSoVfeMT8Y+IKAtMN
 aNSl5h15BthmT8lnEBsW0DHaTyqc67lw0BuVQiWrZva3kFx1ac+W6v9JGoSqFBR4uym9
 kj+A==
X-Gm-Message-State: AOAM530wQLCinmbNS5UpbXyRoze26xlKLITEyA/AsVBlaQu+TTQ/aFZU
 JN3HP2+5Y7Y3zAjjts6WzSLCW0LXTDd77zJGWUieIg==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr3548573wri.295.1642074248579; 
 Thu, 13 Jan 2022 03:44:08 -0800 (PST)
MIME-Version: 1.0
References: <20220107222557.3812222-1-venture@google.com>
In-Reply-To: <20220107222557.3812222-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 11:43:57 +0000
Message-ID: <CAFEAcA_DgtLw_AfYsL-G+HiqBsN+DXfTTOFUi+kCDCqVBWp8KA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: add qtests for npcm7xx sdhci
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, Shengtan Mao <stmao@google.com>,
 qemu-devel@nongnu.org, hskinnemoen@google.com, Hao Wu <wuhaotsh@google.com>,
 kfting@nuvoton.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 Chris Rauer <crauer@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uau++Z7cQkIg

On Fri, 7 Jan 2022 at 22:32, Patrick Venture <venture@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> ---
>  tests/qtest/meson.build          |   1 +
>  tests/qtest/npcm7xx_sdhci-test.c | 201 +++++++++++++++++++++++++++++++
>  2 files changed, 202 insertions(+)
>  create mode 100644 tests/qtest/npcm7xx_sdhci-test.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 37e1eaa449..b406eba8f6 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -189,6 +189,7 @@ qtests_npcm7xx = \
>     'npcm7xx_gpio-test',
>     'npcm7xx_pwm-test',
>     'npcm7xx_rng-test',
> +   'npcm7xx_sdhci-test',
>     'npcm7xx_smbus-test',
>     'npcm7xx_timer-test',
>     'npcm7xx_watchdog_timer-test'] + \
> diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-test.c
> new file mode 100644
> index 0000000000..feb09b921a
> --- /dev/null
> +++ b/tests/qtest/npcm7xx_sdhci-test.c
> @@ -0,0 +1,201 @@
> +/*
> + * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller
> + *
> + * Copyright (c) 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sd/npcm7xx_sdhci.h"
> +
> +#include "libqos/libqtest.h"
> +#include "libqtest-single.h"
> +#include "libqos/sdhci-cmd.h"
> +
> +#define NPCM7XX_MMC_BA 0xF0842000
> +#define NPCM7XX_BLK_SIZE 512
> +#define NPCM7XX_TEST_IMAGE_SIZE (1 << 30)
> +
> +char *sd_path;
> +
> +static QTestState *setup_sd_card(void)
> +{
> +    QTestState *qts = qtest_initf(
> +        "-machine kudo-bmc "
> +        "-device sd-card,drive=drive0 "
> +        "-drive id=drive0,if=none,file=%s,format=raw,auto-read-only=off",
> +        sd_path);
> +
> +    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_SWRST, SDHC_RESET_ALL);
> +    qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_CLKCON,
> +                 SDHC_CLOCK_SDCLK_EN | SDHC_CLOCK_INT_STABLE |
> +                     SDHC_CLOCK_INT_EN);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_APP_CMD);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x41200000, 0, (41 << 8));
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_ALL_SEND_CID);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RELATIVE_ADDR);
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,
> +                   SDHC_SELECT_DESELECT_CARD);
> +
> +    return qts;
> +}
> +
> +static void write_sdread(QTestState *qts, const char *msg)
> +{
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message to sd */
> +    int fd = open(sd_path, O_WRONLY);
> +    int ret = write(fd, msg, len);

You're not checking that open() succeeded before using the fd
(similarly in a function later on).

-- PMM
