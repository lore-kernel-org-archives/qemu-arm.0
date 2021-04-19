Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1006386lfb;
        Mon, 19 Apr 2021 02:47:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOKUqeYzf0low/2h7p4RA2EhEIF1BIzXqoeot3ed87JzbTpXFxxWcYw8FI2tREweAoFtkP
X-Received: by 2002:a25:cbc5:: with SMTP id b188mr16649270ybg.58.1618825632836;
        Mon, 19 Apr 2021 02:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618825632; cv=none;
        d=google.com; s=arc-20160816;
        b=fvE+EIhUtx+kqFPwRGJxu3vUya/MyqR0PFxDdq/LU6m6Omt+wSHnqx00aB+sYv66tY
         rYcPTYSFBoGuWMOC6Mkbwtfw5eZcegT0LyeeSznMnh8NdBSOY1rqnqubtYnsQnlM0g/q
         e/+LaSFAdG+m1jUgip/vxipWgCE9PM/sWCFWRO3HUDS3I0+s1JwK/Ig8P5RnQCpZWYLA
         9LM1APGQZgqtbtjUCqwBEofR/MfG7ZDoTw4Y5QuWluXg6k8x2uPQZhMoqMPG3Oul8Fq/
         CFm/M2ePlyBgsYgdsXwmhTFbnMHzfTRSnbvZ5S2nB9FIVh4kc6m0OVGyHbvGVa9wVXP6
         DGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sOI3H+tYEXd1gcKPERk4u/zYCW6lDXvWoG47VXjTEXY=;
        b=TlSYAWByYLLOzSKA0ELwAINWAk+A6vJ/RupYb4tZlB3wsJa5wuGLdBHssj98P1D9IT
         ANi6GXNCKavPS1cg6VbDI6LYm0NbYIp8NKi1SODuigr076fzdftU6a8lmzYScxTPIMQ1
         823hY11EcNQ+QLI4llHG5Sh2PPMGRbUbDQWQgWnPt2ZCZQAkMOKeOQ/G5xf3V/uwTjDH
         dEm2Obas0lYOpVOoP9p8KQ86QlVJE4MRkri8Acjq58GBcvpjT/+2+C8N+rbTILubELd9
         KDK7gpfYPRTrvKyu/QURGD6MDeEtT9iB1iMurE/tJi5m79TpS27svMfgYS0Fgof3xYE9
         QlNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nlnMkk1k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p200si14748243ybg.259.2021.04.19.02.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 02:47:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nlnMkk1k;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYQUq-00054e-5c
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 05:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRb-0002Go-7k; Mon, 19 Apr 2021 05:43:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYQRZ-00033n-17; Mon, 19 Apr 2021 05:43:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y5-20020a05600c3645b0290132b13aaa3bso5946115wmq.1; 
 Mon, 19 Apr 2021 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sOI3H+tYEXd1gcKPERk4u/zYCW6lDXvWoG47VXjTEXY=;
 b=nlnMkk1kQt/iKVsv2fedv82/l50YhHkqHpq4NcVZXZjb9K/BsVRpmiu1Q7FID/ftRq
 nsJb/3wWfDWXRiYkmXdNPGED6hSB0kJQu12Kh7vXs7shdvtli8aGeUSjXbYQCCkuOsda
 8HBNVlZ+njCWONPSiuPiiUVsuIqYFEkPseDhncB8Rxu+deCyRDCVvT12lLEA5w1WUa6a
 QoTUc8sDmol5581JT8sStejNmaNPwIlqUVYcwl6w78Do7WZ7xEDKF0oGASE1+GwdF+wA
 1xS9Bg/2HtpwOtS/Btgu+RHPrErgPZCLRJPxW9+BX+YPlq0TF6OVEJMxfqotr6S1Ffhk
 p9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sOI3H+tYEXd1gcKPERk4u/zYCW6lDXvWoG47VXjTEXY=;
 b=uK9BSwdiMybORvjSkwD3NXcp8KzFAalF5iyeLulIGoNhMQZaahSEzh8xogRpqx+8P3
 ypEfYAB8Rk7xXc9FMdfDe7AGlhr1T7A5QHA2npjwqn9AwPHomRKXA8jHHZtXAxbUdEsT
 PIFxoogO6Db80srropieyjtC1WUFsIDJWHx7fvUIC4yLnnb9E+rhd9soGIsZCfuuFKRj
 M2/cZV9OyZ2T2CabsPLpXrhVB+6P+8fEu9uxqW7ytF+NaTRtaDNoXAu7MoR026YtvTns
 /12DdfA+8CmPYlzQ/hKp9WGLGQZ9w4ql8GfddRr5XR05vs/Cef4qKaWLqAR3j1Dg3MuC
 VQWA==
