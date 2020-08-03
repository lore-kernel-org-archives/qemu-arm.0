Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5937951lfy;
        Mon, 3 Aug 2020 03:58:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwy/ce/ogWTTS6UBkbO+as3SH9Y0IRXpbZohXISTJD3KuN3ql5X7AwHgNzTuluUx1xn1mp
X-Received: by 2002:a25:a162:: with SMTP id z89mr25740884ybh.449.1596452308575;
        Mon, 03 Aug 2020 03:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596452308; cv=none;
        d=google.com; s=arc-20160816;
        b=uJalc++ONShiifMRjLaw9qwq2Jl7Ot2dU5Gf3CLOb0Ajzfo9bYBoF8q7JtITyowEe1
         P24T5DPNW/r3nlWoCFPHCw0N7huLyJCWwLf2aPyxbxAyCi46KQFSdjf/YgDf4XGS2a6b
         W2w4kgFYTme32V3ubRQwcEO8Wk7Sg952bWj80BU0dIIn26dQWd4nfM4iTQ9l4VzHWh0G
         0KPyk8qH1/ttz7LVreVgJsfsKu5PfJ2yjZVQ5TVz9ADrorQ23Cvcjjgsq5GN4l144RVu
         22i3oezDDCjUaj9oOk9dvHttlbLwLRwlF1H9UjR0f2etj0wKY1NeVCHQzVvEBzrSUiGI
         xyig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rLG/x8mbNkoq7Pzqyxv/hJikq7GouZqBJQ9UCtSxoPM=;
        b=oqB/RIVkQTY/aCQopDEa+ltn9pJFbZUfj2cytnil/e1R6XrGgllFJ4miwi2GeAUcp9
         GC3pYoQAU8Zv25Wuxf0Sj4bFYrrqPBfC/iLs+e2kqbjkiHhEZZ5nQJfiKuSzc9COJVI7
         UQuaWBB109PNKJuQb+U9xMdA2PA9v3/moEUWNtZQ5HM+KGHdVl6q0XvG9gBB2YW6su+8
         rmkIDOtoaqW9ciCOGLcNJ7lEy7Oep+1AhdYto3p7crJzer00lMcf1JKhZYiyqoS3yO7Y
         X8ReF5y+oIvwd5F4Nd0VJh7kbMPDwxSGDlZWXgrm7zULaYkzIHumNgMbjyAMh0Cjd1ZQ
         2f9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o70KvnZX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s142si12059551ybc.291.2020.08.03.03.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 03:58:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o70KvnZX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2YAl-00049Z-Qm
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 06:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9H-0002VV-GM; Mon, 03 Aug 2020 06:56:56 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k2Y9F-00026p-Uc; Mon, 03 Aug 2020 06:56:55 -0400
Received: by mail-wm1-x341.google.com with SMTP id x5so13929572wmi.2;
 Mon, 03 Aug 2020 03:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLG/x8mbNkoq7Pzqyxv/hJikq7GouZqBJQ9UCtSxoPM=;
 b=o70KvnZX4yukxiVxICU/P/dfzO8ZsXwekvhpkgrfzbRCMAMaoo1VK2b20ghRFQGugG
 TH3k3cFEr/JGQiPUQMm/YYQEQIVSohtg1pgVo0+alFzLoioKNrStKONXBUuWgxbXMaCM
 4osMaOhkWBuVSlx9i3EHZ69Q+oYoO326f6aEs0aC3b5++qaFIIJRWBUm11QhK6kIBSE4
 nZZZdOYFY6j4knOvnqfCvuPZTBJwb1IX5Q+YvgQuDmXhhRt4akLscwBqf1FcrqeI8v87
 S/ieMcQcU/ZS4ON7G2PNhUiQmUdIBQFrZAA0XKj94bxiv4h6RM7ydVMX9Z5UbomE7q7M
 BRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rLG/x8mbNkoq7Pzqyxv/hJikq7GouZqBJQ9UCtSxoPM=;
 b=Pscd3vV+Z87oOo+KDJnILKJENCVtZgP8rapXer9GUvdtlJbUsi+zWgVf3SoqwPWya6
 sZQeX3lz39eoEq+Go4CsJmW9bBSy7FgNmhJ8igTnOSmFUqQpNKhGEKTW9g/2vtyPHKj4
 ip4ZAJyMKOBatTTmJAOYIFB9ciTytZhNshnLdQo2AJq4S+ZBlAyg4PnYD838M04HMpyw
 6qydGCquJtK8AsWhaztW+nI4EgXMguHpZTV1hkoDAuPCM9xyiPGXLBkt/Ou9jNRP5shO
 ReuzRcIEjMqaLhb/SencyvsQjC33vz9qYfJOjT79C70bbz/lBlTjQC8srQifbw0HmIG/
 sibA==
