Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp908731lfm;
        Wed, 8 Jul 2020 17:41:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmb3RbONoOU/tW2x3CS/MYzJmKlENGaAXX4rYfQLwKGMxmaQU0mkdtsNkLNAph2LAxy9YB
X-Received: by 2002:a25:808a:: with SMTP id n10mr84583482ybk.434.1594255277242;
        Wed, 08 Jul 2020 17:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594255277; cv=none;
        d=google.com; s=arc-20160816;
        b=s7mPRlYD4gFu5Dw3nWAquS6Sc0PN7SQqxAoJxIKXaDHDEeMDMY4mkHvY8bBQY1tyTt
         o22I3e8G6xxPjMBy5HoKSGZ+DqXhwxvgl4yQ0n/OoSXGXwX7i4Dbzk5eP4+8xFkj2q0B
         VjJtZk4jqk77BxFcMv6mmqOcDfzY6K5vlOqGfhwTPWYfAmUrOFgGATjhy2OUK9lx26eQ
         e+Z1GgXf+a+GfjCOvm4ANhT4KXl7yoUja/F3/xyEcPyUR77UpIWh5uyySg+fowDmQf8X
         iLYM9cEYQgOK0WLJLtFsr68yF8wWNFW1jUhTAer6x1K37HEP7EMM11H+xgVpfRbiA1kN
         z0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=eKgWkuM4GJmY6FctxrD+gBwcnEvk9udSz1JnbpjmKwI=;
        b=PRuYqOQmtEc2ZTyPf0NZY8QWkn8GIAxBCRViCZktTjBZCDgk30bUJgQmq0wbK3C/T3
         Ok0PFy/8sXnanr0JV0i2RqQiJhzx6ZgKUDld29PLUmsDcHJd2R/PnQJbQwuP/3/IZ/4W
         ZxtsGIZSo7Fw/AuaKXGPfBzxfi5jS0qA036MhJxeCEoDBmWxEW3PAbTy2A8p3yx27IGn
         fnmwXyAo70KyjSwi3wpLUM8NLH47mvz0gr4s/DHcs0Jkjkod1HPcXgRr03v8qWaL9Ima
         sCOmGX30wcFER/Ec/NPAXVOn8spA5eBKAw+uFfJ/yuzA4SxK+i24p0c0P1o9jbIInix6
         bxcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=l2tFO5xA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si1043332ybn.386.2020.07.08.17.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 17:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=l2tFO5xA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtKcm-0004ug-JP
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 20:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3lWYGXwsKCHofqigllckmclemmejc.amkocks-Ypklmlels.mpe@flex--hskinnemoen.bounces.google.com>)
 id 1jtKYK-0006XX-VD
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:36:40 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:51124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3lWYGXwsKCHofqigllckmclemmejc.amkocks-Ypklmlels.mpe@flex--hskinnemoen.bounces.google.com>)
 id 1jtKYJ-00012L-2i
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 20:36:40 -0400
Received: by mail-yb1-xb49.google.com with SMTP id e14so746320ybk.17
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 17:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=eKgWkuM4GJmY6FctxrD+gBwcnEvk9udSz1JnbpjmKwI=;
 b=l2tFO5xAXT13KB64jcjFMa/PIoPH4gxP9fN0XyUA/KRNQflP8MMSRvjRCULDtB5k9k
 oZn+LDDyqLSmItjSb8eTK6/8kPIKQb3av6pOnYfj/rm/xcgVI+FkMPrH8qT6WP5B7Hwt
 kPTwPMJB9zDuR+PuX3lYlMmNxb3o2VB0toz6fVjeoyEmRIrOyOzFtaDH3wYK5Pi2G6/p
 31RkAxVb1wbDkYm/vGW+cvm6Gr5/9l4fTtXoICFD6/CyBEL0w8ZTjLp4syNk73TMsbTt
 BdLIn/d6NTB5VdXZ7aOnkmxA6dpDpg/x2evQcO8oAPutUNq8f4lOUipqjzBH58V170mJ
 0E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=eKgWkuM4GJmY6FctxrD+gBwcnEvk9udSz1JnbpjmKwI=;
 b=t3HcufmZ1dMws+nYzITDUHqInnVJZtf7srmcjOmUNUVBBr2+qu0HXHVg0To/HmemU1
 Uu0jtB++QYrKu9k2mtgW0lC5l2fKd3UQjSoKLL5SYu4KEgxPjgKh2LU5c3HQwBpgPRbp
 USx4vIOI64RNYQmo6bCJGS63gatFB5oVJlbBV6Bg+TAJHCbWas+md9VTGxDVVJ1d4+QI
 +ee299KisFzsNGjO9iNOLY3og39tj5ADFVD8MdQwHVH1DeCnnHwrJtsNclc43KgIFmkA
 NaUA7hBwtFNolxuujIkoHPSG3X20XTe6Rr3FwNoGzkNSXj3vPkyraelcj1BoopAUmRR5
 3htw==
