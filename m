Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3BB10F9976
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:56:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYVu-0005Hn-7p; Wed, 08 Apr 2026 15:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAY6n-00079o-V5
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:58:37 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAHnG-0006Vd-IH
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 21:33:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so30553875ad.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 18:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775611999; x=1776216799; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oP/1GRjBSCthp+KAd33rcbtQgDmB+jnc/jSoYFA5Kjg=;
 b=VNx47wmbY0xkin4whYLB/Fs6KNwwAJFnz1IV4/ikKXPctmRRft81Lwt+BNAYzdG9eb
 E7z+yiqMwOPsCNmjVJluCLXIKAX9E2MdM+ocL5uLpJvrM5NEhhIIr5kB15g+Qd9Lbmbu
 trzP4fswoagntO+S6PN4+k7iSpk32oWiLKugR+I3kj99HB2HKCJnfaME4hQNUHeGoGgd
 W+uRFDDQJ4+liqB1csxihkvRMCtUhWrKHvhAdNjNYJNEbPuIvz7ew/iEaRYDclFHSdtc
 ampZJPiO3yucLis0ENKCN75+ygGhAKUQ7BEDzXAxg1s6eJSGq0td3itQTvCUkvGRDn1D
 lqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775611999; x=1776216799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oP/1GRjBSCthp+KAd33rcbtQgDmB+jnc/jSoYFA5Kjg=;
 b=KwDNGm1f1arqStfw0n/HcCxo2yHeKCGXENYoGR9zoazQ2XAJdNXTL1xcVhLAxpqErb
 nZLyVZFOXbjR63+nCFUGrfLb3y7TDu+s9RXKsZbjR48075UNgz3gOar6AOtEcIWQ+tE/
 656r1WRB+i/x50lQPu/HALy6nFVX1GdL6ORNwYp9PPZpbwLTLqDPZFEx7Ymc63xs8wJC
 qlIMHQTzsWydR0OkWwCM4gCjNPUXJhS0d8s/dJTJltq5JIbdKmR7pGNPrkkqob/2B0PO
 LXIqVUnzTjUVobFrZWj0sVyDdqlJrr6RpcJ+m0JV43i5b+/sS88ktBqTZrI+RmRSykfN
 fDTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWODxmoCtGF/L/v0vNVDIRVM0lk503Teb9MUOTzjRRMx0tGtqVx+Ud+U291/AbymY6PrFNaSwo2SA==@nongnu.org
X-Gm-Message-State: AOJu0YzrHfvCx5nLm0zcpgP0foH978SIrOr7RvmlEFpPZ/D0DsdyncUV
 E6Dv+jTnQReKBG3xbn95HeWAndYEyVNR6JVhjI/jftDBlMGCAhCWAdBAc38R0hl1zfQ=
X-Gm-Gg: AeBDievCqT+n5CEYaKbFka+5Nk/O+dTqYu7mYdtcl+96HYcUACUDw4XnzVKRuO4g2Si
 9rsSuxkIqYCZT9JJUH7aKXf7mdBC900FHFUSAa/iXKnthCufFnYpr55gnsu7AksafSISMJ5a9Tx
 dkiVPjjuveik1HkHK+0TQvxqkxt37lA5Z9xopR/FVc1NjkTnN9hQJ+xn11ozpNCTwtQJnwQPs6d
 AkkLTOD+V3dKEBJm7Wwj8Gr/3xZL3Kyt4UtENsxipyTvjXeTZdyZLmGtmHrWznAh/kEWsGtv/L1
 08NIvQAgeqyLNmSs6v7Hphm48J5Yf8U4KjccDdzdqkarVV0KVwghpsRGhfffMQA67zqYu0wgMYS
 yJjBfhY62FLltwvNVaYK7TDakKjfesVUKTSArO2LEn+GIiFlXXZQefrgr5lz+zKxbKrPyd7kMZL
 wavCmVpLkRlVIXPovu/QUSQnkAh0nQNzgMdjkAEsgG11PwpXNZBLORUad+
X-Received: by 2002:a17:903:37ce:b0:2b2:481b:de5f with SMTP id
 d9443c01a7336-2b28163b27dmr196144595ad.5.1775611999145; 
 Tue, 07 Apr 2026 18:33:19 -0700 (PDT)
Received: from stoup.. (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2745c480dsm238277395ad.0.2026.04.07.18.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 18:33:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pierrick.bouvier@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 1/2] linux-user/arm: Improve get_user_code_u32 and usage
Date: Wed,  8 Apr 2026 11:33:08 +1000
Message-ID: <20260408013309.56122-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408013309.56122-1-richard.henderson@linaro.org>
References: <20260408013309.56122-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Force a little-endian load before applying SCTLR.B.
Handle the BE32 swap correctly in thumb mode.  This
fixes a bug with its later usage in insn_is_linux_bkpt.

