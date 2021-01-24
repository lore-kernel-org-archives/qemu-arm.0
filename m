Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp2382503lfb;
        Sun, 24 Jan 2021 04:51:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyv0iCIBowClJBrUGe9bqvFvVmveiDEWe8yUy6Tr3TW4FAwjhkl4IPT3MCdRcDtRaZgdUG
X-Received: by 2002:a25:c544:: with SMTP id v65mr17891887ybe.167.1611492663828;
        Sun, 24 Jan 2021 04:51:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611492663; cv=none;
        d=google.com; s=arc-20160816;
        b=k08nZ6fBzcx6xPbWrHE3QOnLXB6vLrdjJOoyQrtb1zwqQWm5o90R8CDPP+8Gso/ZLX
         y/LTmL7otYxg0Jpa64HNV0Q7g0BafDS3tS1oS+UpYQdqfYHkI6xGzSofTomQ25vYikzc
         VnjTPfs70Rn6zzK961+MRkx0anylrOHN65prHDK1/gBwvPS7tbWxZwWsidZiwPxmS2cZ
         D0PcDkXMXdv4GX03e9Aq3Iz9THzs1bfOxFlB9x3xxdo3HyJIKUKrpO70cjkE5fuAlfOH
         xSGgsKYbiu89jXedyvbDFbS/8/bPqYt00bKVT6p41EL033hGUIo3uB+8KKx+QQCYs3XH
         7gPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=R3s8A5Yh8OftKPGYZSQKQA6eXhSEdXN+oI0P0Yi0+ew=;
        b=Oe/VE/U+eYOMK2QOikeBSui3B4JIv2yvLI94ug70pfzbbMykYMzaGD+QeGr6nMJtMG
         /vSN2slZr8y7KbCpllAqR7zCbC73tGFq3wc12XnzAnthyrE7v22deKvGrHLL3gOCqPfJ
         ZKizDaoVqCPW4d0OWErQ0RIKJJJxvCloPIc6+d9kwJ9ef1HnzBofZ/quyDiag7h7zpye
         4HQhTIxylXTDvbnvZB23/hVMbxamDk0/cu8YpmFOdGeIYjwdLAoumzgStv/1jZyce91Q
         TukD6W8mIUp5MkYftsi5wBRUCWXLUZCaELWtf7nFV0w9KkcJvCHP2RHvDQU4uQOVd4nB
         msMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b="AzdRa/iE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i144si17277113ybg.448.2021.01.24.04.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Jan 2021 04:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b="AzdRa/iE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:40146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l3er9-0002fa-7W
	for alex.bennee@linaro.org; Sun, 24 Jan 2021 07:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3eql-0002f9-RM; Sun, 24 Jan 2021 07:50:40 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l3eqf-00063Q-Fv; Sun, 24 Jan 2021 07:50:39 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 0AA47C602E6;
 Sun, 24 Jan 2021 13:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1611492629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R3s8A5Yh8OftKPGYZSQKQA6eXhSEdXN+oI0P0Yi0+ew=;
 b=AzdRa/iEsQMW3ynK32YKbLJQ1/WCy7w2Hv9Ccz3giu4A5jx9jkO/YkCgUIg2/Gz/XBk6Ds
 U2OJf1KTn2ACXaesASn7B9QbsCu1qR7qBzdKEbjeDEn6hJdg4X7uckFR/ySs8PPsxCg1Ba
 YXAz3E6RoLLJJa3uQBaCFhhRFTkoVa1d+fasPTo8wJRtHa+dGH4LF84sAmaROTuwUmiv8T
 uSBsAvoS4D9tBwXK8eX5VkeNaUbmrIBCzugz60x5b2f/y++NqYpALAVCynbZUoQxXKiUsM
 pyX088zzMF4qpOgOHJuldvhhufrw4gtRSzjxgMoLwaGyLNzFz11hh6ProGWSvw==
