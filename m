Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3411359lfb;
        Thu, 24 Mar 2022 10:24:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTYcEeCLqKsEbS5Lu8WTSitG39gtU4Foeew/I1dxQpYyi2+NbCtAtN8kpYkviMwpPbC88u
X-Received: by 2002:ac8:58d2:0:b0:2e1:c5d9:9060 with SMTP id u18-20020ac858d2000000b002e1c5d99060mr5321389qta.168.1648142655422;
        Thu, 24 Mar 2022 10:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648142655; cv=none;
        d=google.com; s=arc-20160816;
        b=GpEmbrTUIHT+NzuYrW82AJqW5w8p8bdYPmHD4R7i4/OIo2ZJdhBO4ZIcTVRWkOG4Va
         hjNsSRMydISB4tgyTNvrhWJGHiUMS+c4gn5wQP8V2tjlJ8O2eRLJsVTHYPN6cwiOEgl2
         w8TKNa32/1XZJtlwT8QqjOjGE6vuoDvfBTaK69BJ8+W3dqaUNo9ZJdCxJ6GzmVLoki7P
         58x5oNwqmwPjp/6/2TeuhWBtgZDNVlXIPoxzOlcGwsCl+r8IP9BlYZ0IoLMSL2LUanm4
         uFZ6JjLKDW0V8PCErAQy5Eu3yOX2JHF6AhlMemKc8/RuWSts9r3rrBasUfmEXnK2hFEi
         UD/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5SrYGGx56D5KZCgDRAE+ARenQHiw5A2xBeYHRC7blJI=;
        b=FHS6uePfg6PJp59ESyqtP0cHpUdFpkVYoHVfBFkzJeh0uXHGPOyCj5GzG6JX0/yONQ
         88fNBGMc/M2W7T626KgW4KSIUKx8tDR4KCS7BUguaNz/w+LlsCb+AMSe2T6urrZAZzqM
         EXRT0ZDjA78jquQTi5jMIZaF5/DVdxrxPfB82e+W46FmrvGNBsLIsk4zO0ktqBjZj0/p
         aghqWjmgDIBXm/Ia0eXbCjHKf7PrB4ICDAovJIkukgX4HhuPplM0kvhJrWx8rN/1ivw3
         V5iwQ0nlRu6AcP+tvUiL6JqisnWVfaUn8fvC48idXvqD1QzKUpCWMBmfQdIZ40orJACS
         lWGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=VvpnpxAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a444c00b0067e4be2389csi167713qkp.225.2022.03.24.10.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 10:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=VvpnpxAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXRC2-0002Cf-IM
	for alex.bennee@linaro.org; Thu, 24 Mar 2022 13:24:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6d-0006Pa-NF
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 13:18:39 -0400
Received: from [2607:f8b0:4864:20::62f] (port=42526
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6Z-0007oH-UT
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 13:18:37 -0400
Received: by mail-pl1-x62f.google.com with SMTP id p17so5426218plo.9
 for <qemu-arm@nongnu.org>; Thu, 24 Mar 2022 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SrYGGx56D5KZCgDRAE+ARenQHiw5A2xBeYHRC7blJI=;
 b=VvpnpxAWwf9ervUcb2DR1t9oLzzhm3XJ506OsPjNuImD1kwoA7rnJH7XZ72UMcDUki
 4+F3qqlmjHs6jq4gVx6+vxrMmZ01GVkCKuwKKYOtaJF5AtoZQw7YPlyMzGm2EQo4zsei
 SIr+bjPlOflAMsM0NBGrVADnrOoT2V4V8Ok2CD55+mTF668K28gFmHrtnqnQwWvS1kjN
 bBwLjdNjJfpLrhqO/fxlujmuOCwGhwm28IZt6/RVURpG4+xa08ngXtsqEGt2LudqP38J
 4lxbhz9ROj932+rRkPiRo3I7tRRYEGIjxPhVt8fj3gy/BRjvAYlB44R9QenNf6dMGLAl
 +YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SrYGGx56D5KZCgDRAE+ARenQHiw5A2xBeYHRC7blJI=;
 b=AeZinO0G45QUa53AtK7aGhAuAl12AUeXYYOV/XDsGLJnJZsq4e1VOWZzwo5kSCdW9z
 G4HPi9TeB00E3sH8I9NUpGprEIQH/lOSvGfKy1FShGv9buhXZ+Bujzvr/GnDNebI3zzg
 VYkVvPErAG+x3L03EFD48O1KcIcZYnZRu1IXtbyO+zBxEjlvzlqZLywbOWzDGk3YqdmF
 8bkx790l9BdFnNjDGgrAw2lWIU9J5lPuj35WBwJQIORy/HepgOux46McIVm4bUm4/8dg
 VakxmDTfCZoKIjuNVr/TQy57zo5+fp6ScRzBNXkfrjOsoZSZubu203nUSgeHoddK2kWj
 0S7A==
X-Gm-Message-State: AOAM530uUAWb6sEVlsBHkp/xPnR0N2huGs7VWsAx+e7wUPHSi8dp25Nc
 V4YvHeWw6IivHZ4n8JSmo5Bdqw==
X-Received: by 2002:a17:902:c215:b0:153:8d90:a108 with SMTP id
 21-20020a170902c21500b001538d90a108mr7115631pll.172.1648142314336; 
 Thu, 24 Mar 2022 10:18:34 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.10])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b004fa666a1327sm3937412pfb.102.2022.03.24.10.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:18:33 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Fri, 25 Mar 2022 01:17:53 +0800
Message-Id: <20220324171756.196654-2-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324171756.196654-1-zongyuan.li@smartx.com>
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pl1-x62f.google.com
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
X-TUID: cdM12X1qnvBr

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/realview.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 7b424e94a5..d2dc8a8952 100644
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
@@ -53,6 +55,20 @@ static const int realview_board_id[] = {
     0x76d
 };
 
+static void split_irq_from_named(DeviceState *src, const char* outname,
+                                 qemu_irq out1, qemu_irq out2) {
+    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+
+    qdev_prop_set_uint32(splitter, "num-lines", 2);
+
+    qdev_realize_and_unref(splitter, NULL, &error_fatal);
+
+    qdev_connect_gpio_out(splitter, 0, out1);
+    qdev_connect_gpio_out(splitter, 1, out2);
+    qdev_connect_gpio_out_named(src, outname, 0,
+                                qdev_get_gpio_in(splitter, 0));
+}
+
 static void realview_init(MachineState *machine,
                           enum realview_board_type board_type)
 {
@@ -66,7 +82,6 @@ static void realview_init(MachineState *machine,
     DeviceState *dev, *sysctl, *gpio2, *pl041;
     SysBusDevice *busdev;
     qemu_irq pic[64];
-    qemu_irq mmc_irq[2];
     PCIBus *pci_bus = NULL;
     NICInfo *nd;
     DriveInfo *dinfo;
@@ -229,14 +244,14 @@ static void realview_init(MachineState *machine,
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
+    split_irq_from_named(dev, "card-read-only",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
+                   qdev_get_gpio_in(gpio2, 1));
+
+    split_irq_from_named(dev, "card-inserted",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
+                   qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
+
     dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
-- 
2.34.0

