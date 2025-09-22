Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2640CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:09:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lhu-00005Q-5c; Mon, 22 Sep 2025 14:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lft-0004zr-NL
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:11 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfO-00050m-WB
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:09 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-244580523a0so56146795ad.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567215; x=1759172015; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWsV/VltAqzQI9Qb+vYobgK8sydft8j6ZXREEjHA0ks=;
 b=t2hCL5ocTJ3eOitoynNz79AjrAFAkEjMvPW+6pYEuilKxIntRkN2PtGPQyNwGnmDUV
 W5RjEkhSgmitjV+D7aYV1zVeu/kyOj2xAXk1p4kYTleO+PtbYuxyNDySmoJafLIHDV5R
 +GJE717WII0Irt9IdsiiAwgGd030sLzGiS/HJ5ix3FOSwyz7ufT9PmEhEd04KwEEz758
 r9Z7kqRX+biAvqDnQAF+/Abm9h+7BYbzIAagdbon1ZVKrXZ+8+6BgMHJxN7G+k/eUKqD
 YLgyn2juXAEJPxR/4QXtzJNF40Ke6X3zzzL3psAx0FLyfTOO1vuf2HAL1DLDbVbw3i3P
 timQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567215; x=1759172015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWsV/VltAqzQI9Qb+vYobgK8sydft8j6ZXREEjHA0ks=;
 b=E+LDWdEKG94nX1nbFy0QrOe2nwMeAZyFvzX0oIiAwVqJMROTvS4OZhdh9k1Ta7aChg
 ylaOvctaWRMmG+xW5f/X16oQYr9k4if/ygaL+nCJON3NQcf2IaiDCmRxgMKl3rGDpenB
 8PI3ENzkTqxf7v4GYQUZUDPa5ZhUzzUah0jAIJRLcFHIQrM0OlaeIlxETBpNoJkOz3D5
 WdPtFvTMpWtWSgfZCqAfCqlW8LdqlxIcAQYakoeuI0nnzGIiQJH5BqQJzKz2AKDsu7yH
 qKuZWlBTRHA9O+WgHP/0xYSAt4RvKDTicGpLwJuLtFt+EL7/l3DZcsc0zp8D1Wbi8A1u
 qzww==
X-Gm-Message-State: AOJu0YwtT3gs4JM3b3Gemr3pujsyQLD5rpTRJUEwY6vmx/zJjBOYM4xo
 IDWgMjT62quWK4cuH4/FGh1IyY3FzrbEHcbhB0fC7lWQtk3ljmq7S6Z5M1z55P92+FY=
X-Gm-Gg: ASbGncvFMB6NLr8t4WGm/hhFpC4jYuqsxGVqVmuZffVlLd9/YZtCJSncgIQQZmemCbT
 MRLD1ZC2IynmqF/EAqAuiUnJfN7433X0IGBucGX4iAmQMQQjnasjfI8YxHOgUgK8/YgLTIQfo2E
 Nnkfps6Ae4gwvJ8n/bBrV8+5WyuMC7N8xhH0N7G+qdD+5psPFheLQRXM17VNnxiZGlwT2xD06GG
 9aXt87qryNnc0xzyrpHd9QHg/BNRTa0NIzAiIs/A9KRItqlScvKC7hPf6Dig2XrNN8e1qJbSQ05
 RqPYKT1Qfp0ZIzTdfhIuSTqTxcfcGCFW2ln9ZlolPWsMq0iFvLnytyJpXH6rjzJLSLPraiwFpyv
 PRDseGSYK/HFXxC/g2oz9Flf+cF9g
X-Google-Smtp-Source: AGHT+IEY/9EwH0jOggsEQup5vz1tb0G2DYJAGUzPmIBXnlDpJNHgpTrsZR4WorKcIKo+uOb1ZMbqeQ==
X-Received: by 2002:a17:903:2409:b0:274:777b:ca84 with SMTP id
 d9443c01a7336-274777bf4c4mr85650805ad.21.1758567214776; 
 Mon, 22 Sep 2025 11:53:34 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 63/76] target/arm: Copy EXLOCKEn to EXLOCK on exception to
 the same EL
Date: Mon, 22 Sep 2025 11:49:11 -0700
Message-ID: <20250922184924.2754205-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

Per R_WTXBY, PSTATE.EXLOCK is 0 on an exception to a higher EL,
and copied from EXLOCKEn otherwise.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e90398acc9..d98f9b0d70 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9057,8 +9057,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         } else {
             addr += 0x600;
         }
-    } else if (pstate_read(env) & PSTATE_SP) {
-        addr += 0x200;
+    } else {
+        if (pstate_read(env) & PSTATE_SP) {
+            addr += 0x200;
+        }
+        if (is_a64(env) && (env->cp15.gcscr_el[new_el] & GCSCR_EXLOCKEN)) {
+            new_mode |= PSTATE_EXLOCK;
+        }
     }
 
     switch (cs->exception_index) {
-- 
2.43.0