Date: Sun, 24 Jan 2021 13:50:51 +0100
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 03/25] tests: Add a simple test of the CMSDK APB timer
Message-ID: <20210124125051.kof2wza52touyxl3@sekoia-pc.home.lmichel.fr>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121190622.22000-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EB2AIcvGkqBI

On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> Add a simple test of the CMSDK APB timer, since we're about to do
> some refactoring of how it is clocked.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  tests/qtest/cmsdk-apb-timer-test.c | 76 ++++++++++++++++++++++++++++++
>  MAINTAINERS                        |  1 +
>  tests/qtest/meson.build            |  1 +
>  3 files changed, 78 insertions(+)
>  create mode 100644 tests/qtest/cmsdk-apb-timer-test.c
> 
> diff --git a/tests/qtest/cmsdk-apb-timer-test.c b/tests/qtest/cmsdk-apb-timer-test.c
> new file mode 100644
> index 00000000000..085005cce99
> --- /dev/null
> +++ b/tests/qtest/cmsdk-apb-timer-test.c
> @@ -0,0 +1,76 @@
> +/*
> + * QTest testcase for the CMSDK APB timer device
> + *
> + * Copyright (c) 2021 Linaro Limited
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
> +#include "libqtest-single.h"
> +
> +/* IoTKit/ARMSSE-200 timer0; driven at 25MHz in mps2-an385, so 40ns per tick */
> +#define TIMER_BASE 0x40000000
> +
> +#define CTRL 0
> +#define VALUE 4
> +#define RELOAD 8
> +#define INTSTATUS 0xc
> +
> +static void test_timer(void)
> +{
> +    g_assert_true(readl(TIMER_BASE + INTSTATUS) == 0);
> +
> +    /* Start timer: will fire after 40000 ns */
> +    writel(TIMER_BASE + RELOAD, 1000);
> +    writel(TIMER_BASE + CTRL, 9);
> +
> +    /* Step to just past the 500th tick and check VALUE */
> +    clock_step(20001);
> +    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 0);
> +    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 500);
> +
> +    /* Just past the 1000th tick: timer should have fired */
> +    clock_step(20000);
> +    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 1);
> +    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 0);
> +
> +    /* VALUE reloads at the following tick */
> +    clock_step(40);
> +    g_assert_cmpuint(readl(TIMER_BASE + VALUE), ==, 1000);
> +
> +    /* Check write-1-to-clear behaviour of INTSTATUS */
> +    writel(TIMER_BASE + INTSTATUS, 0);
> +    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 1);
> +    writel(TIMER_BASE + INTSTATUS, 1);
> +    g_assert_cmpuint(readl(TIMER_BASE + INTSTATUS), ==, 0);
> +
> +    /* Turn off the timer */
> +    writel(TIMER_BASE + CTRL, 0);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    QTestState *s;
> +    int r;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    s = qtest_start("-machine mps2-an385");
> +
> +    qtest_add_func("/cmsdk-apb-timer/timer", test_timer);
> +
> +    r = g_test_run();
> +
> +    qtest_end();
> +
> +    return r;
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3216387521d..010405b0884 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -581,6 +581,7 @@ F: include/hw/rtc/pl031.h
>  F: include/hw/arm/primecell.h
>  F: hw/timer/cmsdk-apb-timer.c
>  F: include/hw/timer/cmsdk-apb-timer.h
> +F: tests/qtest/cmsdk-apb-timer-test.c
>  F: hw/timer/cmsdk-apb-dualtimer.c
>  F: include/hw/timer/cmsdk-apb-dualtimer.h
>  F: hw/char/cmsdk-apb-uart.c
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 16d04625b8b..74addd74868 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -141,6 +141,7 @@ qtests_npcm7xx = \
>     'npcm7xx_timer-test',
>     'npcm7xx_watchdog_timer-test']
>  qtests_arm = \
> +  (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
>    (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>    ['arm-cpu-features',
> -- 
> 2.20.1
> 

-- 
