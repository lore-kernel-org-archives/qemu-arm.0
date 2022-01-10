Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp993648lfj;
        Mon, 10 Jan 2022 08:40:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCYR/PzOBgNZdpXD7BDplbJSSuDEfh0n9No8jhQFC9hAmb9Y1Dt+dEnLxN/0t6xGZPp/G+
X-Received: by 2002:a5d:9f01:: with SMTP id q1mr182574iot.144.1641832800508;
        Mon, 10 Jan 2022 08:40:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641832800; cv=none;
        d=google.com; s=arc-20160816;
        b=XQZWN00YHg8PlBVgPEre9z3bqc+adxTW1K6j/a62L1b92/f7LoeImG3KF+f95YyiH5
         zIuO1kX5qlu5yhJxawF5k4UvG+Ex/iOw/EaY75SOSnllgKtnrwzsC+N7TUYXBR/nyUq+
         S3wiElCc8TFc1Q3G+wOpM076vNbJqXxHk/T5udR+Cg4l9FSwlaMKTshHIptfqBQdJ3jW
         0TWQpEKcRnfIfKAcFstE07YZSKvqNuWdmJ5HRB6lEAfehxtsfqOpChg2GnYjhQJjpm/f
         kZVWKh3xKZvP44uVvEcRyrA4gTIR6MsRkjH6YrdPwGkVWtZ29avVGZu6fZfoGg3qVTsd
         OSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YEh704cnYXU0k39Th+oY5ryorq16tiSek51kh1US8Xk=;
        b=ig2Hrc0JjCQNJKonSFH/RVCCJfQwKJn8iAG1jVB+R9vVhUHKgJw/rtau65Low3pWNW
         ucgDSLdsgOh14+SPCntddEiS6XoFJYoyoQc5/a91FzOCEvYqwv39243GbwHsI/k/egq0
         Bie7S6LU3JfSoyk2dG7VDs2sp2YSgSJ2QlkVNuxAoxrPB68EY+BbbinoUN1cCLTJXrkI
         T4nlMS/1q0O1ct52gbHSsPS5o6qZ49vbdFvgw7Y/kR1SfbBPdsAW1iNoppX2NBep7rTW
         VBhNKadyhbvbcoUbYE1Rub9w3st7g955uZq9LsfrLGOcdloZpjalLmcG0s7wLA3ypJzo
         oKnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ZSbDqQWE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si3145656ilh.16.2022.01.10.08.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jan 2022 08:40:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ZSbDqQWE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n6xiB-0001d8-Ng
	for alex.bennee@linaro.org; Mon, 10 Jan 2022 11:39:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n6xhd-0001cP-2w
 for qemu-arm@nongnu.org; Mon, 10 Jan 2022 11:39:25 -0500
