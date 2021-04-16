Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp751854lfr;
        Fri, 16 Apr 2021 14:50:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrx+ygXo4M+fSGPdneJtTA+b6JS2VeN6iU5uCLY4kv2+hUn0xJRHoFpt13co2a5PnJE3/K
X-Received: by 2002:a25:5087:: with SMTP id e129mr1628527ybb.133.1618609814201;
        Fri, 16 Apr 2021 14:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609814; cv=none;
        d=google.com; s=arc-20160816;
        b=PHe1zKW+Ea4RdcMrGEcXodnSzvU9ml61+6EPsWbX2u6PFYkoWCFT+SS8YHP1eqCbQ/
         DXDEsBFaPyx/p/tTUGLhOvugVBKy0E3YTtYCjg7TlaMHnyv84+KMI/bClzUklC8bze5g
         3eYgTWBvG3snwgi24eZserfr6eDJU89sgAzFG/0h7U1o+M7psxBWmZcgg3ZAF0Gsfy1R
         tzoSlPY8tNZKOjLt9DlzAGHAggVcQsk4pQHQvPw/kI4Ox+3cFD92e91/sQmIeHYql+Vv
         MV4xyKyil9OzXi0lmperMeqZWfbKIlsar8L4tf6gPn6CEYUzqZ/4ImczBcG3CcL4lK47
         oAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hE9TgsBmlGieqIDzowyo5vXw3quweqaP+9DzBYJUIRE=;
        b=euQ55HJv2cFZxeiJIz6Hl7MI++Ojp0xFmhB8jrVMep58q70cksPdNHcuI21ZQz3o/l
         FpvFX/+7y9xI1jBaz9wAyuFO5+rZ9pGmOtwpD39XNTTX7LxyomF6gj3M+PVY4dBPP2+2
         LH87ekuz4VlnnMcgBW3sEo8rUp+YqqZMvQ3DOEf4HH838pXLoDYPu6f2vSuDH7zIdfp6
         Dlfks0Rwg9IauVNCPZvqqMLde/P/P+0Bs5z9/XFjF1nyNb1QKpfDanD0HR1ikRXW80H+
         1QhcISwDcrFmUkE65pAQ/z8Nd2yPVhsNdX3p+xfpwnPjlVioSwRul/5ua7HfcR/WAv0g
         kZXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQlPYEMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y194si6193325yby.299.2021.04.16.14.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQlPYEMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWLt-0004CM-F6
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdp-0006Xy-7S
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:41 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdV-0001jB-Kt
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id lt13so5818558pjb.1
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hE9TgsBmlGieqIDzowyo5vXw3quweqaP+9DzBYJUIRE=;
 b=CQlPYEMouLjD90rPiX1Xn6jPNltluWYIB2th80uMKcJN8ekwStHJGhcJDETeO5sBQd
 1APjONTHRFct9eHSh2JlHghvULl9+69r3rUFGUvr/xQHV478hKqxf4maoZQ8gQKrOaLa
 NgFcTJaoiGs+f61nrwQiBKoXSYCpYuVCFc438u+eS6seWsXC+SuRlxdjSuUSeb4JwsMY
 o+Z5iOdf96nAPCg/3GjRJsMx/BWyJbF/lJFQwkTG8MowQySWnwNxqGaM/aoDLqLUmqAA
 4ocNBeLKvrfrpwB+oUCuHohnuZZqzO28OU0F6FetHxlB20aue5wVAxIlzl3GUc0oNroP
 0GLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hE9TgsBmlGieqIDzowyo5vXw3quweqaP+9DzBYJUIRE=;
 b=ckO+ZzNq9/4SwCWXwt+rMSQghWTEkljokeHQLSfs0K467mEtdRrmOSiecXeruQET8o
 keDhHZB4tgSYuav3RSDA9wg5RvRRfrq0jC2kYUG80/e9uLqEYytruXbqP8/qTA4ctaC3
 qsecSQxXsnTfuNysWOEuUp/A8GeWJoj4zoLkE0pvQAmWkg0q7lD6TEqU5G4JtpSTd5l+
 Zjg40I2wnZJJgMVy+U3jySWk6cus394PAf/f/PTo1KsqkKNrTOum2gbK7Y9rXGJQ6pOS
 OOfRPP5JBsfnVMAMthRCtLHFq+NE4m13pLF6pGpAdWnIgO8FFSvZf7KxHmgrvXB/o6bh
 edVQ==
X-Gm-Message-State: AOAM530ti4otnABi+fe3rEL0hZPct5p5tPzmtTPX4seX2uC2DAZRR9Cb
 wY1GqH8VicT2ojZQnbIFem5mMEYG3pogSw==
X-Received: by 2002:a17:90a:e512:: with SMTP id
 t18mr9429819pjy.34.1618607050109; 
 Fri, 16 Apr 2021 14:04:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 59/81] target/arm: Implement SVE mixed sign dot product
 (indexed)
