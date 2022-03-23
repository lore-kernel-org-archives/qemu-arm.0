Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2587802lfb;
        Wed, 23 Mar 2022 10:48:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoVo6ohQOjuNc3jL+7n6gwNL7aPSuWSO0+UBic8obgWboXI8lIHDjU3s7YC4tjujthtFVO
X-Received: by 2002:a25:ed0e:0:b0:633:8eba:b89f with SMTP id k14-20020a25ed0e000000b006338ebab89fmr1164649ybh.90.1648057693490;
        Wed, 23 Mar 2022 10:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648057693; cv=none;
        d=google.com; s=arc-20160816;
        b=MkpKWJPryrV9rjAZL4eIEhWoNLMrGd0jbMIgc8Jy5+SpR2OmUJpvlHptWPr4P97KSj
         5yq3Zd7BwKhQ+m1x8UW1RAVurTKzZ5Opac2mCouVHTQpV4IFKTnSfbeoj8ezDkaAVZbF
         2btOIAZgKZZwOUJLC2eYRkJcaTiQEca4oqK32OxqXeRSKM/dLWesprSMyWyIOfAE8qZi
         6HcODIgT+tVghAJhgk/i8axuqiq6mjsLdIuaXO5sXoFlDTMO33HIlg+RjyUQ7XuGoj6c
         me6tyNJNDtdCf/UzS7qFvpS+HfejUwMh+OeiRNv4ga+Yb8iDYU5PkT1A+roe/+hBKXOv
         Idug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
        b=aWHInAmRSphshQg5BzMnLbSaiAcOHdEWUgdE2BjwhAxjxVhqi8MftF5qVhnKi/qP2n
         2f9vLCQp5/2juHmU2CNMJoV+R+Dyfe92ESh9vRN/neO0ikjJwm2FRQa7q+l7z+ZPK+JS
         weMWPfUceAnusOhHOb1DdKoVXDVGHE6hgcQJJ0cQMg9K/FdJKovL+9yVOcHuHSqZtTf3
         fvnRpW5eNjoinKxJK2RG1S4VcZpiAEHV9nrqOVdjJPptw7Fzx55Ik4QE9EjJpvkdG+oQ
         eZ6bmMi7QCUuHimICG53yCeyQhgPb+y3TMnpm6/bB0yFqW65/4Bh/k+X44Sgo4yXlIFz
         1W3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=6uSggFfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020a25a2cc000000b0063399404657si17595121ybn.705.2022.03.23.10.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 10:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=6uSggFfA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX55g-0007e4-MU
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 13:48:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4u4-0008H0-JO
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 13:36:14 -0400
Received: from [2607:f8b0:4864:20::535] (port=38885
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4u3-0005Ti-3x
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 13:36:12 -0400
Received: by mail-pg1-x535.google.com with SMTP id s72so1713516pgc.5
 for <qemu-arm@nongnu.org>; Wed, 23 Mar 2022 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
 b=6uSggFfAaQs4U1h+AV6Kwn440TRAo/4Iv1yz4PaZlSeQubyjJ1+82P1uH1ezrPaUEw
 oi/I3QPxPmVHedOVSgNK3BYpI52OcZRNSFUr99irgY9YKezA9twR2hdPCO4tJzzJYf0r
 +FLCvIzElhQYkZ7Ax4zoyl9YnYKms2va2HRhW+CD3LLiVZyn7iNda2sHw0/DeyYClm0J
 cpkKXoyWxILWtu0FVnb7l/GCYjNHRkuXM1E/FKZB8rohNjDI8ZKHznb3bXhcOdavqCbR
 66/kHKmPbn185kWem1G0xDmJjWQ4rDu6FMcZzS9TBjSJWYlnWBkxnP15VquMAOvitNVw
 W38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
 b=eqp63U7nMK0UEU6d0iGLxKZXs4WL+2Gmv1GZm3jP2PgRpzdcgiaQVkU094noEXO8jC
 OJFMzrYstvtGjN1MAp7pjp+u6YpGvWPL/d6b0RzwZaqdDo/sTSnL33gkcX9d8KlNAGkd
 SNw7CcjhcK44K6TSZ50uYB6bz+IUaOC4N2IJN54hRDidqnBx4Szr1gX1aZV9uQhkFNOE
 kTtmyOJkLo5+1TXiGxMVrlYRPYwmYge18iG/28lsGClklj3/JLlW0x4qvPP1o7QsDdA8
 xc3jMqKaP60Gio/1bmcs/15vPp6MxuzH1ZQn/avVn64lnokUNK1+DkeNVtPqOz+p2oMV
 fpHA==
X-Gm-Message-State: AOAM530GEvdAhv6xw99UPDB/dvYL7fQDhhpDjhgRlI3Q7fx4TdgYkQXj
 e+54T37N59XrFtTWPGkZOmNgiQ==
X-Received: by 2002:a65:6cc3:0:b0:382:9d3c:ff82 with SMTP id
 g3-20020a656cc3000000b003829d3cff82mr816953pgw.110.1648056969949; 
 Wed, 23 Mar 2022 10:36:09 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:36:09 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Thu, 24 Mar 2022 01:35:39 +0800
Message-Id: <20220323173543.146442-2-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220323173543.146442-1-zongyuan.li@smartx.com>
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pg1-x535.google.com
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
X-TUID: +vHkKhOKtqn3

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