Received: from [2607:f8b0:4864:20::92e] (port=38581
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n6xha-0002IE-M7
 for qemu-arm@nongnu.org; Mon, 10 Jan 2022 11:39:24 -0500
Received: by mail-ua1-x92e.google.com with SMTP id h11so2562926uar.5
 for <qemu-arm@nongnu.org>; Mon, 10 Jan 2022 08:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YEh704cnYXU0k39Th+oY5ryorq16tiSek51kh1US8Xk=;
 b=ZSbDqQWEMIIzJljcWWoVsOtX2z/uFEZW47txNk1HUcnVgdTdYF1CncB16Ch6HcA2WI
 GoHXM1cdQ+SddRvHImQ4/yXytvlZAWwL6nKGTRwKOfv8evhApHS6GmEtipGze3q3r2qO
 44+7AKwVIRz10DC/kL1IjK8WMGVrGB/Lqq/eE9ayHVkwDBkGQwi87lPHRckCyUvv7g/f
 aHgUiq004/xLnXIwvo8MjljYpEo7z6Ha3QGgmQR1wsq9kz70i5TSMXFjtigq+Wmhww+o
 EVej4F/cj1r55S9mJLzPuZHZv+HyR1tHh6lxnEttYTGXYPQHaABFAexqn+EdMUovv9t+
 m3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YEh704cnYXU0k39Th+oY5ryorq16tiSek51kh1US8Xk=;
 b=QYjm5ECA62ve/iKQLzrscXUGB5RjKtGQUNBFaJfZ0fZwybdWCm4C9wcURuEu9+cODO
 tNTEQw/I11Vbmx7HVCng0gwoFFJ8+B7xCK/6sLhVEQRV8e7MnmLOQNg4+da1MQQ7864X
 AW7GXrwUAMLZyXWtyh9atnJDaCB/GFsnztRPb5sX6AqU+7YoDzis5ZDZnrs89cMPI8AD
 oFWEsiRRs8V70rqcQwmi3tFC7zmOkxpQ8iyfb1GbXf4Wq6NrmIKrKMEpKNf0jOKj3+U0
 aUlFVMoaPSP23hMWdTDfrqvo2gj2IYCvm+wdSzOi3trbZPFyxmrofRCGzRXKABtXFKar
 VKyA==
X-Gm-Message-State: AOAM531O0ncYDrjfRRyNZ+9EyWyfgEvoi/RrGxKmnk1f6hdshZykoDqQ
 oAlhW7sRhsLX34x5JPvsbS8JMyvh5k/6hIA2fO4KZQ==
X-Received: by 2002:a67:f6d9:: with SMTP id v25mr209137vso.36.1641832754889;
 Mon, 10 Jan 2022 08:39:14 -0800 (PST)
MIME-Version: 1.0
References: <20220107222557.3812222-1-venture@google.com>
In-Reply-To: <20220107222557.3812222-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Jan 2022 08:39:03 -0800
Message-ID: <CAO=notwibHrbxCVXH5vLVaVHmR=xNjqomPPusFa3uWYTXjDKcA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: add qtests for npcm7xx sdhci
To: Thomas Huth <thuth@redhat.com>, lvivier@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Shengtan Mao <stmao@google.com>, Hao Wu <wuhaotsh@google.com>,
 Chris Rauer <crauer@google.com>
Content-Type: multipart/alternative; boundary="000000000000233f4205d53cfab8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=venture@google.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
X-TUID: +scvd1jR6NH/

--000000000000233f4205d53cfab8
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 7, 2022 at 2:26 PM Patrick Venture <venture@google.com> wrote:

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
> diff --git a/tests/qtest/npcm7xx_sdhci-test.c
> b/tests/qtest/npcm7xx_sdhci-test.c
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
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
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
> +    sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0,
> SDHC_SEND_RELATIVE_ADDR);
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
> +    close(fd);
> +    g_assert(ret == len);
> +
> +    /* read message using sdhci */
> +    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
> +    g_assert(ret == len);
> +    g_assert(!strcmp(rmsg, msg));
> +
> +    free(rmsg);
> +}
> +
> +/* Check MMC can read values from sd */
> +static void test_read_sd(void)
> +{
> +    QTestState *qts = setup_sd_card();
> +
> +    write_sdread(qts, "hello world");
> +    write_sdread(qts, "goodbye");
> +
> +    qtest_quit(qts);
> +}
> +
> +static void sdwrite_read(QTestState *qts, const char *msg)
> +{
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message using sdhci */
> +    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
> +
> +    /* read message from sd */
> +    int fd = open(sd_path, O_RDONLY);
> +    int ret = read(fd, rmsg, len);
> +    close(fd);
> +    g_assert(ret == len);
> +
> +    g_assert(!strcmp(rmsg, msg));
> +
> +    free(rmsg);
> +}
> +
> +/* Check MMC can write values to sd */
> +static void test_write_sd(void)
> +{
> +    QTestState *qts = setup_sd_card();
> +
> +    sdwrite_read(qts, "hello world");
> +    sdwrite_read(qts, "goodbye");
> +
> +    qtest_quit(qts);
> +}
> +
> +/* Check SDHCI has correct default values. */
> +static void test_reset(void)
> +{
> +    QTestState *qts = qtest_init("-machine kudo-bmc");
> +
> +    uint64_t addr = NPCM7XX_MMC_BA;
> +    uint64_t end_addr = addr + NPCM7XX_REG_SIZE;
> +    uint16_t prstvals_resets[] = {NPCM7XX_PRSTVALS_0_RESET,
> +                                  NPCM7XX_PRSTVALS_1_RESET,
> +                                  0,
> +                                  NPCM7XX_PRSTVALS_3_RESET,
> +                                  0,
> +                                  0};
> +    int i;
> +    uint32_t mask;
> +    while (addr < end_addr) {
> +        switch (addr - NPCM7XX_MMC_BA) {
> +        case SDHC_PRNSTS:
> +            /* ignores bits 20 to 24: they are changed when reading
> registers */
> +            mask = 0x1f00000;
> +            g_assert_cmphex(qtest_readl(qts, addr) | mask, ==,
> +                            NPCM7XX_PRSNTS_RESET | mask);
> +            addr += 4;
> +            break;
> +        case SDHC_BLKGAP:
> +            g_assert_cmphex(qtest_readb(qts, addr), ==,
> NPCM7XX_BLKGAP_RESET);
> +            addr += 1;
> +            break;
> +        case SDHC_CAPAB:
> +            g_assert_cmphex(qtest_readq(qts, addr), ==,
> NPCM7XX_CAPAB_RESET);
> +            addr += 8;
> +            break;
> +        case SDHC_MAXCURR:
> +            g_assert_cmphex(qtest_readq(qts, addr), ==,
> NPCM7XX_MAXCURR_RESET);
> +            addr += 8;
> +            break;
> +        case SDHC_HCVER:
> +            g_assert_cmphex(qtest_readw(qts, addr), ==,
> NPCM7XX_HCVER_RESET);
> +            addr += 2;
> +            break;
> +        case NPCM7XX_PRSTVALS:
> +            for (i = 0; i < NPCM7XX_PRSTVALS_SIZE; ++i) {
> +                g_assert_cmphex(qtest_readw(qts, addr + 2 * i), ==,
> +                                prstvals_resets[i]);
> +            }
> +            addr += NPCM7XX_PRSTVALS_SIZE * 2;
> +            break;
> +        default:
> +            g_assert_cmphex(qtest_readb(qts, addr), ==, 0);
> +            addr += 1;
> +        }
> +    }
> +
> +    qtest_quit(qts);
> +}
> +
> +static void drive_destroy(void)
> +{
> +    unlink(sd_path);
> +    g_free(sd_path);
> +}
> +
> +static void drive_create(void)
> +{
> +    int fd, ret;
> +    sd_path = g_strdup("/tmp/qtest.XXXXXX");
> +
> +    /* Create a temporary raw image */
> +    fd = mkstemp(sd_path);
> +    g_assert_cmpint(fd, >=, 0);
> +    ret = ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);
> +    g_assert_cmpint(ret, ==, 0);
> +    g_message("%s", sd_path);
> +    close(fd);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    drive_create();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("npcm7xx_sdhci/reset", test_reset);
> +    qtest_add_func("npcm7xx_sdhci/write_sd", test_write_sd);
> +    qtest_add_func("npcm7xx_sdhci/read_sd", test_read_sd);
> +
> +    int ret = g_test_run();
> +    drive_destroy();
> +    return ret;
> +}
>

