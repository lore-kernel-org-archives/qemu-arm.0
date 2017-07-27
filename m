Received: by 10.25.44.15 with SMTP id s15csp1869009lfs;
        Thu, 27 Jul 2017 03:59:38 -0700 (PDT)
X-Received: by 10.200.0.208 with SMTP id d16mr4961804qtg.69.1501153178741;
        Thu, 27 Jul 2017 03:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501153178; cv=none;
        d=google.com; s=arc-20160816;
        b=CG2qQ07OvXADa9bVp33XOHAzxjASxVUOXZqVyhe1lut6EReFNbF7rHDcq/LrWvdChr
         dPh6Gz3jOJ/RY8uYLyNFO1CAh4aqfJxTLhieH6Jhe6gvVcmoUbDl4mrTAIOYAWd11xve
         foaWHjpYG5JxolynqJxCu+/M+C2kwYkEVrfPlriu/ulyf7+vxfj8qq9B6yW+OybGxdQR
         YJyyaWo5wTNHt6e/fPbm333wjNeYju4KffCDLdlrDR2y1LUADMTsm8lcUSL9Cy5xari2
         TJuTyM4nn170uxUi6+iiQWzc2ehIiybOTuWMOFs3OxQ4eJgtgRynsBC9XEbJQkl0X0uD
         A+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=m0l4wE04ryb5TzVznzuIMAzO7RqZ3m/yiYfaPXUCOOc=;
        b=TC+UyDi2jeae+iCKw+a+RFXNP5GK4SXwJNR9FsEWWKoIfeJO2ME55hRumTGX6UJQCj
         UygyDPc51nBNHBDdm0Uw8Vny2eIvLZ432OE4PQUbcCdUA/TSQeGtxvzWrX7jo2hkoESC
         KkgFH/e9T43KUcMLQKOcHXBE1E9aDz1UN58PGe5enjJOvOJD5OiEbcxjso6yrjTp6jCr
         VsE77yxEZwlZGJd7E2lLzc/sSzok5IWX5MJ/l4PbsNcSJxS7+kg+5sRcQL3bfUJkZXT1
         y0NDlLKxGJG087sNSfF0uX3pKGujK3PYpaUQ2PI3JID9dzYI4jb0VxcZpe6cxXq7x4wf
         pRaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j62si6353753qkd.539.2017.07.27.03.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 03:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dagVz-0006OD-Tt
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 06:59:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVn-0006IC-53
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVm-0000JP-B2
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:23 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dagVm-0008P0-4e; Thu, 27 Jul 2017 06:59:22 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dagVc-0003lk-9W; Thu, 27 Jul 2017 11:59:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 27 Jul 2017 11:59:07 +0100
Message-Id: <1501153150-19984-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10 2/5] target/arm: Don't allow guest to
 make System space executable for M profile
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
X-TUID: yZADb5Yv3noi

For an M profile v7PMSA, the system space (0xe0000000 - 0xffffffff) can
never be executable, even if the guest tries to set the MPU registers
up that way. Enforce this restriction.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ceef225..169c361 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8251,6 +8251,14 @@ static inline bool is_ppb_region(CPUARMState *env, uint32_t address)
         extract32(address, 20, 12) == 0xe00;
 }
 
+static inline bool is_system_region(CPUARMState *env, uint32_t address)
+{
+    /* True if address is in the M profile system region
+     * 0xe0000000 - 0xffffffff
+     */
+    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
+}
+
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  int access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, int *prot, uint32_t *fsr)
@@ -8354,6 +8362,12 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
             get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
         } else { /* a MPU hit! */
             uint32_t ap = extract32(env->pmsav7.dracr[n], 8, 3);
+            uint32_t xn = extract32(env->pmsav7.dracr[n], 12, 1);
+
+            if (is_system_region(env, address)) {
+                /* System space is always execute never */
+                xn = 1;
+            }
 
             if (is_user) { /* User mode AP bit decoding */
                 switch (ap) {
@@ -8394,7 +8408,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
             }
 
             /* execute never */
-            if (env->pmsav7.dracr[n] & (1 << 12)) {
+            if (xn) {
                 *prot &= ~PAGE_EXEC;
             }
         }
-- 
2.7.4

