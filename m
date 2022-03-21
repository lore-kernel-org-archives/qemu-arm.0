Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp553045lfb;
        Sun, 20 Mar 2022 23:45:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZKkS+f2/tAHI9vCQ/icT0HGZT/Al3F4F4sEvmAeeXqDeLzdolwK9f8s/AU5B217kbXauk
X-Received: by 2002:ac8:5b4d:0:b0:2e2:72c:9fd8 with SMTP id n13-20020ac85b4d000000b002e2072c9fd8mr7833609qtw.389.1647845157772;
        Sun, 20 Mar 2022 23:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647845157; cv=none;
        d=google.com; s=arc-20160816;
        b=Sp9uHRWlBDUcEAaLpXSYYhbVzGl1MqhZCstPnZ1WVDP1UqoB+9aGPD02ap9CN5ET5C
         RDoIWjku1WRpeUYfhJlhlx6lz8qj27kt9hulaI6hNZch7h+EYxG93LtZvYqT8vAaB/xk
         NMqn2SPATn32tDFF8NgVViEIxKHIioTDPc9keqoWfvznr8vSX6ww3pF+gI2TYUprWw2I
         TI/60I2EFyZi5Oggy+MGtv6yoUIkTvWO3nTWooEJS8DYQgtih7sn6/dLGvB6LzKrSwm9
         IfrAO+lqRP3JcnJZ5UwkaDeQZ1ZBWwoePCGeYlzwaMB+XHG21/So9KxZnwA8aPmJcwUe
         W+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
        b=UDfeU7MFykLa1C7mXhknQIBs6YkgbQXacXc0EXAvXCqdv7NAap9g8HqZj2XvM6iFbg
         xv/+OV14Mz35uJsyctc5hcWT3gtHsCp8PixKfRPoAjR1ghuWjXRk0TkJLC1EodJA98lw
         WdAA+zYfcUlfX2eOZEWCHGctcct+EsPgehgjnUVC9HTw279sXk+UY50uC+OrtUraYaEl
         QRfdd4tnWsTNrwziS16ydOZ4R6jopDo98Fp2o4iNQdL4IYLn9BlJYoVMrsy+UgQTdjUF
         Wev/meamDHOmhHwqWXBk6Wi9WKCENVXVg8LqGtHjG/ejES2bMx04VEEj8+w1tNkovZUX
         LoYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=6va+yBZd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a05620a400700b0067e4be237dfsi1886242qko.36.2022.03.20.23.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Mar 2022 23:45:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=6va+yBZd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWBnh-0002Nf-4q
	for alex.bennee@linaro.org; Mon, 21 Mar 2022 02:45:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nWBmX-0002Jq-08
 for qemu-arm@nongnu.org; Mon, 21 Mar 2022 02:44:45 -0400
