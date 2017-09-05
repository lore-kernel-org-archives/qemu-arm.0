Received: by 10.223.172.38 with SMTP id v35csp1580777wrc;
        Tue, 5 Sep 2017 08:55:19 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7ieUST/qItyFF0vRK5UZo/JxJ7GUJ7W3CbyYOavzZDPxty9qD2KTerSjYzpPSKAzbsX+Cm
X-Received: by 10.237.42.35 with SMTP id c32mr6262552qtd.171.1504626919645;
        Tue, 05 Sep 2017 08:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504626919; cv=none;
        d=google.com; s=arc-20160816;
        b=H0VDfuPe7g82krlG6htNLJnpuOrSw1l5ZU62+crWWo9gyCiPTFOFspntnnwVGiVZuQ
         Iped5yRCdVnSp7mdK+aeg617DpyyuL5fhT3hHjX72J81fcsOufQqVm7mmAkfhN8s68R8
         JRTbdnxcWOmxPhX4qsyexNmNlbXVyLhdYSQpisPgccjcNEO50MgTLDY+8Ge6GVufugSD
         sOq0WKLQfPQGepcDqeLtom27DHFFCveG9AKQsJORpO6SDycZbQO2x5dSGhuFu6hCExMn
         7GyG6MQRFy0+P2FxeAdpmJOPnZVjvEwz0+vEwtjx35HBoGI9DstBP2V1OMlhpbPPXfpq
         LIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=a/Y2RHS2yWp4IgFi4vcAun+wyJxftUF7408d+F9nr/A=;
        b=LhWJ67p8Y6Ku89uAmujgvXzNEE09qWc4pmGTICvRQEFRNQcULUMvMey/Oq8aGO89Sw
         VMkHUc6mPVqNVEQbAKKZzyArQlrUyxvwgZZ4NtrSU+B21m+Tw9AAy41lWB3+CEMEX7ur
         4dyiExGzrEXKXaOFs8wcTBLAeHWBD1Koyts6XWFpgPQk4wXbnEVVt/19Oe+Kxv2xbscM
         w0xm/Fvm/y7zRf3pyjcQMEsXl1ON3kbsobdNRCcw78nTP7WvuSgX8+FWRfCD0BhE5GL+
         BD3i5LneQD15wgMUTAqrMdr9yzyaIpkFOfDP1cAmNioNZIOzWUmnk/Cb/Yd8+lWvgjg/
         J2BA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r35si775023qkh.252.2017.09.05.08.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 08:55:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpGC5-0001g7-C7
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 11:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dpGAQ-0000EE-Fk
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:53:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dpGAL-0004D7-NU
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:53:34 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dpGAL-00045L-FJ; Tue, 05 Sep 2017 11:53:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dpGA9-00079o-NJ; Tue, 05 Sep 2017 16:53:17 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 16:53:34 +0100
Message-Id: <1504626814-23124-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504626814-23124-1-git-send-email-peter.maydell@linaro.org>
References: <1504626814-23124-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 3/3] target/arm: Implement new
 do_transaction_failed hook
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +RqPP/A9bxdp

Implement the new do_transaction_failed hook for ARM, which should
cause the CPU to take a prefetch abort or data abort.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/arm/internals.h | 10 ++++++++++
 target/arm/cpu.c       |  1 +
 target/arm/op_helper.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 461f558..b100da9 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -472,6 +472,16 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr);
 
+/* arm_cpu_do_transaction_failed: handle a memory system error response
+ * (eg "no device/memory present at address") by raising an external abort
+ * exception
+ */
+void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                   vaddr addr, unsigned size,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, MemTxAttrs attrs,
+                                   MemTxResult response, uintptr_t retaddr);
+
 /* Call the EL change hook if one has been registered */
 static inline void arm_call_el_change_hook(ARMCPU *cpu)
 {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 41ae6ba..a323e6b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1667,6 +1667,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #else
     cc->do_interrupt = arm_cpu_do_interrupt;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
+    cc->do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 8f6db80..d1bca46 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -229,6 +229,49 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     deliver_fault(cpu, vaddr, access_type, fsr, fsc, &fi);
 }
 
+/* arm_cpu_do_transaction_failed: handle a memory system error response
+ * (eg "no device/memory present at address") by raising an external abort
+ * exception
+ */
+void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                   vaddr addr, unsigned size,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, MemTxAttrs attrs,
+                                   MemTxResult response, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint32_t fsr, fsc;
+    ARMMMUFaultInfo fi = {};
+    ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
+
+    if (retaddr) {
+        /* now we have a real cpu fault */
+        cpu_restore_state(cs, retaddr);
+    }
+
+    /* The EA bit in syndromes and fault status registers is an
+     * IMPDEF classification of external aborts. ARM implementations
+     * usually use this to indicate AXI bus Decode error (0) or
+     * Slave error (1); in QEMU we follow that.
+     */
+    fi.ea = (response != MEMTX_DECODE_ERROR);
+
+    /* The fault status register format depends on whether we're using
+     * the LPAE long descriptor format, or the short descriptor format.
+     */
+    if (arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
+        /* long descriptor form, STATUS 0b010000: synchronous ext abort */
+        fsr = (fi.ea << 12) | (1 << 9) | 0x10;
+    } else {
+        /* short descriptor form, FSR 0b01000 : synchronous ext abort */
+        fsr = (fi.ea << 12) | 0x8;
+    }
+    fsc = 0x10;
+
+    deliver_fault(cpu, addr, access_type, fsr, fsc, &fi);
+}
+
 #endif /* !defined(CONFIG_USER_ONLY) */
 
 uint32_t HELPER(add_setq)(CPUARMState *env, uint32_t a, uint32_t b)
-- 
2.7.4

