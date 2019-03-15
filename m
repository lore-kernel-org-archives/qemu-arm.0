Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp2101360wro;
        Fri, 15 Mar 2019 07:31:02 -0700 (PDT)
X-Received: by 2002:a1c:9e97:: with SMTP id h145mr2310048wme.147.1552660262432;
        Fri, 15 Mar 2019 07:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552660262; cv=none;
        d=google.com; s=arc-20160816;
        b=B+l8zwd+K9hKQpnrJJDFRqczj8Q1lCWrRvBqzmVMyuhndGrkGa4W8GQeHkH0UDoITc
         5fEK00UxZyI/TUHQdBvjsIH3UPOVOq0KzNP9Ymt1y2UEGVL4eAFDYkDazCAdfSqXaCuf
         s/hL4GcoH3IHxRh88N93eK9Sv+I7+IYuFaWC8j07cCFa0p7jtVDGKfos1oCvuG6S5Yzf
         A8SJzL3XLkjP2DoerWihgUYNP7VVPBsac2Qr3fhzpV+A6mpy8XZusW7fNubL/o/sDqYU
         eLcqPtDhTtsgKHvIRMv7gyuVEbxcLOFkHk/q0Qt067YaFfIoXUWAuQ1B7JFvaF2HpriO
         kMgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=6ho3MLrEY52GZurSemfb87U1wKeekmnSipqT122mgfI=;
        b=UjYPSRyzSJdBmyEajF1Ed6qpgRj3XUsqqqwYiDiYM+wQf5qxkt7rezUxRQmP4ntzdW
         2E6YuGeo6X2SceBR5FSaaJ5btWyd+AT5Z2/4N77T6jvngcysLPhkt/tyUd8b6WMYw3wS
         /l2oK24bksuYOTsL1HvG4FndLKwMKPX24PW7OulJsR1mYdpdgsTsz3KmtQHLijKftoVc
         AV8QLRVrKGTexNb6Z2ds4ysa+dE7vjJDH3H/16Ppt3TFSr+XvkHDrYYhX+7PbzGZFhfJ
         Yx+CYKRQNDaQy2AQbuoUMs2e9xwZy/t+VwDQFLPaJSt4xGd7mQzWGBaEMjKydumdI6om
         gX2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m4/ujF8K";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x10sor1605491wmc.25.2019.03.15.07.31.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2019 07:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="m4/ujF8K";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ho3MLrEY52GZurSemfb87U1wKeekmnSipqT122mgfI=;
        b=m4/ujF8KZ7jkaVmIR74MoDAaAzRwzJmBe147FNnT4P/u6g/JLTPUVutehBDnuX6LL0
         4TZhfk9ub2eh0YE8Ur8p8q9GlEZDF+uhC3mIAFpDjua506eB/ULb0a90abYQFbUWzftM
         h2lVh7XP/txLvnUVLxuXJhOHdZnBNYeLju4U8I08+AQnznPvt++8bsv4Zv0842rJSGm9
         kkNAPbECqOJMlO84VA0KUMbkpso9hirIIOXn6H0OXH+g2QRys6QmqSCRKaxxe7sTpUGK
         IZNMH2QzJkFyGKHFNlTMBUB6JcqbBB809ZrTS6+KToIjlU/uYbRrjpMBkXoQSwSu5agX
         SnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ho3MLrEY52GZurSemfb87U1wKeekmnSipqT122mgfI=;
        b=Ox5bVknhUQMWxnfGEIOpxaLQuJ3Z1RYywNOxzYvGocCt97baOSziuzOdgIf+cYl/PV
         L0aqbrqkgn6HMl/+7QPUrWd9aQQ8h32b5o1nM+oJV4u6jjLna1WpCfq9Zqwt7BOKPoeP
         b9tb7aoKAZ//3if7gDgmGAXsYyLLegz7RDZNY+UAEAWYJ5lhR2GXtCZFB7nFB8X2WXTN
         xuVgbOt3KvK6Fd9nOcNkihrR8jtmxJwxPSezfhBQS7uLlP762wuwH9RLmd/fEHDS1hCo
         efu3Zh/HD+NCRGZ5VrJQp1WJhUqVlzLyi1jZodelI0hQE6ue2JHXHwLJrQVPjEu8vhF8
         zTFw==
