Received: by 10.25.21.156 with SMTP id 28csp437699lfv;
        Thu, 21 Jul 2016 07:40:24 -0700 (PDT)
X-Received: by 10.55.148.67 with SMTP id w64mr66953894qkd.137.1469112024039;
        Thu, 21 Jul 2016 07:40:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1si5188918qkd.110.2016.07.21.07.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:40:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQF9D-00011b-8u
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:40:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1Z-00031Q-1f
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1W-0003jd-Q6
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:29 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1W-0003jU-8w; Thu, 21 Jul 2016 10:32:26 -0400
Received: by mail-lf0-x242.google.com with SMTP id l89so5648104lfi.2;
	Thu, 21 Jul 2016 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WdmmCuKAO9+ZPmLZBRrW9Vu2PMcPiwX3OLrX8qsBrGM=;
	b=GwTKG5mVBcKbL2BcMcrbs2egxe6c6aUq9bla+NGJrAdhufWHOyKL2BPtxFy1YwSbLJ
	OZ86ewZYXckcJQFyW/BNxvnjbdpVtHE+9316+at8PqkvthXvx/XZYHoAqHWweGnGZHvT
	nra659K72zm0ANB2eaaU5D3q2fNUx8Bnu0BqtNxompL2iXte83t4FmYb/lZAwgOM8iiz
	LM4+b65OmCNrZXzCcukEuvq9USjLmQ8otYK+VsLUN+A60gpX54QsuxovAviGI7uGloY6
	koRxpgFEKRW3kPHAPTBLOhA4Q8rqLxgl/gKtP7ICelU2BiXPAVLKdL2I9sFyHGWJLXwd
	rV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=WdmmCuKAO9+ZPmLZBRrW9Vu2PMcPiwX3OLrX8qsBrGM=;
	b=EDbJMxp5z/RhHvYtr/WMEkS3CpGl2xQIN2YpgQAlNIiGAfbXzcwL2tDdgFDyC/CNqx
	C7JTpYjMZ/emka/eHAbM39lKmBdvtAlyAzd4FY5S6GuEk3upGtsMUXujw5MkrgkTuOnn
	t/gVLWnVdkSacfu+LDHvjTB3+ECZZLoDOJm/kFOqOpwXNSmhb1evZcKjuuXZfCjdLPOh
	tUBFl44nP28OcNwOlYotwq64/bxa3g8mkn0Sru1+9k5TnR1i9Ud3GBddzRd3rBTGXsJL
	wzne11AOy3CbqQ3JSZ904J1s92+3NNnteXSuD+lYqt2LpC0Z2RHth1D5CbfBUqel/wye
	+jSA==
X-Gm-Message-State: ALyK8tKHmPHo0vu1W0fttcQLH5V6aixRY1X0M3yqSXlnQFwmdK6M0c6tl7PrS7rwXPww8Q==
X-Received: by 10.25.23.222 with SMTP id 91mr22461520lfx.38.1469111545289;
	Thu, 21 Jul 2016 07:32:25 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:24 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:16 +0300
Message-Id: <27abeac1e55c3605357364df481827eef47f5dc5.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v15 05/15] tests: Add ptimer tests
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z4R66PjbXifO

Ptimer is a generic countdown timer helper that is used by many timer
device models as well as by the QEMU core. Add QTests for the ptimer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 stubs/vmstate.c           |   5 +
 tests/Makefile.include    |   2 +
 tests/ptimer-test-stubs.c | 107 ++++++++++
 tests/ptimer-test.c       | 498 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/ptimer-test.h       |  20 ++
 5 files changed, 632 insertions(+)
 create mode 100644 tests/ptimer-test-stubs.c
 create mode 100644 tests/ptimer-test.c
 create mode 100644 tests/ptimer-test.h

diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index 6590627..94b831e 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -3,6 +3,11 @@
 #include "migration/vmstate.h"
 
 const VMStateDescription vmstate_dummy = {};
