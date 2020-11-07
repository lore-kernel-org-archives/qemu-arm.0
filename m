Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2354101lfb;
        Sat, 7 Nov 2020 11:38:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3SG87egWYdwg1+ybguTZi+2rN/P0c9EKf34rao9wSC7Ghn+KUjgo0mKBXD2+lq7hfwYjI
X-Received: by 2002:a25:a86:: with SMTP id 128mr10741299ybk.370.1604777918562;
        Sat, 07 Nov 2020 11:38:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604777918; cv=none;
        d=google.com; s=arc-20160816;
        b=o0XoGbs5SU9lWRAE0FBhBG5rrlENx/9tgqPX+TWWi+ApiZHz7ycJm9zMvkcRVIZ8Zr
         U0/vhLGFXsekarzonLTbMgDki0475uQN/0dM1RmP9Iq5jeUpt4iBmxyZx1wY1jdkzwVX
         jxrRvB43iQGIu5gpPnNNiB7NPAzIBNNSfE0G/PhTEtg3u74WGE3tYwGoVqgnvYi6vFRo
         UR7PkGZmaQpfc58x0PfVMNrE97r9x/KTMbLco1Rss5jUTXJiHFZ3TXM2igRNcmrMVXKm
         l5Tmbyf6HlOJzOViMKovj3JVG9rKcqcbM8I3bxkubpsCacdcanpyZeiD8r8/emn6PhTL
         UAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fgdYdhDY03zoPgadIiKhWW6DCP4typfikMNrmEkn0p8=;
        b=vO7dNkIoUBmq9BgzNXdHpRne40ogTuBE5/7w4BbUgxVAd18iPwlEtPdAvb+9ZcG+gW
         Q6gb0XxTofjAoK/rFGkMFf8cYmRGj099dZFI1BIi7vdajWHgyYh7NE2Fk/OpoaN8WbRK
         +2434Jhll9PY5Mwk6xb2b0VfT+V7mzkQrlZhqoUKuTiEZojyKgokKO5pKvbdTsGa6fFc
         vUt1UsnF4pZL3BIv2yT07vxYSIh/o54Ln7olq1RVDsCbY1JPfCSsNlTMc6+OVxrbCY8c
         erlFcuW9UzPB//9IJ7Nm9FOwA6oue7JOf6LfsBo2MuFFLyxT8FAMRMk/Q+8+Ld7Z/6CM
         12+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jrqPGW9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s75si4484849ybi.307.2020.11.07.11.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Nov 2020 11:38:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jrqPGW9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbU2n-0003Qn-UX
	for alex.bennee@linaro.org; Sat, 07 Nov 2020 14:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kbTz1-00081L-1m; Sat, 07 Nov 2020 14:34:43 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kbTyy-0008NA-Jw; Sat, 07 Nov 2020 14:34:42 -0500
Received: by mail-wm1-x343.google.com with SMTP id v5so4559640wmh.1;
 Sat, 07 Nov 2020 11:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fgdYdhDY03zoPgadIiKhWW6DCP4typfikMNrmEkn0p8=;
 b=jrqPGW9tsCt+SXiyZQcQkihiqvMadba2ZzCBGwKS+j/drhGHyHFTrNp1nc5+s/sHsR
 mGrSsGjkGTYnaQ5N9SzxpO7Eqql1sCxTEri14zP9f5IFYHeP+oIscRmLhcIyH4fKJWJz
 2PWgZbrHz9+FC8ePucHjrKHmBaCTNGsxulqNO7qpEhKqK4U9jbFyFoXxiRTuNIQMPr5a
 29d2eaaOWW0kE38BhNAnBlU5I7t/x4T5X3cibScm0CSpPSG7edLZ+hRlO18H1z+3fx4Q
 rdiW+R8WuAG35tcM7qGjsXN5QXUWrI0ApTPR7r/TrKo87n3CfVlRsBxjKG3CO/p5PFeN
 U9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fgdYdhDY03zoPgadIiKhWW6DCP4typfikMNrmEkn0p8=;
 b=R6QAWObpmaHgBQnr/VEJ95Oj3uNpTrRHdiZX3Gr6q0rHKmEHi1d4uDKUAVstLZrRzp
 8VKWcwtYOpJ9neB1uuCzyl2Q6hBpfFMVwMjzBtd7lpqjBJ8+shtl/F5fDgqW/khZ8KdO
 d3/y95FAzVrFA/b6gifgk4uGuHiigpq/Dned4N3Ca7Wa41nPJJ2dZBg5CsH3UQlCjyer
 u8nFwK108ZO3ltiCosfQRGxSpLosIMoPeHxBly0+kz+gPUSAhB7dUJOlJFSeOGv945+J
 qsx7++CLA4LekJp6ZDIxBszjNjerUWOgcFxQ4nh2Sfu2Esf82akZhXX/cmFMZLguIj8o
 jmdw==
