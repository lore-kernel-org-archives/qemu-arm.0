Received: by 10.25.221.202 with SMTP id w71csp2345782lfi;
        Fri, 4 Aug 2017 10:21:15 -0700 (PDT)
X-Received: by 10.237.38.132 with SMTP id q4mr3977629qtd.321.1501867274950;
        Fri, 04 Aug 2017 10:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501867274; cv=none;
        d=google.com; s=arc-20160816;
        b=HWim3cLi5XgBka6c+eyJ1mw2AhC1rvCnsMmVatT5o5aeoCQS6bOdjCf9YEgvLJFnu0
         rDyPko2Im7Hpq5b50qrNh+F4teWtBRQ5AStwUdCHMqfVnbj1XnhB4kIq9avUZyIgFaOD
         TeG33snvC9iNBPfZPU+CfpFovHdWwmLb/vW3TwgDLzZlLc7WCmyJCSjWBsNAFXimeTGZ
         Sya6knw3tyBDYnULdbw7YT7LnZfWfzIHfdu8YB7M/t/Pzq7kEjLia5YrzE25j8XETeGd
         awG9xHLOqUBGznFk4unBJQmn0uJzI+hfFXZuk9Bv0e+iB4vY/1GJNbhuqoJbdf9epjqW
         hZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=W+RGmC9taOcvCwfyGEQmZT/QcbwUkHzPmeKzCV5QRKc=;
        b=F5bDCvGU68Tolj4zJU6tXlU4vi5aMzNazNRFbZQx9unDQQQ+dLO3RcLS0N03MrrUU5
         A06nlVHp5QZDZIHbqrDserGVyVyCCJ0wDk1x9Dy/MaWc+KR4PsQB4SAZMk4XV1Cj77Aw
         hBgp6iXL/4xc2W8CX5fjd4W7l187593yn5CULFF2KsWgDhBTIPo6I8DLpje5xdajZPx3
         OJsA2qt5QGxqF9C3pmA3GOhcKz+JWKGOjWhRMf/mDNdJ+RT5U4vlCmlhUSuCJsDZvp51
         t5fm9/Q7ykDHcQwWNmx1TqQquFRrZax7P+08rxxStnWEJL3nkYbMD34dE0NuoUzwydk0
         Edew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1si1951599qtd.431.2017.08.04.10.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 10:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddgHg-0007Md-8O
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 13:21:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgHW-0007CZ-BA
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgHU-0001Rb-KW
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:21:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ddgHU-0001Dp-CX; Fri, 04 Aug 2017 13:21:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ddgHO-0006uU-DU; Fri, 04 Aug 2017 18:20:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 Aug 2017 18:20:49 +0100
Message-Id: <1501867249-1924-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 8/8] target/arm: Implement new
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
X-TUID: 0jN2tH+HbWWo

Implement the new do_transaction_failed hook for ARM, which should
cause the CPU to take a prefetch abort or data abort.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 10 ++++++++++
 target/arm/cpu.c       |  1 +
 target/arm/op_helper.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a3adbd8..13bb001 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -471,6 +471,16 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
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
index 05c038b..6baede0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1670,6 +1670,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #else
     cc->do_interrupt = arm_cpu_do_interrupt;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
+    cc->do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 7eac272..54b6dd8 100644
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

