Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE00C44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 20:58:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIHF-00057V-C3; Fri, 10 Jul 2026 16:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFR-000274-Or
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:55:03 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIFA-0000zZ-L9
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:55:01 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-84862b0d5f8so1161677b3a.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716881; x=1784321681; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zEoEbldckN16OhTsR6Zaa+zbm5X/cyDm4W7LiW18RHY=;
 b=VYTlhnARxmlw5k8I3xYPU9OMaokf2nMP227KKz4mvQtjTPuaZmxTavwzU/lvsW4Kb1
 9LK0EHeCA9Y92HNseFLkfvsazTlZ2UdzGwH9hzVtG8LByl0AphQ6G1FvzQnGnHXSMX2r
 Lx8ZTkObBNiLhtOYZ5XcbtfxKAEzi8Em+5XQjR+5dJTrvCoR/8YQbmgpnBHphb9JYwlE
 8iiqOWTyKQCulMjVFOy6o+45sB3lyLrS8P1M5zV4w7UL6e9w+hB87XOp0OnB7bUIziKm
 bu5wzCC+oQ/CMoiNlFarSsLLaQXjvjpCHUaDa9zepd16vxVVHLq/n1xPsriOdLDy1L8Q
 q7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716881; x=1784321681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zEoEbldckN16OhTsR6Zaa+zbm5X/cyDm4W7LiW18RHY=;
 b=NcPdIimUToRPvuV+ZYorHStRTwe313Hv+Flh5+U+0BwZhQypz5dgjDGGL1tuQyektH
 TfzycBddirwu7X8wssv9arAUBg4Vj50ic7PIkTyamXOrH7lmliNGbRTQ4pItq5ypT+ad
 D86nsnTSs8w+62X9EkZl8FgrntmDuTDPBB7l9rAZywseRusCQIad8DmU6/9JJVLMTwR+
 k5DaNoqS8d/NNQuSqFceysUt8yasy7uf/mK9W2RIk3luxJcD3lcexqEZb4TBKhIbQAZq
 SDFDWzwuE4UoBHs61Pb745+X2SQJNFHH1BpMuKKgLKm0RfnsBHRaL4Y6FPSvJ7gvaZ46
 j9YQ==
X-Gm-Message-State: AOJu0YxwDmPNIbmoCz0tXtZpD/zA+JAqlZKtZljZhEZaYjKBdNpNNaXv
 gr7JS65O3nJLf1pg1ugNeAgokTwGRODx4RR5RWkJEJbpOvtURkPGzg0GvuvLnbX4o03suy+Nx5/
 dMOXD
X-Gm-Gg: AfdE7cnvn5jcrqHaiXhdrbLeIclgO//0lcGTHQYo4/aqp0ENd/ZE4G5S+UVrxwIQMwf
 FZ0aTxwpRXJjyms0UkZ0bUpWQndO4wpUSM7LmYLhabfdjpO/6TPQCnTg5VZyrsP4YMojaJafJ4j
 V0RSLh7CL3IH3o6erQ7I9dH0F49DiruMtaOpjd/eEv96hjQp18BLRkJxY/Dxdof+jkGdK/hIg6g
 FYskjAj4pZVKZcNHDLwMEigiSmYvrKyy4BAgAZn8EMjn1Acjh+AWdMF0nG3aDgu55ZoDVex5HRA
 twduahBrasRGl46Ls4iu3JH1DngWKNGoy+X8JsevMqES1571FpeMIGQPua16HCbb7NrREeslhVt
 eb4QBsfBB0H1e7aUaalp9T8pirhaCK8OcPenccHMlccG2bUjW3szhorVxUuDdwEZ11D1/N/0Pub
 dYLniRGQIktiYaaO2SDg==
X-Received: by 2002:a05:6a00:3691:b0:848:5935:2e11 with SMTP id
 d2e1a72fcca58-848896b9a7cmr617803b3a.48.1783716880557; 
 Fri, 10 Jul 2026 13:54:40 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 35/51] target/riscv: Simplify riscv_cpu_debug_excp_handler
Date: Fri, 10 Jul 2026 13:53:45 -0700
Message-ID: <20260710205401.836304-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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


