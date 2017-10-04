Received: by 10.223.197.9 with SMTP id q9csp5933505wrf;
        Wed, 4 Oct 2017 11:46:29 -0700 (PDT)
X-Received: by 10.200.15.210 with SMTP id f18mr11571806qtk.226.1507142788924;
        Wed, 04 Oct 2017 11:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507142788; cv=none;
        d=google.com; s=arc-20160816;
        b=sKvi9Oe1SBfXRlj9g2W4EyXRSKdeAi9CWbtfxbByQbOcN+KDKV97jT6vvwt+qnboeh
         c5LFoYxzPlLSHjSPkxHCY4CBa7aMHTdrwZJExI5a/nORN9Gsg/gNbuGTEirn5FeOuSE6
         f9w9t420zivcvEwEGigpwxDmYz+3Mhm72JE3W4QxnemR0Aq5PqG3ADaqgrUNQJmZTGuV
         u/x5jDRdOAXeMeM60XV6bK8gO4VAY4SYOan4BgYR5dCll5+fW9FGBDRV8sLZZo8HP8v8
         CPbdQz3cl47JXoklabg9Ts5dWB2p6Z+Cys+nfhZSxJrb2i/sl0XtDYUMdZ5KMKwGMuOY
         w7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=pRj2oq9//eDxblJgo+e78SXP2oOCErHHhmot8XsAZDo=;
        b=XAeYc2zYzu3DQ+eBkf/4PpLX17ej8gM797CVK5Qj8PVsrPXe2pLG23uCFjGMP6plXt
         kbkKkQ549G6Qmoun0v/mb1u+SkIs7rmcvt+2pu0aZqvLMMP7lGoyQdA/LpD+cTFhgrER
         C1i0ybDDhL83iKHqlyZVvQhE6k3+L6bpcmSm/tcrBRF0njAdbeceMciDX8xKVou+dgeb
         x8mXuzQN+A1F2T/QElKYJmvafme4/xStOzU6GL2xFNZJZy/zSGzA61k4Tko6jRRxo+SL
         FeVvR5zWNsgzcLKADLK0pS68EsRgDZ/3cgYSVr2JndMGoe4//cHsH1nxu1oTByGYR8iW
         dZoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GhO13mpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c135si10156739qkb.374.2017.10.04.11.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GhO13mpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzoge-0002FZ-Dr
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:46:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzods-0008Bk-J6
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodq-0002dd-SR
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:36 -0400
Received: from mail-qt0-x22f.google.com ([2607:f8b0:400d:c0d::22f]:50943)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzodq-0002dC-OB
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:34 -0400
Received: by mail-qt0-x22f.google.com with SMTP id f15so21073790qtf.7
	for <qemu-arm@nongnu.org>; Wed, 04 Oct 2017 11:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pRj2oq9//eDxblJgo+e78SXP2oOCErHHhmot8XsAZDo=;
	b=GhO13mpC2OnneBCMHmMmc+odJ2djclpP9Wr4FO3ywX0ZPQQkj/95tf6ZQHr8ujnyZu
	0ZUKwaVFTMO8tSc1bPEGqIFR5bZ/HhrEGGA3kJWwbWfhTrk5zmh/VRH7imCzQrU+s5Be
	CMh6TtuLJ8ss0WlGne2r042iXEJXbwMy1I65w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pRj2oq9//eDxblJgo+e78SXP2oOCErHHhmot8XsAZDo=;
	b=E2V7JCWa+XUNyDkQoxHIRy08e4N9Z9sinGFif894RZZ3i6OTBHMUQ5jrpJ27DMbnlD
	r/irXN+WvEbgZ/oXPSnmH3utrNzeHQNjCEMp2F+qf96lROBz5nLaBFDKdNm9mx96wTRe
	MNmJXBGQ3AeYRnlSIVO31/qcPntTt7hx8alROQBmWF792hzlJJN2QcnjPgeREUhBAE/a
	KztL/lws96se1S876gA2ytCbOzVGRJWWC0gcA9NPNxOE3FI+ijTJDR62XaFTp4Zi1uSV
	6zhelm1XOoHvMcBs2DnRKLiUfJQet/cJkZRc6qaL7SKTROYcdw/8hd7ajRd8TMuObGPH
	sGOg==
X-Gm-Message-State: AMCzsaVsM317KzGoVMFJSLWFnnuC+7jLlE/0yNF9SbUIhDx5OVqaRw47
	cYmvIpgSQneZD0ja/clA4vQ3Z0FGpYs=
X-Google-Smtp-Source: AOwi7QDMGUaLhNh/Qorxgai76c+ptb7U0SPs6obNIXKDle6y5nB28r7z6qfL7w1tlBZSpLcVnUAbrw==
X-Received: by 10.37.190.71 with SMTP id d7mr5004001ybm.443.1507142613964;
	Wed, 04 Oct 2017 11:43:33 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:16 -0400
