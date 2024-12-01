Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2147996njk;
        Sun, 1 Dec 2024 07:08:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCSVfmlHktlV2Oph9HGH4GLiFHpvnTnf2s5/1gxyWJvGPmCxOlHotLMyXXB4xBREhmL9atdlU3STYOjA==@linaro.org
X-Google-Smtp-Source: AGHT+IGPmgBzGu8aVFIxKHicK3aV2Xz0wGJrY1rx033Hj6gbOOlCTIOUFhSO/q8IdXI/5ND11Gc7
X-Received: by 2002:a05:690c:6481:b0:6ee:8515:6730 with SMTP id 00721157ae682-6ef4a172c61mr128530467b3.17.1733065716702;
        Sun, 01 Dec 2024 07:08:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065716; cv=none;
        d=google.com; s=arc-20240605;
        b=G1se1GjlmYFuLzgzN96JLmb7MJc/BzCLIrymK34dQ/Vg5INBCsBsGJ66cblRF1qclI
         u814XvnzDyLgs+c0gSQlin2CHsG2cNvbYxQHq+pNdudfLDeORd4jBOgqsb7DtrMwSUVP
         ogKG3SmkXi5SYNbsHVddRYoa3RuvQmduu3G8w5nvfsF9FXslo68Ianh2S98ujpKkEuLc
         NMI7HSAbP/BVMGOgpTEjKEr/cXVVoSzIQNLl9ogeeICBDt4MqBBXGE2P9flmLS+MftZn
         WL2BH35gJsy9eyNk5OPK+d+HTNmJtLFVuu0k3sX2QuNHT1Y1l3E3TdwEUVTB4HccIA9r
         T+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K4snW5vw3tHaT/gGPavyjlOz1MpKOiCUYtevEJqmXXU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=KaMhvEUZ4IowjbfL8dbAJG6MTfIaJr7qJoKmFm6aKcyXbKya0VktnFo26ihioBVNxW
         yOe4YfJ8o+UW5Fu/KbeeBXCRdZs9Sh0DNxx8z0OOrFYWrC/vGf9KNwbJV4thAj5h1lfJ
         YiyAdMJKQIxgJFr58XKbJHoManFt28MkgKH9d8T58CU28/Eu5HYctT/LCUwZgjgMCrwW
         y+4BmRaIvaNHlPR3QfgUb3yTLBB2j1AHCsNq6OXIBldpmZM4BsUm55BIfcyEKrKP89HS
         OAoUtAR/xSFyX0GzDlTVx6z/EbjFSS65OVToJqKgvYl4HuxiIuom2cht65zZpnbS5peY
         3xAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DPy5koFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-6ef4db308d3si66355347b3.54.2024.12.01.07.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:08:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DPy5koFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHlXG-0001gS-PB; Sun, 01 Dec 2024 10:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlXA-0001cS-A0
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:52 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlX8-0004OA-Gm
 for qemu-arm@nongnu.org; Sun, 01 Dec 2024 10:06:51 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-71d4994dfbaso2323815a34.0
 for <qemu-arm@nongnu.org>; Sun, 01 Dec 2024 07:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065609; x=1733670409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K4snW5vw3tHaT/gGPavyjlOz1MpKOiCUYtevEJqmXXU=;
 b=DPy5koFfv17Ey/6gznurUI/vtcTauNWH4C6ub8m2+3ikF/Ar4E+UYJRuiSLu6+qUJH
 lSTsA2UOjhAljpf8pRWxqcZ4d42iPfZm+jSGc79N8tlRtTHoskC6IQzjN5YPli32iI7X
 Uo4n4sc5xcye4aU1791ls2Q+9uBly0ti52NerKE0ajU0ilZw6PxF/0MD0EXvU/eQKbk4
 +mP50Axt30abpdiiTO98NKqRjjMBTl9iWi4VFOoIcWpyIwBBxObBE5Q+UmSDqsq+rKFa
 fFsMObARrSa9myYhXjCz+D/HmhR4urfjvE8fVJejlC1AHKV2VYY4AoQTDJn6PxelZDWe
 /JsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065609; x=1733670409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K4snW5vw3tHaT/gGPavyjlOz1MpKOiCUYtevEJqmXXU=;
 b=UO8rJnSzEPou3P4XQDNHEv2Jjzo50syS5y2PMcFVRlvVXH9PGCVoVdfwP59Gb9OP+t
 N97e01Fgpmz5SVe4hK14ZWPwN3PrGKrYZ1Oqcw/fUHinklZLw2tCvLbYOQNIPuLB0K44
 QhQeezHsIL3xsEpPKt3mVrycYj7dd1iP4/L7eJIG5eVqt0WcRBQEQLrAkU4jZ6LwdQii
 Jzrz0o05bE8HuP8EJsXicuZw5i6k3wy8b5KRNlcYCODVjGBcWBb6CyQxHLfltLQujiht
 QZTtw5rEOWlijTLSChQW7uMh2YksWq7j671k62R33DdiitGODxJfNNR6JN1wwGxOnqfB
 i1MQ==