+ Peter for ARM maintainers list.


> --
> 2.34.1.575.g55b058a8bb-goog
>
>

--000000000000233f4205d53cfab8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 7, 2022 at 2:26 PM Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=3D"_blank">stm=
ao@google.com</a>&gt;<br>
<br>
Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_b=
lank">wuhaotsh@google.com</a>&gt;<br>
Reviewed-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" target=3D=
"_blank">crauer@google.com</a>&gt;<br>
Signed-off-by: Shengtan Mao &lt;<a href=3D"mailto:stmao@google.com" target=
=3D"_blank">stmao@google.com</a>&gt;<br>
---<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0tests/qtest/npcm7xx_sdhci-test.c | 201 ++++++++++++++++++++++++++++++=
+<br>
=C2=A02 files changed, 202 insertions(+)<br>
=C2=A0create mode 100644 tests/qtest/npcm7xx_sdhci-test.c<br>
<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 37e1eaa449..b406eba8f6 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -189,6 +189,7 @@ qtests_npcm7xx =3D \<br>
=C2=A0 =C2=A0 &#39;npcm7xx_gpio-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_pwm-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_rng-test&#39;,<br>
+=C2=A0 =C2=A0&#39;npcm7xx_sdhci-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_smbus-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_timer-test&#39;,<br>
=C2=A0 =C2=A0 &#39;npcm7xx_watchdog_timer-test&#39;] + \<br>
diff --git a/tests/qtest/npcm7xx_sdhci-test.c b/tests/qtest/npcm7xx_sdhci-t=
est.c<br>
new file mode 100644<br>
index 0000000000..feb09b921a<br>
--- /dev/null<br>
+++ b/tests/qtest/npcm7xx_sdhci-test.c<br>
@@ -0,0 +1,201 @@<br>
+/*<br>
+ * QTests for NPCM7xx SD-3.0 / MMC-4.51 Host Controller<br>
+ *<br>
+ * Copyright (c) 2021 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/sd/npcm7xx_sdhci.h&quot;<br>
+<br>
+#include &quot;libqos/libqtest.h&quot;<br>
+#include &quot;libqtest-single.h&quot;<br>
+#include &quot;libqos/sdhci-cmd.h&quot;<br>
+<br>
+#define NPCM7XX_MMC_BA 0xF0842000<br>
+#define NPCM7XX_BLK_SIZE 512<br>
+#define NPCM7XX_TEST_IMAGE_SIZE (1 &lt;&lt; 30)<br>
+<br>
+char *sd_path;<br>
+<br>
+static QTestState *setup_sd_card(void)<br>
+{<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_initf(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-machine kudo-bmc &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-device sd-card,drive=3Ddrive0 &quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-drive id=3Ddrive0,if=3Dnone,file=3D%s,f=
ormat=3Draw,auto-read-only=3Doff&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sd_path);<br>
+<br>
+=C2=A0 =C2=A0 qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_SWRST, SDHC_RESET_AL=
L);<br>
+=C2=A0 =C2=A0 qtest_writew(qts, NPCM7XX_MMC_BA + SDHC_CLKCON,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_CLOCK_S=
DCLK_EN | SDHC_CLOCK_INT_STABLE |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SDHC_CLOCK_INT_EN);<br>
+=C2=A0 =C2=A0 sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_APP_CMD=
);<br>
+=C2=A0 =C2=A0 sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x41200000, 0, (41=
 &lt;&lt; 8));<br>
+=C2=A0 =C2=A0 sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_ALL_SEN=
D_CID);<br>
+=C2=A0 =C2=A0 sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0, 0, SDHC_SEND_RE=
LATIVE_ADDR);<br>
+=C2=A0 =C2=A0 sdhci_cmd_regs(qts, NPCM7XX_MMC_BA, 0, 0, 0x45670000, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SDHC_=
SELECT_DESELECT_CARD);<br>
+<br>
+=C2=A0 =C2=A0 return qts;<br>
+}<br>
+<br>
+static void write_sdread(QTestState *qts, const char *msg)<br>
+{<br>
+=C2=A0 =C2=A0 size_t len =3D strlen(msg);<br>
+=C2=A0 =C2=A0 char *rmsg =3D g_malloc(len);<br>
+<br>
+=C2=A0 =C2=A0 /* write message to sd */<br>
+=C2=A0 =C2=A0 int fd =3D open(sd_path, O_WRONLY);<br>
+=C2=A0 =C2=A0 int ret =3D write(fd, msg, len);<br>
+=C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 g_assert(ret =3D=3D len);<br>
+<br>
+=C2=A0 =C2=A0 /* read message using sdhci */<br>
+=C2=A0 =C2=A0 ret =3D sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);<br>
+=C2=A0 =C2=A0 g_assert(ret =3D=3D len);<br>
+=C2=A0 =C2=A0 g_assert(!strcmp(rmsg, msg));<br>
+<br>
+=C2=A0 =C2=A0 free(rmsg);<br>
+}<br>
+<br>
+/* Check MMC can read values from sd */<br>
+static void test_read_sd(void)<br>
+{<br>
+=C2=A0 =C2=A0 QTestState *qts =3D setup_sd_card();<br>
+<br>
+=C2=A0 =C2=A0 write_sdread(qts, &quot;hello world&quot;);<br>
+=C2=A0 =C2=A0 write_sdread(qts, &quot;goodbye&quot;);<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+static void sdwrite_read(QTestState *qts, const char *msg)<br>
+{<br>
+=C2=A0 =C2=A0 size_t len =3D strlen(msg);<br>
+=C2=A0 =C2=A0 char *rmsg =3D g_malloc(len);<br>
+<br>
+=C2=A0 =C2=A0 /* write message using sdhci */<br>
+=C2=A0 =C2=A0 sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_S=
IZE);<br>
+<br>
+=C2=A0 =C2=A0 /* read message from sd */<br>
+=C2=A0 =C2=A0 int fd =3D open(sd_path, O_RDONLY);<br>
+=C2=A0 =C2=A0 int ret =3D read(fd, rmsg, len);<br>
+=C2=A0 =C2=A0 close(fd);<br>
+=C2=A0 =C2=A0 g_assert(ret =3D=3D len);<br>
+<br>
+=C2=A0 =C2=A0 g_assert(!strcmp(rmsg, msg));<br>
+<br>
+=C2=A0 =C2=A0 free(rmsg);<br>
+}<br>
+<br>
+/* Check MMC can write values to sd */<br>
+static void test_write_sd(void)<br>
+{<br>
+=C2=A0 =C2=A0 QTestState *qts =3D setup_sd_card();<br>
+<br>
+=C2=A0 =C2=A0 sdwrite_read(qts, &quot;hello world&quot;);<br>
+=C2=A0 =C2=A0 sdwrite_read(qts, &quot;goodbye&quot;);<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+/* Check SDHCI has correct default values. */<br>
+static void test_reset(void)<br>
+{<br>
+=C2=A0 =C2=A0 QTestState *qts =3D qtest_init(&quot;-machine kudo-bmc&quot;=
);<br>
+<br>
+=C2=A0 =C2=A0 uint64_t addr =3D NPCM7XX_MMC_BA;<br>
+=C2=A0 =C2=A0 uint64_t end_addr =3D addr + NPCM7XX_REG_SIZE;<br>
+=C2=A0 =C2=A0 uint16_t prstvals_resets[] =3D {NPCM7XX_PRSTVALS_0_RESET,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PRSTVALS_1_RESET,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PRSTVALS_3_RESET,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0};<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 uint32_t mask;<br>
+=C2=A0 =C2=A0 while (addr &lt; end_addr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (addr - NPCM7XX_MMC_BA) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case SDHC_PRNSTS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ignores bits 20 to 24: they a=
re changed when reading registers */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D 0x1f00000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(qtest_readl(qts,=
 addr) | mask, =3D=3D,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 NPCM7XX_PRSNTS_RESET | mask);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr +=3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case SDHC_BLKGAP:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(qtest_readb(qts,=
 addr), =3D=3D, NPCM7XX_BLKGAP_RESET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr +=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case SDHC_CAPAB:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(qtest_readq(qts,=
 addr), =3D=3D, NPCM7XX_CAPAB_RESET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr +=3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case SDHC_MAXCURR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(qtest_readq(qts,=
 addr), =3D=3D, NPCM7XX_MAXCURR_RESET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr +=3D 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case SDHC_HCVER:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(qtest_readw(qts,=
 addr), =3D=3D, NPCM7XX_HCVER_RESET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr +=3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case NPCM7XX_PRSTVALS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; NPCM7XX_PRS=
TVALS_SIZE; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(qt=
est_readw(qts, addr + 2 * i), =3D=3D,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prstvals_resets[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr +=3D NPCM7XX_PRSTVALS_SIZE =
* 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmphex(qtest_readb(qts,=
 addr), =3D=3D, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr +=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qtest_quit(qts);<br>
+}<br>
+<br>
+static void drive_destroy(void)<br>
+{<br>
+=C2=A0 =C2=A0 unlink(sd_path);<br>
+=C2=A0 =C2=A0 g_free(sd_path);<br>
+}<br>
+<br>
+static void drive_create(void)<br>
+{<br>
+=C2=A0 =C2=A0 int fd, ret;<br>
+=C2=A0 =C2=A0 sd_path =3D g_strdup(&quot;/tmp/qtest.XXXXXX&quot;);<br>
+<br>
+=C2=A0 =C2=A0 /* Create a temporary raw image */<br>
+=C2=A0 =C2=A0 fd =3D mkstemp(sd_path);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(fd, &gt;=3D, 0);<br>
+=C2=A0 =C2=A0 ret =3D ftruncate(fd, NPCM7XX_TEST_IMAGE_SIZE);<br>
+=C2=A0 =C2=A0 g_assert_cmpint(ret, =3D=3D, 0);<br>
+=C2=A0 =C2=A0 g_message(&quot;%s&quot;, sd_path);<br>
+=C2=A0 =C2=A0 close(fd);<br>
+}<br>
+<br>
+int main(int argc, char **argv)<br>
+{<br>
+=C2=A0 =C2=A0 drive_create();<br>
+<br>
+=C2=A0 =C2=A0 g_test_init(&amp;argc, &amp;argv, NULL);<br>
+<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;npcm7xx_sdhci/reset&quot;, test_reset);=
<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;npcm7xx_sdhci/write_sd&quot;, test_writ=
e_sd);<br>
+=C2=A0 =C2=A0 qtest_add_func(&quot;npcm7xx_sdhci/read_sd&quot;, test_read_=
sd);<br>
+<br>
+=C2=A0 =C2=A0 int ret =3D g_test_run();<br>
+=C2=A0 =C2=A0 drive_destroy();<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br></blockquote><div><br></div><div>+ Peter for ARM maintainers list.<br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.34.1.575.g55b058a8bb-goog<br>
<br>
</blockquote></div></div>

--000000000000233f4205d53cfab8--