X-Gm-Message-State: AOAM530UDHiaY3SggNquLwzFBEDcmksR14BdX3VeBG4yyLaDHAtPnc/F
 CNETokYqf5vvA+XcdPLyGdEXN/7d
X-Received: by 2002:a1c:1f8b:: with SMTP id f133mr15302286wmf.65.1596452211611; 
 Mon, 03 Aug 2020 03:56:51 -0700 (PDT)
Received: from localhost.localdomain (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id z11sm23103477wrw.93.2020.08.03.03.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 03:56:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1? 1/4] hw/arm/xilinx_zynq: Uninline
 cadence_uart_create()
Date: Mon,  3 Aug 2020 12:56:44 +0200
Message-Id: <20200803105647.22223-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200803105647.22223-1-f4bug@amsat.org>
References: <20200803105647.22223-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3GhsDdrO67kp

As we want to call qdev_connect_clock_in() before the device
is realized, we need to uninline cadence_uart_create() first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/char/cadence_uart.h | 17 -----------------
 hw/arm/xilinx_zynq.c           | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uart.h
index ed7b58d31d..dabc49ea4f 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -53,21 +53,4 @@ typedef struct {
     Clock *refclk;
 } CadenceUARTState;
 
-static inline DeviceState *cadence_uart_create(hwaddr addr,
-                                        qemu_irq irq,
-                                        Chardev *chr)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new(TYPE_CADENCE_UART);
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, irq);
-
-    return dev;
-}
-
 #endif
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 32aa7323d9..cf6d9757b5 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -254,10 +254,20 @@ static void zynq_init(MachineState *machine)
     sysbus_create_simple(TYPE_CHIPIDEA, 0xE0002000, pic[53 - IRQ_OFFSET]);
     sysbus_create_simple(TYPE_CHIPIDEA, 0xE0003000, pic[76 - IRQ_OFFSET]);
 
-    dev = cadence_uart_create(0xE0000000, pic[59 - IRQ_OFFSET], serial_hd(0));
+    dev = qdev_new(TYPE_CADENCE_UART);
+    busdev = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, 0xE0000000);
+    sysbus_connect_irq(busdev, 0, pic[59 - IRQ_OFFSET]);
     qdev_connect_clock_in(dev, "refclk",
                           qdev_get_clock_out(slcr, "uart0_ref_clk"));
-    dev = cadence_uart_create(0xE0001000, pic[82 - IRQ_OFFSET], serial_hd(1));
+    dev = qdev_new(TYPE_CADENCE_UART);
+    busdev = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", serial_hd(1));
+    sysbus_realize_and_unref(busdev, &error_fatal);
+    sysbus_mmio_map(busdev, 0, 0xE0001000);
+    sysbus_connect_irq(busdev, 0, pic[82 - IRQ_OFFSET]);
     qdev_connect_clock_in(dev, "refclk",
                           qdev_get_clock_out(slcr, "uart1_ref_clk"));
 
-- 
2.21.3

