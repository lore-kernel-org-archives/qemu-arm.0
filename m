Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1777928njb;
        Thu, 6 Feb 2025 11:59:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNDjVIA+fkYvr8sgGIIi0KZdH4lIEDzySfhA3eRlwAmDqFZVKYy+C9+/zNdcmPob8WV+IEIGA1bP4Oew==@linaro.org
X-Google-Smtp-Source: AGHT+IEYHT1LUKvewgRJz0Bk74XtlQsjKcZ4rmsLDNBJzBzc7i6IwyLMUUyqlDe7rVJmy9QsT1CO
X-Received: by 2002:a05:620a:1929:b0:7ac:c348:6a52 with SMTP id af79cd13be357-7c047c45ea4mr71399085a.34.1738871978231;
        Thu, 06 Feb 2025 11:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738871978; cv=none;
        d=google.com; s=arc-20240605;
        b=KQId04cips/tlUs1mX+TMd2Av8gftdT+tL2o9u03e7QzB2H0CLZJIT5UtEFbt9bJpF
         aE7TcDwR0Pr1OBYHlFFf6QOPrfPG7ySCpNC+QOv+FS/0WiNHJJ5rAZRmfCgjm2elH/uc
         4AixtEZizsex7Eug5GqgzqHmAl12KqZdQ8BbDCQrnqKGpyDGRvqogJjutUrWC5ae6E/j
         TKVPmMCYdm5eqyvTDLDTTddqJHnDhPacolkl64nBZSELA+1N6IFD86wZOYv4CGBgnAnq
         Xt/5DAVh+Xy0XU3RJd4gNLWUzyrVoiqPxe7uepsGtvzkIehy/pkSFmt6Deaj5L/BqhnS
         iEYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=onyfaS/qeSodPOrSH4ti4NiA3Ykvxfxv/LxeH0L1qJs=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=CaTOTfj+EqKkgaGWuZFA6IqmutESq4ASYxNAFbPOrtknxea35JePyA6VbqEW1o5IDd
         lDM/E2/1HO6RV9h9/gFEmBssrRVZIkWhRxwe3FQ2aJg6idNiv+hwVLbnOdouVxTVdgl5
         lWGY6l/+q29UdSzZNY4EtnWkTzcoe8UEN/zHFaU3LPQiyJ9zJFc1UrJLw70WSzD4NuHQ
         Yc7IHfObmWt0V2oI8hmIwV9LI670t6eGVmIYDThqLZOhSPLBUy90Ha+gtZNwU+Tk+jKM
         sIILit77L7zYzvUkOadXAHFL9tKB3EcEr+O2Bm3A+s4aISFUFQvicQ0BeW1PXHXenfka
         PP1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QO1R43I5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041e94a81si173360185a.222.2025.02.06.11.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 11:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QO1R43I5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80v-00005Q-IQ; Thu, 06 Feb 2025 14:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80S-0007KB-9g
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:48 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg80O-0000bb-VL
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:48 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-21f50895565so205615ad.2
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871862; x=1739476662; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onyfaS/qeSodPOrSH4ti4NiA3Ykvxfxv/LxeH0L1qJs=;
 b=QO1R43I58AeBbdbC/EFxrGAErCHxkkBx8jn56+dzz5nft9D9Ig7TF4NPAamnz2LNun
 24YO86HA94Oqe1OOGqFxlG42icfcCYlbNaI7ATQ1cs4Qacmb8QkWncPh0JX1OjtEvya3
 VBXOHGlRR/+GnZNMeQmMqycDqcEGwq5WL2yaxmPd0IZICxPcWpq+pj8FyRVHSJYq1a2Q
 3yclzRf/J1suGPmHuvVQD/dQu9wdUVY+lAD7q7DX7XlLpxryYmT87czVHDimne2S5+lG
 LGY/oAsgjWLqOxzqIQCgN8yMWVHfLZ/h83L/5n1u68K49T736wGpWyZHm4LY+T/1ca6h
 3wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871862; x=1739476662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onyfaS/qeSodPOrSH4ti4NiA3Ykvxfxv/LxeH0L1qJs=;
 b=OdoYVsgEWqlhMawg/CNiEg24jBUrK4yQK5iT0M3k/BpqzfpemaS4B/lLGoFBTv8R5A
 Nd5pmyB1tEdCwfyNej46ptMbjq6zrYfq05MkzdYQs90Iqs4FUuJEWr9k7XWgaffFi8kw
 lkXdVHrv3VBCTIJG3iPuIyUVDXcOrtVytGmIGOwxDtzI9i8iJ0Y111r36YTsrB9OUUac
 Pyshn8tqMpUD5x8JrjSIPNdEPM82IJfij2CgJpufWQoWrmYXstNacecJAppoUIy4g/cj
 fpXM9xS19OvzANDBpObdie/TBRKQEcdCcSAOzcI5rI0Vv0Jre1nS1yfa/ddUaC5jg5r/
 u6rQ==
