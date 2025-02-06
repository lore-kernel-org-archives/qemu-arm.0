Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1789830njb;
        Thu, 6 Feb 2025 12:17:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWomyn6qE9pkL2HE543I/KrQMTq5bn0eS2dMmfKnuOdESb5DBmKeLg++XDrxc66YgEchqtHWbIjz8DXgg==@linaro.org
X-Google-Smtp-Source: AGHT+IGZnK6pvm1gR4rlazETwe2vYYK6fY2Lse6affUfyBqRCOLTvUPyy9qZcvjGBi6nyfmfCbtT
X-Received: by 2002:a05:6214:21c9:b0:6e4:2479:d59b with SMTP id 6a1803df08f44-6e445a1f182mr5111686d6.16.1738873038280;
        Thu, 06 Feb 2025 12:17:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738873038; cv=none;
        d=google.com; s=arc-20240605;
        b=V23iNS+/KbjE6qMMV8iMMDD8ZolNoyRFtLc/r1JFgXN4bMw9VrMsIXJdrHTUFVPMWV
         xmlsBK19tMmJClKz2FzSEC9grAg21u0ADJMqFTIKheazLte0ijefRgJJyOHHm3yXqn8V
         AvbOL6idCf8p2RqUmCe+/vc4kdEitmtXB6/wCXb0Hu7Fiz2n5/V7/i0woW0yGmsZTXF2
         mQaPXjy4ibruWvcg5LDDhIawR+4Fa+CpFRGJ07gBLsGotv4jzeSKs6ZUaJC1BzJms94Y
         6AyPqrSv4tacq3UgpH1i2JjmOuHHGfUTfSZHs7UbIcyzISs7UQjWRpzXiUOMCg5jNOx2
         UQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t5tothWeulc4iOgqUUgXpAmYYgjjrPRAnHt3z2eI3D8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=a/BTsiejp6JENAUoV2Xg/jKlhreXaJ8KYVgKFOSiOtJV8RX579tlRKP+kp99VQW4ik
         IrisLyDZYN/I/Q1vLboGXvJ7C2zXvaKu9vVkXCiOuQVMGwpusezuW+Ta3i7tUigydajk
         grEnGoZtmLWI7iXyJ3p2XZhWQU2evy1xLxrRADudkRgCiN9cslXJeptKlHplxB25Uc4C
         vtSd+9MNE2ej/sXfxG3CSzPYAcp8tXUGIpw2x5IodLxKCqP2C87JtPngqC1p4QqJ5NOu
         kuVRvRugNEKrzBEwv/bEGKJjdDDHlfry7fOaER7/c5Wadn0dRh2eOD6+RMRe2bz/qGE1
         MTPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IeCT3wPp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43baca0f7si17053656d6.264.2025.02.06.12.17.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:17:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IeCT3wPp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg812-0000Jq-Jy; Thu, 06 Feb 2025 14:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80T-0007MO-OM
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:49 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80P-0000cT-Md
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:49 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-21f2f09865bso25156495ad.0
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871864; x=1739476664; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t5tothWeulc4iOgqUUgXpAmYYgjjrPRAnHt3z2eI3D8=;
 b=IeCT3wPpJ7CbaFtsCx6xw74pFdSKeZ+vZHIdMimCeVgVY1udp3mjnXjSdVfLC58Tx0
 fte1gKmXNWqqaKDaTOiweTrMtYRWYuGN18WvXlp9rZ86onkWvF3SCZJBXvI8ZG174ut9
 GQCVI2m/KZ3eWYEN33sToI7pJ357UhTdp3f3YZ+MtwIZ7f7IgJMEpVtqiGWEG4EseCg5
 FjAlWNa2sdAQU9vwR87UJRcFFz7v5f9lZsbSA1SS/m/1nl/d3XHo8rDNvX/O+iajKLIU
 IZxIStU48rdnm26myIPRpB47ONqz+hfp8kgMqIYlqAOO4OIgWawqKIOhCFDvnolI67Gc
 X+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871864; x=1739476664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t5tothWeulc4iOgqUUgXpAmYYgjjrPRAnHt3z2eI3D8=;
 b=exGy8/onPvY/wsWuK8QZFBEZX9S6Mxg8SzZcNtTMUAA4d11rYZyDKLKdoKYqAeDGf3
 /lcWyTl7lECpwYBUp+m4Jaw6ncDtIXFFsBNypggotQ1tNCpk1CsarXo/nPr9h7OjSDdl
 GD9vKgqjrYhAX0X0HxVv+b1gUbkSAwZPz5waTDFy7oFCJwj1X1mBkMAhRsQnQmPNhyRS
 2bna23ChlOixnlPTXCFwidPReCwjyeZQ2oi/5c4d8wpXC/iJTHsAlin5fcL8BGtNMf4j
 WZDiAJAR00HXpRQ/K9D3y0yYC4DteqJ+Wa//KVcR+5t54/WUIsC1AdXx7mVXjJ4isUz8
 MTqA==
