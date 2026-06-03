Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C4ECD6E56
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:31:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIK-0006wT-OY; Tue, 02 Jun 2026 23:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI6-0006it-9a
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:14 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI4-0003gP-GA
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:14 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-842319576d5so1742724b3a.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457351; x=1781062151; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iaxhRCJFjIm78Ejakhnc+/C+uEXU3BZAbpGxIvZP4bw=;
 b=RT4HRq8+kbDC/wd9lSldbTPUL7WOLW4P5k2+5knwQt35ZN+fkbsRwhViT/6fGqYsOg
 rIZ3eiNVBzLxXpZhBpRmyBoZJA7RfkAVLNAkGPYYdwK2qb275ykAO+b/36zSQ0wke4z2
 BHid/0j9MEJVZUe7lrOj1umAF3HLEq8PJUa8gNymbqG3E5HRMkqF++IyvGJ1Up1xrWmw
 /lRnJL97bKS9Pv5KYkiXZggdlkT/KGXU6zanwYnRHrpF3NIRi1Qwh+yK1jncBvCM1mqm
 e6mwd7x7fRqO8vaQBxd7nTEjIMCxVix1JZ6JCFkJVdoF6xJwnnDYNmgW9cFdEeRKNz4T
 Rxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457351; x=1781062151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iaxhRCJFjIm78Ejakhnc+/C+uEXU3BZAbpGxIvZP4bw=;
 b=BUJ+R6wmE03O0I5Hn7a6z2Tb8Xmc44Er4z4HsKEIXcjpSwKHIoYLJk/QYF2VAMp7AE
 rtDJwmqbcPFOBVFyXDB6tkJqEw9R/fW4pxZNNGSHnwd7aL/DKwkGgT8Bk9IVHFXWjQGB
 WswZGzPQVA/VEX3/xgPb7lK8Csh3KYrVLFqZHUn9pCTQ1sfYRf+Rkm0JLj7apynYu6/S
 dhxNTV0fT7hlw6JfJk/eSBoCpvUCfkEqVL7K+/tl60bGu5jgrae/KP/bjIjPZ/ZVvRP5
 2WR0bQ3W22bjCDbPbHBof71hKOEp68HYqrYbl1/A3F+kbe8VK2uj5dsU6WC3JZBeMDNP
 JwLQ==
X-Gm-Message-State: AOJu0YxD5Z3PoiCNREdCBfCfWEsjCZ4xOQmLaT9YdGlZFHUsuVZ+FPPY
 XfoVQwlDqnXx3cC/upF9J2FmLqwnfMwemQF7w4sVYeUbxy9RD6w5YFW5t/nDt9sfSexdTnp4jzb
 vUFM7pYA=
X-Gm-Gg: Acq92OHtQ4+ycSdCJi5O98MX/zs2WqmiE8axJjQ4U3xCxAXNBrRE3apkEGxynadWqBk
 kjeaj8FU+JQC2KnJgiTytPLZaV/xvKJf4avL9Dw1LaonQP5SHVdKyk2qcDmEG6zpfBHNPyI4JAU
 5mSn+/QrUf9s59/0Oug8OT30dFR9FAMM2qQlJ/JjUu1JUqqhqpJOBD5Y0ZyLbRQATbFOY90iIDE
 Tr4EFhOUbzxvioU9V6YlDUOkhXAdzDeM64zIXScg+PmfgBb88zdml49oPX3NwSD+2POrfqpbY67
 SBJGAF6M8fhHxuc6V1oLgQr8OMdTMXnJyX8LaZ4tlrzSFUfilfpLty2BeK/DzPiCBaZBO46/Jlv
 1XG5YieLMraR1MXnNiJyKTSp1WlfoSGE++H+JOBMed7DKqc+JTYNAL0pr7pos9CxD6eRX6qD9hO
 sfEGKPaVKeNBbO/K2040rUNwRht8ZWPIEQytM7jaM=
X-Received: by 2002:a05:6a00:198b:b0:842:6fce:6171 with SMTP id
 d2e1a72fcca58-84284dc5af9mr1578606b3a.3.1780457351075; 
 Tue, 02 Jun 2026 20:29:11 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 21/45] target/arm: Implement LUTI2, LUTI4 for AdvSIMD
