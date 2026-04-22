Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E17F9EDC8
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 13:02:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFXDx-00018K-PJ; Wed, 22 Apr 2026 09:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDq-00016C-QD
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:30 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXDp-00017N-B8
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:02:30 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43d76dd4ee8so5009581f8f.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 06:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862948; x=1777467748; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLzSB9spY+gJhXJ81HA2xrXzxJ07lupyVRDFchBeQ6c=;
 b=qVKnalFGlk73xVLhUvJ6HBZyDoxZCkKUWwz2TSRKKWqY8sNE8jb59goETIZLSPIkir
 kV3E9pAlQupiHudiIYdThng8SOhW5cWtt9bZlK6Gvtu170/Ox1dKwhOxyupFvgKiIGMJ
 bD35lq61+y1OVNc74cowhRT4/K5zG6MHAsMSxeYfvLBkM4QfbFSUqCYGKT8DZ1dGDt+d
 XBD+ePHNyuF0naKdRd2UMASjHWcW+NRXKGB3VPaQMi3ld/INQB+9FOspcm7DP5+zPgiV
 u4kVHvejDna2Ip5yVjOZN9EhOeIWtRMNFNMezflb8uMdQ7DxBZ4uo6zmbGy41c8H7u5i
 fg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862948; x=1777467748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SLzSB9spY+gJhXJ81HA2xrXzxJ07lupyVRDFchBeQ6c=;
 b=ZJvB2tWUdF1UiDt1VczAJFGNGlHNEyWuHz//71p6XQHWK7PwM0k4otvCGvdKhc+9eW
 SVYGX8UkOyAfqSpfcesYSrIfYBeW7cfAiE0norw7iNi0K+nNhlhBFrThRjp7tlMFELJB
 ZPdW6i5/LXBFuewp/99BeBpTfViMx1lqzLjAOQxxdkF0yhW3yvBiN2mvonc2xG13cO2T
 oJYxDoG82nS8MrK8KkTcnCHCoxJe6MTKsKhSujf/LFfpg6OZsfziWz8cJ9ihAHWoReUY
 CDkOBJW3da1j0apA9XFOtL9hPnciWQFL2jep28OKigDvBO8dLW3CahDzmIV8VWzY75KZ
 5jnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Um4qIIRwipsYBf7e6Cl7haQ2iMNIC5up9SM2uJ25QiQ2XJ54x042Mop7JWK6dhWuF59FKhGyfvw==@nongnu.org
X-Gm-Message-State: AOJu0Yyh8ewIvOvWnq4P5iRSkfRbgF0l0RVPK91ovOS1FvdPmQrX7m5v
 hXVd4Ly+fntGNwqtBIhMvlMuG2v2BI9vELaN+B8o3+2nG3fbjZGRuvtgaOr679t9UbbEbS8nBWp
 LIGVNEvs=
X-Gm-Gg: AeBDiesFFBMwp2vU4OCQEvI4GwtElcLzTSs8WVlVsewaTim3d44l3SQrUwrBA52zYTA
 RotqmclYQTzxj8A7jnIMEwIgRM79gy9hr6qK891STwL+4OophMnKDG7+WEhiVXhrlVAFpXu9fDb
 8H+eeMdIbOdke49rn410+CjOWLoBUy2OfSdvAln0JfXdmT0OExO4nWM0eFJGIEaFaYFKpdw4SkN
 S5zYlthGepT6LA8b8AgrkPgkkV/Z+Iba71Mhb/52SxPcoEsoe/dBnjxm9z1MQTZYWviB22PyIDQ
 +5HUgISNxgJXmcZd0KVUTg25T+k5X9JMcQCty+b8PexDurFsTpl4CuYF7Cby/nGNUuVNfYwjqRt
 SKNnOHz0V5Bu8+VTakxLN/slYhQKDdmJvT4L8k4Pg17cIlD6JXeZAsLCJ3nQpCBZaWD4gvcMGCo
 j9FiCsbqRN5wtcSAzErk4L4lvJR0FakwgMHw==
X-Received: by 2002:a05:6000:420a:b0:43d:773d:78ff with SMTP id
 ffacd0b85a97d-43fe3e0b61bmr35815340f8f.27.1776862947410; 
 Wed, 22 Apr 2026 06:02:27 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb13a0sm45667079f8f.8.2026.04.22.06.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:02:25 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 50DED611A5;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 17/32] target/arm: use syndrome helpers to set SAME_EL EC
 bit
Date: Wed, 22 Apr 2026 13:52:34 +0100
Message-ID: <20260422125250.1303100-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

This removes the last use of ARM_EL_EC_SHIFT.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - drop ARM_EL_EC_SHIFT at this point
---
 target/arm/syndrome.h  | 1 -
 target/arm/tcg/debug.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 53137394e28..d4dfab8cd15 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -107,7 +107,6 @@ typedef enum {
 } GCSInstructionType;
 
 #define ARM_EL_EC_LENGTH 6
-#define ARM_EL_EC_SHIFT 26
 #define ARM_EL_IL_SHIFT 25
 #define ARM_EL_ISV_SHIFT 24
 #define ARM_EL_IL (1 << ARM_EL_IL_SHIFT)
diff --git a/target/arm/tcg/debug.c b/target/arm/tcg/debug.c
index 5214e3c08a8..07a52643e71 100644
--- a/target/arm/tcg/debug.c
+++ b/target/arm/tcg/debug.c
@@ -56,7 +56,7 @@ raise_exception_debug(CPUARMState *env, uint32_t excp, uint32_t syndrome)
      * Similarly for watchpoint and breakpoint matches.
      */
     assert(debug_el >= cur_el);
-    syndrome |= (debug_el == cur_el) << ARM_EL_EC_SHIFT;
+    syndrome |= (debug_el == cur_el) << R_SYNDROME_EC_SHIFT;
     raise_exception(env, excp, syndrome, debug_el);
 }
 
-- 
2.47.3


