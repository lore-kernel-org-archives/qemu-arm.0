Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1263096dyc;
        Fri, 4 Jul 2025 07:44:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVbJWa3AktQlhglROOIZRdzP1XnbKiazz02RWRNtHpqgXD6HeZ9i439JGO8wVCxX70v/5dxk+aSoXhQlg==@linaro.org
X-Google-Smtp-Source: AGHT+IGVadHBoeWUNtPtXjpXr8sjnz8BKmkU40CI2JJRVVXsbOApiFr+z651H7DKg0wOnCnwy1KH
X-Received: by 2002:a05:6214:3a89:b0:6fa:cd55:3823 with SMTP id 6a1803df08f44-702c6d6534emr39711486d6.26.1751640277805;
        Fri, 04 Jul 2025 07:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640277; cv=none;
        d=google.com; s=arc-20240605;
        b=SoTVpdlUXZVz3Ih6ISbsRoEKQzBVT03JBEmj8L4mvq/xV2kOAGm8pZgKKKK6wOJ1T3
         +Y+E7nUryQSAMy2+/88mQRwn9TyN/BGJweKLJik0eUn4TTYYlZPde2avujbI6DExR5lX
         S/zTTjFQrs0S6vs2dyjZiQ2JsNkehLGbrMaryDaFTQ59x70YxF1JMwODYaR91hPfq90w
         LBF5CFefDv6su1o7fUuO/DReYvFNE3dd7qfZqbanITEYCOD4dnMoVCO0TFFqlmSNIQ8J
         3m0AuJev8BgisEYY8AGkExyic8mukWItOvR2pxbSWIcBxb3UhccwzHVFzIjJl/WeqGLc
         OXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BEQcB1/UqEbBB8OYjKzTOMJUu4ZO4MlGo9qVante+Ao=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=I/43tJHvJsphe+h2fe17Kmwf7nD3WEzg0HVgNDoYdkqo4iREE3KTv9AfhTx3RtbLKG
         I8x2FkYHd8r4pzIJLHokf4S3Uy3+ywnLHjbLnvtAvNhFvJbkZi3xu07M9qr0uSjOCUy/
         GdmVx4nersiP7XX5Jonpogyy4gfvZeAiAIOJUpfMyv4tqEtjaHgHJEL1xIMnEjzEg0kW
         OQue669CsQDfkx97AxfLctOsO+eSyOz3yTBIJG/1m4czJiYya/iyHhCEvcZOlJKKmiY0
         O5XOiEKVyzSoGYEa6YXSHvJ3kPKOoXOTcZmiXY9ZSc8odhlePNkdqv9CtqX+TUJfoNBM
         HDsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5c5kDqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-702c4d5642dsi21618156d6.256.2025.07.04.07.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q5c5kDqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhRQ-0006hn-SQ; Fri, 04 Jul 2025 10:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM9-0004jq-JV
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:41 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM5-0008Aw-C6
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:37 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-611a7c617a7so288599eaf.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639132; x=1752243932; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEQcB1/UqEbBB8OYjKzTOMJUu4ZO4MlGo9qVante+Ao=;
 b=q5c5kDqs7FP2TkfuRA7Or/rYB4UM49aheV2n55sUuw9FpMeTB7E7kxHqJjLgTOL+cY
 IxC1cVQ/WmKE7FXywUwRYOKfKuplW1EORanzZXbHeLLIjPNCv5LRpuTeOf7P7JX+ojTV
 RI5mO8IOoxKsLhJhbraxujRclng2K3nUFLCOJozKHoUvgjlaNlNVEIB0ZF3NPuy1vJfC
 sI7+IH0r++hdQpsW7F9yTVKvDVW5qGxyS7VPXgY1VjeD3P7ha9b4XlLCnLUKmipOLB0t
 IEBv/xZpebtMVBodHKZXsJNP7wpugDTp0uNlYq1UxK1P2SWymcnIny6RbrOMPxzHNG/J
 ZNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639132; x=1752243932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BEQcB1/UqEbBB8OYjKzTOMJUu4ZO4MlGo9qVante+Ao=;
 b=L++Sp8i0i38OS5kKzazM0mFU1Do/++rTcCEzlh+HZdDH91dkbb8Id72aOUcXJTzXx+
 a6iGgiUYLY8esxST84VEHOECaz3COHHyPxB9YNe6jNt0cYOOwkTfxKPIGQBJYQsVtsem
 r9SAtdZ4cPrGO0hbOp913RqnAWADRFmtJ5Xu9kmGV66cipzv+d6Qf1CSa6FmnFtPd+h5
 DinzB3bhRCzgk+uYK0G26maBjvvyj7Ry/WKegeBdgQzVbtejoJGByZsKXqJFU0vlUJR7
 3dQnfFfWJLA6CFmvlimORorB8J12SPY15HIQD6ycY0CxiCjARTySpW48z9206UXGR5An
 2erA==