X-Gm-Message-State: AOJu0YynsEqXs2HkrU5IKHZXtemybAeSZdkwrudj6jWpHd/I1LM3boIy
 eDHE9UOCwA11lXL2Q6c1rGlwHQtXq+aKJ0i6MFUeLRSr1AiIHJ7PiVsaZodgyW4=
X-Gm-Gg: ASbGncuo5RrDZOZkVR4uxzUFSjScxr+gXwftRzE+1EVAG6decP/QWtGA4kD3UWXMfo3
 b7oKhpGR6FysIYOKriqZJLb+kxEJXjM2Xoyj6BfSkTVnTtWCO8ZIlEPIkW0FmGDkyhANrHReHTP
 VulWbvuGa6FgQN+Y+QrzGiqlU+kbA7LiQNF7ja+Ig0RIcEQAFTXJ8F4HrMJbnnRe+Ru91lpLFsy
 E9G/VNm5/hdhfBHjXGHyT9A/zW1FIuqZM+hmKoqTIZyHxZDVrTrM/zy56iKmUMLYEEy4SC3TF/x
 ObCMuLzjCzxRzR2cmlt2ozXMODRlzgFBaXdihNgJU1qlX6A=
X-Received: by 2002:a05:6a20:c792:b0:1e1:ad7:3282 with SMTP id
 adf61e73a8af0-1ee05290951mr420801637.7.1738871864143; 
 Thu, 06 Feb 2025 11:57:44 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 37/61] target/arm: Implemement SME2 SDOT, UDOT, USDOT, SUDOT
Date: Thu,  6 Feb 2025 11:56:51 -0800
Message-ID: <20250206195715.2150758-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: sfiWmw9y7m9B

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  6 +++
 target/arm/tcg/translate-sme.c | 85 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/vec_helper.c    | 51 ++++++++++++++++++++
 target/arm/tcg/sme.decode      | 63 ++++++++++++++++++++++++-
 4 files changed, 204 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 7ae4cddb3c..5509486aa7 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -611,6 +611,8 @@ DEF_HELPER_FLAGS_5(gvec_udot_4b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_sdot_4h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_4h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_usdot_4b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_2h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_2h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_sdot_idx_4b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
@@ -622,6 +624,10 @@ DEF_HELPER_FLAGS_5(gvec_udot_idx_4h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_usdot_idx_4b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sdot_idx_2h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_udot_idx_2h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index f4a684f6a4..d859910f93 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -895,3 +895,88 @@ static bool trans_BFVDOT(DisasContext *s, arg_azx_n *a)
                          a->idx, 2, false, FPST_ENV,
                          gen_helper_sme2_bfvdot_idx);
 }
