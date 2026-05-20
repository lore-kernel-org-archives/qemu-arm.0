Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C19CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 17:20:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPkZz-0002E3-C9; Wed, 20 May 2026 13:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZD-0001ZY-SV
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:47 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPkZ7-000205-Bm
 for qemu-arm@nongnu.org; Wed, 20 May 2026 13:18:47 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-3697c35eab7so2949792a91.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 10:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779297520; x=1779902320; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Y9B6zT/mx2Mvzh7dN19S7ANCk8vGCeBaMnJS1JCxZ8=;
 b=Tost7me5mqlv2zQeQP2l3mAN1Exog9I3YaWVTVPMWPijjDnPZKE+iA4/9ualMcM00T
 U4pz9376+Iys43Nm+mIcJ2dlNxXUrQU4NE1nkC2n7VSBWJm135X3ydjx4qd2VHG6hYxH
 YMKUKRvaLYULKzQX3r5B08wWtO2Urg8giE/mCe5Ha3WsPqMs26EefWxf5cwgfYpkIrAU
 Hx9tTd7SiOVWVAp7Zdoey9Coq/NCxJgapBf8Eo/5OIe4cFLrBt/SV1PM/1ekuEQLpstE
 rMhgA0VbJdeiQEBUo+2fEOqlYmLORIfoxFBzPxNPoIk1B7V0clwfQ1Fv20IVDeQP2Qsq
 p0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779297520; x=1779902320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2Y9B6zT/mx2Mvzh7dN19S7ANCk8vGCeBaMnJS1JCxZ8=;
 b=kBiKgsIZ6Kp5vHNJo5MCj5XnqMxHMtD+PBq1i8IwmlpPtfH6URbYccXUYtEUWSiL91
 H2U9D9HKWtDw6YKqCpwK9aRetAORpZ4z5JhTqgFHwTJ/VhGUlJHDZx6IhRkuxXMZL5c0
 s/HK58NphHovEfaWb7kj6OEWWToQjH7nrTLFQ4gmPAZYGSYL4ERYirriqxLgMSnCrA6s
 854OKMk/huQews3ZTqkv+35/1IeIAAVRDpx6+Kq8h/5HIcOR+J2buRLflzjdNwJ/han9
 +1x7wUhwpyyDCkqHt+TpEfFY9LVDQ4jOnRH/qeEEZUqF8JmYnXKve1eu1c5Kc/Csrqte
 xa9g==
X-Gm-Message-State: AOJu0YxqWk3J9CQWP2p7a/sVdxAtL9PtDeSeeiGHMuWy4kgHMhj6hQRF
 ffivaVJXiy9tmlqWBCiAZcify8EYJuhaectZ+BHdqegxS+blA2ZyZ/aRvqcC7FiiUNg=
X-Gm-Gg: Acq92OF4JJjZeYcr6181ahBk+VeY+bmDXypltKFD5CPg61tewlJO3bgusjy9qpJFG6c
 ycEIZmcu67rFwFTsf49t2odsK2nRjMbCgGVjDlQt7gsDkd8l+vsXUBTC4GxG0RDB8zDF9N/O0Nd
 Ucsj81vGazJ9w6xPOUOcpd5fLEGT6sDxq4ytxVC8E/aZtGFQu2d8juMohabX9+sDXYGeZBLmlvO
 +ZxTduWRMof9OFNBrf3e60uZFObmZvcsZorXKZa4RaLWlzd7n1r+UwaqbqJAPjeVIJZ/GfNSkuC
 cuIQ08sKWP8SXswcc6rfGF9gLzqdJMZDjGMaj3Fcg0cGypcpiw/cXN7xGOpQ7oHyrBEoBBhHQMM
 J/4f+0t5UjdJsaVvRI1Ka7z/Azh0ywdz4Gq8ZZJg2n2LUQpGeA1UO+onJXyE4FX46Zl68oz05La
 ZYgYbl42P7SB0vPdgpJtBqQUF4DhlD
X-Received: by 2002:a17:90b:2c90:b0:368:2289:42cc with SMTP id
 98e67ed59e1d1-36951b9cb8bmr23102426a91.24.1779297519631; 
 Wed, 20 May 2026 10:18:39 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3c83f226sm254416a91.0.2026.05.20.10.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 10:18:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 25/30] fpu: Use get_float_default_nan_pattern in
 partsN_default_nan
Date: Wed, 20 May 2026 10:18:15 -0700
Message-ID: <20260520171820.848839-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520171820.848839-1-richard.henderson@linaro.org>
References: <20260520171820.848839-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Move get_float_default_nan_pattern to softfloat-specialize.c.inc,
since there are no external users.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-helpers.h | 5 -----
 fpu/softfloat-specialize.c.inc  | 7 ++++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index d36e3a24b1..49e04ffee9 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -172,11 +172,6 @@ get_float_infzeronan_rule(const float_status *status)
     return status->float_infzeronan_rule;
 }
 
-static inline uint8_t get_float_default_nan_pattern(const float_status *status)
-{
-    return status->default_nan_pattern;
-}
-
 static inline bool get_flush_to_zero(const float_status *status)
 {
     return status->flush_to_zero;
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index bd6984282f..c1ed661f5e 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -89,6 +89,11 @@ static inline bool get_ftz_before_rounding(const float_status *status)
     return status->ftz_before_rounding;
 }
 
+static inline uint8_t get_float_default_nan_pattern(const float_status *status)
+{
+    return status->default_nan_pattern;
+}
+
 /*----------------------------------------------------------------------------
 | For the deconstructed floating-point with fraction FRAC, return true
 | if the fraction represents a signalling NaN; otherwise false.
@@ -121,7 +126,7 @@ FloatParts64 parts64_default_nan(float_status *status)
 {
     bool sign = 0;
     uint64_t frac;
-    uint8_t dnan_pattern = status->default_nan_pattern;
+    uint8_t dnan_pattern = get_float_default_nan_pattern(status);
 
     assert(dnan_pattern != 0);
 
-- 
2.43.0


