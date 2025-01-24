Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp930906njk;
        Fri, 24 Jan 2025 08:35:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTDdgAGod7EDM8rseYNrBuwJmEH5IFUDqxMmfWG+EFAgIlNYBsThafgqfOe50dqOdG80yAbyt85dZdTw==@linaro.org
X-Google-Smtp-Source: AGHT+IHNkvuNPZsPEMXudr4gA+4lxbDD4bflgomqOYGBjWIauKOr0YbpjQcxlQ3PsOzVG6DzCwgi
X-Received: by 2002:a05:622a:58e:b0:46a:3579:d137 with SMTP id d75a77b69052e-46e12bbbec6mr432943601cf.43.1737736556654;
        Fri, 24 Jan 2025 08:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736556; cv=none;
        d=google.com; s=arc-20240605;
        b=dsQZOZ6p/D1Pg9jD/uj2/kk0ql0UBspE48b7VNhXnGmL0HKG3YR5MZqUZdiM7T/g8j
         ON+umkup5lM1MIBrnLoKSxCWOiVuQUzmGqnqkoIX7kn4V7/+lVX5h/ubufz8IbDSPng6
         sM/o5wgFxgitdaZWomKS25cafU2bQl7avQuJgbzQZFmSDqc5wtx8pS3qklj/eDdbIizy
         IXw3TXCAlxNoBEGVx5zaOGQI0MzJBAyBz6PkkZT9RNwSbzZVa9/OUecrALBfQlG6lYFX
         TW7xYKOFeID/oIxx0RIDV2DupDlVGTq0cVtiIVH9HJIVDaIR3CS4NbE2t4g9wJpEvUcn
         /9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KQPKoJ5OpJcpnmKsSmz59ndMFucnaB6ozSHh4Jfa8B8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=PIGKFQe/4ROy1lFOVsaCiVwX/rbyonivDfXuDPc7Ekjo3eLP6sqzQYocjIf7A5XlzW
         dY/08C2dtZPJmqPD7YpVfWxqQ/JD7LIOM+wMrludXc4/E6/4xSy/LTkIgsTwbfRMRMly
         foYWti188QM84Jywm6ots0rpj5++TmWQy3Easru4yccC1wHVcKkL+vNOa+nnbqSnDpTG
         kYtsUpOCY8k5BRpdqFTf9UjYrBJehA3gLYXd6kf8jD42dzQI+YaU8rFyfWcW21wWVIx5
         CoG+Qz7U5QKKHaUSXVoIFd31BSB2j4j6jtfzxg8YmTYNuDKUgvM75/5OuorklI9EES3Z
         VZwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RI/oDXFY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20613391esi25393666d6.453.2025.01.24.08.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:35:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RI/oDXFY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMdt-0000k9-IP; Fri, 24 Jan 2025 11:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZh-00069W-6f
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:32 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZU-00063C-US
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:22 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so15792845e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736211; x=1738341011; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KQPKoJ5OpJcpnmKsSmz59ndMFucnaB6ozSHh4Jfa8B8=;
 b=RI/oDXFYI9yyKJH/o8R26TgPNZYSTgHU8z7ohuxWtcCEhnrIjJ/4diW8qAbZrVGy2g
 xXGZzdz+xY1e2s5ILhFNXb9tEwT8asiyASAsXzNqmi5rDxOioLDWqrOjfS50LOICK0/V
 V89TlgHRVfxssIWlg7ynNnH1ftFOsz27LvvSEYo4F5Xw0cBCY1rbeKewrIJeJsKgYowd
 dQMtGp/2CQ0fCDT89PalPyYPaAL6qFUgyBezKFU57KCJlcXPlCQENqq3hA8PJDp8JuME
 B6sWWsdG31t1s1rmowa+QgysflH91MZdhq+ctsL9xxR65mQci6EmtfC5+lVxJRcVGakR
 Z0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736211; x=1738341011;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQPKoJ5OpJcpnmKsSmz59ndMFucnaB6ozSHh4Jfa8B8=;
 b=EkIIw1obiefM8ZJkrhXXaZdm8s8Ts9suvA0Bxzq9ecnGEKjyFnKPxyBGb/ZwZv0GM3
 GDkYLr1KU1Ma8Z9EgaOkInkZqdVgnY7JPV/NHGkxIqOfM5uJT1dSwnQhAAHJ/oDk7ux/
 9ZxDgB7723OfF4UD85dzrKbkQJIr/F/Oj3ZmzJWvP0tnI6qsMn/mWMIO8VoC185NVNy2
 YnRl/fbojKhd0bqfdabl5GezO+4yyS0IBMKQcxymAule89pJgBoOr2yoSHSSE8FANbEN
 1IsC2PR0xWTNn/dUT8cTFwbg65fnJfqUumuCtMI/v7z8HjJ9iGvcfoayntv/pdxePD48
 pj5w==
