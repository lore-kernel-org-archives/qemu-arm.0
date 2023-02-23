Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709180ejc;
        Thu, 23 Feb 2023 05:10:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8fo5KzlhA7aYFrNKhVsuDbU919WhpMZgCYKS/1czM0lmY1WCo5tfL13ko6g6lhhnx9L6rI
X-Received: by 2002:a05:600c:c07:b0:3df:9858:c02e with SMTP id fm7-20020a05600c0c0700b003df9858c02emr10321951wmb.3.1677157853939;
        Thu, 23 Feb 2023 05:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157853; cv=none;
        d=google.com; s=arc-20160816;
        b=G8y/mpQsPphv3SXM2bAbuze4LUqd3IsP+ETOBZqECDFTzXG9n1ZQ1sRpZfhHmGpNkT
         gmYYUf8IMIKP6mqdUKIQVPbVmzlfZw1yytQfUp7BdvYaZuxpFXeqzD5FdlgngDfW/1b3
         wOOE2iLsIxQ9dx6mKp3jzrjbVdFD9MAL7PzEkbjoWai8laX0o5u7l7+2TRW9eYr/Aarn
         +4VGlvABYCqvl0d+QU+pIKQyTg3WyGhyz6tN6T1dMxa1pMPOngaqedL+vcaSI9VxbkN3
         wIivXxZWX3IqNbj1JNWENLoxz73dEPakxIlG8USrwC17oEPqPqxJC131X7oHNQGlfAJo
         aB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=nzgw65teBa3Zpf+knoHKxylMKGtIHaopjdnE4d9fFYo=;
        b=wAzpKhv0ZJPeIob7eFF1SGqVjcMXadeBsFm8PJYtgV5Z3AuMBjs8TZLXcgsN6y1HS4
         wPeQu/3uZmRJncOP5ymMi55oT+AasxW/EcWrSnP6iXj6PHmVzCALFyo8cIoP+0e2+fHs
         0yQocAZ28ipwrmoE/cSBy6wuaGgGoVDtcjTKPHSL3JZyh13BAa981A/SwJKeJO46yQfu
         lJEJYPXRtBPMgWorWNyDHQeSz6WzOkXMlTQLijR7Pj5Z5xoDSb0+8f72L1q5cDZRUD/z
         2PmKu8liHWZMf4pWRKhSeGU/zxPtVv3jsL9Iv3MAa7egmxyPAJnUmWomP3AdGioRsY8v
         Pj6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VmJVqNVu;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id z3-20020adfdf83000000b002c55bca6aaesi4318281wrl.79.2023.02.23.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=VmJVqNVu;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8D611209FD;
	Thu, 23 Feb 2023 13:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nzgw65teBa3Zpf+knoHKxylMKGtIHaopjdnE4d9fFYo=;
	b=VmJVqNVuhNi65TLDkPgJ6aHjbb1Xcj29dAyHhLnsI20AROeB3zHKxssDrW91XMx3BhAKZM
	XgfUa9RKMMM5dNIAKgBrfjXMypKZ/2HqPctrDnAsxDGk9YRinQcYi46zaU/Xpxk9DrYc7g
	zCd3rabYzj9JaAcsn5w+AjHGYPynW+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nzgw65teBa3Zpf+knoHKxylMKGtIHaopjdnE4d9fFYo=;
	b=ffp18LVZWEJzggFaU2R2aBC9UincXaUpDfsFJyT9JEVVr4POPH9NWYxZR24vQOSqEHwg+R
	glKo+0lixiixbNBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACCA9139B5;
	Thu, 23 Feb 2023 13:10:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2CsqHdpl92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:10:50 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 02/20] target/arm: Wrap TCG-only code in debug_helper.c
Date: Thu, 23 Feb 2023 10:08:23 -0300
Message-Id: <20230223130841.25916-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: s1y6Tv8X2CfM

