Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp884325ejq;
        Sat, 6 May 2023 00:25:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ApZJnQniZjGWm4oF4LOGR4U0DJBwy+3tMVpqXUWbHrCwePmIWtG3TBiwUMs835+mx1viN
X-Received: by 2002:a05:622a:130a:b0:3e3:91da:488e with SMTP id v10-20020a05622a130a00b003e391da488emr6048663qtk.53.1683357906533;
        Sat, 06 May 2023 00:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683357906; cv=none;
        d=google.com; s=arc-20160816;
        b=G6rq8o64X01vqjt+NbdKEyPQ+Ef/c+3lk9+MLEMo7vXe98VjJsSqttfFyW+EL4xc2L
         bwi6u9wdNIAmgEg8bD1Bmt9ZvC3Kq8GAeJa4KsdmeB2XRG+Uz4rC1zBFY7Wigr+JzXiO
         iMH3/4X2N5A7AJ/PlgXF5ZvhYAeA+9rY6Sc82CxTtOAZ4XrAnQZXGpUrYbMR+nfsvmeX
         gdFlKOscSp02qQotnJFj4Wcb1Ktms17CdzzOIlPaQdhvpP+Gjp/zVXM/cD0CZSD/2QRc
         6mQoebRUZkRN0vW5i2MGiGFs0ObjzRww47Tm9kfUX07ceDwBz24hppTV3VXW3GlsjT/n
         CJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aucysoTI00/6AHztRhanSz7uVuWer883go2thcLlz8w=;
        b=IAjg7cH+LK7NeAn4lSwsDmCFiKlhXsrrO5kDbOmqnY07EAgjMWMd6U++MmAiRo3yfx
         xyAlXmoNkcZPzVJREW8rsHHXWVi36+NFvzs63bJ++CkCOwBf1Vq3ZJwt1bPh9IgrqhI2
         7yFErE/9gXshj3k6xYzeoL7My42l5KCOiUDrhod+7vyw0Fo2j/h3CUdRK0WOpSao6YBr
         nJA52UCxMm7X4iWZCo4XcBvm8kkOpkXTaR8yNGvIXpb+REsi1qZ2/zsia1Td8siETFlf
         q6V+ED7AsVUtUp7BETkVe7dE/CAOhW8WqLgciiUdCDEPlvZbEcyRX5jAnj7qC0nYHA4H
         KxmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6Efgxfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23-20020a05620a127700b0074a21939677si1289759qkl.222.2023.05.06.00.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 May 2023 00:25:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6Efgxfr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvCGC-0004pF-Lz; Sat, 06 May 2023 03:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGB-0004nr-2T
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFq-0004TS-4U
 for qemu-arm@nongnu.org; Sat, 06 May 2023 03:23:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so17367185e9.1
 for <qemu-arm@nongnu.org>; Sat, 06 May 2023 00:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357773; x=1685949773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aucysoTI00/6AHztRhanSz7uVuWer883go2thcLlz8w=;
 b=a6EfgxfrQs/day4wTJl+pRzIfjC2BhUEv+fwlvTKTvxtfz+bnP/6f1CKgRU8Ly7YRP
 gI3w2Ch5HpU3CcNwIBg6zoUVGB7G8eIHz73z6aMenm8/gIceTMJrPLq7kqHKbhEthY/H
 7aD1/3Ul7n5HaFuSfo4u+10X6V/qF4YrVyN7OyK4EccM0YXxUvxGIt2IczAr4HrLRmD0
 81JsevkNowl2UwkMZnI4M9rAB38CJTIzECkSsWmSh4kYHQF/F66gBpNIkunnNOQOQaRa
 i3QGq1U0pWh8EJIIjPbZ1GGyiYr0AahROPXrzOMmcJvOHRkBlN3O8wh/EOJqg0Xoe+mW
 mpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357773; x=1685949773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aucysoTI00/6AHztRhanSz7uVuWer883go2thcLlz8w=;
 b=FLdww+BWkw/BiraWm1lFfWrJfZJJyN7dgIJyeXD+/20CBJGoX8MdjEVCSjDAiVZxAS
 0pUiRpMIB5xd6zkrD0biJCPGFUp2TRAGsAv6zGbKGYkfOIg6VuOg9+LhYjSjoOir7pW6
 Us3cIs4Jm5hQHrGvKEB5k4NrD1zA9aIawQqkvKZ/dMdIpiHsUEEvBpHeeZSBZ8QVwigO
 80agolLu3SGRql0MDr/lOZIwFVtgc53C0jLNfzUbkE30HVglgww8f+zjutwx91JqLK9z
 Y98E+00lysd6uwhlcGYuVRyJLF6zQYsvZcycnVy3S4aQN+aAukPFVkxJFkmQUVpWVnB6
 WP8Q==
