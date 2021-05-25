Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4040515lfm;
        Mon, 24 May 2021 18:49:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+vpCI2TLD2NnwEVeoYEFnsy/Ni8z5eIdX+4az5SwFEYdIogQE5z9aZqyXMhY6y8P1oN8+
X-Received: by 2002:a5b:f02:: with SMTP id x2mr39347616ybr.99.1621907360421;
        Mon, 24 May 2021 18:49:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907360; cv=none;
        d=google.com; s=arc-20160816;
        b=ay0ecEJBZs5/nBjbu8LarVAdS1QRJ287q+cpovzrfICdW53uAl3AqLzL+KRvoLePPW
         GrXsnJvr21JRlk/OMohJDt2tC0U8Cbwc5GOjt7H58j9n0KexZD+ASpZTq9TIoboEJ4zr
         z2FBqVJzlnPs+THxVZWW77ge5t73OJsPOamkCw3C8rAXu/FEtbF7kpRFYdRO4sD71DCH
         iPwo8aJA+fPNatBeGmRBw2QqCLWltl8rufqd3dbme7Vxya7ANN9OBqi17oAXwmHQ+dfY
         1DOTBdS5uxYefOinrtz3Wjbnlmsl8VQ6OJJsTzhiYhFswo8rQpXSAZ8oweJqT3byRslq
         9DGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=m90pIoUuj3x9BHKQq8AirzUHZnpMlycwnUIoFbbQwCI=;
        b=xPjtoWePFtB9rn8mX9bBSYt7gBJF4bgP2VrybNOFrSEw4ddMMYNOBZNj7xm9bLRBlx
         09OjWqoGwLuF1XuO4H4A/aKYYm8CJPuQnn7SiCdF7MwZ6ITevMx3dkiKWQgebeiv+hFb
         B7/gE291LWqMVt3K04F3jffzILzxG62g/dhn2bgwZMll7ovf35IXk/gvMHUDlcuMtxCW
         Vo6l9qKx9XWU+pDQZQ4Ck567EeGVjQnYZRmf0/k3fHGEhGVsfLbIlVxoDgMwkX73YgOU
         OHZTFZ908po4f4m3EvAZuDpWH00YQFYZ6Tc85bNRlLipyfbkLse3xaSgMsEJMHjY1Win
         kAgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UPjcDohj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si15419071ybp.323.2021.05.24.18.49.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:49:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UPjcDohj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMC7-0003A0-PD
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYM-0000KD-CA
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:14 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-00045r-Vk
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:14 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d16so22261413pfn.12
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m90pIoUuj3x9BHKQq8AirzUHZnpMlycwnUIoFbbQwCI=;
 b=UPjcDohjJOJ+qTjT6e2kQCTqrDw0vBzi5VU7M1yF1/fyhGRPdxAVpT7rJy7IM+K+fd
 vKtQz35UFQG2+IseiVfUxJnreY4+xAErut7NzvrxqKGyg16p43VIF1dBdT0+21e0ZBQN
 3RxWGRxJHNS3J6Q9rbJESLkJ5Vot5uxW1/hGHkAgRHymUm0G6uVlXXmksbLiSjzNjgSa
 DyvrGxtW+3MQF1YNe81bLwQPvJAiNfRI7SmT7w/0kv2X2HFcHY46qAjizlaS2jsN9485
 k//c8pZH6SyIT0CYBs5K0NNJk1dh8pPCZB35oBJHmhS5DwbHlypVJKK+SMn/yXSyVvYb
 y7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m90pIoUuj3x9BHKQq8AirzUHZnpMlycwnUIoFbbQwCI=;
 b=bE9KRxVSw3a0J3E0+Kvk3xcE10mJsv1TfyA8IB8PSZ9pnvi6l47S48dJP5AufKIi+E
 2WfXqiJ+3UbxQo6AJolLY9rY1rKKaqUu4AAnZsrEctDEtCmynm3lTOUmzRtDg1pMlcWk
 UYgY+429UtkDYYXaTezVt35XonPZGt78/cu0xGGSfMqTtARPq/TxbK66Qk3YSg7OZnl5
 aS2c9/Yc05UGyPNslbpERTf9QCJjGWmyiQzzIYbIp61foGjKkY7Goz5f9Fcs6hDUO3ii
 MaWjZA+FtHefKV9XWvEALpAaYNS5yDUDEDD2uNoIqZDM3n4TZqWO05f95v45gJR5LxqJ
 ZLPA==
