Received: by 10.25.44.15 with SMTP id s15csp6362509lfs;
        Wed, 2 Aug 2017 09:53:42 -0700 (PDT)
X-Received: by 10.200.34.15 with SMTP id o15mr32171505qto.290.1501692822129;
        Wed, 02 Aug 2017 09:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692822; cv=none;
        d=google.com; s=arc-20160816;
        b=LX/Zj2J2/upRoCDswsgwAlZjJrZy5MRlBiyToWSQSjac4V+lWr7vgOvsD0x7b6QEk0
         6EqdekrJ055aerq8wecwKMSdolNx7u4tVde0FYKVi2N88IMFg4YTtdGNYVRpqsY5ZIPi
         ptmhCsN2+y5mSwacEXfD6eCj/J8U9O4qqTQ0zfzjilmWovOhjAjR1SQWT8Uy2p6egbc6
         bk5ZH6oDmt5MvpGH4s+wXGv9TeNPAJAKbL4WsV/vZM5Y6GoGN2rmcdlO2KMLzTbLmY1F
         OSCyeyaOyhoFLUM2Kabg+wJngr0rLr1xiYnigI4FZJ0i0plGX7RgKhCtDuw962Ub/FUN
         x1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=b3ociU29Pzft7LUQDdFeYPohaoeo3n/FbHFN5KRptYc=;
        b=v1G4KRuUJP2LEZHFILgpjWUaojwS/dWSYB0WiQIBBaSkhFDUMVwXR0CWMRspWqSkld
         tUY+jSSvg8ahTECq3fW9skwgfWOK1nHzV/sA714aS2mqXGKRddS5bkvAoJQAlO+adAOl
         rwgTPXzfL3CSiv5nUmyxIufDgbwdLfYLqkhoW6fW2r+UNCR3hEC6Z2MNjDODAxMxXXo7
         PhdHGn0E7pNMNbTFXjsDHEEIaIgCDH5mO/SEccD5lk3wAdPKa0QDa/QgmOhZ3abW5a+H
         YEV4g0jgY8Du9ueSZuJHgiUFwe40IgObSdVIKPXOP9ODEs3vQYC+sFmDkL9H3I8/f2MV
         sanw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m49si20201395qtb.439.2017.08.02.09.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:53:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwtv-0002Lo-GU
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:53:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlF-0003fJ-0H
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 12:44:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlE-0004sf-0X
	for qemu-devel@nongnu.org; Wed, 02 Aug 2017 12:44:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwlB-0003zA-Ka; Wed, 02 Aug 2017 12:44:37 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkd-0003wq-SX; Wed, 02 Aug 2017 17:44:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:49 +0100
Message-Id: <1501692241-23310-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 03/15] target/arm: Consolidate PMSA handling in
 get_phys_addr()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cw4pHgB63Rbk

Currently get_phys_addr() has PMSAv7 handling before the
"is translation disabled?" check, and then PMSAv5 after it.
Tidy this up by making the PMSAv5 code handle the "MPU disabled"
case itself, so that we have all the PMSA code in one place.
This will make adding the PMSAv8 code slightly cleaner, and
also means that pre-v7 PMSA cores benefit from the MPU lookup
logging that the PMSAv7 codepath had.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b78d277..fd83a21 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8423,6 +8423,13 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     uint32_t base;
     bool is_user = regime_is_user(env, mmu_idx);
 
+    if (regime_translation_disabled(env, mmu_idx)) {
+        /* MPU disabled.  */
+        *phys_ptr = address;
+        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        return false;
+    }
+
     *phys_ptr = address;
     for (n = 7; n >= 0; n--) {
         base = env->cp15.c6_region[n];
@@ -8572,16 +8579,20 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         }
     }
 
-    /* pmsav7 has special handling for when MPU is disabled so call it before
-     * the common MMU/MPU disabled check below.
-     */
-    if (arm_feature(env, ARM_FEATURE_PMSA) &&
-        arm_feature(env, ARM_FEATURE_V7)) {
+    if (arm_feature(env, ARM_FEATURE_PMSA)) {
         bool ret;
         *page_size = TARGET_PAGE_SIZE;
-        ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                   phys_ptr, prot, fsr);
-        qemu_log_mask(CPU_LOG_MMU, "PMSAv7 MPU lookup for %s at 0x%08" PRIx32
+
+        if (arm_feature(env, ARM_FEATURE_V7)) {
+            /* PMSAv7 */
+            ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
+                                       phys_ptr, prot, fsr);
+        } else {
+            /* Pre-v7 MPU */
+            ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
+                                       phys_ptr, prot, fsr);
+        }
+        qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
                       access_type == MMU_DATA_LOAD ? "reading" :
                       (access_type == MMU_DATA_STORE ? "writing" : "execute"),
@@ -8594,21 +8605,16 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         return ret;
     }
 
+    /* Definitely a real MMU, not an MPU */
+
     if (regime_translation_disabled(env, mmu_idx)) {
-        /* MMU/MPU disabled.  */
+        /* MMU disabled. */
         *phys_ptr = address;
         *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         *page_size = TARGET_PAGE_SIZE;
         return 0;
     }
 
-    if (arm_feature(env, ARM_FEATURE_PMSA)) {
-        /* Pre-v7 MPU */
-        *page_size = TARGET_PAGE_SIZE;
-        return get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                    phys_ptr, prot, fsr);
-    }
-
     if (regime_using_lpae_format(env, mmu_idx)) {
         return get_phys_addr_lpae(env, address, access_type, mmu_idx, phys_ptr,
                                   attrs, prot, page_size, fsr, fi);
-- 
2.7.4

