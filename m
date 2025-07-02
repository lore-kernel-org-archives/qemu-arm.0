Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3706717qtb;
        Wed, 2 Jul 2025 05:38:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYWwdqliZy4supx7LsvqiHZveev6avcm8DyQ0O4E0ULG8jsaSpO5kI5agmTliKP4tuMKOnHiuq0NsXIA==@linaro.org
X-Google-Smtp-Source: AGHT+IEFBFB+cXY6A7RdX/VvDGT/sAZXVFotf+0vwohHaoDuH+MrOfkNqRw2NUwylsSDsixWGb7W
X-Received: by 2002:a05:622a:288:b0:477:4224:9607 with SMTP id d75a77b69052e-4a976951893mr35766721cf.12.1751459939235;
        Wed, 02 Jul 2025 05:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459939; cv=none;
        d=google.com; s=arc-20240605;
        b=MMhQdVMGAQTTaoIn8p/YIX2/WPLd+RIip1YXMql/Nn67jXPmPoldrYXef7mqROfT92
         tCxQFeQawCGdj+w1Uq5a1Dgh4gY+sNfSVSPnCGwxTMCYDxY0Ww9w2gq49vwRp1x1B1Vs
         NoIYSWQkItdHl2dJvWteWd5rtET5mU4tJW4dQB8+9QU+JbXHBAaRDUJHSLW85g7yureU
         zpHl4CK6rByB7EUB9NBIyiMwtlZ/dlQWmgdTsow3VEHt+WYAYVeWGbwpEOLGmmx8bpoi
         O2OndqWmJTZFymjZ4oyBUiMQOzsj9GN7cUeGxIIc5i8RfsJknSCv78nYAL6mYeaWnL5b
         903Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7DJLNfwuW/Zo+RPNp5mq/l1peWmKK7HstZBP41coj7M=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=lKa2GSwivy+CtyK3Z5C8VkEtJMD/QtMJBQh8CL9QK8ihiQ4OF96MLvEolvHzdgAYPU
         jxBXkthirMDEY1o+4R8PVco7rfhrfxIRkWPnmLSZo7q4V8B8dnAiF2PoCDNn6JoLimdH
         Bat2K4Dz/voSyQ5wUipnvxZs7/d7NBtdALcZrKLLAjvZOqnakJ+rawDaeAvn+gJjixAR
         16ZbYfPecQyEvo4gwW5U2Io6GLBt9ct53Bme1wmMnxO6vv+rz/Amq6nxoYL1Y6bqAhII
         IjTgq8lQvCqYPApMaIV4A1PY3GODaCThuLHposma7a4LNOaOUeyeigmGW3NgC6phtTnX
         nxmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WJzLQhXG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e6e32si128448881cf.241.2025.07.02.05.38.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WJzLQhXG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwgQ-0008Qa-BC; Wed, 02 Jul 2025 08:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwg8-0007yz-Cb
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:09 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwfn-00014N-1j
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:35:02 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-73a44512c8aso1536859a34.0
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459684; x=1752064484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DJLNfwuW/Zo+RPNp5mq/l1peWmKK7HstZBP41coj7M=;
 b=WJzLQhXGvPliLbNUTxx3433/k/Iq3nXKg9/xCsDDYG0acUgkX9Ez4skqgd33Ic5fps
 lEERt7CtfK9ulrHKAwwyl6ZpfHs+8VpgmpGYtJJg2WQ4XFjAJ99e/XMA/VK9UKEhmdVD
 XocOE5wkkvgh9jtM6W5nMDlnOnRO/U+Zvxg2TPEPXmE+NctMkcb+6r1PESsiZWK0ETDg
 DFfScE43N4PQfnRsPG3+cWOEQ+oqNuVwV01wS4C443ybhND0DvHrEsUc0+OBROk2DFRq
 KpRMg9LxATOAbddUoe34hoOBZDkuCLp2MAD0H5V9ULsRChfsgZ58CBRvcfionsfailSF
 /BIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459684; x=1752064484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DJLNfwuW/Zo+RPNp5mq/l1peWmKK7HstZBP41coj7M=;
 b=lLg1iBhU4Qdl0XJuSbgctG3PcEkj50SC/N28o72lDWJMn3zTHUa/gnCatnFVVSISC+
 zsSlCe8s597XQuu7nEDmSgozbYv5g+mnbKAria4qViHqbcU+bB4YLHDro4O9us/oPb7k
 /ByLnJN8ndJ+FQ8nxNsu4vOazxDlBofYFluAVGSiN0M8ZckCUapKmTGvvdt9AEiY4wRi
 Ay8gsed0akdNXsfNdOUWojwWZoQsJSE8i0FUKPry7ust8H61FXq8sDhY2pamE87bAKjm
 xarlcNZLlYTpzYokKnBwxHw5HysCHHzHTiS9xHcp5Qk+FJ8Qp0AERRM4CLpiV4i7ZTYO
 L8KQ==
X-Gm-Message-State: AOJu0YxSIWphj6DgaHXaIoxH3pXtIY0YwSIeEAQHnEzdT9fWEPciYJOw
 /oGQHtEF7S8RmXkqvn1O99kV65x6sK7PkbGC6zFDOTzxCHb+GlwMrlOKFEcWXx32Eac=
