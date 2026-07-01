Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165ACC43602
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 03:09:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1welGA-0005zE-9F; Tue, 30 Jun 2026 23:05:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welG2-0005lA-4v
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:05:02 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFy-0002tK-Bw
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:05:01 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2c9cb97e178so1749795ad.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 20:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875097; x=1783479897; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zAEykkLSsC6j7cjQi/1RKg/0+TkxhmA7YPc2ShnuVM=;
 b=CG2VhnFmNR4lMkL0aIDo4kriL3iIsH47yEfv26np4XIpu86U7MTbEa4QcmLdQPjJhC
 iuSgNrcX4qi5QnFJMXZl9wlVxeI+XLC1Ffzx0BlCEAQpK8WSSP8Q8a9iZljAOHhYpMz1
 sXahTcZ26iLLmrzSykDV7V0jweUZH0I2D+b2493Vg5umoMeoV8CVHW8AhupErEu28gpO
 OumEYkYcL/XitXZLDyEaSPdR8at1x0Dxvjont1scTWojFag8Zb/K5QvDdkWrd+YUXwqo
 LtOTiE66DB+760mKvIPdoS8aUwxZjyduwHJP8E870PxETgEXtJXvjBSw+0bM5W0FbjGV
 JxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875097; x=1783479897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1zAEykkLSsC6j7cjQi/1RKg/0+TkxhmA7YPc2ShnuVM=;
 b=L8wPQgBnILLBXBI0pSpVsNoYqOfEPMxr3xPO2p+QgXw8Py+XrRdsfhljHwZu0hAact
 DUm1J7/ilnkvpHorbYs1X1yzIKTxtJkoYFv07mgJO8MkIjtMqO30dGcY+HI/PYN8yNnS
 Q0SXKbEK/EjneU8Uow8UMKnyJA2luAdjeQDYwcn2KuuVJ7u328GPUfaNPv5+e+bY4p+E
 iy3LFG539TMUarCdLev95pY5VIgbrq6VyedFeqAovHdixP8ldyF27TDkWlGo7ZHb+l55
 ONYNM34GbX0492MBj3r8Prjye0VxPHA68jpkwJ43t88ZDQ5FqbFBeou4EloaH4XQzg1i
 FcPg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrhAchyhg4ta6t/HJ8Fwafki7/P7ht0xNURBPaMGCnlsGwUAM2QoUPYGrVC71EVW7d/TmIb0gA7kw==@nongnu.org
X-Gm-Message-State: AOJu0Yw2DSbDBAoUoOKNaLmk2Mx6TxpFiccBh2le4YLHqKDLXRFS+ha6
 szICvdtkiIJLIXn7Bl7OrTLB0QrqMfclqzrVCe3th8pTh+dX6KjjiONFRBSaI5xn3kA=
X-Gm-Gg: AfdE7clQNmgulFzyOsg1aM3o9R1aWp8SW8dSH5rczBeYEOWlFo956jzZtonfBVtwxKA
 AZpTsmuZaIcgAbYXhtPEzNNkncurzHdX2YHU7rSXjWzEb75cirrILrci6ZK1A435DPdvJFuxvJM
 cU4802dNA7KzhPxAVDjzIn3PAYSoQXMD4EGFFDNtmqWVdmD6BAYX4RFdixc8XVYT+eXob+UYKei
 QrQw/DubV+MIkMY+hX7ziz3w8/v7Qwub+X9n9RaObeWx6SFgVsolJqSVPwL4LXIIMZbUyKqbnd+
 dIv6QhSO2dONa31CUAJJIkmRTCkK7GFT6zFYPPKTUruxUIkIt3b0mkSxl3plCPPx8oULlqdJO7n
 5WotrYOfMDc/xaMdcG4wCdA/aGVcHU2cMlss4nQRJRonpjRVruWqL31/PwAnx8SxPryFY1GW/S1
 K/5uOR0TJee9ZelQ6VWNB3p9ATfJu2d2nqvJBKngQfwf0BgE16WQ==
X-Received: by 2002:a17:903:3b83:b0:2bd:c925:3a16 with SMTP id
 d9443c01a7336-2ca2d52b188mr56311105ad.2.1782875096903; 
 Tue, 30 Jun 2026 20:04:56 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 15/17] target/riscv: Use bp argument in
 riscv_cpu_debug_check_watchpoint
Date: Tue, 30 Jun 2026 20:04:41 -0700
Message-ID: <20260701030443.1382447-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Use the ID of the watchpoint instead of a loop over all.

This fixes a bug in which addr was compared against wp->vaddr,
so that we never recognized watchpoints that didn't trigger at
the start of the region.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 55 +++-----------------------------------------
 1 file changed, 3 insertions(+), 52 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index f6ffc62f1a..433050bd94 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -973,59 +973,10 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, const CPUWatchpoint *wp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    target_ulong ctrl;
-    target_ulong addr;
-    int trigger_type;
-    int flags;
-    int i;
+    int i = wp->flags >> BP_CPU_ID_SHIFT;
+    trigger_type_t trigger_type = get_trigger_type(env, i);
 
-    for (i = 0; i < RV_MAX_TRIGGERS; i++) {
-        trigger_type = get_trigger_type(env, i);
-
-        if (!trigger_common_match(env, trigger_type, i)) {
-            continue;
-        }
-
-        switch (trigger_type) {
-        case TRIGGER_TYPE_AD_MATCH:
-            ctrl = env->tdata1[i];
-            addr = env->tdata2[i];
-            flags = 0;
-
-            if (ctrl & TYPE2_LOAD) {
-                flags |= BP_MEM_READ;
-            }
-            if (ctrl & TYPE2_STORE) {
-                flags |= BP_MEM_WRITE;
-            }
-
-            if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                return true;
-            }
-            break;
-        case TRIGGER_TYPE_AD_MATCH6:
-            ctrl = env->tdata1[i];
-            addr = env->tdata2[i];
-            flags = 0;
-
-            if (ctrl & TYPE6_LOAD) {
-                flags |= BP_MEM_READ;
-            }
-            if (ctrl & TYPE6_STORE) {
-                flags |= BP_MEM_WRITE;
-            }
-
-            if ((wp->flags & flags) && (wp->vaddr == addr)) {
-                return true;
-            }
-            break;
-        default:
-            /* other trigger types are not supported */
-            break;
-        }
-    }
-
-    return false;
+    return trigger_common_match(env, trigger_type, i);
 }
 
 void riscv_trigger_realize(CPURISCVState *env)
-- 
2.43.0


