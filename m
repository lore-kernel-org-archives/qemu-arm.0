Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2978884ejb;
        Tue, 30 Apr 2024 07:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwH8xgLKqH0ji2JZkGweL3L/rYabtTuIax7Oomate91b3CK9LhRrJ770DmZQ0hxrPsm8atoYA9SURGqoPoLydWH3awQ/Mi
X-Google-Smtp-Source: AGHT+IFaN045b8qlY22EgPuF9JX6uONNAZ+uj9dlf9lS6bEjcCQ/l/eWEp0jcz1qRoJLAlh+F6QJ
X-Received: by 2002:a05:6808:4289:b0:3c8:64cb:2f70 with SMTP id dq9-20020a056808428900b003c864cb2f70mr8813819oib.34.1714485742263;
        Tue, 30 Apr 2024 07:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485742; cv=none;
        d=google.com; s=arc-20160816;
        b=QUb5ZuBcwt4iMcMy/HYMDENE/2FeGnffrIDWZjkYxNAo99E4mYmAjbB3ESdPJAgPz/
         gcK0YEoaDXGUrbfWyXRHGAq45di+EG+K8eozzjF6cNS00zy9ZE5UUx13syuejo9m9/OR
         QzpQfVr6bzpuvKBEt6hm7po6Piu84QisCaqJkl4cgbIZOifg6ufLRaAI4HO3rbHETXs5
         N5WT1TxdO/NsOfLsXJrlklzF9aTyftWqxX20Uc7tadCuCv/7XmJzxOiL7vc4PZUjZfY2
         fecqH5rDrccLdkAp+Hz6EjcTIkWAq3zetFy+uUriXS9BNbZeCfdaml9OoPP9mOT2bPTv
         H/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xJf8wNVMGR0MP4vhP++ZGvQJmrzt6ceEedWUAcLKAGY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=UtxWrkJeOSDQBCJf+A+d8cdo+euaJkQWE+zXqm2zmH0bWTA87sDUfYPxWAWYo9nbRf
         CUYvhOXurjBehfkOzC47SprVB7ZYfYCyXe278nd7v0GVGyU3myPqpMTZWyQbByS+5oo1
         F5jV8qkkox1W5rSHoI1NCZI5SV50XMCNCgGlOkVB7nrUZq/SSMUWgX7DrUHg+Em8NNTZ
         9uL1Azvy7HT1yJbTNvTeIMB/m+cOsD7idbmu6947IRVsLOkhFPEHjtg5PRpSSQqK6a4e
         nAhfqp0FgGxm+biWVmyaEQS+ZMKGV7h0snz/hGJ4gCpy97cudzcidg8Lv6Md8ZoM2O/Z
         YoKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xnASAZ1P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a056102104900b0047ba034b10fsi4441096vsq.351.2024.04.30.07.02.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 07:02:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xnASAZ1P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1o2e-0002ci-1f; Tue, 30 Apr 2024 10:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1o2K-0002X3-Qp
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:00:51 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1o2H-0002tT-KI
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:00:47 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2def8e58471so90595471fa.0
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714485643; x=1715090443; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xJf8wNVMGR0MP4vhP++ZGvQJmrzt6ceEedWUAcLKAGY=;
 b=xnASAZ1PA05FAMPPNF3y9NJgjOmeJBz2pwPFWI39n2Ock9mVKCaDdXBXhLKEuoVLX1
 fvRDJBYS8+ad1FZGQ2DM3rpdmWLgliBYaIz4OAwkDZPxGknBbM/K6yrsTJbvJoWNelzr
 vmfC3+YEEAr7U2kj6PocgKoWouYBc1+xsr37Wj+Sk2tirpMOk6u0nh4Ib7V6ynulW/Y3
 +h6ysRL4Wg2k7mPo2u2DCj1optrQt9qRvYpSnLAgfI0VPbdyX/6/8q4IiC4U6EHcov1g
 K45WZWILQ+1SmyRxCSi5a8fF3F2rJHH4262LmbRCVrghUMyJ67Eqe+YQPRO6hcvV04RA
 Pflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714485643; x=1715090443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJf8wNVMGR0MP4vhP++ZGvQJmrzt6ceEedWUAcLKAGY=;
 b=R5nxQHkT+hqDXP+BG7oTT4QRDLkFJsLxnS9g+lVu/0ioV4EB1bbFUKBp1/SHTpAnvD
 7jEpnZTB98lXOlxa+96rZg2ejZL9x40mhSO/pS1/95A9Gx2PQG8s9YXdDujnyqbfx9Xp
 Ld7W6QoiVTwi/7EuJDjhV6yie5wnUe/sLPsXOAjmDmQaO5AQrbbk7/dn5frzHs7ZCkra
 yIVkiV3ZuXFzi1C+h2Q4jTsDPSjtTW48TwnmS9BWEczStGaML2555TchwsdcM3lpnWIi
 IJqHT/uqu8gEl6p24PyajSUfq4Q3MBcEv1JBfyNGLAxmNDGUHpepgeZ1TGcc9cQFhEv9
 igUg==
