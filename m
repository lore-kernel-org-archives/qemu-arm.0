Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125E2C79F89
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 13:03:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3Yzd-0006AO-RS; Mon, 07 Sep 2026 09:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3YzY-00068I-Vv
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:02:34 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3YzU-0004zq-9Q
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:02:31 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49cd77e0f95so29619355e9.3
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 06:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788786147; x=1789390947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2SIbkR3zLUPorTsZ3CZUe6Kq3hBul8d9QZlsky3KnOQ=;
 b=ZbWuwJr3Etvxu0tlbpsTJD/SLppictoQELzFLJER87ZN0v0+svc9ReV3kSID6ZqE8W
 LUPPyVemd1MsT4oMOYIEGv9KbscZNkfXBfzHPgbIA3JJUbLUipBRWsEONCpFwH3gPEyi
 oQwh1yLeUo4qeH4fEGqWTGnEruvlqCN5uEwunZ8aJjXGkBeIO+c/ZanVZW7cc7t5/24o
 KTSBJCI7zK6MdKAoKnpPJz38kX0tzpoBpQcPoViku1EnSYrs0ZrbVHy02WxAoLyn7sCv
 PQQ4EJFq7KrIqu+/tUcIDAkFd63MUQbQPB8WDS4XMJTjQOnQUKNBpRmywHH+A+COqq8e
 xl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788786147; x=1789390947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2SIbkR3zLUPorTsZ3CZUe6Kq3hBul8d9QZlsky3KnOQ=;
 b=sFaGWQKWd5lwBz+jA1ChX4t8Lfha8/4w34gCHxKmOGOPdJmr7r1lO0tHOQ3W7fA0XG
 y21/YC/bZ88ZID3NX0kioPvkclTDJmQaleFUyjBEEazt0d7LSdByG4QmOWwec83qZxL9
 1YQOlRVVxPtWuKv8M3Q107s7WYESb7lLoT0IBVmtzVLUra40s0jyZs8G3r5PCwSIi0DE
 VLrcdJnTx8ZuX+zIWQYTXD/ZwIl9B3vLFGlKgbxEsiE6AoEBG/xJpsGF66HYKgxzZqgM
 S0DUS4jV51Wg1LZ/TOF1hUKy45pWAKoc8klbPGWd2DZGhmVP+NRMMJellZkXqhaw9tEI
 FXxA==
X-Gm-Message-State: AFuF++lkuaUgEGzDkeu5ChyiGyXjWVex/QqY4lOCODfs18Q2iU/W/Qeu
 5odY2FOsgthDkOaM9XDcqlZFXokeRFqTWSfX6Af3QsHaygQCMbhUhUj6Nxf0TwZ638Chp+8nuF8
 hBAEG0tY=
X-Gm-Gg: AYBFou0Pon8H8tV6s0Z4I4gtFJo1FLBkq5qB9p6fQ7urEVG7Hw+BSy/Uv+ziuuDZllE
 9otkEzwyCuZLivENicGYf1dXJAjmJohvxaCmfUjJORXZmD9THX/78Mp1RYKr3BNINzjgPGNXldC
 uvqNM7mrkQcCk/lyQlvqMb9rnUA+d5AU9JvrwzXvl+DgemiYD3yL8BuqkqO495fu/I4tzurD+/S
 yPSxxHuo4V3kSiVkXSGREeO1AQ2ywllkdB60+O3BXguhkzyJGEPwC7nY4bZUeuKtDinUWFndUvZ
 qwOK2V9eHBEQHKmxCbt76Oan5kOd7/mjODAATF9wz99K+25YOhV0Q92eeDuIuer+Hc1h7auduWv
 c5rW74Oh/NkxCB4rtGwCh2aEwhlNH4OuFMhM3PVIEK4WvmbmZLNakEVQfj7CNMx1UzUPVsiStwF
 1ZCQ1LA7U+Fflja8o3Nkiek8ghrzn0GLRfDZWfXBQoxBGhRi/FZbKuVIfXrD9ziY3ik8MuxS0zM
 /iPXE+fiYgwvyBXVLXvTJXExYQ06rXikcLpyLo8ByB43U0f9i1Z0pF4H7Il4NJOXMDcNg==
X-Received: by 2002:a05:600c:8b88:b0:49c:fc6e:a3d8 with SMTP id
 5b1f17b1804b1-49cffde8d95mr176142925e9.23.1788786146554; 
 Mon, 07 Sep 2026 06:02:26 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee60bae6sm468589935e9.9.2026.09.07.06.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 06:02:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
Subject: [PATCH 1/8] target/arm: Keep the S/NS bit in migration data
Date: Mon,  7 Sep 2026 14:02:16 +0100
Message-ID: <20260907130223.3148989-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907130223.3148989-1-peter.maydell@linaro.org>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

