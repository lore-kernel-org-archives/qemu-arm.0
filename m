Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E3BFF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:57:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzsW-0007fK-4H; Sun, 26 Apr 2026 09:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzrx-00070G-Tm
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:49:59 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzrt-0002qy-8k
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:49:56 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-82f8893bff3so4380521b3a.2
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211391; x=1777816191; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HfGQWAwKA0HR0AfaerNK4G6lb/Q53GYjwSjKhKZtA3k=;
 b=h/zp2Cf+hoa8CJd+zGfm4IhnPl1JD7HgEwUVtEARV9s3n+2lGz2cLFMUZUJ0OMViTV
 Tze15yezdbFjfibceUJ8jrkf/ID3HTkyQ9nySWdlCvv8RIcZvWA1OWSjNYOsqhnV+54Q
 nk8CJQ1UkfFlX+DklMC2XaWUvNAFBa7Ii6hbvFBdPETo0ZfZ96CrGLn59hFcM6FZqvjk
 X2b2URq7xaJ8NFo4uQv3l+VZqHY0tdLJuZHliNvX/OxLHueULxRawzD1QZRSBg5BdK++
 WymGfTGIGc5s3aajlgx6jZs+e8KF7/nAcmMkKSc2zW75g83pA8yVvMuMnK7vy3JlBe6I
 Ubqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211391; x=1777816191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HfGQWAwKA0HR0AfaerNK4G6lb/Q53GYjwSjKhKZtA3k=;
 b=ANojUL/2/5T6CXdGz8zgUriZp8ArkWekTSQ5U9nXyJI41e3d9R+mFO66etiO3zNy0M
 I+8AB4Iy9UYFoNW6L4BYLAf7pZR67ONaSLRjAcNoy4Dn+9umT+RaGm1yBYm72z0VQ9lt
 UDL+TSkJ5fmw4aAAYDXtGtS71DGdi+QhlMUYJTrCBhR4J3xxfdAMpOTvWLiiVWV/FX2D
 gxLYQy+udui/MNh6lP7F6WgptwnsYNs49iu3UWGbuvU2ZUq2vK6gsTmh88vUi43cozRf
 NjYjLzWjD0fZnPG/GMAwfvxe7yxRvYRwfw5Fd+FDfBylaxv2av32zZjJWm4QTLGQVU0O
 ErPA==
X-Gm-Message-State: AOJu0Yz6Acxf7+qV5T+fdVWoos9WlRZbg6qbXCECiYN4y4egPqySLlyw
 PhDzFwDawadxoIvDoUexgEcTKKtXBhTe5aDJR5LjsqVqMkMMWU9ud9bIJsaXxXTyAGg=
X-Gm-Gg: AeBDieuEaMaYxuI85u2D/ojxKS6N3gUR+YWkxQrV5OhozXG1TngHRX2fhnm6Dm3fFvT
 oyRJx1h+J4dpyGDUGA1qj1WEpTEuN9gqjYWFJ7LufaPu4ErzT2OiF/5c77D0OCry/StQGKDo9qW
 kw+ynoyuoowbBZab4XnlPIqZAXw0aGAMTGS1OI1P2lfv1VyGNN7YyiNCgkMOpqIMU6mErMNLdpX
 ldwhVLAfTyAHCxCY1fw5g8Yl99I3RtzGSzLFyr5TiO0scycpx+9sdnyWGjLYLkfvNLagP14yQ2C
 5i/GcX4Qf+r3mcUNdTZ4Z1YU0979I9SVjn4KHgrV2hpdFtPe+FUn/3RrWhQRPs677L4YnUN5prW
 vpf/0fkPA2lwYCeFdpz9oFgGe9Qw36JkL124UoHvzRuWqTr6tIUxzZSiFEhbsO5Wijz8n6CQmBj
 eww2TRN/IVGAgDwDCIDjwtddejPuR2iJhIgwzHbkFA
X-Received: by 2002:a05:6a00:4b4f:b0:82a:780f:a187 with SMTP id
 d2e1a72fcca58-82f8c94425bmr40215399b3a.36.1777211391196; 
 Sun, 26 Apr 2026 06:49:51 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8ebba485sm36307102b3a.38.2026.04.26.06.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:49:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 80/84] fpu: Simplify 0 +/- N case in parts_addsub
Date: Sun, 26 Apr 2026 23:39:57 +1000
Message-ID: <20260426134002.865628-81-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Consolidate the tests for zero and anynorm.
Add comments for a few cases.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat-parts.c.inc | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 6d65b7bfe3..5854f0dc48 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -556,6 +556,7 @@ FloatPartsN partsN(addsub)(const FloatPartsN *a_orig,
         }
 
         if (ab_mask == float_cmask_zero) {
+            /* 0 - 0 */
             a.sign = s->float_rounding_mode == float_round_down;
             return a;
         }
@@ -581,23 +582,20 @@ FloatPartsN partsN(addsub)(const FloatPartsN *a_orig,
         }
 
         if (ab_mask == float_cmask_zero) {
+            /* 0 + 0 */
             return a;
         }
 
         if (ab_mask & float_cmask_inf) {
+            /* N + Inf or Inf + N */
             a.cls = float_class_inf;
             return a;
         }
     }
 
-    if (b.cls == float_class_zero) {
-        g_assert(is_anynorm(a.cls));
-        return a;
-    }
-
-    g_assert(a.cls == float_class_zero);
-    g_assert(is_anynorm(b.cls));
-    return b;
+    /* 0 +/- N or N +/- 0 */
+    assert((ab_mask & float_cmask_zero) && (ab_mask & float_cmask_anynorm));
+    return b.cls == float_class_zero ? a : b;
 }
 
 /*
-- 
2.43.0


