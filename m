Received: by 10.223.172.38 with SMTP id v35csp3223272wrc;
        Fri, 22 Sep 2017 08:13:43 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAAKYldqcFCvagXuWugkipVZp4jVcdyRjS/2sWxHtdSP7DJOpaSX2vCfjw7qjvg9xWXTLsW
X-Received: by 10.55.164.67 with SMTP id n64mr8272270qke.328.1506093223276;
        Fri, 22 Sep 2017 08:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506093223; cv=none;
        d=google.com; s=arc-20160816;
        b=SjrunXFS20tpOZQJgKj1JMlW6hp1x5/Uzv2hDWhhOCOOs64Mg3H2VIw+jJlObb9Kr8
         uhAsDIsIQAUdBdNigTZyOhggcaByUOc9biN0FfXrm5NFgDe1IwV/8L9kDZ3KU9qPVe4X
         JGi9Zk4x4ILPPWoiOG6KUr0iTy52KG5b14KbJJjcXOrDl2d/PU3cU9c5K0kBrWrQBG0U
         CXDGZ8fTSvmromHjt4To2FwIk6AbsKIdIfjL6IIpUKSIagevYDQA6H7ezyPo3p/lmp+j
         sChT/dSTLzc+jQ5E/et4lcu/XKFkHTIiK5HYwNTavmQbBQHOaSpGzrLeRF/u9aRK7IWj
         6a5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=iw4WQTW2yjc9Fux9OS7jGMwL2ZR6nxnzwpVq3EQY5ZM=;
        b=SXbCOI4Kzrer4f8HNGd3Oi2khJ45+2MuMqBFxmWwI6qaRwWGceqbCwas7izT6nKPYC
         P82DC4rTHqLo8sdCukgGS5fsHHAdFiQrBolJIW7vH1RsGbvBTsXEKq/5FdIgI0jNgEdu
         kNqw/VLZvYnBILN9RubsC67/iqbXvxCGyaMD2VzgOfhojsDB+Gv82YFtDxNjir9y2B0z
         atafu0Uy66rbWWGHzZwNIHerSz44LKmziWi9dijjSsY+MPI0Ge8zAWi6xQJp+f/AYu/g
         +hpaVislj0bzqtRHFrZCLFPCgewn5x5fjcfoEB1nFkdluMnFOXTmRHKy2tYnGw3uZlVt
         VddQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r65si42322qtd.276.2017.09.22.08.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPe8-0003WJ-W7
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:13:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQd-00082G-7s
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQb-0004Ar-8O
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37574)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQa-00049B-RU; Fri, 22 Sep 2017 10:59:41 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQZ-0007EA-Ju; Fri, 22 Sep 2017 15:59:39 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 16:00:01 +0100
Message-Id: <1506092407-26985-15-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 14/20] target/arm: Implement security attribute
 lookups for memory accesses
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
X-TUID: 86w3xhPnng24

Implement the security attribute lookups for memory accesses
in the get_phys_addr() functions, causing these to generate
various kinds of SecureFault for bad accesses.

The major subtlety in this code relates to handling of the
case when the security attributes the SAU assigns to the
address don't match the current security state of the CPU.

In the ARM ARM pseudocode for validating instruction
accesses, the security attributes of the address determine
whether the Secure or NonSecure MPU state is used. At face
value, handling this would require us to encode the relevant
bits of state into mmu_idx for both S and NS at once, which
would result in our needing 16 mmu indexes. Fortunately we
don't actually need to do this because a mismatch between
address attributes and CPU state means either:
 * some kind of fault (usually a SecureFault, but in theory
   perhaps a UserFault for unaligned access to Device memory)
 * execution of the SG instruction in NS state from a
   Secure & NonSecure code region

The purpose of SG is simply to flip the CPU into Secure
state, so we can handle it by emulating execution of that
instruction directly in arm_v7m_cpu_do_interrupt(), which
means we can treat all the mismatch cases as "throw an
exception" and we don't need to encode the state of the
other MPU bank into our mmu_idx values.

This commit doesn't include the actual emulation of SG;
it also doesn't include implementation of the IDAU, which
is a per-board way to specify hard-coded memory attributes
for addresses, which override the CPU-internal SAU if they
specify a more secure setting than the SAU is programmed to.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  15 ++++
 target/arm/helper.c    | 182 ++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 195 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 18be370..fd9a7e8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -71,6 +71,21 @@ FIELD(V7M_EXCRET, DCRS, 5, 1)
 FIELD(V7M_EXCRET, S, 6, 1)
 FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-be-1 prefix */
 
