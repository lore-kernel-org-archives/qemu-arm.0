Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2383129wrd;
        Fri, 24 Aug 2018 07:13:47 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ10IKqa7jmfDqb6NI4x3bvVhLj/zYsFvUgrzVsKJyoqQVi4Y+ax9PaIesPuwT0zrWjPSUE
X-Received: by 2002:ac8:1739:: with SMTP id w54-v6mr1943635qtj.294.1535120027445;
        Fri, 24 Aug 2018 07:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535120027; cv=none;
        d=google.com; s=arc-20160816;
        b=tzdhWQdkZXcoXgHf7pDT0dx1PEWMImO76OyTbRnOBmp0Kp6axUvsTfLgjP2TdB/kbn
         VWhuDuh7CgyVrrS9J2LnB1h5R/EqRwJZABh5/1nU7sSXIfEIYgkCg5ca1XiyaO0J7Doi
         OXY0+PM6EkJnhcxeWDrWSUBh79z+nHkGxw0UIq7FRVwlNxiYq6h/sNfAMMGP+132sqXk
         YU9D/7zZCae5DivbfsY/AFEm+rnyumseE+NuVKE9OcI6BZmEnQ2p04CpbQytHywOm+Na
         cVgQ8dHPlvnA6PNQSkI2UD54kBD3GR7Wy63Fmkog94hVk0OtrKJFdQoidEtVfFnw5vhH
         gL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=9kTReArHjLFGA6m/2ESEeWZ5+H+7RYYAM0poNFDLkwk=;
        b=RdgO/uFed/DQpVB2ZK59Y6ep0itbRt9qtulg3QkgPv4pOgzFl2+UYuraBLr66X8UnP
         +4k5m+LLPj2WjMBUNiAZNb1GVxE/+DNUJiW/9kwBu6UNguLSG90LaeTry5RhyKJi1UPK
         py92xZ0VwV0yUhairxg/nOlUzB6n5sKtYBQQQd/kBHJsybOCeGplaZJrU8Q95TYJpFQ2
         y0Owj23Ru5ju8hmYpT+DUJDebegLOQ7N4QDhZNG4S8u+IzgvPYQln/3LKxMNOo0+9fMH
         ykPkmXOppH5Pa2kMHv3UqnFdWl8Q9r5hYF6pTPnhPdu3E7VdcugNlaGiOfp3DjhTJVf0
         O1oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y68-v6si5563933qkd.226.2018.08.24.07.13.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Aug 2018 07:13:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ftCqQ-0002Dp-UT
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 10:13:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ftCqJ-0002DW-AH
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 10:13:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ftCqI-0000wT-CA
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 10:13:39 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44910)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ftCqI-0000ue-2e; Fri, 24 Aug 2018 10:13:38 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ftCqF-0006qm-UQ; Fri, 24 Aug 2018 15:13:35 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 Aug 2018 15:13:33 +0100
Message-Id: <20180824141333.24903-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Don't calculate zcr_len for TB flags
 in non-SVE CPUs
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
Cc: Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 03ouUb18v2Ej

Skip calculation of the zcr_len part of TB flags if the CPU
doesn't have SVE. This fixes a bug where for a non-SVE CPU
we might end up with a bogus zcr_len value of -1, which then
trashes other TB flags when it is ORed into the flags word,
resulting in a QEMU crash later due to a bogus mmu_idx field.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not entirely sure why this doesn't cause us problems more often.
I saw it with an AArch32 setup with an A57 with EL2 but not EL3.

 target/arm/helper.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 088f452716e..89767f55a1e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12597,26 +12597,28 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         flags |= (arm_regime_tbi1(env, mmu_idx) << ARM_TBFLAG_TBI1_SHIFT);
         flags |= sve_el << ARM_TBFLAG_SVEEXC_EL_SHIFT;
 
-        /* If SVE is disabled, but FP is enabled,
-           then the effective len is 0.  */
-        if (sve_el != 0 && fp_el == 0) {
-            zcr_len = 0;
-        } else {
-            int current_el = arm_current_el(env);
-            ARMCPU *cpu = arm_env_get_cpu(env);
+        if (arm_feature(env, ARM_FEATURE_SVE)) {
+            /* If SVE is disabled, but FP is enabled,
+               then the effective len is 0.  */
+            if (sve_el != 0 && fp_el == 0) {
+                zcr_len = 0;
+            } else {
+                int current_el = arm_current_el(env);
+                ARMCPU *cpu = arm_env_get_cpu(env);
 
-            zcr_len = cpu->sve_max_vq - 1;
-            if (current_el <= 1) {
-                zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
-            }
-            if (current_el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
-                zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
-            }
-            if (current_el < 3 && arm_feature(env, ARM_FEATURE_EL3)) {
-                zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+                zcr_len = cpu->sve_max_vq - 1;
+                if (current_el <= 1) {
+                    zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
+                }
+                if (current_el < 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+                    zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
+                }
+                if (current_el < 3 && arm_feature(env, ARM_FEATURE_EL3)) {
+                    zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
+                }
             }
+            flags |= zcr_len << ARM_TBFLAG_ZCR_LEN_SHIFT;
         }
-        flags |= zcr_len << ARM_TBFLAG_ZCR_LEN_SHIFT;
     } else {
         *pc = env->regs[15];
         flags = (env->thumb << ARM_TBFLAG_THUMB_SHIFT)
-- 
2.18.0