+
+/*
+ * Expand array multi-vector single (n1), array multi-vector (nn),
+ * and array multi-vector indexed (nx), for integer accumulate.
+ *   multi: true for nn, false for n1.
+ *   data: stuff for simd_data, including any index.
+ */
+static bool do_azz_acc(DisasContext *s, int nreg, int nsel,
+                       int rv, int off, int zn, int zm,
+                       int data, int shsel, bool multi,
+                       gen_helper_gvec_4 *fn)
+{
+    if (sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int vstride = svl / nreg;
+        TCGv_ptr t_za = get_zarray(s, rv, off, nreg);
+        TCGv_ptr t = tcg_temp_new_ptr();
+
+        for (int r = 0; r < nreg; ++r) {
+            TCGv_ptr t_zn = vec_full_reg_ptr(s, zn);
+            TCGv_ptr t_zm = vec_full_reg_ptr(s, zm);
+
+            for (int i = 0; i < nsel; ++i) {
+                int o_za = (r * vstride + i) * sizeof(ARMVectorReg);
+                int desc = simd_desc(svl, svl, data | (i << shsel));
+
+                tcg_gen_addi_ptr(t, t_za, o_za);
+                fn(t, t_zn, t_zm, t, tcg_constant_i32(desc));
+            }
+
+            /*
+             * For multiple-and-single vectors, Zn may wrap.
+             * For multiple vectors, both Zn and Zm are aligned.
+             */
+            zn = (zn + 1) % 32;
+            zm += multi;
+        }
+    }
+    return true;
+}
+
+static bool do_dot(DisasContext *s, arg_azz_n *a, bool multi,
+                   gen_helper_gvec_4 *fn)
+{
+    return do_azz_acc(s, a->n, 1, a->rv, a->off, a->zn, a->zm,
+                      0, 0, multi, fn);
+}
+
+static void gen_helper_gvec_sudot_4b(TCGv_ptr d, TCGv_ptr n, TCGv_ptr m,
+                                     TCGv_ptr a, TCGv_i32 desc)
+{
+    gen_helper_gvec_usdot_4b(d, m, n, a, desc);
+}
+
+TRANS_FEAT(USDOT_n1, aa64_sme, do_dot, a, false, gen_helper_gvec_usdot_4b)
+TRANS_FEAT(SUDOT_n1, aa64_sme, do_dot, a, false, gen_helper_gvec_sudot_4b)
+TRANS_FEAT(SDOT_n1_2h, aa64_sme, do_dot, a, false, gen_helper_gvec_sdot_2h)
+TRANS_FEAT(UDOT_n1_2h, aa64_sme, do_dot, a, false, gen_helper_gvec_udot_2h)
+TRANS_FEAT(SDOT_n1_4b, aa64_sme, do_dot, a, false, gen_helper_gvec_sdot_4b)
+TRANS_FEAT(UDOT_n1_4b, aa64_sme, do_dot, a, false, gen_helper_gvec_udot_4b)
+TRANS_FEAT(SDOT_n1_4h, aa64_sme2_i16i64, do_dot, a, false, gen_helper_gvec_sdot_4h)
+TRANS_FEAT(UDOT_n1_4h, aa64_sme2_i16i64, do_dot, a, false, gen_helper_gvec_udot_4h)
+
+TRANS_FEAT(USDOT_nn, aa64_sme, do_dot, a, true, gen_helper_gvec_usdot_4b)
+TRANS_FEAT(SDOT_nn_2h, aa64_sme, do_dot, a, true, gen_helper_gvec_sdot_2h)
+TRANS_FEAT(UDOT_nn_2h, aa64_sme, do_dot, a, true, gen_helper_gvec_udot_2h)
+TRANS_FEAT(SDOT_nn_4b, aa64_sme, do_dot, a, true, gen_helper_gvec_sdot_4b)
+TRANS_FEAT(UDOT_nn_4b, aa64_sme, do_dot, a, true, gen_helper_gvec_udot_4b)
+TRANS_FEAT(SDOT_nn_4h, aa64_sme2_i16i64, do_dot, a, true, gen_helper_gvec_sdot_4h)
+TRANS_FEAT(UDOT_nn_4h, aa64_sme2_i16i64, do_dot, a, true, gen_helper_gvec_udot_4h)
+
+static bool do_dot_nx(DisasContext *s, arg_azx_n *a, gen_helper_gvec_4 *fn)
+{
+    return do_azz_acc(s, a->n, 1, a->rv, a->off, a->zn, a->zm,
+                      a->idx, 0, false, fn);
+}
+
+TRANS_FEAT(USDOT_nx, aa64_sme, do_dot_nx, a, gen_helper_gvec_usdot_idx_4b)
+TRANS_FEAT(SUDOT_nx, aa64_sme, do_dot_nx, a, gen_helper_gvec_sudot_idx_4b)
+TRANS_FEAT(SDOT_nx_2h, aa64_sme, do_dot_nx, a, gen_helper_gvec_sdot_idx_2h)
+TRANS_FEAT(UDOT_nx_2h, aa64_sme, do_dot_nx, a, gen_helper_gvec_udot_idx_2h)
+TRANS_FEAT(SDOT_nx_4b, aa64_sme, do_dot_nx, a, gen_helper_gvec_sdot_idx_4b)
+TRANS_FEAT(UDOT_nx_4b, aa64_sme, do_dot_nx, a, gen_helper_gvec_udot_idx_4b)
+TRANS_FEAT(SDOT_nx_4h, aa64_sme2_i16i64, do_dot_nx, a, gen_helper_gvec_sdot_idx_4h)
+TRANS_FEAT(UDOT_nx_4h, aa64_sme2_i16i64, do_dot_nx, a, gen_helper_gvec_udot_idx_4h)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 7904159d57..ce7f55bfc8 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -871,6 +871,57 @@ DO_DOT_IDX(gvec_usdot_idx_4b, int32_t, uint8_t, int8_t, H4)
 DO_DOT_IDX(gvec_sdot_idx_4h, int64_t, int16_t, int16_t, H8)
 DO_DOT_IDX(gvec_udot_idx_4h, uint64_t, uint16_t, uint16_t, H8)
 
