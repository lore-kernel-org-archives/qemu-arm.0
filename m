Received: by 10.25.44.15 with SMTP id s15csp1871118lfs;
        Thu, 27 Jul 2017 04:01:49 -0700 (PDT)
X-Received: by 10.55.201.82 with SMTP id q79mr5401384qki.62.1501153309590;
        Thu, 27 Jul 2017 04:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501153309; cv=none;
        d=google.com; s=arc-20160816;
        b=pvx6ltln5mmh0I006kaeFow17VXLTF9Jm5Z94cc4VOnyFPyTJJenDXrBmeXz6Zuyso
         Hfu9sYzFgH7aDm45FRi9gNd7gUZbWM52DWvXHQfT7wn+PMnGuHhSRnjhuRtY7IJ2nZqU
         NUMXY/IyG++qljYYm3DkiP4PafWbSb/YrXh7j7PokYAL1RInGnjzR6NSv/3UlrjI2l1H
         8EDypv3MgtY60pcLcr8KZzwQL+u37oESm/vcE3qb8ld1EqMyp/ok52GnSBLSNBk67oid
         LK+P0CTSdcPHGj0x/Qs3N1jsjNbb1sG4vCwW+Nuaoc7nMOFMSuOu3OB66qgGc+6my/x6
         J0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=N9RfvQASz/qnK8vDbt8OmDyGu9p24oeF/c267/sMSGo=;
        b=jRbW88RTlT9bjyif+IKwDAwu5Se5ABZZuXvjyBkmRYWnAgFQifWLa8q5SwbtqFPGDM
         XcmiJiXPey+acDMklZTsx76+GFURNzVXhdFIf+jItPGkUcXinjfeebZAW8260dMlEdvn
         iK9Ze5FWLxl457l2ogtHGsaBs6xkAk3A3RSojMcKK9ZG23D6IofDzA3JWEH8PD3AXXgy
         BVaoZdQ/Of4auugfbgHoCtwg1HKSq/visPZBp5rL5U9jeB0iC4dr55wIYEHV0YIgb0KR
         U9vjlwDA6HtbTsNEQ/C4CQHXb1xKm+zK3Au/r3M0suOiL0KCXG7yUIJ7jJFOxPtfqy+4
         o6Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v21si13649637qta.394.2017.07.27.04.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 04:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dagY7-0008G2-5Y
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 07:01:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVo-0006J9-2O
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVn-0000M1-65
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:24 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dagVm-0008P0-Uk; Thu, 27 Jul 2017 06:59:23 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dagVb-0003lV-L1; Thu, 27 Jul 2017 11:59:11 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 27 Jul 2017 11:59:06 +0100
Message-Id: <1501153150-19984-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10 1/5] target/arm: Don't do MPU lookups
 for addresses in M profile PPB region
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
X-TUID: 7M3OpD4oCDrk

The M profile PMSAv7 specification says that if the address being looked
up is in the PPB region (0xe0000000 - 0xe00fffff) then we do not use
the MPU regions but always use the default memory map. Implement this
(we were previously behaving like an R profile PMSAv7, which does not
special case this).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4ed32c5..ceef225 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8244,6 +8244,13 @@ static bool pmsav7_use_background_region(ARMCPU *cpu,
     }
 }
 
+static inline bool is_ppb_region(CPUARMState *env, uint32_t address)
+{
+    /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
+    return arm_feature(env, ARM_FEATURE_M) &&
+        extract32(address, 20, 12) == 0xe00;
+}
+
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  int access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot, uint32_t *fsr)
@@ -8255,7 +8262,15 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     *phys_ptr = address;
     *prot = 0;
 
-    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
+    if (regime_translation_disabled(env, mmu_idx) ||
+        is_ppb_region(env, address)) {
+        /* MPU disabled or M profile PPB access: use default memory map.
+         * The other case which uses the default memory map in the
+         * v7M ARM ARM pseudocode is exception vector reads from the vector
+         * table. In QEMU those accesses are done in arm_v7m_load_vector(),
+         * which always does a direct read using address_space_ldl(), rather
+         * than going via this function, so we don't need to check that here.
+         */
         get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
     } else { /* MPU enabled */
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
-- 
2.7.4