X-Gm-Message-State: APjAAAUbMpTAx6IgOHnB5HJYCBywTWYU4eQKrhJSv9DwXMlLyQkm2Xn2
	BR7PhHOnhhoBkDotz3EZfonTzNnu
X-Google-Smtp-Source: APXvYqxjUZGH5iAucujuRMvMjzZuPi2L0pC/aAX78A4sxqyfMrRSYgy9q5dzCVChNMhQwzARHILEIQ==
X-Received: by 2002:a1c:9d4c:: with SMTP id g73mr125427wme.48.1552660261933;
        Fri, 15 Mar 2019 07:31:01 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
        by smtp.gmail.com with ESMTPSA id u3sm2051292wrq.86.2019.03.15.07.30.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Mar 2019 07:30:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Dongjiu Geng <gengdongjiu@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH for-4.0?] arm: Allow system registers for KVM guests to be changed by QEMU code
Date: Fri, 15 Mar 2019 14:30:57 +0000
Message-Id: <20190315143057.20165-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8+1W2S+mhsO+

At the moment the Arm implementations of kvm_arch_{get,put}_registers()
don't support having QEMU change the values of system registers
(aka coprocessor registers for AArch32). This is because although
kvm_arch_get_registers() calls write_list_to_cpustate() to
update the CPU state struct fields (so QEMU code can read the
values in the usual way), kvm_arch_put_registers() does not
call write_cpustate_to_list(), meaning that any changes to
the CPU state struct fields will not be passed back to KVM.

The rationale for this design is documented in a comment in the
AArch32 kvm_arch_put_registers() -- writing the values in the
cpregs list into the CPU state struct is "lossy" because the
write of a register might not succeed, and so if we blindly
copy the CPU state values back again we will incorrectly
change register values for the guest. The assumption was that
no QEMU code would need to write to the registers.

However, when we implemented debug support for KVM guests, we
broke that assumption: the code to handle "set the guest up
to take a breakpoint exception" does so by updating various
guest registers including ESR_EL1.

Support this by making kvm_arch_put_registers() synchronize
CPU state back into the list. We sync only those registers
where the initial write succeeds, which should be sufficient.

This commit is the same as commit 823e1b3818f9b10b824ddc which we
had to revert in commit 942f99c825fc94c8b1a4, except that the bug
which was preventing EDK2 guest firmware running has been fixed:
kvm_arm_reset_vcpu() now calls write_list_to_cpustate().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Should we try to put this in for rc1? Not sure... Testing
definitely appreciated.

---
 target/arm/cpu.h     |  9 ++++++++-
 target/arm/helper.c  | 27 +++++++++++++++++++++++++--
 target/arm/kvm.c     |  8 ++++++++
 target/arm/kvm32.c   | 20 ++------------------
 target/arm/kvm64.c   |  2 ++
 target/arm/machine.c |  2 +-
 6 files changed, 46 insertions(+), 22 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5f23c621325..82f40a7ea90 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2559,18 +2559,25 @@ bool write_list_to_cpustate(ARMCPU *cpu);
 /**
  * write_cpustate_to_list:
  * @cpu: ARMCPU
+ * @kvm_sync: true if this is for syncing back to KVM
  *
  * For each register listed in the ARMCPU cpreg_indexes list, write
  * its value from the ARMCPUState structure into the cpreg_values list.
  * This is used to copy info from TCG's working data structures into
  * KVM or for outbound migration.
  *
+ * @kvm_sync is true if we are doing this in order to sync the
+ * register state back to KVM. In this case we will only update
+ * values in the list if the previous list->cpustate sync actually
+ * successfully wrote the CPU state. Otherwise we will keep the value
+ * that is in the list.
+ *
  * Returns: true if all register values were read correctly,
  * false if some register was unknown or could not be read.
  * Note that we do not stop early on failure -- we will attempt
  * reading all registers in the list.
  */
-bool write_cpustate_to_list(ARMCPU *cpu);
+bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 
 #define ARM_CPUID_TI915T      0x54029152
 #define ARM_CPUID_TI925T      0x54029252
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2607d39ad1c..554f111ea89 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -265,7 +265,7 @@ static bool raw_accessors_invalid(const ARMCPRegInfo *ri)
     return true;
 }
 
