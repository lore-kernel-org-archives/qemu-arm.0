Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADC4E6FE51
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Dec 2025 22:45:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYB7O-0002Nb-Vq; Tue, 23 Dec 2025 17:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vYB0V-00014p-O4
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:37:33 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vYB0S-00037V-7m
 for qemu-arm@nongnu.org; Tue, 23 Dec 2025 17:37:30 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b7ffa5d1b80so681625266b.0
 for <qemu-arm@nongnu.org>; Tue, 23 Dec 2025 14:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766529443; x=1767134243; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CmR4Y2GJdN/xImLsWri8JYiI7ERXQ78boDVUrPyU/rc=;
 b=MqAU3t8uj8jmjxEeteJxANkv1PU5z1ZKVHrMgrHb+pnU7tWKEkz3RCC2AQdV8a+LJ0
 ynvgzTLZIXiEzGByVE7vantjkdNuZe0BvnwB0tPrk8Kkr859RbqDJsxdE5B+eDkmlsSu
 0kHQTrfONGpL56wmPqrnWBqP0ytXtGG/gMcxksxF2KTmMVZ8zq/IewH0TPpW+DvOjK+u
 0jGSrbUSsEeB8nVODzmCsjLGRi2mQ9G4MlYLHpqWSYHSxhIcBaR654pDaGIoY+1q5IfI
 sGmAGPXGWzee4jb73/3JiR/fEs3ljir4NmCAuzLC8w/i5tbt+L12jkuZM0HHArvfNGCb
 E+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766529443; x=1767134243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmR4Y2GJdN/xImLsWri8JYiI7ERXQ78boDVUrPyU/rc=;
 b=GbveWdk8ZY0J6868FJiH8RM/x91kRmJ//Ti9LTAhM2ehjUTnlndK36SXeAplp/LlxR
 u+PU20N3MJLII1plcRlimszsvkeCf1a46eHFIucYFniVbO7z24DquWs68+Fpjvh/VG+R
 x394dDN2x0cgXNW/qa7Lbkyis8H/A+lmU9pjL+L/9z9XtQRexyLzKgzQsppooDI5D13u
 tk9h/YMeGqSru6PA1VUCJTxkN/WQUAVT9wNn5VX7DW28oeJ1x5ectDBLrM+yic6JKzdZ
 rm1aXB0zz6N0LCpiwOpRK8IlhHLVVVPAOBPt482Cm/TAbfPC5tuOdZzlg3pAJEIFan+G
 q66Q==
X-Gm-Message-State: AOJu0YwCTUGT4Ux3vx67A5rGLm/3HEG1ta/TkSCcBCdvfSZOKohz5DKe
 ye7mahSKfLMqxYbgs+xvOJULZp6P78eEBL93NCg77ML9D0lV6pU2Dosg
X-Gm-Gg: AY/fxX7PPZOWtKRDhb5V7Lc1+VGPbaFQLyTMNm+c2wAhGF0QOELrNCmWY6CVEMlxQ0v
 /WqpPQNvJvj/83dhaS0BVDBmTdhn2jIuNIt+jEM06AmAa5Cs8Q7XYDmaBD1BwGkxSjWALatgRSN
 UG/cEjfRzBQdJHU/Lx+b8PMQS8mzh4rbanSnXLunbuhlTb7xvd86buz3GP8uHvPX2QvGAc6DVlb
 l2xuZytpoPSt52UMSrnKuZAh4UQI6UgZaGv8eWuobmy1SvwvBnzhEj0e9MdeKNY+qMUfhdRpzav
 EYGMijuoMlady3yRe44l5Iw2wdDkdPWJk5TFgrnHNj5xwjNKlqkVIgVr8vg3M1XlwLNzLMDlFsf
 aQAwRwgEG4m+himHqj9ZcwLPZdIuMcS6Htd9HWYc9g9kNQRsW0VCAppHEYnk7thKfgK4CsshMKc
 Q3YMKrQdBcsaUA1DVFfsCgwqn0kB2FjuJpnYc4DDFV+V9df2tB1qF3vwif
X-Google-Smtp-Source: AGHT+IFM3+itG4DFDeh2uLhtshbpTA0WRkWeN7sU7CjJ5AZr+a/QZcH0sfrsBZFev1han3tKKvp80A==
X-Received: by 2002:a17:907:86a8:b0:b73:8792:c3ca with SMTP id
 a640c23a62f3a-b80371801fdmr1833902766b.32.1766529442803; 
 Tue, 23 Dec 2025 14:37:22 -0800 (PST)
Received: from thinkpad-t470s.. (93-140-179-149.adsl.net.t-com.hr.
 [93.140.179.149]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b8045a086fasm1352658166b.70.2025.12.23.14.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 14:37:22 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
Subject: [RFC PATCH] hw/arm/smmuv3: add support for combined irq
Date: Tue, 23 Dec 2025 23:37:12 +0100
Message-ID: <20251223223712.17047-1-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 23 Dec 2025 17:44:37 -0500
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Some platforms use combined irq type, in which case
only single interrupt line is used, instead of 4
different irq's for each type.

Add emulation support for combined irq mode.

This mode can be selected by platforms by setting
'combined_irq' property.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/arm/smmuv3.c         | 12 +++++++++++-
 include/hw/arm/smmuv3.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index bcf8af8dc7..2e29ff952a 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -79,6 +79,10 @@ static void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq,
         break;
     }
     }
+
+    if (s->combined_irq)
+        irq = 0;
+
     if (pulse) {
             trace_smmuv3_trigger_irq(irq);
             qemu_irq_pulse(s->irq[irq]);
@@ -1850,8 +1854,9 @@ static const MemoryRegionOps smmu_mem_ops = {
 static void smmu_init_irq(SMMUv3State *s, SysBusDevice *dev)
 {
     int i;
+    int irq_num = s->combined_irq ? 1 : ARRAY_SIZE(s->irq);
 
-    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
+    for (i = 0; i < irq_num; i++) {
         sysbus_init_irq(dev, &s->irq[i]);
     }
 }
@@ -1977,6 +1982,11 @@ static const Property smmuv3_properties[] = {
      * Defaults to stage 1
      */
     DEFINE_PROP_STRING("stage", SMMUv3State, stage),
+    /*
+     * Use single IRQ line for each event type,
+     * instead of 4 different irq's
+     */
+    DEFINE_PROP_BOOL("combined_irq", SMMUv3State, combined_irq, false),
 };
 
 static void smmuv3_instance_init(Object *obj)
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index d183a62766..cb8f7e0422 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -61,6 +61,7 @@ struct SMMUv3State {
     SMMUQueue eventq, cmdq;
 
     qemu_irq     irq[4];
+    bool         combined_irq;
     QemuMutex mutex;
     char *stage;
 };
-- 
2.43.0