X-Gm-Message-State: AC+VfDz4qRoExJcckzaahuSUjOswQlVotGS+22ouU8Z0BeAY8s6BbnLo
 wm7Ho5+H3a53NTkyfZMOlf17Jw==
X-Received: by 2002:a1c:f20a:0:b0:3f1:819d:d050 with SMTP id
 s10-20020a1cf20a000000b003f1819dd050mr2735853wmc.37.1683357772694; 
 Sat, 06 May 2023 00:22:52 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v5 21/30] tcg/mips: Remove MO_BSWAP handling
Date: Sat,  6 May 2023 08:22:26 +0100
Message-Id: <20230506072235.597467-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Rx5Gzi+v8Ppv

While performing the load in the delay slot of the call to the common
bswap helper function is cute, it is not worth the added complexity.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     |   4 +-
 tcg/mips/tcg-target.c.inc | 284 ++++++--------------------------------
 2 files changed, 48 insertions(+), 240 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 2431fc5353..42bd7fff01 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -204,8 +204,8 @@ extern bool use_mips32r2_instructions;
 #define TCG_TARGET_HAS_ext16u_i64       0 /* andi rt, rs, 0xffff */
 #endif
 
-#define TCG_TARGET_DEFAULT_MO (0)
-#define TCG_TARGET_HAS_MEMORY_BSWAP     1
+#define TCG_TARGET_DEFAULT_MO           0
+#define TCG_TARGET_HAS_MEMORY_BSWAP     0
 
 #define TCG_TARGET_NEED_LDST_LABELS
 
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 022960d79a..31d58e1977 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1088,31 +1088,35 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg,
 }
 
 #if defined(CONFIG_SOFTMMU)
-static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] = {
+static void * const qemu_ld_helpers[MO_SSIZE + 1] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_SB]   = helper_ret_ldsb_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LESW] = helper_le_ldsw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
-    [MO_LEUQ] = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BESW] = helper_be_ldsw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
-    [MO_BEUQ] = helper_be_ldq_mmu,
-#if TCG_TARGET_REG_BITS == 64
-    [MO_LESL] = helper_le_ldsl_mmu,
-    [MO_BESL] = helper_be_ldsl_mmu,
+#if HOST_BIG_ENDIAN
+    [MO_UW] = helper_be_lduw_mmu,
+    [MO_SW] = helper_be_ldsw_mmu,
+    [MO_UL] = helper_be_ldul_mmu,
+    [MO_SL] = helper_be_ldsl_mmu,
+    [MO_UQ] = helper_be_ldq_mmu,
+#else
+    [MO_UW] = helper_le_lduw_mmu,
+    [MO_SW] = helper_le_ldsw_mmu,
+    [MO_UL] = helper_le_ldul_mmu,
+    [MO_UQ] = helper_le_ldq_mmu,
+    [MO_SL] = helper_le_ldsl_mmu,
 #endif
 };
 
-static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
+static void * const qemu_st_helpers[MO_SIZE + 1] = {
     [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEUQ] = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEUQ] = helper_be_stq_mmu,
+#if HOST_BIG_ENDIAN
+    [MO_UW] = helper_be_stw_mmu,
+    [MO_UL] = helper_be_stl_mmu,
+    [MO_UQ] = helper_be_stq_mmu,
+#else
+    [MO_UW] = helper_le_stw_mmu,
+    [MO_UL] = helper_le_stl_mmu,
+    [MO_UQ] = helper_le_stq_mmu,
+#endif
 };
 
 /* We have four temps, we might as well expose three of them. */
@@ -1134,7 +1138,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_ld_helper_args(s, l, &ldst_helper_param);
 
-    tcg_out_call_int(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)], false);
+    tcg_out_call_int(s, qemu_ld_helpers[opc & MO_SSIZE], false);
     /* delay slot */
     tcg_out_nop(s);
 
@@ -1164,7 +1168,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 
     tcg_out_st_helper_args(s, l, &ldst_helper_param);
 
-    tcg_out_call_int(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)], false);
+    tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     /* delay slot */
     tcg_out_nop(s);
 