X-Gm-Message-State: AOJu0YwWDU1Glqb64IIGsVa6szohNIq4DSv8YKC6EOgtq/pygk7sQJ0z
 dDUhsWcdcuAJdl25OyMEGUSyG7ZweLF4pse4bNSdLF5N4rttHtLf41xCaq/UURP/6Io=
X-Gm-Gg: ASbGncv5wF+CDaz0R45IF/mX3FUadeDDmAL++5FFNVBGWiIVUld7dmEaLT/txuYvuc9
 13UAqLSE0leOLM6C9v5PPk/fnKYonob/GbUuM1Q48moPeA6wui6kcE0sNzu0tOV+piROmeEBVee
 7JDyDmCRwG/IVUoc9mfxXwHBO2qLEQ+LmfLblMH+K92RBjP/3l6m9SSgvbNtlqBGcgWB1Hiuc5a
 QUpCuHzIeooKO4eGphENBv7/f/TU7YMKmEZhv212t/iFzLbtCP2SOPYjQv7Zb6ZmeQBRYODzHpL
 BAwhatufcQz9GNdrojidOUDM+GjFdZ0YfLiaS9vQiAdoNj9ZBnLlRX7q1KzTZep/RCNztKYoLsu
 wPrLJmEQQCkLr1ecHF60s+1vrDpyvFpN+G3aQjdZULVbUfse5
X-Received: by 2002:a05:6808:3090:b0:408:fbb6:f4cb with SMTP id
 5614622812f47-40d04198e5bmr1962397b6e.6.1751639131908; 
 Fri, 04 Jul 2025 07:25:31 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 074/108] target/arm: Split out do_whileg from
 helper_sve_whileg
Date: Fri,  4 Jul 2025 08:20:37 -0600
Message-ID: <20250704142112.1018902-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2a.google.com
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
X-TUID: axngpYsWqzMM

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 39 +++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 741d04309c..5e11e86e5e 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4138,34 +4138,35 @@ uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
     return pred_count_test(oprbits, count, false);
 }
 
-uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
+/* D must be cleared on entry. */
+static void do_whileg(ARMPredicateReg *d, uint64_t esz_mask,
+                      uint32_t count, uint32_t oprbits)
 {
-    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
-    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
-    uint64_t esz_mask = pred_esz_masks[esz];
-    ARMPredicateReg *d = vd;
-    intptr_t i, invcount, oprbits = oprsz * 8;
-    uint64_t bits;
-
     tcg_debug_assert(count <= oprbits);
-
-    /* Begin with a zero predicate register.  */
-    memset(d, 0, sizeof(*d));
     if (count) {
-        /* Set all of the requested bits.  */
-        bits = esz_mask;
-        if (oprbits & 63) {
-            bits &= MAKE_64BIT_MASK(0, oprbits & 63);
-        }
+        uint32_t i, invcount = oprbits - count;
+        uint64_t bits = esz_mask & MAKE_64BIT_MASK(invcount & 63, 64);
 
-        invcount = oprbits - count;
-        for (i = (oprsz - 1) / 8; i > invcount / 64; --i) {
+        for (i = invcount / 64; i < oprbits / 64; ++i) {
             d->p[i] = bits;
             bits = esz_mask;
         }
-        d->p[i] = bits & MAKE_64BIT_MASK(invcount & 63, 64);
+        if (oprbits & 63) {
+            d->p[i] = bits & MAKE_64BIT_MASK(0, oprbits & 63);
+        }
     }
+}
 
+uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    uint32_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    uint32_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    uint32_t oprbits = oprsz * 8;
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+
+    memset(d, 0, sizeof(*d));
+    do_whileg(d, esz_mask, count, oprbits);
     return pred_count_test(oprbits, count, true);
 }
 
-- 
2.43.0

