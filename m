Received: by 10.28.91.67 with SMTP id p64csp1277037wmb;
        Fri, 16 Mar 2018 13:36:46 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvQwotqxVX4Tls8P0jOCHsXCKgY1zZHzuWDd7KcsWKQrc+y+anQWkCIOIUaDliPg4tVWlGK
X-Received: by 10.237.50.162 with SMTP id z31mr4737563qtd.146.1521232606287;
        Fri, 16 Mar 2018 13:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232606; cv=none;
        d=google.com; s=arc-20160816;
        b=P77vmtguiSHHCkVP4k4B4fgUgGM6SL0hW/ea5KQiQHi06QdACc+IAE8J3cmXXHO4Uf
         NnCKzrX1+3QCDiyFvqMTnA5YXdiKojVzvZfIjMlDJlvXvu23Pe96M2E/v2E9uWA/4r/R
         6r4CJA26b6EdDXrX2kPkyqlY271tpmebG2DOdBo5R/6VBbexvojxfQWjX+H+PeAjdKS8
         wJK/l4X6kNJ76g7WfD8gVli5nyCMRYSPowLiY+Sd0DQyuCyoNYcHNmFi13lKOEMLshzB
         0/esYtzd0/rXNdpMpst9IibCqsrMA77vurWH6o9hs6VU3dbdHDdcVF+T5rIaJP6Q1frm
         nBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=OGNXl4VayAhHR5JYk6iFNk4XL+Q3jTKYbEqeg9y/9gI=;
        b=WHpXPyS6ZOaShb3mUgnYitxwMobCQJUwUSrHKhYU4P24pWnHYXhk4BezyCYCPNLxsR
         fqMQ7vRNAQRgZwrPq651YU5bMS2luVc1qhEbzHPetNRFf1oSJ16aOMePEuaGV4kZqBSK
         fsmejOFKBb2Nf8hV9d9s406qGw57jLsjyYgY/m0tbHHRGJnMJy1gqBnf2mXp8dyaXmBb
         hnfxgOiVOdop9RBpQWDZ9FZSWGM2f5WvXGvrQQtnCn2quUsfgG1A5deAjvkau1dUraQ8
         86O/X4LXtx4aJK6qUmmHrcMHNMwXiXFlYbKW4uhLe0VcZb6LDTJ4+571odSrFQ42sbMn
         iBfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ounrQ/oy;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Q8hRg/dr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1si1099088qtc.426.2018.03.16.13.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ounrQ/oy;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=Q8hRg/dr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww5l-0000wv-Ig
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:36:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1G-0005iC-Fh
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1E-00038h-ST
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:06 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55554)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1E-000375-JM; Fri, 16 Mar 2018 16:32:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 6A6CC607A2; Fri, 16 Mar 2018 20:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232323;
	bh=XR0w3vuhnIaJKlecQsU8wpBF+97ful+VGDzHZuSfjMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ounrQ/oyDku7lE7GSfozhN3nk1o+zg2RJcZEAWAhQwAuMlXuQWXhx6zCvypu881qo
	Mb/3nhuukWCCsa9rQFL9v3hf5gTd42PJfpjGGcQt+I9KvjATT2szKKc1bQ/69l/80g
	uoArGgqVoE7gFqHRmkpq+crdVOwlqoU2CzCL1wFo=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id DB95360F6E;
	Fri, 16 Mar 2018 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232322;
	bh=XR0w3vuhnIaJKlecQsU8wpBF+97ful+VGDzHZuSfjMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q8hRg/dr8o78IVFOnftPQZYcl8JZAa1EIU8kj291HrSFp+nugyPdtcWSEx5mtQrCw
	BHnyqiIZtby+JarXdDG70nCf7aMOs8tO7oDCjmKC82zY1QT5GEInFg0j3TU8pbWOpx
	ie+UWVnA9kJCfk7v6b/VyZ9cv+4Z/7o/0d34aZd4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB95360F6E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:03 -0400
Message-Id: <1521232280-13089-6-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 05/22] target/arm: Reorganize PMCCNTR read,
 write, sync
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /88mjhIMPrBW