+/* We use a few fake FSR values for internal purposes in M profile.
+ * M profile cores don't have A/R format FSRs, but currently our
+ * get_phys_addr() code assumes A/R profile and reports failures via
+ * an A/R format FSR value. We then translate that into the proper
+ * M profile exception and FSR status bit in arm_v7m_cpu_do_interrupt().
+ * Mostly the FSR values we use for this are those defined for v7PMSA,
+ * since we share some of that codepath. A few kinds of fault are
+ * only for M profile and have no A/R equivalent, though, so we have
+ * to pick a value from the reserved range (which we never otherwise
+ * generate) to use for these.
+ * These values will never be visible to the guest.
+ */
+#define M_FAKE_FSR_NSC_EXEC 0xf /* NS executing in S&NSC memory */
+#define M_FAKE_FSR_SFAULT 0xe /* SecureFault INVTRAN, INVEP or AUVIOL */
+
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
  * Note that this mapping and the AArch32 mapping defined in bank_number()
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7511566..b1ecb66 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -31,6 +31,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
                                target_ulong *page_size_ptr, uint32_t *fsr,
                                ARMMMUFaultInfo *fi);
 
+/* Security attributes for an address, as returned by v8m_security_lookup. */
+typedef struct V8M_SAttributes {
+    bool ns;
+    bool nsc;
+    uint8_t sregion;
+    bool srvalid;
+    uint8_t iregion;
+    bool irvalid;
+} V8M_SAttributes;
+
 /* Definitions for the PMCCNTR and PMCR registers */
 #define PMCRD   0x8
 #define PMCRC   0x4
@@ -6748,6 +6758,46 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
          * raises the fault, in the A profile short-descriptor format.
          */
         switch (env->exception.fsr & 0xf) {
+        case M_FAKE_FSR_NSC_EXEC:
+            /* Exception generated when we try to execute code at an address
+             * which is marked as Secure & Non-Secure Callable and the CPU
+             * is in the Non-Secure state. The only instruction which can
+             * be executed like this is SG (and that only if both halves of
+             * the SG instruction have the same security attributes.)
+             * Everything else must generate an INVEP SecureFault, so we
+             * emulate the SG instruction here.
+             * TODO: actually emulate SG.
+             */
+            env->v7m.sfsr |= R_V7M_SFSR_INVEP_MASK;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+            qemu_log_mask(CPU_LOG_INT,
+                          "...really SecureFault with SFSR.INVEP\n");
+            break;
+        case M_FAKE_FSR_SFAULT:
+            /* Various flavours of SecureFault for attempts to execute or
+             * access data in the wrong security state.
+             */
+            switch (cs->exception_index) {
+            case EXCP_PREFETCH_ABORT:
+                if (env->v7m.secure) {
+                    env->v7m.sfsr |= R_V7M_SFSR_INVTRAN_MASK;
+                    qemu_log_mask(CPU_LOG_INT,
+                                  "...really SecureFault with SFSR.INVTRAN\n");
+                } else {
+                    env->v7m.sfsr |= R_V7M_SFSR_INVEP_MASK;
+                    qemu_log_mask(CPU_LOG_INT,
+                                  "...really SecureFault with SFSR.INVEP\n");
+                }
+                break;
+            case EXCP_DATA_ABORT:
+                /* This must be an NS access to S memory */
+                env->v7m.sfsr |= R_V7M_SFSR_AUVIOL_MASK;
+                qemu_log_mask(CPU_LOG_INT,
+                              "...really SecureFault with SFSR.AUVIOL\n");
+                break;
+            }
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+            break;
         case 0x8: /* External Abort */
             switch (cs->exception_index) {
             case EXCP_PREFETCH_ABORT:
@@ -8834,9 +8884,89 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     return !(*prot & (1 << access_type));
 }
 
+static bool v8m_is_sau_exempt(CPUARMState *env,
+                              uint32_t address, MMUAccessType access_type)
+{
+    /* The architecture specifies that certain address ranges are
+     * exempt from v8M SAU/IDAU checks.
+     */
+    return
+        (access_type == MMU_INST_FETCH && m_is_system_region(env, address)) ||
+        (address >= 0xe0000000 && address <= 0xe0002fff) ||
+        (address >= 0xe000e000 && address <= 0xe000efff) ||
+        (address >= 0xe002e000 && address <= 0xe002efff) ||
+        (address >= 0xe0040000 && address <= 0xe0041fff) ||
+        (address >= 0xe00ff000 && address <= 0xe00fffff);
+}
+
+static void v8m_security_lookup(CPUARMState *env, uint32_t address,
+                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                V8M_SAttributes *sattrs)
+{
+    /* Look up the security attributes for this address. Compare the
+     * pseudocode SecurityCheck() function.
+     * We assume the caller has zero-initialized *sattrs.
+     */
+    ARMCPU *cpu = arm_env_get_cpu(env);
+    int r;
+
+    /* TODO: implement IDAU */
+
+    if (access_type == MMU_INST_FETCH && extract32(address, 28, 4) == 0xf) {
+        /* 0xf0000000..0xffffffff is always S for insn fetches */
+        return;
+    }
+
+    if (v8m_is_sau_exempt(env, address, access_type)) {
+        sattrs->ns = !regime_is_secure(env, mmu_idx);
+        return;
+    }
+
+    switch (env->sau.ctrl & 3) {
+    case 0: /* SAU.ENABLE == 0, SAU.ALLNS == 0 */
+        break;
+    case 2: /* SAU.ENABLE == 0, SAU.ALLNS == 1 */
+        sattrs->ns = true;
+        break;
+    default: /* SAU.ENABLE == 1 */
+        for (r = 0; r < cpu->sau_sregion; r++) {
+            if (env->sau.rlar[r] & 1) {
+                uint32_t base = env->sau.rbar[r] & ~0x1f;
+                uint32_t limit = env->sau.rlar[r] | 0x1f;
+
+                if (base <= address && limit >= address) {
+                    if (sattrs->srvalid) {
+                        /* If we hit in more than one region then we must report
+                         * as Secure, not NS-Callable, with no valid region
+                         * number info.
+                         */
+                        sattrs->ns = false;
+                        sattrs->nsc = false;
+                        sattrs->sregion = 0;
+                        sattrs->srvalid = false;
+                        break;
+                    } else {
+                        if (env->sau.rlar[r] & 2) {
+                            sattrs->nsc = true;
+                        } else {
+                            sattrs->ns = true;
+                        }
+                        sattrs->srvalid = true;
+                        sattrs->sregion = r;
+                    }
+                }
+            }
+        }
+
+        /* TODO when we support the IDAU then it may override the result here */
+        break;
+    }
+}
+
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot, uint32_t *fsr)
+                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
+                                 int *prot, uint32_t *fsr)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
@@ -8844,10 +8974,58 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
     int n;
     int matchregion = -1;
     bool hit = false;