X-Gm-Message-State: AOAM532P/c1LnJLj04C0dbytMBGs+ExChsg382x8wp7cEvyZhMebbH0j
 84tOE51sIUa8ReWae7r+2CyAetMVgdxDOA==
X-Received: by 2002:a1c:6241:: with SMTP id w62mr20425567wmb.79.1618825426436; 
 Mon, 19 Apr 2021 02:43:46 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r2sm21846731wrt.79.2021.04.19.02.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 02:43:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] hw/arm/musicpal: Map flash using
 memory_region_add_subregion_aliased()
Date: Mon, 19 Apr 2021 11:43:25 +0200
Message-Id: <20210419094329.1402767-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419094329.1402767-1-f4bug@amsat.org>
References: <20210419094329.1402767-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Edmondson <david.edmondson@oracle.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l9drk7ZIskvG

Instead of using a device specific feature for mapping the
flash memory multiple times over a wider region, use the
generic memory_region_add_subregion_aliased() helper.

There is no change in the memory layout:

- before:

  (qemu) info mtree
  00000000fe000000-00000000ffffffff (prio 0, i/o): pflash
    00000000fe000000-00000000fe7fffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
    00000000fe800000-00000000feffffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
    00000000ff000000-00000000ff7fffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff
    00000000ff800000-00000000ffffffff (prio 0, romd): alias pflash-alias @musicpal.flash 0000000000000000-00000000007fffff

- after:

  00000000fe000000-00000000ffffffff (prio 0, i/o): masked musicpal.flash [span of 8 MiB]
    00000000fe000000-00000000fe7fffff (prio 0, romd): alias musicpal.flash [#0/4] @musicpal.flash 0000000000000000-00000000007fffff
    00000000fe800000-00000000feffffff (prio 0, romd): alias musicpal.flash [#1/4] @musicpal.flash 0000000000000000-00000000007fffff
    00000000ff000000-00000000ff7fffff (prio 0, romd): alias musicpal.flash [#2/4] @musicpal.flash 0000000000000000-00000000007fffff
    00000000ff800000-00000000ffffffff (prio 0, romd): alias musicpal.flash [#3/4] @musicpal.flash 0000000000000000-00000000007fffff

Flatview is the same:

  (qemu) info mtree -f
  FlatView #0
   AS "memory", root: system
   AS "cpu-memory-0", root: system
   AS "emac-dma", root: system
   Root memory region: system
    00000000fe000000-00000000fe7fffff (prio 0, romd): musicpal.flash
    00000000fe800000-00000000feffffff (prio 0, romd): musicpal.flash
    00000000ff000000-00000000ff7fffff (prio 0, romd): musicpal.flash
    00000000ff800000-00000000ffffffff (prio 0, romd): musicpal.flash

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/musicpal.c | 11 +++++++----
 hw/arm/Kconfig    |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 8b58b66f263..7d1f2f3fb3f 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -30,6 +30,7 @@
 #include "hw/irq.h"
 #include "hw/or-irq.h"
 #include "hw/audio/wm8750.h"
+#include "hw/misc/aliased_region.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/runstate.h"
 #include "sysemu/dma.h"
@@ -1656,7 +1657,7 @@ static void musicpal_init(MachineState *machine)
         qdev_prop_set_uint32(dev, "num-blocks", flash_size / sector_size);
         qdev_prop_set_uint32(dev, "sector-length", sector_size);
         qdev_prop_set_uint8(dev, "width", 2); /* 16-bit */
-        qdev_prop_set_uint8(dev, "mappings", MP_FLASH_SIZE_MAX / flash_size);
+        qdev_prop_set_uint8(dev, "mappings", 0);
         qdev_prop_set_uint8(dev, "big-endian", 0);
         qdev_prop_set_uint16(dev, "id0", 0x00bf);
         qdev_prop_set_uint16(dev, "id1", 0x236d);
@@ -1667,14 +1668,16 @@ static void musicpal_init(MachineState *machine)
         qdev_prop_set_string(dev, "name", "musicpal.flash");
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-        sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
-                        0x100000000ULL - MP_FLASH_SIZE_MAX);
-
         /*
          * The original U-Boot accesses the flash at 0xFE000000 instead of
          * 0xFF800000 (if there is 8 MB flash). So remap flash access if the
          * image is smaller than 32 MB.
          */
+        memory_region_add_subregion_aliased(get_system_memory(),
+                                0x100000000ULL - MP_FLASH_SIZE_MAX,
+                                MP_FLASH_SIZE_MAX,
+                                sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0),
+                                flash_size);
     }
     sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8c37cf00da7..aa8553b3cd3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -101,6 +101,7 @@ config MUSICPAL
     select MARVELL_88W8618
     select PTIMER
     select PFLASH_CFI02
+    select ALIASED_REGION
     select SERIAL
     select WM8750
 
-- 
2.26.3

