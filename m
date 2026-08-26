Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F227C61DC4
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:46:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHeZ-0000un-T1; Wed, 26 Aug 2026 13:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHe5-0000D2-IF
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:47 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHe3-0004rg-Jw
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:41 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-84e84a6c4bfso156880b3a.1
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766158; x=1788370958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v3/VH7Uko7suWCk8xeOeaPamGriSltUtLV9H0PDuAFM=;
 b=keDkPDXYCHWCsOqQxIsds2vvgooA39ncG29CTmeUzahpO6Y9ith3+FFKuZmeiQ0m7E
 DzCLpjAZBQudz3pYfgF0P23rABtVr97NvKwvl207Q7vA6leXM8YbyyR/9/jhkIxZqCa0
 jt69QQfuXa+sURJlB8qYGw4SvVhE9bHxJkN+SN51OUwqgOEpqEr8Y9Re+yniSLrSiUqa
 zqdiCnFvi5vwIgf77STvXghY07uMXmFueO4epTE89wglqM1CjRuIHB5o5XocWWTmZQlZ
 LmGV12GXXaNIGhmvJMZc4VpFOoJxt1oyk8ELsADPatGJELkye7fCJBaj8q1XhJTDpx5w
 3v7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766158; x=1788370958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=v3/VH7Uko7suWCk8xeOeaPamGriSltUtLV9H0PDuAFM=;
 b=IaVDq3sHuju20dYOOpI2/Wu2yarTOS8CDXSF+HsBON0JNP1NYi+n1MrInKqz5wvhyi
 51CGgSnOGucYU2vPxB77a/FDUCdA/1x/WypESPK/9hlUL/ziCALClfwhSIoBQMYIbOde
 Y07dZg226WryoxhRLv9REBq9TF1j0vRYKfZuoBElF0BUZ3869LxIMtHMOKcvFLpfjHNe
 7qM8EUacTYRTdFH0ZfCVkUCClDomO4b/ZPHGlCACzilLvP+7wnd4YHS4wdS8nAJE27h2
 LoqmR1lJuI0JOfcXrLVIhA31Skz9+7eND5PsEl/p5NLZxokw7G0nT7kCM2llVDLXa4Sh
 RecA==
X-Gm-Message-State: AFuF++nwmTPgnSi6mT/I4sLlgT56tgY5Okr8hon7Re/hg2uhsUJY2rS3
 dZRJRli0F5f5junU0sra9qDV5qS67ZZ+1pI6zow79zYms9S6EzZ1jzUh5LLDLuUghd4=
X-Gm-Gg: AR+sD13tPFwFIaGJHD3MNh5Lsk0xEqcOSfkhscA3KUWqlstMyDXIG3fgiFogXmYbvcG
 R4fBaqU4lLKQZFdIZIIYkJq6KTNsqmkPq9GNmsW3dSILii8NlZmn0c3hwQKXDSv1429rAHyJsso
 SN+IaXIBvcgvK4NL9Z0oHFR4n440oiWfFmfC1GipxGQSJeO6z7Tka/mnLLqAbVp/jk+OZNaF47X
 RQzhl0h7PLQ9bFgsmvHaRzsvhdnlsXqYTA7/ur30CtmO0dQLF7bFoT2dWO4AoMMTd4IFQR9whd2
 XuXJO1UPrRVjBAhwxy7Ln9gnllVUxJzUqFx9r1pnsWgDEZ6R8SxqQyQNdRzOuXwoxGiQCmJVgIF
 gPUnaoN2HKkxoT/1nWmusifZitN+q7qSHnQ2UQ52IFszNdG4pvUGaCtjOx3xPYAk7L2e9u1kh0/
 QlUhZyjtn4kuc/hVg5vsNVbi76TP0I5OJulvYhLMp8/RxFyeFCnQ9csMVxLk4SC33PXPDfh1Fdp
 rJvMOVurRvY4GQyTw==