+    V8M_SAttributes sattrs = {};
 
     *phys_ptr = address;
     *prot = 0;
 
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
+        if (access_type == MMU_INST_FETCH) {
+            /* Instruction fetches always use the MMU bank and the
+             * transaction attribute determined by the fetch address,
+             * regardless of CPU state. This is painful for QEMU
+             * to handle, because it would mean we need to encode
+             * into the mmu_idx not just the (user, negpri) information
+             * for the current security state but also that for the
+             * other security state, which would balloon the number
+             * of mmu_idx values needed alarmingly.
+             * Fortunately we can avoid this because it's not actually
+             * possible to arbitrarily execute code from memory with
+             * the wrong security attribute: it will always generate
+             * an exception of some kind or another, apart from the
+             * special case of an NS CPU executing an SG instruction
+             * in S&NSC memory. So we always just fail the translation
+             * here and sort things out in the exception handler
+             * (including possibly emulating an SG instruction).
+             */
+            if (sattrs.ns != !secure) {
+                *fsr = sattrs.nsc ? M_FAKE_FSR_NSC_EXEC : M_FAKE_FSR_SFAULT;
+                return true;
+            }
+        } else {
+            /* For data accesses we always use the MMU bank indicated
+             * by the current CPU state, but the security attributes
+             * might downgrade a secure access to nonsecure.
+             */
+            if (sattrs.ns) {
+                txattrs->secure = false;
+            } else if (!secure) {
+                /* NS access to S memory must fault.
+                 * Architecturally we should first check whether the
+                 * MPU information for this address indicates that we
+                 * are doing an unaligned access to Device memory, which
+                 * should generate a UsageFault instead. QEMU does not
+                 * currently check for that kind of unaligned access though.
+                 * If we added it we would need to do so as a special case
+                 * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
+                 */
+                *fsr = M_FAKE_FSR_SFAULT;
+                return true;
+            }
+        }
+    }
+
     /* Unlike the ARM ARM pseudocode, we don't need to check whether this
      * was an exception vector read from the vector table (which is always
      * done using the default system address map), because those accesses
@@ -9112,7 +9290,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       phys_ptr, prot, fsr);
+                                       phys_ptr, attrs, prot, fsr);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.7.4

