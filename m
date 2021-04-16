Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a15sm10832774wrr.53.2021.04.16.08.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 08:49:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 321D61FF7E;
	Fri, 16 Apr 2021 16:49:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] target/arm: drop CF_LAST_IO/dc->condjump check
Date: Fri, 16 Apr 2021 16:49:08 +0100
Message-Id: <20210416154908.21673-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DonD4hGDJjCH

This is a left over erroneous check from the days front-ends handled
io start/end themselves. Regardless just because IO could be performed
on the last instruction doesn't obligate the front end to do so.

This fixes an abort faced by the aspeed execute-in-place support which
will necessarily trigger this state (even before the one-shot
CF_LAST_IO fix). The test still seems to hang once it attempts to boot
the Linux kernel but I suspect this is an unrelated issue with icount
and the timer handling code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>
---
 target/arm/translate.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b..7103da2d7a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9199,11 +9199,6 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (tb_cflags(dc->base.tb) & CF_LAST_IO && dc->condjmp) {
-        /* FIXME: This can theoretically happen with self-modifying code. */
-        cpu_abort(cpu, "IO on conditional branch instruction");
-    }
-
     /* At this stage dc->condjmp will only be set when the skipped
        instruction was a conditional branch or trap, and the PC has
        already been written.  */
-- 
2.20.1
