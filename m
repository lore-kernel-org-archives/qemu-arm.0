Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp12290ejc;
        Thu, 2 Mar 2023 09:44:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+afD/4QnIrnIXZ1VRxw1Ft7z/jUPUg/VnSnqP3P9bs5zK9qXTqeWeCvz/qZ1u9w1VZNK57
X-Received: by 2002:a05:622a:15c2:b0:3bf:db42:777f with SMTP id d2-20020a05622a15c200b003bfdb42777fmr19243973qty.0.1677779043191;
        Thu, 02 Mar 2023 09:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677779043; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMukIHHe+G1gLcRiP0HKmMYpu0d5gHpJNaAVpRrOzCqtusrD1byna9sQbTI9GvdGef
         cCVfZiPpiuc3hprWqXsr+ixG9fNEL4bATv/ZrKrxK1Rx6O6ooyxI0OvimWKFkYtRmmnZ
         DHJCC8TVKPx0c0kDvueI/c/1Rc9qutEGwpOxBxLYe/ExxdkCTx7kMCkpi1veccFaYe0c
         vhysyKObNyZqqaBNtQYwFfG+woL3R11wZ1N9UfPUjEF1isTdYym7V9RAZwMsemE9Rh5a
         kxDcAu0lIu+GDMVmao95QNjgDsMAWSlPR5PR8A2N+PD1UXId/A0jn5N46BEeRiEohAFr
         mZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Re83bXCTohlRnvmS4ZB8hyXARkAcmon7T81bNkubT3s=;
        b=AXNBx1UU/fg8CvZY9NXLVlkKCqGTdfYDHX7gTsavqJYobclabtzNjyG0A1gDVybRVW
         8eX2/YkM1ccEaPHP31ljzMOdjKdeA57KlWdEUgyEKdDF705swoDvzD35fMpTfiCT8yQU
         hSW/MCWJIa6S9vmbBGBROACLgRpMf3FhqIrydh+gPw43zP0ybM+i4w1RH9xycJBmD5zC
         F6CRx0s1yz0/nqUGdbtK83vq0hsxb4gklAGq2HTCduk6GVSbwueHbnyUXFBLr73Gu0bU
         eM0cgJLxnJN7s8yJhz4jHC5hsbOxsvrPaigr+Yz1W5ljoNlF3e+v/Op6CO3szE9qDndg
         uM9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020ac87dc5000000b003b6a098691csi119109qte.147.2023.03.02.09.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 09:44:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXmxM-0005Sf-St; Thu, 02 Mar 2023 12:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmx4-00051x-Ev; Thu, 02 Mar 2023 12:42:51 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmx2-0002oA-OP; Thu, 02 Mar 2023 12:42:46 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PSJN16mMbz4x8w;
 Fri,  3 Mar 2023 04:42:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSJN00rK9z4x5X;
 Fri,  3 Mar 2023 04:42:39 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 11/11] aspeed/smc: Replace SysBus IRQs with GPIO lines
Date: Thu,  2 Mar 2023 18:42:06 +0100
Message-Id: <20230302174206.2434673-12-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
References: <20230302174206.2434673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Cwst=62=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KODXjPR2H7JJ

It's cleaner and removes the curious '+ 1' required to skip the DMA
IRQ line of the controller.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     | 2 +-
 hw/ssi/aspeed_smc.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e2617388ad..86601cb1a5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -306,7 +306,7 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
         qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
 
         cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
-        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
+        qdev_connect_gpio_out_named(DEVICE(s), "cs", i, cs_line);
     }
 }
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 22df4be528..7281169322 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1134,10 +1134,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* Setup cs_lines for peripherals */
     s->cs_lines = g_new0(qemu_irq, asc->cs_num_max);
-
-    for (i = 0; i < asc->cs_num_max; ++i) {
-        sysbus_init_irq(sbd, &s->cs_lines[i]);
-    }
+    qdev_init_gpio_out_named(DEVICE(s), s->cs_lines, "cs", asc->cs_num_max);
 
     /* The memory region for the controller registers */
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
-- 
2.39.2