Message-Id: <20171004184325.24157-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171004184325.24157-1-richard.henderson@linaro.org>
References: <20171004184325.24157-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22f
Subject: [Qemu-arm] [PATCH v1 03/12] target/arm: Decode aa64 armv8.1 scalar
 three same extra
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9fHKwl8rXTl2

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h         |   4 ++
 target/arm/advsimd_helper.c | 105 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c  |  90 +++++++++++++++++++++++++++++++++++++
 target/arm/Makefile.objs    |   2 +-
 4 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/advsimd_helper.c

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 64afbac59f..ec098d8337 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -350,8 +350,12 @@ DEF_HELPER_FLAGS_1(neon_rbit_u8, TCG_CALL_NO_RWG_SE, i32, i32)
 
 DEF_HELPER_3(neon_qdmulh_s16, i32, env, i32, i32)
 DEF_HELPER_3(neon_qrdmulh_s16, i32, env, i32, i32)
+DEF_HELPER_4(neon_qrdmlah_s16, i32, env, i32, i32, i32)
+DEF_HELPER_4(neon_qrdmlsh_s16, i32, env, i32, i32, i32)
 DEF_HELPER_3(neon_qdmulh_s32, i32, env, i32, i32)
 DEF_HELPER_3(neon_qrdmulh_s32, i32, env, i32, i32)
+DEF_HELPER_4(neon_qrdmlah_s32, i32, env, s32, s32, s32)
+DEF_HELPER_4(neon_qrdmlsh_s32, i32, env, s32, s32, s32)
 
 DEF_HELPER_1(neon_narrow_u8, i32, i64)
 DEF_HELPER_1(neon_narrow_u16, i32, i64)
diff --git a/target/arm/advsimd_helper.c b/target/arm/advsimd_helper.c
new file mode 100644
index 0000000000..583c2b0dce
--- /dev/null
+++ b/target/arm/advsimd_helper.c
@@ -0,0 +1,105 @@
+/*
+ *  ARM AdvSIMD Vector Operations
+ *
+ *  Copyright (c) 2017 Linaro
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "tcg/tcg-gvec-desc.h"
+
+
+#define SET_QC() env->vfp.xregs[ARM_VFP_FPSCR] |= CPSR_Q
+
+static uint16_t inl_qrdmlah_s16(CPUARMState *env, int16_t src1,
+                                int16_t src2, int16_t src3)
+{
+    /* Simplify:
+     * = ((a3 << 16) + ((e1 * e2) << 1) + (1 << 15)) >> 16
+     * = ((a3 << 15) + (e1 * e2) + (1 << 14)) >> 15
+     */
+    int32_t ret = (int32_t)src1 * src2;
+    ret = ((int32_t)src3 << 15) + ret + (1 << 14);
+    ret >>= 15;
+    if (ret != (int16_t)ret) {
+        SET_QC();
+        ret = (ret < 0 ? -0x8000 : 0x7fff);
+    }
+    return ret;
+}
+
+uint32_t HELPER(neon_qrdmlah_s16)(CPUARMState *env, uint32_t src1,
+                                  uint32_t src2, uint32_t src3)
+{
+    uint16_t e1 = inl_qrdmlah_s16(env, src1, src2, src3);
+    uint16_t e2 = inl_qrdmlah_s16(env, src1 >> 16, src2 >> 16, src3 >> 16);
+    return deposit32(e1, 16, 16, e2);
+}
+
+static uint16_t inl_qrdmlsh_s16(CPUARMState *env, int16_t src1,
+                                int16_t src2, int16_t src3)
+{
+    /* Similarly, using subtraction:
+     * = ((a3 << 16) - ((e1 * e2) << 1) + (1 << 15)) >> 16
+     * = ((a3 << 15) - (e1 * e2) + (1 << 14)) >> 15
+     */
+    int32_t ret = (int32_t)src1 * src2;
+    ret = ((int32_t)src3 << 15) - ret + (1 << 14);
+    ret >>= 15;
+    if (ret != (int16_t)ret) {
+        SET_QC();
+        ret = (ret < 0 ? -0x8000 : 0x7fff);
+    }
+    return ret;
+}
+
+uint32_t HELPER(neon_qrdmlsh_s16)(CPUARMState *env, uint32_t src1,
+                                  uint32_t src2, uint32_t src3)
+{
+    uint16_t e1 = inl_qrdmlsh_s16(env, src1, src2, src3);
+    uint16_t e2 = inl_qrdmlsh_s16(env, src1 >> 16, src2 >> 16, src3 >> 16);
+    return deposit32(e1, 16, 16, e2);
+}
+
+uint32_t HELPER(neon_qrdmlah_s32)(CPUARMState *env, int32_t src1,
+                                  int32_t src2, int32_t src3)
+{
+    /* Simplify similarly to int_qrdmlah_s16 above.  */
+    int64_t ret = (int64_t)src1 * src2;
+    ret = ((int64_t)src3 << 31) + ret + (1 << 30);
+    ret >>= 31;
+    if (ret != (int32_t)ret) {
+        SET_QC();
+        ret = (ret < 0 ? INT32_MIN : INT32_MAX);
+    }
+    return ret;
+}
+
+uint32_t HELPER(neon_qrdmlsh_s32)(CPUARMState *env, int32_t src1,
+                                  int32_t src2, int32_t src3)
+{
+    /* Simplify similarly to int_qrdmlsh_s16 above.  */
+    int64_t ret = (int64_t)src1 * src2;
+    ret = ((int64_t)src3 << 31) - ret + (1 << 30);
+    ret >>= 31;
+    if (ret != (int32_t)ret) {
+        SET_QC();
+        ret = (ret < 0 ? INT32_MIN : INT32_MAX);
+    }
+    return ret;
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a4380bbb15..182853e3bb 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7596,6 +7596,95 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(tcg_rd);
 }
 