X-Gm-Message-State: AOJu0YzWE1WMkTPbFHWCqM/n640kvK1EjqTmqJEubt5Rma+esG9jqI+p
 looU+fYolGNNgvzyZQDiVAC/9kxlPrkTHVK6TPIUmva2HqEVEOrh2NyAVFgC2yPXyISNGY2VMEh
 c
X-Received: by 2002:a2e:2a06:0:b0:2e0:c363:f9dc with SMTP id
 q6-20020a2e2a06000000b002e0c363f9dcmr3196323ljq.40.1714485642898; 
 Tue, 30 Apr 2024 07:00:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b0041bfa349cadsm11062705wmo.16.2024.04.30.07.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 07:00:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Implement FEAT WFxT and enable for '-cpu max'
Date: Tue, 30 Apr 2024 15:00:35 +0100
Message-Id: <20240430140035.3889879-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430140035.3889879-1-peter.maydell@linaro.org>
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lLyBAs7onXVU

FEAT_WFxT introduces new instructions WFIT and WFET, which are like
the existing WFI and WFE but allow the guest to pass a timeout value
in a register.  The instructions will wait for an interrupt/event as
usual, but will also stop waiting when the value of CNTVCT_EL0 is
greater than or equal to the specified timeout value.

We implement WFIT by setting up a timer to expire at the right
point; when the timer expires it sets the EXITTB interrupt, which
will cause the CPU to leave the halted state. If we come out of
halt for some other reason, we unset the pending timer.

We implement WFET as a nop, which is architecturally permitted and
matches the way we currently make WFE a nop.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst  |  1 +
 target/arm/cpu-features.h      |  5 ++++
 target/arm/cpu.h               |  3 ++
 target/arm/helper.h            |  1 +
 target/arm/internals.h         |  8 +++++
 target/arm/tcg/a64.decode      |  4 +++
 target/arm/cpu.c               | 38 ++++++++++++++++++++++++
 target/arm/helper.c            |  4 +--
 target/arm/machine.c           | 20 +++++++++++++
 target/arm/tcg/cpu64.c         |  1 +
 target/arm/tcg/op_helper.c     | 54 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c | 41 ++++++++++++++++++++++++++
 12 files changed, 178 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index a9ae7ede9fc..d283c985d14 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -108,6 +108,7 @@ the following architecture extensions:
 - FEAT_UAO (Unprivileged Access Override control)
 - FEAT_VHE (Virtualization Host Extensions)
 - FEAT_VMID16 (16-bit VMID)
+- FEAT_WFxT (WFE and WFI instructions with timeout)
 - FEAT_XNX (Translation table stage 2 Unprivileged Execute-never)
 - SVE (The Scalable Vector Extension)
 - SVE2 (The Scalable Vector Extension v2)
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index b300d0446d8..c59ca104fe1 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -571,6 +571,11 @@ static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
 }
 
+static inline bool isar_feature_aa64_wfxt(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, WFXT) >= 2;
+}
+
 static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, BC) != 0;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 97997dbd087..e8e6024fe30 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -868,6 +868,9 @@ struct ArchCPU {
      * pmu_op_finish() - it does not need other handling during migration
      */
     QEMUTimer *pmu_timer;
+    /* Timer used for WFxT timeouts */
+    QEMUTimer *wfxt_timer;
+
     /* GPIO outputs for generic timer */
     qemu_irq gt_timer_outputs[NUM_GTIMERS];
     /* GPIO output for GICv3 maintenance interrupt signal */
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 2b027333053..a85de78c8fc 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -53,6 +53,7 @@ DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
+DEF_HELPER_2(wfit, void, env, i64)
 DEF_HELPER_1(yield, void, env)
 DEF_HELPER_1(pre_hvc, void, env)
 DEF_HELPER_2(pre_smc, void, env, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index b53f5e8ff2a..bd32883890d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1760,4 +1760,12 @@ bool check_watchpoint_in_range(int i, target_ulong addr);
 CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr);
 int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type);
 int delete_hw_watchpoint(target_ulong addr, target_ulong len, int type);