For Arm, the format we use on the wire for migration of sysregs
(cpregs on AArch32) is a set of arrays, where cpreg_indexes[] holds
the register IDs and cpreg_values[] holds the corresponding values.
The ID format we use is KVM's ID format, which is 64 bits.  This is
not quite the same as the 32-bit ID format QEMU uses internally for
things like the coprocessor register hashtable keys, and so we have
conversion functions kvm_to_cpreg_id() and cpreg_to_kvm_id() to swap
between them.

This conversion has never handled AArch32 Secure coprocessor
registers correctly: the KVM ID format has no way to indicate a
Secure register, because KVM VMs on AArch32 were always NonSecure.
The current code doesn't touch the CP_REG_AA32_NS_MASK bit when
converting from the 32-bit ID format to a KVM ID, and it forces the
NS bit to 1 when converting from a KVM ID to a cpreg.  The effect of
this on migration is that the indexes in cpreg_indexes[] have NS = 0
for the Secure banked registers and NS = 1 for the NS banked
registers, but when we read and write the values into the CPUState by
finding the register using kvm_to_cpreg_id(cpreg_indexes[i]) we
always find the NS register, and so the S register values aren't
actually migrated.

This went unnoticed most of the time because a typical Linux guest is
running only in NS and doesn't really care about the S register
state, but it breaks migration of a guest which is running in S, such
as Linux on the imx boards.

This would be more awkward to fix if KVM still supported AArch32
hosts, but luckily that was dropped some years ago, and AArch32
guests on an AArch64 host expose the sysregs as CP_REG_ARM64, not
CP_REG_ARM32.  So the only place where we use a CP_REG_ARM32 KVM
register ID is for TCG migrations.  We can therefore (continue to)
steal a bit in the KVM format for the NS bit, with the semantics
we've given it on the wire in the past.  We just need to let
kvm_to_cpreg_id() pass it through rather than forcing it to 1.

To retain compatibility with migration from older QEMU versions
without this fix, we need to add a subsection to the migration data
that tells the destination that it can trust the values for Secure
banked registers.  For incoming migrations, if we don't see this then
we ignore all the values for Secure banked registers, giving the same
behaviour as before.  This means we continue to work for migrations
where the Secure world exists but the guest is basically not using
it, such as a direct kernel boot on boards which don't set
arm_boot_info::secure_boot to true; this includes the cubieboard,
bananapi and orangepi.

Attempting migration from a new QEMU to an older QEMU version will
now fail cleanly (because the destination doesn't recognize the new
subsection) rather than silently corrupting the Secure banked
registers.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/467
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h  | 21 ++++++++----
 target/arm/cpu.h     |  6 ++++
 target/arm/machine.c | 80 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 9f2532fe667..ce651a4faa6 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -215,7 +215,20 @@ enum {
 
 /*
  * Convert a full 64 bit KVM register ID to the truncated 32 bit
- * version used as a key for the coprocessor register hashtable
+ * version used as a key for the coprocessor register hashtable.
+ *
+ * Note that we deviate slightly from the KVM register ID format as
+ * used by the kernel for AArch32 cpregs, by using bit 29 as "1
+ * for NonSecure, 0 for Secure". (When KVM still supported AArch32
+ * hosts it didn't set this bit; all sysregs for KVM guests are
+ * NonSecure anyway.) This shouldn't cause any issues as KVM no longer
+ * supports AArch32 hosts (and other accelerators never did), so the
+ * only thing that generates KVM regids for AArch32 cpregs is QEMU
+ * TCG.
+ *
+ * The NS bit being in the KVM ID is implicit in the fact that we
+ * don't mask out CP_REG_AA32_NS_MASK in the conversions to and from
+ * the QEMU hashtable key ID format.
  */
 static inline uint32_t kvm_to_cpreg_id(uint64_t kvmid)
 {
@@ -226,12 +239,6 @@ static inline uint32_t kvm_to_cpreg_id(uint64_t kvmid)
         if ((kvmid & CP_REG_SIZE_MASK) == CP_REG_SIZE_U64) {
             cpregid |= CP_REG_AA32_64BIT_MASK;
         }
-
-        /*
-         * KVM is always non-secure so add the NS flag on AArch32 register
-         * entries.
-         */
-         cpregid |= CP_REG_AA32_NS_MASK;
     }
     return cpregid;
 }
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e3f931dba26..231fdf710b7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1128,6 +1128,12 @@ struct ArchCPU {
     bool prop_pauth_qarma5;
     bool prop_lpa2;
 
+    /*
+     * Used only during migration, to handle back-compat with older QEMU
+     * that mishandled migration of AArch32 banked cpregs.
+     */
+    bool secure_banked_regs_ok;
+
     /* GM blocksize, in log_2(words), ie low 4 bits of GMID_EL0 */
     uint8_t gm_blocksize;
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 89127e5d83c..1fc3acc31ca 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -979,6 +979,39 @@ static const VMStateDescription vmstate_fpmr = {
     },
 };
 
