Received: by 10.223.159.74 with SMTP id f10csp3221756wrg;
        Tue, 5 Dec 2017 11:50:34 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ0kRsRDuZ7TKDOJ+2rODeDFLuIy5bp0jVFe3NhaiB5rkVofpBYuDxT+13MviIKBrnoVHCi
X-Received: by 10.129.227.66 with SMTP id w2mr13718987ywl.456.1512503434507;
        Tue, 05 Dec 2017 11:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503434; cv=none;
        d=google.com; s=arc-20160816;
        b=tW3fQdtAkHcatRzLWlm89frChvl5o3N7Ou9VFrsiboS8RSRsyz/sNTKl56kHcw3Ocr
         LjetaN7teVfpHv/i38vcT0aAy5ckK3Im7b0xTsjnaBHKKzFkK4Bz3wimyDfWACp2mTFA
         U3hlvbosOZmU9HQWOSkrsMZq0/F1ts9DRKCefCTRZvXqRk0XfV8+Rfd19xVn3JpVxF9k
         vOT0fppEQx3fxfOiwnG1lf/fhQGNwvA0WIVOoQcmRb8JqXyF6UP1U7MA8neSzNUEH1sL
         EQ+2vsAjZZr5Fts3/c0N84Y0FhpoeFLtt+ZCuRqCSoGT9k5y1yxCxxe8Jkupz1gRRqwz
         v+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=s1wmZesBd4JYiEqRo7OWALVgsaLL3wuGTfX2B+sLcp0=;
        b=q6d1i7m4PwqOXeFvCqgDuZFV/I3OqUnLoF3kulhLSTgepfzpGKhXR2QxSXbtvZXH28
         oXXoXGQWdQHW2PHhJt+uOeFEgc0YUou/3XY+CURg52vDGGcmBG0dKv28Os9PA1kay6HW
         Bdg4K87JZ+Wt76yETbHwwvSF82xdVfaGlgJ6eJU7pk+DezhD2V6JTh1kPBMuT7Jr0LkR
         eu2oa2GjV7pydFFusL8CniWQ7tNVYJuRRwO8vXYiVl8FAkTEaS/9TzN0tdOKvJCFFuIH
         u4rKyQCsRFiOHnxQbUkMAlqS/vooFrK1w06N7fFgh9MzmH3DkUhGBcEp3jAXCB3E5tgc
         Ymqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r127si232778ywb.768.2017.12.05.11.50.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:50:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJEg-0004xP-0T
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:50:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB8-00018H-61
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB7-0002O4-3L
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:54 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJB6-0002CW-ST; Tue, 05 Dec 2017 14:46:53 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAp-000597-1N; Tue, 05 Dec 2017 19:46:35 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:22 +0000
Message-Id: <1512503192-2239-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 02/12] target/arm: Remove fsr argument from
 arm_ld*_ptw()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XXrQi4Lr/3Rl

All the callers of arm_ldq_ptw() and arm_ldl_ptw() ignore the value
that those functions store in the fsr argument on failure: if they
return failure to their callers they will always overwrite the fsr
value with something else.

Remove the argument from these functions and S1_ptw_translate().
This will simplify removing fsr from the calling functions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5368ad8..30616d9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8269,7 +8269,6 @@ static bool get_level1_table_address(CPUARMState *env, ARMMMUIdx mmu_idx,
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                hwaddr addr, MemTxAttrs txattrs,
-                               uint32_t *fsr,
                                ARMMMUFaultInfo *fi)
 {
     if ((mmu_idx == ARMMMUIdx_S1NSE0 || mmu_idx == ARMMMUIdx_S1NSE1) &&
@@ -8278,9 +8277,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
         hwaddr s2pa;
         int s2prot;
         int ret;
+        uint32_t fsr;
 
         ret = get_phys_addr_lpae(env, addr, 0, ARMMMUIdx_S2NS, &s2pa,
-                                 &txattrs, &s2prot, &s2size, fsr, fi, NULL);
+                                 &txattrs, &s2prot, &s2size, &fsr, fi, NULL);
         if (ret) {
             fi->s2addr = addr;
             fi->stage2 = true;
@@ -8300,8 +8300,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
  * (but not if it was for a debug access).
  */
 static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, uint32_t *fsr,
-                            ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -8310,7 +8309,7 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
 
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fsr, fi);
+    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
@@ -8322,8 +8321,7 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
 }
 
 static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
-                            ARMMMUIdx mmu_idx, uint32_t *fsr,
-                            ARMMMUFaultInfo *fi)
+                            ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -8332,7 +8330,7 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
 
     attrs.secure = is_secure;
     as = arm_addressspace(cs, attrs);
-    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fsr, fi);
+    addr = S1_ptw_translate(env, mmu_idx, addr, attrs, fi);
     if (fi->s1ptw) {
         return 0;
     }
@@ -8368,7 +8366,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         goto do_fault;
     }
     desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fsr, fi);
+                       mmu_idx, fi);
     type = (desc & 3);
     domain = (desc >> 5) & 0x0f;
     if (regime_el(env, mmu_idx) == 1) {
@@ -8405,7 +8403,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
         desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fsr, fi);
+                           mmu_idx, fi);
         switch (desc & 3) {
         case 0: /* Page translation fault.  */
             code = 7;
@@ -8487,7 +8485,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         goto do_fault;
     }
     desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fsr, fi);
+                       mmu_idx, fi);
     type = (desc & 3);
     if (type == 0 || (type == 3 && !arm_feature(env, ARM_FEATURE_PXN))) {
         /* Section translation fault, or attempt to use the encoding
@@ -8539,7 +8537,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
         desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fsr, fi);
+                           mmu_idx, fi);
         ap = ((desc >> 4) & 3) | ((desc >> 7) & 4);
         switch (desc & 3) {
         case 0: /* Page translation fault.  */
@@ -8950,7 +8948,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fsr, fi);
+        descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fi);
         if (fi->s1ptw) {
             goto do_fault;
         }
-- 
2.7.4

