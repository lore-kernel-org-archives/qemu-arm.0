Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C646C43602
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:45:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEdK-0006pe-UX; Sun, 05 Jul 2026 00:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEc9-0004wY-FN
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:57 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbv-0004C1-E5
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:57 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2cacf197759so28985875ad.2
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226261; x=1783831061; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k40Ct/scLRA6POY4s+1/g3ylMfrjfxUVUANTHep1r88=;
 b=PGN7yxEMwlbmTnowoonLDItVi2yHqLlUsxChCb286X8cfSQXLL/iVUt/5GD6/3api5
 /y4KKFj8f/+plalKgU/N1iWr0tVmDP7wNdXvfmNRYLdlximaC7WBnnbmbUC6l8cbVWu1
 5KcxT5UT/sjtMkgzhgyX1e2J/H9I5vgml0jwevHT3QaBSOftnNr69Z8zJvCVBITvqrSa
 f9NvT7G+xjdCqfrBXutW0sukCClx1fo6ESmqUySaEAI/+KaZv5gTMWxpNVgNfxNz+KCF
 8ENpMYH50YwmNIT0rAZJ9Lwe41ScF/ZkOHdbADzgXjaluDJx3YP78+CjOvJXCC58q8dw
 GN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226261; x=1783831061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=k40Ct/scLRA6POY4s+1/g3ylMfrjfxUVUANTHep1r88=;
 b=Xm1jJ1j4YqqN+QcAOHK/ebrS9gmR3nNKA98opvcqKmOTeIkEsLxbz3/tviDYdZTF8W
 ccRQlwVHk53y6nRGSuc2QUgEf/ueoh8Z4EQAdwHKt2Py/QRkNVzUzBCbqrDTPj4WGY0o
 TI614XJfg7X96bYxCnSjDSqAFBNEaeHHsOsaaTgxx7gVtC7EPaNne8m3gJMf3ZPLK7JG
 eVr37kdveLWarzj3Wo9YbyDRQEbBcReFOjcdpECfTP4Qd18dE4k4SnyD5513SYE7WWii
 FV/bpD1BkUKMk28oLsM85a3V5fvNdwhivEuP4ILNeor9sjbpGklqYhDibT7tQRPvUKn3
 xaqQ==
X-Gm-Message-State: AOJu0Yy7AasDUDxVnQfH1eYOvLGb44lnBHQLbsU9w99bjLM+ngKJx/pb
 m3N0j6zI1Bl6a3c1O3K7F0qzre53ptCXu/30m6MBz+1mcReosyAf6FX/1v3fnegslClOdeKUZYA
 TpNCg
X-Gm-Gg: AfdE7cly1FcY/580TQw56Ud/mTG90yDZw2v8RBhrrNIWRMunLuFrzn6p07Z4sNltnQv
 kMVDYFBbfadPPPMgIaniydAYotCHHgMw7v1jA6E7LS58grtbWW4QcatEL5+ZvnUrgWMs6wuJuQX
 H/ciPJuYkULKiNW7h4zANuP3E7Z+xbTJMSz/IBTIaQeEY0fWRFY/Ao6AePSPPA9Te2BRC4m33XB
 9ogf8RLd1aP0fE40LFr2vW/vq0IA4JPAPmcjTl+Z+gaSuY/Iibq6pyP1h4apWUtFjfPCxY7r/IB
 0i8g33Ix9WYjVS3GdNncD2532JwRtMcDyoVERo9Mh8A1MzPGbVmVcCfHct3W+/24jC89Y8uIiAb
 VnC4iAv5W16hwgobw/+C7SKwnf4B5Ae8Lq/GWsU/Xxhty7uWURD37BQllyJlMyaLNLsj1KbfqNS
 OfcDr9YHLMVqzNUdnpMBxsdAbfshX9eYjQo/pim65kVrhtQPk=
X-Received: by 2002:a17:903:1746:b0:2bd:c925:3a16 with SMTP id
 d9443c01a7336-2cb97e43356mr58462405ad.2.1783226261455; 
 Sat, 04 Jul 2026 21:37:41 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 16/46] target/riscv: Use bp argument in
 riscv_cpu_debug_check_breakpoint
Date: Sat,  4 Jul 2026 21:36:55 -0700
Message-ID: <20260705043725.1373137-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Use the ID of the breakpoint instead of a loop over all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/debug.c | 44 ++++++--------------------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 5c378dd2e8..511a69c28d 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -941,48 +941,16 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
     }
 }
 
-bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *ignore)
+bool riscv_cpu_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    CPUBreakpoint *bp;
-    target_ulong ctrl;
-    target_ulong pc;
-    int trigger_type;
-    int i;
+    int i = bp->id;
+    trigger_type_t trigger_type = get_trigger_type(env, i);
 
-    QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-        for (i = 0; i < env->num_triggers; i++) {
-            trigger_type = get_trigger_type(env, i);
-
-            if (!trigger_common_match(env, trigger_type, i)) {
-                continue;
-            }
-
-            switch (trigger_type) {
-            case TRIGGER_TYPE_AD_MATCH:
-                ctrl = env->tdata1[i];
-                pc = env->tdata2[i];
-
-                if ((ctrl & TYPE2_EXEC) && (bp->pc == pc)) {
-                    env->badaddr = pc;
-                    return true;
-                }
-                break;
-            case TRIGGER_TYPE_AD_MATCH6:
-                ctrl = env->tdata1[i];
-                pc = env->tdata2[i];
-
-                if ((ctrl & TYPE6_EXEC) && (bp->pc == pc)) {
-                    env->badaddr = pc;
-                    return true;
-                }
-                break;
-            default:
-                /* other trigger types are not supported or irrelevant */
-                break;
-            }
-        }
+    if (trigger_common_match(env, trigger_type, i)) {
+        env->badaddr = env->tdata2[i];
+        return true;
     }
 
     return false;
-- 
2.43.0


