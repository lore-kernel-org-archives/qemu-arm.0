Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp845142lfg;
        Mon, 24 Feb 2020 14:25:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwoaaW8lNwB+/hLp8rUxM5jgSuj6Is6FoxZHYtkl8lbP/NC2ZpWKsSN6jVPR3JQ0cNZ2/ui
X-Received: by 2002:ac8:7508:: with SMTP id u8mr29953215qtq.163.1582583106242;
        Mon, 24 Feb 2020 14:25:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582583106; cv=none;
        d=google.com; s=arc-20160816;
        b=YGXAKVO6cV/2IuFh++2s8UU3Zuc6ifDXUjpBNHSPs1AD2QS9VcgYiO+FQoUvq5up1u
         FEtZBucKEdELL3KdLrZhzxnL3RLCiZDR7l7/Qjo7TDh9Qw/Ke/ufAUxfByzh/nNWrmXy
         kxX42SkBgI04KCO3kVRMLau1V0GRDbhAUVq/q4KKXKSEo+rpP1HUsLhv8DcIYwI5rik7
         8U+qOo162kIdWPjaDNHFmaBAV0umDgYYAwg3kcF3lunxZMQ8P3+kH50ZkaI22oz/GW3A
         vuAtmCcvPg432tx0IjdB/+OnI9AT7Y5od+VLnD2MTSE4fRfpbZ+mcvrvV77WQa1hzVNI
         PzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LpDXkMJymCkBigdAeSGEBRetKSjrJSWM6nnEjxNkcOs=;
        b=sWhxadjb6vFXWn2cLpDyeewviFyby1lxQ2KI+Bb7xtTkn0NCXPKgNkk5EtRnrDRl9H
         tYhIpjciLrDaTGCqQmlpOtvrQY3P0sd47d4MYCoWz24ZqOreeTa81CSTrcSMRXvS0/NK
         4vkUY1cg0d7BmRf6WARQthHD98unnpfDjyIfRaCWGTeqW1E8Ta6Pgjqhj/Nl/pXOfL0F
         1S8yjaRZ0FNVYRM8bLOhUr+VUao2DtDwrPrXYCazSAnpPTep/CxRl6DVAnIb3cEjjJQd
         ytyfnlf+CJCoV584Uyhyv+HFJPSj5Ji/tuQJmKzS+icUuf38NlWESUGASk8fMWBfxB9f
         4Fzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qLd16Hzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si7065011qkn.19.2020.02.24.14.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 14:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qLd16Hzs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6M9x-0000Zd-Jf
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 17:25:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7e-00047G-Uz
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6M7d-0005oM-Rx
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:42 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37001)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6M7d-0005o4-M8
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 17:22:41 -0500
Received: by mail-pf1-x444.google.com with SMTP id p14so6073695pfn.4
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 14:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LpDXkMJymCkBigdAeSGEBRetKSjrJSWM6nnEjxNkcOs=;
 b=qLd16HzsDhSXKCYXkXTlKuDt3c3IGFTybZKTVNQZ0oLUH6Q+wFmc3ojgqTmTBF+lga
 reJBMEOc3d0HGrcJWT+5pwn2YuKZCj7XZZFktyRYUhs1t4j4rUnLOdTd279+hI3k80bV
 7RThRAywKqCbT/aTKrIhDoNm2C6MZf+TOEC3UhL1Ol0t3Vm3pWHsjiEbXyRmCZ2ra/Pa
 2G6G2HWCRPzSaPEW79O9mQAyX6IG9oQ5EQKhoYUlE1K4dTiQ3dSsZxZT9esq71c5YkvW
 r+wS9B8Givx3o6jzFYJt8CABwk4oq0ENTfg9MiHRnkRh0xNyLIWCYVvIcODDOxRQPdyO
 GFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LpDXkMJymCkBigdAeSGEBRetKSjrJSWM6nnEjxNkcOs=;
 b=hddu1Gm7pW9ucvTx7yxrsE868XX2js94ZBI1WjbtqMDKI+PVo96C27xEq52hJcLjYW
 yjsQZwLyiiwsVyLYTaEgGuJ87g6RX7dX1x7Q+VejPdJseewtc9AIEu0PlfmTdemhzIo1
 J8MdwUhRD2XJ6xv3y47EQtWxOzEGfqNIZfRSKISaxrhIHLpg3inQM6TEI+AkOOjqYwXE
 Xj+ZIENzvaBmKu7/gSOTVlzJPcjISK5Yl+vnqz+qwjgGL5jUDeOjf9rvJtKg8ClnKAyE
 5EPVjGJ502AUnP3tcl82ANm1lr5MtmGZetqBAXAmjcAN2LQPcXPPehhTv7G1WBON0Cw3
 asQQ==
X-Gm-Message-State: APjAAAWP80loZ5htQoxyx4VewGh1qzCmi2KF1C10HVo2Gl7epLfUCgdO
 +GjjZBWDDx6OKKfIO8F58iqhyYnjYow=
X-Received: by 2002:a63:2842:: with SMTP id o63mr56554627pgo.317.1582582960842; 
 Mon, 24 Feb 2020 14:22:40 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id o6sm13897097pgg.37.2020.02.24.14.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 14:22:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/17] target/arm: Improve ID_AA64PFR0 FP/SIMD validation
Date: Mon, 24 Feb 2020 14:22:20 -0800
Message-Id: <20200224222232.13807-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200224222232.13807-1-richard.henderson@linaro.org>
References: <20200224222232.13807-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ymE0VfYLzPgs

When sanity checking id_aa64pfr0, use the raw FP and SIMD fields,
because the values must match.  Delay the test until we've finished
modifying the id_aa64pfr0 register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5be4c25809..f10f34b655 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1427,17 +1427,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
-        cpu->has_vfp != cpu->has_neon) {
-        /*
-         * This is an architectural requirement for AArch64; AArch32 is
-         * more flexible and permits VFP-no-Neon and Neon-no-VFP.
-         */
-        error_setg(errp,
-                   "AArch64 CPUs must have both VFP and Neon or neither");
-        return;
-    }
-
     if (!cpu->has_vfp) {
         uint64_t t;
         uint32_t u;
@@ -1537,6 +1526,18 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.mvfr0 = u;
     }
 
+    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
+        FIELD_EX64(cpu->isar.id_aa64pfr0, ID_AA64PFR0, FP) !=
+        FIELD_EX64(cpu->isar.id_aa64pfr0, ID_AA64PFR0, ADVSIMD)) {
+        /*
+         * This is an architectural requirement for AArch64.  Not only
+         * both vfp and advsimd or neither, but further both must
+         * support fp16 or neither.
+         */
+        error_setg(errp, "AArch64 CPUs must match VFP and NEON");
+        return;
+    }
+
     if (arm_feature(env, ARM_FEATURE_M) && !cpu->has_dsp) {
         uint32_t u;
 
-- 
2.20.1

