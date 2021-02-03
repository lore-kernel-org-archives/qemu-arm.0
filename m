Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp507689lfo;
        Wed, 3 Feb 2021 11:41:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4+16F6gBqEts+ClSPAuaJQGjzi8dQ93LnV4+Z4dWDomCLmWN4vrbgis41r7vl4f530VOb
X-Received: by 2002:a25:6905:: with SMTP id e5mr6488064ybc.54.1612381306997;
        Wed, 03 Feb 2021 11:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612381306; cv=none;
        d=google.com; s=arc-20160816;
        b=GX4PVeN4N4+Dczcq1ljYWYLdxQEsWL/bdxS/oU6j58PEtSbyGHEdbDS7IpGtUjVR9A
         5c+5y/JcIfiz+S6Jx5CEjrQ2huHFVfzyS3Hj0SHY+b/TKvbGTAOhaVkAA9f8w/glaRxZ
         mzpY5jNAQ05mODz2WU3jyHSygImAi/ST4PNh5I6b2TN4ZK8ZEuYBv/jShfx+hGHVgfnh
         v6SA4h1UryQpE34Pb2srkJagdewSWUw+303fHVZPhBq7+u18R02nn0bgkJbJ9QpFOkr+
         LKHB5K+8qL5+/o5ZL5JLSwwK1FM+2UC4LRc91VGAqSZzuZYHRSZqpK56JS+7G/9L8Q7e
         XyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MTkuzyqIbL72JEm6HgyCzOP+l6RLV374RyEwxbETzcY=;
        b=aKCLFR5R1LrIlTxyKlwPlqXv2Bhh/YkWM01UqXVcxb8ZVIalNdDI+99oHIPu48JhHJ
         K4rWpmGbNkzgG4GpP0rmlCwTcfdyRyBrN1kwPCiTXPgQgUt487ZY0axEguUpt+FHuvy9
         Ib5+JFjy6LrA2fhmp5dkHrBvvZUYfJLlwWMPy0bAEjzakNkbadQqFmS51L5yYIqzvpk7
         nyDjzJP8PltgBX9K0ZTyN40TPdi7Uj39E8dz9TiodJzOkiLubgNcI+VfFqNV2NJQ8JCC
         xAMAVpVec0mavsUAtJ7IMtdI+adGEXRSfDRi5YdUZJaiV/H4z/yWvYyMna5PiP5sX1uw
         CzcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qNpcJNdx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b92si3453569ybi.434.2021.02.03.11.41.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:41:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qNpcJNdx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7O26-00008k-Bc
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOt-0007X7-EH
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:15 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOl-0001nY-HZ
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:15 -0500
Received: by mail-pf1-x42e.google.com with SMTP id o20so444702pfu.0
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MTkuzyqIbL72JEm6HgyCzOP+l6RLV374RyEwxbETzcY=;
 b=qNpcJNdx+241EHVCrO0IuqMchkMBMsj2pGp8l4+aKO0Dk48hHFWa39Bm8xkBE5Rwcx
 YHw8M8ZsU6gV/fsGN/NXOZWJuuvWTP9RL19kusgM+FpG+GqwjGGXMzgeSy2EzEyryyov
 BdNLWfZC6WaoM80FXXTERxHmmu6fJ5GncSGz/7sWIQiYYmpyEMRC+tUk0lqTHx8j5n56
 dXY3M4rmkMimNJOYJLe4mlNw7V7SgrwN+0LDd8TGg37qehVcQ2zkxXc2B5cZCyFP19GI
 n8PQwIDcGl3wTKBJNSTDhmYQN4WjUYjNUycdMxbHUGsbNRzSs+tb2xPFyYAoQ+s4ZEAS
 Xq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MTkuzyqIbL72JEm6HgyCzOP+l6RLV374RyEwxbETzcY=;
 b=pxQzAT44gnTt244PLMN5kzwEXvVYiMOgOqvqc3x01EKF6i2/yEuxahcIpi2bacJ7/J
 iShvHRbDe/NQ/r9DZnX9zbx19RRgJXbEzqBdlff0oflRB0SQm6D3uG/1nBaCl/tnrkMU
 7VypjY5J9B1lzlePIT5dpFLXq9YpVq0j8G5sQCxSJVN65rp0p+dZ1ZiZbozXgrf0JN1L
 XR9pBnU0AgeqlrwNwvVa/ReNGGmxtugnyEwr9JZRrYvZ0jzrHBOKa4FA6aRQSX/7TmxZ
 oag0na8U+L9gC4zkfOdIAEtwzqJwZwNwFGTzYxA2MQj7kFOtlFNhgly+xdwT298fsxLh
 B1Tg==
X-Gm-Message-State: AOAM5333u81aufV+OADTG72Yjxjx3bnjXpihRtwpwVnVaGKtQISFw3++
 KMG3aMJMgVaJu0jnLPb8KE68BTCvCOOd2Y7W
X-Received: by 2002:a62:cd86:0:b029:1c7:f5f6:787f with SMTP id
 o128-20020a62cd860000b02901c7f5f6787fmr4444566pfg.62.1612378859308; 
 Wed, 03 Feb 2021 11:00:59 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/31] target/arm: Use the proper TBI settings for
 linux-user
Date: Wed,  3 Feb 2021 09:00:01 -1000
Message-Id: <20210203190010.759771-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NuL1cLFI54/b

We were fudging TBI1 enabled to speed up the generated code.
Now that we've improved the code generation, remove this.
Also, tidy the comment to reflect the current code.

The pauth test was testing a kernel address (-1) and making
incorrect assumptions about TBI1; stick to userland addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      |  4 ++--
 target/arm/cpu.c            | 10 +++-------
 tests/tcg/aarch64/pauth-2.c |  1 -
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 853fa88fd6..6efe0c303e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1413,9 +1413,9 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
  */
 static inline uint64_t useronly_clean_ptr(uint64_t ptr)
 {
-    /* TBI is known to be enabled. */
 #ifdef CONFIG_USER_ONLY
-    ptr = sextract64(ptr, 0, 56);
+    /* TBI0 is known to be enabled, while TBI1 is disabled. */
+    ptr &= sextract64(ptr, 0, 56);
 #endif
     return ptr;
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40142ac141..db81a12418 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -200,14 +200,10 @@ static void arm_cpu_reset(DeviceState *dev)
             env->vfp.zcr_el[1] = MIN(cpu->sve_max_vq - 1, 3);
         }
         /*
-         * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
-         * turning on both here will produce smaller code and otherwise
-         * make no difference to the user-level emulation.
-         *
-         * In sve_probe_page, we assume that this is set.
-         * Do not modify this without other changes.
+         * Enable TBI0 but not TBI1.
+         * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/tests/tcg/aarch64/pauth-2.c b/tests/tcg/aarch64/pauth-2.c
index 9bba0beb63..978652ede3 100644
--- a/tests/tcg/aarch64/pauth-2.c
+++ b/tests/tcg/aarch64/pauth-2.c
@@ -53,7 +53,6 @@ void do_test(uint64_t value)
 int main()
 {
     do_test(0);
-    do_test(-1);
     do_test(0xda004acedeadbeefull);
     return 0;
 }
-- 
2.25.1

