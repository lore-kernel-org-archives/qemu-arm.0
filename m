Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2730821lfq;
        Sun, 27 Sep 2020 02:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCN7JVEx1gDrxomwZ8VunG866ggokYZDGuf3hVoAV/B8iq07dkTnFHQSZq+OuFA8S6GvBY
X-Received: by 2002:a25:b31f:: with SMTP id l31mr8760711ybj.198.1601198402001;
        Sun, 27 Sep 2020 02:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601198401; cv=none;
        d=google.com; s=arc-20160816;
        b=vypakbOduj67ex1f/4WaVVYbUIJ5/YebgepBbJh3DYFlczvpuzhpAEuTgFeO9FAOEx
         5fLm7RoGIq1HoRNA5cf0OzDmhb9r0WKc2tuR2GeHlmvGHApQW6Lt0znAJexYlOneplcT
         54y2Oass2pzz9VjhNLTRs1a2wYlrnJZh+Dd1e+INKZx3W9T+BM30VszgdygaBvooWTW0
         whAEcI9wBifvdIDyzrUpsx/ha+S0qOimH+BqTLhudCeR7z/ZcKdP6Y6AWhySkzqgzZ7C
         HcJnd4IpsKynMpfI10Lg3Ew0VBZEQMS6d3dHsznWdYVQGAeeakQdNie82WR9zE83mouN
         HwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=JE1wGB6BI1wMEr1wtSL+m6ZTyfG8SwGE9LYk/u5ju/4=;
        b=L5tt9uplfADZw+sSq5OobLpP+3bPV9+i9clG8ndSM0bmuS3o+LgBKf3qg27hshESMr
         c8824NYJGGXZ+V21hULTHmuebHCc8ZZDJZIlGf8i7JrAqN07sbIaAEfpxxJa7ecIGu/n
         r2eba2fuBQV9CHNo+yJBrp7jgLxMGKgK8mkLG9czTK4ZOnct/uVbEouOP5WYF2qQl5Px
         0AZe0vy/T54UjLPqnZZrW0uI6AHYUfS7OJlBO49lXZLcQnClLJf03bp+ymuMeuZRpH8e
         R92xDboO0J7nB+JeIy2DWBNsRiI9jrBlOMN3XUfVef6ClnTR6QXyKzerb/SWx9W/Oq5k
         QrNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KdoSOraJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si8872394yba.105.2020.09.27.02.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Sep 2020 02:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KdoSOraJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMSqe-0000Lc-Uw
	for alex.bennee@linaro.org; Sun, 27 Sep 2020 05:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMSqX-0000LQ-1d; Sun, 27 Sep 2020 05:19:53 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMSqV-0003Ll-Hs; Sun, 27 Sep 2020 05:19:52 -0400
Received: by mail-wr1-x444.google.com with SMTP id g4so8407906wrs.5;
 Sun, 27 Sep 2020 02:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JE1wGB6BI1wMEr1wtSL+m6ZTyfG8SwGE9LYk/u5ju/4=;
 b=KdoSOraJqoVhJi7JRCk0athxkLUAxHY6dhCOKx9xjnGlhmQqw50uJ24kmHcNfj3znu
 QVhpnnI2a/ZCxxdvHOc5XLMycGJy/j8icXZFnuEJ4bOLJc/0AFVQBQBhYVMDfzVFroLE
 gp9em/zvgSSWQKyUMuVuKlm0bBf0aBvXWnCO0hnJwMkGC0ydIqL4yVyljuWr9fxIolgg
 uOu0qyJZ4UthbIj9jDASeJQjDIxmKOEfQC1SrIImyyseZwn42jvXm5e2iTq6P7RU7Ast
 nmhmrkca2wt7eGXrhwI2zWHlzeP8/R8nL9uJeBoVHz+9OOPrhGnr9Sw4+LS3zHmRrA7I
 zTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JE1wGB6BI1wMEr1wtSL+m6ZTyfG8SwGE9LYk/u5ju/4=;
 b=baqochhvJPT7JJN+i4re4eEXCmDwSqtEQS2g4XpPLVQC5GlojMm7MJrT6U5PCHf1ww
 lvHOKDVND/zuyHh/v5VzHL67ApHwZNMHgKISMsHRea25Wn25vuh8jrtKiLVPDlX72PQ0
 1ZDGeQeN1zsk1qLk55k5KQcSmgiBwVWwcdeC6m/O3T0kehvN5PTc6zdzkUwcLxDNZwYX
 WGgwmj1k0/xNVj0tmWZgwU9qScONBQGR+bkYplOj5FV6gz3dX2vPApuy3hoKbodAPPHp
 y7o3yPe9rBT77WcDYJ+/ux0DzVceaqcQ8uPZbp1g1jqIMl3f1MzkR1bieFddvlgzo+Pr
 mwFA==