+
+/* Return the current value of the system counter in ticks */
+uint64_t gt_get_countervalue(CPUARMState *env);
+/*
+ * Return the currently applicable offset between the system counter
+ * and CNTVCT_EL0 (this will be either 0 or the value of CNTVOFF_EL2).
+ */
+uint64_t gt_virt_cnt_offset(CPUARMState *env);
 #endif
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 0e7656fd158..7aea5cba5ea 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -183,6 +183,10 @@ ERETA           1101011 0100 11111 00001 m:1 11111 11111 &reta  # ERETAA, ERETAB
   NOP           1101 0101 0000 0011 0010 ---- --- 11111
 }
 
+# System instructions with register argument
+WFET            1101 0101 0000 0011 0001 0000 000 rd:5
+WFIT            1101 0101 0000 0011 0001 0000 001 rd:5
+
 # Barriers
 
 CLREX           1101 0101 0000 0011 0011 ---- 010 11111
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a152def2413..006092a6b12 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1132,6 +1132,33 @@ static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
     return arm_cpu_data_is_big_endian(env);
 }
 
+static bool arm_cpu_exec_halt(CPUState *cs)
+{
+    bool leave_halt = cpu_has_work(cs);
+
+    if (leave_halt) {
+        /* We're about to come out of WFI/WFE: disable the WFxT timer */
+        ARMCPU *cpu = ARM_CPU(cs);
+        if (cpu->wfxt_timer) {
+            timer_del(cpu->wfxt_timer);
+        }
+    }
+    return leave_halt;
+}
+
+static void arm_wfxt_timer_cb(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUState *cs = CPU(cpu);
+
+    /*
+     * We expect the CPU to be halted; this will cause arm_cpu_is_work()
+     * to return true (so we will come out of halt even with no other
+     * pending interrupt), and the TCG accelerator's cpu_exec_interrupt()
+     * function auto-clears the CPU_INTERRUPT_EXITTB flag for us.
+     */
+    cpu_interrupt(cs, CPU_INTERRUPT_EXITTB);
+}
 #endif
 
 static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
@@ -1874,6 +1901,9 @@ static void arm_cpu_finalizefn(Object *obj)
     if (cpu->pmu_timer) {
         timer_free(cpu->pmu_timer);
     }
+    if (cpu->wfxt_timer) {
+        timer_free(cpu->wfxt_timer);
+    }
 #endif
 }
 
@@ -2357,6 +2387,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 #endif
     }
 
+#ifndef CONFIG_USER_ONLY
+    if (tcg_enabled() && cpu_isar_feature(aa64_wfxt, cpu)) {
+        cpu->wfxt_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                       arm_wfxt_timer_cb, cpu);
+    }
+#endif
+
     if (tcg_enabled()) {
         /*
          * Don't report some architectural features in the ID registers
@@ -2611,6 +2648,7 @@ static const TCGCPUOps arm_tcg_ops = {
 #else
     .tlb_fill = arm_cpu_tlb_fill,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
+    .cpu_exec_halt = arm_cpu_exec_halt,
     .do_interrupt = arm_cpu_do_interrupt,
     .do_transaction_failed = arm_cpu_do_transaction_failed,
     .do_unaligned_access = arm_cpu_do_unaligned_access,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6b224826fbb..f7bb2d6ba8a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2658,7 +2658,7 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
     }
 }
 
-static uint64_t gt_get_countervalue(CPUARMState *env)
+uint64_t gt_get_countervalue(CPUARMState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
 
@@ -2793,7 +2793,7 @@ static uint64_t gt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return gt_get_countervalue(env) - gt_phys_cnt_offset(env);
 }
 
-static uint64_t gt_virt_cnt_offset(CPUARMState *env)
+uint64_t gt_virt_cnt_offset(CPUARMState *env)
 {
     uint64_t hcr;
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index b2b39b24755..0a722ca7e75 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -242,6 +242,25 @@ static const VMStateDescription vmstate_irq_line_state = {
     }
 };
 
+static bool wfxt_timer_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    /* We'll only have the timer object if FEAT_WFxT is implemented */
+    return cpu->wfxt_timer;
+}
+
+static const VMStateDescription vmstate_wfxt_timer = {
+    .name = "cpu/wfxt-timer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = wfxt_timer_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_TIMER_PTR(wfxt_timer, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool m_needed(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -957,6 +976,7 @@ const VMStateDescription vmstate_arm_cpu = {
 #endif
         &vmstate_serror,
         &vmstate_irq_line_state,
+        &vmstate_wfxt_timer,
         NULL
     }
 };
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 62c4663512b..47ea51d3aa5 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1150,6 +1150,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = cpu->isar.id_aa64isar2;
     t = FIELD_DP64(t, ID_AA64ISAR2, MOPS, 1);     /* FEAT_MOPS */
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);      /* FEAT_HBC */
+    t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     cpu->isar.id_aa64isar2 = t;
 
     t = cpu->isar.id_aa64pfr0;
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index c199b69fbff..c083e5cfb87 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -409,6 +409,60 @@ void HELPER(wfi)(CPUARMState *env, uint32_t insn_len)
 #endif
 }
 
