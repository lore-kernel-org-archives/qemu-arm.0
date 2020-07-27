Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3073295lfy;
        Mon, 27 Jul 2020 11:06:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjc3SgdX6BDpRqUFnnenNGa/k365b6AHmu80bo8ZFSaultfDXNqQ8nUG1ZsFflrTP7UzeA
X-Received: by 2002:a25:e751:: with SMTP id e78mr15420832ybh.369.1595873162591;
        Mon, 27 Jul 2020 11:06:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595873162; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZOqCcy/u7Yn7zZlYVzmHa+dR9aZm5POVfx6L//3/pvlMBcyZcMLHnI5lN+X/WrZ2P
         gslH64i0XoJImLkatTcOKfVgyFuKbFSgEJUFp2KnqLYuFI2mYH05kMqlHRcP/FAXBqf1
         IuN7e0zUx0KXIHcYQUkohjsweR3213F5/pWCpLTx3EJxX1O2lFSba4GtjyuqkOqLJvN6
         kPc9Jo40ADt+BZMDzG1Yow/+D5HA1+fGX6HcKVDc4EuGoeEyHFVDn64LS49n07crebPT
         RLgPVog4J7UZiVD5+CTghlcQcKJW2f8kWLPCrPvJ0zhkNwJ6s4UlvcD6EuZuX253WpBP
         2RZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jAf7PSOhvTnKeKI6ooAHauBekFF2p+kqsK3UIrBnQbQ=;
        b=XsiGQiWquhY5p+bMATZPOU66wHeNdDuamMVmI26+UbOd0rb+kOW1/KwImdZgmTuPSJ
         TKLqn6BAiV2USFrpMCcSYW7xSaoGO7iQ9PLg9LgLVc21jOv02lLjq4ONtuWbY2gJMj4y
         hgdmRoCc4ngJr8mG2sZmFDJsaRUcnqo0RF2eG+9rPe2cJjv5w+bggiLeVF10UXpc9upB
         IcjyJoOGdL89rL+INSAiKsuDPk4wOWK/IZ6WmXOMcI9jIg1/yBuiPYAPVSyYGYOZwrMn
         7TxlO2gZZNS4m/iDx1V7axso9/p2K7Ss96PaTfWI8u/L5T3j37+RLGRnU+2sJBjjYpbl
         S0uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="JLZyQQ/u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e138si10254636ybc.226.2020.07.27.11.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jul 2020 11:06:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="JLZyQQ/u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k07Vh-0004XU-Um
	for alex.bennee@linaro.org; Mon, 27 Jul 2020 14:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k07VY-0004WD-O3; Mon, 27 Jul 2020 14:05:52 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:39279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k07VX-0000Km-2K; Mon, 27 Jul 2020 14:05:52 -0400
Received: by mail-ed1-x541.google.com with SMTP id o10so3141805edh.6;
 Mon, 27 Jul 2020 11:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jAf7PSOhvTnKeKI6ooAHauBekFF2p+kqsK3UIrBnQbQ=;
 b=JLZyQQ/u6qVQWkz7eQ8QBObftsA/rCI6SkNGIIbMxEdlfNMCnIHPHcRe+99FCetKBn
 r1PzhDBgo9FbpHbvnu9jUeO89YUnkJN2iszCAbf0w+Yv8khvQkK6tRZVI28TEtVZ8N7R
 FqAiAwV/4bWIVFt5F/qVG25cZFxC6d+ygRWi9bie2gR2gkYnccv5g7m2UCfkE5x9W94h
 W1U3FCKUvCKUTAa/iqbHqxukHsbtCzLQpHlmdDU8e6LrBaiSGYKBe5f0Rxk9hvaL64UZ
 l6lsn/UQqvYGV6oIybEkzqq59yrhbWLrOil3AfJxeUzYyol5g1/DYElY2hEoiuCvNryN
 Vl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jAf7PSOhvTnKeKI6ooAHauBekFF2p+kqsK3UIrBnQbQ=;
 b=szlLiaxtCjJgtJ4wKsaoWGIUz9s+DVlHkaE+cw9uge8wWtO1cRVhEcy7hgZMnu61Ec
 mB1tyBnAUx0q1BNXj/5V4GHDyeJSg3/I2X6Kl4BrnSbIvrXISnyIRAONS7D7/CUAf4b8
 ezlDbcjSGeu51yk0c28crEg/PKPBSWO6+POvYTFxLAnb5+5ap/0mJSA91EG9eA9s5pzS
 1ZcV6JOsCDaYqxFnEYjl5L8csNlCB2DFq5mUl9TLgFSWAf+vAxXwyQjWV5VbRDyyStp1
 BbY1fZGjj1o3eLWOxbtcTyyID5dh1jekvwqScCaqg9dyEWKDzW62v1zj+bJI4IxKfnl6
 yy9Q==
