Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2200073ejc;
        Mon, 9 Jan 2023 04:13:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3glDJJ4kceu2N8m50csRt8LZ+ju33JKGAnNUj30yDMcped7yF3BvntP8m4XsHlOmhzIP6
X-Received: by 2002:a05:6102:212e:b0:3cb:93d:406d with SMTP id f14-20020a056102212e00b003cb093d406dmr23312005vsg.35.1673266406348;
        Mon, 09 Jan 2023 04:13:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673266406; cv=none;
        d=google.com; s=arc-20160816;
        b=Lm/cZYy2mDJIxHntaGp70mm7Og78x9wUqJRIMxKshq0TyF3iz8qQDBvss8GRQKQhcm
         LUb+bsRkM1hMbZ9kGtsiE4bbB0dt9NSwNLT6/vy2r85Pch+deByDZnEGE+PEsRjH0w0i
         qt0c4OwZZJSnyOPX/2q5S6FU60PMnYoF5Tpdiwz4EoU3MUSw/1Smx+0ZsB5vydA9heAM
         7YOwaYYWlB2/s1aY4OjzwPkS9nNagy+Li7clzcjW0tk/ljiHD5uZI2lu+5WQt17kZ/yL
         4pIm/LboW2vMMdq6UULFv7tvT2TZ/tbsGCIpM1W4aY2aau+RKR2Z1bda0nYCe2Rv6sTa
         3TOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8ERSy5wcRjjSecTdAN061YLtBrODzsMdgJY9d4shct4=;
        b=Vk40NigjdEpoZHl9GecRaH3xGdzTddKLLx9wqZT5aZavNNY9OcgcPLAxgcpD9hlD38
         nHgGp7u+1WLq3hz2D/wdZ/SbqTUdwP3/WNALG2VlXAY5vxk/lOP61yGj4/P9FUoVm7jw
         9+juf5MbqweQjBLFc27zi12f2cqjuH/0NkAVaqzqHM35NAlomqtlvAw9KAJRDWszIpEf
         MHvK0Mgx8m2ZeGmn9j8FP00m3nn8dgFLaQPjBeXjeQRIqOh/LAA6NKrM3LcK4dttNyrj
         ovIizjgRCZMsAx7Y2o16Nqz0SAbZ0usQlYRIj1pWcJRmH4hz5RKtXE8KPXOM111SrJma
         UQUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kaLTikEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a379802000000b006ff074d6061si4200690qke.706.2023.01.09.04.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kaLTikEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEqiy-00035g-Gz; Mon, 09 Jan 2023 06:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqix-00034n-5T
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:53:55 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqiv-00086i-Gx
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:53:54 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bs20so7891611wrb.3
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 03:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ERSy5wcRjjSecTdAN061YLtBrODzsMdgJY9d4shct4=;
 b=kaLTikEkyQPY5JrXFdTQCtS28Mm2WEUsaiRImfff56vAh2qvCDYFB1i4Zwnc6p1ySh
 lzTMkeI76KM5Mv85kwwWRBOZsDrWQFHJK7lvb4IbdC09g2vBj9MU/rKv493xrAPOiHOc
 Qg7PtJb8622RbHoiQcT+Q6Mtd04WWOTXwmT+F3F69l1XRuhRCRknUcLZ5/Zp82eWcf3r
 13YfUY16jVnMGhktXoWH70VeEMcAGN8wU5SP0PvIMcvuCNAnTMLOZx0ViVJWsfrlv6l3
 kccj2FObqosnGEmUMfMc6jfC3DIwYP8YRolXEdzJibSlQGoeNVTrE7XiWBRSpAlr9GOz
 nIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ERSy5wcRjjSecTdAN061YLtBrODzsMdgJY9d4shct4=;
 b=xdPqrBNwDi14JMaicIBxaQPxu+ZcGKGQaogfKxRoS26GUReyz3jlp2ZgHRK5BjZicz
 hbMJQyKbhBUNQ58fUoJWMUdLV1EyQqK7/qyrV0ZOJB+ATOphoFbbj8k626jPBDpVhwl5
 frm5NOZg+YHuRJwsCnleHnX/iL9CevHnM9TMtuJ2mk7ewIqj0cEKnoPlnHWmS5h5plRW
 spW3fTDhcWM1LXlu1c0dszmn8pb++Gg6l7zuOqkgSpq2OngQidwYbreWss9GmxGGyxDo
 trLiu9s9H4JKAebxgYGRE2nTLvi9DwizOTfzI4Qbz/3iMxyDkgzMahnWMSiB3HbnMIUd
 UpaA==
X-Gm-Message-State: AFqh2kq8z06LOVphgvr3QfLWJh/tZoLEPKMW885LxunFYJshopAdlmSm
 10xMo18Cgqm94nXN9ZKkg+yrDMRzr8IbXxqT
X-Received: by 2002:a5d:5b17:0:b0:26f:42c9:a224 with SMTP id
 bx23-20020a5d5b17000000b0026f42c9a224mr44211101wrb.63.1673265232216; 
 Mon, 09 Jan 2023 03:53:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfe486000000b002423dc3b1a9sm8251662wrm.52.2023.01.09.03.53.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:53:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/13] hw/arm/mainstone: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:10 +0100
Message-Id: <20230109115316.2235-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XD2IxRQQ/EHl

IEC binary prefixes ease code review: the unit is explicit.

Add the FLASH_SECTOR_SIZE definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/mainstone.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index f6293c6c13..eebaed6e3e 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -12,6 +12,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/arm/pxa.h"
@@ -99,19 +100,20 @@ static const struct keymap map[0xE0] = {
 
 enum mainstone_model_e { mainstone };
 
-#define MAINSTONE_RAM	0x04000000
-#define MAINSTONE_ROM	0x00800000
-#define MAINSTONE_FLASH	0x02000000
+#define MAINSTONE_RAM_SIZE      (64 * MiB)
+#define MAINSTONE_ROM_SIZE      (8 * MiB)
+#define MAINSTONE_FLASH_SIZE    (32 * MiB)
 
 static struct arm_boot_info mainstone_binfo = {
     .loader_start = PXA2XX_SDRAM_BASE,
-    .ram_size = 0x04000000,
+    .ram_size = MAINSTONE_RAM_SIZE,
 };
 
+#define FLASH_SECTOR_SIZE   (256 * KiB)
+
 static void mainstone_common_init(MachineState *machine,
                                   enum mainstone_model_e model, int arm_id)
 {
-    uint32_t sector_len = 256 * 1024;
     hwaddr mainstone_flash_base[] = { MST_FLASH_0, MST_FLASH_1 };
     PXA2xxState *mpu;
     DeviceState *mst_irq;
@@ -121,7 +123,7 @@ static void mainstone_common_init(MachineState *machine,
 
     /* Setup CPU & memory */
     mpu = pxa270_init(mainstone_binfo.ram_size, machine->cpu_type);
-    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
+    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM_SIZE,
                            &error_fatal);
     memory_region_add_subregion(get_system_memory(), 0x00000000, rom);
 
@@ -130,9 +132,9 @@ static void mainstone_common_init(MachineState *machine,
         dinfo = drive_get(IF_PFLASH, 0, i);
         if (!pflash_cfi01_register(mainstone_flash_base[i],
                                    i ? "mainstone.flash1" : "mainstone.flash0",
-                                   MAINSTONE_FLASH,
+                                   MAINSTONE_FLASH_SIZE,
                                    dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                                   sector_len, 4, 0, 0, 0, 0, 0)) {
+                                   FLASH_SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
             error_report("Error registering flash memory");
             exit(1);
         }
-- 
2.38.1