-bool write_cpustate_to_list(ARMCPU *cpu)
+bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync)
 {
     /* Write the coprocessor state from cpu->env to the (index,value) list. */
     int i;
@@ -274,6 +274,7 @@ bool write_cpustate_to_list(ARMCPU *cpu)
     for (i = 0; i < cpu->cpreg_array_len; i++) {
         uint32_t regidx = kvm_to_cpreg_id(cpu->cpreg_indexes[i]);
         const ARMCPRegInfo *ri;
+        uint64_t newval;
 
         ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
         if (!ri) {
@@ -283,7 +284,29 @@ bool write_cpustate_to_list(ARMCPU *cpu)
         if (ri->type & ARM_CP_NO_RAW) {
             continue;
         }
-        cpu->cpreg_values[i] = read_raw_cp_reg(&cpu->env, ri);
+
+        newval = read_raw_cp_reg(&cpu->env, ri);
+        if (kvm_sync) {
+            /*
+             * Only sync if the previous list->cpustate sync succeeded.
+             * Rather than tracking the success/failure state for every
+             * item in the list, we just recheck "does the raw write we must
+             * have made in write_list_to_cpustate() read back OK" here.
+             */
+            uint64_t oldval = cpu->cpreg_values[i];
+
+            if (oldval == newval) {
+                continue;
+            }
+
+            write_raw_cp_reg(&cpu->env, ri, oldval);
+            if (read_raw_cp_reg(&cpu->env, ri) != oldval) {
+                continue;
+            }
+
+            write_raw_cp_reg(&cpu->env, ri, newval);
+        }
+        cpu->cpreg_values[i] = newval;
     }
     return ok;
 }
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 79a79f01905..59956346126 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -497,6 +497,14 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
         fprintf(stderr, "write_kvmstate_to_list failed\n");
         abort();
     }
+    /*
+     * Sync the reset values also into the CPUState. This is necessary
+     * because the next thing we do will be a kvm_arch_put_registers()
+     * which will update the list values from the CPUState before copying
+     * the list values back to KVM. It's OK to ignore failure returns here
+     * for the same reason we do so in kvm_arch_get_registers().
+     */
+    write_list_to_cpustate(cpu);
 }
 
 /*
diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
index 50327989dcc..327375f6252 100644
--- a/target/arm/kvm32.c
+++ b/target/arm/kvm32.c
@@ -384,24 +384,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
-    /* Note that we do not call write_cpustate_to_list()
-     * here, so we are only writing the tuple list back to
-     * KVM. This is safe because nothing can change the
-     * CPUARMState cp15 fields (in particular gdb accesses cannot)
-     * and so there are no changes to sync. In fact syncing would
-     * be wrong at this point: for a constant register where TCG and
-     * KVM disagree about its value, the preceding write_list_to_cpustate()
-     * would not have had any effect on the CPUARMState value (since the
-     * register is read-only), and a write_cpustate_to_list() here would
-     * then try to write the TCG value back into KVM -- this would either
-     * fail or incorrectly change the value the guest sees.
-     *
-     * If we ever want to allow the user to modify cp15 registers via
-     * the gdb stub, we would need to be more clever here (for instance
-     * tracking the set of registers kvm_arch_get_registers() successfully
-     * managed to update the CPUARMState with, and only allowing those
-     * to be written back up into the kernel).
-     */
+    write_cpustate_to_list(cpu, true);
+
     if (!write_list_to_kvmstate(cpu, level)) {
         return EINVAL;
     }
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 089af9c5f02..e3ba1492482 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -838,6 +838,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
+    write_cpustate_to_list(cpu, true);
+
     if (!write_list_to_kvmstate(cpu, level)) {
         return EINVAL;
     }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index b2925496148..124192bfc26 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -630,7 +630,7 @@ static int cpu_pre_save(void *opaque)
             abort();
         }
     } else {
-        if (!write_cpustate_to_list(cpu)) {
+        if (!write_cpustate_to_list(cpu, false)) {
             /* This should never fail. */
             abort();
         }
-- 
2.20.1
