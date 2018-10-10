Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1479049wrt;
        Wed, 10 Oct 2018 13:39:10 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63fHxV/L1VuthQGgO2J1DwtaiKh2HBt4W/s7n+c7E2FsldvdpIWE7uMI0ybSG1aF6uRlQ9F
X-Received: by 2002:a37:d9c8:: with SMTP id q69-v6mr28250542qkl.84.1539203950388;
        Wed, 10 Oct 2018 13:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539203950; cv=none;
        d=google.com; s=arc-20160816;
        b=zJo0lc+RB/xNic6kzGI53Cjnb/JicPyAslti43h06OB8yF5SPt4d2j+m19N4CtJf3f
         yXPyAqaDxEtIn9sECDV9SwMoAOESxaof9vNXllS7zab9YY4oC6eMgbUiA22ctXffPZJ5
         HE8/e6M8rpT+Mbz/qzUYWZt518cgaxqjNeI8F+WZ98WWfoEZCi8qD0mMdoR5bt5iNEqf
         NDOZzWTP1PjzuQG1zW1k9y5Sx+0I5tZdoi3Z10XmrckoRgh9gbDuXQlJWhWwlD6v38aF
         vLlThzlFiuQVFuFvXnFaaWzlhQyghcgZl9P+e6fijho0gI1Csqd19y+hgxLCj8CnnEZl
         hzbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=8o7r+L784EqpSUAfBfXajjBjgRbCBKlWPESSLsmMw6E=;
        b=JJ18PZtDEqafBKfhN/s2Bs036rg7avBYrMNwqjsQ/OF/CZ0kX5j/jKQIwqEISSAKAl
         yPTafBkkonqs7f0GW0Il51nGa8npVFlufv5c0RgPh2kkEbE/XASYVhekJzCWlaEV8Vm+
         TJNIkHzEBGLKq6YF2fZgLJZHHIBxSY/AMTRkzPFTeBnoBV3L75/kRM8fwXGuVVMT2drJ
         Pw4LP7tS4QP9hCSYoVh/Lwn1n08PMB9fpHujcWP+TV6oqqpW0tYATs0X28jfHhmn3RXh
         ZwSo9TdGzZPLcCYP1z4jFHvxZmK4wkdOG11UcRSUqiHP7E95QouOnGm546O1M2TD7gay
         RK8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jmllguFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q64-v6si1009124qkd.145.2018.10.10.13.39.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jmllguFn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALG9-0003Cu-UB
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:39:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFZ-0002ou-5r
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFW-0002QE-Ee
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:33 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:41875)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFW-0002Ot-4x; Wed, 10 Oct 2018 16:38:30 -0400
Received: by mail-yb1-xb44.google.com with SMTP id e16-v6so2754190ybk.8;
	Wed, 10 Oct 2018 13:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8o7r+L784EqpSUAfBfXajjBjgRbCBKlWPESSLsmMw6E=;
	b=jmllguFnOtbM8pU8ePiSF10VTY3gv7WhbbgpT+NTcI34pMGoyEIHzDtMHuWA9h4Lzk
	HDWykrdZ5xUjRXdJPKYSsi+J+sDusJQxx7hK9IVcXTlf5Upxw+hwB631V8iRvvFqGww3
	6+fyfIbxOISLmQxyAJvKJUnmjgJLXI1/Cu2VkcJJu39z1jQA5/8EaAD5u61ytYtM1SNC
	KqGDQ+arzN5msi5I7X6sx4ROuDecXe7tW3tiCx95GBJjSAx50OHpLP25Bkr3GZK8ChJR
	Ye57JJ3Z+ul2UQYAkPx6ffRZOwFfVJsM/x+pZ7JfUY2H1yiorywjVNFJDCvnXwQA0aUl
	QQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8o7r+L784EqpSUAfBfXajjBjgRbCBKlWPESSLsmMw6E=;
	b=Fkkk8sxIzk8Wi2jBNuqHyCI5k/mNXaGDUy0158YakD0i+VlPUp319vK1E1mqj2ERFe
	O2y9A2dJgRy2STmKWXHfNh9JzQKwHrL/odVEStK2a/88OSzatHsIyvDpfQsy5nlV8NGe
	24tjKc+Ms461eCUI+NV6Ey3l+qBnggc1TWXhtfWJlqLW3Lc7jEikcEzBhJZu/FxpvCx5
	zAXNMJnIsOR7ACEmMK0Sa/Brsts/yy6EQrWBZSf3W2C+OHhk8YswBn9n8kEw4CWIWYSp
	P7/GHFAqeweLMmJzi5YOXcqjT6xao+eWqNHPkD/kqFRvuCPzve8kHTvzcKuuAQaluqAF
	g4Rw==