+#undef DO_DOT
+#undef DO_DOT_IDX
+
+/* Similar for 2-way dot product */
+#define DO_DOT(NAME, TYPED, TYPEN, TYPEM) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                \
+    TYPED *d = vd, *a = va;                                               \
+    TYPEN *n = vn;                                                        \
+    TYPEM *m = vm;                                                        \
+    for (i = 0; i < opr_sz / sizeof(TYPED); ++i) {                        \
+        d[i] = (a[i] +                                                    \
+                (TYPED)n[i * 2 + 0] * m[i * 2 + 0] +                      \
+                (TYPED)n[i * 2 + 1] * m[i * 2 + 1]);                      \
+    }                                                                     \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                              \
+}
+
+#define DO_DOT_IDX(NAME, TYPED, TYPEN, TYPEM, HD) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i = 0, opr_sz = simd_oprsz(desc);                            \
+    intptr_t opr_sz_n = opr_sz / sizeof(TYPED);                           \
+    intptr_t segend = MIN(16 / sizeof(TYPED), opr_sz_n);                  \
+    intptr_t index = simd_data(desc);                                     \
+    TYPED *d = vd, *a = va;                                               \
+    TYPEN *n = vn;                                                        \
+    TYPEM *m_indexed = (TYPEM *)vm + HD(index) * 2;                       \
+    do {                                                                  \
+        TYPED m0 = m_indexed[i * 2 + 0];                                  \
+        TYPED m1 = m_indexed[i * 2 + 1];                                  \
+        do {                                                              \
+            d[i] = (a[i] +                                                \
+                    n[i * 4 + 0] * m0 +                                   \
+                    n[i * 4 + 1] * m1);                                   \
+        } while (++i < segend);                                           \
+        segend = i + (16 / sizeof(TYPED));                                \
+    } while (i < opr_sz_n);                                               \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                              \
+}
+
+DO_DOT(gvec_sdot_2h, int32_t, int16_t, int16_t)
+DO_DOT(gvec_udot_2h, uint32_t, uint16_t, uint16_t)
+
+DO_DOT_IDX(gvec_sdot_idx_2h, int32_t, int16_t, int16_t, H4)
+DO_DOT_IDX(gvec_udot_idx_2h, uint32_t, uint16_t, uint16_t, H4)
+
+#undef DO_DOT
+#undef DO_DOT_IDX
+
 void HELPER(gvec_fcaddh)(void *vd, void *vn, void *vm,
                          float_status *fpst, uint32_t desc)
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 7c057bcad2..338637decd 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -291,6 +291,26 @@ FDOT_n1         11000001 001 1 .... 0 .. 100 ..... 00 ...   @azz_nx1_o3 n=4
 BFDOT_n1        11000001 001 0 .... 0 .. 100 ..... 10 ...   @azz_nx1_o3 n=2
 BFDOT_n1        11000001 001 1 .... 0 .. 100 ..... 10 ...   @azz_nx1_o3 n=4
 
