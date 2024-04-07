Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp660090ejh;
        Sun, 7 Apr 2024 01:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUMUWzewMkP+m1wJR9LdrEoRvpT+BMT4+pC2wUHUMsr7l/LG/aKoulZiN2yYOruKVhyihWBIuXfn0RyiZ93VuVVyVmv1dL
X-Google-Smtp-Source: AGHT+IEcGaLpAldym1fNhzMMv2z6+1uBE6ieAB7AblVPwM/eqJcmsxhpBEylgGFNGbcWNdkdIdbQ
X-Received: by 2002:a05:622a:1994:b0:431:7c36:7f9c with SMTP id u20-20020a05622a199400b004317c367f9cmr9787874qtc.2.1712478247306;
        Sun, 07 Apr 2024 01:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478247; cv=none;
        d=google.com; s=arc-20160816;
        b=WYuqKE46q+ckuRFIIiom5MTk6t3cbyHI3V7UIDXSaM6wLDVSctZfe4+XNz3e1iNdo9
         xYYyeICieXQZiISkhwMzO4h5P3xOkC84xneLGsjkszfrb/XDLls8xst6MKFg6Ik3HLzm
         kgl0vn+EgrEIg/74IhS8znM62ZVZn918pWrl8P7c1f9LhfRpGf3wCFfnknWgGCPXdNxu
         cPhoBrHx7KeCc8+Z2qGdUrRUgNdOhb4McXxbZxvq77ErMG+PpanwJoeY887Z7hzSFpe/
         ubZd9i/IOyFZOSV2O74AMSbDBUO+VvKcCqnDpI2nlQD4PjB/G4McGurrmWAqPgp7sPqR
         CvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/ifL0CIOl8SQXHjJN5WJ3HDsV1WsZyIKKHfbsfqhfQY=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=q6u8svC1CYmIeALRYxvyzI1DNYwKVfl7F6B3BDiGkdrgKX3yK+GmEGOXMLuIcWHn2M
         EoromF4XQYbEOs1HcqGdK6kkICXDSx2yPwMeuJnDlavtc5FzLv4zkS+MVI2SZwYU8F68
         vEGVSG4oSeFk9U+pNhqOdGlfAi6FppEb85/ukA60KyFH7TAyyRG9TwI2cRuhSkhefSrZ
         +7vTUMO6xGYDK3MM8O/Dc9rkt/qWuJcKmYQCSyoIeo+lbmqugbBuck9FE3dCPRuhu0bM
         03qayO26U3lQdt0zKwBoQ1itSjIu+laou8d0DFBildrQjDy6UspqRrowk2Nv5CMKNM71
         xkAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020a05622a048800b0043468750819si4343513qtx.340.2024.04.07.01.24.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rtNlM-0004YG-P5; Sun, 07 Apr 2024 04:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl7-0004KS-RF; Sun, 07 Apr 2024 04:20:14 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNl3-0002HW-4F; Sun, 07 Apr 2024 04:20:11 -0400
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VC4p22HhBzwRRS;
 Sun,  7 Apr 2024 16:17:14 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 65ED3180A9B;
 Sun,  7 Apr 2024 16:20:06 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:20:05 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 22/24] hw/intc/arm_gicv3: Report the VINMI interrupt
Date: Sun, 7 Apr 2024 08:17:31 +0000
Message-ID: <20240407081733.3231820-23-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6N3GboWrhyY0

In vCPU Interface, if the vIRQ has the non-maskable property, report
vINMI to the corresponding vPE.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v12:
- Do not check nmi_support repetitively.
- Add Reviewed-by.
v10:
- Update the commit message, superpriority -> non-maskable.
v9:
- Update the commit subject and message, vNMI -> vINMI.
v6:
- Add Reviewed-by.
---
 hw/intc/arm_gicv3_cpuif.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 60e2d9ec9c..0de7c41f96 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -480,6 +480,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     int idx;
     int irqlevel = 0;
     int fiqlevel = 0;
+    int nmilevel = 0;
 
     idx = hppvi_index(cs);
     trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx,
@@ -497,9 +498,17 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
         uint64_t lr = cs->ich_lr_el2[idx];
 
         if (icv_hppi_can_preempt(cs, lr)) {
-            /* Virtual interrupts are simple: G0 are always FIQ, and G1 IRQ */
+            /*
+             * Virtual interrupts are simple: G0 are always FIQ, and G1 are
+             * IRQ or NMI which depends on the ICH_LR<n>_EL2.NMI to have
+             * non-maskable property.
+             */
             if (lr & ICH_LR_EL2_GROUP) {
-                irqlevel = 1;
+                if (lr & ICH_LR_EL2_NMI) {
+                    nmilevel = 1;
+                } else {
+                    irqlevel = 1;
+                }
             } else {
                 fiqlevel = 1;
             }
@@ -509,6 +518,7 @@ void gicv3_cpuif_virt_irq_fiq_update(GICv3CPUState *cs)
     trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
     qemu_set_irq(cs->parent_vfiq, fiqlevel);
     qemu_set_irq(cs->parent_virq, irqlevel);
+    qemu_set_irq(cs->parent_vnmi, nmilevel);
 }
 
 static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
-- 
2.34.1

