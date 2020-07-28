Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h199sm4584938wme.42.2020.07.28.07.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 07:10:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A4BF71FF8C;
	Tue, 28 Jul 2020 15:10:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: victor.clement@openwide.fr,
	pbonzini@redhat.com,
	boost.lists@gmail.com,
	pavel.dovgaluk@ispras.ru,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 2/2] target/arm: only set the nexttick timer if !ISTATUS
Date: Tue, 28 Jul 2020 15:10:05 +0100
Message-Id: <20200728141005.28664-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200728141005.28664-1-alex.bennee@linaro.org>
References: <20200728141005.28664-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: km1hc4O38NUL

Otherwise we have an unfortunate interaction with -count sleep=off
which means we fast forward time when we don't need to. The easiest
way to trigger it was to attach to the gdbstub and place a break point
at the timers IRQ routine. Once the timer fired setting the next event
at INT_MAX then qemu_start_warp_timer would skip to the end.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c69a2baf1d3..ec1b84cf0fd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2683,7 +2683,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
         uint64_t count = gt_get_countervalue(&cpu->env);
         /* Note that this must be unsigned 64 bit arithmetic: */
         int istatus = count - offset >= gt->cval;
-        uint64_t nexttick;
+        uint64_t nexttick = 0;
         int irqstate;
 
         gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
@@ -2692,21 +2692,30 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
         qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
 
         if (istatus) {
-            /* Next transition is when count rolls back over to zero */
-            nexttick = UINT64_MAX;
+            /*
+             * The IRQ status of the timer will persist until:
+             *   - CVAL is changed or
+             *   - ENABLE is changed
+             *
+             * There is no point re-arming the timer for some far
+             * flung future - currently it just is.
+             */
+            timer_del(cpu->gt_timer[timeridx]);
         } else {
             /* Next transition is when we hit cval */
             nexttick = gt->cval + offset;
-        }
-        /* Note that the desired next expiry time might be beyond the
-         * signed-64-bit range of a QEMUTimer -- in this case we just
-         * set the timer for as far in the future as possible. When the
-         * timer expires we will reset the timer for any remaining period.
-         */
-        if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
-            timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
-        } else {
-            timer_mod(cpu->gt_timer[timeridx], nexttick);
+
+            /*
+             * It is possible the next tick is beyond the
+             * signed-64-bit range of a QEMUTimer but currently the
+             * timer system doesn't support a run time of more the 292
+             * odd years so we set it to INT_MAX in this case.
+             */
+            if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
+                timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
+            } else {
+                timer_mod(cpu->gt_timer[timeridx], nexttick);
+            }
         }
         trace_arm_gt_recalc(timeridx, irqstate, nexttick);
     } else {
-- 
2.20.1