+/* AdvSIMD scalar three same extra
+ *  31 30  29 28       24 23  22  21 20  16  15 14    11  10 9  5 4  0
+ * +-----+---+-----------+------+---+------+---+--------+---+----+----+
+ * | 0 1 | U | 1 1 1 1 0 | size | 0 |  Rm  | 1 | opcode | 1 | Rn | Rd |
+ * +-----+---+-----------+------+---+------+---+--------+---+----+----+
+ */
+static void disas_simd_scalar_three_reg_same_extra(DisasContext *s,
+                                                   uint32_t insn)
+{
+    int rd = extract32(insn, 0, 5);
+    int rn = extract32(insn, 5, 5);
+    int opcode = extract32(insn, 11, 4);
+    int rm = extract32(insn, 16, 5);
+    int size = extract32(insn, 22, 2);
+    bool u = extract32(insn, 29, 1);
+    TCGv_i32 ele1, ele2, ele3;
+    TCGv_i64 res;
+    int feature;
+
+    if (!u) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    switch (opcode) {
+    case 0x0: /* SQRDMLAH (vector) */
+    case 0x1: /* SQRDMLSH (vector) */
+        if (size != 1 && size != 2) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = ARM_FEATURE_V8_1_SIMD;
+        break;
+    default:
+        unallocated_encoding(s);
+        return;
+    }
+
+    if (!arm_dc_feature(s, feature)) {
+        unallocated_encoding(s);
+        return;
+    }
+    if (!fp_access_check(s)) {
+        return;
+    }
+
+    /* Do a single operation on the lowest element in the vector.
+     * We use the standard Neon helpers and rely on 0 OP 0 == 0
+     * with no side effects for all these operations.
+     * OPTME: special-purpose helpers would avoid doing some
+     * unnecessary work in the helper for the 16 bit cases.
+     */
+    ele1 = tcg_temp_new_i32();
+    ele2 = tcg_temp_new_i32();
+    ele3 = tcg_temp_new_i32();
+
+    read_vec_element_i32(s, ele1, rn, 0, size);
+    read_vec_element_i32(s, ele2, rm, 0, size);
+    read_vec_element_i32(s, ele3, rd, 0, size);
+
+    switch (opcode) {
+    case 0x0: /* SQRDMLAH */
+        if (size == 1) {
+            gen_helper_neon_qrdmlah_s16(ele3, cpu_env, ele1, ele2, ele3);
+        } else {
+            gen_helper_neon_qrdmlah_s32(ele3, cpu_env, ele1, ele2, ele3);
+        }
+        break;
+    case 0x1: /* SQRDMLSH */
+        if (size == 1) {
+            gen_helper_neon_qrdmlsh_s16(ele3, cpu_env, ele1, ele2, ele3);
+        } else {
+            gen_helper_neon_qrdmlsh_s32(ele3, cpu_env, ele1, ele2, ele3);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    tcg_temp_free_i32(ele1);
+    tcg_temp_free_i32(ele2);
+
+    res = tcg_temp_new_i64();
+    tcg_gen_extu_i32_i64(res, ele3);
+    tcg_temp_free_i32(ele3);
+
+    write_fp_dreg(s, rd, res);
+    tcg_temp_free_i64(res);
+}
+
 static void handle_2misc_64(DisasContext *s, int opcode, bool u,
                             TCGv_i64 tcg_rd, TCGv_i64 tcg_rn,
                             TCGv_i32 tcg_rmode, TCGv_ptr tcg_fpstatus)
@@ -11184,6 +11273,7 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x0e000800, 0xbf208c00, disas_simd_zip_trn },
     { 0x2e000000, 0xbf208400, disas_simd_ext },
     { 0x5e200400, 0xdf200400, disas_simd_scalar_three_reg_same },
+    { 0x5e008400, 0xdf208400, disas_simd_scalar_three_reg_same_extra },
     { 0x5e200000, 0xdf200c00, disas_simd_scalar_three_reg_diff },
     { 0x5e200800, 0xdf3e0c00, disas_simd_scalar_two_reg_misc },
     { 0x5e300800, 0xdf3e0c00, disas_simd_scalar_pairwise },
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 847fb52ee0..c2d32988f9 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -5,7 +5,7 @@ obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
 obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
 obj-y += translate.o op_helper.o helper.o cpu.o
-obj-y += neon_helper.o iwmmxt_helper.o
+obj-y += neon_helper.o iwmmxt_helper.o advsimd_helper.o
 obj-y += gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
 obj-y += crypto_helper.o
-- 
2.13.6

