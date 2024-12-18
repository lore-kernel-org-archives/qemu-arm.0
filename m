Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ab5198sm5489266a12.8.2024.12.18.08.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:26:22 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DB7CF60729;
	Wed, 18 Dec 2024 16:21:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Beraldo Leal <bleal@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	qemu-arm@nongnu.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 18/27] system/qtest: properly feedback results of clock_[step|set]
Date: Wed, 18 Dec 2024 16:20:54 +0000
Message-Id: <20241218162104.3493551-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DxLbSqf2S0gu

Time will not advance if the system is paused or there are no timer
events set for the future. In absence of pending timer events
advancing time would make no difference the system state. Attempting
to do so would be a bug and the test or device under test would need
fixing.

Tighten up the result reporting to `FAIL` if time was not advanced.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2687
---
 system/qtest.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/system/qtest.c b/system/qtest.c
index 12703a2045..d9501153a4 100644
--- a/system/qtest.c
+++ b/system/qtest.c
@@ -78,6 +78,11 @@ static void *qtest_server_send_opaque;
  * let you adjust the value of the clock (monotonically).  All the commands
  * return the current value of the clock in nanoseconds.
  *
+ * If the commands FAIL then time wasn't advanced which is likely
+ * because the machine was in a paused state or no timer events exist
+ * in the future. This will cause qtest to abort and the test will
+ * need to check its assumptions.
+ *
  * .. code-block:: none
  *
  *  > clock_step
@@ -710,7 +715,8 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             qtest_sendf(chr, "OK little\n");
         }
     } else if (qtest_enabled() && strcmp(words[0], "clock_step") == 0) {
-        int64_t ns;
+        int64_t old_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        int64_t ns, new_ns;
 
         if (words[1]) {
             int ret = qemu_strtoi64(words[1], NULL, 0, &ns);
@@ -719,11 +725,10 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             ns = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
                                             QEMU_TIMER_ATTR_ALL);
         }
-        qemu_clock_advance_virtual_time(
-            qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns);
+        new_ns = qemu_clock_advance_virtual_time(old_ns + ns);
         qtest_send_prefix(chr);
-        qtest_sendf(chr, "OK %"PRIi64"\n",
-                    (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        qtest_sendf(chr, "%s %"PRIi64"\n",
+                    new_ns > old_ns ? "OK" : "FAIL", new_ns);
     } else if (strcmp(words[0], "module_load") == 0) {
         Error *local_err = NULL;
         int rv;
@@ -740,16 +745,16 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
             qtest_sendf(chr, "FAIL\n");
         }
     } else if (qtest_enabled() && strcmp(words[0], "clock_set") == 0) {
-        int64_t ns;
+        int64_t ns, new_ns;
         int ret;
 
         g_assert(words[1]);
         ret = qemu_strtoi64(words[1], NULL, 0, &ns);
         g_assert(ret == 0);
-        qemu_clock_advance_virtual_time(ns);
+        new_ns = qemu_clock_advance_virtual_time(ns);
         qtest_send_prefix(chr);
-        qtest_sendf(chr, "OK %"PRIi64"\n",
-                    (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+        qtest_sendf(chr, "%s %"PRIi64"\n",
+                    new_ns == ns ? "OK" : "FAIL", new_ns);
     } else if (process_command_cb && process_command_cb(chr, words)) {
         /* Command got consumed by the callback handler */
     } else {
-- 
2.39.5
