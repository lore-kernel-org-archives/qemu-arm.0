Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E27DCD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:34:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX28H-0004aM-OL; Tue, 09 Jun 2026 15:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX24u-0005ea-PA
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:25:43 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX24r-0005WZ-9u
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:25:35 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2c0b944f6edso61101165ad.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781033083; x=1781637883; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Img4oOwlY3DSDFU9mjFNABCmRgwFxNku2eeYawsrOs=;
 b=kumGPwzM4iPPEU0kCReLWacAWyA1CFvVXE731nsVnNv/VsGqG4VOrKhtczJEkha0ky
 yfXpVF3HAgSleLhZfes6+/bg9JBSx5tvjNhbBnvp+FdwmCAjapJlTwNQ73LhuXqvldhH
 wejBTnDfBh2rvfMhp+eDMEVVdmnsC1fgnRbPTZa94tA0o6m58nM3sJx3EwjfVEb7Qs1m
 8zhD2g7C8ccUEhagUquW7NmWADJpTSZLV7JA1um4Rj02KCg0yXJ8kCgUNRFKm4oaTtXv
 yxWoLl+lisZske+Mzz8t2zMVg+GIYkn+dxzcR1VniY30jepy6YbkYyLhCkL58NfUASzP
 SrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781033083; x=1781637883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6Img4oOwlY3DSDFU9mjFNABCmRgwFxNku2eeYawsrOs=;
 b=m+vqhG0PaZCqq/YR3sX+oGwQYSNkecQlcnp9JPWLR6I/QS2/cneWGtpLzE2AvA8XNb
 Q7TyImUcHu4AwwMnyIcwiTkeg8o3Ve+JyUqFLt9856tX5tMLH7Gb2bMsx7zWW8ti83hE
 K+Mz3no5WivlKVhcOQKXvUgKtt3oik9J9mGf5LGRzEW2/mDYw925tTg7ll2wLYwlSYM7
 gSWYY/Ds1Bld6378t1thocf2APT+Vii2HzMmQ5lJOhfMfU/wbdj17QjUFYyIjglNhNFs
 PGhh9sKDyOZjm+Xs+Y7Lb6Y/4xFLYJO4AL6MLliEHOPTwSzKSa9gTx0N3WFjw06Y23XB
 FuOQ==
X-Gm-Message-State: AOJu0Yxzjz2cb24y6K7acxFKPMQZ7EjM+hsHQikMzdbOtv69SBBBh1ZM
 jcbN/0kV+/ZdxoKhHVnHAb+jNzkjUyxNAhDo22ZG6TE/nc6W7PPZ6R9fmPSSaFKmMik=
X-Gm-Gg: Acq92OGJJrNXXCCPDGyPxWm6gtlpIJAAaBVx1YwjbFZkEX0k9r/7J6foFi0SBA6IVVb
 U2PbJ32G2/yAxp6qhzJxP/n79Y7hmk4VCvlhKkRGf8Xe0vbL3X+MJk/BXxw5Wk+YfRyt/2DBg6G
 NgjvqveYCr2lT9zuiTQtJ+a+nyTnSR/JLE99SYxb6nROPx2NspEcQqNV/cBJEVkLSjbKuqc9QPM
 JFn53cH6cvDigicuKb5MzHW8YHft7SfoLkSYCEAZs59vfBeZuMTS/j6Psy58UYAmpWEMvRH1lLp
 rFEoDixckcvahbfX8lZJEPK2b1hx6YztjpR++ftaOK/o4SxN9P97XyMoavo8Qqx2Gpc1y5bw2QK
 i/LHa4nlbCG7lD9v9w8+qO+3uhu3NN8T01svG7m2Bs8aOH5ZStkVgCEKzwJkMFyeY7n2+RTOXOY
 CETgHjV/83u3sDFkUjbgVvjOtW/uP064JStGUlqtsDmg6RfJer9Q==
X-Received: by 2002:a17:902:cf05:b0:2c1:eb73:6637 with SMTP id
 d9443c01a7336-2c1eb73672amr255421055ad.8.1781033082790; 
 Tue, 09 Jun 2026 12:24:42 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164fa00b3sm212247045ad.32.2026.06.09.12.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:24:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 40/45] target/arm: Implement FMMLA (FP8 to FP32) for
 AdvSIMD
Date: Tue,  9 Jun 2026 12:21:04 -0700
Message-ID: <20260609192110.752384-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h        |  5 +++++
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 25 +++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   |  1 +
 target/arm/tcg/a64.decode        |  2 ++
 5 files changed, 35 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4629a3cf3e..1fc8db8d58 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1630,6 +1630,11 @@ static inline bool isar_feature_aa64_f8dp2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8DP2);
 }
 
+static inline bool isar_feature_aa64_f8mm8(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8MM8);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 5995d77577..3c74f02022 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -35,3 +35,5 @@ DEF_HELPER_FLAGS_5(gvec_fdot_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 
 DEF_HELPER_FLAGS_5(gvec_fdot_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_fdot_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmmla_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 065df24b84..b9d4ba3b6a 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -807,3 +807,28 @@ void HELPER(gvec_fdot_idx_hb)(void *vd, void *vn, void *vm,
 
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fmmla_sb)(void *vd, void *vn, void *vm,
+                           CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, -1);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nseg = oprsz / 16;
+    uint64_t *n = vn;
+    uint64_t *m = vm;
+    float32 *d = vd;
+
+    for (size_t seg = 0; seg < nseg; seg++, d += 4, n += 2, m += 2) {
+        float32 d0 = f8dotadd_s(n[0], m[0], 8, d[H4(0)], &ctx);
+        float32 d1 = f8dotadd_s(n[0], m[1], 8, d[H4(1)], &ctx);
+        float32 d2 = f8dotadd_s(n[1], m[0], 8, d[H4(2)], &ctx);
+        float32 d3 = f8dotadd_s(n[1], m[1], 8, d[H4(3)], &ctx);
+
+        d[H4(0)] = d0;
+        d[H4(1)] = d1;
+        d[H4(2)] = d2;
+        d[H4(3)] = d3;
+    }
+
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 83d90cfcf4..367f87f05d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7501,6 +7501,7 @@ static bool do_f8dot(DisasContext *s, arg_qrrr_e *a,
 
 TRANS_FEAT(FDOT_sb_v, aa64_f8dp4, do_f8dot, a, gen_helper_gvec_fdot_sb)
 TRANS_FEAT(FDOT_hb_v, aa64_f8dp2, do_f8dot, a, gen_helper_gvec_fdot_hb)
+TRANS_FEAT(FMMLA_sb, aa64_f8mm8, do_f8dot, a, gen_helper_gvec_fmmla_sb)
 
 static bool do_f8dot_idx(DisasContext *s, arg_qrrx_e *a,
                          gen_helper_gvec_3_ptr *fn)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index a3e404e7fe..6922e91010 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1227,6 +1227,8 @@ FMLALL_sb_v     0.00 1110 0.0 rm:5 110001 rn:5 rd:5 \
 FDOT_sb_v       0.00 1110 000 ..... 11111 1 ..... ..... @qrrr_s
 FDOT_hb_v       0.00 1110 010 ..... 11111 1 ..... ..... @qrrr_h
 
+FMMLA_sb        0110 1110 100 ..... 11101 1 ..... ..... @rrr_q1e0
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0


