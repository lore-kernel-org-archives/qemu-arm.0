Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73edce5csm6200172a12.75.2025.01.20.13.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 13:02:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 61A675FA1B;
	Mon, 20 Jan 2025 21:02:13 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 6/7] tests/qtest: tighten up the checks on clock_step
Date: Mon, 20 Jan 2025 21:02:11 +0000
Message-Id: <20250120210212.3890255-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250120210212.3890255-1-alex.bennee@linaro.org>
References: <20250120210212.3890255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XjHogvV1wERv

It is invalid to call clock_step with an implied time to step forward
as if no timers are running we won't be able to advance.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 system/qtest.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/system/qtest.c b/system/qtest.c
index 28b6fac37c..1a9bfd0b33 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -708,10 +708,15 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         } else {
             ns = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
                                             QEMU_TIMER_ATTR_ALL);
+            if (ns < 0) {
+                qtest_send(chr, "FAIL "
+                           "no timers for clock_step to follow\n");
+                return;
+            }
         }
         new_ns = qemu_clock_advance_virtual_time(old_ns + ns);
         qtest_sendf(chr, "%s %"PRIi64"\n",
-                    new_ns > old_ns ? "OK" : "FAIL", new_ns);
+                    new_ns > old_ns ? "OK" : "FAIL could not advance time", new_ns);
     } else if (strcmp(words[0], "module_load") == 0) {
         Error *local_err = NULL;
         int rv;
-- 
2.39.5