X-Gm-Message-State: AOJu0Ywfc0bPzRCbghLZhZzww/k9SSbuCZJfQf90lu+PPToQeIgqnK7+
 hNeEW8rAI/GzHXpMpoQahR1nv5gOkYeAyWEa/ru+YqLAN3z9pXqPODsQcS5YF1eT9N0ZjMxIrvv
 +bfM=
X-Gm-Gg: ASbGncs85Y2tk8jeP4ej+9ALe4xT3NEm9R8NYxso5kGzAQ4cUnT9847HSXuj0I0uQbi
 vbmuZcn4P3Po9WyHidn6tyQVQj65Go2Jrqk82fbaEdNwz5nc2WOby1BP2UPbp3y0wqJZkuCzuPf
 oj4Dlq+2k57O02ey3vslgNpu67E/luGijglHcCYlr2Vny5GUhRu2fASXgxvuYG5KSFcfTFE9A2w
 eX7qbwH3RBqdumHmX0jKMyXBV140vI/+8e/fw0q8av3XGcoIpX6Jq48jXDU4PnOjsQwm1ADniio
 lOO5GETbHRvMjYgAJZCk1CcAUMF8eHQg48hL
X-Received: by 2002:a05:6830:3142:b0:715:3e59:38f6 with SMTP id
 46e09a7af769-71d70c21a93mr7143189a34.8.1733065609418; 
 Sun, 01 Dec 2024 07:06:49 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 36/67] target/arm: Introduce gen_gvec_cls, gen_gvec_clz
Date: Sun,  1 Dec 2024 09:05:35 -0600
Message-ID: <20241201150607.12812-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lDra5cHlRgD+

Add gvec interfaces for CLS and CLZ operations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h      |  5 +++++
 target/arm/tcg/gengvec.c        | 35 +++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c  | 29 +++++++--------------------
 target/arm/tcg/translate-neon.c | 29 ++-------------------------
 4 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 20cd0e851c..5c6c24f057 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -578,6 +578,11 @@ void gen_gvec_umaxp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 void gen_gvec_uminp(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                     uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_cls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_clz(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz);
+
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
  */
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index f652520b65..834b2961c0 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -2358,3 +2358,38 @@ void gen_gvec_urhadd(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     assert(vece <= MO_32);
     tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &g[vece]);
 }
