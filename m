Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143BACD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:34:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPt-0000GA-6I; Sat, 16 May 2026 20:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOi-0007DX-7u
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:31 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOb-0004xZ-6U
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:20 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-8353fd1cb5fso443938b3a.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977815; x=1779582615; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CH8sn0raFot2c6HYSuCv/vuUo7CdYLWHtN+GrqCIxQ=;
 b=uy014aMwhKRPk/HxYOkbD+aJEbXJG1e5oUvQ2oVFG4jdWDEp9WuqKCJSV3zmqzkRso
 aij0igU9wkKozuJHJMuvkYQjxx7fty3jpDTpMZ4Mlumj/5QFn3TH5nuxQAoXCR3ApjMZ
 1ZMWWbify8xrlUL5mryvLe/4XQKzfXPUz/mPttra6aR1WVqbNcNviXbObTjO8G+FpOwv
 zeI5twh5bJEbyx5JPFcuiQIwsoK3JTAupq1o4I6xW97gq+6CgbGQDTIqOvV36TGhqtF/
 pgsSKfvEDE2vZsueOXX2qIAPF0xYg6z2TZzznvQHTfR8SiutDWyZdqQGEsmkxEUAqnUH
 qT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977815; x=1779582615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6CH8sn0raFot2c6HYSuCv/vuUo7CdYLWHtN+GrqCIxQ=;
 b=MuZi8lkLkxlokrNOYbFuHAtux6Pqrwbufs9W+S1EURJo30q5eDTWbMU3kiwSlLZC4u
 lpgdQbDJxkYffxqxJAmgjyEzOZQ4lX4ngHB5z55T8GzuntcqOlvtZXhuV6G90cAplBLl
 F6Ip9SLtwYtFoAw2u2IVvhCqtGZsrO8pPdYtagUfjHRHjYG5/x/CcXsdOZijVWXjJKp6
 AgESIcRw5zInMdY/F7sXp49mNOuJjKa8t8xdGZN4kcUxuZiK8EKWxjxueBQYw5r/dbed
 GbtZ0+16vEAVJnz2K96E1swi8aF2tNd+MJb4i19gxE1WYjvKDxSEFkyPBuW/JjT0fF4r
 pDrg==
X-Gm-Message-State: AOJu0Yx9NAMtsRcUlpxudHh0Y1EAbRKWtU1S3A15FgD8GUq3eZi7dHjm
 H/okGFO+dDGBsSIcZigNiQXSwBJqxbXHQpTbqG3RhN8iBaS97Ep+b2LNvCyY5RZDHIU=
X-Gm-Gg: Acq92OFZ+Hkcw3Y846Oca4/TUP3QfUI5oP0vt21v1KBrMLE6AZYDCCiRoCUUvYIuFX1
 e1HKAs+SMFfB6JbtNGGCV0bumxXZwAMSnGO9YsJChuvzHDxlAfy96kpBYFsPENXuT75rEjkKI8H
 6aapYzFfrQ6d/gSvmryCTR4m2LrHDWk1LGh3eY8/T+AynnQ3kZ5cAh6k5z5WlL/sxy2Ad6ZVaJo
 uSohDAliCnF1RHt59ToWlQiAV+gB3SfQFHvK04g02mA8P0/1zOHd8qJk9ivv4F4FN24+m4wwtA8
 7MJ/gtVfa6G+WtqIdjgx+kr5rF42t6HxOxihGyvEq9paREgw2J6jzrklB+pmRfz3bU/AX67t5er
 x3EbPs/UaN7++tGzR1hNq8TOeSCLU43OFfPt/yFqOXTZrCnVbfJUkZwp32tWevs2GGieqwNxtbV
 PAnObeTkNKpuwGhiHA5WoIwLU4Wz0dKf3SyvGlx8w=
X-Received: by 2002:a05:6a00:14c4:b0:82a:146d:36a3 with SMTP id
 d2e1a72fcca58-83f33c9570fmr7885654b3a.21.1778977815132; 
 Sat, 16 May 2026 17:30:15 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 12/63] target/arm: Clear FPMR on ResetSVEState
Date: Sat, 16 May 2026 17:29:11 -0700
Message-ID: <20260517003002.321430-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

FPMR is cleared when entering or exiting Streaming Mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7eb7031294..3d6e7f1ccc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4856,6 +4856,7 @@ static void arm_reset_sve_state(CPUARMState *env)
     /* Recall that FFR is stored as pregs[16]. */
     memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
     vfp_set_fpsr(env, 0x0800009f);
+    env->vfp.fpmr = 0;
 }
 
 void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
-- 
2.43.0


