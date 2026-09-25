Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD3EC9832A
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:51:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADoX-0007yd-Oq; Fri, 25 Sep 2026 17:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo9-0007lM-KI
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:24 -0400
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo3-0007lE-DN
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:17 -0400
Received: by mail-pz2-x0f.google.com with SMTP id
 d2e1a72fcca58-85469b355ffso672073b3a.1
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373010; x=1790977810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=001YOUzeDy/jRJu+XV/XxZMtl8V6MI8QjkzCy6iHGME=;
 b=htJsajGd7amyCSGnU6uyJWcfKWvvtUYC0IX80n8n3iMgYGxIS/ne2XNp6j80/EXvrJ
 /DcDMLkkfcrqIvL9iBbcijwGNKqELPKXFP7SAgnFt/ZhN8ArQzsssVsv9m/McMmKHTZX
 cbFWZWRKsmT+a++qbZkqAE/x/H1q6eZzvXMlVj0vCrvI296LGe5CxPcBma/WHMSBRxDO
 FW/OW1DQ//cq+cedHbUkAbIGODzJu9YZ927kUjOrThmMkAmZl1ux0EHr/3mQkMMRHuWO
 STTfTXwH5WdeP9ORDWAj0jol5EU04Wj7mdiXAwsUISzl+utvaMqnWAl8i057MpZawjVA
 AkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373010; x=1790977810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=001YOUzeDy/jRJu+XV/XxZMtl8V6MI8QjkzCy6iHGME=;
 b=HcUuVu9Z5qMsW/n/j2pKgapDZlr5DHwXZg284LAhET1F4Vh0VTt0F0ST2hyPSy4PIz
 ad6HvS7Oam2hr4bULxG7IEr0gtrYapkM0cNHsBDl/xncDykjo5MTZIaeUb3WZGOt2JH6
 KhefiP8Nsww67Hoqob8BOdUA1HGgyFaG3Q+Txo8+JVlyL2+AZDthYyX4z/RH7cejRJaP
 pjClHl5PcoC6VhNvC51RH7uGhDZ3BLITuRSeNfFsrPNq9/XxNwIiOJpcvogVFeeChG6+
 k2EtWzo41VLrr9msKIWOQcfZn/CrK+xFO/PECGnVQ3TaVSjGKqEo4de7LrYsI1dbEC8N
 ESbQ==
X-Gm-Message-State: AFuF++nS7K1xk6FphJnSeqYFpqjIzj9UTa5r6JghXqF9LHRct0lff5/q
 fVvzLk6zu+c33Ht002B2nnH8ACiBenQ19aakeSPdXhF8Xeh6bnkgAeyAEO4RPaGkkp4=
X-Gm-Gg: AYBFou3vFL89ulz8Vh+iMCjnAH9AO5UhyvO6a0hYI6IjU3ZpXJKwljgdHCbnuY9SFNl
 hQMkd6qLRxwBXsAEAERq+tkw1flZfGcKAxwrStZCYN4rVQh96TPxgOMkQTfXNE3obc1FC6AMGu0
 qdvp0vQc8heGqKWcvFuaExGXkNBwiCfRwp0G3Aj+Cu1x6MbL5G2mIi9tXaHd0sfem4ZGtEhlf6r
 WHppJsFEGHVaxY1m8HUfkCHi27yqCQYG23+rylr9g306Rf2kk553IEa7Av05c0OFfo99ItR6Yvj
 qyNmAjPdu4i5fIT6tpqj6YRUAqGE05V2wfeIgZNubSfY0hVuWj6OJ+4QKNR/rrj8gp4dJRYoIXN
 KmYivDvWUtyuWmCjgTHnIdSpsfhc9yR4sLS+FgYKbdw9H5Q4YCqLBXvBFB2o76AJNzfWTTCbn8g
 Xks6dJZpAWyIhUkQ3AEzshwq/s6rRG6eTjtc2WDWAzAzpzLOkODgr6n7tG1mP1GMszhLVry+ILL
 BjfgaWkGVHkLw9bJBvJ9of/InBvRym2zffDtr2D
X-Received: by 2002:a05:6a00:1884:b0:878:3783:8a4c with SMTP id
 d2e1a72fcca58-87e9be753f1mr6413242b3a.52.1790373009693; 
 Fri, 25 Sep 2026 14:50:09 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/14] target/arm: Sort BE_DATA toward the top of
 rebuild_hflags_a64
Date: Fri, 25 Sep 2026 14:49:54 -0700
Message-ID: <20260925215004.456336-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

This is the last of the "ANY" class of flags.  Sort to the top
with the other "ANY" flags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/hflags.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 8da02ae1ecf..cf7d49be908 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -412,6 +412,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     DP_TBFLAG_ANY(flags, AARCH64_STATE, 1);
 
+    if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
+        DP_TBFLAG_ANY(flags, BE_DATA, 1);
+    }
+
     /* Get control bits for tagged addresses.  */
     tcr = regime_tcr(env, mmu_idx);
     tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
@@ -475,10 +479,6 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
-    if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
-        DP_TBFLAG_ANY(flags, BE_DATA, 1);
-    }
-
     if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
         /*
          * In order to save space in flags, we record only whether
-- 
2.53.0