+USDOT_n1        11000001 001 0 .... 0 .. 101 ..... 01 ...   @azz_nx1_o3 n=2
+USDOT_n1        11000001 001 1 .... 0 .. 101 ..... 01 ...   @azz_nx1_o3 n=4
+
+SUDOT_n1        11000001 001 0 .... 0 .. 101 ..... 11 ...   @azz_nx1_o3 n=2
+SUDOT_n1        11000001 001 1 .... 0 .. 101 ..... 11 ...   @azz_nx1_o3 n=4
+
+SDOT_n1_4b      11000001 001 0 .... 0 .. 101 ..... 00 ...   @azz_nx1_o3 n=2
+SDOT_n1_4b      11000001 001 1 .... 0 .. 101 ..... 00 ...   @azz_nx1_o3 n=4
+SDOT_n1_4h      11000001 011 0 .... 0 .. 101 ..... 00 ...   @azz_nx1_o3 n=2
+SDOT_n1_4h      11000001 011 1 .... 0 .. 101 ..... 00 ...   @azz_nx1_o3 n=4
+SDOT_n1_2h      11000001 011 0 .... 0 .. 101 ..... 01 ...   @azz_nx1_o3 n=2
+SDOT_n1_2h      11000001 011 1 .... 0 .. 101 ..... 01 ...   @azz_nx1_o3 n=4
+
+UDOT_n1_4b      11000001 001 0 .... 0 .. 101 ..... 10 ...   @azz_nx1_o3 n=2
+UDOT_n1_4b      11000001 001 1 .... 0 .. 101 ..... 10 ...   @azz_nx1_o3 n=4
+UDOT_n1_4h      11000001 011 0 .... 0 .. 101 ..... 10 ...   @azz_nx1_o3 n=2
+UDOT_n1_4h      11000001 011 1 .... 0 .. 101 ..... 10 ...   @azz_nx1_o3 n=4
+UDOT_n1_2h      11000001 011 0 .... 0 .. 101 ..... 11 ...   @azz_nx1_o3 n=2
+UDOT_n1_2h      11000001 011 1 .... 0 .. 101 ..... 11 ...   @azz_nx1_o3 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
@@ -334,6 +354,23 @@ FDOT_nn         11000001 101 ...01 0 .. 100 ...00 00 ...    @azz_4x4_o3
 BFDOT_nn        11000001 101 ....0 0 .. 100 ....0 10 ...    @azz_2x2_o3
 BFDOT_nn        11000001 101 ...01 0 .. 100 ...00 10 ...    @azz_4x4_o3
 
+USDOT_nn        11000001 101 ....0 0 .. 101 ....0 01 ...    @azz_2x2_o3
+USDOT_nn        11000001 101 ...01 0 .. 101 ...00 01 ...    @azz_4x4_o3
+
+SDOT_nn_4b      11000001 101 ....0 0 .. 101 ....0 00 ...    @azz_2x2_o3
+SDOT_nn_4b      11000001 101 ...01 0 .. 101 ...00 00 ...    @azz_4x4_o3
+SDOT_nn_4h      11000001 111 ....0 0 .. 101 ....0 00 ...    @azz_2x2_o3
+SDOT_nn_4h      11000001 111 ...01 0 .. 101 ...00 00 ...    @azz_4x4_o3
+SDOT_nn_2h      11000001 111 ....0 0 .. 101 ....0 01 ...    @azz_2x2_o3
+SDOT_nn_2h      11000001 111 ...01 0 .. 101 ...00 01 ...    @azz_4x4_o3
+
+UDOT_nn_4b      11000001 101 ....0 0 .. 101 ....0 10 ...    @azz_2x2_o3
+UDOT_nn_4b      11000001 101 ...01 0 .. 101 ...00 10 ...    @azz_4x4_o3
+UDOT_nn_4h      11000001 111 ....0 0 .. 101 ....0 10 ...    @azz_2x2_o3
+UDOT_nn_4h      11000001 111 ...01 0 .. 101 ...00 10 ...    @azz_4x4_o3
+UDOT_nn_2h      11000001 111 ....0 0 .. 101 ....0 11 ...    @azz_2x2_o3
+UDOT_nn_2h      11000001 111 ...01 0 .. 101 ...00 11 ...    @azz_4x4_o3
+
 ### SME2 Multi-vector Indexed
 
 &azx_n          n off rv zn zm idx