The next few patches will move helpers under CONFIG_TCG. We'd prefer
to keep the debug helpers and debug registers close together, so
rearrange the file a bit to be able to wrap the helpers with a TCG
ifdef.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/debug_helper.c | 476 +++++++++++++++++++-------------------
 1 file changed, 239 insertions(+), 237 deletions(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 3325eb9d7d..dfc8b2a1a5 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,8 +12,9 @@
 #include "cpregs.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
+#include "sysemu/tcg.h"
 
-
+#ifdef CONFIG_TCG
 /* Return the Exception Level targeted by debug exceptions. */
 static int arm_debug_target_el(CPUARMState *env)
 {
@@ -536,6 +537,243 @@ void HELPER(exception_swstep)(CPUARMState *env, uint32_t syndrome)
     raise_exception_debug(env, EXCP_UDEF, syndrome);
 }
 
+void hw_watchpoint_update(ARMCPU *cpu, int n)
+{
+    CPUARMState *env = &cpu->env;
+    vaddr len = 0;
+    vaddr wvr = env->cp15.dbgwvr[n];
+    uint64_t wcr = env->cp15.dbgwcr[n];
+    int mask;
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+
+    if (env->cpu_watchpoint[n]) {
+        cpu_watchpoint_remove_by_ref(CPU(cpu), env->cpu_watchpoint[n]);
+        env->cpu_watchpoint[n] = NULL;
+    }
+
+    if (!FIELD_EX64(wcr, DBGWCR, E)) {
+        /* E bit clear : watchpoint disabled */
+        return;
+    }
+
+    switch (FIELD_EX64(wcr, DBGWCR, LSC)) {
+    case 0:
+        /* LSC 00 is reserved and must behave as if the wp is disabled */
+        return;
+    case 1:
+        flags |= BP_MEM_READ;
+        break;
+    case 2:
+        flags |= BP_MEM_WRITE;
+        break;
+    case 3:
+        flags |= BP_MEM_ACCESS;
+        break;
+    }
+
+    /*
+     * Attempts to use both MASK and BAS fields simultaneously are
+     * CONSTRAINED UNPREDICTABLE; we opt to ignore BAS in this case,
+     * thus generating a watchpoint for every byte in the masked region.
+     */
+    mask = FIELD_EX64(wcr, DBGWCR, MASK);
+    if (mask == 1 || mask == 2) {
+        /*
+         * Reserved values of MASK; we must act as if the mask value was
+         * some non-reserved value, or as if the watchpoint were disabled.
+         * We choose the latter.
+         */
+        return;
+    } else if (mask) {
+        /* Watchpoint covers an aligned area up to 2GB in size */
+        len = 1ULL << mask;
+        /*
+         * If masked bits in WVR are not zero it's CONSTRAINED UNPREDICTABLE
+         * whether the watchpoint fires when the unmasked bits match; we opt
+         * to generate the exceptions.
+         */
+        wvr &= ~(len - 1);
+    } else {
+        /* Watchpoint covers bytes defined by the byte address select bits */
+        int bas = FIELD_EX64(wcr, DBGWCR, BAS);
+        int basstart;
+
+        if (extract64(wvr, 2, 1)) {
+            /*
+             * Deprecated case of an only 4-aligned address. BAS[7:4] are
+             * ignored, and BAS[3:0] define which bytes to watch.
+             */
+            bas &= 0xf;
+        }
+
+        if (bas == 0) {
+            /* This must act as if the watchpoint is disabled */
+            return;
+        }
+
+        /*
+         * The BAS bits are supposed to be programmed to indicate a contiguous
+         * range of bytes. Otherwise it is CONSTRAINED UNPREDICTABLE whether
+         * we fire for each byte in the word/doubleword addressed by the WVR.
+         * We choose to ignore any non-zero bits after the first range of 1s.
+         */
+        basstart = ctz32(bas);
+        len = cto32(bas >> basstart);
+        wvr += basstart;
+    }
+
+    cpu_watchpoint_insert(CPU(cpu), wvr, len, flags,
+                          &env->cpu_watchpoint[n]);
+}
+
+void hw_watchpoint_update_all(ARMCPU *cpu)
+{
+    int i;
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * Completely clear out existing QEMU watchpoints and our array, to
+     * avoid possible stale entries following migration load.
+     */
+    cpu_watchpoint_remove_all(CPU(cpu), BP_CPU);
+    memset(env->cpu_watchpoint, 0, sizeof(env->cpu_watchpoint));
+
+    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_watchpoint); i++) {
+        hw_watchpoint_update(cpu, i);
+    }
+}
+
+void hw_breakpoint_update(ARMCPU *cpu, int n)
+{
+    CPUARMState *env = &cpu->env;
+    uint64_t bvr = env->cp15.dbgbvr[n];
+    uint64_t bcr = env->cp15.dbgbcr[n];
+    vaddr addr;
+    int bt;
+    int flags = BP_CPU;
+
+    if (env->cpu_breakpoint[n]) {
+        cpu_breakpoint_remove_by_ref(CPU(cpu), env->cpu_breakpoint[n]);
+        env->cpu_breakpoint[n] = NULL;
+    }
+
+    if (!extract64(bcr, 0, 1)) {
+        /* E bit clear : watchpoint disabled */
+        return;
+    }
+
+    bt = extract64(bcr, 20, 4);
+
+    switch (bt) {
+    case 4: /* unlinked address mismatch (reserved if AArch64) */
+    case 5: /* linked address mismatch (reserved if AArch64) */
+        qemu_log_mask(LOG_UNIMP,
+                      "arm: address mismatch breakpoint types not implemented\n");
+        return;
+    case 0: /* unlinked address match */
+    case 1: /* linked address match */
+    {
+        /*
+         * Bits [1:0] are RES0.
+         *
+         * It is IMPLEMENTATION DEFINED whether bits [63:49]
+         * ([63:53] for FEAT_LVA) are hardwired to a copy of the sign bit
+         * of the VA field ([48] or [52] for FEAT_LVA), or whether the
+         * value is read as written.  It is CONSTRAINED UNPREDICTABLE
+         * whether the RESS bits are ignored when comparing an address.
+         * Therefore we are allowed to compare the entire register, which
+         * lets us avoid considering whether FEAT_LVA is actually enabled.
+         *
+         * The BAS field is used to allow setting breakpoints on 16-bit
+         * wide instructions; it is CONSTRAINED UNPREDICTABLE whether
+         * a bp will fire if the addresses covered by the bp and the addresses
+         * covered by the insn overlap but the insn doesn't start at the
+         * start of the bp address range. We choose to require the insn and
+         * the bp to have the same address. The constraints on writing to
+         * BAS enforced in dbgbcr_write mean we have only four cases:
+         *  0b0000  => no breakpoint
+         *  0b0011  => breakpoint on addr
+         *  0b1100  => breakpoint on addr + 2
+         *  0b1111  => breakpoint on addr
+         * See also figure D2-3 in the v8 ARM ARM (DDI0487A.c).
+         */
+        int bas = extract64(bcr, 5, 4);
+        addr = bvr & ~3ULL;
+        if (bas == 0) {
+            return;
+        }
+        if (bas == 0xc) {
+            addr += 2;
+        }
+        break;
+    }
+    case 2: /* unlinked context ID match */
+    case 8: /* unlinked VMID match (reserved if no EL2) */
+    case 10: /* unlinked context ID and VMID match (reserved if no EL2) */
+        qemu_log_mask(LOG_UNIMP,
+                      "arm: unlinked context breakpoint types not implemented\n");
+        return;
+    case 9: /* linked VMID match (reserved if no EL2) */
+    case 11: /* linked context ID and VMID match (reserved if no EL2) */
+    case 3: /* linked context ID match */
+    default:
+        /*
+         * We must generate no events for Linked context matches (unless
+         * they are linked to by some other bp/wp, which is handled in
+         * updates for the linking bp/wp). We choose to also generate no events
+         * for reserved values.
+         */
+        return;
+    }
+
+    cpu_breakpoint_insert(CPU(cpu), addr, flags, &env->cpu_breakpoint[n]);
+}
+
+void hw_breakpoint_update_all(ARMCPU *cpu)
+{
+    int i;
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * Completely clear out existing QEMU breakpoints and our array, to
+     * avoid possible stale entries following migration load.
+     */
+    cpu_breakpoint_remove_all(CPU(cpu), BP_CPU);
+    memset(env->cpu_breakpoint, 0, sizeof(env->cpu_breakpoint));
+
+    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_breakpoint); i++) {
+        hw_breakpoint_update(cpu, i);
+    }
+}
+
+#if !defined(CONFIG_USER_ONLY)
+
+vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * In BE32 system mode, target memory is stored byteswapped (on a
+     * little-endian host system), and by the time we reach here (via an
+     * opcode helper) the addresses of subword accesses have been adjusted
+     * to account for that, which means that watchpoints will not match.
+     * Undo the adjustment here.
+     */
+    if (arm_sctlr_b(env)) {
+        if (len == 1) {
+            addr ^= 3;
+        } else if (len == 2) {
+            addr ^= 2;
+        }
+    }
+
+    return addr;
+}
+
+#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG */
+
 /*
  * Check for traps to "powerdown debug" registers, which are controlled
  * by MDCR.TDOSA
@@ -813,112 +1051,6 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
       .access = PL0_R, .type = ARM_CP_CONST | ARM_CP_64BIT, .resetvalue = 0 },
 };
 
-void hw_watchpoint_update(ARMCPU *cpu, int n)
-{
-    CPUARMState *env = &cpu->env;
-    vaddr len = 0;
-    vaddr wvr = env->cp15.dbgwvr[n];
-    uint64_t wcr = env->cp15.dbgwcr[n];
-    int mask;
-    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
-
-    if (env->cpu_watchpoint[n]) {
-        cpu_watchpoint_remove_by_ref(CPU(cpu), env->cpu_watchpoint[n]);
-        env->cpu_watchpoint[n] = NULL;
-    }
-
-    if (!FIELD_EX64(wcr, DBGWCR, E)) {
-        /* E bit clear : watchpoint disabled */
-        return;
-    }
-
-    switch (FIELD_EX64(wcr, DBGWCR, LSC)) {
-    case 0:
-        /* LSC 00 is reserved and must behave as if the wp is disabled */
-        return;
-    case 1:
-        flags |= BP_MEM_READ;
-        break;
-    case 2:
-        flags |= BP_MEM_WRITE;
-        break;
-    case 3:
-        flags |= BP_MEM_ACCESS;
-        break;
-    }
-
-    /*
-     * Attempts to use both MASK and BAS fields simultaneously are
-     * CONSTRAINED UNPREDICTABLE; we opt to ignore BAS in this case,
-     * thus generating a watchpoint for every byte in the masked region.
-     */
-    mask = FIELD_EX64(wcr, DBGWCR, MASK);
-    if (mask == 1 || mask == 2) {
-        /*
-         * Reserved values of MASK; we must act as if the mask value was
-         * some non-reserved value, or as if the watchpoint were disabled.
-         * We choose the latter.
-         */
-        return;
-    } else if (mask) {
-        /* Watchpoint covers an aligned area up to 2GB in size */
-        len = 1ULL << mask;
-        /*
-         * If masked bits in WVR are not zero it's CONSTRAINED UNPREDICTABLE
-         * whether the watchpoint fires when the unmasked bits match; we opt
-         * to generate the exceptions.
-         */
-        wvr &= ~(len - 1);
-    } else {
-        /* Watchpoint covers bytes defined by the byte address select bits */
-        int bas = FIELD_EX64(wcr, DBGWCR, BAS);
-        int basstart;
-
-        if (extract64(wvr, 2, 1)) {
-            /*
-             * Deprecated case of an only 4-aligned address. BAS[7:4] are
-             * ignored, and BAS[3:0] define which bytes to watch.
-             */
-            bas &= 0xf;
-        }
-
-        if (bas == 0) {
-            /* This must act as if the watchpoint is disabled */
-            return;
-        }
-
-        /*
-         * The BAS bits are supposed to be programmed to indicate a contiguous
-         * range of bytes. Otherwise it is CONSTRAINED UNPREDICTABLE whether
-         * we fire for each byte in the word/doubleword addressed by the WVR.
-         * We choose to ignore any non-zero bits after the first range of 1s.
-         */
-        basstart = ctz32(bas);
-        len = cto32(bas >> basstart);
-        wvr += basstart;
-    }
-
-    cpu_watchpoint_insert(CPU(cpu), wvr, len, flags,
-                          &env->cpu_watchpoint[n]);
-}
-
-void hw_watchpoint_update_all(ARMCPU *cpu)
-{
-    int i;
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * Completely clear out existing QEMU watchpoints and our array, to
-     * avoid possible stale entries following migration load.
-     */
-    cpu_watchpoint_remove_all(CPU(cpu), BP_CPU);
-    memset(env->cpu_watchpoint, 0, sizeof(env->cpu_watchpoint));
-
-    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_watchpoint); i++) {
-        hw_watchpoint_update(cpu, i);
-    }
-}
-
 static void dbgwvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
