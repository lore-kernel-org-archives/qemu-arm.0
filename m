Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1962937lfp;
        Thu, 7 Oct 2021 17:28:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+AEsytAOaXrVZPn4p8JwMvgsZxuqvvRL3b1pjBtMslVKQAjkZOr/bCOuWFzHrW42u+OrF
X-Received: by 2002:ad4:4b63:: with SMTP id m3mr6351104qvx.28.1633652919745;
        Thu, 07 Oct 2021 17:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633652919; cv=none;
        d=google.com; s=arc-20160816;
        b=QQLggnF8NBZdaCzATPQZ2y2gO1bKzi0DMjChaRMU5xU2P9H9vtsFwxzWAvNV+qy/Lf
         tgseZzsG5jIP/8U/Adxa8N2C2gwVYfRKWvYwdUUj9YhfcQ3HHZOfwhWgoz3ebXa8tsnG
         gy9rZge9SMxbG6+3EGAYLxwIcU7AETU8XWobRy3LeuS9ZncZDBkIRknt6OL39QrxxyQE
         qbnp8HEdFauQ5E22ySlKhz7aWy1Miw5EYDcxpksbF85U9wCmGZW3CPW9wmhpnCPFWwYY
         BWJhlu/h/DnAyyfJc4IzwBL8qDZvEQpCpfeMZzeZtUzNc6/Kh8AsRji9szkjyXlkKlVC
         JHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=RUFIHqQgzKHAYzgvfLX2dBhiI3z1o+bUvwHqnylQN7c=;
        b=mYbV5hN0wCj/x1Ms+p+X+UE0E6gNmI7k0Obp6MxNA+8GiDfxQA31VY8rgs4xk557QT
         ZRx3U4YpjxvVySVyDYvNXs46OG5aljxWOveJ89MXFuhkA7Rrn+drzNeRZIsx0qaj+81i
         QTLs/A8LWI27Ivqdh8J4O7wcPeSzDdWK/R+2u3+NmYpddOIVtsuG3A+WGbzUohYSM4GY
         MInF4MYbzneAHZwHvwnoordsBXTVxW6A3UXfd8k0DE0NSON9YE+FMFvgCL/jTLSiS0/b
         6aHFlZlKxB3yGsq75zjRU0w4Re6CNVq2gOt+FCa145M01WaFwClQMas6J+q0ZYS0vJf2
         B/SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=nQGKgDaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20si629406qvv.61.2021.10.07.17.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 17:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=nQGKgDaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYdkd-00045X-5c
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 20:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3SZBfYQgKCPg1zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mYdiy-0001Aw-Nd
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 20:26:56 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:47711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3SZBfYQgKCPg1zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com>)
 id 1mYdit-0004Eb-Vp
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 20:26:56 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 on18-20020a17090b1d1200b001a04d94fd9fso1481849pjb.2
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 17:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=RUFIHqQgzKHAYzgvfLX2dBhiI3z1o+bUvwHqnylQN7c=;
 b=nQGKgDaXsdMMSoQIe/qQFp2D62Z/eQCNlmluEOAsbdI3sF3FwUGhGGWs81+6aK5EV0
 ii6iWC4DXJGjcZZTQw/wIOWjZtVHD3A6JxwfsNaWljnxGGxqglVu9LvwtsPK3oCI71f8
 XVxcXOus5h5UrWkGloxcWxeVuq4xs2NN7EkUJW52UGhN6aiKw9HqhdF5vukxnztOdmdv
 FpUXxy0NIuCHvJPXoBQ2eL31ZM2HqoLpxZpD3bbh8vsvo1sbFMc4d75BCS58nBuD+vt1
 MqC2Yg8WXHc0+jl9V4zc0Y0/MCSLhOydMTWrgqYdN3Li7raksxcSIs028bjUJ7DV+ECl
 CTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=RUFIHqQgzKHAYzgvfLX2dBhiI3z1o+bUvwHqnylQN7c=;
 b=Ayke5bZAj+C4KgnXfaiWklVcaD5MnCpgNdjH+yeEIvOVhvpVnSqTRK5A50n0U/qXGm
 ZjIajwji8+k4SWlLzVf6CfOlklFStCKyQb66nbzxxryjC2kZ1gPcdhteRwNKSZI99Iy3
 uI55mO1bkRl1tVYvRAti9EcWj4i0KhmlTupBJn5LagihOx/L9G8eb/XXuDTKwLT3Bc38
 2as4qzG2GdSqxMwCQCURw6JV4jNA8+KiajOCsettb6FkzL4j6ZcZzMMFXY3rGimZxC0j
 7xIIiYUjSuYnBEw4YE1QhAhNT8M9NC0NeRLijuQ5yMBdTnX4MeuI/6O2NDskVkMo6PxG
 vcxQ==
X-Gm-Message-State: AOAM531dRE4TF0IMffQPHGQ1eHHFadUfm8xNlFD3BVMjdDgnC8NV3RVK
 V30gwZoGNMbpJYwlFqxz7T9nhvF+K0pqLQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:3ec2:: with SMTP id
 k60mr6864140pjc.176.1633652809556; Thu, 07 Oct 2021 17:26:49 -0700 (PDT)
Date: Thu,  7 Oct 2021 17:26:25 -0700
In-Reply-To: <20211008002628.1958285-1-wuhaotsh@google.com>
Message-Id: <20211008002628.1958285-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 2/5] hw/arm: Add Nuvoton SD module to board
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, maoshengtan2011@gmail.com, 
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3SZBfYQgKCPg1zmftyxmlttlqj.htrvjrz-fwrstslsz.twl@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: AfUnyxQXhnsw

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
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
2.33.0.882.g93a45727a2-goog

