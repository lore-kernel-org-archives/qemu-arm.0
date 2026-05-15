Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A5ACD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:28:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUi-0006UE-Cl; Fri, 15 May 2026 10:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtUH-0005tg-Jq
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:26:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU9-0000yB-Pu
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:57 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45562c41ec7so4777594f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855152; x=1779459952; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kPMoTfRy0PxJ4NavSRnM77Oz2TOV7srminG3TLvQHn4=;
 b=iIn3d3sylMCrFYNPPCLAxb06eemJORvwCmuxfOeSxTQdPHdOIwvoYMMFSSYoGVxd1/
 nq4IecL/pQEmpgIKymtby1DynfICfcW/o83SFbwKHNM+2zDWUViV8NHs6vwo2fs09EWx
 QlAERlY4nzfRzGfK81JjTmYafWc2q+5tEuqkq5Og/DrMvGwdjdExth1jU+uoO3xO9GcB
 yN5xkZ+pDWZZqbvnIeeavC6ll7TldqfY8V7WEdhJ83MuZnH0b35R19qFUakey5oZLJOX
 I+v1p7ucA0sB45PgL76XlvhOeWBC693tUc8kXMN4hLTm/pK2cue8fqLfZbMWKi9MYC00
 riHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855152; x=1779459952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kPMoTfRy0PxJ4NavSRnM77Oz2TOV7srminG3TLvQHn4=;
 b=XEM/0EkSZ0VhGpXwNn6ybhAShUwyIi0e4OgiSfhE7nl8HxVNgZW/oy0CUGUDT9zjwP
 yy8ZSgNhaf1ItlXiImJuyMyZTBmrqZbuMcJRUnmHMtMm9MHanYPykmxDQO2dHuhR1JI5
 iAVa8CC4I0UAOQvyffcW5xZZxxVTfOLOgBGWPxjf0fvnBnj1mvdz9KBs322d0NYXWEmC
 Ziwq/JHhhl8WiNLdf0Ftmjf32KlUWyTiMKntowSo51NeV/uihRPDJFfYmxrMVF5ANTQD
 JP3+/q0k0F3MC4ge7L8hg3Veoe4cWG7gJLyjBJR//yopJOVBpaVIKS3BSk9C21qKigUs
 8C1w==
X-Gm-Message-State: AOJu0YyaqaFlnjiRLdifXErolaLugyJvGZinQS+vkIW6hk6uurY7Asau
 pgXwZXb1fIOaZTl3wRGjnTIUqlgYl1gRfJE7z9aHKCaVmq9jxHYVwHpPomJcg1OUyfRdcd35IbH
 sJPPK
X-Gm-Gg: Acq92OEo0Th9dnaafRWP+F7y5r4T7W8aSAhScOxL/CWVHkU2xhvbV8IUOr3FovFlioj
 RkOqC8Ec3PAEUglHqlVT1nxHkZCbZv+MDgvUfKvjZ6Drs+k8EkOVFjcvY1dYHCTSytH+a8Wq7a4
 ResdRjLHNHnm/ykCcJTATFXKLmX4B1/pCdgCj4GOH+xQC4Gwz+YV/QwCVAnGaipVvhox14+LnAI
 Ef2lpFvnYIqMraUyPIH3aCQgkM3RCfFkn7GODGSpQ7EFnjcfYFoxuxTg41WeVwrsrmGcDrM4FcP
 KxIBXmL7eucdyn2nupNaQ2hdKPQAPg+NYZ0HAe1MpsbA66QkWwIvemV5rgg50Nbq5pQnqtnAWNy
 AIQipbIncyg7d8mVVvlEY6V27MxDAh9BSIJ2YXVZGqOSrYDgIWPql6/JhLz+eHjFBLTur8U+sI2
 Qk7TmUp155rCWnkAOo/ho73W35GV++uTchSO20UHjg1oEuEjdWczMcodR6URBX4JTWlIjZ2XOgv
 u9Ch1vgUBfjm6qy/D/OZUZvi4KB+gtvHybNGLZ/9A==
X-Received: by 2002:a05:6000:290f:b0:452:273:5cd6 with SMTP id
 ffacd0b85a97d-45e5c5a5e3bmr5744950f8f.1.1778855152231; 
 Fri, 15 May 2026 07:25:52 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 09/14] target/arm/ptw: Flip sense of
 get_phys_addr_twostage return value
Date: Fri, 15 May 2026 15:25:36 +0100
Message-ID: <20260515142541.571911-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
References: <20260515142541.571911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c89cccd431..545138464d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3571,7 +3571,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     /* If S1 fails, return early.  */
     if (ret) {
-        return ret;
+        return !ret;
     }
 
     ipa = result->f.phys_addr;
@@ -3602,7 +3602,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     /* If S2 fails, return early.  */
     if (ret) {
-        return ret;
+        return !ret;
     }
 
     /*
@@ -3656,7 +3656,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         result->f.attrs.space = arm_secure_to_space(result->f.attrs.secure);
     }
 
-    return false;
+    return true;
 }
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
@@ -3724,7 +3724,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
         ptw->in_mmu_idx = mmu_idx = s1_mmu_idx;
         if (arm_feature(env, ARM_FEATURE_EL2) &&
             !regime_translation_disabled(env, ARMMMUIdx_Stage2, ptw->in_space)) {
-            return get_phys_addr_twostage(env, ptw, address, access_type,
+            return !get_phys_addr_twostage(env, ptw, address, access_type,
                                           memop, result, fi);
         }
         /* fall through */
-- 
2.43.0


