Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDE0FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpc-000090-OJ; Sun, 26 Apr 2026 09:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoa-0006A1-MK
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:29 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoY-0001f0-4V
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:28 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2b45cb89f7eso58487245ad.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211185; x=1777815985; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFscoPCXmC5wItps4ZK1oMdS8qcgvMlEJeB/ShmBOiI=;
 b=Z3z6DUAv/zR4iuLsTc5XJj0xSuEdNNqt54VQqQdV7iTvXod6fHd1qrpBbc7KXp65ZX
 ZsboBvItwCQ0i6YzOnBdbCVPtPkTjJO9rf9DrBhYywz0YJhm8yiAlgcVZ2rhb9tH9TdN
 VzRzssqW07spp9KxPNRLdz4Mt/gC3IJ2S23oNLZ2F7Z62Ouq0gsjKT+PfUMtzeqI7a+v
 YGuzvQeBEhlYkUxqm9IwpuwtJ2CVUZY36SfhWL7RlqwqZC5LZiSPR6l4buekazaGAQzC
 xuMNfi2vz5rr0Vvfm/ndtNyzzA15rA0694n4xs0t4NofhLyUvPU31ewIxJbU1r6RYyjT
 fw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211185; x=1777815985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oFscoPCXmC5wItps4ZK1oMdS8qcgvMlEJeB/ShmBOiI=;
 b=VYiJpKxDRmqeqj9378vxo1ng1C4yZnUZcb22edBQXbACDtsTqTt+qoz9K+UqRrmgJA
 s68iN0eoMm0ZOCiG9MWiOUeN8OaMu0ZqEWCfeD0YXKRLgKl8Rf/IkjtZHEjWr8IC2fQt
 D2maXqVXTWMHarxaC2t4zA9m/AlOwZomL1bcvtV657tTBJmGwunQqJMafXqW2LlCLZMd
 e/cFIflLpEHdlwBRxYWxRz1SLWy/tXv8PCE2w5WwAjOEWQV8kHNbICovaQa7w6SQG54a
 gncSNMj2Yx8crSbyQWajA8Eunm3VgAQKWdapAsHeGFQX5OR/jlvEtO8tS0lUFnzK7qhf
 7aaQ==
X-Gm-Message-State: AOJu0YyFoVBVjU3Z8zXmZAh6H3RblGg5F2vCzvfh5wYXRHCch4NUYBcS
 YR5LTqlOzSw1tx0pPAHdSbwx5DP1WNGAixHXbSR+2lgR+NZtarFfF0xF6xOcAQeBOPWTyWYx7hR
 hb35FZNQ=
X-Gm-Gg: AeBDieuTfuFOS+VIq//5Y0/8M1HprOWJgHBJwtMRo+sDsLpkZGElwuu0dqDYQx/ekQS
 Iu2ml9Eb/iSErM2IR52q0XHNcYTCmlOo9xNiHQ23BIzC5ENhchx4vosZKAZPMPwe8jzUQ+PPX33
 ORENY0UHnDWy79l1f/GIWuveu+xkpcDN1du/YpqPWYiXnAeer8jbKz7wBUdzSw+CMAGLhmSqyw5
 zzs+U4VPFjdIi1e6zuKzBiQ5IpXzImwxNlLrT9DYnrX3aIxsmGRsK3Kyequv1o6d/plNiECpcmc
 mzUy5hiQWwRlXXZ9th1Z/jy7LQHjce6R1nNIHs6qaCuhWll5kCsDfHsZm3pDvff7S2Y8OfweweV
 Zr0UqFWRPLo20ywpoZ6BkyZ5zF/qWjLgz1LHGGLRkv7FgqvYNZpaxJjwRmbNrpf2+qw1yrxi+4F
 RHZ85UJeRWKCk+34PpU9upnZKDRgablE0DjTxAWFsu
X-Received: by 2002:a17:902:bcc8:b0:2b7:af0e:5942 with SMTP id
 d9443c01a7336-2b7af0e8224mr103039985ad.26.1777211184735; 
 Sun, 26 Apr 2026 06:46:24 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:46:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 72/84] fpu: Return struct from parts{64,128}_pick_nan_muladd
Date: Sun, 26 Apr 2026 23:39:49 +1000
Message-ID: <20260426134002.865628-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 87460306f4..5eaac357ec 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -114,13 +114,15 @@ FloatPartsN partsN(pick_nan)(const FloatPartsN *a, const FloatPartsN *b,
     return *ret;
 }
 
-static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
-                                            FloatPartsN *c, float_status *s,
-                                            int ab_mask, int abc_mask)
+static FloatPartsN partsN(pick_nan_muladd)(const FloatPartsN *a,
+                                           const FloatPartsN *b,
+                                           const FloatPartsN *c,
+                                           float_status *s,
+                                           int ab_mask, int abc_mask)
 {
     bool infzero = (ab_mask == float_cmask_infzero);
     bool have_snan = (abc_mask & float_cmask_snan);
-    FloatPartsN *ret;
+    const FloatPartsN *ret;
 
     if (unlikely(have_snan)) {
         float_raise(float_flag_invalid | float_flag_invalid_snan, s);
@@ -160,7 +162,7 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
         }
         ret = c;
     } else {
-        FloatPartsN *val[R_3NAN_1ST_MASK + 1] = { a, b, c };
+        const FloatPartsN *val[R_3NAN_1ST_MASK + 1] = { a, b, c };
         Float3NaNPropRule rule = s->float_3nan_prop_rule;
 
         assert(rule != float_3nan_prop_none);
@@ -179,13 +181,12 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
     }
 
     if (is_snan(ret->cls)) {
-        *ret = partsN(silence_nan)(ret, s);
+        return partsN(silence_nan)(ret, s);
     }
-    return ret;
+    return *ret;
 
  default_nan:
-    *a = partsN(default_nan)(s);
-    return a;
+    return partsN(default_nan)(s);
 }
 
 /*
@@ -698,7 +699,8 @@ static FloatPartsN *partsN(muladd_scalbn)(FloatPartsN *a, FloatPartsN *b,
      * off to the target-specific pick-a-NaN routine.
      */
     if (unlikely(abc_mask & float_cmask_anynan)) {
-        return partsN(pick_nan_muladd)(a, b, c, s, ab_mask, abc_mask);
+        *a = partsN(pick_nan_muladd)(a, b, c, s, ab_mask, abc_mask);
+        return a;
     }
 
     if (flags & float_muladd_negate_c) {
-- 
2.43.0