X-Gm-Message-State: AOAM531QdxzQ3BGVlEEmdxsqGLdY13gKj9HdXrjS3HzMuhddHF4LP5uq
 vwc+tDq49QIBBLiNyg7EX7U=
X-Received: by 2002:a05:6402:b4b:: with SMTP id
 bx11mr21814201edb.286.1595873149228; 
 Mon, 27 Jul 2020 11:05:49 -0700 (PDT)
Received: from [192.168.1.39] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id vr6sm5563721ejb.36.2020.07.27.11.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 11:05:48 -0700 (PDT)
Subject: Re: [PATCH for-5.1] hw/arm/netduino2, netduinoplus2: Set
 system_clock_scale
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200727162617.26227-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e549c6d3-9fbb-ec47-f6c3-c84e4c625647@amsat.org>
Date: Mon, 27 Jul 2020 20:05:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200727162617.26227-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7cJ/F1lBK27Y

On 7/27/20 6:26 PM, Peter Maydell wrote:
> The netduino2 and netduinoplus2 boards forgot to set the system_clock_scale
> global, which meant that if guest code used the systick timer in "use
> the processor clock" mode it would hang because time never advances.
> 
> Set the global to match the documented CPU clock speed of these boards.
> Judging by the data sheet this is slightly simplistic because the
> SoC allows configuration of the SYSCLK source and frequency via the
> RCC (reset and clock control) module, but we don't model that.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1876187
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: tested with "make check" only...

What about adding another patch with:

-- >8 --
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -17,6 +17,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
 #include "trace.h"

 /* qemu timers run at 1GHz.   We want something closer to 1MHz.  */
@@ -221,6 +222,11 @@ static void systick_instance_init(Object *obj)
 static void systick_realize(DeviceState *dev, Error **errp)
 {
     SysTickState *s = SYSTICK(dev);
+
+    if (!system_clock_scale) {
+        error_setg(errp, "can not use systick with 'system_clock_scale
= 0'");
+        return;
+    }
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s);
 }

---

I'll try to review with the datasheets tomorrow morning in case you want
to get it merged during the day.

> 
>  hw/arm/netduino2.c     | 10 ++++++++++
>  hw/arm/netduinoplus2.c | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 79e19392b56..8f103341443 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -30,10 +30,20 @@
>  #include "hw/arm/stm32f205_soc.h"
>  #include "hw/arm/boot.h"
>  
> +/* Main SYSCLK frequency in Hz (120MHz) */
> +#define SYSCLK_FRQ 120000000ULL
> +
>  static void netduino2_init(MachineState *machine)
>  {
>      DeviceState *dev;
>  
> +    /*
> +     * TODO: ideally we would model the SoC RCC and let it handle
> +     * system_clock_scale, including its ability to define different
> +     * possible SYSCLK sources.
> +     */
> +    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
> +
>      dev = qdev_new(TYPE_STM32F205_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> index 958d21dd9f9..68abd3ec69d 100644
> --- a/hw/arm/netduinoplus2.c
> +++ b/hw/arm/netduinoplus2.c
> @@ -30,10 +30,20 @@
>  #include "hw/arm/stm32f405_soc.h"
>  #include "hw/arm/boot.h"
>  
> +/* Main SYSCLK frequency in Hz (168MHz) */
> +#define SYSCLK_FRQ 168000000ULL
> +
>  static void netduinoplus2_init(MachineState *machine)
>  {
>      DeviceState *dev;
>  
> +    /*
> +     * TODO: ideally we would model the SoC RCC and let it handle
> +     * system_clock_scale, including its ability to define different
> +     * possible SYSCLK sources.
> +     */
> +    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
> +
>      dev = qdev_new(TYPE_STM32F405_SOC);
>      qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> 

