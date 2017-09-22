Received: by 10.223.172.38 with SMTP id v35csp3215795wrc;
        Fri, 22 Sep 2017 08:06:13 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA+Do71TPZMDFinl4Yk44l6gKqS7OfU8ihMIuF9tOWpC5N9s5OK3hFBX6186WHQeFGXP5tx
X-Received: by 10.37.208.205 with SMTP id h196mr4093964ybg.233.1506092773470;
        Fri, 22 Sep 2017 08:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092773; cv=none;
        d=google.com; s=arc-20160816;
        b=aI/GhtRPUWOWasklBO3ABSckae47kiA4S0VhpnWWDzoggbR3yzSZL2s71SFszSct5c
         AmeljhG+GllGYxkYRovqMNVHpZnjwjZqf88a3WXZFj+B3jqpo6vhUMp1oXCv4epEcGOJ
         FyLTqrg7EGokt9sKUks+qoqoCOvrCxIv+igL6DvuiZGcvBLQS6Br3Fmsd2PtMbbyA7RM
         YQSC9KwXKoBv0RajhJL6TkBRE5y7NezrrIVy0MX9srULhlDlAPmpSC4V/nXrLlh57ttE
         HOr1f55cbgxoxPsgHuh5qvOeY0973H2WgADosQoyKOU538XNt+Z021PqDznEVgNkLquN
         +pEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=KiiJP6oAzDtBo6/IBM+/6QYagpA5xijRaGXqBgwBKz4=;
        b=QhUNM3IuSQFrNxkSoxMzEXoz7+vzCLUNamgXmZisVoxtjWXFTuEWjLA1OICdW9ExS+
         yJqeb9g37X3mluOJtdtegRXWXMaHx3PdKjN03vKnOlntm/ij1JU2N3kVTk7TmMKQaGov
         5ntnX4Q09yWgc/cd3Ab7eQ+C9xEvQ+O4OO+v5g9YX3w6QGjB7tbEng0o4Z2cL25HsbMK
         kDquoI6NSBCRBLe7HuHP1SjlD9G2GdskInPkwCh9eDrODCJYQnfBLnM3e9zQoNypbZz6
         fIQiDENaGL6LL41TsW/V2Ri6DHFQJQXB9F1to2mK8XkqufNpOYQi91NLJRS9pbuJPXSW
         I+Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si19943qti.449.2017.09.22.08.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:06:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPWt-0004tb-6W
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:06:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQe-00083U-3Q
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQd-0004Dl-3y
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37574)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQc-00049B-Sd; Fri, 22 Sep 2017 10:59:43 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQa-0007F6-Tc; Fri, 22 Sep 2017 15:59:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 16:00:03 +0100
Message-Id: <1506092407-26985-17-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 16/20] target/arm: Factor out "get mmuidx for
 specified security state"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YWxSHv+z/Nog

For the SG instruction and secure function return we are going
to want to do memory accesses using the MMU index of the CPU
in secure state, even though the CPU is currently in non-secure
state. Write arm_v7m_mmu_idx_for_secstate() to do this job,
and use it in cpu_mmu_index().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 70c1f85..89d49cd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2329,23 +2329,33 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     }
 }
 
+/* Return the MMU index for a v7M CPU in the specified security state */
+static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
+                                                     bool secstate)
+{
+    int el = arm_current_el(env);
+    ARMMMUIdx mmu_idx;
+
+    if (el == 0) {
+        mmu_idx = secstate ? ARMMMUIdx_MSUser : ARMMMUIdx_MUser;
+    } else {
+        mmu_idx = secstate ? ARMMMUIdx_MSPriv : ARMMMUIdx_MPriv;
+    }
+
+    if (armv7m_nvic_neg_prio_requested(env->nvic, secstate)) {
+        mmu_idx = secstate ? ARMMMUIdx_MSNegPri : ARMMMUIdx_MNegPri;
+    }
+
+    return mmu_idx;
+}
+
 /* Determine the current mmu_idx to use for normal loads/stores */
 static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
 {
     int el = arm_current_el(env);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        ARMMMUIdx mmu_idx;
-
-        if (el == 0) {
-            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSUser : ARMMMUIdx_MUser;
-        } else {
-            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSPriv : ARMMMUIdx_MPriv;
-        }
-
-        if (armv7m_nvic_neg_prio_requested(env->nvic, env->v7m.secure)) {
-            mmu_idx = env->v7m.secure ? ARMMMUIdx_MSNegPri : ARMMMUIdx_MNegPri;
-        }
+        ARMMMUIdx mmu_idx = arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
 
         return arm_to_core_mmu_idx(mmu_idx);
     }
-- 
2.7.4