Received: from [2607:f8b0:4864:20::1030] (port=41929
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nWBmV-0006aS-4L
 for qemu-arm@nongnu.org; Mon, 21 Mar 2022 02:44:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so9774857pjm.0
 for <qemu-arm@nongnu.org>; Sun, 20 Mar 2022 23:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
 b=6va+yBZdRMa8OiX41zIcE4L7cxT25XfysiaWalijZO7kkFauoDyXEtfvwtoVy/YnYw
 ZxDKHagdGaRLLXZk1q9kQuVxeFrlOUQyJAD9lZUbAJxZmTVY3lLa79cnVFRiQAN4Iwjs
 iRlzi9MfXSne4YAHl/yHdZtBRFsN6vjQ+HYWBuVGsQicbb6DfPP2YTzfI+CHW34GNxop
 84HNvqw3HR6bl9Gh0CYKz+eTzoVu/coZ4nnkac1ru5KECoak/jj1XZofpMq6w7ylVcR/
 SctYHGPzIUdLQWX6DdSxK1d8G5plB9rvBLckBVU1QXJ3MqOj6RMzDMz+jPmetKFil2Kg
 nVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
 b=MclpoUBvauA+TSIdpr7rAWGi3A+xI/EOOdVdQNARRJe3iXOdl+pdSJfA3TBo5RWuAI
 5tmkxFTQmyVDcuIqVkuWOBMPULtHUKPMNcHl2YsI02YnheMgVuMCFc6bRkymbMN3BjNx
 +dK2D+wPhVGJX7pNgiX4fQPhZwKLIrgqSdEEupq4rtcMKlM30Omx4WFldU5xdhQhNzJx
 kKoxu0kqqG1uwD8VAjaS6efS7DzfFvDuhDH6Q692VZOFGBqLvA6PltfpEOHGMJsuq2DC
 jyuX526wAMziY5W18TXZ7cHrANPZUtiUd2cHpudNBJjmsp5teAZSlq3k6tcyug6zII0V
 ol3Q==
X-Gm-Message-State: AOAM530oitZ9NRJ2DX0MP/YM2UCgBJb2HnHSVr7eO2aju01Lxm5Jvz1i
 ilXN/qCFbrxoe1O8Hy2RAdGl9A==
X-Received: by 2002:a17:902:a508:b0:14d:bfd8:58be with SMTP id
 s8-20020a170902a50800b0014dbfd858bemr11668079plq.10.1647845079698; 
 Sun, 20 Mar 2022 23:44:39 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm18628842pfj.43.2022.03.20.23.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 23:44:39 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/1] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Mon, 21 Mar 2022 14:44:35 +0800
Message-Id: <20220321064435.126799-2-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220321064435.126799-1-zongyuan.li@smartx.com>
References: <20220321064435.126799-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Real View" <qemu-arm@nongnu.org>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aIlp8k94b0+l

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/realview.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 7b424e94a5..97ace560bf 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -13,9 +13,11 @@
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/primecell.h"
+#include "hw/core/split-irq.h"
 #include "hw/net/lan9118.h"
 #include "hw/net/smc91c111.h"
 #include "hw/pci/pci.h"
+#include "hw/qdev-core.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
@@ -53,6 +55,24 @@ static const int realview_board_id[] = {
     0x76d
 };
 
+static bool split_irq_from_named(DeviceState *src, const char* outname,
+                                 qemu_irq out1, qemu_irq out2) {
+    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+
+    qdev_prop_set_uint32(splitter, "num-lines", 2);
+
+    if (!qdev_realize_and_unref(splitter, NULL, &error_fatal)) {
+        return false;
+    }
+
+    qdev_connect_gpio_out(splitter, 0, out1);
+    qdev_connect_gpio_out(splitter, 1, out2);
+    qdev_connect_gpio_out_named(src, outname, 0,
+                                qdev_get_gpio_in(splitter, 0));
+
+    return true;
+}
+
 static void realview_init(MachineState *machine,
                           enum realview_board_type board_type)
 {
@@ -66,7 +86,6 @@ static void realview_init(MachineState *machine,
     DeviceState *dev, *sysctl, *gpio2, *pl041;
     SysBusDevice *busdev;
     qemu_irq pic[64];
-    qemu_irq mmc_irq[2];
     PCIBus *pci_bus = NULL;
     NICInfo *nd;
     DriveInfo *dinfo;
@@ -229,14 +248,18 @@ static void realview_init(MachineState *machine,
      * and the PL061 has them the other way about. Also the card
      * detect line is inverted.
      */
-    mmc_irq[0] = qemu_irq_split(
-        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
-        qdev_get_gpio_in(gpio2, 1));
-    mmc_irq[1] = qemu_irq_split(
-        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
-        qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
-    qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
-    qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
+    if (!split_irq_from_named(dev, "card-read-only",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
+                   qdev_get_gpio_in(gpio2, 1))) {
+        return;
+    }
+
+    if (!split_irq_from_named(dev, "card-inserted",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
+                   qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)))) {
+        return;
+    }
+
     dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
-- 
2.34.0

