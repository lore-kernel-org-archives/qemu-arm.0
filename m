Received: by 10.223.159.74 with SMTP id f10csp3221329wrg;
        Tue, 5 Dec 2017 11:50:02 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZBkNEKHlQWLPLzDIRrx5oe+xfqqVnFK2H0zGcPFSNNPUZARn09f+P9ujlZ+tyPc+XWIqHM
X-Received: by 10.37.112.68 with SMTP id l65mr13957447ybc.95.1512503402763;
        Tue, 05 Dec 2017 11:50:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503402; cv=none;
        d=google.com; s=arc-20160816;
        b=GgdSgVhKmSqnEzLbLUyAsGPgEl499h/vX53D/qEU0MfmBPEvTA+XZ8SfE0cFdyPk6Q
         MfVSzw9y52mbRvC5ZcWe6fcEGqquGpJdX99ZborI7ul/+lNjkt6plw2PMpczu/l1xYEr
         yMWH5rUNvuSupoe8I7bgrTTOPWxoM5PFt/TnCfTgctrFi9OTkVKUnOH5CgMIXXoxSMVR
         xFQ25w3nRjQI5xreNFxLSRP2HtnLCXk/FN+wTGm/dXJB/pdpRy8df8nUVyCNXMqL1xqa
         E4CVtMXwNIB5MH9B3s7SgrGdFsqYhEPkk3YP61CkVp6MiRiSo/sgoiQfj0mA7cu333CF
         JveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=vv1GP02Hm6hr/5fqJm6xXDe5E3FL+LaPtVNO5ia++YA=;
        b=TGhNJOf4SDx/rj6Yv8C+l0F3Bc6v4Geu1U5N1/yDiEwTm3B4IhkgxVA0eqs2W/KGAR
         Mtm8uNnD+tQRy5Qj7p+MVcg7TqJ5Nqa0+KEtsQviukn4uKTCd7W2dKq3uiM75ila6A+N
         k3ybVXYFd4W7tA5wulDiY0vgINASHeHlY/O+46gvzW9DSu73D9kO8RG6XnQpK7ANvm/q
         jx9UyT0Zt14w8Z34EB5Qhxm1ni27krns/gLFwIUBMxQc6ohs4zux0XpaVtRXLgBnkGax
         J4MADLvRBd86e3DbWGo2J/kWg+r4VgiCpqEk/ClVUNMVVLAffOYb+8qJlNXruMfgQPnR
         D4Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si232681ybt.192.2017.12.05.11.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:50:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJEA-0004Su-4h
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:50:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB2-00010f-EL
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB1-0002KJ-74
	for qemu-arm@nongnu.org; Tue, 05 Dec 2017 14:46:48 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJB0-0002CW-VI; Tue, 05 Dec 2017 14:46:47 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAt-0005By-3H; Tue, 05 Dec 2017 19:46:39 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:28 +0000
Message-Id: <1512503192-2239-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 08/12] target/arm: Convert get_phys_addr_pmsav8()
 to not return FSC values
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
X-TUID: o7XLpI/pQGlm

Make get_phys_addr_pmsav8() return a fault type in the ARMMMUFaultInfo
structure, which we convert to the FSC at the callsite.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0f5b161..fad4923 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9367,7 +9367,7 @@ static void v8m_security_lookup(CPUARMState *env, uint32_t address,
 static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
                               hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                              int *prot, uint32_t *fsr, uint32_t *mregion)
+                              int *prot, ARMMMUFaultInfo *fi, uint32_t *mregion)
 {
     /* Perform a PMSAv8 MPU lookup (without also doing the SAU check
      * that a full phys-to-virt translation does).
@@ -9423,7 +9423,8 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                 /* Multiple regions match -- always a failure (unlike
                  * PMSAv7 where highest-numbered-region wins)
                  */
-                *fsr = 0x00d; /* permission fault */
+                fi->type = ARMFault_Permission;
+                fi->level = 1;
                 return true;
             }
 
@@ -9451,7 +9452,7 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
     if (!hit) {
         /* background fault */
-        *fsr = 0;
+        fi->type = ARMFault_Background;
         return true;
     }
 
@@ -9479,7 +9480,8 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         }
     }
 
-    *fsr = 0x00d; /* Permission fault */
+    fi->type = ARMFault_Permission;
+    fi->level = 1;
     return !(*prot & (1 << access_type));
 }
 
@@ -9487,7 +9489,7 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
                                  hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                                 int *prot, uint32_t *fsr)
+                                 int *prot, ARMMMUFaultInfo *fi)
 {
     uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
@@ -9513,7 +9515,11 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              * (including possibly emulating an SG instruction).
              */
             if (sattrs.ns != !secure) {
-                *fsr = sattrs.nsc ? M_FAKE_FSR_NSC_EXEC : M_FAKE_FSR_SFAULT;
+                if (sattrs.nsc) {
+                    fi->type = ARMFault_QEMU_NSCExec;
+                } else {
+                    fi->type = ARMFault_QEMU_SFault;
+                }
                 *phys_ptr = address;
                 *prot = 0;
                 return true;
@@ -9535,7 +9541,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                  * If we added it we would need to do so as a special case
                  * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
                  */
-                *fsr = M_FAKE_FSR_SFAULT;
+                fi->type = ARMFault_QEMU_SFault;
                 *phys_ptr = address;
                 *prot = 0;
                 return true;
@@ -9544,7 +9550,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     }
 
     return pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
-                             txattrs, prot, fsr, NULL);
+                             txattrs, prot, fi, NULL);
 }
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
@@ -9822,7 +9828,8 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       phys_ptr, attrs, prot, fsr);
+                                       phys_ptr, attrs, prot, fi);
+            *fsr = arm_fi_to_sfsc(fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
@@ -10183,9 +10190,9 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     uint32_t tt_resp;
     bool r, rw, nsr, nsrw, mrvalid;
     int prot;
+    ARMMMUFaultInfo fi = {};
     MemTxAttrs attrs = {};
     hwaddr phys_addr;
-    uint32_t fsr;
     ARMMMUIdx mmu_idx;
     uint32_t mregion;
     bool targetpriv;
@@ -10219,7 +10226,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
     if (arm_current_el(env) != 0 || alt) {
         /* We can ignore the return value as prot is always set */
         pmsav8_mpu_lookup(env, addr, MMU_DATA_LOAD, mmu_idx,
-                          &phys_addr, &attrs, &prot, &fsr, &mregion);
+                          &phys_addr, &attrs, &prot, &fi, &mregion);
         if (mregion == -1) {
             mrvalid = false;
             mregion = 0;
-- 
2.7.4