+void HELPER(wfit)(CPUARMState *env, uint64_t timeout)
+{
+#ifdef CONFIG_USER_ONLY
+    /*
+     * WFI in the user-mode emulator is technically permitted but not
+     * something any real-world code would do. AArch64 Linux kernels
+     * trap it via SCTRL_EL1.nTWI and make it an (expensive) NOP;
+     * AArch32 kernels don't trap it so it will delay a bit.
+     * For QEMU, make it NOP here, because trying to raise EXCP_HLT
+     * would trigger an abort.
+     */
+    return;
+#else
+    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
+    int target_el = check_wfx_trap(env, false);
+    /* The WFIT should time out when CNTVCT_EL0 >= the specified value. */
+    uint64_t cntval = gt_get_countervalue(env);
+    uint64_t offset = gt_virt_cnt_offset(env);
+    uint64_t cntvct = cntval - offset;
+    uint64_t nexttick;
+
+    if (cpu_has_work(cs) || cntvct >= timeout) {
+        /*
+         * Don't bother to go into our "low power state" if
+         * we would just wake up immediately.
+         */
+        return;
+    }
+
+    if (target_el) {
+        env->pc -= 4;
+        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0, false),
+                        target_el);
+    }
+
+    if (uadd64_overflow(timeout, offset, &nexttick)) {
+        nexttick = UINT64_MAX;
+    }
+    if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
+        /*
+         * If the timeout is too long for the signed 64-bit range
+         * of a QEMUTimer, let it expire early.
+         */
+        timer_mod_ns(cpu->wfxt_timer, INT64_MAX);
+    } else {
+        timer_mod(cpu->wfxt_timer, nexttick);
+    }
+    cs->exception_index = EXCP_HLT;
+    cs->halted = 1;
+    cpu_loop_exit(cs);
+#endif
+}
+
 void HELPER(wfe)(CPUARMState *env)
 {
     /* This is a hint instruction that is semantically different
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 976094a5c80..591be43279c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1690,6 +1690,47 @@ static bool trans_WFE(DisasContext *s, arg_WFI *a)
     return true;
 }
 
+static bool trans_WFIT(DisasContext *s, arg_WFIT *a)
+{
+    if (!dc_isar_feature(aa64_wfxt, s)) {
+        return false;
+    }
+
+    /*
+     * Because we need to pass the register value to the helper,
+     * it's easier to emit the code now, unlike trans_WFI which
+     * defers it to aarch64_tr_tb_stop(). That means we need to
+     * check ss_active so that single-stepping a WFIT doesn't halt.
+     */
+    if (s->ss_active) {
+        /* Act like a NOP under architectural singlestep */
+        return true;
+    }
+
+    gen_a64_update_pc(s, 4);
+    gen_helper_wfit(tcg_env, cpu_reg(s, a->rd));
+    /* Go back to the main loop to check for interrupts */
+    s->base.is_jmp = DISAS_EXIT;
+    return true;
+}
+
+static bool trans_WFET(DisasContext *s, arg_WFET *a)
+{
+    if (!dc_isar_feature(aa64_wfxt, s)) {
+        return false;
+    }
+
+    /*
+     * We rely here on our WFE implementation being a NOP, so we
+     * don't need to do anything different to handle the WFET timeout
+     * from what trans_WFE does.
+     */
+    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
+        s->base.is_jmp = DISAS_WFE;
+    }
+    return true;
+}
+
 static bool trans_XPACLRI(DisasContext *s, arg_XPACLRI *a)
 {
     if (s->pauth_active) {
-- 
2.34.1

