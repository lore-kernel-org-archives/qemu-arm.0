Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD75C5DF7D
	for <qemu-arm@archiver.kernel.org>; Tue, 18 Aug 2026 11:58:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwISW-0004dc-RP; Tue, 18 Aug 2026 07:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwISV-0004bo-4F
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 07:58:23 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwISP-0005wK-2x
 for qemu-arm@nongnu.org; Tue, 18 Aug 2026 07:58:19 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-47f7872abb6so2558360f8f.3
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2026 04:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787054295; x=1787659095; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LybYRmQ9E3yF+WtyhOLMFZc8lKyl71GzSWY2D255ltI=;
 b=TpbgQP/eoINCYyrWZJBtW/iAYJ3HcwgtE/ajv0PiKF7wLSHD/x6aJknybclP1xYXVy
 lybcy67YaFsDX2UARKl8HVecvJPc4x29oWPBWYnEgxYJhNJ2vYwAcZithxa2J/1IvntS
 PZG9LllYMyTsxrzQTuMn/exqDTAvftX1WBDrjCNd2Ld05MpLhdKmt7fI1hG9LfKFJobo
 bI11oijuo4fbfuQcM/H5ldsowDkNm7Kqw5upHw6CLtGJcdtPnlqFgzEOm/HY8SUmgc40
 09hI/RAwpmmg6CLTGsyZN7B1n4tPHGWxCWviWnvvM5iZufg/6J3oogVgKTAjfxHm5YfC
 VJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787054295; x=1787659095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=LybYRmQ9E3yF+WtyhOLMFZc8lKyl71GzSWY2D255ltI=;
 b=jRj1LaRWg3QaxL+wAoHTrQUYW1MtYiZfcLXu/7tTw66h02EydoU6ehhFmMSs3mqFQj
 IGmkwVIxlmaW+UAXPNzhBXaWX+Z12LRobKsxaIQ3bmr+dBwO1jr62fV+3k70umuzkK4V
 QgdzW5K+FfjuYEFw0ADdH5pKHg9xOvWCVEFHhE0WTkuYhmYy4RVHEzCnkH4qTzfL3V91
 2FEIvYsw6tKWkbQ+GxI6MJG1VQV6vFchJkH+2V+66+Ot9XtUbgo72eXQ26deSLhY9Hq8
 cXD5RxFOwBWQXeMmuVmY2qYipuadGFZvlS7NarePnE1mqs2USW6LPSuPnD16o2ddeBbY
 vPyQ==
X-Gm-Message-State: AOJu0YxsRffSAhTDAeHVVkC7+5CaatRI2ecH6k5aQ6lfvTkAlshXzq8k
 QjM8JaWlGDKBz58memgJ9sVVYSokdSHNwK4mFKMvXNRaU5YOCw0dYzsZ5tIwUN56XhrGUEzkTbJ
 pCbRZ
X-Gm-Gg: AR+sD13LHwQ6MhmubndKPcKzLrbA3BHid7UZQzwVwmLUZ8jAwi0ZiP3JswkUhpARzNK
 Ye9Jf3MfSLBC4c4QK3olHsboZKbJOW2DqSgKBMPh2bRlHDy9st5AJnJHvt7rN/tlvTB51oGUsRC
 gWn/WybK4o+pFZrGCcrPCOb3qaOrKTZld85Mzls8Cz8v5VAnvZvnEidKlSm/dQ/Mq1OG2ADJ1dL
 1vdzqc+Bb6sqFLCCojdojkefP8vn8C4GA8LIWfuUIU0dHxvl/dPm0IND/5QjRpFQt0y6X9qwttq
 4NSub4ZQBYqrks4NR1LFwvNpiD/6njSDEo2QM4CN3OTpRdxIztry4C3pJ7BV01LcsGwTa4MNrPp
 i9iE3YGPltooASlBezY1Pl79DUevZJCth7wdsUzqitZRwlB73MbNvEF37Jp9Qt8i1qYsro+1mSq
 4ThKdKSiU79+o42m4awGu9RgrTVD0aoXJQpqPxlSUKGjrUogS8VpTa0/6cd36oPqg6mVmZrb65+
 mJf70o1guuK5QGr2bXgqO3NXEFAPmfJZZDm9/7Axz6ZzqCIH1bmtiYY4zARRfYNWC7+Uv9baZU2
 NFniKQ==
X-Received: by 2002:a5d:5889:0:b0:47f:81c4:36b4 with SMTP id
 ffacd0b85a97d-48160738b9emr45443461f8f.14.1787054295392; 
 Tue, 18 Aug 2026 04:58:15 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a9f0dec2sm6797298f8f.10.2026.08.18.04.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 04:58:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Correct reset value of SCTLR for arm926
Date: Tue, 18 Aug 2026 12:58:14 +0100
Message-ID: <20260818115814.2268429-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

For the arm926 CPU we reset the SCTLR to 0x00090078.  This is not the
value specified in the ARM926EJ-S TRM (ARM DDI 0198E), which states
that bits 16 and 18 are SBO, bit 17 is SBZ, and bits [31:19] are SBZ.
It's also not the value seen on real hardware.

This has been wrong in QEMU since 2007 when we first started actively
resetting the SCTLR to some fixed value rather than zero.

This wrong value didn't affect any of QEMU's behaviour, because we
don't implement any handling of the old pre-v6 meanings of these bits
(which were IMPDEF), and their v8 reuse is guarded by appropriate
version checks.

Correct the reset value to 0x00050078 (i.e set bit 18 and not 19).

(We use the same reset value for the arm1020; this might also be
wrong, but as the ARM1020 TRM doesn't seem to be available we can't
check, so leave it as-is.)

Cc: qemu-stable@nongnu.org
Fixes: 610c3c8afd99f4f11 ("Reset ARM cp15.c1_sys to default values. Fix XScale cp15 accesses.")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4202
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/cpu32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 8220d785f5..8d85333f4b 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -33,7 +33,7 @@ static void arm926_initfn(Object *obj)
     cpu->midr = 0x41069265;
     cpu->reset_fpsid = 0x41011090;
     cpu->ctr = 0x1dd20d2;
-    cpu->reset_sctlr = 0x00090078;
+    cpu->reset_sctlr = 0x00050078;
 
     /*
      * ARMv5 does not have the ID_ISAR registers, but we can still
-- 
2.43.0


