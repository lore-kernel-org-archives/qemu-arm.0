Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2579447lfb;
        Wed, 23 Mar 2022 10:36:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgj1lF7tHeSpqSF5dhG79NLQeI5KeSv17zM3Z5TUxydDCWg2puZZR5j05F71PLPG1ZhDFW
X-Received: by 2002:a25:af83:0:b0:633:73fb:ff57 with SMTP id g3-20020a25af83000000b0063373fbff57mr1119547ybh.46.1648057009399;
        Wed, 23 Mar 2022 10:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648057009; cv=none;
        d=google.com; s=arc-20160816;
        b=VOWMqdtFWQVoHTCFJ89Clvqvaq2zSFJHcFBv889NNxO/cYaK4cSo0n5dxb90A2y0TS
         /5WL6cTYYHQboG6zA1hvew8/mZd6g9DT1XcK8OZqcm2ldyiQORO2Xs8IERxhRsyMTA9p
         MToWJ6EIUh38pxu+e96GO9Y3PBo9X1HLSfVSif8o0eQ1p0p3nEq8mILGCA6VewXESbiU
         j/2LUKrs6EZwWWoKyakxupg0OYbsLEmdi4VgdU1hh3aOl3JYGB409tPxW9TYhgiLVDnu
         BP66OlP7SJBMjTgTuTxhLs0zr6wMgfDjHJsaPJBcMZCsHQmoJ5ocUb3PNi6S7ki5eSSZ
         PH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2EsJ9w4OtAe62QE/DTZfa1jMS0xrU6YKS1g+C71i9i0=;
        b=j6jnykqSMwe7xLQb2e3DpkBnq1zomMXKa18eQwLwZp9VXoq0ojXsotF6STtzYXvA59
         g8ncnd9UcwMDws4sNQPd4cMvFP4ttAiTOKxD+W2EWGWkQBTJAtUon7cVfUfJebsaboCH
         xnBw3Yw/xJNvYjD6kAMV2wXt3IBbOyoWe0F1lGqrrfGhe/EYVtKajpJVa48J9JhRZZ9d
         mHd7etg7W8be8u7xTH+cOWeC7q5wIScgyNhG+gKOXL6pOeYCaeNHLRXh3PR9T9GrWCrX
         3yJm+RqXs/VXBrcHzVvkF2KvF/jpvyqCi0+eJzx82HpG4Fe8xUhL4jcA/L1DvScPosZY
         cK5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=zCGPEDVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9-20020a258289000000b00633994045a7si16519304ybk.529.2022.03.23.10.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 10:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=zCGPEDVJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX4ue-0000ln-PM
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 13:36:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4uM-0000Me-4p
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 13:36:30 -0400
Received: from [2607:f8b0:4864:20::102c] (port=50959
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4uK-0005Xg-Il
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 13:36:29 -0400
Received: by mail-pj1-x102c.google.com with SMTP id m22so2451913pja.0
 for <qemu-arm@nongnu.org>; Wed, 23 Mar 2022 10:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EsJ9w4OtAe62QE/DTZfa1jMS0xrU6YKS1g+C71i9i0=;
 b=zCGPEDVJ5j3EC41nOk4QuQmCLFTk53zzMU3Ql176m0Y1S2MTJ5ZY2xhCTiRzMotFvl
 npA2hcQUbmlUwa4GmLxdaXLuc0jdskSRZPgPzahpxNK0aRzCJbOQqGP+BD5+Bs8CvsG6
 SmjcuZzbkkYZXau5WnywH9kompyxYEO8JvDbmYXi+7KdHIwsD0uHHec0x10Mt5thUk/Z
 Pu4taNH5E65PH+SQGttNQu0PlQ0ab8yco8Kx9OZjfCTSS8kH6t1L6W4Td6aYL+FMaGxm
 iS1py578GyQtem+63rKDUL+jXPbLyozBrhdrlN4OcfY7A8HzpXAGQJ5ZQ4A/QXQBp7Gp
 qyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EsJ9w4OtAe62QE/DTZfa1jMS0xrU6YKS1g+C71i9i0=;
 b=tpEU8xvykltaSErpJBhhzVju+g0NXxeDDC1nzN+ZKYT6o3HkI87hWvwocsJdXvXK47
 myUOuoRp2gF6//llF+82maJFF14/YF6t9VrKM14cIw6lcmEDJmJtnRSyiDx6uP++lwzo
 u2vSV+i9tmQkNl4drWd++rfyJlPCS3WyGmFLqG0ktd5HwmpIS4J0jVl6j0XqgInQb+7m
 w/UTbfC1hNmozUlF/FeS1jfThe3gTBjS+Fgur8K8Pr77bxDRG7TKR4TmoZdCBc3s3ua5
 dpo6V+IpTITQYm7TQLLn0RBwvaeYgrLRal0ISf0WiqWeLNxFO2XkSW/AmxS5Q8lemJHC
 eXXw==
X-Gm-Message-State: AOAM531DlDN7vcznij2hDmt7eGBrwJqiapc9orQfyTTIuuaIf4a22Edf
 yFQPgDyjFE8u62y4IOqRJqihfpSARVVyIA==
X-Received: by 2002:a17:90a:7ac2:b0:1bf:3573:179b with SMTP id
 b2-20020a17090a7ac200b001bf3573179bmr892742pjl.216.1648056987360; 
 Wed, 23 Mar 2022 10:36:27 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:36:26 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] hw/intc/exynos4210_gic: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Thu, 24 Mar 2022 01:35:42 +0800
Message-Id: <20220323173543.146442-5-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220323173543.146442-1-zongyuan.li@smartx.com>
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pj1-x102c.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>, Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r6zVu5qYPWvU

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/intc/exynos4210_gic.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index bc73d1f115..d8ecb9fae3 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -29,6 +29,8 @@
 #include "hw/qdev-properties.h"
 #include "hw/arm/exynos4210.h"
 #include "qom/object.h"
+#include "hw/hw.h"
+#include "hw/core/split-irq.h"
 
 enum ExtGicId {
     EXT_GIC_ID_MDMA_LCD0 = 66,
@@ -209,6 +211,23 @@ qemu_irq *exynos4210_init_irq(Exynos4210Irq *s)
             EXYNOS4210_MAX_INT_COMBINER_IN_IRQ);
 }
 
+
+static qemu_irq split_irq(qemu_irq out1, qemu_irq out2) {
+    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+
+    qdev_prop_set_uint32(splitter, "num-lines", 2);
+
+    if (!qdev_realize_and_unref(splitter, NULL, &error_fatal)) {
+        hw_error("exynos4210.combiner: unable to realize split irq device");
+        return NULL;
+    }
+
+    qdev_connect_gpio_out(splitter, 0, out1);
+    qdev_connect_gpio_out(splitter, 1, out2);
+
+    return qdev_get_gpio_in(splitter, 0);
+}
+
 /*
  * Initialize board IRQs.
  * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
@@ -230,10 +249,10 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
             irq_id = EXT_GIC_ID_MCT_G1;
         }
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
+            s->board_irqs[n] = split_irq(s->int_combiner_irq[n],
                     s->ext_gic_irq[irq_id-32]);
         } else {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
+            s->board_irqs[n] = split_irq(s->int_combiner_irq[n],
                     s->ext_combiner_irq[n]);
         }
     }
@@ -245,7 +264,7 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
                      EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
 
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
+            s->board_irqs[n] = split_irq(s->int_combiner_irq[n],
                     s->ext_gic_irq[irq_id-32]);
         }
     }
-- 
2.34.0

