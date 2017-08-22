Received: by 10.223.188.70 with SMTP id a6csp5091801wrh;
        Tue, 22 Aug 2017 08:34:05 -0700 (PDT)
X-Received: by 10.237.58.106 with SMTP id n97mr1535964qte.284.1503416045685;
        Tue, 22 Aug 2017 08:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416045; cv=none;
        d=google.com; s=arc-20160816;
        b=j9Juj3gFitqX8Zujm/tNsVjJDq4KRCrsP9+lFF2ZGKAtyMn5cKn+9uhgZad60crUra
         DmYVEZbmk1e6Uv9icXeQ3YX1wR+wZli/2MRRTTYZ+BZlo8SjSLW8lRqr840m8O5tV/uO
         1cxT2Uc/PjsJMlOxTuyhQdatzQtyRtdD0pGIF08jZbYzl9m+x2U43eC6VbZvq8UnsZEf
         bSUjAU3v3tZ1HanysT6ZA4kV+XRT4KWK2GbjwvdcctguejplhJo0gYVNi50IXjFfdN7a
         nUEj8jRY/QZ+qXxfHjT34cE4mFn+L6b7hj51I1unyzp5cso+4X6AfR/kUw8laEdAVFjj
         rx/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gHamKw8ebS/pJEu33NEifzEJ0aDK3iltO7a9dgTgqwU=;
        b=yrj6QIhlIS+uG1WSKU0geHdR0W2bP563uzMUjqA9rQBWJXuY5X+MsE/yNdRHKE06O2
         /O2W0JbYKyASGSmjNvbIuXniiGv6IX7QUc7kffVEJhDyUgHKRkjuOpZ0VwShz9VbbF8E
         1T/AOX30mS5sEZfZFNPpmfi7It/VNX/QSeBGA6Z40kbeLW+He64DVzFsRQBGPQ8dmWtN
         zDWpR1xHsnC+0eT5ymt4FNgpo0rC7ZOABPYTpWmSuChHKzbuZavDNJ28Y0RiHtVr8/tY
         98eRZF7UWTaRKEG/9M2qv34bQ4l+dPul9Tbsug8/iwvmu/9g+YhSMbVNwaYOZgmeIgeW
         654g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v9si13557890qka.155.2017.08.22.08.34.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:34:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBBr-0002fC-6s
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:34:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAno-0006PU-7K
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnm-0003Cs-QA
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:12 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnm-00039F-HW; Tue, 22 Aug 2017 11:09:10 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAna-0004e0-Gg; Tue, 22 Aug 2017 16:08:58 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:41 +0100
Message-Id: <1503414539-28762-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 02/20] target/arm: Implement new PMSAv8 behaviour
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
X-TUID: omxNvVcf9eSc

Implement the behavioural side of the new PMSAv8 specification.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7920153..887490a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8416,6 +8416,111 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
+static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
+                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                 hwaddr *phys_ptr, int *prot, uint32_t *fsr)
+{
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    bool is_user = regime_is_user(env, mmu_idx);
+    int n;
+    int matchregion = -1;
+    bool hit = false;
+
+    *phys_ptr = address;
+    *prot = 0;
+
+    /* Unlike the ARM ARM pseudocode, we don't need to check whether this
+     * was an exception vector read from the vector table (which is always
+     * done using the default system address map), because those accesses
+     * are done in arm_v7m_load_vector(), which always does a direct
+     * read using address_space_ldl(), rather than going via this function.
+     */
+    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
+        hit = true;
+    } else if (m_is_ppb_region(env, address)) {
+        hit = true;
+    } else if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+        hit = true;
+    } else {
+        for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
+            /* region search */
+            /* Note that the base address is bits [31:5] from the register
+             * with bits [4:0] all zeroes, but the limit address is bits
+             * [31:5] from the register with bits [4:0] all ones.
+             */
+            uint32_t base = env->pmsav8.rbar[n] & ~0x1f;
+            uint32_t limit = env->pmsav8.rlar[n] | 0x1f;
+
+            if (!(env->pmsav8.rlar[n] & 0x1)) {
+                /* Region disabled */
+                continue;
+            }
+
+            if (address < base || address > limit) {
+                continue;
+            }
+
+            if (hit) {
+                /* Multiple regions match -- always a failure (unlike
+                 * PMSAv7 where highest-numbered-region wins)
+                 */
+                *fsr = 0x00d; /* permission fault */
+                return true;
+            }
+
+            matchregion = n;
+            hit = true;
+
+            if (base & ~TARGET_PAGE_MASK) {
+                qemu_log_mask(LOG_UNIMP,
+                              "MPU_RBAR[%d]: No support for MPU region base"
+                              "address of 0x%" PRIx32 ". Minimum alignment is "
+                              "%d\n",
+                              n, base, TARGET_PAGE_BITS);
+                continue;
+            }
+            if ((limit + 1) & ~TARGET_PAGE_MASK) {
+                qemu_log_mask(LOG_UNIMP,
+                              "MPU_RBAR[%d]: No support for MPU region limit"
+                              "address of 0x%" PRIx32 ". Minimum alignment is "
+                              "%d\n",
+                              n, limit, TARGET_PAGE_BITS);
+                continue;
+            }
+        }
+    }
+
+    if (!hit) {
+        /* background fault */
+        *fsr = 0;
+        return true;
+    }
+
+    if (matchregion == -1) {
+        /* hit using the background region */
+        get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
+    } else {
+        uint32_t ap = extract32(env->pmsav8.rbar[matchregion], 1, 2);
+        uint32_t xn = extract32(env->pmsav8.rbar[matchregion], 0, 1);
+
+        if (m_is_system_region(env, address)) {
+            /* System space is always execute never */
+            xn = 1;
+        }
+
+        *prot = simple_ap_to_rw_prot(env, mmu_idx, ap);
+        if (*prot && !xn) {
+            *prot |= PAGE_EXEC;
+        }
+        /* We don't need to look the attribute up in the MAIR0/MAIR1
+         * registers because that only tells us about cacheability.
+         */
+    }
+
+    *fsr = 0x00d; /* Permission fault */
+    return !(*prot & (1 << access_type));
+}
+
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot, uint32_t *fsr)
@@ -8585,7 +8690,11 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         bool ret;
         *page_size = TARGET_PAGE_SIZE;
 
-        if (arm_feature(env, ARM_FEATURE_V7)) {
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            /* PMSAv8 */
+            ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
+                                       phys_ptr, prot, fsr);
+        } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
                                        phys_ptr, prot, fsr);
-- 
2.7.4