@@ -1379,52 +1383,19 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc, TCGType type)
 {
-    switch (opc & (MO_SSIZE | MO_BSWAP)) {
+    switch (opc & MO_SSIZE) {
     case MO_UB:
         tcg_out_opc_imm(s, OPC_LBU, lo, base, 0);
         break;
     case MO_SB:
         tcg_out_opc_imm(s, OPC_LB, lo, base, 0);
         break;
-    case MO_UW | MO_BSWAP:
-        tcg_out_opc_imm(s, OPC_LHU, TCG_TMP1, base, 0);
-        tcg_out_bswap16(s, lo, TCG_TMP1, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        break;
     case MO_UW:
         tcg_out_opc_imm(s, OPC_LHU, lo, base, 0);
         break;
-    case MO_SW | MO_BSWAP:
-        tcg_out_opc_imm(s, OPC_LHU, TCG_TMP1, base, 0);
-        tcg_out_bswap16(s, lo, TCG_TMP1, TCG_BSWAP_IZ | TCG_BSWAP_OS);
-        break;
     case MO_SW:
         tcg_out_opc_imm(s, OPC_LH, lo, base, 0);
         break;
-    case MO_UL | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
-            if (use_mips32r2_instructions) {
-                tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
-                tcg_out_bswap32(s, lo, lo, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-            } else {
-                tcg_out_bswap_subr(s, bswap32u_addr);
-                /* delay slot */
-                tcg_out_opc_imm(s, OPC_LWU, TCG_TMP0, base, 0);
-                tcg_out_mov(s, TCG_TYPE_I64, lo, TCG_TMP3);
-            }
-            break;
-        }
-        /* FALLTHRU */
-    case MO_SL | MO_BSWAP:
-        if (use_mips32r2_instructions) {
-            tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
-            tcg_out_bswap32(s, lo, lo, 0);
-        } else {
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP0, base, 0);
-            tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_TMP3);
-        }
-        break;
     case MO_UL:
         if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64) {
             tcg_out_opc_imm(s, OPC_LWU, lo, base, 0);
@@ -1434,35 +1405,6 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     case MO_SL:
         tcg_out_opc_imm(s, OPC_LW, lo, base, 0);
         break;
-    case MO_UQ | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64) {
-            if (use_mips32r2_instructions) {
-                tcg_out_opc_imm(s, OPC_LD, lo, base, 0);
-                tcg_out_bswap64(s, lo, lo);
-            } else {
-                tcg_out_bswap_subr(s, bswap64_addr);
-                /* delay slot */
-                tcg_out_opc_imm(s, OPC_LD, TCG_TMP0, base, 0);
-                tcg_out_mov(s, TCG_TYPE_I64, lo, TCG_TMP3);
-            }
-        } else if (use_mips32r2_instructions) {
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP0, base, 0);
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP1, base, 4);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, TCG_TMP0);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, TCG_TMP1);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? lo : hi, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? hi : lo, TCG_TMP1, 16);
-        } else {
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP0, base, 0);
-            tcg_out_opc_imm(s, OPC_LW, TCG_TMP0, base, 4);
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? lo : hi, TCG_TMP3);
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? hi : lo, TCG_TMP3);
-        }
-        break;
     case MO_UQ:
         /* Prefer to load from offset 0 first, but allow for overlap.  */
         if (TCG_TARGET_REG_BITS == 64) {
@@ -1487,25 +1429,20 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     const MIPSInsn lw2 = MIPS_BE ? OPC_LWR : OPC_LWL;
     const MIPSInsn ld1 = MIPS_BE ? OPC_LDL : OPC_LDR;
     const MIPSInsn ld2 = MIPS_BE ? OPC_LDR : OPC_LDL;
+    bool sgn = opc & MO_SIGN;
 
-    bool sgn = (opc & MO_SIGN);
-
-    switch (opc & (MO_SSIZE | MO_BSWAP)) {
-    case MO_SW | MO_BE:
-    case MO_UW | MO_BE:
-        tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP0, base, 0);
-        tcg_out_opc_imm(s, OPC_LBU, lo, base, 1);
-        if (use_mips32r2_instructions) {
-            tcg_out_opc_bf(s, OPC_INS, lo, TCG_TMP0, 31, 8);
-        } else {
-            tcg_out_opc_sa(s, OPC_SLL, TCG_TMP0, TCG_TMP0, 8);
-            tcg_out_opc_reg(s, OPC_OR, lo, TCG_TMP0, TCG_TMP1);
-        }
-        break;
-
-    case MO_SW | MO_LE:
-    case MO_UW | MO_LE:
-        if (use_mips32r2_instructions && lo != base) {
+    switch (opc & MO_SIZE) {
+    case MO_16:
+        if (HOST_BIG_ENDIAN) {
+            tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP0, base, 0);
+            tcg_out_opc_imm(s, OPC_LBU, lo, base, 1);
+            if (use_mips32r2_instructions) {
+                tcg_out_opc_bf(s, OPC_INS, lo, TCG_TMP0, 31, 8);
+            } else {
+                tcg_out_opc_sa(s, OPC_SLL, TCG_TMP0, TCG_TMP0, 8);
+                tcg_out_opc_reg(s, OPC_OR, lo, lo, TCG_TMP0);
+            }
+        } else if (use_mips32r2_instructions && lo != base) {
             tcg_out_opc_imm(s, OPC_LBU, lo, base, 0);
             tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP0, base, 1);
             tcg_out_opc_bf(s, OPC_INS, lo, TCG_TMP0, 31, 8);
@@ -1517,8 +1454,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
 
-    case MO_SL:
-    case MO_UL:
+    case MO_32:
         tcg_out_opc_imm(s, lw1, lo, base, 0);
         tcg_out_opc_imm(s, lw2, lo, base, 3);
         if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn) {
@@ -1526,28 +1462,7 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
 
-    case MO_UL | MO_BSWAP:
-    case MO_SL | MO_BSWAP:
-        if (use_mips32r2_instructions) {
-            tcg_out_opc_imm(s, lw1, lo, base, 0);
-            tcg_out_opc_imm(s, lw2, lo, base, 3);
-            tcg_out_bswap32(s, lo, lo,
-                            TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64
-                            ? (sgn ? TCG_BSWAP_OS : TCG_BSWAP_OZ) : 0);
-        } else {
-            const tcg_insn_unit *subr =
-                (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I64 && !sgn
-                 ? bswap32u_addr : bswap32_addr);
-
-            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0);
-            tcg_out_bswap_subr(s, subr);
-            /* delay slot */
-            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 3);
-            tcg_out_mov(s, type, lo, TCG_TMP3);
-        }
-        break;
-
-    case MO_UQ:
+    case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, ld1, lo, base, 0);
             tcg_out_opc_imm(s, ld2, lo, base, 7);
