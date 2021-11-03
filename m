Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4298212lfv;
        Tue, 2 Nov 2021 21:10:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/asqrh+2qY/ok0hCProSxTJ4v9s/AayZ6tEmEhmoAlW5ZJI73ckMu6QgAOqqtil+ZmKcQ
X-Received: by 2002:a4a:2703:: with SMTP id l3mr16595105oof.66.1635912615336;
        Tue, 02 Nov 2021 21:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635912615; cv=none;
        d=google.com; s=arc-20160816;
        b=tPiqsozbmGQ1n+7SZflAJ9P/Zc6q3n0yc6qFpJLwX9G3AQtXSuXOqrr+6+s0pbEzwZ
         GonjjzPTc4Ua1+HdjJtKevLlTY2VKqWrtZl2oGK6WFhxISCjssPemffuFgTu8TqW8FCk
         ltbp7Yji70mQUzKhIcQeKxpLZBBKwolo2asKA1bKnICxrw/XgPQeQSlL7876anlKqRt5
         kwyvCD/a6UVOxepNLanRvTZ7nihhAbkMcqcoJxR5WawjPSl6N3mv0xF/A933zhGnMytR
         97n0ekPIPyJN5QPemcYBTczZbx7y89O6Zn+Js/V34AzQAqtI8hu7VLd0pWkBt/nLoF2T
         Zozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
        b=ydNiUPSo9yhu23JNxjARd5LP6+HZlWBmdQSr7XRmjk/XWBmTLnylUD4dCvpWE9LcM0
         w4fibcYi/2BN/qKTKRgzgyKAt97Vyt+yVaKiHpHz8zrOpSIiICWBMl4X46wRHFjeJZmS
         eug0XXEybsgfzs+DBpDbb/34wo564mv/JmAusnV/wYy3OSYbeaEnnRyUbEjJOi99Jji7
         H4TLqdvtTvU3e+Wiq42Xrjl3Bi1107SU7WVWV2lwqNHtC3nKp1CkcVuBUQM9hmNby3My
         FgCHAPwetfDId/+Z43C27EvfSPSDDPi+lc2ZMJuGKl+D7SPr4wvxgMfdcYQJA9fGWRxC
         ncdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eoMwY3zX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si1465470otf.88.2021.11.02.21.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 21:10:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eoMwY3zX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mi7bK-0001bh-Ff
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 00:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VM-0005Fj-9s
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:04:06 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VI-0000w6-LT
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 00:04:04 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id bu11so1527148qvb.0
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 21:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=eoMwY3zXHU5BmWu0Wwlxb1SANRZPySGNMZi1IV6nZBvpTxPNEH2w/GVO9g6aRKSRVW
 wsDgWGEBtQodTE1GObNyI8FXRdxaEYSXixYDa1xnvf93R8B0juhB056bchODawDw8ts4
 v5v4Bs5PVaYr59zS0KOR9sa28PfzxQ/6fpo+BD8okn8tKJY4kiR/kDNQaAioRIVxX0N1
 5qzc80HQS5pujyEdZXHcZDYIQrvMqZDRIz6bHBbA3AUCv4B4/a8q93yuodv0I+Zc78Du
 WCBiulhmDBQhCgnZwF2q+9nwcOKwQ4ogrdU3H4Ec7FVZeqGAg6ZLBWAMPJBx+kJUZSuR
 Da2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GwQXaikJPOnXJQIMQ/JzNg2jCKDE196b7cKL2erVtk=;
 b=nQ6DNRFeaaK+QOEKWoN0LNVoWZ4FnfQ46fVkMVBssAlap2oQVyshuD+m3o8Bid6Nx0
 2YKQg7IRXXFmyevvvlUwK29p9kRyxolcYz+HIu7xMApOQX8K517kfDsBkppvZ8W1nWf5
 OD/ljyhoEWUyNJzsnLjG8z5vveeAlc2RvQwwhp72WBAXxwGiAvRiEOoeskal6NkLBDAm
 AvWBxszqdT3ZujJGRNXQeq9MZ47bLxbdJEcOLdKMFLhN3LDtLx4oVuTD7/+khQ562KU3
 3KQ8o6F/K5CThdz5kp4Mus7e6gpUy+VQg20Cf0NOD336Y0eLhH2ni+LTQ0PaeSdz+mlp
 dfEA==
X-Gm-Message-State: AOAM5316nKaGNKWOoRwKUiMX6lgK5Os2F0plnOUz6OP99k9Yy6Tx//K2
 n9FmYvC0jjv+q0BHr5L1yD6TfQ==
X-Received: by 2002:ac8:5d86:: with SMTP id d6mr42533562qtx.194.1635912239748; 
 Tue, 02 Nov 2021 21:03:59 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/10] target/arm: Suppress bp for exceptions with more
 priority
Date: Wed,  3 Nov 2021 00:03:51 -0400
Message-Id: <20211103040352.373688-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0e3uOhB7ixWk

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

