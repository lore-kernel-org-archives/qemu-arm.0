Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0165DFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:48:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpl-0000gZ-Cl; Sun, 26 Apr 2026 09:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzot-0006bw-Vb
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:48 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzop-0001sB-TL
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:46 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2b24fede2acso61131725ad.3
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211202; x=1777816002; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VMfXr5S8cPMC+8Vry/EpCZiImkLfaNYbWDc+T09/bCA=;
 b=pI195jRpmUUasChWb3m7R/FBD9ddkE4CCll8Wtqt6b557kHvvT4W6Hna3bdg2bpdaL
 8h9Dj92GfFhtY876DGxRY/x80gd5ZpWkeAR4VC0tmyvtA8BUP9ZTCgXLk9fCz9i4QPVH
 /7ybrBL2HAcUpsgWFk7aczC/7j2ory9hZ3MFKLCsvqxjC3DhW/PoBHCK+WitUzCX1LYp
 5+hWiTzi6NGHx/fdo+XGnYSEQM4w8uFYM+JyayUixPbDs8XzQZBFKMWqE5qPSkiKngdJ
 7n40mIZHIFYKMtfWBrvI8eLzSTfdP8FCFqWqWpa265cMNz50jCxAARTOlnyiJ3wplrNn
 +xiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211202; x=1777816002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VMfXr5S8cPMC+8Vry/EpCZiImkLfaNYbWDc+T09/bCA=;
 b=RRy+3t2D/jzTHqE5SbdM4DakagVe8GW0Yfv68E8ulxMqU2S6moTnDI7XIKrraxoI54
 0osvqFwpzFyN3fnGmkFC/woE2fqVEGPKp/2j4H6MvpqJ/O1fgkRw3thjCARffJrchw/b
 3BEToZNPS9XkZxXRc57hgxX0K7J6yb7LkhPgEkaqg1WGu54ET/HwGMXUBOnYT9nJaXxS
 hm+nxWLdzLNO97/A8LHxyvKVIm/hr8j3msV1IWmKB4fXI7c9ygShZgHA6siPaxHX6jU9
 MV+WDLmzJMfr70ABTH0m4KTuLLrnZCiTvop0zBpQSfLii0v43HfNMtnc2Ufu/NqdP9GU
 uygA==
X-Gm-Message-State: AOJu0YyseIcGav8jo/2ZcqZmiKml4FqK2vLjP36AQMSK9nY5KV6WSucU
 cuAgBufInXVfAQRtcNhrdv2YayBS/zjpzvGpvG6jsGWHQGCglAndNVzX9JoL12y9XxY=
X-Gm-Gg: AeBDieudObHOVAFjVi+s1/8AkCu+ePdyX7tGW/AjsuutmTEdwTbZPjEAlxeCekvuhOL
 QUUIJ6ocpWEQEodT7hq5EwZWhz/9ayKD3RKR7kJxUT92Pr7t/pWuTfk65VqCI7K+KyVYeYzIhxC
 tq6pFJBjaJpC4J8fn14zP+lqiBc7o8iK4ng1TI+WJRGRRPAnVYi1ACtHYWDyMhIykyFKX0ZIq1g
 6QD03noV8KQQdifYxUUQ+2A1il4TxcBeiFu3q56A+wf8v9PQHJGLTXoatbDpMShMDRGw9GLN8Mv
 elPuv7P1uU3zKM4qNmq+LcwO9Mi9qKY+vc0iHGs9BeDqHTYkz6EcIjQCuwRIihNj5NKpZidguw5
 13qFteRwb1OHbTnY8JspflgsgXyhDdfnxCnwnbkovxRkm/NYl82Lnac/h+PIKKfabkxy2cR+zhH
 X8NXusP+anKE+SfKixq54xfx3Xugg9ijseWBuRTpVH
X-Received: by 2002:a17:903:3c24:b0:2b0:445a:8c7b with SMTP id
 d9443c01a7336-2b5f9edf973mr419506295ad.15.1777211202462; 
 Sun, 26 Apr 2026 06:46:42 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:46:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 78/84] fpu: Hoist nan check in partsN_addsub
Date: Sun, 26 Apr 2026 23:39:55 +1000
Message-ID: <20260426134002.865628-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index dca751fb94..244fdd90d2 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -530,13 +530,16 @@ static FloatPartsN *partsN(addsub)(FloatPartsN *a, FloatPartsN *b,
     bool b_sign = b->sign ^ subtract;
     int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
 
+    if (unlikely(ab_mask & float_cmask_anynan)) {
+        *a = partsN(pick_nan)(a, b, s);
+        return a;
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
 
     if (a->sign != b_sign) {
         /* Subtraction */
@@ -553,10 +556,6 @@ static FloatPartsN *partsN(addsub)(FloatPartsN *a, FloatPartsN *b,
             return a;
         }
 
-        if (unlikely(ab_mask & float_cmask_anynan)) {
-            goto p_nan;
-        }
-
         if (ab_mask & float_cmask_inf) {
             if (a->cls != float_class_inf) {
                 /* N - Inf */
@@ -582,10 +581,6 @@ static FloatPartsN *partsN(addsub)(FloatPartsN *a, FloatPartsN *b,
             return a;
         }
 
-        if (unlikely(ab_mask & float_cmask_anynan)) {
-            goto p_nan;
-        }
-
         if (ab_mask & float_cmask_inf) {
             a->cls = float_class_inf;
             return a;
@@ -602,10 +597,6 @@ static FloatPartsN *partsN(addsub)(FloatPartsN *a, FloatPartsN *b,
  return_b:
     b->sign = b_sign;
     return b;
-
- p_nan:
-    *a = partsN(pick_nan)(a, b, s);
-    return a;
 }
 
 /*
-- 
2.43.0