@@ -956,109 +1088,6 @@ static void dbgwcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
-void hw_breakpoint_update(ARMCPU *cpu, int n)
-{
-    CPUARMState *env = &cpu->env;
-    uint64_t bvr = env->cp15.dbgbvr[n];
-    uint64_t bcr = env->cp15.dbgbcr[n];
-    vaddr addr;
-    int bt;
-    int flags = BP_CPU;
-
-    if (env->cpu_breakpoint[n]) {
-        cpu_breakpoint_remove_by_ref(CPU(cpu), env->cpu_breakpoint[n]);
-        env->cpu_breakpoint[n] = NULL;
-    }
-
-    if (!extract64(bcr, 0, 1)) {
-        /* E bit clear : watchpoint disabled */
-        return;
-    }
-
-    bt = extract64(bcr, 20, 4);
-
-    switch (bt) {
-    case 4: /* unlinked address mismatch (reserved if AArch64) */
-    case 5: /* linked address mismatch (reserved if AArch64) */
-        qemu_log_mask(LOG_UNIMP,
-                      "arm: address mismatch breakpoint types not implemented\n");
-        return;
-    case 0: /* unlinked address match */
-    case 1: /* linked address match */
-    {
-        /*
-         * Bits [1:0] are RES0.
-         *
-         * It is IMPLEMENTATION DEFINED whether bits [63:49]
-         * ([63:53] for FEAT_LVA) are hardwired to a copy of the sign bit
-         * of the VA field ([48] or [52] for FEAT_LVA), or whether the
-         * value is read as written.  It is CONSTRAINED UNPREDICTABLE
-         * whether the RESS bits are ignored when comparing an address.
-         * Therefore we are allowed to compare the entire register, which
-         * lets us avoid considering whether FEAT_LVA is actually enabled.
-         *
-         * The BAS field is used to allow setting breakpoints on 16-bit
-         * wide instructions; it is CONSTRAINED UNPREDICTABLE whether
-         * a bp will fire if the addresses covered by the bp and the addresses
-         * covered by the insn overlap but the insn doesn't start at the
-         * start of the bp address range. We choose to require the insn and
-         * the bp to have the same address. The constraints on writing to
-         * BAS enforced in dbgbcr_write mean we have only four cases:
-         *  0b0000  => no breakpoint
-         *  0b0011  => breakpoint on addr
-         *  0b1100  => breakpoint on addr + 2
-         *  0b1111  => breakpoint on addr
-         * See also figure D2-3 in the v8 ARM ARM (DDI0487A.c).
-         */
-        int bas = extract64(bcr, 5, 4);
-        addr = bvr & ~3ULL;
-        if (bas == 0) {
-            return;
-        }
-        if (bas == 0xc) {
-            addr += 2;
-        }
-        break;
-    }
-    case 2: /* unlinked context ID match */
-    case 8: /* unlinked VMID match (reserved if no EL2) */
-    case 10: /* unlinked context ID and VMID match (reserved if no EL2) */
-        qemu_log_mask(LOG_UNIMP,
-                      "arm: unlinked context breakpoint types not implemented\n");
-        return;
-    case 9: /* linked VMID match (reserved if no EL2) */
-    case 11: /* linked context ID and VMID match (reserved if no EL2) */
-    case 3: /* linked context ID match */
-    default:
-        /*
-         * We must generate no events for Linked context matches (unless
-         * they are linked to by some other bp/wp, which is handled in
-         * updates for the linking bp/wp). We choose to also generate no events
-         * for reserved values.
-         */
-        return;
-    }
-
-    cpu_breakpoint_insert(CPU(cpu), addr, flags, &env->cpu_breakpoint[n]);
-}
-
-void hw_breakpoint_update_all(ARMCPU *cpu)
-{
-    int i;
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * Completely clear out existing QEMU breakpoints and our array, to
-     * avoid possible stale entries following migration load.
-     */
-    cpu_breakpoint_remove_all(CPU(cpu), BP_CPU);
-    memset(env->cpu_breakpoint, 0, sizeof(env->cpu_breakpoint));
-
-    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_breakpoint); i++) {
-        hw_breakpoint_update(cpu, i);
-    }
-}
-
 static void dbgbvr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
@@ -1210,30 +1239,3 @@ void define_debug_regs(ARMCPU *cpu)
         g_free(dbgwcr_el1_name);
     }
 }
-
-#if !defined(CONFIG_USER_ONLY)
-
-vaddr arm_adjust_watchpoint_address(CPUState *cs, vaddr addr, int len)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * In BE32 system mode, target memory is stored byteswapped (on a
-     * little-endian host system), and by the time we reach here (via an
-     * opcode helper) the addresses of subword accesses have been adjusted
-     * to account for that, which means that watchpoints will not match.
-     * Undo the adjustment here.
-     */
-    if (arm_sctlr_b(env)) {
-        if (len == 1) {
-            addr ^= 3;
-        } else if (len == 2) {
-            addr ^= 2;
-        }
-    }
-
-    return addr;
-}
-
-#endif
-- 
2.35.3
