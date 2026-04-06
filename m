Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F62DF46C6D
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:30:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oen-0007Vz-Lw; Mon, 06 Apr 2026 14:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oel-0007Tf-R0
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:39 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oei-0002QI-3s
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:39 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c76f55b60c9so647715a12.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499994; x=1776104794; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxrRBSz7YKINRDuLnlyIQ5KppjL0ah1Oh+mR6eOnL4k=;
 b=Ss1rUbC6kAMOKx6wdT89CeXr1jYLnFZIX1mTGOMn34YeE5Ui2noARdVCl7Wxzpr3bv
 /C0H7RZyVZ2UxZuIQW7V9CtjwDNqoIhb4rXlBZ4bV4uOgn8nkOwWgaKK2rXk9AGE/i7h
 yeNcEOlKUnSoe7c1z5YupPQ9IvBzLIerVgX4na45ToGxJRTUkD8ko5RWuVADgPJfy/od
 T3b3j5eSBkhN9MnuqtCjf3LPsg0Y9Xb/zJJciC5rb9VDG+gAl/eOxxbWyL6Ekl3OnQCJ
 lX6Mb4UAFPfu3+bzMB1NCZlxnYJkShUc5GFfDZCmJ/fX6N+kDAzC/3jYYYcEhdplx2rb
 5uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499994; x=1776104794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VxrRBSz7YKINRDuLnlyIQ5KppjL0ah1Oh+mR6eOnL4k=;
 b=E76BYV1047S0VO0OfsUBL0FsW0ZYA8wpeavfD2lBx1PzjhBckp+6EhmsspuvMjYpN1
 JMNxB/GRWX/Smmdmv3fJ7Z9g4+DYdc42LuyLFwyg8g1I80j2zKT2y/qGoUNeIBw0O2h5
 buwNEDY5sYQvXsFBBNh++w5+nVq4f5mboIL4JBtjc/9lUrT3h3pUDYLIVxMA6RcV280j
 8sjh5PN3ReA3WmoJM3DUjM45/OptnwGrSfLo7jcGbKFtpR0rrzn5FnLDIw13doCjS5Hf
 kgmz8dOol5eLq6+VJ/+AO1CDF0Q5E1u6UJ90HnCyXZHmkk4rx00w4Rbk++djbfv7C6oP
 87jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMBZDZTev/b6gOLjJZonPcSbZYq6CUNNiFSuuvzBFAgNp6hn6MSni28fkHVNcyIMxliKoAc/eYKw==@nongnu.org
X-Gm-Message-State: AOJu0Ywu83YWfYGXcmffuBhb5N0u8+FI8KgAmZBfbSIX+/YCz6U0XQfy
 x8Ceq/3hhN8giBQisqmGLD5SyB4Y64DTZb9poX2ZYovHA57M6UFZASQtlfadxL1SKb8=
X-Gm-Gg: AeBDieuLr0ms+wgTpYMa/dFK3FKkiXBKz7q/hBuofQFxeJEDHnB1FSZKIncAIpI8eJy
 woJCVrWogMHT3VjcgNQN/hlkvuanarbQDfNxUZPiYs9ZDkZoVytiq+dZzbbUJwO960p33NWOaME
 Ve2cDC2O/VI2N3PNTHTd/UukOLG9bgFlyXSGiZOLi/WUlc964X5fd/tG7dFCKw6Ls1cYNU/1Ynt
 FOvjOSVFsW+H4ltK1C2ZnkrDoWl1d6o9lkWwfQHCS9W+ZPj1PAR1hdSEEFffIYIVHKTYwwdqtYf
 QaCIpD9tv20r/eRZ9DpEg3sLICda+K49J4Gw2ewEAanJlvyWaA40IKrLq8dEuNO2OeeqDU8sYXz
 O7hGv/LM+aZyF0h94yR96UN/VgiTRN0DrCpCakxEDY1/MslSUNGzxJlspvFSz0yGb+clMT9rvwx
 04OiqIaFchwt5nMCPGLPr7J6fePzWkncscykoDIhdQssq0XcYb3xHK7T7qk9IoqaljlKTvNnDT/
 iTd
X-Received: by 2002:a05:6a20:e291:b0:39f:5839:af09 with SMTP id
 adf61e73a8af0-39f5839cf5dmr8969096637.10.1775499994364; 
 Mon, 06 Apr 2026 11:26:34 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:33 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 15/20] target/arm/tcg/translate-a64.c: use
 translator_ldl_end instead of arm_ldl_code
Date: Mon,  6 Apr 2026 11:26:04 -0700
Message-ID: <20260406182609.193886-16-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52c.google.com
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

Allows to reduce scope of target/arm/tcg/arm_ldst.h to aarch32 only.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate-a64.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 35ad7530c4b..ebab9f36f08 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -25,7 +25,6 @@
 #include "translate-a64.h"
 #include "tcg/tcg-op.h"
 #include "qemu/log.h"
-#include "arm_ldst.h"
 #include "semihosting/semihost.h"
 #include "cpregs.h"
 
@@ -10800,7 +10799,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if (pc & 3) {
         /*
          * PC alignment fault.  This has priority over the instruction abort
-         * that we would receive from a translation fault via arm_ldl_code.
+         * that we would receive from a translation fault via translator_ldl_end.
          * This should only be possible after an indirect branch, at the
          * start of the TB.
          */
@@ -10812,7 +10811,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     s->pc_curr = pc;
-    insn = arm_ldl_code(env, &s->base, pc, s->sctlr_b);
+    insn = translator_ldl_end(env, &s->base, pc, MO_LE);
     s->insn = insn;
     s->base.pc_next = pc + 4;
 
-- 
2.47.3