X-Gm-Message-State: AOAM530x+7uR/CD6EH6cDnInD0KXoj38LtZeKZajjulGHUjmw8iihmcP
 54Et0nywGOux3Qlisd1GHwlxV5J0odCd1POWvQ==
X-Received: by 2002:a25:aa4b:: with SMTP id s69mr31135660ybi.502.1594254997250; 
 Wed, 08 Jul 2020 17:36:37 -0700 (PDT)
Date: Wed,  8 Jul 2020 17:36:03 -0700
In-Reply-To: <20200709003608.3834629-1-hskinnemoen@google.com>
Message-Id: <20200709003608.3834629-7-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20200709003608.3834629-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH v5 06/11] hw/arm: Load -bios image as a boot ROM for npcm7xx
From: Havard Skinnemoen <hskinnemoen@google.com>
To: peter.maydell@linaro.org, f4bug@amsat.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3lWYGXwsKCHofqigllckmclemmejc.amkocks-Ypklmlels.mpe@flex--hskinnemoen.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GDbO2Ri2G21A

If a -bios option is specified on the command line, load the image into
the internal ROM memory region, which contains the first instructions
run by the CPU after reset.

A minimal Apache-2.0-licensed boot ROM can be found at

https://github.com/google/vbootrom

It is by no means feature complete, but it is enough to launch the
Nuvoton bootblock[1] from offset 0 in the flash, which in turn will
launch u-boot and finally the Linux kernel.

[1] https://github.com/Nuvoton-Israel/bootblock

Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 hw/arm/npcm7xx_boards.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index d78d9f991b..80cf1535f1 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -19,8 +19,11 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/loader.h"
 #include "qapi/error.h"
+#include "qemu-common.h"
 #include "qemu/units.h"
+#include "sysemu/sysemu.h"
 
 #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
 #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
@@ -34,6 +37,25 @@ static struct arm_boot_info npcm7xx_binfo = {
     .board_id           = -1,
 };
 
+static void npcm7xx_load_bootrom(NPCM7xxState *soc)
+{
+    if (bios_name) {
+        g_autofree char *filename = NULL;
+        int ret;
+
+        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+        if (!filename) {
+            error_report("Could not find ROM image '%s'", bios_name);
+            exit(1);
+        }
+        ret = load_image_mr(filename, &soc->irom);
+        if (ret < 0) {
+            error_report("Failed to load ROM image '%s'", filename);
+            exit(1);
+        }
+    }
+}
+
 static void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
 {
     NPCM7xxClass *sc = NPCM7XX_GET_CLASS(soc);
@@ -73,6 +95,7 @@ static void npcm750_evb_init(MachineState *machine)
     npcm7xx_connect_dram(soc, machine->ram);
     qdev_realize(DEVICE(soc), NULL, &error_abort);
 
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
@@ -84,6 +107,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_connect_dram(soc, machine->ram);
     qdev_realize(DEVICE(soc), NULL, &error_abort);
 
+    npcm7xx_load_bootrom(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.27.0.383.g050319c2ae-goog

