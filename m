Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp557073lfg;
        Sat, 21 Aug 2021 13:07:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMQSdEEwbFqu85E1mBof9LCanB+oxdI3SStcyTFZUqrcgzqTb3nnfd8+7TH88oQSDibT9v
X-Received: by 2002:a6b:6319:: with SMTP id p25mr21308715iog.100.1629576445912;
        Sat, 21 Aug 2021 13:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629576445; cv=none;
        d=google.com; s=arc-20160816;
        b=xnG8/dRDhAbyLmvSbqZ8wLAWR2xsxVYSYgyNTM6WBb95srQVs9R19Ai2T2TN5Iysjv
         KcS4NX2d1Q6ZJE4YUt5e+E9aerjEuz7KQDEvwR/TNAV2Slx6YDcZKyG6uTWifeHtMQ39
         y1bc7Z+pj2UfzD2goJFLhbeYFjnZ/uGp21Rt36P7qCS1JcpEeilp2/SQ8pclKsUTU6Ok
         ZP4qfAFjRlqlQbrgk1FHjiuFICc9sOTtW+5JZLKgQPnE9lKOVYiEQ8RfeH64L/oACv/B
         g4S3zRABQhcciLfN28jns8eaP56H0E1fn85wCv1zVWIvDrK/GsPGFh7cnl6YXlypndPT
         Hgvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
        b=n1TeaXeRQGa9yWAoQA27U7kGR3IA17naXqEGhC3JsB8ZgR7Q4i1vfMlK3JxJPbS0e5
         RdUxzYn/V2maJg3wHTEe4e39m896h0KyOLYuySjBUPaRpawR8vXZ92ejGrKY92KW4/f1
         xf/+VoeQ56U+4k37CNWKzIVaniGa+wp4BIyB2sslsBygjohh7yVfjebsRlWrALsgW3S0
         L+7peHYiFLVs5fZ0K4hu96dcRDZ0JEo2fXmP0kujdE2iwlE5+hmUw6yJPiKulY09P88z
         J2fDlQDOozE/s/fBrAoFj96XwMRG2D1kiqK6KJHkxNgBz9lf8J+abzDPvV0RnDQlMJGc
         NilA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CWy0u4It;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9si12509446ilu.22.2021.08.21.13.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Aug 2021 13:07:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CWy0u4It;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mHXH3-0004vF-B1
	for alex.bennee@linaro.org; Sat, 21 Aug 2021 16:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHXA2-0002HD-2G
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:10 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHX9y-0004X7-6l
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 16:00:09 -0400
Received: by mail-pf1-x434.google.com with SMTP id y190so11739311pfg.7
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 13:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=CWy0u4ItQ1fMEI83X7OMtn0drKtEV8/2zb7hqU3BgWpKtZovNZU80UGL0Sne0i54uf
 BxT1K8kfL4Zlo9fcSACd1py78BetXDy/ZKjh5G+JK9hSQ3sR3/g8Pe2+WQtGANFOSWxf
 XsXlchc15t9nMOjw2HlFFpPPs7ZWUUVsYhJfoAQiIjFjVqVsO/vParXY6gbg/opafsch
 a5rQOnWUmIMUXE5kE2OC8N1pyWNsTnKUjiGbUC+pU1UcUGQfjqWD30D0h2whwtq8KALc
 ffMiaoXPvAhPbosmv292M1cfjxFBMuL4BNMLxRjnzfTeHFcucXS9+Z9mA6fobJ4iED2R
 R09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=i3uIK1XomERr1hCInq68PAhbZxQ4v+TBt0m+JaK3yWdvocRb5tsszY/mmT9psnkCNZ
 zXHF6Shn+kNY4a1Kr9cW5enAlLCZtXc8Aez6hGN0XOtkjaHNIqZXpDJ77jgU/vld7/mX
 oDpnd25Z7+49d/G7sYQy+Jou/zR8lf5JjRwEuxlfWp56BW4dVDd0te2Hc76OzSXLWQjw
 03YiY/qDeFa9oVhBRBJ+rRAsx4ZBa3bwT4K73of0Yjvt7IbBnMxho9gq7gyawzsWSRik
 Facxy9Z9vSPnP0GCODYnVOWLafVOtif80sBG0B9etrpkxb9mw1n4FjGpi48XHVdPFJWE
 Zx7A==
X-Gm-Message-State: AOAM532aCa5EHsGQcJfyKCi/zP6kXJNY/12hs34tUepSQYSnSxcIuR4z
 yzof78mw9ogU/G/JEZiGmILh/uECi94hnA==
X-Received: by 2002:a65:670f:: with SMTP id u15mr24513059pgf.205.1629576004541; 
 Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id h13sm12562257pgh.93.2021.08.21.13.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 13:00:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] target/arm: Suppress bp for exceptions with more
 priority
Date: Sat, 21 Aug 2021 12:59:57 -0700
Message-Id: <20210821195958.41312-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210821195958.41312-1-richard.henderson@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SvcWKa2spmhG

Both single-step and pc alignment faults have priority over
breakpoint exceptions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2983e36dd3..32f3caec23 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -220,6 +220,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    target_ulong pc;
     int n;
 
     /*
@@ -231,6 +232,28 @@ bool arm_debug_check_breakpoint(CPUState *cs)
         return false;
     }
 
+    /*
+     * Single-step exceptions have priority over breakpoint exceptions.
+     * If single-step state is active-pending, suppress the bp.
+     */
+    if (arm_singlestep_active(env) && !(env->pstate & PSTATE_SS)) {
+        return false;
+    }
+
+    /*
+     * PC alignment faults have priority over breakpoint exceptions.
+     */
+    pc = is_a64(env) ? env->pc : env->regs[15];
+    if ((is_a64(env) || !env->thumb) && (pc & 3) != 0) {
+        return false;
+    }
+
+    /*
+     * Instruction aborts have priority over breakpoint exceptions.
+     * TODO: We would need to look up the page for PC and verify that
+     * it is present and executable.
+     */
+
     for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
         if (bp_wp_matches(cpu, n, false)) {
             return true;
-- 
2.25.1

