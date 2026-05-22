Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052D2CD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:10:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXyo-0000QJ-5V; Fri, 22 May 2026 18:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxi-0007iY-C9
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:22 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxg-0007yE-Nl
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:22 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-36900945df5so4055942a91.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487399; x=1780092199; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rn58yOh3c+VmSSUbLsskLhkkEXYk7fUpwHNTpFVDW6k=;
 b=m9xVDbp3x6eHTXE3uCQDG3dSIoj6361WDZ78UhZIgcgu8UyD3q2dP/eFpLOsmPAOFl
 XqKfS4bUl7hQfkJUl4IiJ2X9cuygxeHbxea/Gb5Jp65UwbcX5aiWxYEkhEKJEpvXgfdI
 OK2HmtmqmDGyBRqJsBUX7UA8oclxOqRHHcX8FDWK797YCT11mW14ZBov5L2qo5BoffCO
 qJklujn5ur03Eil+fLK/1+9buZdFzAuDU2ZrZCKpeer+/veP0w2J4Cw7qkiuTrD3wdBQ
 Z0OjPNxQrr+VJLcMdZVO0fW9LNUI4xOQeI9r91y/UuWl3JWvjcaD3ajjh5WiMYia22m1
 S09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487399; x=1780092199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rn58yOh3c+VmSSUbLsskLhkkEXYk7fUpwHNTpFVDW6k=;
 b=ChPLsaFLwG0SoTcW6Rdqf2edvTcP5A5fMv4iiklpQP5+5FEw08sZ+HCUa6pm/fxlAZ
 SaSLApc3rCu+OJ9Aarrd3d+WqDHKEwoOW3QChlqxBcjdVzgsmS0ow0jyax5Q4uh9551Y
 nlt+eze2V0z8QsPxv9/qKANxJ8KfsSfWcr9DchrC1Ca41wSHh9vSYDoG6MaO+qsDHT3j
 2kFNoHzrRX5CVWMCqevBv3cIBgeButR+cfyTK8dr0GZYM02FY6iZs6k9uuOnhyKEZVhH
 iNqLjbWjOyi9vGNHhVDDdVoofaUKug0901VWza+5ei1o3GnK02VJ86cKlWlV4jjcFJJ5
 9UQQ==
X-Gm-Message-State: AOJu0YyEjh99l99HRguYMZi2MQ2mZw0ZfTiNuUFuuxiwMyXz6zqFO7Vs
 NCfms9608vFRAtFlXwUi8RS5KqHhxW5RHP/nbe4RqE0KbryaBzWvFxruDgHOkJKiX96eCqfEuNO
 YQPtP
X-Gm-Gg: Acq92OFtWuec/Wuu0vCBhML/WEuda2EPBXsV3vVtIqTGs0CjeYb4Ik5dIsgz6vdGtXk
 L1Z9UA4G2M1vXvZv3GMKVsOB+3Ii7gCb1KaAs35zUw1iK/k69lJiuvGTNMNoSeKVxpVzIeQko24
 bRko6THpkUsqSXQzepf9AAB19tYMebKz0ui8+91E9tJQxr39Qpku7vuXPXy+SGBKHyN4/qEN4Js
 k6NRM/q/iUofQEhUCZ5BY2mXzVSMwW6ZODVko5VNPtWkSZCi2KWMO+wnejo36wqHH/XxxREVOti
 5Hk8mveIOJ+SY6DXzH+Y2RTlAPN01q7+nqz2vWt9HEUGRFsbQofktXHo2LEXBTSwxCN8KHOFQRX
 WZWnbq+dJCrzb/ZSmMAltca6BfTVHYxzkFVXBFe2T7k+z2KUzRgnJWMsCy+oC1M9PRvxZqU28gF
 eLnFGEp/vzoXaps3t7s9kotsKAKSKP
X-Received: by 2002:a17:90b:1a84:b0:368:6998:b49e with SMTP id
 98e67ed59e1d1-36a6745ccccmr5366741a91.9.1779487398810; 
 Fri, 22 May 2026 15:03:18 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 11/64] target/arm: Clear FPMR on ResetSVEState
Date: Fri, 22 May 2026 15:02:13 -0700
Message-ID: <20260522220306.235200-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