Handle lock_user failure: in one case by simply falling back
to the original SIGILL and the other by raising SIGSEGV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/cpu_loop.c | 64 ++++++++++++++++++++++++---------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 19874f4c72..419136fdee 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -29,13 +29,34 @@
 #include "user/page-protection.h"
 #include "target/arm/syndrome.h"
 
-#define get_user_code_u32(x, gaddr, env)                \
-    ({ abi_long __r = get_user_u32((x), (gaddr));       \
-        if (!__r && bswap_code(arm_sctlr_b(env))) {     \
-            (x) = bswap32(x);                           \
-        }                                               \
-        __r;                                            \
-    })
+static bool get_user_code_u32(uint32_t *ret, uint32_t va, CPUARMState *env)
+{
+    uint32_t insn, *hptr;
+
+    hptr = lock_user(VERIFY_READ, va, sizeof(uint32_t), 1);
+    if (!hptr) {
+        *ret = 0;
+        return false;
+    }
+
+    /* Load as little-endian by default. */
+    __get_user_e(insn, hptr, le);
+    unlock_user(hptr, va, 0);
+
+    /*
+     * Adjust the little-endian load for BE32 as required.
+     * In thumb mode, bswap both halfwords by bswap of word then
+     * swapping the halfwords again to restore the original order.
+     */
+    if (arm_sctlr_b(env)) {
+        insn = bswap32(insn);
+        if (env->thumb) {
+            insn = hswap32(insn);
+        }
+    }
+    *ret = insn;
+    return true;
+}
 
 /*
  * Note that if we need to do data accesses here, they should do a
@@ -271,7 +292,8 @@ void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, si_signo, si_code;
-    unsigned int n, insn;
+    unsigned int n;
+    uint32_t insn;
     abi_ulong ret;
 
     for(;;) {
@@ -284,31 +306,23 @@ void cpu_loop(CPUARMState *env)
         case EXCP_UDEF:
         case EXCP_NOCP:
         case EXCP_INVSTATE:
-            {
-                uint32_t opcode;
-
-                /* we handle the FPU emulation here, as Linux */
-                /* we get the opcode */
-                /* FIXME - what to do if get_user() fails? */
-                get_user_code_u32(opcode, env->regs[15], env);
-
+            /* we handle the FPU emulation here, as Linux */
+            if (get_user_code_u32(&insn, env->regs[15], env)) {
                 /*
                  * The Linux kernel treats some UDF patterns specially
                  * to use as breakpoints (instead of the architectural
                  * bkpt insn). These should trigger a SIGTRAP rather
                  * than SIGILL.
                  */
-                if (insn_is_linux_bkpt(opcode, env->thumb)) {
+                if (insn_is_linux_bkpt(insn, env->thumb)) {
                     goto excp_debug;
                 }
 
-                if (!env->thumb && emulate_arm_fpa11(env, opcode)) {
+                if (!env->thumb && emulate_arm_fpa11(env, insn)) {
                     break;
                 }
-
-                force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN,
-                                env->regs[15]);
             }
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->regs[15]);
             break;
         case EXCP_SWI:
             {
@@ -317,14 +331,12 @@ void cpu_loop(CPUARMState *env)
                 if (env->thumb) {
                     /* Thumb is always EABI style with syscall number in r7 */
                     n = env->regs[7];
-                } else {
+                } else if (get_user_code_u32(&insn, env->regs[15] - 4, env)) {
                     /*
                      * Equivalent of kernel CONFIG_OABI_COMPAT: read the
                      * Arm SVC insn to extract the immediate, which is the
                      * syscall number in OABI.
                      */
-                    /* FIXME - what to do if get_user() fails? */
-                    get_user_code_u32(insn, env->regs[15] - 4, env);
                     n = insn & 0xffffff;
                     if (n == 0) {
                         /* zero immediate: EABI, syscall number in r7 */
@@ -340,6 +352,10 @@ void cpu_loop(CPUARMState *env)
                         n ^= ARM_SYSCALL_BASE;
                         env->eabi = false;
                     }
+                } else {
+                    /* Failed to re-load instruction. */
+                    force_sig_fault(TARGET_SIGSEGV, 0, env->regs[15] - 4);
+                    break;
                 }
 
                 if (n > ARM_NR_BASE) {
-- 
2.43.0