@@ -1559,42 +1474,6 @@ static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
         }
         break;
 
-    case MO_UQ | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64) {
-            if (use_mips32r2_instructions) {
-                tcg_out_opc_imm(s, ld1, lo, base, 0);
-                tcg_out_opc_imm(s, ld2, lo, base, 7);
-                tcg_out_bswap64(s, lo, lo);
-            } else {
-                tcg_out_opc_imm(s, ld1, TCG_TMP0, base, 0);
-                tcg_out_bswap_subr(s, bswap64_addr);
-                /* delay slot */
-                tcg_out_opc_imm(s, ld2, TCG_TMP0, base, 7);
-                tcg_out_mov(s, TCG_TYPE_I64, lo, TCG_TMP3);
-            }
-        } else if (use_mips32r2_instructions) {
-            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0 + 0);
-            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 0 + 3);
-            tcg_out_opc_imm(s, lw1, TCG_TMP1, base, 4 + 0);
-            tcg_out_opc_imm(s, lw2, TCG_TMP1, base, 4 + 3);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, TCG_TMP0);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, TCG_TMP1);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? lo : hi, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? hi : lo, TCG_TMP1, 16);
-        } else {
-            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0 + 0);
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 0 + 3);
-            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 4 + 0);
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? lo : hi, TCG_TMP3);
-            tcg_out_bswap_subr(s, bswap32_addr);
-            /* delay slot */
-            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 4 + 3);
-            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? hi : lo, TCG_TMP3);
-        }
-        break;
-
     default:
         g_assert_not_reached();
     }