Date: Fri, 16 Apr 2021 14:02:18 -0700
Message-Id: <20210416210240.1591291-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +F/e50L4Umrd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++
 target/arm/helper.h        |  4 +++
 target/arm/sve.decode      |  4 +++
 target/arm/translate-sve.c | 16 +++++++++
 target/arm/vec_helper.c    | 68 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 97 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e44bb8973a..132ac5d8ec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4246,6 +4246,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_f32mm(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F32MM) != 0;
diff --git a/target/arm/helper.h b/target/arm/helper.h
index e7c463fff5..e4c6458f98 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -621,6 +621,10 @@ DEF_HELPER_FLAGS_5(gvec_sdot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sudot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_idx_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcaddh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 35010d755f..05360e2608 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -813,6 +813,10 @@ SQRDMLSH_zzxz_h 01000100 0. 1 ..... 000101 ..... .....   @rrxr_3 esz=1
 SQRDMLSH_zzxz_s 01000100 10 1 ..... 000101 ..... .....   @rrxr_2 esz=2
 SQRDMLSH_zzxz_d 01000100 11 1 ..... 000101 ..... .....   @rrxr_1 esz=3
 
+# SVE mixed sign dot product (indexed)
+USDOT_zzxw_s    01000100 10 1 ..... 000110 ..... .....   @rrxr_2 esz=2
+SUDOT_zzxw_s    01000100 10 1 ..... 000111 ..... .....   @rrxr_2 esz=2
+
 # SVE2 saturating multiply-add (indexed)
 SQDMLALB_zzxw_s 01000100 10 1 ..... 0010.0 ..... .....   @rrxr_3a esz=2
 SQDMLALB_zzxw_d 01000100 11 1 ..... 0010.0 ..... .....   @rrxr_2a esz=3
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b43bf939f5..1f07131cff 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3838,6 +3838,22 @@ DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
 DO_RRXR(trans_UDOT_zzxw_s, gen_helper_gvec_udot_idx_b)
 DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
+static bool trans_SUDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
+        return false;
+    }
+    return do_zzxz_data(s, a, gen_helper_gvec_sudot_idx_b, a->index);
+}
+
+static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
+        return false;
+    }
+    return do_zzxz_data(s, a, gen_helper_gvec_usdot_idx_b, a->index);
+}
+
 #undef DO_RRXR
 
 static bool do_sve2_zzx_data(DisasContext *s, arg_rrx_esz *a,
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 8b7269d8e1..98b707f4f5 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -677,6 +677,74 @@ void HELPER(gvec_udot_idx_b)(void *vd, void *vn, void *vm,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(gvec_sudot_idx_b)(void *vd, void *vn, void *vm,
+                              void *va, uint32_t desc)
+{
+    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
+    intptr_t index = simd_data(desc);
+    int32_t *d = vd, *a = va;
+    int8_t *n = vn;
+    uint8_t *m_indexed = (uint8_t *)vm + index * 4;
+
+    /*
+     * Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
+     * Otherwise opr_sz is a multiple of 16.
+     */
+    segend = MIN(4, opr_sz_4);
+    i = 0;
+    do {
+        uint8_t m0 = m_indexed[i * 4 + 0];
+        uint8_t m1 = m_indexed[i * 4 + 1];
+        uint8_t m2 = m_indexed[i * 4 + 2];
+        uint8_t m3 = m_indexed[i * 4 + 3];
+
+        do {
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
+        } while (++i < segend);
+        segend = i + 4;
+    } while (i < opr_sz_4);
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_usdot_idx_b)(void *vd, void *vn, void *vm,
+                              void *va, uint32_t desc)
+{
+    intptr_t i, segend, opr_sz = simd_oprsz(desc), opr_sz_4 = opr_sz / 4;
+    intptr_t index = simd_data(desc);
+    uint32_t *d = vd, *a = va;
+    uint8_t *n = vn;
+    int8_t *m_indexed = (int8_t *)vm + index * 4;
+
+    /*
+     * Notice the special case of opr_sz == 8, from aa64/aa32 advsimd.
+     * Otherwise opr_sz is a multiple of 16.
+     */
+    segend = MIN(4, opr_sz_4);
+    i = 0;
+    do {
+        int8_t m0 = m_indexed[i * 4 + 0];
+        int8_t m1 = m_indexed[i * 4 + 1];
+        int8_t m2 = m_indexed[i * 4 + 2];
+        int8_t m3 = m_indexed[i * 4 + 3];
+
+        do {
+            d[i] = (a[i] +
+                    n[i * 4 + 0] * m0 +
+                    n[i * 4 + 1] * m1 +
+                    n[i * 4 + 2] * m2 +
+                    n[i * 4 + 3] * m3);
+        } while (++i < segend);
+        segend = i + 4;
+    } while (i < opr_sz_4);
+
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_sdot_idx_h)(void *vd, void *vn, void *vm,
                              void *va, uint32_t desc)
 {
-- 
2.25.1

