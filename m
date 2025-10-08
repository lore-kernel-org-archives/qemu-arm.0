Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC7ECCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:14:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cEa-00022G-Vu; Wed, 08 Oct 2025 18:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cDR-0001OV-7C
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:01:01 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCZ-0007R5-Rf
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:54 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-781001e3846so286347b3a.2
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 15:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960799; x=1760565599; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JF8VeHAMXnS+KlXHqFd9bhXPg9cRL1eKSmFQYNi3XjE=;
 b=JpTMzFB0A8dvSnVgxkgKX+8zRw+lqSnUD56GqX87ZzTfjYAG30FSF9aih5c/bAIPVu
 DnrDt68UHhxGpOTcuOzbjIEEBdwoFMS+w++yGfvepzkaSG87zlszV0nMdQ28k0OPIHcJ
 qyvJ7Witw4vfr05xjbvpj8EslknoKtE8XBrDUfpVDcBv/6HrmIfsTzUl7C4Y5DLzeH0f
 wSkFMQNwdjjgJHxykLJoXtT/4Ik61AN1/Uvhhot1trJ8zQSYKKQZESLW57R0O9vLhgNg
 9OrBTDXix0sB5WswYdJ0tqZXzo+rI+8zS9INjwTEFd4xGmzVsVIZGD963bqO1MklzjuV
 ohGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960799; x=1760565599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JF8VeHAMXnS+KlXHqFd9bhXPg9cRL1eKSmFQYNi3XjE=;
 b=T4q9NhkqOchQveCMQ7rt+kB6qYhYVDZPxzcSQIgjd2s3pKqBjL5ZD+iiwH4NPrPf/b
 Fzjh8op4QZvmqGEa9TRNWjzrFTigsAU/VDAW8h6HhxoT/36i4Q2DeF+NCSW5qYk7zl7c
 h1KKCZAVLkRXAEXcvQ4jKyTrJTk/yVeoD5Zb7zy5fPAwuKomoG83HMdtfrKiBEmwZUs0
 TTZ6CbYp6zaPfRZRms6XjuMqb1DLF4zM8e2HRF/7d15TbtJnj5f/zH8eJ4RGEZRcxieQ
 NUUXtH2RXoeqBMCPnES0QAe2WwcMxUqFIgtaILueVjgfpNWpsfyU1+iUeW3owj1pFxvE
 h9hw==
X-Gm-Message-State: AOJu0YwhkfdUrPipz6dsiQN8W7tfJRP65lkaf3ju17W8YW5FqhF2i5cZ
 dG1ePLlUetIO+toztbL0M0C671qnmslB/vFkFaAsnxzWA2aExv3XpGkskUeq92ZJ66s=
X-Gm-Gg: ASbGncuAAmFvYuzjQcG0G4hrS5kIWeS0IfYtw4UCLjQCVpfZdXBf0WZdo7/V92/M7by
 4V4/GAZ3qTJnpcP26wSb5tzvzWCz76q76U1Lk7bJRwD+8GzC4FHlyum05UsL/Bni54tWECQVJ4v
 +Q6JRaHMYWkR3m+QYQLFfm4nfraI4PaitUENdrAUC/64x5evOTLxGo+iyp69uoSEdAirCIkFDYA
 HFpId2lCVfbSRHxtQJzOjmrldO4AVZMlQNZ4YDTea9g1xHb92fuQTtlne+sWSdwI/aTbKNuz5xL
 VBw9sv7blh2o0xtWrqfIVbevc+3xJPyI1Ai6PcGlyXnaNBQBAUTCZOisrnqwf3Jxg95tj/eV1l1
 GL8cGoQq3wSDVj2PkqexW0SjJvj3lWpNH2xwBwM8ZN7IoLAinpxSx9srR
X-Google-Smtp-Source: AGHT+IGIyg+oA9mlKAcTLf1i8OHTwGFKyoVgiS8XG1UJC57JAAkearSkYVvm2q72NSJ12QW1evtadQ==
X-Received: by 2002:a05:6a20:7286:b0:2b7:949d:63da with SMTP id
 adf61e73a8af0-32da813958emr6611633637.18.1759960799234; 
 Wed, 08 Oct 2025 14:59:59 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 67/73] target/arm: Enable GCSPR_EL0 for read in user-mode
Date: Wed,  8 Oct 2025 14:56:07 -0700
Message-ID: <20251008215613.300150-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8ecf8a5e4d..98da468313 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -311,6 +311,10 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
         env->cp15.mdscr_el1 |= 1 << 12;
         /* Enable FEAT_MOPS */
         env->cp15.sctlr_el[1] |= SCTLR_MSCEN;
+        /* For Linux, GCSPR_EL0 is always readable. */
+        if (cpu_isar_feature(aa64_gcs, cpu)) {
+            env->cp15.gcscr_el[0] = GCSCRE0_NTR;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.43.0


