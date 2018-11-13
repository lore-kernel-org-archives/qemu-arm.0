Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4630104wrw;
        Tue, 13 Nov 2018 09:19:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5dxwoiPDBLEPUMuZXNPNidaTjJmPKekNy+e2+2bZHsQ2u2+GMCcYHSZPqKy6QhvwefNHHHk
X-Received: by 2002:ac8:7616:: with SMTP id t22mr5832581qtq.375.1542129578254;
        Tue, 13 Nov 2018 09:19:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129578; cv=none;
        d=google.com; s=arc-20160816;
        b=lkRZoThq5an5U6irMlPUx4nXt1NoRGSLuiN1sPQRqCMJX8GNwdwiYN6ZwAk2fQk83L
         /YtpmM0EjPg7Q0Lt9AfJkNUcohY47Iw7Kv3zxEB3zPONcWUOnGGogeSJxVd9V2Qzr63w
         TuiAMbFp1SSlf2TmY9+AAZv09ZqaHmjJ7QwDRPCelUnLxN/w3Y/nV0DUvrki5AQ/RdoY
         Y6N2L4eqa/szN+SBiu+tn9tfodBYPdLv8pmzDu5+ZKGkhU87ooVlHKe0ypAhD7e+f2nU
         RlEYH6m2rnnFnwmRCNF4fGg729AjVfcNxaw2gLJxjtyklrwfNGZxmqRI1HYhaKcMNmJ7
         pMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZMLGeh2oMmlgL9Q9sXP7EfIEjr2fpvnM/HLX2u9tHg8=;
        b=Ax80LHoIYUbi3vHyrEscrDEQ1Rnoqv7lR59lvprbV+i/Nwl4ULlxcffaekPSoWf2MS
         IzoIuP/F+qn7kqGOyFKAZ9dhXlxPbLyLt9mLnVsII6HH6CQbM/5AwrLPttqdoono91m3
         Gc5o3josypw+wGY4u9t7QB2jonby+YVaLw6AqaLIL81V5Okkp7Rsk7v0CITvY1WlTGjg
         iUKg4F9fuosMmeygf4dV0RWCSJcdT3rCwCi0GHg0Y7PLWZ/yMy2NmSxYy1PcU/v/e4uZ
         V5Nch2rKblODJE0bxoZh1cwRehIwbcUyAzn/8qMLdmD1dAfLHOTndDZtEk/9z0EQFvDs
         K1uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m25si9446530qtg.282.2018.11.13.09.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:19:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcLh-0001GS-Gu
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:19:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMcAl-0006HH-Mk
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 12:08:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMbwh-0003xD-Cq
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 11:53:51 -0500
Received: from mga06.intel.com ([134.134.136.31]:62850)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMbwg-0003nD-99; Tue, 13 Nov 2018 11:53:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 08:53:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,228,1539673200"; d="scan'208";a="107922107"
Received: from qingbai-mobl.ger.corp.intel.com (HELO
	caravaggio.ger.corp.intel.com) ([10.249.41.239])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2018 08:53:36 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 17:52:40 +0100
Message-Id: <20181113165247.4806-7-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113165247.4806-1-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH 06/13] target: arm: Make ARM TLB filling
 routine static
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdNJFvB3gWW9

It's only used in op_helper.c, it does not need to be exported and
moreover it should only be build when TCG is enabled.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
---
 target/arm/internals.h |  5 -----
 target/arm/helper.c    | 37 -------------------------------------
 target/arm/op_helper.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 42 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ffb5091b1f..06439467d2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -741,11 +741,6 @@ static inline bool arm_extabort_type(MemTxResult result)
     return result != MEMTX_DECODE_ERROR;
 }
 
-/* Do a page table walk and add page to TLB if possible */
-bool arm_tlb_fill(CPUState *cpu, vaddr address,
-                  MMUAccessType access_type, int mmu_idx,
-                  ARMMMUFaultInfo *fi);
-
 /* Return true if the stage 1 translation regime is using LPAE format page
  * tables */
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bc2c8cdb67..689879c23a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8855,43 +8855,6 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 }
 
-/* Walk the page table and (if the mapping exists) add the page
- * to the TLB. Return false on success, or true on failure. Populate
- * fsr with ARM DFSR/IFSR fault register format value on failure.
- */
-bool arm_tlb_fill(CPUState *cs, vaddr address,
-                  MMUAccessType access_type, int mmu_idx,
-                  ARMMMUFaultInfo *fi)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot;
-    int ret;
-    MemTxAttrs attrs = {};
-
-    ret = get_phys_addr(env, address, access_type,
-                        core_to_arm_mmu_idx(env, mmu_idx), &phys_addr,
-                        &attrs, &prot, &page_size, fi, NULL);
-    if (!ret) {
-        /*
-         * Map a single [sub]page. Regions smaller than our declared
-         * target page size are handled specially, so for those we
-         * pass in the exact addresses.
-         */
-        if (page_size >= TARGET_PAGE_SIZE) {
-            phys_addr &= TARGET_PAGE_MASK;
-            address &= TARGET_PAGE_MASK;
-        }
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
-                                prot, mmu_idx, page_size);
-        return 0;
-    }
-
-    return ret;
-}
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 44a74cb296..3b0459db50 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -179,6 +179,44 @@ static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
     raise_exception(env, exc, syn, target_el);
 }
 
+/* Walk the page table and (if the mapping exists) add the page
+ * to the TLB. Return false on success, or true on failure. Populate
+ * fsr with ARM DFSR/IFSR fault register format value on failure.
+ */
+static bool arm_tlb_fill(CPUState *cs, vaddr address,
+                         MMUAccessType access_type, int mmu_idx,
+                         ARMMMUFaultInfo *fi)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    hwaddr phys_addr;
+    target_ulong page_size;
+    int prot;
+    int ret;
+    MemTxAttrs attrs = {};
+
+    ret = get_phys_addr(env, address, access_type,
+                        core_to_arm_mmu_idx(env, mmu_idx), &phys_addr,
+                        &attrs, &prot, &page_size, fi, NULL);
+    if (!ret) {
+        /*
+         * Map a single [sub]page. Regions smaller than our declared
+         * target page size are handled specially, so for those we
+         * pass in the exact addresses.
+         */
+        if (page_size >= TARGET_PAGE_SIZE) {
+            phys_addr &= TARGET_PAGE_MASK;
+            address &= TARGET_PAGE_MASK;
+        }
+        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+                                prot, mmu_idx, page_size);
+        return 0;
+    }
+
+    return ret;
+}
+
+
 /* try to fill the TLB and return an exception if error. If retaddr is
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
-- 
2.19.1

