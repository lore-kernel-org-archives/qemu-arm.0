Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp799735lfk;
        Wed, 9 Feb 2022 05:03:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAOP10iH0dcqRcbrbZVx5wNjiLuxR8Rzq8HYi2yIF+9qUnkZBexCWBvZCFsGZ+fxO+64Uw
X-Received: by 2002:a05:6e02:180f:: with SMTP id a15mr1026701ilv.8.1644411808398;
        Wed, 09 Feb 2022 05:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644411808; cv=none;
        d=google.com; s=arc-20160816;
        b=PKnmdmpZvhxuk8d4mX227pwe6inD565nZ6pmfI5y11WtYMYjWtqChkg+p9pHsJuMem
         Y5BHWAASrztFmKm9UTmrH5UXinPp2fGStxa4PrvIjXG+I2+t8k9N4bREaKzx4PfmvanT
         H4Bf7f96KQoJKsbDSu6xjPSpLuE7/Y5+QuwDgoRSWk8hB9U/dbbhGlkpNcK6VEI+lUMp
         jYaAeJN3B6tQ44e6Oa2o230yZOiMwGy8Mr+/wZ21dLdpVHn4HW4skahcoM728b9jOX+Z
         dvvXcdkbvR4gue/uc6NorZxXkVHHMaUItR96dTbjz7kfslVnnExRRHMYjr/ycBnlBApw
         DKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=DIJLsV/5XkvfHdm30ibXf+Ba1BBCNLnMuP2EqoH9JWI=;
        b=HPpYq1KozC7rN3iMVxeunjcHa7ouRUVuvHdhxEdAN6Vw73GktiXdzwhLwQcrfzQ2oD
         /olblGIVLOMKIwGhDqsdg6K4wj73zVirrhYpgATBZivM3edLkM7k7+2EnoFbEJapvSGn
         rPyRk3zHjIvreCkFQ6CLRRsoRS/Zamt5krgGcjtpmv9++drqp00j3YFkbRzZjzsFVS97
         tAMlZ/R0wmiB0452q+nML99IPaTruhI5xIzBV6YfUqdyDJVhk/sMvcijqWxdfMXkyMlq
         FZh22Snp9Y3eFQh3TrY8PG803uitUKE6u9Gqi76YIQhQL7WgKZ0Yk959t4TC+jvmDE65
         EbYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si7765923ild.118.2022.02.09.05.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Feb 2022 05:03:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHmd5-00080D-PB
	for alex.bennee@linaro.org; Wed, 09 Feb 2022 08:03:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nHmIX-0000MW-Si; Wed, 09 Feb 2022 07:42:14 -0500
Received: from mail.csgraf.de ([85.25.223.15]:35094 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nHmIV-0006zE-Ki; Wed, 09 Feb 2022 07:42:13 -0500
Received: from localhost.localdomain
 (dynamic-095-115-119-071.95.115.pool.telefonica.de [95.115.119.71])
 by csgraf.de (Postfix) with ESMTPSA id 9678360806B7;
 Wed,  9 Feb 2022 13:41:36 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 2/2] hvf: arm: Handle unknown ID registers as RES0
Date: Wed,  9 Feb 2022 13:41:35 +0100
Message-Id: <20220209124135.69183-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220209124135.69183-1-agraf@csgraf.de>
References: <20220209124135.69183-1-agraf@csgraf.de>
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
X-TUID: qQGMRa9kF5WK

Recent Linux versions added support to read ID_AA64ISAR2_EL1. On M1,
those reads trap into QEMU which handles them as faults.

However, AArch64 ID registers should always read as RES0. Let's
handle them accordingly.

This fixes booting Linux 5.17 guests.

Cc: qemu-stable@nongnu.org
Reported-by: Ivan Babrou <ivan@cloudflare.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v1 -> v2:

  - Handle all ID registers instead of just ID_AA64ISAR2_EL1.

v2 -> v3:

  - Use new sysreg parsing macros
  - Remove useless check for op2
---
 target/arm/hvf/hvf.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8d0447ab01..5ca7aa2dcd 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -754,6 +754,15 @@ static bool hvf_handle_psci_call(CPUState *cpu)
     return true;
 }
 
+static bool is_id_sysreg(uint32_t reg)
+{
+    return SYSREG_OP0(reg) == 3 &&
+           SYSREG_OP1(reg) == 0 &&
+           SYSREG_CRN(reg) == 0 &&
+           SYSREG_CRM(reg) >= 1 &&
+           SYSREG_CRM(reg) < 8;
+}
+
 static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -806,6 +815,11 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
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
                                         SYSREG_OP0(reg),
-- 
2.32.0 (Apple Git-132)

