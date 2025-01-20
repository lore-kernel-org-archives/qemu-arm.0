Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86fe9sm664667166b.135.2025.01.20.13.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 13:02:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 73BA35FA4B;
	Mon, 20 Jan 2025 21:02:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 7/7] Revert "util/timer: avoid deadlock when shutting down"
Date: Mon, 20 Jan 2025 21:02:12 +0000
Message-Id: <20250120210212.3890255-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250120210212.3890255-1-alex.bennee@linaro.org>
References: <20250120210212.3890255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: no78PwAU4usw

This reverts commit bc02be4508d8753d1f6071b77d10f4661587df6f.

Now we catch attempts to clock_step to the next timer when none are
enabled we can revert the previous attempt to prevent deadlock. As
long as a new target time is given we will move time forward even if
no timers will fire. This is desirable for tests which are checking
that nothing changes when things are disabled.

Previously most tests got away with it because --enable-slirp always
has a timer running while the test is active.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 util/qemu-timer.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index 0e8a453eaa..3243d2c515 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -675,17 +675,10 @@ int64_t qemu_clock_advance_virtual_time(int64_t dest)
 {
     int64_t clock = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     AioContext *aio_context;
-    int64_t deadline;
-
     aio_context = qemu_get_aio_context();
-
-    deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
-                                          QEMU_TIMER_ATTR_ALL);
-    /*
-     * A deadline of < 0 indicates this timer is not enabled, so we
-     * won't get far trying to run it forward.
-     */
-    while (deadline >= 0 && clock < dest) {
+    while (clock < dest) {
+        int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
+                                                      QEMU_TIMER_ATTR_ALL);
         int64_t warp = qemu_soonest_timeout(dest - clock, deadline);
 
         qemu_virtual_clock_set_ns(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + warp);
@@ -693,9 +686,6 @@ int64_t qemu_clock_advance_virtual_time(int64_t dest)
         qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
         timerlist_run_timers(aio_context->tlg.tl[QEMU_CLOCK_VIRTUAL]);
         clock = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-
-        deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
-                                              QEMU_TIMER_ATTR_ALL);
     }
     qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
 
-- 
2.39.5