@@ -367,7 +404,11 @@ BFMLSL_nx       11000001 1001 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_o2x2
 @azx_2x1_i2_o3  ........ .... zm:4 . .. . idx:2 .... ... off:3 \
                 &azx_n n=2 rv=%mova_rv zn=%zn_ax2
 @azx_4x1_i2_o3  ........ .... zm:4 . .. . idx:2 .... ... off:3 \
-                &azx_n n=2 rv=%mova_rv zn=%zn_ax4
+                &azx_n n=4 rv=%mova_rv zn=%zn_ax4
+@azx_2x1_i1_o3  ........ .... zm:4 . .. .. idx:1 .... ... off:3 \
+                &azx_n n=2 rv=%mova_rv zn=%zn_ax2
+@azx_4x1_i1_o3  ........ .... zm:4 . .. .. idx:1 .... ... off:3 \
+                &azx_n n=4 rv=%mova_rv zn=%zn_ax4
 
 FDOT_nx         11000001 0101 .... 0 .. 1 .. ....0 01 ...   @azx_2x1_i2_o3
 FDOT_nx         11000001 0101 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_i2_o3
@@ -377,3 +418,23 @@ BFDOT_nx        11000001 0101 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_i2_o3
 
 FVDOT           11000001 0101 .... 0 .. 0 .. ....0 01 ...   @azx_2x1_i2_o3
 BFVDOT          11000001 0101 .... 0 .. 0 .. ....0 11 ...   @azx_2x1_i2_o3
+
+SDOT_nx_2h      11000001 0101 .... 0 .. 1 .. ....0 00 ...   @azx_2x1_i2_o3
+SDOT_nx_2h      11000001 0101 .... 1 .. 1 .. ...00 00 ...   @azx_4x1_i2_o3
+SDOT_nx_4b      11000001 0101 .... 0 .. 1 .. ....1 00 ...   @azx_2x1_i2_o3
+SDOT_nx_4b      11000001 0101 .... 1 .. 1 .. ...01 00 ...   @azx_4x1_i2_o3
+SDOT_nx_4h      11000001 1101 .... 0 .. 00 . ....0 01 ...   @azx_2x1_i1_o3
+SDOT_nx_4h      11000001 1101 .... 1 .. 00 . ...00 01 ...   @azx_4x1_i1_o3
+
+UDOT_nx_2h      11000001 0101 .... 0 .. 1 .. ....0 10 ...   @azx_2x1_i2_o3
+UDOT_nx_2h      11000001 0101 .... 1 .. 1 .. ...00 10 ...   @azx_4x1_i2_o3
+UDOT_nx_4b      11000001 0101 .... 0 .. 1 .. ....1 10 ...   @azx_2x1_i2_o3
+UDOT_nx_4b      11000001 0101 .... 1 .. 1 .. ...01 10 ...   @azx_4x1_i2_o3
+UDOT_nx_4h      11000001 1101 .... 0 .. 00 . ....0 11 ...   @azx_2x1_i1_o3
+UDOT_nx_4h      11000001 1101 .... 1 .. 00 . ...00 11 ...   @azx_4x1_i1_o3
+
+USDOT_nx        11000001 0101 .... 0 .. 1 .. ....1 01 ...   @azx_2x1_i2_o3
+USDOT_nx        11000001 0101 .... 1 .. 1 .. ...01 01 ...   @azx_4x1_i2_o3
+
+SUDOT_nx        11000001 0101 .... 0 .. 1 .. ....1 11 ...   @azx_2x1_i2_o3
+SUDOT_nx        11000001 0101 .... 1 .. 1 .. ...01 11 ...   @azx_4x1_i2_o3
-- 
2.43.0