+
+void gen_gvec_cls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    static const GVecGen2 g[] = {
+        { .fni4 = gen_helper_neon_cls_s8,
+          .vece = MO_8 },
+        { .fni4 = gen_helper_neon_cls_s16,
+          .vece = MO_16 },
+        { .fni4 = tcg_gen_clrsb_i32,
+          .vece = MO_32 },
+    };
+    assert(vece <= MO_32);
+    tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
+}
+
+static void gen_clz32_i32(TCGv_i32 d, TCGv_i32 n)
+{
+    tcg_gen_clzi_i32(d, n, 32);
+}
+
+void gen_gvec_clz(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    static const GVecGen2 g[] = {
+        { .fni4 = gen_helper_neon_clz_u8,
+          .vece = MO_8 },
+        { .fni4 = gen_helper_neon_clz_u16,
+          .vece = MO_16 },
+        { .fni4 = gen_clz32_i32,
+          .vece = MO_32 },
+    };
+    assert(vece <= MO_32);
+    tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c519f82452..4abc786cf6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10325,6 +10325,13 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
+    case 0x4: /* CLZ, CLS */
+        if (u) {
+            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_clz, size);
+        } else {
+            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cls, size);
+        }
+        return;
     case 0x5:
         if (u && size == 0) { /* NOT */
             gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_not, 0);
@@ -10383,13 +10390,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             if (size == 2) {
                 /* Special cases for 32 bit elements */
                 switch (opcode) {
-                case 0x4: /* CLS */
-                    if (u) {
-                        tcg_gen_clzi_i32(tcg_res, tcg_op, 32);
-                    } else {
-                        tcg_gen_clrsb_i32(tcg_res, tcg_op);
-                    }
-                    break;
                 case 0x2f: /* FABS */
                     gen_vfp_abss(tcg_res, tcg_op);
                     break;
@@ -10454,21 +10454,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                         gen_helper_neon_cnt_u8(tcg_res, tcg_op);
                     }
                     break;
-                case 0x4: /* CLS, CLZ */
-                    if (u) {
-                        if (size == 0) {
-                            gen_helper_neon_clz_u8(tcg_res, tcg_op);
-                        } else {
-                            gen_helper_neon_clz_u16(tcg_res, tcg_op);
-                        }
-                    } else {
-                        if (size == 0) {
-                            gen_helper_neon_cls_s8(tcg_res, tcg_op);
-                        } else {
-                            gen_helper_neon_cls_s16(tcg_res, tcg_op);
-                        }
-                    }
-                    break;
                 default:
                 case 0x7: /* SQABS, SQNEG */
                     g_assert_not_reached();
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index 9c8829ad7d..1c89a53272 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -3120,6 +3120,8 @@ DO_2MISC_VEC(VCGT0, gen_gvec_cgt0)
 DO_2MISC_VEC(VCLE0, gen_gvec_cle0)
 DO_2MISC_VEC(VCGE0, gen_gvec_cge0)
 DO_2MISC_VEC(VCLT0, gen_gvec_clt0)
+DO_2MISC_VEC(VCLS, gen_gvec_cls)
+DO_2MISC_VEC(VCLZ, gen_gvec_clz)
 
 static bool trans_VMVN(DisasContext *s, arg_2misc *a)
 {
@@ -3227,33 +3229,6 @@ static bool trans_VREV16(DisasContext *s, arg_2misc *a)
     return do_2misc(s, a, gen_rev16);
 }
 
-static bool trans_VCLS(DisasContext *s, arg_2misc *a)
-{
-    static NeonGenOneOpFn * const fn[] = {
-        gen_helper_neon_cls_s8,
-        gen_helper_neon_cls_s16,
-        gen_helper_neon_cls_s32,
-        NULL,
-    };
-    return do_2misc(s, a, fn[a->size]);
-}
-
-static void do_VCLZ_32(TCGv_i32 rd, TCGv_i32 rm)
-{
-    tcg_gen_clzi_i32(rd, rm, 32);
-}
-
-static bool trans_VCLZ(DisasContext *s, arg_2misc *a)
-{
-    static NeonGenOneOpFn * const fn[] = {
-        gen_helper_neon_clz_u8,
-        gen_helper_neon_clz_u16,
-        do_VCLZ_32,
-        NULL,
-    };
-    return do_2misc(s, a, fn[a->size]);
-}
-
 static bool trans_VCNT(DisasContext *s, arg_2misc *a)
 {
     if (a->size != 0) {
-- 
2.43.0