X-Gm-Message-State: AOJu0YzEXJ0xaDU8IZxXCNg0h6zVQFjX+qkKB9BL+KtTH9ye7dzF5uGf
 oXnWn99Ml/EWr0MZQaPmkUvAPnf2OXbUtj5gj+Qgq+qXQFG5eCCJRx7bvCV4S74PTIDyO36DwWr
 X
X-Gm-Gg: ASbGncsR8fOLHtjYr91hvPW0YrHxCqyo4Utp7MhmNzA/4JbsYb0Nt0dJxXulQa6jy1H
 pa6XCBgDbjU4i2Puh4wuGZ3OAhinh+0xJQBjQugD3NHDg3FdSTBVs/Ie4yA8mAQiZUOn7iwD8lK
 qXsRG2xwiQ1A2dlWloVDHagSuMJcG1gQ8HO80LYlYPS1Q1ixmDtqzJCPYM+GlAGTrnEH0sUI10y
 vsG96wKpltKiwS8KiUsnIxLmD2fVGwWlAKZ8fjuoN6El9ViiQqTy3/eh5r0U/2W894yhSlKO0VI
 58oZh2N0Lnw=
X-Received: by 2002:a05:600c:3585:b0:434:f297:8e85 with SMTP id
 5b1f17b1804b1-438913d5da1mr330585925e9.10.1737736211271; 
 Fri, 24 Jan 2025 08:30:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:30:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 73/76] target/i386: Detect flush-to-zero after rounding
Date: Fri, 24 Jan 2025 16:28:33 +0000
Message-Id: <20250124162836.2332150-74-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 2ml+qKBWYBMW

The Intel SDM section 10.2.3.3 on the MXCSR.FTZ bit says that we
flush outputs to zero when we detect underflow, which is after
rounding.  Set the detect_ftz flag accordingly.

This allows us to enable the test in fma.c which checks this
behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 8 ++++----
 tests/tcg/x86_64/fma.c       | 5 -----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 9bf23fdd0f6..5c233fdf5b4 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -189,13 +189,13 @@ void cpu_init_fp_statuses(CPUX86State *env)
     set_float_default_nan_pattern(0b11000000, &env->mmx_status);
     set_float_default_nan_pattern(0b11000000, &env->sse_status);
     /*
-     * TODO: x86 does flush-to-zero detection after rounding (the SDM
+     * x86 does flush-to-zero detection after rounding (the SDM
      * section 10.2.3.3 on the FTZ bit of MXCSR says that we flush
      * when we detect underflow, which x86 does after rounding).
      */
-    set_float_detect_ftz(detect_ftz_before_rounding, &env->fp_status);
-    set_float_detect_ftz(detect_ftz_before_rounding, &env->mmx_status);
-    set_float_detect_ftz(detect_ftz_before_rounding, &env->sse_status);
+    set_float_detect_ftz(detect_ftz_after_rounding, &env->fp_status);
+    set_float_detect_ftz(detect_ftz_after_rounding, &env->mmx_status);
+    set_float_detect_ftz(detect_ftz_after_rounding, &env->sse_status);
 }
 
 static inline uint8_t save_exception_flags(CPUX86State *env)
diff --git a/tests/tcg/x86_64/fma.c b/tests/tcg/x86_64/fma.c
index 09c622ebc00..46f863005ed 100644
--- a/tests/tcg/x86_64/fma.c
+++ b/tests/tcg/x86_64/fma.c
@@ -79,14 +79,9 @@ static testdata tests[] = {
     /*
      * Flushing of denormal outputs to zero should also happen after
      * rounding, so setting FTZ should not affect the result or the flags.
-     * QEMU currently does not emulate this correctly because we do the
-     * flush-to-zero check before rounding, so we incorrectly produce a
-     * zero result and set Underflow as well as Precision.
      */
-#ifdef ENABLE_FAILING_TESTS
     { 0x3fdfffffffffffff, 0x001fffffffffffff, 0x801fffffffffffff, true,
       0x8010000000000000, 0x20 }, /* Enabling FTZ shouldn't change flags */
-#endif
 };
 
 int main(void)
-- 
2.34.1

