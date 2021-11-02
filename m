Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4023042lfv;
        Tue, 2 Nov 2021 15:50:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweRmhdUhNMkqwMMUh+6JtT1iZEVwS9HRV06cyVX87OtOB3ucSR3DSYCSHJNhjtteinn5Db
X-Received: by 2002:a9d:6346:: with SMTP id y6mr30816948otk.154.1635893459138;
        Tue, 02 Nov 2021 15:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635893459; cv=none;
        d=google.com; s=arc-20160816;
        b=g69m3LbPxkgO14uwIPjksMZPKd7pz5oGGu2yWo+Ys2lR5ALLX6FSK7tAml7MrpVM6k
         Ch4pmNSMdQtllG1/d+Og0htNoGzSkEJT3PFYMLJpaVLOLysEybLZIhyKp+hS5WUDcOiV
         9FKCTRqUTwf9NgKdvDOfplKKHkrjCQoe7RJ507gw0Y5ALNLlxpoNkNa0wns4gNzteJ/c
         XaGsZ+vm1QsIi/ETRm9rL7lJYeyZw4Ar0wQ7ZRjSpJd60xu2E3T3iBW8mItpjJiyfEv7
         mbgjocg2zZa6+rk+ALjAzlgJx+E7TUGWyw2TcHQMHVch0xLDO/unSUEmyGi+dGFCOZT0
         D9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=Dh6lLd3kW4ekavLFMnJxd6EMIooNZ2ySdXhGaXI8BYk=;
        b=UrtT1sveFrWklE1sbED/T2j0WQB6y58WvFb3+ksCdWgMRLd0anJm/slBKtQJWHrCCn
         xzzE+UCn/kw5HlYt9jXembPRY5s8dW25Awjo5SJ7HU21pyHMiKUW9egUlhNh6UmxplGN
         529KJF6v2R0gLU+SiNWekTfg1X7J3db1Ke2bfyCXm8IdE7nX/R7WNykGvL3y+1QucMKF
         fdtFZQiOHtLOC1/S4caETUt/gDdfCRUvL5ChSzlc7yiZvHptzGEErcGgrF7yaEXrM4vx
         EU1ZeR726SqzG8rRwGjpdLqPdrcNhT9Wq0EIFB2P4mpqKUkNiI/1L67f3R2xz0p4p0Tz
         Tl+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Q1Kt9MU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14si680768oiu.109.2021.11.02.15.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 15:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Q1Kt9MU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi2cM-0001ha-E4
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 18:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gMCBYQgKCBsNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1mi2bC-0000nW-0v
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 18:49:46 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:49800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gMCBYQgKCBsNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1mi2b8-0001G5-51
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 18:49:45 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 y13-20020a1709029b8d00b0013dc7c668e2so398237plp.16
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 15:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Dh6lLd3kW4ekavLFMnJxd6EMIooNZ2ySdXhGaXI8BYk=;
 b=Q1Kt9MU25wMrJmO0bfkFhhxg0mGMV8zMbwRbH3nqGHtJZnIwHj9S+KB0qep1RufNTU
 jvNcKiXAsyTVtX78rGrHB1WUAgOM70iXqOAxpS+xHbB4gscPGCjM9mqmkg+u75gb+TY3
 6zLvmFx81HmV3e/STnsv8MC31HhEYdkNOTVCBfHY5MKlWXlX4jIZIN2FWuXfscSQ58Ms
 nOlW2CfONfLlNPJjZnapL7ayEsF+aGwxxwegsU4M3OoLohtr5TAHcrGCAUkBGMfi2XA/
 nFTCV08sgsSUslgK6xXL5GfoXP0gWcNAc2FDfQLDeJIMi/Fo3SNtOhiFMYWryhdMMJC7
 cAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Dh6lLd3kW4ekavLFMnJxd6EMIooNZ2ySdXhGaXI8BYk=;
 b=pUSz/bG4txGgeKdbnHSjypmJ7RfBViOJL+/e2ExC6u+aNo42m2AvKJzKODL+JsfOwY
 R6toqmpmlKShNqY3et+zvIhlVhfBRA7/G7eTpSuozlNjAEmRGN3H7ZiLrTJINanNCD03
 Gs06v1r05cz0BxtQ2PjnnEiaVuLIcW/UIMM9xD5sCKKTFDvpaItpqG22TVap/MTfHc/7
 FP0UKd/bjBwulPEURbiwipJrs8j3Dfi9pxPBuG6pyQqueFl+LBI/EQGvDKS2iMnOwhOf
 /NvXhLcafqJ0CBPpNkHI6JzhpmZvTnxrqdsmIz2hMZDjmaN2vHOLD4+Tky7vNFlQbvFG
 Vcow==
X-Gm-Message-State: AOAM532+3uLoSmDeBBXxwH/ORljaSmwspKsvu9Jg5VbkTopKvHCuvFNq
 /SYk1IFli8QONhszKxCGKVTwfgkcuier/A==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:5285:: with SMTP id
 w5mr257829pjh.1.1635893376854; Tue, 02 Nov 2021 15:49:36 -0700 (PDT)
Date: Tue,  2 Nov 2021 15:49:21 -0700
In-Reply-To: <20211102224924.1244946-1-wuhaotsh@google.com>
Message-Id: <20211102224924.1244946-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211102224924.1244946-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH v3 2/5] hw/arm: Add Nuvoton SD module to board
From: Hao Wu <wuhaotsh@google.com>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3gMCBYQgKCBsNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: WFcIhbqNLy3u

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx.c         | 12 +++++++++++-
 include/hw/arm/npcm7xx.h |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 2ab0080e0b..878c2208e0 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -63,6 +63,8 @@
 #define NPCM7XX_ROM_BA          (0xffff0000)
 #define NPCM7XX_ROM_SZ          (64 * KiB)
 
+/* SDHCI Modules */
+#define NPCM7XX_MMC_BA          (0xf0842000)
 
 /* Clock configuration values to be fixed up when bypassing bootloader */
 
@@ -83,6 +85,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART3_IRQ,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
+    NPCM7XX_MMC_IRQ             = 26,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
     NPCM7XX_TIMER1_IRQ,
     NPCM7XX_TIMER2_IRQ,
@@ -443,6 +446,8 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
+
+    object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -707,6 +712,12 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
                            &error_abort);
     memory_region_add_subregion(get_system_memory(), NPCM7XX_ROM_BA, &s->irom);
 
+    /* SDHCI */
+    sysbus_realize(SYS_BUS_DEVICE(&s->mmc), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->mmc), 0, NPCM7XX_MMC_BA);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc), 0,
+            npcm7xx_irq(s, NPCM7XX_MMC_IRQ));
+
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
@@ -736,7 +747,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.usbd[8]",      0xf0838000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[9]",      0xf0839000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sd",           0xf0840000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.mmc",          0xf0842000,   8 * KiB);
     create_unimplemented_device("npcm7xx.pcimbx",       0xf0848000, 512 * KiB);
     create_unimplemented_device("npcm7xx.aes",          0xf0858000,   4 * KiB);
     create_unimplemented_device("npcm7xx.des",          0xf0859000,   4 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 61ecc57ab9..ce593235d9 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -35,6 +35,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "hw/usb/hcd-ohci.h"
 #include "target/arm/cpu.h"
+#include "hw/sd/npcm7xx_sdhci.h"
 
 #define NPCM7XX_MAX_NUM_CPUS    (2)
 
@@ -103,6 +104,7 @@ typedef struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCM7xxSDHCIState   mmc;
 } NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
-- 
2.33.1.1089.g2158813163f-goog