X-Gm-Message-State: AOJu0Yw1P4wEo37r6TEsWCAArYpc/SrM+FSU5tiE6gfYBZbhhvgP8LeH
 3DarjZrSW0Z7NuWYQJMJsiHEo48Yxjd2TLByhTqNlmrLnqlGG7WC5vAJ0LjPuT5Et6BVhfRvJz3
 /
X-Gm-Gg: ASbGncue4StY4cuzeBwjrS2klPHXGJJGlshyH1xs64Xe3FY95WWVmprhijitCzLc/9r
 Yom2etnY0tq69GiP0PVVxweZouTjqSCL++t9iNHWlE2TCwxlpim4Shjy4xK5ynvv7uMvo2Scw/O
 wmCU5wScTptgxBLHENQleMa9Dp+ZkdFpQUFkPW2tWgBmL3rubjC0cpaBtzBn+I+chnLQy27pPIw
 MvFZx7mtHV9RciDv4KbJ6LEEXjKnTGdmkSLga2iE7Uz7knPNqzAvDajs8vpLCkZitCZW1fVIkcm
 f/cJo0O+5jK87DD49KK3e0Bb+9xcwnXACCQR3FrPiwY0v/4=
X-Received: by 2002:a05:6a21:3389:b0:1e1:ac71:2b6a with SMTP id
 adf61e73a8af0-1ee03b0c38bmr1238761637.28.1738871862067; 
 Thu, 06 Feb 2025 11:57:42 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 34/61] target/arm: Implement SME2 FVDOT, BFVDOT
