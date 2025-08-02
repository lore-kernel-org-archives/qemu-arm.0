Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BBCC87FD3
	for <qemu-arm@archiver.kernel.org>; Sun,  3 Aug 2025 00:04:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLx3-0004Cu-BT; Sat, 02 Aug 2025 19:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLok-0006Ng-8o
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:39:10 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLoi-0006Uz-LO
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:39:09 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-741b1fe0e00so45320a34.1
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177947; x=1754782747; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZELB4+c17Zgz1LBTVaRPLkTpYEUU2ZnNce3ABKyIZzo=;
 b=mYO2mnHTTdnJMV2qUKKrAUu5gk/FoQ+EeKMnANZaQoe0QEcWCS7SGK+S06yWbv5VrC
 JprO0MHsAhyIf19rtm4dt0kAaA1aJHQt6WNvzgRUMNSUozJH61/hzQ1rhCxnOQx38HxU
 rVKqUF1wHUWOJmQ7VL4vGNfyDEUs71Ypa9HV2XL0Xc1zEGRQn/fUr48oN+F3P+7FQW7P
 f1sgnmxP3Rqlb+gqsX0LoNL6NSxrwMY8HKn40wwL9OoFx5Zyy/Aaw5P6ifO/h6kIuWLA
 cs6o1VNC/IhrVAgbxWIk+QIxcfoSt7uPrCGIyw9KyjkLinss6pJf4pRgjgiebwlRNzpZ
 jwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177947; x=1754782747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZELB4+c17Zgz1LBTVaRPLkTpYEUU2ZnNce3ABKyIZzo=;
 b=Chs5eJQYgc1UnoI3Sr2hRqQ/RpuBzKkikqaFVT/PCXDKiBR0Nw46yNwfSj0ZWvjxiL
 qcjceSJ1yi/mTl+a0wHWwQEdBm+f0oJHGbQVTYJaw7oLWG2GlmzTmL3EaSfNKd74ouUc
 jO3wG2lld6HsaJyBTJrrgJjjjSRTCQmp13DB27sSJ2T7mpeTT8zbzwJY9wtvc5cpH4n2
 bUigRpoM2E0KJe/POAaCXi01nbYU67nV3vYhZsI6rWR+CMBRoXUUeYOagjwF+dz7AnzA
 LBbMec6MSGXLJqfGAqnO/eenFHPcPLQ4g8e2LsTOyci++amBo8F8mAjQPJ3BOhsqN523
 cF9w==
X-Gm-Message-State: AOJu0Yyk1ROnSJe9+jX/yMVXaZLU5dVYCTc1Mb3VttuI8t7jCQl4HizZ
 f179+Kc2j1DvjRTbtk1nsCwYGrbTBX/aMGla/QyBlX6ONhs7rv7TTC1TO2y8Bc8QjOXZNshM0vt
 ZFxcYB/I=
X-Gm-Gg: ASbGnct4MazwfvMms/NGyoss3ezvES1pp4PJrONgaXJqeZGJNdGcVIXd/RUld6urLky
 +04FLZiSj+K3NoAPxQ57pFKxh9NsO/1MlMjuJL0yhFEhDcnLqmT4yGcQyPHun2a4RG67tIkTLhR
 6BTtYx37PAmKoLtgsQhaz3bkPV9ttbeFjofCLWomuu8JHKAqyVlxTV+jTudM3DHpEpK0PI+XgnX
 ovDcmNZ9XJGCg2UsrmgCokacL8qv0n2r2ElvaR9ssjIguY/gCYYveKaw36nr1irhqzvN9wYV8wW
 9a6LXPIrIJx/rrORmGEQGrOIhmg1dzDuo0ETVn6ohK0o+/0URAIp7q1X++ynGRJSfpU0ylE3tL8
 MYhhq5LWHpJOv5p5wlaDjbxBj6wjDqVG16NE3iYpp3PbiBK8OxlDF
X-Google-Smtp-Source: AGHT+IHnCCpJSDXAGpmY2SYqxwmeyMlu0IYldiLnS6LWJvYlivhbMTL8TMZTDe1RMcG1s6ZkhQun9Q==
X-Received: by 2002:a05:6830:308a:b0:741:a8f0:db5f with SMTP id
 46e09a7af769-741a8f0dde3mr980023a34.7.1754177947502; 
 Sat, 02 Aug 2025 16:39:07 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:39:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 78/85] target/arm: Enable GCSPR_EL0 for read in user-mode
Date: Sun,  3 Aug 2025 09:29:46 +1000
Message-ID: <20250802232953.413294-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
index ec63297165..284d1870ec 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -317,6 +317,10 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
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