X-Gm-Gg: ASbGnctZu94tlpDnbatkrAHRBuwX/Ja7ZD8DuTa0Lhri1pTPyM1fL9TtKQ/7PhGdGrC
 ndbrZWF+/3u6fhy90IcCAXaNx0dG7lzaM8zWhCCHW8Pej0DP4A3h6ukSS9PtMm4SL7NxqwYbWs7
 pmXXJ8piy9z979ok0wvoVsYLMcSOOYm10he3RjGg1ycEWstKsq+RTqcwlK6/XzlSx4H2kA835fm
 FhWVgtR0zAdOinW4p9bCtNxAZbPGaMzn/4oaU9/lExpmb6V1wRnzjUPi9PUroH7B8iEqPsj+6EJ
 mAT5/6JtrfswNgOpwLI/JkylSOQROPYuFFYT4CqY9kS/hv1KDey/3HMXZLO/pPKcr8t93Q==
X-Received: by 2002:a05:6830:648c:b0:73a:6904:1b46 with SMTP id
 46e09a7af769-73b4ca7b5f7mr2741164a34.8.1751459683926; 
 Wed, 02 Jul 2025 05:34:43 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3864281fac.32.2025.07.02.05.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:34:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 25/97] target/arm: Add helper_gvec{_ah}_bfmlsl{_nx}
Date: Wed,  2 Jul 2025 06:32:58 -0600
Message-ID: <20250702123410.761208-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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
X-TUID: ZHqf3IEfBPZ8

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h     |  8 +++++
 target/arm/tcg/vec_helper.c | 58 ++++++++++++++++++++++++++++---------
 2 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index 8c4705fc53..a05b63380c 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -1095,8 +1095,16 @@ DEF_HELPER_FLAGS_6(gvec_bfmmla, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_6(gvec_bfmlal, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(gvec_bfmlsl, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(gvec_ah_bfmlsl, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(gvec_bfmlsl_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(gvec_ah_bfmlsl_idx, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_5(gvec_sclamp_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index f3de26ca54..3ebee97e68 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3186,44 +3186,76 @@ void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va,
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_bfmlal)(void *vd, void *vn, void *vm, void *va,
-                         float_status *stat, uint32_t desc)
+static void do_bfmlal(float32 *d, bfloat16 *n, bfloat16 *m, float32 *a,
+                      float_status *stat, uint32_t desc, int negx, int negf)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-    intptr_t sel = simd_data(desc);
-    float32 *d = vd, *a = va;
-    bfloat16 *n = vn, *m = vm;
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1);
 
     for (i = 0; i < opr_sz / 4; ++i) {
-        float32 nn = n[H2(i * 2 + sel)] << 16;
+        float32 nn = (negx ^ n[H2(i * 2 + sel)]) << 16;
         float32 mm = m[H2(i * 2 + sel)] << 16;
-        d[H4(i)] = float32_muladd(nn, mm, a[H4(i)], 0, stat);
+        d[H4(i)] = float32_muladd(nn, mm, a[H4(i)], negf, stat);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
-void HELPER(gvec_bfmlal_idx)(void *vd, void *vn, void *vm,
-                             void *va, float_status *stat, uint32_t desc)
+void HELPER(gvec_bfmlal)(void *vd, void *vn, void *vm, void *va,
+                         float_status *stat, uint32_t desc)
+{
+    do_bfmlal(vd, vn, vm, va, stat, desc, 0, 0);
+}
+
+void HELPER(gvec_bfmlsl)(void *vd, void *vn, void *vm, void *va,
+                         float_status *stat, uint32_t desc)
+{
+    do_bfmlal(vd, vn, vm, va, stat, desc, 0x8000, 0);
+}
+
+void HELPER(gvec_ah_bfmlsl)(void *vd, void *vn, void *vm, void *va,
+                            float_status *stat, uint32_t desc)
+{
+    do_bfmlal(vd, vn, vm, va, stat, desc, 0, float_muladd_negate_product);
+}
+
+static void do_bfmlal_idx(float32 *d, bfloat16 *n, bfloat16 *m, float32 *a,
+                          float_status *stat, uint32_t desc, int negx, int negf)
 {
     intptr_t i, j, opr_sz = simd_oprsz(desc);
     intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1);
     intptr_t index = extract32(desc, SIMD_DATA_SHIFT + 1, 3);
     intptr_t elements = opr_sz / 4;
     intptr_t eltspersegment = MIN(16 / 4, elements);
-    float32 *d = vd, *a = va;
-    bfloat16 *n = vn, *m = vm;
 
     for (i = 0; i < elements; i += eltspersegment) {
         float32 m_idx = m[H2(2 * i + index)] << 16;
 
         for (j = i; j < i + eltspersegment; j++) {
-            float32 n_j = n[H2(2 * j + sel)] << 16;
-            d[H4(j)] = float32_muladd(n_j, m_idx, a[H4(j)], 0, stat);
+            float32 n_j = (negx ^ n[H2(2 * j + sel)]) << 16;
+            d[H4(j)] = float32_muladd(n_j, m_idx, a[H4(j)], negf, stat);
         }
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(gvec_bfmlal_idx)(void *vd, void *vn, void *vm, void *va,
+                             float_status *stat, uint32_t desc)
+{
+    do_bfmlal_idx(vd, vn, vm, va, stat, desc, 0, 0);
+}
+
+void HELPER(gvec_bfmlsl_idx)(void *vd, void *vn, void *vm, void *va,
+                             float_status *stat, uint32_t desc)
+{
+    do_bfmlal_idx(vd, vn, vm, va, stat, desc, 0x8000, 0);
+}
+
+void HELPER(gvec_ah_bfmlsl_idx)(void *vd, void *vn, void *vm, void *va,
+                                float_status *stat, uint32_t desc)
+{
+    do_bfmlal_idx(vd, vn, vm, va, stat, desc, 0, float_muladd_negate_product);
+}
+
 #define DO_CLAMP(NAME, TYPE) \
 void HELPER(NAME)(void *d, void *n, void *m, void *a, uint32_t desc)    \
 {                                                                       \
-- 
2.43.0