Date: Tue,  2 Jun 2026 20:28:30 -0700
Message-ID: <20260603032855.106930-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-defs.h   |  5 ++++
 target/arm/tcg/translate-a64.c | 38 +++++++++++++++++++++++++
 target/arm/tcg/vec_helper.c    | 52 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode      |  6 ++++
 4 files changed, 101 insertions(+)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index a05f2258f2..05ccf795e8 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -1122,3 +1122,8 @@ DEF_HELPER_FLAGS_4(sme2_luti4_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(sme2_luti4_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(gvec_luti2_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_luti2_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_luti4_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_luti4_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 75be92ce15..b076605429 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5488,6 +5488,44 @@ static bool trans_TBL_TBX(DisasContext *s, arg_TBL_TBX *a)
     return true;
 }
 
+static bool do_lut_1(DisasContext *s, arg_rrx_e *a, gen_helper_gvec_3 *fn)
+{
+    if (fp_access_check(s)) {
+        gen_gvec_op3_ool(s, true, a->rd, a->rn, a->rm, a->idx, fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(LUTI2_1b, aa64_lut, do_lut_1, a, gen_helper_gvec_luti2_b)
+TRANS_FEAT(LUTI2_1h, aa64_lut, do_lut_1, a, gen_helper_gvec_luti2_h)
+TRANS_FEAT(LUTI4_1b, aa64_lut, do_lut_1, a, gen_helper_gvec_luti4_b)
+
+static bool trans_LUTI4_2h(DisasContext *s, arg_rrx_e *a)
+{
+    if (!dc_isar_feature(aa64_lut, s)) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        /*
+         * (Ab)use preg_tmp to merge two disjoint 128-bit quantities
+         * into a sequential 256-bit table.
+         */
+        QEMU_BUILD_BUG_ON(sizeof_field(CPUARMState, vfp.preg_tmp) < 32);
+        unsigned tmp_ofs = offsetof(CPUARMState, vfp.preg_tmp);
+        unsigned rn0_ofs = vec_full_reg_offset(s, a->rn);
+        unsigned rn1_ofs = vec_full_reg_offset(s, (a->rn + 1) % 32);
+
+        tcg_gen_gvec_mov(MO_64, tmp_ofs, rn0_ofs, 16, 16);
+        tcg_gen_gvec_mov(MO_64, tmp_ofs + 16, rn1_ofs, 16, 16);
+
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd), tmp_ofs,
+                           vec_full_reg_offset(s, a->rm),
+                           16, vec_full_reg_size(s),
+                           a->idx, gen_helper_gvec_luti4_h);
+    }
+    return true;
+}
+
 typedef int simd_permute_idx_fn(int i, int part, int elements);
 
 static bool do_simd_permute(DisasContext *s, arg_qrrr_e *a,
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 3231bb2100..94941aafad 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3345,3 +3345,55 @@ DO_SME2_LUT(4,4,h, 2)
 DO_SME2_LUT(4,4,s, 4)
 
 #undef DO_SME2_LUT
+
+void HELPER(gvec_luti2_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    unsigned part = simd_data(desc);
+    unsigned vl = simd_oprsz(desc);
+    unsigned elements = vl / 1;
+    unsigned ibase = elements * part;
+    ARMVectorReg scratch;
+
+    do_lut_b(&scratch, vm, vn, elements, ibase, 0, 2, 8, 1);
+    memcpy(vd, &scratch, vl);
+    clear_tail(vd, vl, simd_maxsz(desc));
+}
+
+void HELPER(gvec_luti2_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    unsigned part = simd_data(desc);
+    unsigned vl = simd_oprsz(desc);
+    unsigned elements = vl / 2;
+    unsigned ibase = elements * part;
+    ARMVectorReg scratch;
+
+    do_lut_h(&scratch, vm, vn, elements, ibase, 0, 2, 16, 1);
+    memcpy(vd, &scratch, vl);
+    clear_tail(vd, vl, simd_maxsz(desc));
+}
+
+void HELPER(gvec_luti4_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    unsigned part = simd_data(desc);
+    unsigned vl = simd_oprsz(desc);
+    unsigned elements = vl / 1;
+    unsigned ibase = elements * part;
+    ARMVectorReg scratch;
+
+    do_lut_b(&scratch, vm, vn, elements, ibase, 0, 4, 8, 1);
+    memcpy(vd, &scratch, vl);
+    clear_tail(vd, vl, simd_maxsz(desc));
+}
+
+void HELPER(gvec_luti4_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    unsigned part = simd_data(desc);
+    unsigned vl = simd_oprsz(desc);
+    unsigned elements = vl / 2;
+    unsigned ibase = elements * part;
+    ARMVectorReg scratch;
+
+    do_lut_h(&scratch, vm, vn, elements, ibase, 0, 4, 16, 1);
+    memcpy(vd, &scratch, vl);
+    clear_tail(vd, vl, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 610047846f..2d06f14e1d 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1355,6 +1355,12 @@ EXT_q           0110 1110 00 0 rm:5 0  imm:4 0 rn:5 rd:5
 
 TBL_TBX         0 q:1 00 1110 000 rm:5 0 len:2 tbx:1 00 rn:5 rd:5
 
+LUTI2_1b        0100 1110 100 rm:5 0 idx:2  100 rn:5 rd:5   &rrx_e esz=0
+LUTI2_1h        0100 1110 110 rm:5 0 idx:3   00 rn:5 rd:5   &rrx_e esz=1
+
+LUTI4_1b        0100 1110 010 rm:5 0 idx:1 1000 rn:5 rd:5   &rrx_e esz=0
+LUTI4_2h        0100 1110 010 rm:5 0 idx:2  100 rn:5 rd:5   &rrx_e esz=1
+
 # Advanced SIMD Permute
 
 UZP1            0.00 1110 .. 0 ..... 0 001 10 ..... .....   @qrrr_e
-- 
2.43.0


