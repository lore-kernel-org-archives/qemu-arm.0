Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E83CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:28:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZ5-0001PQ-Ed; Wed, 20 May 2026 13:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYw-0001K1-0G
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:30 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkYs-0001sx-L2
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:29 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-366be8040a9so2156345a91.3
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297505; x=1779902305; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXEFjIA2Rc2Ly2XJsgxo/zPmqwc6w9LU/oPQ8iHupDk=;
 b=y3OT+wBDxDO3LQUQs2I77DI8jbA2HA5hOuMyu5uTFM2yvl5cu1f7AgnvfeCPDP+6GA
 oeXXSp5NjCBErwWYBADbpd/I0RMyCNmU22wkT7G16Zn3+AgIk2Rj4sKLln9OfU+0LuCu
 d6etZeQvbOaz0Mwtt5DuZuj3N6lp9HSKhtXVXLz3NmjB32sS/Un/XJkbv4C/XDihRGCi
 V4CikPWV+YzoPhBYfvCenyTtbiVYg7R/UcS6M4jwj7b9+rsFw1WCCmLKAll7sCgrjWZI
 Bp3yaMNW7pEA05aCbufpJpKWfcJskfz9tIpVEKO1UDB4YKivEDYJGFpyCEtol1//L5U7
 sNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297505; x=1779902305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LXEFjIA2Rc2Ly2XJsgxo/zPmqwc6w9LU/oPQ8iHupDk=;
 b=JoCX0V713G7lywuZLDGEQh5UAA9kpNopL9xlJ40cFVaRjVLX7h7TmFQlpcgHJsFkX0
 7QAlNtZzkkB1GzRZu0ivNK/tPJIISxxyyJkrrTMMySAteMIVTSvaN6uLLZB4Artqr4Sf
 Fsw3eaV/TNRGyfjPAtxVBc1aYyJA2mD/W2ywtQqQqX4jTKR++3Aiqjdp35nEu1IhVBNU
 94LoJSkAXpn1+ZloJ/uFxvzN7bb29VUqCZs8H9J+2IxIcvphtCUbc415C54NILIXmeB4
 c4jOzbKJ8wULKKEi/1aR2AESSqFmP5Y8aiLwHoiqxgJnqqBtcPmTTnbJ9zFeRr1Kfd0N
 RaxA==
X-Gm-Message-State: AOJu0YxohFck94jRj22ymU2vV7M2GHaUv8xId1d1LSrT/Ve9n2eJi1rc
 ElUgW8egmLYyz3vyzpL7LcdSrZJ3QZel9bPSZof7kMPDSriBiBaATHt7tWqLbcZNJJc=
X-Gm-Gg: Acq92OE+Gomt5UnLJZ+mFfbAHzQE5bAbaNXbbF0V5QKd+/ML9QiMD7LyNtITucSSD/D
 sGES5AUq5Jk5b5PJFnun04ShJfzubPe/7YzIi7rQvex3jWlx9q/XVLVTtGAiCgi/TWETzzhHhPl
 IQKZkTjwrZVsZORQfm9v4rR87eb+sawYnKGtsIBC/zL5X8QsB44a0FZT3GLbyM56CUfV5CFyZRO
 KeN5ex6ckiUuI4O/Url3i+fRoMsym8DKA4dlV8rxfqyM+f7NGgMK6Fu3zUmEhC6NcY/OmPXdOgc
 SjMP9ZszvMONgK+ffz+8CwTn4de4GoQBHjRxdA32SZs3d824flRessSwCM9AzrW3iifwYtXNsWM
 dl5tOs9Zu54hwg257tGg2jUJjLGGVF+We13XKVH4Ly2Eq/nwGTdYVbWVDzQI2qz0qkCO66nu965
 7U8Fxn00NlBIL9kGm8LZ3nXcmAxgIiv5dMXXZjwChqOVmJPfZlXA==
X-Received: by 2002:a17:90b:3c10:b0:369:a359:b189 with SMTP id
 98e67ed59e1d1-369a35a15a7mr16712972a91.19.1779297505085; 
 Wed, 20 May 2026 10:18:25 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 04/30] fpu: Hoist nan check in partsN_addsub
Date: Wed, 20 May 2026 10:17:54 -0700
Message-ID: <20260520171820.848839-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

The nan test had been down below because it was unlikely.
But if we have to have one anyway because of denormals,
we might as well take care of them right away.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 437b333341..3246702289 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -530,13 +530,15 @@ FloatPartsN partsN(addsub)(const FloatPartsN *a_orig,
 {
     int ab_mask = float_cmask(a_orig->cls) | float_cmask(b_orig->cls);
 
+    if (unlikely(ab_mask & float_cmask_anynan)) {
+        return partsN(pick_nan)(a_orig, b_orig, s);
+    }
+
     /*
      * For addition and subtraction, we will consume an
      * input denormal unless the other input is a NaN.
      */
-    if (!(ab_mask & float_cmask_anynan)) {
-        record_denormals_used(ab_mask, s);
-    }
+    record_denormals_used(ab_mask, s);
 
     FloatPartsN a = *a_orig;
     FloatPartsN b = *b_orig;
@@ -558,10 +560,6 @@ FloatPartsN partsN(addsub)(const FloatPartsN *a_orig,
             return a;
         }
 
-        if (unlikely(ab_mask & float_cmask_anynan)) {
-            goto p_nan;
-        }
-
         if (ab_mask & float_cmask_inf) {
             if (a.cls != float_class_inf) {
                 /* N - Inf */
@@ -586,10 +584,6 @@ FloatPartsN partsN(addsub)(const FloatPartsN *a_orig,
             return a;
         }
 
-        if (unlikely(ab_mask & float_cmask_anynan)) {
-            goto p_nan;
-        }
-
         if (ab_mask & float_cmask_inf) {
             a.cls = float_class_inf;
             return a;
@@ -604,9 +598,6 @@ FloatPartsN partsN(addsub)(const FloatPartsN *a_orig,
     g_assert(a.cls == float_class_zero);
     g_assert(is_anynorm(b.cls));
     return b;
-
- p_nan:
-    return partsN(pick_nan)(a_orig, b_orig, s);
 }
 
 /*
-- 
2.43.0


