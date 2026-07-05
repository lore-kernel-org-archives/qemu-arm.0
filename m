Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7CCC44502
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:40:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdz-00008r-F9; Sun, 05 Jul 2026 00:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEce-0005SN-CH
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcN-0004XA-My
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:38:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2ca70925c25so22577655ad.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226280; x=1783831080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEoEbldckN16OhTsR6Zaa+zbm5X/cyDm4W7LiW18RHY=;
 b=VPEstlgkTS8voriYzOBdFJd/hJRHkMe8kIs6gxkbY7TA2KEpEI7R0OsLhvSZ0izB+/
 eZQbpMgKvImcadSY984sQrWl5AZ+7PrLQHpUl2sdtnVz9JX0GO6O10HFQLqs6eX0IApx
 PhNf24XwXm8uKdrl0ZGcVpWdYzhnnWht1G/xiWMU1DhlG9GJElSYDpPUxP3RNg7wYPHR
 uKMO4eSz7ea/QNl+O4g2d5g2y1n9g1VMP7orOJ1b++VqAWGOiJpGdV57V8jB5ZpAteFq
 hXmxEP9c/HWzRsYcdUi76Gc9Gpj52Aktcb5sYat9wi7Cx+12i7rl6cjjTpmdqpRjUROC
 yvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226280; x=1783831080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zEoEbldckN16OhTsR6Zaa+zbm5X/cyDm4W7LiW18RHY=;
 b=lJUJnxm1f27n7zXsoAgqgTyaD4iD5RuB2iJl/IQ7CbroL0R2KJilMZDMdzE5JK/ilP
 yd8XOXYbhzshRPg+9MX9Tn5EaQABl77hi0aCcImUeZzrNxHQvk2UhjLXJczPYTnMP/al
 CHpD7OSIEY0Prj77P5rds/VFFlTTq2OiEEsmC1TvZzVJdoyk25VJm5yarJZZmwB2R2+w
 RFzkB949/fICk08haBNP8RjB/yaXuycG4yRfyg7oK066TEILLZ5MuYuiQYOpuvYUdg9r
 pd6kgBbV/ixO/+sZLtU8cjZQHYKxVH0XERK33iVoHeC8R6bXhheCNAJK9im13QJo16Ey
 QpMA==
X-Gm-Message-State: AOJu0YyJ/ebpY1Rg6HHYewqX9jqyN6fVAbjFcyRgDAnQIxE4iNLbTu8A
 F608D9PAN6xHeT/HhfJR4Sto7E0ImOmQs74DgJ0bAiyepLkC9RX3nEndN4GGDbVELgE=
X-Gm-Gg: AfdE7clpxPJ0zT7P2Sgu2ssR2stbWzYsq1C4gwI7EgzEsxiTgD5kF+W56iz6V5c2hIc
 e2a4xAMZiacfJgTjybFUsvYddayPOvswDUPXlwZnb6njTAtKTGe8oUlrAbK0UbmhvED6ORQFEfg
 rfC2O5VPYMv3l5+i25TBkMHzGwqG5WjT8ZlymBmBnTTcuhqkIw5KgSI1ZyF8zW2jWE0TWDYwksK
 QoPWQfCtz6CMu1Jav7tconTsFlu25/CzHv6kucqfuzCFUB48MZ0PHGsSFBKYNksCQcWblKkNg9K
 nbK/dkQnuaEp4wdET02141TZD++sNkd7oGKgXmpVHiQqsO+jVULQmXYcSBz4LQi781zyrqeszPM
 87380D5+F4RBDwpd0975pSzRH6qtrBVTAZUgZ34ObAVdkfWC/1EGfxZfQ1hCxpym7W2ku3vbjTe
 KbyUmFR5zzcDw2mGKVO8fTkAWng3g5rigRBL3CYbAIcpMWn0Q=
X-Received: by 2002:a17:903:b8f:b0:2c9:97a9:2098 with SMTP id
 d9443c01a7336-2cbb9f008dcmr55689425ad.44.1783226280287; 
 Sat, 04 Jul 2026 21:38:00 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 39/46] target/riscv: Simplify riscv_cpu_debug_excp_handler
Date: Sat,  4 Jul 2026 21:37:18 -0700
Message-ID: <20260705043725.1373137-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

We no longer need to test for BP_CPU.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index a8429778f6..994a77fd31 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -919,15 +919,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs, CPUBreakpoint *hit)
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
 
-    if (cs->watchpoint_hit) {
-        if (cs->watchpoint_hit->flags & BP_CPU) {
-            do_trigger_action(env, DBG_ACTION_BP);
-        }
-    } else {
-        if (cpu_breakpoint_test(cs, env->pc, BP_CPU)) {
-            do_trigger_action(env, DBG_ACTION_BP);
-        }
-    }
+    do_trigger_action(env, DBG_ACTION_BP);
 }
 
 bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
-- 
2.43.0


