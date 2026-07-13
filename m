Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1BFC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 23:04:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjPfo-000653-H9; Mon, 13 Jul 2026 19:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfn-00064E-5f
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:51 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfk-0005lz-1K
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:50 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ceb096e675so24955645ad.0
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783983767; x=1784588567; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oA0mwBBBDpOEpWGjeDqrqTBzFmtmLxWzsZ6rx392Upw=;
 b=IsPHNlPWDF/Zgu4IV8EOuZL1xfpyLjwvr18J0K8lBR94k4vAwhVJlCYl9K0kVOjP0I
 pJcP9UfPxH/4Wsv8f5swCQoyhOtfK1EPRvQ/indojrqGlMElhQTFcV1VUKHv7KLEk4Yn
 NKZBKszy1ny0dgZyifvDNEcddJie2OkgPIPDEgpoIiD/VgAhNvJXKQgV8hjakIvsnLG5
 4dIxkidm/laDUyx8E1Iwjews6VfcFuthKCC78KKsGgN4ic5mGyuxtpdDImFgWrBHaZ9V
 n1DBkjAACgT8dYVn+rAVb+SVA3FBG8peSoEwAEzpwapvE3GmhAApXqmHHnIoTLYO7ruO
 rYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783983767; x=1784588567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oA0mwBBBDpOEpWGjeDqrqTBzFmtmLxWzsZ6rx392Upw=;
 b=XkB+LRG1fvvIxNYPcZZcn2PpnOZZZGUJibaNYCDqQQjFP9Gt7zt5ZbY2RZquaEwTYe
 RLUBsAlnGYIfJ6l1a+3DJfQBtJYmTdcECLEIUw/ARaokaB9TAon+XR4jLKWVrMggzR/v
 I00/dgkJeq7YulHvsrLn4gO2VDn1fXGSRSmxKPPtQdcYs2rHY9ir74jsRGMNdJwzUb46
 ItGwz/nVBzgmw5ZE0Gund+068gaeOWOGD1nEgy0LDUv/OQJmBQ+4xeqLEonWmRt6aUfW
 YWWb4Uqr8DMNojNFFvP0xVx7TQqyuVCeDL7Iy8jSmgZiQgg/2eobTXf66PRc9lEihAiL
 1m1A==
X-Gm-Message-State: AOJu0YxqJiatesoTPoZ0B7aX/DnXD82Qp5tyT6hOliJMci+YUnq0CP7J
 EAINUA/uxFzreVZpOXB7uSJG8lPXMQH+8gGWA3npEWoU9sQTznk1GZQurGTFf52VDZBA7ZZ7qBf
 axPeE
X-Gm-Gg: AfdE7ckr2EdJp9Z3xVu62BNwIzqn1uEuVa6Up6kp4tqoSBkCCxLO6ulEk1V2N+QPT22
 VxxM0LPpTJ/Xwly4Ihbe8kmkyXttphl8DW9hHhfokE02tRnoFUKeY0I8fHwKo940Sah7PWtQG/U
 +VLAWLZ5MGKNKTqiIZX1+QTSDVJ/NAa1+tTHlAbGUzhA+KLcDfsUuyPXBChMytZtjkMBcL1lvpu
 ttuD1vLpzTgoE6ogjg+TTjHV3Ergol5LBTlJtvWJhsNgXJsW74rjPW/Rd4hbuJfX/wSLP959q8u
 InAyvldhbQCd2TGemETAG03MpkHaIJsry6EXHr3eNUfCWZp2VBjB0sFHRGjYyg5ISbE5rGmgRob
 m6RRtq6qNQ0HQ5xGfXSTtSc/xCPZvQ58zOp4Y0wmrvW887wuJXC09Ek1OjRLyxpUN2del2juzxr
 0/z1vjcRCCRMQfNyqomQ==
X-Received: by 2002:a17:902:ef0a:b0:2cc:f4d4:299f with SMTP id
 d9443c01a7336-2ce9ee16c6bmr105232375ad.27.1783983766314; 
 Mon, 13 Jul 2026 16:02:46 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf8e9csm106902965ad.24.2026.07.13.16.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 16:02:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/10] target/arm: Implement FTMOPA (non-widening, FP32)
Date: Mon, 13 Jul 2026 16:02:35 -0700
Message-ID: <20260713230244.70174-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713230244.70174-1-richard.henderson@linaro.org>
References: <20260713230244.70174-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
 target/arm/cpu-features.h        |  5 ++++
 target/arm/tcg/helper-sme-defs.h |  2 ++
 target/arm/tcg/sme_helper.c      | 49 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   | 26 +++++++++++++++++
 target/arm/tcg/sme.decode        | 10 +++++++
 5 files changed, 92 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index fb5ed25ad0..6370c03e2a 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1590,6 +1590,11 @@ static inline bool isar_feature_aa64_sme_mop4(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMOP4);
 }
 
+static inline bool isar_feature_aa64_sme_tmop(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, STMOP);
+}
+
 static inline bool isar_feature_aa64_ssve_aes(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, AES);
diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 7fc7129e54..8107eb40af 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -404,3 +404,5 @@ DEF_HELPER_FLAGS_4(sme_usmop4a_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_usmop4s_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_usmop4a_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_usmop4s_dh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sme_ftmopa_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 23bb816b6a..571b0add34 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2636,6 +2636,49 @@ void sme_mop4(void *vza, void *vzn, void *vzm, void *fn_opaque,
     }
 }
 