Date: Thu,  6 Feb 2025 11:56:48 -0800
Message-ID: <20250206195715.2150758-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tLuqSGGGRbl7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  2 ++
 target/arm/tcg/helper-sme.h    |  2 ++
 target/arm/tcg/sme_helper.c    | 30 ++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c | 16 ++++++++++++++
 target/arm/tcg/vec_helper.c    | 39 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sme.decode      |  3 +++
 6 files changed, 92 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0907505839..e64ddd68b2 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1079,6 +1079,8 @@ DEF_HELPER_FLAGS_6(gvec_bfdot, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_6(gvec_bfdot_idx, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_6(sme2_bfvdot_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_6(gvec_bfmmla, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/helper-sme.h b/target/arm/tcg/helper-sme.h
index ec93ff57ff..8f5a1b3c90 100644
--- a/target/arm/tcg/helper-sme.h
+++ b/target/arm/tcg/helper-sme.h
@@ -178,3 +178,5 @@ DEF_HELPER_FLAGS_6(sme2_fdot_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_6(sme2_fdot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_6(sme2_fvdot_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 18b17e9fb2..6fb7e6b306 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1166,6 +1166,36 @@ void HELPER(sme2_fdot_idx_h)(void *vd, void *vn, void *vm, void *va,
     }
 }
 
+void HELPER(sme2_fvdot_idx_h)(void *vd, void *vn, void *vm, void *va,
+                              CPUARMState *env, uint32_t desc)
+{
+    intptr_t i, j, oprsz = simd_maxsz(desc);
+    intptr_t elements = oprsz / sizeof(float32);
+    intptr_t eltspersegment = MIN(4, elements);
+    int idx = extract32(desc, SIMD_DATA_SHIFT, 2);
+    int sel = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    float_status fpst_odd, *fpst_std, *fpst_f16;
+    float32 *d = vd, *a = va;
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint32_t *m = (uint32_t *)vm + H4(idx);
+
+    fpst_std = &env->vfp.fp_status[FPST_ZA];
+    fpst_f16 = &env->vfp.fp_status[FPST_ZA_F16];
+    fpst_odd = *fpst_std;
+    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
+
+    for (i = 0; i < elements; i += eltspersegment) {
+        uint32_t mm = m[i];
+        for (j = 0; j < eltspersegment; ++j) {
+            uint32_t nn = n0[i + H2(2 * j + sel)]
+                        | (n1[i + H2(2 * j + sel)] << 16);
+            d[i + H4(j)] = f16_dotadd(a[i + H4(j)], nn, mm,
+                                      fpst_f16, fpst_std, &fpst_odd);
+        }
+    }
+}
+
 void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm,
                         void *vpn, void *vpm, CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index c03daa535d..f4a684f6a4 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -863,6 +863,14 @@ static bool do_fdot_nx(DisasContext *s, arg_azx_n *a)
 
 TRANS_FEAT(FDOT_nx, aa64_sme2, do_fdot_nx, a)
 
+static bool trans_FVDOT(DisasContext *s, arg_azx_n *a)
+{
+    return dc_isar_feature(aa64_sme2, s) &&
+           do_azz_acc_fp(s, 1, 2, a->rv, a->off, a->zn, a->zm,
+                         a->idx, 2, false, FPST_ENV,
+                         gen_helper_sme2_fvdot_idx_h);
+}
+
 static bool do_bfdot(DisasContext *s, arg_azz_n *a, bool multi)
 {
     return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm, 0, 0,
@@ -879,3 +887,11 @@ static bool do_bfdot_nx(DisasContext *s, arg_azx_n *a)
 }
 
 TRANS_FEAT(BFDOT_nx, aa64_sme2, do_bfdot_nx, a)
+
+static bool trans_BFVDOT(DisasContext *s, arg_azx_n *a)
+{
+    return dc_isar_feature(aa64_sme2, s) &&
+           do_azz_acc_fp(s, 1, 2, a->rv, a->off, a->zn, a->zm,
+                         a->idx, 2, false, FPST_ENV,
+                         gen_helper_sme2_bfvdot_idx);
+}
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 16ddd35239..cfd219ed13 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3079,6 +3079,45 @@ void HELPER(gvec_bfdot_idx)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(sme2_bfvdot_idx)(void *vd, void *vn, void *vm,
+                             void *va, CPUARMState *env, uint32_t desc)
+{
+    intptr_t i, j, opr_sz = simd_oprsz(desc);
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT, 2);
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t elements = opr_sz / 4;
+    intptr_t eltspersegment = MIN(16 / 4, elements);
+    float32 *d = vd, *a = va;
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint32_t *m = vm;
+    float_status fpst, fpst_odd;
+
+    if (is_ebf(env, &fpst, &fpst_odd)) {
+        for (i = 0; i < elements; i += eltspersegment) {
+            uint32_t m_idx = m[i + H4(idx)];
+
+            for (j = 0; j < eltspersegment; j++) {
+                uint32_t nn = n0[i + H2(2 * j + sel)]
+                            | (n1[i + H2(2 * j + sel)] << 16);
+                d[i + H4(j)] = bfdotadd_ebf(a[i + H4(j)], nn, m_idx,
+                                            &fpst, &fpst_odd);
+            }
+        }
+    } else {
+        for (i = 0; i < elements; i += eltspersegment) {
+            uint32_t m_idx = m[i + H4(idx)];
+
+            for (j = 0; j < eltspersegment; j++) {
+                uint32_t nn = n0[i + H2(2 * j + sel)]
+                            | (n1[i + H2(2 * j + sel)] << 16);
+                d[i + H4(j)] = bfdotadd(a[i + H4(j)], nn, m_idx, &fpst);
+            }
+        }
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va,
                          CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 18e625605f..7c057bcad2 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -374,3 +374,6 @@ FDOT_nx         11000001 0101 .... 1 .. 1 .. ...00 01 ...   @azx_4x1_i2_o3
 
 BFDOT_nx        11000001 0101 .... 0 .. 1 .. ....0 11 ...   @azx_2x1_i2_o3
 BFDOT_nx        11000001 0101 .... 1 .. 1 .. ...00 11 ...   @azx_4x1_i2_o3
+
+FVDOT           11000001 0101 .... 0 .. 0 .. ....0 01 ...   @azx_2x1_i2_o3
+BFVDOT          11000001 0101 .... 0 .. 0 .. ....0 11 ...   @azx_2x1_i2_o3
-- 
2.43.0

