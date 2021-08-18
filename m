Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1015419lfg;
        Tue, 17 Aug 2021 18:01:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwybidYuM63ZafGsuBsDHFen/oXkxFnk6ZUHPRe2zcCX5jwHd/8jVkAg1VPzMewj3WrBv2
X-Received: by 2002:a1c:1d13:: with SMTP id d19mr3927067wmd.135.1629248495544;
        Tue, 17 Aug 2021 18:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629248495; cv=none;
        d=google.com; s=arc-20160816;
        b=fwZZf+uZfCXP+k+eVjGXUeIKEtTwG1cETZtuNZRlH4g3FSey/Q8yv2ZwTmFvq5vALE
         WU+7mvoHCXloqOgQFhs+c4tidUdqF9JC6SoFNr0n7BL+49Cl2deHAAdf0dS6BGE/0s7g
         GYLddv7gvBaErPaRcgQFMGjislHyOdsZLEV+OC8RQBU5zrWm3L4PTjYA/aZvpAzpyip0
         YIJ1vrs05TLtjQejsMu4XmdoR9hX+zk/UYH1H1+bTVU4an1UXf6rcxTuiKbRhgsL5naA
         QLz6pyfK0jBZt/Ww9mKbQOkAozjD+6i3q3qAivJ9P0v+5IRRBmffIAbUy6eNHUtfcHGs
         +XAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3++UiM9Nvpex33sDYBqi5LO8w14qjh3qiR4geB26iKQ=;
        b=Z//J9TmuSH5WJ18d8tBvatVOtQhoKFwoE79JwtsB2MjPKIvALjmZoLacMdzqbhij5a
         a3Otl4ItT6WbNJCWybRxF/LyUTD1e4AZNUTiRCQWkiiopfmivgIcnuDYWI/5kiGoQITw
         sZvr0I1X18d4ol1Dr7aknbgWppR45sXqIZxw045E1CY+W3vGI4n87yuy2i+yYDBisfMw
         JgKVaKJlnVSEDoR4Po3/HSz2OzeqtPssu84OvCQo/KBjIKXfaPJF8gFkztZwklOsEhwn
         3dzUSHdsBabZYgB3ga+bEdntZLBjAlsEtm+mSrdfzE/thr68/Di9am16MA7K1SuFJX2Z
         3jhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hvtvifip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r189si3929711wmr.120.2021.08.17.18.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 18:01:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hvtvifip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG9xU-0004GT-Jj
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 21:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wu-00049B-8h
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 21:00:57 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG9wq-0001OB-6d
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 21:00:56 -0400
Received: by mail-pl1-x62a.google.com with SMTP id a5so791055plh.5
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 18:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3++UiM9Nvpex33sDYBqi5LO8w14qjh3qiR4geB26iKQ=;
 b=HvtvifipWcMTSCAtENYbf4UhBK5dI7dfEyiX/nAFe88Q+DvjPLBFxu8vhUMWCCrYRr
 g+vIjImlTxeKvD9E5NHuxHXhuIf+zKyABupvCBLGLnpw75+TkXkTw2RCMgzIqLGkWvb7
 cLu2s0AtS+1gSW+Rm2eJQEEfv0zHt8qHHgxexBJ1jlpUk2kmEkzMpq8E4dgwgFJhgUE0
 aGVJWdMxd7y1isERpqRRfLxQ5I8/djLnRA1TtVZaseQvWqfXQOgTDqd/obGEo69UVzXc
 +26OzUUBKc3ClFhwRTtE3gPa8ZGLy5dHTqhJ2wDJZ93Z5S2N4TtlUF4KHDcV7NKq+3Bp
 Y4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3++UiM9Nvpex33sDYBqi5LO8w14qjh3qiR4geB26iKQ=;
 b=qx5isw5V8/agpm0M8zsMD15RQROTZUp3mqfYEj7O5tldCFPzLOyPtgZzTyqdDY8QlD
 A4StyCl6181gRfSpOVTSG+XEcr2XeoTH78mVy1B4ljiovBsOk6dIZ8UkpG1kLxIWS96A
 1P+HBk97qbiV2S424xLcKVnxnhC/9i+hqsYTl5WlMOM5uTpUSyktfCwdxWeOCtZLo1hB
 d3LJhJ0bvpcCvWm7onYbinvbefO8C/MFlxdpJytzE+lqk6eJ8QPRj6AG/5jJvJHFfhXG
 JnbXDDL5W40EOSIyOmjNmbt2DACQJVQy7bQ304AHhUCUdCbbCBZlgyQHs0uZvW/orEIB
 xEiA==
X-Gm-Message-State: AOAM531ppHILuzNdKG9brQLWo8sLufbYpURxubFhnj79ENi+5zjjOLMl
 nXyQF1XgRoWoEw8yywKTtsTmkdYNoEgJDg==
X-Received: by 2002:a17:90b:507:: with SMTP id r7mr6408192pjz.47.1629248450220; 
 Tue, 17 Aug 2021 18:00:50 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id r13sm4567422pgl.90.2021.08.17.18.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 18:00:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Suppress bp for exceptions with more priority
Date: Tue, 17 Aug 2021 15:00:41 -1000
Message-Id: <20210818010041.337010-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818010041.337010-1-richard.henderson@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IGRpQyq65BGz

Both single-step and pc alignment faults have priority over
breakpoint exceptions.

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