pmccntr_read and pmccntr_write contained duplicate code that was already
being handled by pmccntr_sync. Split pmccntr_sync into pmccntr_op_start
and pmccntr_op_finish, passing the clock value between the two, to avoid
losing time between the two calls.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 101 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 56 insertions(+), 45 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5634561..6480b80 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1000,28 +1000,58 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
 
     return true;
 }
-
-void pmccntr_sync(CPUARMState *env)
+/*
+ * Ensure c15_ccnt is the guest-visible count so that operations such as
+ * enabling/disabling the counter or filtering, modifying the count itself,
+ * etc. can be done logically. This is essentially a no-op if the counter is
+ * not enabled at the time of the call.
+ *
+ * The current cycle count is returned so that it can be passed into the paired
+ * pmccntr_op_finish() call which must follow each call to pmccntr_op_start().
+ */
+uint64_t pmccntr_op_start(CPUARMState *env)
 {
-    uint64_t temp_ticks;
-
-    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+    uint64_t cycles = 0;
+#ifndef CONFIG_USER_ONLY
+    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+#endif
+
+    if (arm_ccnt_enabled(env)) {
 
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        temp_ticks /= 64;
+        uint64_t eff_cycles = cycles;
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            eff_cycles /= 64;
+        }
+
+        env->cp15.c15_ccnt = eff_cycles - env->cp15.c15_ccnt;
     }
+    return cycles;
+}
 
+/*
+ * If enabled, convert c15_ccnt back into the delta between the clock and the
+ * guest-visible count. A call to pmccntr_op_finish should follow every call to
+ * pmccntr_op_start.
+ */
+void pmccntr_op_finish(CPUARMState *env, uint64_t prev_cycles)
+{
     if (arm_ccnt_enabled(env)) {
-        env->cp15.c15_ccnt = temp_ticks - env->cp15.c15_ccnt;
+
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            prev_cycles /= 64;
+        }
+
+        env->cp15.c15_ccnt = prev_cycles - env->cp15.c15_ccnt;
     }
 }
 
 static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    pmccntr_sync(env);
+    uint64_t saved_cycles = pmccntr_op_start(env);
 
     if (value & PMCRC) {
         /* The counter has been reset */
@@ -1032,26 +1062,16 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.c9_pmcr &= ~0x39;
     env->cp15.c9_pmcr |= (value & 0x39);
 
-    pmccntr_sync(env);
+    pmccntr_op_finish(env, saved_cycles);
 }
 
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    uint64_t total_ticks;
-
-    if (!arm_ccnt_enabled(env)) {
-        /* Counter is disabled, do not change value */
-        return env->cp15.c15_ccnt;
-    }
-
-    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        total_ticks /= 64;
-    }
-    return total_ticks - env->cp15.c15_ccnt;
+    uint64_t ret;
+    uint64_t saved_cycles = pmccntr_op_start(env);
+    ret = env->cp15.c15_ccnt;
+    pmccntr_op_finish(env, saved_cycles);
+    return ret;
 }
 
 static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1068,22 +1088,9 @@ static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    uint64_t total_ticks;
-
-    if (!arm_ccnt_enabled(env)) {
-        /* Counter is disabled, set the absolute value */
-        env->cp15.c15_ccnt = value;
-        return;
-    }
-
-    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        total_ticks /= 64;
-    }
-    env->cp15.c15_ccnt = total_ticks - value;
+    uint64_t saved_cycles = pmccntr_op_start(env);
+    env->cp15.c15_ccnt = value;
+    pmccntr_op_finish(env, saved_cycles);
 }
 
 static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1096,7 +1103,11 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #else /* CONFIG_USER_ONLY */
 
-void pmccntr_sync(CPUARMState *env)
+uint64_t pmccntr_op_start(CPUARMState *env)
+{
+}
+
+void pmccntr_op_finish(CPUARMState *env, uint64_t prev_cycles)
 {
 }
 
@@ -1105,9 +1116,9 @@ void pmccntr_sync(CPUARMState *env)
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    pmccntr_sync(env);
+    uint64_t saved_cycles = pmccntr_op_start(env);
     env->cp15.pmccfiltr_el0 = value & 0x7E000000;
-    pmccntr_sync(env);
+    pmccntr_op_finish(env, saved_cycles);
 }
 
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

