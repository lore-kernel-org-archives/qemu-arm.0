Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6016ECD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:26:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtUF-0005sV-Tr; Fri, 15 May 2026 10:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU7-0005iM-9B
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:53 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wNtU4-0000vI-KM
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:25:50 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so58353545e9.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855147; x=1779459947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PhqHUhwfIQWqhESGZ3sqsj6+o6aM/A5Mqby6FRMskD4=;
 b=wwEJrwjDYoWAXYdcVhMhz4UHDnJ6v1+Aw5+Ql9q3IeGgI6xesyuYOZDImRzscHKnP6
 ikL9TOtz+HaGBQTHWW448Az6F+N4zoeQyzeT90WmDft/QNPA/IJDfr8NL3W3W85Ajcfw
 Zisqsxwu2rv6o8cDUrumca6RB1HWhfU3SlhZWJkU5OJL9d8OdgSiYKK+gtYTMuiBta/m
 SK74qgSa06BM+PsS+W+CD9AK5Wm+NAXOLmhLB8yNDPZEBdTy0AwF3/jKWHlLD3cr/a64
 8Zyg2tudOUTlCFgQ8YClE/eCAx0Lf/7R94dOVWQza5QQ6if2dzsq7QWGJwJq4/INj+2P
 Uv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855147; x=1779459947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PhqHUhwfIQWqhESGZ3sqsj6+o6aM/A5Mqby6FRMskD4=;
 b=IxtFMsrYLH7eoghFNHmoFG25zJnk78VGqP/hBdpAp7xTbhvg57M8TW5pm4rkFPhW0C
 6ooofXj/EDjexp2R8afR0haZhkM1AyNcfdwXQKgpP8a/Xq2zT593CT8IndBKpmrJEHpP
 3BS2Z1n8KOBrRvWyLqL0tj0YUt/WdUbDUfpuwif3yd8fYpYRmLlFiehqLfRhHRDs6amI
 5oRJz38Tjp3kUYqG6+ZbrSR/r2FYWQk7y/ZupdvLJezc1ODN50RBLXW0dOmainAkWfvq
 o5CBcrwRL0Zs5fL9CxgVuwlQg/gpVayYCzchdmnWYJtB7UqXi1XHXJXKdCp9ZRhxQyTd
 YRBg==
X-Gm-Message-State: AOJu0Yz4wAs+2k1kwGDKjo9+PuE7r2dYo558OFwNOv4WGqqEtDbB5keH
 hBlQ5HwlsGLVeEDju04jxbZGLzMc4mTGGUKYg9CqGj8M1XZwnhIou4BPOD0ZYoIXdOD09zJoUr1
 ff1ra
X-Gm-Gg: Acq92OEn+q1w19kfG37l0OcC9yZoBmV7GTfF8MvpSMuRKMgyWBKiqR5DYIfJhJD1GSx
 9k7rnEmg3gSfr0Rzvi4n+e5ePc/TScvtBVY0jySrjLAjRHQvJxHrwFw4+UVnEdD5l9Z7vLLU3J+
 Jy7E0mpkrPbgWH82cZUUgRFKKoIyGe+tjLWOEyy2fpu2avBy1vH/GgofOaTs9550Nw6zM2ow+Nd
 2nEFhbQA+QxqEA7FcFc3ZOF5d00KW98fWvdN1gmcDIzAnNN4Zi5Y2HQi6b/i/CRGKs0EMgTohxb
 u6yOImAeSPyN+9TlfDc/kg+c7tHQfGCYX83tkOvTGw2M5Jk3Am5lhxjn92EQbEdWDCHybqmikKa
 31MEq7bQvl58xUT6UiMroOrVGa8K/dDkNfJlQsQTNCCuqmmWzYamqC6i9p9KGQbGkWCHgIbzvkw
 uxgZT55R37TAcQGpQMQW0+bRijDxcXKFV7grArxgyY93byqoZM72aIo1C8aa3HlVo5QaBdi4/j/
 K6UySZ0BtlSO/3cz0nl4Jn4vBkF8QqDDYM80odIOw==
X-Received: by 2002:a05:600c:a00f:b0:48a:5301:bb5c with SMTP id
 5b1f17b1804b1-48fe63263dfmr59705095e9.16.1778855146806; 
 Fri, 15 May 2026 07:25:46 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a666fsm13560603f8f.36.2026.05.15.07.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 07:25:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 03/14] target/arm/ptw: Flip sense of get_phys_addr_v6
 return value
Date: Fri, 15 May 2026 15:25:30 +0100
Message-ID: <20260515142541.571911-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515142541.571911-1-peter.maydell@linaro.org>
References: <20260515142541.571911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
 target/arm/ptw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 93e77b3eb6..fa251f5b5c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1326,11 +1326,11 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
     result->f.attrs.space = out_space;
     result->f.attrs.secure = arm_space_is_secure(out_space);
     result->f.phys_addr = phys_addr;
-    return false;
+    return true;
 do_fault:
     fi->domain = domain;
     fi->level = level;
-    return true;
+    return false;
 }
 
 /*
@@ -3791,7 +3791,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                   memop, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-        return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
+        return !get_phys_addr_v6(env, ptw, address, access_type, result, fi);
     } else {
         return get_phys_addr_v5(env, ptw, address, access_type, result, fi);
     }
-- 
2.43.0


