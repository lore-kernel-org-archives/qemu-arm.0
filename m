Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C111C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:39:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdB-0006WZ-9l; Sun, 05 Jul 2026 00:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc7-0004tQ-5B
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:55 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbt-0004Ak-Gi
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:54 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so4503945ad.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226260; x=1783831060; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=T8Nke7VBw79ok0DwBulA/6kCjtrNSHe+I6s+oojEmf0=;
 b=lTHhJdm7H0A//GAo9jYNCUamzVjag5y6LaTdpX+rzYIqqciJ3oHP9bXvq9Iqfl4GQx
 ApLqsVlnramr1dBWokAlCIkclSYpyGBrpxSOxIgFcassbSgkCGsePOPN0KYKHOzMA4kl
 kd6xFxKdJYR7vaNcI2vfyzVl+oLRj1iflY+i4ICEA4YMuybXM/4sjFP8xZezym5gBnIi
 22og0OpVvYwi8McFG1IVN9oaSjZjEWLIDNLfXVJ3bzcvpEV/xZyRdKRoEJ69vxgsthKV
 o7/8+dffi6LEHUjVD2+KnCtHKwlb7M72QjV1PhRF50+wKwTYhsCpJ7Y9KuYMltcXforX
 6C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226260; x=1783831060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=T8Nke7VBw79ok0DwBulA/6kCjtrNSHe+I6s+oojEmf0=;
 b=KQzMI+GfwEt7O4kbcKFbOuPahnwLHy6FvKvM0c9UH9vq2VBEVNl98BaVqbuK8l++3i
 EKhytFrcMff/fhm+xcLVgOp2QjqPJv+lDFkUc7ZA7XTNsji6g3b3SJJw3YQG/MQCijAj
 VUW6BpN3155fcj0vUShgnAnRdJliRABM9YeFddmrDVNCuP3iJLAMMA9FG4nfwlKVshu9
 3I1LjSduWhuDgdXunXW3+M5ApJSwrIxs/yW+X30t1oqml7X5bSNpmEAToqDZ0b/gopVz
 u+THXKh/3n6FQDV9OzTEhXBjnftScDXbGBiw8Pf0RP4gEhxFY+PuafLeY4GqP5OrjQbK
 wmoQ==
X-Gm-Message-State: AOJu0YzwN8u9SiAxykyM3pWKo+PTQvCIjPSfu7tK7Bv6hDdpXW7lv9Gm
 ASDM9leqyIdtrvfTW0nlo705QY4l6QHyFQBksb0/ijC0qX6Q5x0SIhT+5kD+e5kds00=
X-Gm-Gg: AfdE7cnnjCsegbydDAwpU2Z/1TXawA82hgW3s95c9+BCcz0zOI+396kIWEyUuTSvFhp
 3g19F4rgLGYUjGaraFs6LkhZh39ahaxtcdMw8iZSOfvyfSy7aRvh45JT+1q96oR3gMbcPkjMNbk
 zezMbav5qXYgzU+zRilkdM7I5l+ApxdVrg3RttY1EsUbwMCOsyCe/qUxqHUnjYiRBdP6VwZOwU9
 e/R9ED8M41kNmVKUzgV1xW5Ud1pLLXJO9412TTr+7088awIhkHU+lZc62K2RxJ5Gu8h+ogJ2rY8
 IHRUcoIJnvdyqUBwUk/nwGkPk236mh5LmAUQa0rinZggdohJKVPo4OuhTLJ5cAJD/n/SOdL5y9j
 jkKKsuFUdGfzfKCqpTGhjzhoBYDCuDaJaerfWztciGuslHqPQuDzoiiusNq3eG9E0ybyvaj69ja
 IXKV0jZmdJKdahAhstEhvEZTjIOgGUeZTiMzieBkT2QhZPnFs=
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id
 d9443c01a7336-2cbb9ee11admr53447715ad.37.1783226259896; 
 Sat, 04 Jul 2026 21:37:39 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 14/46] target/arm: Use bp argument in
 arm_debug_check_breakpoint
Date: Sat,  4 Jul 2026 21:36:53 -0700
Message-ID: <20260705043725.1373137-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Use the matched breakpoint instead of looping over all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/debug.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 519a06fbc7..2389830b2a 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -331,7 +331,6 @@ bool arm_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     vaddr pc;
-    int n;
 
     /*
      * If breakpoints are disabled globally or we can't take debug
@@ -363,15 +362,7 @@ bool arm_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
      * TODO: We would need to look up the page for PC and verify that
      * it is present and executable.
      */
-
-    for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
-        if (env->cpu_breakpoint[n] &&
-            env->cpu_breakpoint[n]->pc != pc &&
-            bp_wp_matches(cpu, env->cp15.dbgbcr[n], arm_current_el(env))) {
-            return true;
-        }
-    }
-    return false;
+    return bp_wp_matches(cpu, env->cp15.dbgbcr[bp->id], arm_current_el(env));
 }
 
 bool arm_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *ignore)
-- 
2.43.0