X-Gm-Message-State: ABuFfohgLNwNfwPbObd3gHU3rKTHCREansthtRdbgmsm6/ImE4NMYSii
	Xfh0wHInbW0/9HRrS4QbWdiLJ3l9
X-Received: by 2002:a25:5c07:: with SMTP id
	q7-v6mr19811203ybb.254.1539203907921; 
	Wed, 10 Oct 2018 13:38:27 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:27 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:26 -0400
Message-Id: <20181010203735.27918-6-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b44
Subject: [Qemu-arm] [PATCH v6 05/14] target/arm: Reorganize PMCCNTR accesses
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P95NwtdNpnOi

pmccntr_read and pmccntr_write contained duplicate code that was already
being handled by pmccntr_sync. Consolidate the duplicated code into two
functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
c15_ccnt in CPUARMState so that we can simultaneously save both the
architectural register value and the last underlying cycle count - this
ensures time isn't lost and will also allow us to access the 'old'
architectural register value in order to detect overflows in later
patches.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.h     | 26 ++++++++----
 target/arm/helper.c  | 96 +++++++++++++++++++++++---------------------
 target/arm/machine.c |  8 ++--
 3 files changed, 73 insertions(+), 57 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3a2aff1192..fdf672ca22 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -468,10 +468,20 @@ typedef struct CPUARMState {
         uint64_t oslsr_el1; /* OS Lock Status */
         uint64_t mdcr_el2;
         uint64_t mdcr_el3;
-        /* If the counter is enabled, this stores the last time the counter
-         * was reset. Otherwise it stores the counter value
+        /* Stores the architectural value of the counter *the last time it was
+         * updated* by pmccntr_op_start. Accesses should always be surrounded
+         * by pmccntr_op_start/pmccntr_op_finish to guarantee the latest
+         * architecturally-correct value is being read/set.
          */
         uint64_t c15_ccnt;
+        /* Stores the delta between the architectural value and the underlying
+         * cycle count during normal operation. It is used to update c15_ccnt
+         * to be the correct architectural value before accesses. During
+         * accesses, c15_ccnt_delta contains the underlying count being used
+         * for the access, after which it reverts to the delta value in
+         * pmccntr_op_finish.
+         */
+        uint64_t c15_ccnt_delta;
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
@@ -937,15 +947,15 @@ int cpu_arm_signal_handler(int host_signum, void *pinfo,
                            void *puc);
 
 /**
- * pmccntr_sync
+ * pmccntr_op_start/finish
  * @env: CPUARMState
  *
- * Synchronises the counter in the PMCCNTR. This must always be called twice,
- * once before any action that might affect the timer and again afterwards.
- * The function is used to swap the state of the register if required.
- * This only happens when not in user mode (!CONFIG_USER_ONLY)
+ * Convert the counter in the PMCCNTR between its delta form (the typical mode
+ * when it's enabled) and the guest-visible value. These two calls must always
+ * surround any action which might affect the counter.
  */
-void pmccntr_sync(CPUARMState *env);
+void pmccntr_op_start(CPUARMState *env);
+void pmccntr_op_finish(CPUARMState *env);
 
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 12c53e54e9..91e4e4170b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1052,28 +1052,53 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
 
     return true;
 }
