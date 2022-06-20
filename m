Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp648213lft;
        Mon, 20 Jun 2022 12:36:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1scpm9cUhQR5n6BeXv8kEGYg5S5OF5WW2HWmS3AKNhThLDA6P7t13FUheyTKuh4UOsT8YKL
X-Received: by 2002:a05:620a:2850:b0:6ab:7312:d7f with SMTP id h16-20020a05620a285000b006ab73120d7fmr15028371qkp.723.1655753791441;
        Mon, 20 Jun 2022 12:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655753791; cv=none;
        d=google.com; s=arc-20160816;
        b=WNyKVyFj7EiQk0ESuN/+B/K4a/ZloEqu2mamx6q+8RO8VuyUvREObdWaEF6yqIWZEn
         X14AJXkKSLnZL4az1yUzxSakEb+x/RwHgL7bd78/LgQjRBg6pqz8KY9IuZdumDsT3w+H
         IAy/5ZyRJA3fPo88QUVqMcS9RQOtkonmRw9zq9V5nUnE84HHqCEHiRIC3YpvS6FnF4A9
         Ftvsn4GwaryaLjaCzfjSh8OGgXOZ+GIM8VMf4pohdZ2YF351kqCKDIKKJnYxPV+FBgl/
         omXT0KI/P6N5lcJryLm4U6RaL+KuSH6VrDrIUHAMFAVj4XSagUE8GAaUc2C/Y8zEeYd6
         UV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=aZOB/IOXquk0s/VXbL6wje2XCafs/jwWoppEymoK9fk=;
        b=s+U7mqQBQFYWyagZMuHQBXnwOOt3ASbjzG69AUmgAG7ePIatT2misqg0PosHYa+y+5
         ZrfxAcg/r3M4AGZEmpelgJyK+TQkSRLAvDGYkbdtDYEq1k9DL7a2xnWZ9gi/NpIn6XaT
         ZWPWR1TeBO9rnPa640njYgCyUMAJMhsqVHzsmJnsNz/AgZA/AB13uLuT1b8zKLw+jIXH
         leao2AjFm1hrY9uyXTiFRhUu6CBj7N8esLSMYfJx/5no4Ygu9pxxLbV9BGAed1+wV/jt
         LDcho2wdpFKMj2CZDVJ+arXg1VuGRq3SvM53uIdzlXB0u8rKpg2wjGGbHnzwhGBrpGNQ
         LT0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5-20020ac85f85000000b00304e9f1b355si7982292qta.494.2022.06.20.12.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 12:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3NCD-0005x3-DI
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 15:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1o3Mz3-0003xI-A5; Mon, 20 Jun 2022 15:22:53 -0400
Received: from mail.csgraf.de ([85.25.223.15]:58860 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1o3Mz1-0007O7-89; Mon, 20 Jun 2022 15:22:48 -0400
Received: from localhost.localdomain
 (dynamic-077-007-106-140.77.7.pool.telefonica.de [77.7.106.140])
 by csgraf.de (Postfix) with ESMTPSA id 3FD9B6080647;
 Mon, 20 Jun 2022 21:22:44 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/2] target/arm: Catch invalid kvm state also for hvf
Date: Mon, 20 Jun 2022 21:22:42 +0200
Message-Id: <20220620192242.70573-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220620192242.70573-1-agraf@csgraf.de>
References: <20220620192242.70573-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OkbkGCc/eaOr

Some features such as running in EL3 or running M profile code are
incompatible with virtualization as QEMU implements it today. To prevent
users from picking invalid configurations on other virt solutions like
Hvf, let's run the same checks there too.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1073
Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v1 -> v2:

  - Use current_accel_name()
  - Use !tcg_enabled()
---
 target/arm/cpu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d535788..0862dcd63c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1490,7 +1490,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (kvm_enabled()) {
+    if (!tcg_enabled()) {
         /*
          * Catch all the cases which might cause us to create more than one
          * address space for the CPU (otherwise we will assert() later in
@@ -1498,17 +1498,20 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         if (arm_feature(env, ARM_FEATURE_M)) {
             error_setg(errp,
-                       "Cannot enable KVM when using an M-profile guest CPU");
+                       "Cannot enable %s when using an M-profile guest CPU",
+                       current_accel_name());
             return;
         }
         if (cpu->has_el3) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPU has EL3 enabled");
+                       "Cannot enable %s when guest CPU has EL3 enabled",
+                       current_accel_name());
             return;
         }
         if (cpu->tag_memory) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPUs has MTE enabled");
+                       "Cannot enable %s when guest CPUs has MTE enabled",
+                       current_accel_name());
             return;
         }
     }
-- 
2.32.1 (Apple Git-133)

