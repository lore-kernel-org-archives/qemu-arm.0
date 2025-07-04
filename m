Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1253563dyc;
        Fri, 4 Jul 2025 07:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhCr7ptSik8WxlHM1rTBvRZKBOPA2HGxa+h8TffQmh91WmCReN0V/SbCM1pkdLkKdY45aH01t8dxR6Hw==@linaro.org
X-Google-Smtp-Source: AGHT+IG6mpYRsSRv/AvtPkcaHfcuHySD4Q0zrdjKao16JJyXsmOgBauCN84QTtV5J6zYF6kMYyCk
X-Received: by 2002:a05:6214:3906:b0:6fd:7577:cee9 with SMTP id 6a1803df08f44-702c6d116f9mr37305976d6.2.1751639332151;
        Fri, 04 Jul 2025 07:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639332; cv=none;
        d=google.com; s=arc-20240605;
        b=PTnxpvD4IyEGh4iFz5pNFso4HVWrxyAfSeiUyoWeOCiXAaaDFAe2PCoCcAXTAv4nHi
         e8bPGEj08ZvhXgTACtmyE6EpRzDFX4vBDpQAN3i6sqKPjVA7AfS1BxrtL3HlWdruzbDj
         hABK0Qbs6b8tHf0loPow6AoLls/feycG8dpsf96FPRcExuFA5n6MWgH8nRFPZyscHK5J
         L8P25bpeCBVLpYvLVkzFbiNdZjGQqF719prkqxMYvt3VtywKXfdyGf5bEu2MW2IS5GqU
         25dDPqu2STbZzKyg18TomaLxHi92t+UGaF56mDDP04+BtQgY5iO9f8CamvGNWBh8FGwQ
         HT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vRLXMT2SgHddXL2FtxT5fbwaMhj+IOtlZidR4XsmCHs=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=HUIzvsDPr4gIDxEPMkHTomyQYdQjNRsciMOywM5il7B45lNsMxUWd55la3kGEW83z3
         DTzaro9wTeEkLpiLnSUC7wDYpa+a7PULvmGNaA6dJSd6bNPgQjwbk8AjkjT8jPXkB1as
         PqspKXyKA61IGzeKpY9flnu/M9CD1k9FWU0Lvdj3UOrZXX0n3w3QHLG2Uz9Um4knVXIY
         HsOKwp8mD0jSuwxFj1oZdG3oj9at1fDnEleh0vxK7Xgvw6kGcBqCFZX4bmaeSChgerp/
         vT5TVwLnDLLagwOGCsFHGDM7QNuxT/8mbdzObPnAo0riZUx8QwJ8e4x3opaEdeBE7YEF
         Wqzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+8bsaz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4d563f8si19681546d6.268.2025.07.04.07.28.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:28:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g+8bsaz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhLc-0003Z3-9H; Fri, 04 Jul 2025 10:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIX-0005iM-Pj
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:53 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhIV-0006A4-Lc
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:53 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2ef461b9daeso865844fac.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638910; x=1752243710; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRLXMT2SgHddXL2FtxT5fbwaMhj+IOtlZidR4XsmCHs=;
 b=g+8bsaz5MPe9Vwikt6FU7eQDhjCK5Lo9Memit85CgENlOfmUWYIvhNHxKjIUZ09VOE
 EL9mZCc5tM2+Drl4URlEcAfbOVmEGtW1QAbThhIwSOAcA54u6MtVNM/VfehYJ3mPiOBt
 CrVCc+9WQMpDwp7osK605+3Ilz12p6ryg5AInrCcPx+vpZdjQihmlcCjos/kJqe7kK/a
 m0nFTzJU+bRuCoO3maM1Q6tHDfUtOp7bTZbMNxT0GwdNtnGf6i+595gg8n/5PwdW++Mz
 6XgqQ4Jcnfu5z2cfFgO5fJZHgq3jR8oMm7aN1to8fraFvpe/8YOmLczuzMcdhAj1D/Df
 fadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638910; x=1752243710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRLXMT2SgHddXL2FtxT5fbwaMhj+IOtlZidR4XsmCHs=;
 b=qroNuEqI8jvkdbwPBmDufiB1a0L3mwU73ABZ4tJH4t5xXdFLgaGOLAiD5A7BBFoR9v
 bitymFQmvRmZyOp03LCTXi8XDJaqQPBE4cNAlJThxHXq6cvK/KBPtr9WCVpcZOj3qG10
 EZLCtGMpZGd0h0akMYmHJJIDrxfI3O6hkP3AJ4s1fbh894d7aKa7+OsSa8tBpxusWo+9
 WO12CF7znM6w8isz5C3kdttAd4CAe9DWCuWGn23mH6hF/9SlBxQ/WQ8dBWlysBqilQV1
 GHmKTNCELgRcCtq/xGsXdIgNOHlVXapclRDqB9XGJgVk55P9oZr8EfY2wqt0h9xHfrBJ
 CvAA==
X-Gm-Message-State: AOJu0YxPXtIGTnkS8l9qUzDRPc5YcV4/lmhNrTCYxdACkhI8QuhLGLkj
 Doxg1aYgEAjxZawtA9yB2ESgn66Yvplolzx1fb0l651NT/xxGFKoSq/cuFIXeibgM64=
X-Gm-Gg: ASbGncspykm0XsaHCd5T+CmaxNE7K18YLKpIBAj6qO/lVUy+zwFgX1lA+VNhFI1GGIR
 LnqjPwGDzFp8Ys/y8chtIoC0sjT1Cw7OHV9YR3YlGNtYYyVmkbxGh/TVloZkN8zvfYLDHQii4dT
 V8uplqjeZuC4aToMk5fQGrJAJKw9qNAN8R3PryGTZapFWd2XnYdnI/31eZAcTwEj8Gmw9UBOn9c
 MR5AgcEXlsobEy9hvk1gEAdDpQ/9RCLd/0fLVbNFsIwA00KdFzu/zbOjnnlk78d1LvEuEOJCttA
 d7oP4Qv+3lxTvlEal5lQRO63xBDm6XRMDu+D4yIG3P+2v/+dFud506ph0colRkpZM/Pw500Vmsh
 F8p+BYo3JkONulfFqLi0KmjSSU9yPGNOs2D/LNgjzMHNU6eTS
X-Received: by 2002:a05:6870:6126:b0:29d:c85f:bc8c with SMTP id
 586e51a60fabf-2f796e07bd4mr1738162fac.36.1751638910101; 
 Fri, 04 Jul 2025 07:21:50 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 035/108] target/arm: Add helper_gvec{_ah}_bfmlsl{_nx}
Date: Fri,  4 Jul 2025 08:19:58 -0600
Message-ID: <20250704142112.1018902-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
X-TUID: pognuydZJ0JV

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index e8467823f2..5dcd6f9282 100644
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

