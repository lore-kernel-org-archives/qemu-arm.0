Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702ADC44502
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:48:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdK-0006oj-R5; Sun, 05 Jul 2026 00:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEcA-0004yo-Rb
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:59 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbw-0004DH-3y
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:58 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2cc80b585bfso2697335ad.0
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226262; x=1783831062; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lg/N8LFKGp5ELLy+c1KbExFW/0dtEAJ/1CeA/sfoCRs=;
 b=WU7BNf08ZfTpHdBPBsBdcQPwEcjETlqwT7rVGw6//lNktny8KZoHKuoVfstlYwdeeW
 k8E9pLkztLunYP7EafrK2W9K29ojXVWqHwomxOI6QEXMDaWbxavcmzRCnOIZZUkWDOHy
 sMezzw7LNTETkZB9VSKyAu8Zw0Kzv/BrrJbSRzGX4JpaDyafubI3nJf8MKTZx2eaCji1
 6Tue4bmBsTDGRxArQHdJn65z/HHJG7Hb1vxGrNb6r5TgOJnh7ZIQKFi7ufGEWYrgLxEu
 Iu8E8GsVwWbPXk3ThgxSSbfyFnngg+lfLBKd7i+w+7V6IBkjt3RbOdp3FEtgw0CFgwWm
 0EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226262; x=1783831062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lg/N8LFKGp5ELLy+c1KbExFW/0dtEAJ/1CeA/sfoCRs=;
 b=ckE18td67JEzB9k+1KEeI2Ch1M5nFnfX/ofM0ptMcoKlIB1PsdF4BIZZFCB1gqWExx
 FlAAvEXRWVb7rwtFS+38nFeCu9FSBdL/F6z7sbAiYk9wVyS2ddWd10yD6J6iqC1gjt8T
 EpMVfSxSYd1i2ae7ENb4CpxR2AF2kMj6YyC4r9RmurjTjacO1Fsr8xtgQ/bHUQ/9aT8k
 Tct41UJoEyc5ikVam/7TBdf6cvUvMSiyEoDk+wLl9as8xUVAkcS0rRAkacFzDi8nTFye
 g+FzS2vQFqlM38rQLZ46OWT5vP7x8pJx3Bf9pVjlE+BOnq6ns3HMDjN7HYLGlcBPjHit
 sH4A==
X-Gm-Message-State: AOJu0Yw2KYsXmZYJx0l5tFIs7OOpxLq3bvDIY5zqmSCjDRjZAnKT1/lN
 7PNC9+bYAyI1tAK/uONtEoeBq2q0NAWkFQExg1aUwlWhbzCTxhekFhp0FykQc4XL8iM=
X-Gm-Gg: AfdE7ckRcHj3wc0KdjH6y8LPKxdGkwa6i70H71tw2yRnf04x7Amz56awALEoVWZBCx6
 REdCsa7dQAF452KSdk2gjlW0BwKdzkeWl8mC3uiOVK9tyPOAwzoQhKktBTJ2dbmBuc8qGYeDNz1
 WgyfVi06PPIsut1HU4gSKclsr0opa/6a/wPCk7qfectyHL7HacjwHP4g66GLFpheBru/plEQVeQ
 yyA4i7i39Y7ytKd6pJh9uq39ar/OeRqiwEidRKmSQiSeFn0Ld/xSzMODHdxChVDxj5LohWM+oNz
 VPM9ldkvuN1y1SqlEebRmgNAZb52z0cmARf2WtNGWnesnJnuP2BPv/VfDkPAyO59x7Y+GlivrJ6
 w3ucNkjKDJpdjrZzcvjDYNCJZbFOngrUZPI9A4NdbojjE07XBx0+u44+Y54OwJCK8tqjSVjPvUX
 tlWi/JgV5hvSe5Gp69zDrXM/sX1rplkZeURLVm6s8Zb+QYA0Y=
X-Received: by 2002:a17:903:3202:b0:2ca:d151:382d with SMTP id
 d9443c01a7336-2cbb9e38d1cmr56474895ad.14.1783226262210; 
 Sat, 04 Jul 2026 21:37:42 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 17/46] target/riscv: Use bp argument in
 riscv_cpu_debug_check_watchpoint
Date: Sat,  4 Jul 2026 21:36:56 -0700
Message-ID: <20260705043725.1373137-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Use the ID of the watchpoint instead of a loop over all.

This fixes a bug in which addr was compared against wp->vaddr,
so that we never recognized watchpoints that didn't trigger at
the start of the region.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 55 +++-----------------------------------------
 1 file changed, 3 insertions(+), 52 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 511a69c28d..56ae1e6107 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -960,59 +960,10 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    target_ulong ctrl;
-    target_ulong addr;
-    int trigger_type;
-    BreakpointFlags flags;
-    int i;
+    int i = wp->id;
+    trigger_type_t trigger_type = get_trigger_type(env, i);
 
-    for (i = 0; i < env->num_triggers; i++) {
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


