Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1995227ejb;
        Fri, 24 May 2024 16:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3iW6O3KjyKrfs8eiO2ET0dIhVMgQRG9Hi5/DipOQuPuWgLvWW4mJl9nGWTeiiuXLHvpegzaxbN7boUO/o/cwLvzFWe/8D
X-Google-Smtp-Source: AGHT+IEZFhjOv6VShqRiwEBLMF7GMvufI1KCC3qU2loE/Bme7ZADvC7gkHySIIQ+Jsvup7M8nU0g
X-Received: by 2002:a05:6214:5a04:b0:6ab:9903:fd66 with SMTP id 6a1803df08f44-6abbbc0ca94mr40731226d6.3.1716593406910;
        Fri, 24 May 2024 16:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593406; cv=none;
        d=google.com; s=arc-20160816;
        b=FaPBCQDOS1cwd9vNXBb17+thJSUaKHXKEaFrKr2vA/ZS9THqwReNbzLAC6DC1maAwx
         X/8LPQQhGdTUQVZkpaC4FbH5t1yzhKinIYC1MkxZUuFcosygF5E3Nt/O6+qfsvGxpTLO
         nvMuy8IOS6j/npY07S1fyCRLd2fM+k0oiDKsbjz4yhROtX+GTgGH9a7tcN5vKwS4Ahn+
         TzHWRBD+gVVE5Jcdpn2DREiS053OruAKzTMnb/SODRaDR0Y0nNv7FWgbNQAZS84pAT6l
         yVAx9eyN3+PzWTEy8gId5guai6CN33gSNu6l4tM1VP5opoki7Am8g84+AZyutz8cok+K
         dE4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=opsbeM2raunxCajavxAMAhO8CHOlNCLI/4hm0OSSpr8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=xA6h4x8taF7hZza7N9ZfS17d9cnwBUSS31bfd947htBFOSkM+XJY270z600YWEQRu2
         olK5PheokSbbkk02vfUT/2rBNGUiV/UBDIbY77q49jYS6cOPpQYSYCpm4B7pc/fWjPFT
         Ogy54k+fmpFjc26OgZlqkcLWEoHw6wb2xCYg+PZSS8q/3wMPc/gqsbI+PaTDSmFv3cRz
         s+x2bKHJhhf+82BOZpLi5B4LvMKg4mbEs2Tvr+q2on0IViAUuSs0X/vatZ0rKBR/Uwso
         WBzeXBO+ylebP8r+8uG2LNlddSYb3i/gM7iFKHwzaewz+7r0G+bCIJXJykB7lkpRQg0F
         ag0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ERbOpDzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162ddb39si27098236d6.584.2024.05.24.16.30.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:30:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ERbOpDzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeJ7-0002ye-Lc; Fri, 24 May 2024 19:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeI0-0007hJ-RC
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:34 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0006tG-Aj
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:32 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6f8e819a540so1448127b3a.0
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593109; x=1717197909; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opsbeM2raunxCajavxAMAhO8CHOlNCLI/4hm0OSSpr8=;
 b=ERbOpDzHVVffVzQAfQJFFsjhUtlhzeGICqF76qHY12mLZ/NFode4tcy7ugC3Odcix+
 0mCBIQvVbdSP9/hGU84w4mysHK/7o67t7IibdGY6qm+NEa7I/GO3FPrCmumlPCap0PZv
 P4ODzdXrAyUqjaE2Xza92+qxQd+QIbLuW8Tiay6tAODKuP5cKAaVpzvwWq8y29eAx+6U
 CODjX+2yXS/u0M9BgJ5BrLjeohtqYh+T6pq76eQVonbasOm8EHOl+eniYDf4nqOXk76y
 BZrWwABCnA5dYjGu9C9cTl1FjQmh4i02YSsfwPiozKpJskO+abE9sHPJrwJv4NPx6Oxk
 +QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593109; x=1717197909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opsbeM2raunxCajavxAMAhO8CHOlNCLI/4hm0OSSpr8=;
 b=D0RT3/1e119kssVO4gxqPeTrUnWtGbng5ZCbxvxZRfmib75UFRKTI2S5WsbUByUefu
 DLNg9XApMx25ApQgfZKBaWTXMvjw6vkk2TBLYl4pjXedfTp0yIL5M+KNVOwoV43WjT4k
 ybGFV2YTzd4mIKnZHiUMqIIaQ1RE4cA53D/jDvHM41Mv++MF/tDuv9FWbLddD8akLS5X
 UkFaMK4em/jVOnXWilkvoLlEx6ay77k/HC9B7no1zskRTMd+iUkVb0bFKSE7Vh5QKyNA
 wM8gy4w3Hun9hdDdeT6FOHMFuDjBW8c8K93mqs3S4zNsExt4BQanuq37Xaua2kBbMVgh
 eE5g==
X-Gm-Message-State: AOJu0Yys7UdsHfYwK0hVfbJPoC5zQBCzXAgccS6JmZk6pIMY6s0JQZma
 XDfTverh8aL4EgtGQd1XeKcq2aXP5GVpDFzhD5Wx6P3InxMijcCPHetJFSENk0uHYByA5wXfrs/
 t
X-Received: by 2002:a05:6a00:4c0b:b0:6f8:beb9:c0ba with SMTP id
 d2e1a72fcca58-6f8f45e47bamr5232863b3a.31.1716593108928; 
 Fri, 24 May 2024 16:25:08 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 52/67] target/arm: Use TCG_COND_TSTNE in gen_cmtst_{i32,
 i64}
Date: Fri, 24 May 2024 16:21:06 -0700
Message-Id: <20240524232121.284515-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: 36Z5fo0TKEBo

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 51e66ccf5f..1d6bc6021d 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -933,14 +933,12 @@ void gen_gvec_mls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 /* CMTST : test is "if (X & Y != 0)". */
 static void gen_cmtst_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    tcg_gen_and_i32(d, a, b);
-    tcg_gen_negsetcond_i32(TCG_COND_NE, d, d, tcg_constant_i32(0));
+    tcg_gen_negsetcond_i32(TCG_COND_TSTNE, d, a, b);
 }
 
 void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    tcg_gen_and_i64(d, a, b);
-    tcg_gen_negsetcond_i64(TCG_COND_NE, d, d, tcg_constant_i64(0));
+    tcg_gen_negsetcond_i64(TCG_COND_TSTNE, d, a, b);
 }
 
 static void gen_cmtst_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
-- 
2.34.1