-
-void pmccntr_sync(CPUARMState *env)
+/*
+ * Ensure c15_ccnt is the guest-visible count so that operations such as
+ * enabling/disabling the counter or filtering, modifying the count itself,
+ * etc. can be done logically. This is essentially a no-op if the counter is
+ * not enabled at the time of the call.
+ */
+void pmccntr_op_start(CPUARMState *env)
 {
-    uint64_t temp_ticks;
-
-    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+    uint64_t cycles = 0;
+    cycles = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
 
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        temp_ticks /= 64;
+    if (arm_ccnt_enabled(env)) {
+        uint64_t eff_cycles = cycles;
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            eff_cycles /= 64;
+        }
+
+        env->cp15.c15_ccnt = eff_cycles - env->cp15.c15_ccnt_delta;
     }
+    env->cp15.c15_ccnt_delta = cycles;
+}
 
+/*
+ * If PMCCNTR is enabled, recalculate the delta between the clock and the
+ * guest-visible count. A call to pmccntr_op_finish should follow every call to
+ * pmccntr_op_start.
+ */
+void pmccntr_op_finish(CPUARMState *env)
+{
     if (arm_ccnt_enabled(env)) {
-        env->cp15.c15_ccnt = temp_ticks - env->cp15.c15_ccnt;
+        uint64_t prev_cycles = env->cp15.c15_ccnt_delta;
+
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            prev_cycles /= 64;
+        }
+
+        env->cp15.c15_ccnt_delta = prev_cycles - env->cp15.c15_ccnt;
     }
 }
 
 static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    pmccntr_sync(env);
+    pmccntr_op_start(env);
 
     if (value & PMCRC) {
         /* The counter has been reset */
@@ -1084,26 +1109,16 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.c9_pmcr &= ~0x39;
     env->cp15.c9_pmcr |= (value & 0x39);
 
-    pmccntr_sync(env);
+    pmccntr_op_finish(env);
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
+    pmccntr_op_start(env);
+    ret = env->cp15.c15_ccnt;
+    pmccntr_op_finish(env);
+    return ret;
 }
 
 static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1120,22 +1135,9 @@ static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
+    pmccntr_op_start(env);
+    env->cp15.c15_ccnt = value;
+    pmccntr_op_finish(env);
 }
 
 static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1148,7 +1150,11 @@ static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #else /* CONFIG_USER_ONLY */
 
-void pmccntr_sync(CPUARMState *env)
+void pmccntr_op_start(CPUARMState *env)
+{
+}
+
+void pmccntr_op_finish(CPUARMState *env)
 {
 }
 
@@ -1157,9 +1163,9 @@ void pmccntr_sync(CPUARMState *env)
 static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
-    pmccntr_sync(env);
+    pmccntr_op_start(env);
     env->cp15.pmccfiltr_el0 = value & 0xfc000000;
-    pmccntr_sync(env);
+    pmccntr_op_finish(env);
 }
 
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 8139b25be5..581c44cf08 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -584,7 +584,7 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    pmccntr_sync(&cpu->env);
+    pmccntr_op_start(&cpu->env);
 
     if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
@@ -610,13 +610,13 @@ static int cpu_pre_save(void *opaque)
 static void cpu_post_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
-    pmccntr_sync(&cpu->env);
+    pmccntr_op_finish(&cpu->env);
 }
 
 static int cpu_pre_load(void *opaque)
 {
     ARMCPU *cpu = opaque;
-    pmccntr_sync(&cpu->env);
+    pmccntr_op_start(&cpu->env);
     return 0;
 }
 
@@ -667,7 +667,7 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
-    pmccntr_sync(&cpu->env);
+    pmccntr_op_finish(&cpu->env);
 
     return 0;
 }
-- 
2.19.1

