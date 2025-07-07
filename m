Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C28C83030
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 21:06:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYt0j-0004ri-Hy; Mon, 07 Jul 2025 17:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLP-0005Pp-T0
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:51 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLO-0004ML-0n
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:43 -0400
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4a44e94f0b0so47552761cf.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919701; x=1752524501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k38yCqEcXZTt8AdiQoJ4+WUqYn/DALJfBCjzKVHLCQU=;
 b=UT9Wi+7ZBusoKeyCgtlV6SNLEQUJSdJHP3ApDnOfl6O6/2wpNmv50VSjV5QBa5KtUy
 kIng/GRhbIaYStwAF+8cL6iEtdIFT0diRQ8p0Y6i/bLEGFNM37k9xT1qg8+WdkbuiH3S
 PyzdRUXdh2TAmcl70Vqkuhugji70nnTNUBNqZTH5D9qW00Nl5RB6U9+Ls+KaJBOkxEFJ
 CP68MOQphcmfoloAGzwL+EIKCCGGXKXeDJCsGzZQMD4hB/19rkdbxdNyWvPwWev5Xnw0
 Bqw5wfr53cAPNwYL5RiWYE+DmZL78SEJcBtJUEbE1yp5iq2lAJfAqE9+eHDPym+SAYVY
 QupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919701; x=1752524501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k38yCqEcXZTt8AdiQoJ4+WUqYn/DALJfBCjzKVHLCQU=;
 b=rE90VbrlUGyICSEBYrlDHxulcDuLbqYP6WkHWyRWNkojMLPePQ6POVg5Q2Ppa/ZMIn
 y9qEGoTnv8kW1cZ5HDx+mO/ukiCJ5B2s52PyFgSx9u5G1tiZIgbTkXZBaVb1z4UQy6jS
 7qlo2klr3eX/G61DQ5M6skA+KEipKiy7H/KKt/vAId9BiLXJeNwLESyYWnJJzmGx9eMO
 bd+6Wh0V/Nu2JFPxUCLaN5qpjX11lLJQEIJ46o0LpFOGgN+5Qkmg8rSLgpjuvxEGiFYh
 4Yy930h85nAPNR5TV+oWOvwY6JVWEBgXAAX9y/eybjNLnUZqQPF3SWwe4o8yuG/ZDXYt
 Qhww==
X-Gm-Message-State: AOJu0YybO+zE/3AyeUpv9cnCIKGBgOklrHWfMpLBoohJwt4BaWs1X4xi
 ruN9x/MF60Wma1hNedfCz3K827CKBYNZuZXe4l/v1vQM8oa1+eW6zon5Mm+XCZPu92Q=
X-Gm-Gg: ASbGncvlv2APta7fLNNAGQJRpjVhGYH3BkNi1wULS96BBBKkehOZWIKve/exnvnLyJ4
 o7zLnMrnJl9zC0K6dGnWDe0Vt3qs45Vfi+rpt0A+JdAFv3SIEQwIDxMJk/ZowOX0Uz/08JOhSFS
 GeSGNs7dX9SfGsxOeuKc/LryrBppR797/FCxp+VgDKq1jhwcUZX5Tan5OTzekSUYhjuahy0aKEP
 T6RnJQ/YnzSpJeXNIcR4TUt/r4c6HdSbIaOhEGLfuKpL+yUF0yZTStX/MXHl20j+85OFTrIJFfR
 NSUEBrGHMTSNV3XfZh0zi5IC3yPZVCn+l1sAf9vGT0U4SEb+12uNbeqN1BrH0iVczDVAiU8xFv0
 EhsFTkkCwRW7Jk7Mu
X-Google-Smtp-Source: AGHT+IEWlYJSpAN8GqowTVA5TQL7V4nW33kihqUK37B3dqVzar88UbfYfpDeKYf5xTjQHwGUJFrIDw==
X-Received: by 2002:a05:622a:115:b0:4a7:f7f1:4c46 with SMTP id
 d75a77b69052e-4a9ccc74a4dmr9590211cf.5.1751919700494; 
 Mon, 07 Jul 2025 13:21:40 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/20] target/arm: Convert get_phys_addr to access_perm
Date: Mon,  7 Jul 2025 14:21:05 -0600
Message-ID: <20250707202111.293787-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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

Complete the conversion of all routines in ptw.c from
MMUAccessType access_type to an access_perm bitmask.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h    | 4 ++--
 target/arm/ptw.c          | 4 ++--
 target/arm/tcg/m_helper.c | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 20b49201cb..0844048ee8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1559,7 +1559,7 @@ typedef struct GetPhysAddrResult {
  * get_phys_addr: get the physical address for a virtual address
  * @env: CPUARMState
  * @address: virtual address to get physical address for
- * @access_type: 0 for read, 1 for write, 2 for execute
+ * @access_perm: PAGE_{READ,WRITE,EXEC}, or 0
  * @memop: memory operation feeding this access, or 0 for none
  * @mmu_idx: MMU index indicating required translation regime
  * @result: set on translation success.
@@ -1579,7 +1579,7 @@ typedef struct GetPhysAddrResult {
  *    value.
  */
 bool get_phys_addr(CPUARMState *env, vaddr address,
-                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
+                   unsigned access_perm, MemOp memop, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 19e67fba67..fe005622da 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3619,7 +3619,7 @@ arm_mmu_idx_to_security_space(CPUARMState *env, ARMMMUIdx mmu_idx)
 }
 
 bool get_phys_addr(CPUARMState *env, vaddr address,
-                   MMUAccessType access_type, MemOp memop, ARMMMUIdx mmu_idx,
+                   unsigned access_perm, MemOp memop, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     S1Translate ptw = {
@@ -3627,7 +3627,7 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
         .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
     };
 
-    return get_phys_addr_gpc(env, &ptw, address, 1 << access_type,
+    return get_phys_addr_gpc(env, &ptw, address, access_perm,
                              memop, result, fi);
 }
 
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index e52ab261be..454ee187a7 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -221,7 +221,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
     int exc;
     bool exc_secure;
 
-    if (get_phys_addr(env, addr, MMU_DATA_STORE, 0, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, PAGE_WRITE, 0, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             if (mode == STACK_LAZYFP) {
@@ -310,7 +310,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
     bool exc_secure;
     uint32_t value;
 
-    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, PAGE_READ, 0, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             qemu_log_mask(CPU_LOG_INT,
@@ -2008,7 +2008,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
                       "...really SecureFault with SFSR.INVEP\n");
         return false;
     }
-    if (get_phys_addr(env, addr, MMU_INST_FETCH, 0, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, PAGE_EXEC, 0, mmu_idx, &res, &fi)) {
         /* the MPU lookup failed */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
@@ -2044,7 +2044,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     ARMMMUFaultInfo fi = {};
     uint32_t value;
 
-    if (get_phys_addr(env, addr, MMU_DATA_LOAD, 0, mmu_idx, &res, &fi)) {
+    if (get_phys_addr(env, addr, PAGE_READ, 0, mmu_idx, &res, &fi)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
             qemu_log_mask(CPU_LOG_INT,
-- 
2.43.0


