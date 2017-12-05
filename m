Received: by 10.223.159.74 with SMTP id f10csp3225965wrg;
        Tue, 5 Dec 2017 11:55:42 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYTT5dwIpMDsYfrNh6/LvvdAnarkZF9q4LxRBwIcxH7g9OR37k9rJNBX9YXL3DVg3NndQ83
X-Received: by 10.13.198.132 with SMTP id i126mr14320335ywd.381.1512503741961;
        Tue, 05 Dec 2017 11:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512503741; cv=none;
        d=google.com; s=arc-20160816;
        b=zMq3iT+ObgaepA/nExp2I+B7RfRSC1MAvCdTIGrxJ0aOZlYa6QtURHXIbj4MtuMCrH
         NOEcF5Df2pnuRb0aSyA/K8mG5WjK1YAaeq61E7VZ3YjxGAIj+JJ3BNuU5OdkivCvF9zf
         LKpDL2YQHhRNUUz9E7e4OzhC2GAXdTLzRFNz2t+5shiVBAkGZEZjzWfk5MWCu/Tue+fI
         HU+U8YnWDi/IOh+4ANmCxnCKjw9nmCZhdzfdD8Z7RV36HUsC0WMTNdwst1gN2+EpW13i
         AnQKKCsh2bP+SqHag7Bbm1E8DgQaVOX0VZQw77ir3xs0CBs7hcdCoGJuNY3nslOq71JI
         rg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=neRQg8Auj0ijB9S4Sepgv5MmzJovGeJ3gBWpDzXuShQ=;
        b=Gk2b3SKGMZy9fzzRUdj8Db8HySykTKxufTGKRLiiameXa8ZPWDsAcVQc7+BIV3OI60
         kkMW4HG/LYDUAukUVk4f56SJPPVjT8ISo0DdUYB1GhCjB1EUJslWTRAOjOOXeZJAI7G/
         frvyr4YXLJbqUyecN+DkWvigP8TpSLuqsjbUXX7mUmcZc7aEAEsNM594hXbcGOw05FpU
         EDL8AWlVS6Hhi03Aei6s5lp4IJzHksHN/3PYwd5LAF1KQaCAVI3aEyYY5/OYgZB/vrSZ
         CVuCbWHGolVPlFphVMwCkAuUzNbeQs0+kw4I0bQPTdHzCEjgiKR5wm744dCss4N/ANF4
         6Yfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 125si231524ywn.671.2017.12.05.11.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Dec 2017 11:55:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eMJJd-0001dp-E3
	for alex.bennee@linaro.org; Tue, 05 Dec 2017 14:55:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB9-00019n-IV
	for qemu-devel@nongnu.org; Tue, 05 Dec 2017 14:46:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eMJB8-0002PC-JX
	for qemu-devel@nongnu.org; Tue, 05 Dec 2017 14:46:55 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38776)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eMJB5-0002CW-TV; Tue, 05 Dec 2017 14:46:52 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eMJAp-00059Q-Lv; Tue, 05 Dec 2017 19:46:35 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Dec 2017 19:46:23 +0000
Message-Id: <1512503192-2239-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
References: <1512503192-2239-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 03/12] target/arm: Convert get_phys_addr_v5()
 to not return FSC values
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DFCxg1voUQKK

Make get_phys_addr_v5() return a fault type in the ARMMMUFaultInfo
structure, which we convert to the FSC at the callsite.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 30616d9..6aed681 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8344,11 +8344,11 @@ static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
                              hwaddr *phys_ptr, int *prot,
-                             target_ulong *page_size, uint32_t *fsr,
+                             target_ulong *page_size,
                              ARMMMUFaultInfo *fi)
 {
     CPUState *cs = CPU(arm_env_get_cpu(env));
-    int code;
+    int level = 1;
     uint32_t table;
     uint32_t desc;
     int type;
@@ -8362,7 +8362,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
     /* Lookup l1 descriptor.  */
     if (!get_level1_table_address(env, mmu_idx, &table, address)) {
         /* Section translation fault if page walk is disabled by PD0 or PD1 */
-        code = 5;
+        fi->type = ARMFault_Translation;
         goto do_fault;
     }
     desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
@@ -8377,21 +8377,20 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
     domain_prot = (dacr >> (domain * 2)) & 3;
     if (type == 0) {
         /* Section translation fault.  */
-        code = 5;
+        fi->type = ARMFault_Translation;
         goto do_fault;
     }
+    if (type != 2) {
+        level = 2;
+    }
     if (domain_prot == 0 || domain_prot == 2) {
-        if (type == 2)
-            code = 9; /* Section domain fault.  */
-        else
-            code = 11; /* Page domain fault.  */
+        fi->type = ARMFault_Domain;
         goto do_fault;
     }
     if (type == 2) {
         /* 1Mb section.  */
         phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
         ap = (desc >> 10) & 3;
-        code = 13;
         *page_size = 1024 * 1024;
     } else {
         /* Lookup l2 entry.  */
@@ -8406,7 +8405,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                            mmu_idx, fi);
         switch (desc & 3) {
         case 0: /* Page translation fault.  */
-            code = 7;
+            fi->type = ARMFault_Translation;
             goto do_fault;
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
@@ -8429,7 +8428,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                     /* UNPREDICTABLE in ARMv5; we choose to take a
                      * page translation fault.
                      */
-                    code = 7;
+                    fi->type = ARMFault_Translation;
                     goto do_fault;
                 }
             } else {
@@ -8442,18 +8441,19 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Never happens, but compiler isn't smart enough to tell.  */
             abort();
         }
-        code = 15;
     }
     *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
     *prot |= *prot ? PAGE_EXEC : 0;
     if (!(*prot & (1 << access_type))) {
         /* Access permission fault.  */
+        fi->type = ARMFault_Permission;
         goto do_fault;
     }
     *phys_ptr = phys_addr;
     return false;
 do_fault:
-    *fsr = code | (domain << 4);
+    fi->domain = domain;
+    fi->level = level;
     return true;
 }
 
@@ -9863,8 +9863,11 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         return get_phys_addr_v6(env, address, access_type, mmu_idx, phys_ptr,
                                 attrs, prot, page_size, fsr, fi);
     } else {
-        return get_phys_addr_v5(env, address, access_type, mmu_idx, phys_ptr,
-                                prot, page_size, fsr, fi);
+        bool ret = get_phys_addr_v5(env, address, access_type, mmu_idx,
+                                    phys_ptr, prot, page_size, fi);
+
+        *fsr = arm_fi_to_sfsc(fi);
+        return ret;
     }
 }
 
-- 
2.7.4

