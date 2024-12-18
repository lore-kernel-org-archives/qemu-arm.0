Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae10a7sm5564454a12.38.2024.12.18.10.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:15:13 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9FF175FB2E;
	Wed, 18 Dec 2024 18:15:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v2 2/5] target/arm: ensure cntvoff_el2 also used for EL2 virt timer
Date: Wed, 18 Dec 2024 18:15:08 +0000
Message-Id: <20241218181511.3575613-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218181511.3575613-1-alex.bennee@linaro.org>
References: <20241218181511.3575613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RVmugtD9UvuM

We were missing this case and will shortly be adding another.
Re-arrange the code and use a switch statement to group the virtual
timers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
---
 target/arm/helper.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 910ae62c47..5a1b416e18 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2465,16 +2465,27 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
     ARMGenericTimer *gt = &cpu->env.cp15.c14_timer[timeridx];
 
     if (gt->ctl & 1) {
+        uint64_t count = gt_get_countervalue(&cpu->env);
+        uint64_t offset;
+        uint64_t nexttick;
+        int istatus;
+
         /*
          * Timer enabled: calculate and set current ISTATUS, irq, and
          * reset timer to when ISTATUS next has to change
          */
-        uint64_t offset = timeridx == GTIMER_VIRT ?
-            cpu->env.cp15.cntvoff_el2 : gt_phys_raw_cnt_offset(&cpu->env);
-        uint64_t count = gt_get_countervalue(&cpu->env);
+        switch (timeridx) {
+        case GTIMER_VIRT:
+        case GTIMER_HYPVIRT:
+            offset = cpu->env.cp15.cntvoff_el2;
+            break;
+        default:
+            offset =gt_phys_raw_cnt_offset(&cpu->env);
+            break;
+        }
+
         /* Note that this must be unsigned 64 bit arithmetic: */
-        int istatus = count - offset >= gt->cval;
-        uint64_t nexttick;
+        istatus = count - offset >= gt->cval;
 
         gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
 
-- 
2.39.5