+const VMStateInfo vmstate_info_uint8;
+const VMStateInfo vmstate_info_uint32;
+const VMStateInfo vmstate_info_uint64;
+const VMStateInfo vmstate_info_int64;
+const VMStateInfo vmstate_info_timer;
 
 int vmstate_register_with_alias_id(DeviceState *dev,
                                    int instance_id,
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 2010b11..17056e9 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -270,6 +270,7 @@ check-qtest-microblazeel-y = $(check-qtest-microblaze-y)
 check-qtest-xtensaeb-y = $(check-qtest-xtensa-y)
 
 check-qtest-generic-y += tests/qom-test$(EXESUF)
+check-qtest-generic-y += tests/ptimer-test$(EXESUF)
 
 qapi-schema += alternate-any.json
 qapi-schema += alternate-array.json
@@ -620,6 +621,7 @@ tests/test-filter-mirror$(EXESUF): tests/test-filter-mirror.o $(qtest-obj-y)
 tests/test-filter-redirector$(EXESUF): tests/test-filter-redirector.o $(qtest-obj-y)
 tests/ivshmem-test$(EXESUF): tests/ivshmem-test.o contrib/ivshmem-server/ivshmem-server.o $(libqos-pc-obj-y)
 tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o
+tests/ptimer-test$(EXESUF): tests/ptimer-test.o tests/ptimer-test-stubs.o hw/core/ptimer.o
 
 ifeq ($(CONFIG_POSIX),y)
 LIBS += -lutil
diff --git a/tests/ptimer-test-stubs.c b/tests/ptimer-test-stubs.c
new file mode 100644
index 0000000..92a22fb
--- /dev/null
+++ b/tests/ptimer-test-stubs.c
@@ -0,0 +1,107 @@
+/*
+ * Stubs for the ptimer-test
+ *
+ * Author: Dmitry Osipenko <digetx@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "sysemu/replay.h"
+
+#include "ptimer-test.h"
+
+struct QEMUBH {
+    QEMUBHFunc *cb;
+    void *opaque;
+};
+
+QEMUTimerListGroup main_loop_tlg;
+
+int64_t ptimer_test_time_ns;
+
+void timer_init_tl(QEMUTimer *ts,
+                   QEMUTimerList *timer_list, int scale,
+                   QEMUTimerCB *cb, void *opaque)
+{
+    ts->timer_list = timer_list;
+    ts->cb = cb;
+    ts->opaque = opaque;
+    ts->scale = scale;
+    ts->expire_time = -1;
+}
+
+void timer_mod(QEMUTimer *ts, int64_t expire_time)
+{
+    QEMUTimerList *timer_list = ts->timer_list;
+    QEMUTimer *t = &timer_list->active_timers;
+
+    while (t->next != NULL) {
+        if (t->next == ts) {
+            break;
+        }
+
+        t = t->next;
+    }
+
+    ts->expire_time = MAX(expire_time * ts->scale, 0);
+    ts->next = NULL;
+    t->next = ts;
+}
+
+void timer_del(QEMUTimer *ts)
+{
+    QEMUTimerList *timer_list = ts->timer_list;
+    QEMUTimer *t = &timer_list->active_timers;
+
+    while (t->next != NULL) {
+        if (t->next == ts) {
+            t->next = ts->next;
+            return;
+        }
+
+        t = t->next;
+    }
+}
+
+int64_t qemu_clock_get_ns(QEMUClockType type)
+{
+    return ptimer_test_time_ns;
+}
+
+int64_t qemu_clock_deadline_ns_all(QEMUClockType type)
+{
+    QEMUTimerList *timer_list = main_loop_tlg.tl[type];
+    QEMUTimer *t = timer_list->active_timers.next;
+    int64_t deadline = -1;
+
+    while (t != NULL) {
+        if (deadline == -1) {
+            deadline = t->expire_time;
+        } else {
+            deadline = MIN(deadline, t->expire_time);
+        }
+
+        t = t->next;
+    }
+
+    return deadline;
+}
+
+QEMUBH *qemu_bh_new(QEMUBHFunc *cb, void *opaque)
+{
+    QEMUBH *bh = g_new(QEMUBH, 1);
+
+    bh->cb = cb;
+    bh->opaque = opaque;
+
+    return bh;
+}
+
+void replay_bh_schedule_event(QEMUBH *bh)
+{
+    bh->cb(bh->opaque);
+}
diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
new file mode 100644
index 0000000..5c87828
--- /dev/null
+++ b/tests/ptimer-test.c
@@ -0,0 +1,498 @@
+/*
+ * QTest testcase for the ptimer
+ *
+ * Author: Dmitry Osipenko <digetx@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include <glib/gprintf.h>
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "hw/ptimer.h"
+
+#include "libqtest.h"
+#include "ptimer-test.h"
+
+static bool triggered;
+
+static void ptimer_trigger(void *opaque)
+{
+    triggered = true;
+}
+
+static void ptimer_test_expire_qemu_timers(int64_t expire_time,
+                                           QEMUClockType type)
+{
+    QEMUTimerList *timer_list = main_loop_tlg.tl[type];
+    QEMUTimer *t = timer_list->active_timers.next;
+
+    while (t != NULL) {
+        if (t->expire_time == expire_time) {
+            timer_del(t);
+
+            if (t->cb != NULL) {
+                t->cb(t->opaque);
+            }
+        }
+
+        t = t->next;
+    }
+}
+
+static void ptimer_test_set_qemu_time_ns(int64_t ns)
+{
+    ptimer_test_time_ns = ns;
+}
+
+static void qemu_clock_step(uint64_t ns)
+{
+    int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL);
+    int64_t advanced_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns;
+
+    while (deadline != -1 && deadline <= advanced_time) {
+        ptimer_test_set_qemu_time_ns(deadline);
+        ptimer_test_expire_qemu_timers(deadline, QEMU_CLOCK_VIRTUAL);
+        deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL);
+    }
+
+    ptimer_test_set_qemu_time_ns(advanced_time);
+}
+
+static void check_set_count(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_count(ptimer, 1000);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 1000);
+    g_assert_false(triggered);
+}
+
+static void check_set_limit(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_limit(ptimer, 1000, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_limit(ptimer), ==, 1000);
+    g_assert_false(triggered);
+
+    ptimer_set_limit(ptimer, 2000, 1);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 2000);
+    g_assert_cmpuint(ptimer_get_limit(ptimer), ==, 2000);
+    g_assert_false(triggered);
+}
+
+static void check_oneshot(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_period(ptimer, 2000000);
+    ptimer_set_count(ptimer, 10);
+    ptimer_run(ptimer, 1);
+
+    qemu_clock_step(2000000 * 2 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_false(triggered);
+
+    ptimer_stop(ptimer);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 11);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_false(triggered);
+
+    ptimer_run(ptimer, 1);
+
+    qemu_clock_step(2000000 * 7 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 1);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(4000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_false(triggered);
+
+    ptimer_set_count(ptimer, 10);
+
+    qemu_clock_step(20000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_false(triggered);
+
+    ptimer_set_limit(ptimer, 9, 1);
+
+    qemu_clock_step(20000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_false(triggered);
+
+    ptimer_run(ptimer, 1);
+
+    qemu_clock_step(2000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_false(triggered);
+
+    ptimer_set_count(ptimer, 20);
+
+    qemu_clock_step(2000000 * 19 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 1);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+
+    ptimer_stop(ptimer);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 * 12 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_false(triggered);
+}
+
+static void check_periodic(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_period(ptimer, 2000000);
+    ptimer_set_limit(ptimer, 10, 1);
+    ptimer_run(ptimer, 0);
+
+    qemu_clock_step(2000000 * 10 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_false(triggered);
+
+    ptimer_set_count(ptimer, 20);
+
+    qemu_clock_step(2000000 * 11 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 10);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_true(triggered);
+
+    ptimer_stop(ptimer);
+    triggered = false;
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_false(triggered);
+
+    ptimer_set_count(ptimer, 3);
+    ptimer_run(ptimer, 0);
+
+    qemu_clock_step(2000000 * 3 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_false(triggered);
+
+    ptimer_set_count(ptimer, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 * 12 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_true(triggered);
+
+    ptimer_stop(ptimer);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 * 12 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_false(triggered);
+}
+
+static void check_on_the_fly_mode_change(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_period(ptimer, 2000000);
+    ptimer_set_limit(ptimer, 10, 1);
+    ptimer_run(ptimer, 1);
+
+    qemu_clock_step(2000000 * 9 + 100000);
+
+    ptimer_run(ptimer, 0);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 1);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 * 9);
+
+    ptimer_run(ptimer, 1);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 1);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+}
+
+static void check_on_the_fly_period_change(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_period(ptimer, 2000000);
+    ptimer_set_limit(ptimer, 8, 1);
+    ptimer_run(ptimer, 1);
+
+    qemu_clock_step(2000000 * 4 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 4);
+    g_assert_false(triggered);
+
+    ptimer_set_period(ptimer, 4000000);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 4);
+
+    qemu_clock_step(4000000 * 2 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 2);
+    g_assert_false(triggered);
+
+    qemu_clock_step(4000000 * 2);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+}
+
+static void check_on_the_fly_freq_change(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_freq(ptimer, 500);
+    ptimer_set_limit(ptimer, 8, 1);
+    ptimer_run(ptimer, 1);
+
+    qemu_clock_step(2000000 * 4 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 4);
+    g_assert_false(triggered);
+
+    ptimer_set_freq(ptimer, 250);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 4);
+
+    qemu_clock_step(2000000 * 4 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 2);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 4);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+}
+
+static void check_run_with_period_0(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_count(ptimer, 99);
+    ptimer_run(ptimer, 1);
+
+    qemu_clock_step(10 * NANOSECONDS_PER_SECOND);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_false(triggered);
+}
+
+static void check_run_with_delta_0(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_period(ptimer, 2000000);
+    ptimer_set_limit(ptimer, 99, 0);
+    ptimer_run(ptimer, 1);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 97);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 1);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 2);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    ptimer_set_count(ptimer, 0);
+    ptimer_run(ptimer, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 98);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_true(triggered);
+
+    ptimer_stop(ptimer);
+}
+
+static void add_ptimer_tests(uint8_t policy)
+{
+    uint8_t *ppolicy = g_malloc(1);
+    char *policy_name = g_malloc(64);
+
+    *ppolicy = policy;
+
+    if (policy == PTIMER_POLICY_DEFAULT) {
+        g_sprintf(policy_name, "default");
+    }
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
+        ppolicy, check_set_count);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/set_limit policy=%s", policy_name),
+        ppolicy, check_set_limit);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/oneshot policy=%s", policy_name),
+        ppolicy, check_oneshot);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/periodic policy=%s", policy_name),
+        ppolicy, check_periodic);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/on_the_fly_mode_change policy=%s", policy_name),
+        ppolicy, check_on_the_fly_mode_change);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/on_the_fly_period_change policy=%s", policy_name),
+        ppolicy, check_on_the_fly_period_change);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/on_the_fly_freq_change policy=%s", policy_name),
+        ppolicy, check_on_the_fly_freq_change);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/run_with_period_0 policy=%s", policy_name),
+        ppolicy, check_run_with_period_0);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/run_with_delta_0 policy=%s", policy_name),
+        ppolicy, check_run_with_delta_0);
+}
+
+int main(int argc, char **argv)
+{
+    int i;
+
+    g_test_init(&argc, &argv, NULL);
+
+    for (i = 0; i < QEMU_CLOCK_MAX; i++) {
+        main_loop_tlg.tl[i] = g_new0(QEMUTimerList, 1);
+    }
+
+    add_ptimer_tests(PTIMER_POLICY_DEFAULT);
+
+    return g_test_run();
+}
diff --git a/tests/ptimer-test.h b/tests/ptimer-test.h
new file mode 100644
index 0000000..3814951
--- /dev/null
+++ b/tests/ptimer-test.h
@@ -0,0 +1,20 @@
+/*
+ * QTest testcase for the ptimer
+ *
+ * Author: Dmitry Osipenko <digetx@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef PTIMER_TEST_H
+#define PTIMER_TEST_H
+
+extern int64_t ptimer_test_time_ns;
+
+struct QEMUTimerList {
+    QEMUTimer active_timers;
+};
+
+#endif
-- 
2.9.2

