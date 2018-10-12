Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp900008wrt;
        Fri, 12 Oct 2018 07:46:32 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62W9wp17HT2fPy38fco6DhTVJBLVDhAWz6yTtU334w1tNNSfSU7oUun7XYMi4toc3f4w7W5
X-Received: by 2002:ad4:5252:: with SMTP id s18mr6166217qvq.206.1539355592150;
        Fri, 12 Oct 2018 07:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355592; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9vscUAFZAjsdDqcJ9OOB8E17QKRR8S5NK5q8xaMz4uOIKzUwHp/ZyStcGjQGd8Vb+
         K2jOf8jm6948BNKn9c6FN+3KwbBNSkLlIutPCEqf7WG8J0B8Li1d00lGd6D48vcVZ2RY
         QLPYWrU2TX6ALGB4inW+cWSGJ+2RJwJFgfkaToY7geHub3vcVPf2Bai8ggbOZzLUJHFI
         tMEMjy+2HUzsBWkVaIn4Ortv8vxZBn/3v1kaBKv+gni2AAv3cmX36xvS1k3C6CnxPxRu
         5+ofUvksU0rb7GGVvFC45nG0BeEQlh3uij/lqTyTB7beEBa8+xlzS1KeLpVdLvLCBOF9
         uTQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=H+vkl/qzeenehwtysQ8Hz+5KAKjqPVse5tygDQbTdDI=;
        b=IvLr+BEQ1SpcpX9sKRDLC3P1sNQq78XCNsaVDdov3+v1KaWklvGOvHDEYyRerJcZEP
         3JtxvrUexV1urs7LC2qmIqq139an0mwbRmcS7zYblHAWtxGf21s0a015wlSCV+iT7TLM
         P6DEGY/H2hx3qD9rgviFJuDv7X4FOoNhSklgTkfugO6RwAuuAOcg59Qd+G+rd6v4adDu
         IbM3EGjYG88R3H5RxK3WPqtyTjnCBknQP8JxIjztkQwuiP236ZBQtO6n0NujpNLl+3Mi
         pz2LPGvpiPUb8C6hpFl6IP7YifSX1GDh6/NPH0RCOv7FKdODkzZY3zfSKabtzYNeqHc3
         XddA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9si1237948qvu.207.2018.10.12.07.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyhy-0002QR-QA
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:46:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeR-00083W-Fd
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeQ-00032E-LZ
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:51 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeQ-0002yA-CE; Fri, 12 Oct 2018 10:42:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeO-0000Pg-EI; Fri, 12 Oct 2018 15:42:48 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:33 +0100
Message-Id: <20181012144235.19646-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181012144235.19646-1-peter.maydell@linaro.org>
References: <20181012144235.19646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 08/10] target/arm: New utility function to
 extract EC from syndrome
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
X-TUID: gl+5zgvcRCkL

Create and use a utility function to extract the EC field
from a syndrome, rather than open-coding the shift.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 5 +++++
 target/arm/helper.c    | 4 ++--
 target/arm/kvm64.c     | 2 +-
 target/arm/op_helper.c | 2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d4b1973efa1..516f9454e9b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -278,6 +278,11 @@ enum arm_exception_class {
 #define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
 #define ARM_EL_ISV (1 << ARM_EL_ISV_SHIFT)
 
+static inline uint32_t syn_get_ec(uint32_t syn)
+{
+    return syn >> ARM_EL_EC_SHIFT;
+}
+
 /* Utility functions for constructing various kinds of syndrome value.
  * Note that in general we follow the AArch64 syndrome values; in a
  * few cases the value in HSR for exceptions taken to AArch32 Hyp
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b5752d52dd1..0b89804961b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8333,7 +8333,7 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
     uint32_t moe;
 
     /* If this is a debug exception we must update the DBGDSCR.MOE bits */
-    switch (env->exception.syndrome >> ARM_EL_EC_SHIFT) {
+    switch (syn_get_ec(env->exception.syndrome)) {
     case EC_BREAKPOINT:
     case EC_BREAKPOINT_SAME_EL:
         moe = 1;
@@ -8669,7 +8669,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (qemu_loglevel_mask(CPU_LOG_INT)
         && !excp_is_internal(cs->exception_index)) {
         qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
-                      env->exception.syndrome >> ARM_EL_EC_SHIFT,
+                      syn_get_ec(env->exception.syndrome),
                       env->exception.syndrome);
     }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index e0b82462838..ce33cbc65a6 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -920,7 +920,7 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 
 bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 {
-    int hsr_ec = debug_exit->hsr >> ARM_EL_EC_SHIFT;
+    int hsr_ec = syn_get_ec(debug_exit->hsr);
     ARMCPU *cpu = ARM_CPU(cs);
     CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = &cpu->env;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index fb15a13e6c9..b1e65f43d38 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -42,7 +42,7 @@ void raise_exception(CPUARMState *env, uint32_t excp,
          * (see DDI0478C.a D1.10.4)
          */
         target_el = 2;
-        if (syndrome >> ARM_EL_EC_SHIFT == EC_ADVSIMDFPACCESSTRAP) {
+        if (syn_get_ec(syndrome) == EC_ADVSIMDFPACCESSTRAP) {
             syndrome = syn_uncategorized();
         }
     }
-- 
2.19.0