+/*
+ * Sparse outer product, non-widening.  ESZ in {16, 32}.
+ */
+static void sme_tmop(void *vza, void *vzn, void *vzm, uint64_t *zk,
+                     void *fn_opaque, uint32_t desc, MemOp esz,
+                     void (*fn)(void *, void *, void *, void *))
+{
+    intptr_t oprsz = simd_maxsz(desc);
+    intptr_t index = simd_data(desc);
+    intptr_t esize = 1 << esz;
+    intptr_t host_adj = HOST_BIG_ENDIAN ? 8 - esize : 0;
+    /* Base in bits for op3[index*:csize], csize = (VL * 2) / esize. */
+    intptr_t ctrl_base = index * oprsz * 2;
+    /* Create a zero for use with the largest esz. */
+    uint32_t zero = 0;
+
+    for (intptr_t row = 0; row < oprsz; row += esize) {
+        void *vza_row = vza + tile_vslice_offset(row);
+
+        for (intptr_t col = 0; col < oprsz; col += esize) {
+            void *e2 = vzm + (col ^ host_adj);
+            void *e3 = vza_row + (col ^ host_adj);
+
+            /*
+             * Two control bits select one element:
+             *   Zn[row], if [0] is set,
+             *   Zn+1[row], if [1] is set,
+             *   0, otherwise.
+             * Compute the address of that element.
+             */
+            void *e1 = &zero;
+            uint64_t this_ctrl = extractn(zk, (ctrl_base + 2 * col) >> esz, 2);
+            if (this_ctrl) {
+                e1 = vzn + (row ^ host_adj);
+                if (!(this_ctrl & 1)) {
+                    e1 += sizeof(ARMVectorReg);
+                }
+            }
+            fn(e3, e1, e2, fn_opaque);
+        }
+    }
+}
+
 static void inner_fmop4a_hh(void *vd, void *vn, void *vm, void *vinfo)
 {
     float16 *d = vd, *n = vn, *m = vm;
@@ -2692,6 +2735,12 @@ void HELPER(sme_fmop4a_ss)(void *vza, void *vzn, void *vzm,
     sme_mop4(vza, vzn, vzm, fpst, desc, sizeof(float32), inner_fmop4a_ss);
 }
 
+void HELPER(sme_ftmopa_ss)(void *vza, void *vzn, void *vzm, void *vzk,
+                           float_status *fpst, uint32_t desc)
+{
+    sme_tmop(vza, vzn, vzm, vzk, fpst, desc, MO_32, inner_fmop4a_ss);
+}
+
 static void inner_fmop4s_ss(void *vd, void *vn, void *vm, void *vinfo)
 {
     float32 *d = vd, *n = vn, *m = vm;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index dcc4690fba..36a0b00089 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -31,6 +31,12 @@
  * Include the generated decoder.
  */
 
+static int expand_tmop_zk(DisasContext *s, int x)
+{
+    /* Pseudocode for 1:K:1:zk. */
+    return 0b10100 | ((x & 4) << 1) | (x & 3);
+}
+
 #include "decode-sme.c.inc"
 
 static bool sme2_zt0_enabled_check(DisasContext *s)
@@ -2132,3 +2138,23 @@ TRANS_FEAT(USMOP4_sb, aa64_sme_mop4, do_mop4_int, a, MO_32,
            a->s ? gen_helper_sme_usmop4s_sb : gen_helper_sme_usmop4a_sb)
 TRANS_FEAT(USMOP4_dh, aa64_sme_mop4_i16i64, do_mop4_int, a, MO_64,
            a->s ? gen_helper_sme_usmop4s_dh : gen_helper_sme_usmop4a_dh)
+
+static bool do_tmop_fp(DisasContext *s, arg_tmop *a, MemOp esz,
+                       int e_fpst, gen_helper_gvec_4_ptr *fn)
+{
+    if (sme_smza_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        uint32_t desc = simd_desc(svl, svl, a->idx);
+        TCGv_ptr za = get_tile(s, esz, a->zad);
+        TCGv_ptr zn = vec_full_reg_ptr(s, a->zn);
+        TCGv_ptr zm = vec_full_reg_ptr(s, a->zm);
+        TCGv_ptr zk = vec_full_reg_ptr(s, a->zm);
+        TCGv_ptr fpst = (e_fpst >= 0 ? fpstatus_ptr(e_fpst) : tcg_env);
+
+        fn(za, zn, zm, zk, fpst, tcg_constant_i32(desc));
+    }
+    return true;
+}
+
+TRANS_FEAT(FTMOPA_ss, aa64_sme_tmop, do_tmop_fp,
+           a, MO_32, FPST_ZA, gen_helper_sme_ftmopa_ss)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 53e7e67feb..0250177d0d 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1131,3 +1131,13 @@ UMOP4_dh        1010 0001 111. ...0 0000 00.. ..0. 1...         @mop4_o3
 
 USMOP4_sb       1000 0001 000. ...0 1000 00.. ..0. 00..         @mop4_o2
 USMOP4_dh       1010 0001 110. ...0 0000 00.. ..0. 1...         @mop4_o3
+
+# SME TMOP Sparse outer products
+
+&tmop           zad zn zm zk idx
+%tmop_zk        10:3 !function=expand_tmop_zk
+
+@tmop_o2        .... .... ... zm:5 ... ... .... idx:2 .. zad:2 \
+                &tmop zn=%zn_ax2 zk=%tmop_zk
+
+FTMOPA_ss       1000 0000 010 ..... 000 ... .... .. 00 ..       @tmop_o2
-- 
2.43.0


