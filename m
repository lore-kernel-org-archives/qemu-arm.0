Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464DACD6E4C
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:20:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrO-0000Cy-Bt; Sat, 30 May 2026 19:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrN-0000BF-0d
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:53 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrL-0007XJ-3o
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:52 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2c0c3315c5dso2097175ad.3
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182770; x=1780787570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRGosC761KgnKiRjgSsWPLQk+K1SoT9RXWS7NWkWlF0=;
 b=IK8bLFqmNL8GgWNbvwwpadDcmLAG/qE9IKHP/c4aNHtYeTBmdWYyTixYX/gm6uPiAO
 irMvjkwb39+lKwioO5HNRz0E3DmbBe4yr4/tV8jLmzDlIFpQpYNHUdXFn3LJrA0E6Dsu
 neNxnSMtNICfgtPfHX8iXUruO+a1aMemfxWkE6UgkQwRdQvXYH1lRrhDcVDV5oRYuc8y
 I+Jt+jc/CxZsxl7ENhJRtSqZeRLSmQ+N3kOCMhuh/F8THVaxzdQg6dLHpBY7T0AsPTCG
 L/6oYGRZVH8o3D1evsWIMrN5kPIhYAPtcYxsQ/kwwRstSahhPmIi6SRod+HyZ6SWhnqQ
 jmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182770; x=1780787570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VRGosC761KgnKiRjgSsWPLQk+K1SoT9RXWS7NWkWlF0=;
 b=qAmklD007ElWZe64rBtf9rJHi4hcR3zPBKYZVLB97+Vk13vQxn7pEgLVi2nESqxk78
 osUUCRz+XJvnmxYt5v5MSk5kOEvFn6R9NRmstCQ3HIBCgFTy21oD+MC5b+ST7dSwgena
 eLgSRzhaeHKeX/w0k/d79Lbzp/py3vRKO7HlPYHGEDwEE0cSm8GGOD9qGKBPM/0Jaq27
 QigQO+7nb2khyVSjEIl7TJqcvk/46CHSMh9L5EPDXgiToF0w9dAi8oLazpXFvw41Wvke
 OgyYn2zICzvBFHwMOea/Xax9hDZdmn1qyHP9OiIWzp3ljBDsqZGDtjNGdHAxNdHI3TLP
 lwiw==
X-Gm-Message-State: AOJu0YxXArZduSSJg/lVnRJPS4WP17K+nSx2zD4FWj3Dl2cO8mCmIDEc
 vi6DodpIy0j4SqZwNXgwxm34MheZuDN+lGjap051jUqy9qyjnYH5if7itZ+gkDj+6Eg=
X-Gm-Gg: Acq92OG3+bSWvaUpfhCjU+QbIAfeHdSqhUXh6NccNJkCgFFeKXXTeiExeQkKGyQriEs
 VIEsAEbM0tvuplJXJZxQOZSyOK9HtksZB0CSl/9rBwkp2uKjLbiaYa0wAhtc45wHF41hppUsnUu
 KORY+Jvk8eeooCXlk19vW3GQXvetlard40Bum1d9uO782wmgwjSlnJDzwD3UzHhw5MQIPgyfa/t
 dAo2nq6cdFYVylsLfTKG/64LOZ/j44GSn3awbZjZlQ0cPKrx9yQqJVwpPBidFRSTu0xtt7E5skl
 JmHqYu+sd9nXspPbrsJ+9MBVtzwSVauwKYDEhSEhE/h9HthuQBbdz+2sVPCkMFYl/UL/u4AVrpo
 OloGnCoCHrAP73ttAFzQkaqjtvJchFaPWX9IFbEp4yRrzEe9B8Na9Wmf5Ld80bLNxVRhihNiy7x
 MhVxhMw7nuSrzyJ5OqKc8dqkwkWtLqYEwZvPOKwiQ=
X-Received: by 2002:a05:6a21:1398:b0:398:7792:3882 with SMTP id
 adf61e73a8af0-3b427fb74b8mr5699061637.16.1780182769608; 
 Sat, 30 May 2026 16:12:49 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 17/41] target/arm: Implement LUTI2, LUTI4 for AdvSIMD
Date: Sat, 30 May 2026 16:12:05 -0700
Message-ID: <20260530231229.400441-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 91e98d28ae..cb633817d7 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3348,3 +3348,55 @@ DO_SME2_LUT(4,4,h, 2)
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