X-Gm-Message-State: AOAM53322x5+pb/w/SU+0kB3rc3tDFpQvg6/7poqs6YUlD/lk9HvgTP5
 as4ixlysm6rR+8GSJ3o3fVNj5824Vuc=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr6095102wmi.70.1604777671085; 
 Sat, 07 Nov 2020 11:34:31 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id q2sm7363998wrw.40.2020.11.07.11.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 11:34:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0 5/5] hw/arm/musicpal: Only use qdev_get_gpio_in() when
 necessary
Date: Sat,  7 Nov 2020 20:34:03 +0100
Message-Id: <20201107193403.436146-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201107193403.436146-1-f4bug@amsat.org>
References: <20201107193403.436146-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H0TiCz20bCZU

We don't need to fill the full pic[] array if we only use
few of the interrupt lines. Directly call qdev_get_gpio_in()
when necessary.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index ebc3ec24ef7..458b1cbeb76 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1587,8 +1587,8 @@ static struct arm_boot_info musicpal_binfo = {
 static void musicpal_init(MachineState *machine)
 {
     ARMCPU *cpu;
-    qemu_irq pic[32];
     DeviceState *dev;
+    DeviceState *pic;
     DeviceState *uart_orgate;
     DeviceState *i2c_dev;
     DeviceState *lcd_dev;
@@ -1619,20 +1619,20 @@ static void musicpal_init(MachineState *machine)
                            &error_fatal);
     memory_region_add_subregion(address_space_mem, MP_SRAM_BASE, sram);
 
-    dev = sysbus_create_simple(TYPE_MV88W8618_PIC, MP_PIC_BASE,
+    pic = sysbus_create_simple(TYPE_MV88W8618_PIC, MP_PIC_BASE,
                                qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
-    for (i = 0; i < 32; i++) {
-        pic[i] = qdev_get_gpio_in(dev, i);
-    }
-    sysbus_create_varargs(TYPE_MV88W8618_PIT, MP_PIT_BASE, pic[MP_TIMER1_IRQ],
-                          pic[MP_TIMER2_IRQ], pic[MP_TIMER3_IRQ],
-                          pic[MP_TIMER4_IRQ], NULL);
+    sysbus_create_varargs(TYPE_MV88W8618_PIT, MP_PIT_BASE,
+                          qdev_get_gpio_in(pic, MP_TIMER1_IRQ),
+                          qdev_get_gpio_in(pic, MP_TIMER2_IRQ),
+                          qdev_get_gpio_in(pic, MP_TIMER3_IRQ),
+                          qdev_get_gpio_in(pic, MP_TIMER4_IRQ), NULL);
 
     /* Logically OR both UART IRQs together */
     uart_orgate = DEVICE(object_new(TYPE_OR_IRQ));
     object_property_set_int(OBJECT(uart_orgate), "num-lines", 2, &error_fatal);
     qdev_realize_and_unref(uart_orgate, NULL, &error_fatal);
-    qdev_connect_gpio_out(DEVICE(uart_orgate), 0, pic[MP_UART_SHARED_IRQ]);
+    qdev_connect_gpio_out(DEVICE(uart_orgate), 0,
+                          qdev_get_gpio_in(pic, MP_UART_SHARED_IRQ));
 
     serial_mm_init(address_space_mem, MP_UART1_BASE, 2,
                    qdev_get_gpio_in(uart_orgate, 0),
@@ -1674,14 +1674,15 @@ static void musicpal_init(MachineState *machine)
                              OBJECT(get_system_memory()), &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, MP_ETH_BASE);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[MP_ETH_IRQ]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0,
+                       qdev_get_gpio_in(pic, MP_ETH_IRQ));
 
     sysbus_create_simple("mv88w8618_wlan", MP_WLAN_BASE, NULL);
 
     sysbus_create_simple(TYPE_MUSICPAL_MISC, MP_MISC_BASE, NULL);
 
     dev = sysbus_create_simple(TYPE_MUSICPAL_GPIO, MP_GPIO_BASE,
-                               pic[MP_GPIO_IRQ]);
+                               qdev_get_gpio_in(pic, MP_GPIO_IRQ));
     i2c_dev = sysbus_create_simple("gpio_i2c", -1, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(i2c_dev, "i2c");
 
@@ -1713,7 +1714,7 @@ static void musicpal_init(MachineState *machine)
                              NULL);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, MP_AUDIO_BASE);
-    sysbus_connect_irq(s, 0, pic[MP_AUDIO_IRQ]);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(pic, MP_AUDIO_IRQ));
 
     musicpal_binfo.ram_size = MP_RAM_DEFAULT_SIZE;
     arm_load_kernel(cpu, machine, &musicpal_binfo);
-- 
2.26.2