@@ -1627,50 +1506,16 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg datalo, TCGReg datahi,
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc)
 {
-    /* Don't clutter the code below with checks to avoid bswapping ZERO.  */
-    if ((lo | hi) == 0) {
-        opc &= ~MO_BSWAP;
-    }
-
-    switch (opc & (MO_SIZE | MO_BSWAP)) {
+    switch (opc & MO_SIZE) {
     case MO_8:
         tcg_out_opc_imm(s, OPC_SB, lo, base, 0);
         break;
-
-    case MO_16 | MO_BSWAP:
-        tcg_out_bswap16(s, TCG_TMP1, lo, 0);
-        lo = TCG_TMP1;
-        /* FALLTHRU */
     case MO_16:
         tcg_out_opc_imm(s, OPC_SH, lo, base, 0);
         break;
-
-    case MO_32 | MO_BSWAP:
-        tcg_out_bswap32(s, TCG_TMP3, lo, 0);
-        lo = TCG_TMP3;
-        /* FALLTHRU */
     case MO_32:
         tcg_out_opc_imm(s, OPC_SW, lo, base, 0);
         break;
-
-    case MO_64 | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64) {
-            tcg_out_bswap64(s, TCG_TMP3, lo);
-            tcg_out_opc_imm(s, OPC_SD, TCG_TMP3, base, 0);
-        } else if (use_mips32r2_instructions) {
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, MIPS_BE ? lo : hi);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, MIPS_BE ? hi : lo);
-            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP0, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP1, TCG_TMP1, 16);
-            tcg_out_opc_imm(s, OPC_SW, TCG_TMP0, base, 0);
-            tcg_out_opc_imm(s, OPC_SW, TCG_TMP1, base, 4);
-        } else {
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
-            tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 0);
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
-            tcg_out_opc_imm(s, OPC_SW, TCG_TMP3, base, 4);
-        }
-        break;
     case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, OPC_SD, lo, base, 0);
@@ -1679,7 +1524,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
             tcg_out_opc_imm(s, OPC_SW, MIPS_BE ? lo : hi, base, 4);
         }
         break;
-
     default:
         g_assert_not_reached();
     }
@@ -1693,54 +1537,18 @@ static void tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
     const MIPSInsn sd1 = MIPS_BE ? OPC_SDL : OPC_SDR;
     const MIPSInsn sd2 = MIPS_BE ? OPC_SDR : OPC_SDL;
 
-    /* Don't clutter the code below with checks to avoid bswapping ZERO.  */
-    if ((lo | hi) == 0) {
-        opc &= ~MO_BSWAP;
-    }
-
-    switch (opc & (MO_SIZE | MO_BSWAP)) {
-    case MO_16 | MO_BE:
+    switch (opc & MO_SIZE) {
+    case MO_16:
         tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, lo, 8);
-        tcg_out_opc_imm(s, OPC_SB, TCG_TMP0, base, 0);
-        tcg_out_opc_imm(s, OPC_SB, lo, base, 1);
+        tcg_out_opc_imm(s, OPC_SB, HOST_BIG_ENDIAN ? TCG_TMP0 : lo, base, 0);
+        tcg_out_opc_imm(s, OPC_SB, HOST_BIG_ENDIAN ? lo : TCG_TMP0, base, 1);
         break;
 
-    case MO_16 | MO_LE:
-        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, lo, 8);
-        tcg_out_opc_imm(s, OPC_SB, lo, base, 0);
-        tcg_out_opc_imm(s, OPC_SB, TCG_TMP0, base, 1);
-        break;
-
-    case MO_32 | MO_BSWAP:
-        tcg_out_bswap32(s, TCG_TMP3, lo, 0);
-        lo = TCG_TMP3;
-        /* fall through */
     case MO_32:
         tcg_out_opc_imm(s, sw1, lo, base, 0);
         tcg_out_opc_imm(s, sw2, lo, base, 3);
         break;
 
-    case MO_64 | MO_BSWAP:
-        if (TCG_TARGET_REG_BITS == 64) {
-            tcg_out_bswap64(s, TCG_TMP3, lo);
-            lo = TCG_TMP3;
-        } else if (use_mips32r2_instructions) {
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, MIPS_BE ? hi : lo);
-            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, MIPS_BE ? lo : hi);
-            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP0, TCG_TMP0, 16);
-            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP1, TCG_TMP1, 16);
-            hi = MIPS_BE ? TCG_TMP0 : TCG_TMP1;
-            lo = MIPS_BE ? TCG_TMP1 : TCG_TMP0;
-        } else {
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
-            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 0 + 0);
-            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 0 + 3);
-            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
-            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 4 + 0);
-            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 4 + 3);
-            break;
-        }
-        /* fall through */
     case MO_64:
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_opc_imm(s, sd1, lo, base, 0);
-- 
2.34.1