X-Received: by 2002:a05:6a00:1404:b0:848:4c3a:a359 with SMTP id
 d2e1a72fcca58-854c930ffddmr876187b3a.19.1787766158063; 
 Wed, 26 Aug 2026 10:42:38 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 20/25] target/arm: Implement AESE (indexed)
Date: Wed, 26 Aug 2026 10:42:07 -0700
Message-ID: <20260826174213.614571-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      |  5 ++++
 target/arm/tcg/helper-defs.h   |  2 ++
 target/arm/tcg/crypto_helper.c | 55 ++++++++++++++++++++++++----------
 target/arm/tcg/translate-sve.c | 35 ++++++++++++++++++++++
 target/arm/tcg/sve.decode      | 13 ++++++--
 5 files changed, 92 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index d3130fbe671..cfbe39394f1 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1539,6 +1539,11 @@ static inline bool isar_feature_aa64_sve_pmull128(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, AES) >= 2;
 }
 
+static inline bool isar_feature_aa64_sve_aes2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, AES) >= 3;
+}
+
 static inline bool isar_feature_aa64_sve_bitperm(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, BITPERM) != 0;
diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index 42376af2c68..9b320b5c97e 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -461,6 +461,8 @@ DEF_HELPER_FLAGS_4(crypto_aesd, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(crypto_aesimc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(crypto_aese_idx, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(crypto_sha1su0, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(crypto_sha1c, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(crypto_sha1p, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index 11977cb7723..27b5813b6d9 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -47,6 +47,27 @@ static void clear_tail_16(void *vd, uint32_t desc)
 
 static const AESState aes_zero = { };
 
+static void aese_kernel(AESState *ad, const AESState *st, const AESState *rk)
+{
+    AESState t;
+
+    /*
+     * Our uint64_t are in the wrong order for big-endian.
+     * The Arm AddRoundKey comes first, while the API AddRoundKey
+     * comes last: perform the xor here, and provide zero to API.
+     */
+    if (HOST_BIG_ENDIAN) {
+        t.d[0] = st->d[1] ^ rk->d[1];
+        t.d[1] = st->d[0] ^ rk->d[0];
+        aesenc_SB_SR_AK(&t, &t, &aes_zero, false);
+        ad->d[0] = t.d[1];
+        ad->d[1] = t.d[0];
+    } else {
+        t.v = st->v ^ rk->v;
+        aesenc_SB_SR_AK(ad, &t, &aes_zero, false);
+    }
+}
+
 void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
@@ -55,27 +76,29 @@ void HELPER(crypto_aese)(void *vd, void *vn, void *vm, uint32_t desc)
         AESState *ad = (AESState *)(vd + i);
         AESState *st = (AESState *)(vn + i);
         AESState *rk = (AESState *)(vm + i);
-        AESState t;
 
-        /*
-         * Our uint64_t are in the wrong order for big-endian.
-         * The Arm AddRoundKey comes first, while the API AddRoundKey
-         * comes last: perform the xor here, and provide zero to API.
-         */
-        if (HOST_BIG_ENDIAN) {
-            t.d[0] = st->d[1] ^ rk->d[1];
-            t.d[1] = st->d[0] ^ rk->d[0];
-            aesenc_SB_SR_AK(&t, &t, &aes_zero, false);
-            ad->d[0] = t.d[1];
-            ad->d[1] = t.d[0];
-        } else {
-            t.v = st->v ^ rk->v;
-            aesenc_SB_SR_AK(ad, &t, &aes_zero, false);
-        }
+        aese_kernel(ad, st, rk);
     }
     clear_tail(vd, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(crypto_aese_idx)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t opr_sz = simd_oprsz(desc);
+    intptr_t idx = simd_data(desc);
+    void *vm_idx = vm + idx * 16;
+    intptr_t s = opr_sz - 16;
+
+    do {
+        intptr_t base = ROUND_DOWN(s, 4 * 16);
+        AESState rk = *(AESState *)(vm_idx + base);
+        do {
+            aese_kernel(vd + s, vn + s, &rk);
+            s -= 16;
+        } while (s >= base);
+    } while (s > 0);
+}
+
 void HELPER(crypto_aesd)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 8a5903da4fc..9ce172dd939 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8310,6 +8310,41 @@ TRANS_FEAT_NONSTREAMING(SM4EKEY, aa64_sve_sm4, gen_gvec_ool_arg_zzz,
 TRANS_FEAT_STREAMING_IF(RAX1, aa64_sve_sha3, aa64_sme2p1,
                         gen_gvec_fn_arg_zzz, gen_gvec_rax1, a)
 
+static bool do_aes2_idx(DisasContext *s, arg_rx_n *a, gen_helper_gvec_3 *fn)
+{
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        int overlap = -1;
+        int index, mofs;
+
+        if (vsz == 16) {
+            index = 0;
+        } else if (vsz == 32) {
+            index = a->index % 2;
+        } else {
+            index = a->index;
+        }
+
+        mofs = vec_full_reg_offset(s, a->rm);
+
+        for (int i = 0, n = a->n; i < n; i++) {
+            int dofs = vec_full_reg_offset(s, a->rdn + i);
+            if (dofs == mofs) {
+                overlap = i;
+            } else {
+                tcg_gen_gvec_3_ool(dofs, dofs, mofs, vsz, vsz, index, fn);
+            }
+        }
+        if (overlap >= 0) {
+            tcg_gen_gvec_3_ool(mofs, mofs, mofs, vsz, vsz, index, fn);
+        }
+    }
+    return true;
+}
+
+TRANS_FEAT_STREAMING_IF(AESE_idx, aa64_sve_aes2, aa64_ssve_aes,
+                        do_aes2_idx, a, gen_helper_crypto_aese_idx)
+
 TRANS_FEAT(FCVTNT_sh_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtnt_sh, a, 0, FPST_A64)
 TRANS_FEAT(FCVTNT_sh_z, aa64_sme2p2_or_sve2p2, gen_gvec_fpst_arg_zpz,
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index ed19ae237f4..64e0dd0eae9 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -60,6 +60,8 @@
 # as propagated via the MOVPRFX instruction.
 %reg_movprfx    0:5
 
+%zd_ax2         1:4 !function=times_2
+%zd_ax4         2:3 !function=times_4
 %rn_ax2         6:4 !function=times_2
 
 %pnd            0:3 !function=plus_8
@@ -70,6 +72,7 @@
 # when creating helpers common to those for the individual
 # instruction patterns.
 
+&rx_n           rdn rm index n
 &rr_esz         rd rn esz
 &rri            rd rn imm
 &rr_dbm         rd rn dbm
@@ -1974,6 +1977,14 @@ AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
 AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
 SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 
+@aes2_2         ........ .. . index:2 0........ rm:5 ..... \
+                &rx_n n=2 rdn=%zd_ax2
+@aes2_4         ........ .. . index:2 1........ rm:5 ..... \
+                &rx_n n=4 rdn=%zd_ax4
+
+AESE_idx        01000101 00 1 .. .10111010 ..... ....0   @aes2_2
+AESE_idx        01000101 00 1 .. .10111010 ..... ...00   @aes2_4
+
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
@@ -2078,8 +2089,6 @@ FCLAMP          01100100 .. 1 ..... 001001 ..... .....          @rda_rn_rm
 &zcrr_ldst      rd png rn rm esz nreg
 &zcri_ldst      rd png rn imm esz nreg
 %png            10:3 !function=plus_8
-%zd_ax2         1:4 !function=times_2
-%zd_ax4         2:3 !function=times_4
 
 LD1_zcrr        10100000000 rm:5 0 esz:2 ... rn:5 .... - \
                 &zcrr_ldst %png rd=%zd_ax2 nreg=2
-- 
2.53.0


