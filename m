Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E63DCCD195
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 19:51:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8l2h-0001eT-Qi; Tue, 14 Oct 2025 15:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2e-0001cc-DE
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:40 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8l2S-0003Q7-4K
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 15:50:40 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-781ea2cee3fso5547759b3a.0
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 12:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760471425; x=1761076225; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NaprHm1cxvsJDmn0tazFeaRDUdyxGs85ZVb7NZLiwUQ=;
 b=BoadkB5ufUW/kQhpver3k/OXF9svrBUAYAWwxvD+1Xuj2yt0yZsv96JVufxMP8MHHS
 eBBILFrEZIlgEQ1PMnLEW9tY5+Fcy78VwMZnrysmn04WG3dMy3bvxIm/DuAnfsT9q+Wn
 0qQ6cWoEow2OgbN46/rCF6ZBdu1MOiW7UV5ued3f8zKkSFIRpOBVhIlFKoKsLKimQ3+s
 i5ElbX8bKLR0nTpquHRilcnD620+nhm3ntsOR22nggBdM9tzuvOdzn3EtS1OGYy2JzHl
 IhDa35W+eHs+3+AXI2qd7qIDD5tgy9ll1MK5YgKBkyYL3VR7lBIhIL2SklNpmqfDMrHl
 f8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760471425; x=1761076225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NaprHm1cxvsJDmn0tazFeaRDUdyxGs85ZVb7NZLiwUQ=;
 b=amadKueWA1iuynUc4J+9VPZBYhL5wNTpKoaudSO+gxhgBwzDb+2Nw9mQBVjMHCGH/L
 cyWzCfnnF2FLm88jW6fM0uPoRIS78LwoJNmv3ipS3q+J9YbDmNhXLc+XeTozaNcSQwq+
 MtgDmUXJNfl/sJ4J2yTLwc6xbBklGiKiBAG0okq+/kd8EF7zKR6WpdJIOXXgJYwcd85i
 bYGhcdSntCW4nTCCC4nJm5BlD8tsCMoNzK0G+cCpL3sKBqZQ9YinMlqfcTPpB3jHReja
 QyYId721kiQTSZKZE1MH4X99DGv4C0o/hP72EVefPt1Mk5QVORJdzlx6XqXCvzCfBJ88
 +z4w==
X-Gm-Message-State: AOJu0YytFfbYdYYPQZ5MUEizPerTB+YlpFWo16p4EMR/W8Lult16Rx+a
 drzepkspOsxV39rWpVnXZJbqoSuKkxVtFv0qjH4YEmxzWBdFzRY4WQG3hmO1B8VSSKQ=
X-Gm-Gg: ASbGncshmsTN5ktz5BsHeg+OYHlFlN1acf+Kan/h/mrNE9VUsEcZerteY8SM6Bw6KMV
 RFlfCjBWcEbVyG5z1+ECu0V3apA3X8MIxbIKgnVI0+l63BpT4sNWTHppN7PNVIwYYOp5X8L2Xnv
 xIcEnA90J+F4h61557jVGOtRDmnmjQTS25M2QgRyxhI6GD2xK5YnHRaE1U3K7DXWGhcZ0nMostV
 giwocU3VwMPlZEwzWSLLmmrO7ZO9JjsfCFcCiRt0bYesl8mndWfJwQhkKG5VeIaxuxJrqxIftSn
 1FqI0JUjKC9ICmQB6h14TAehEeQU/Z3Ug5iDSZTBdHF3tb/lzv/h2waFDy1RCb7x5mJHm1omld0
 b5DG5oR1Ie8KDgA7QbLQXFfOU/4DpxHl/b/PlDkCchq1KZZUZ6S6YgXOXEb/uyJcmPTSp/jOJ
X-Google-Smtp-Source: AGHT+IFs2rdMt6FFIg1yhnB3QnB0IBgUKHJ1uJjzdqDmzAwZsNw2o0WvRbOlaH2ZY+SGXfevO8/6NA==
X-Received: by 2002:a05:6a20:9184:b0:32d:bb3e:c1b5 with SMTP id
 adf61e73a8af0-32dbb3ec680mr30750541637.31.1760471425609; 
 Tue, 14 Oct 2025 12:50:25 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b63a03dsm15918727b3a.19.2025.10.14.12.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:50:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 7/7] target/arm: Enable FEAT_AIE for -cpu max
Date: Tue, 14 Oct 2025 12:50:17 -0700
Message-ID: <20251014195017.421681-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014195017.421681-1-richard.henderson@linaro.org>
References: <20251014195017.421681-1-richard.henderson@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 1bffe66e81..6871956382 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1331,6 +1331,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
     t = FIELD_DP64(t, ID_AA64MMFR3, S1PIE, 1);    /* FEAT_S1PIE */
     t = FIELD_DP64(t, ID_AA64MMFR3, S2PIE, 1);    /* FEAT_S2PIE */
+    t = FIELD_DP64(t, ID_AA64MMFR3, AIE, 1);      /* FEAT_AIE */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index bf81da124a..31a5878a8f 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -21,6 +21,7 @@ the following architecture extensions:
 - FEAT_AdvSIMD (Advanced SIMD Extension)
 - FEAT_AES (AESD and AESE instructions)
 - FEAT_AFP (Alternate floating-point behavior)
+- FEAT_AIE (Memory Attribute Index Enhancement)
 - FEAT_Armv9_Crypto (Armv9 Cryptographic Extension)
 - FEAT_ASID16 (16 bit ASID)
 - FEAT_ATS1A (Address Translation operations that ignore stage 1 permissions)
-- 
2.43.0


