Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp39344lfk;
        Tue, 8 Feb 2022 02:59:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdNg9HB8ed3NdoboncE7hUtdzstyCMdfGQTmwW2fpJJHER+kZIQV3376ZCzlxNaxQoFfyB
X-Received: by 2002:a81:34d7:: with SMTP id b206mr4022392ywa.489.1644317962766;
        Tue, 08 Feb 2022 02:59:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644317962; cv=none;
        d=google.com; s=arc-20160816;
        b=oFzQiqi143cZa/c4TTj/cWMJxB6ietwk70ibb/kdzMc0kYJBoJOxcSYG4gSdX7M0Gq
         0x8/+2CLoSp/hpHWNqoAc100IcZcYwHZWAZ28cCYgD1SgOqCnuOTAs61klphfOTW+Ts/
         PTC9EOCkBlwaDCwrJHiav+uica+eMW+qE8FdLMl64l3e7/R/SkNBSrsWjRdugG9dqpyW
         AlmwzJUiH0GSgt0x84eOAntf17LrPfUVUYrsHqmuoCZa6hAkISz+enMnP9eJIfFXl2PV
         O4wdQJjN0TsFQG5U/+Ax+xLWHLz1yy4DkKa2WQrVsCzGHKJQx2cnencLM5hsZ+kcv846
         e8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=sJ3Q82x/YobghFe5BqteEfYb2maPKduHQkzYXhyhnbg=;
        b=LDr+1gLNtLh4nvQBoEB+AUUBylX6AcXpZLIT355W+mXUkyleMkbUz6M+21qDRm6hdM
         j7KLrNT3K4y7FYDj73tgYZKnYNwr951NmF0fXvnJaf4bgiQRwa8p5qv0ILKxgQYvuEzW
         t/++1CBSiIoxADWwVPExw0syLjXUGDdiTL/VN4fSmsfbrvstICw2tHAaNetoi+/oYB2w
         2LgFlBGJEInKzsDTJQ14DgdEe6cCwVpcvz31zyc2GunBAiChn40EQSscYK4vF7ocBSNC
         jve/ucv9H1ARiJfwZZRXoWtsmb4aVjAtto9feohbcdlGfoDqnkBpYKJPYl+bKE7elDN9
         gMng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 79si5535192ybf.447.2022.02.08.02.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Feb 2022 02:59:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHODS-0004Q9-71
	for alex.bennee@linaro.org; Tue, 08 Feb 2022 05:59:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nHNif-0007nU-G8; Tue, 08 Feb 2022 05:27:35 -0500
Received: from mail.csgraf.de ([85.25.223.15]:34486 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nHNib-0005tS-PK; Tue, 08 Feb 2022 05:27:31 -0500
Received: from localhost.localdomain
 (dynamic-077-002-106-089.77.2.pool.telefonica.de [77.2.106.89])
 by csgraf.de (Postfix) with ESMTPSA id C97E1608091C;
 Tue,  8 Feb 2022 11:27:25 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] hvf: arm: Handle unknown ID registers as RES0
Date: Tue,  8 Feb 2022 11:27:24 +0100
Message-Id: <20220208102724.34451-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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
Cc: qemu-stable@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Ivan Babrou <ivan@cloudflare.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qeR/Qt3kmvLi

Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
those reads trap into QEMU which handles them as faults.

However, AArch64 ID registers should always read as RES0. Let's
handle them accordingly.

This fixes booting Linux 5.17 guests.

Cc: qemu-stable@nongnu.org
Reported-by: Ivan Babrou <ivan@cloudflare.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 92ad0d29c4..39c3e0d85f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -729,6 +729,17 @@ static bool hvf_handle_psci_call(CPUState *cpu)
     return true;
 }
 
+static bool is_id_sysreg(uint32_t reg)
+{
+    uint32_t op0 = (reg >> 20) & 0x3;
+    uint32_t op1 = (reg >> 14) & 0x7;
+    uint32_t crn = (reg >> 10) & 0xf;
+    uint32_t crm = (reg >> 1) & 0xf;
+    uint32_t op2 = (reg >> 7) & 0x7;
+
+    return op0 == 3 && op1 == 0 && crn == 0 && crm >= 1 && crm < 8 && op2 < 8;
+}
+
 static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -781,6 +792,11 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
         /* Dummy register */
         break;
     default:
+        if (is_id_sysreg(reg)) {
+            /* ID system registers read as RES0 */
+            val = 0;
+            break;
+        }
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_read(env->pc, reg,
                                         (reg >> 20) & 0x3,
-- 
2.32.0 (Apple Git-132)