X-Gm-Message-State: AOAM533qiCmqTsndm8o1FN4aWg+uPT0zLplm+fYIcbxVhOfLwlo1zb3J
 5wTRqgulDWy0PAtb/Y0iTW4q9A==
X-Received: by 2002:a63:5218:: with SMTP id g24mr16111748pgb.309.1621904859006; 
 Mon, 24 May 2021 18:07:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 64/92] target/arm: Macroize helper_gvec_{s,u}dot_{b,h}
Date: Mon, 24 May 2021 18:03:30 -0700
Message-Id: <20210525010358.152808-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: 6fnRx8QgNJub

We're about to add more variations on this theme.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vec_helper.c | 82 ++++++++++-------------------------------
 1 file changed, 20 insertions(+), 62 deletions(-)

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 8b7269d8e1..cddf095c74 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -543,73 +543,31 @@ void HELPER(sve2_sqrdmulh_idx_d)(void *vd, void *vn, void *vm, uint32_t desc)
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
- * with respect to the ordering of data within the 64-bit lanes.
+ * with respect to the ordering of data within the quad-width lanes.
  * All elements are treated equally, no matter where they are.
  */
 
-void HELPER(gvec_sdot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    int32_t *d = vd, *a = va;
-    int8_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] = (a[i] +
-                n[i * 4 + 0] * m[i * 4 + 0] +
-                n[i * 4 + 1] * m[i * 4 + 1] +
-                n[i * 4 + 2] * m[i * 4 + 2] +
-                n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
+#define DO_DOT(NAME, TYPED, TYPEN, TYPEM) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                \
+    TYPED *d = vd, *a = va;                                               \
+    TYPEN *n = vn;                                                        \
+    TYPEM *m = vm;                                                        \
+    for (i = 0; i < opr_sz / sizeof(TYPED); ++i) {                        \
+        d[i] = (a[i] +                                                    \
+                (TYPED)n[i * 4 + 0] * m[i * 4 + 0] +                      \
+                (TYPED)n[i * 4 + 1] * m[i * 4 + 1] +                      \
+                (TYPED)n[i * 4 + 2] * m[i * 4 + 2] +                      \
+                (TYPED)n[i * 4 + 3] * m[i * 4 + 3]);                      \
+    }                                                                     \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                              \
 }
 
-void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    uint32_t *d = vd, *a = va;
-    uint8_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 4; ++i) {
-        d[i] = (a[i] +
-                n[i * 4 + 0] * m[i * 4 + 0] +
-                n[i * 4 + 1] * m[i * 4 + 1] +
-                n[i * 4 + 2] * m[i * 4 + 2] +
-                n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    int64_t *d = vd, *a = va;
-    int16_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] = (a[i] +
-                (int64_t)n[i * 4 + 0] * m[i * 4 + 0] +
-                (int64_t)n[i * 4 + 1] * m[i * 4 + 1] +
-                (int64_t)n[i * 4 + 2] * m[i * 4 + 2] +
-                (int64_t)n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
-
-void HELPER(gvec_udot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
-{
-    intptr_t i, opr_sz = simd_oprsz(desc);
-    uint64_t *d = vd, *a = va;
-    uint16_t *n = vn, *m = vm;
-
-    for (i = 0; i < opr_sz / 8; ++i) {
-        d[i] = (a[i] +
-                (uint64_t)n[i * 4 + 0] * m[i * 4 + 0] +
-                (uint64_t)n[i * 4 + 1] * m[i * 4 + 1] +
-                (uint64_t)n[i * 4 + 2] * m[i * 4 + 2] +
-                (uint64_t)n[i * 4 + 3] * m[i * 4 + 3]);
-    }
-    clear_tail(d, opr_sz, simd_maxsz(desc));
-}
+DO_DOT(gvec_sdot_b, int32_t, int8_t, int8_t)
+DO_DOT(gvec_udot_b, uint32_t, uint8_t, uint8_t)
+DO_DOT(gvec_sdot_h, int64_t, int16_t, int16_t)
+DO_DOT(gvec_udot_h, uint64_t, uint16_t, uint16_t)
 
 void HELPER(gvec_sdot_idx_b)(void *vd, void *vn, void *vm,
                              void *va, uint32_t desc)
-- 
2.25.1