+static bool secure_banked_regs_ok_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    /*
+     * We must send this subsection if this is an AArch32 CPU with
+     * banked coprocessor registers. Older QEMU mishandled migration
+     * of these by listing both Secure and NonSecure banked registers
+     * in the cpreg_vmstate_indexes but reading and writing the
+     * NonSecure register for both indexes. Providing this subsection
+     * tells the destination that we do not have this bug and it
+     * should not ignore the Secure banked register values.
+     *
+     * We don't need the subsection for CPUs without banked registers
+     * (notably AArch64 ones and M-profile ones), and don't send
+     * it to avoid breaking migration compat for them.
+     */
+    return !arm_feature(&cpu->env, ARM_FEATURE_AARCH64) &&
+        !arm_feature(&cpu->env, ARM_FEATURE_M) &&
+        arm_feature(&cpu->env, ARM_FEATURE_EL3);
+}
+
+static const VMStateDescription vmstate_secure_banked_regs_ok = {
+    .name = "cpu/secure-banked-regs-ok",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = secure_banked_regs_ok_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_BOOL(secure_banked_regs_ok, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -1014,6 +1047,9 @@ static int cpu_pre_save(void *opaque)
     cpu->cpreg_vmstate_values = cpu->cpreg_values;
     cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
 
+    /* We don't have the bug where we send wrong data for Secure regs */
+    cpu->secure_banked_regs_ok = true;
+
     return 0;
 }
 
@@ -1062,6 +1098,9 @@ static int cpu_pre_load(void *opaque)
     g_assert(!cpu->cpreg_vmstate_indexes);
     g_assert(!cpu->cpreg_vmstate_values);
 
+    /* So cpu_post_load() can see if we saw secure-banked-regs-ok */
+    cpu->secure_banked_regs_ok = false;
+
     return 0;
 }
 
@@ -1120,6 +1159,7 @@ static int cpu_post_load(void *opaque, int version_id)
     ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
     bool fail = false;
+    bool ignore_s_regs;
     int i, v;
 
     trace_cpu_post_load(cpu->cpreg_vmstate_array_len,
@@ -1142,6 +1182,21 @@ static int cpu_post_load(void *opaque, int version_id)
              CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VFIQ);
     }
 
+    /*
+     * Handle migration compatibility from an old QEMU which didn't get
+     * AArch32 Secure banked cpregs right. That QEMU will not have sent
+     * us the secure-banked-regs-ok subsection, and although its
+     * vmstate_indexes will include the S banked regs, the values in
+     * vmstate_values will be duplicates of the values of the NS banked
+     * regs. Ignore the S banked registers, which is the same effective
+     * behaviour of an old->old migration. (That is, the S regs will
+     * be at their reset values, which is usually good enough for the
+     * case of "guest is actually executing in NS and doesn't care
+     * about the S state".)
+     */
+    ignore_s_regs = secure_banked_regs_ok_needed(cpu) &&
+        !cpu->secure_banked_regs_ok;
+
     /* Update the values list from the incoming migration data.
      * Anything in the incoming data which we don't know about is
      * a migration failure; anything we know about but the incoming
@@ -1165,6 +1220,30 @@ static int cpu_post_load(void *opaque, int version_id)
             continue;
         }
         /* matching register, copy the value over */
+
+        if (ignore_s_regs) {
+            /*
+             * If this is an AArch32 Secure cpreg, read the current (reset)
+             * value instead of using the migration state value. That way
+             * write_list_to_cpustate() will effectively be a NOP.
+             */
+            uint64_t kvmidx = cpu->cpreg_vmstate_indexes[v];
+
+            if ((kvmidx & CP_REG_ARCH_MASK) == CP_REG_ARM &&
+                (kvmidx & CP_REG_AA32_NS_MASK) == 0) {
+                uint32_t regidx = kvm_to_cpreg_id(kvmidx);
+                const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs,
+                                                            regidx);
+                /*
+                 * Missing ri or NO_RAW ri will be ignored or errored in
+                 * write_list_to_cpustate() later, so safe to skip.
+                 */
+                if (ri && !(ri->type & ARM_CP_NO_RAW)) {
+                    cpu->cpreg_vmstate_values[v] = read_raw_cp_reg(env, ri);
+                }
+            }
+        }
+
         cpu->cpreg_values[i] = cpu->cpreg_vmstate_values[v];
         i++;
         v++;
@@ -1343,6 +1422,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_pstate64,
         &vmstate_event,
         &vmstate_fpmr,
+        &vmstate_secure_banked_regs_ok,
         NULL
     }
 };
-- 
2.43.0