X-Gm-Message-State: AOAM532GLTciigGI412SbamdsN9xRQXATC4AKRQA7VKesgPnE2uaeUGg
 YKjiIP1WBfi+siBF6Y19NFrlkga5FyI=
X-Received: by 2002:adf:f986:: with SMTP id f6mr12573144wrr.270.1601198389134; 
 Sun, 27 Sep 2020 02:19:49 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id 11sm4822708wmi.14.2020.09.27.02.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 02:19:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] ssi: Display chip select polarity in monitor 'info qtree'
Date: Sun, 27 Sep 2020 11:19:46 +0200
Message-Id: <20200927091946.65491-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UfRAD5vkBAAI

It is sometime useful to verify a device chip select polarity
on a SPI bus. Since we have this information available, display
it in the 'info qtree' monitor output:

  $ qemu-system-arm -M lm3s6965evb -monitor stdio -S
  (qemu) info qtree
  [...]
  dev: pl022, id ""
    gpio-out "sysbus-irq" 1
    mmio 0000000040008000/0000000000001000
    bus: ssi
      type SSI
      dev: ssd0323, id ""
        gpio-in "" 1
        gpio-in "ssi-gpio-cs" 1
        chip select polarity: high           <---
      dev: ssi-sd, id ""
        gpio-in "ssi-gpio-cs" 1
        chip select polarity: low            <---
        bus: sd-bus
          type sd-bus
          dev: sd-card, id ""
            spec_version = 2 (0x2)
            drive = "sd0"
            spi = true

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ssi/ssi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 4278d0e4440..4c9f8d66d23 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -17,6 +17,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "monitor/monitor.h"
 #include "qom/object.h"
 
 struct SSIBus {
@@ -26,10 +27,31 @@ struct SSIBus {
 #define TYPE_SSI_BUS "SSI"
 OBJECT_DECLARE_SIMPLE_TYPE(SSIBus, SSI_BUS)
 
+static void ssi_print_dev(Monitor *mon, DeviceState *dev, int indent)
+{
+    static const char *const polarity_s[] = {
+        [SSI_CS_NONE] = "unknown",
+        [SSI_CS_LOW]  = "low",
+        [SSI_CS_HIGH] = "high"
+    };
+    SSISlaveClass *ssc = SSI_SLAVE_GET_CLASS(dev);
+
+    monitor_printf(mon, "%*schip select polarity: %s\n",
+                   indent, "", polarity_s[ssc->cs_polarity]);
+}
+
+static void ssi_bus_class_init(ObjectClass *klass, void *data)
+{
+    BusClass *k = BUS_CLASS(klass);
+
+    k->print_dev = ssi_print_dev;
+}
+
 static const TypeInfo ssi_bus_info = {
     .name = TYPE_SSI_BUS,
     .parent = TYPE_BUS,
     .instance_size = sizeof(SSIBus),
+    .class_init = ssi_bus_class_init,
 };
 
 static void ssi_cs_default(void *opaque, int n, int level)
-- 
2.26.2

