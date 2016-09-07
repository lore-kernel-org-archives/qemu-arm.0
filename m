Received: by 10.25.87.130 with SMTP id l124csp313188lfb;
        Wed, 7 Sep 2016 06:34:19 -0700 (PDT)
X-Received: by 10.200.48.56 with SMTP id f53mr28949843qte.99.1473255259129;
        Wed, 07 Sep 2016 06:34:19 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a142si5413198qkc.140.2016.09.07.06.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:34:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcza-0003Td-Cb
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:34:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp1-0001Z7-LT
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcoy-0005ev-1x
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:23 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcox-0005ef-Gf; Wed, 07 Sep 2016 09:23:19 -0400
Received: by mail-lf0-x241.google.com with SMTP id j41so826173lfi.3;
	Wed, 07 Sep 2016 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NwBh71ortyF4rqMRaEP5YhJecZOoKp5B7OXcBmEtZak=;
	b=mvrIqfzugyPGpMn1kCatgcb+QhKEoFh/uqBAhKMlSu8/ZYVl6AKHvzlQLjLe+8BmO8
	P9mkScd6KNG5oTjaB/GTy2L52GwAGF/dMt2A1yjKuB342ejVklS6Tt8d76/FuA+IsfZY
	oc1kCQ9hG/Ch4ubrr3EiDFPNF2rZjYeE+OpHMxgwlOjBrgCSZ7FwmnTlcHQTrsrhJQ0h
	1SAm1Uxlt2iGiOpWA1aDBJUz5hORB4PhAX/u9CowIBNsRkp5Yba8cV2cK9pqc3Z5iTXB
	3QZ8F2HcdIQMij/f0aaiWhltYXjrNLlzd9Q1sjS21wuZPddGXmle7dq7Zs4zHn04wq17
	JpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=NwBh71ortyF4rqMRaEP5YhJecZOoKp5B7OXcBmEtZak=;
	b=YWZIXdrt4L6aunNH0VuQ2WFbHb2PRr7GnZ2PgTb+4CFcxK6zuiC9nTGObn7Ml+3pdN
	2BRFJPyNEPzbuajiyQrcqOHiPkbNZmiMh9OCP+uwFPVt72S6Dchfp8R4v/tGvPioIgJ0
	yu6mf+t2fF4EUqDip8zZOLb1t/icBgzw8cy4KXjg7jL4L90Af9t3s3aFgcLeDhujs8Tg
	BhWr3KyVWkWmKziL2RG9n4quKdvrMFosO7d7I4TLSJYDdDCAIYir+C55PV0PZ9m4LCr6
	qFw2Ls8xX0ASHYNh70ZZndNm+PzCpXyJwlIOlOX9xUmyUgq3CY4/kS5XOfu3BkFnmsPP
	Gl/w==
X-Gm-Message-State: AE9vXwMEdAJJbu+kqWVpMVnccvRSjQWkLfvbDkBFzeWcC1ZJ2rVR47FE1t8VT/SSXw70JQ==
X-Received: by 10.25.166.2 with SMTP id p2mr27871lfe.134.1473254598561;
	Wed, 07 Sep 2016 06:23:18 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:18 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:14 +0300
Message-Id: <1de89fe6e1ccaf6c8071ee3469e1a844df948359.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v16 03/16] tests: Add ptimer tests
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
X-TUID: +mjapMXsWP/7

Ptimer is a generic countdown timer helper that is used by many timer
device models as well as by the QEMU core. Add QTests for the ptimer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 stubs/vmstate.c           |   5 +
 tests/Makefile.include    |   2 +
 tests/ptimer-test-stubs.c | 107 +++++++++
 tests/ptimer-test.c       | 568 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/ptimer-test.h       |  22 ++
 5 files changed, 704 insertions(+)
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
index 14be491..82b7ae5 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -274,6 +274,7 @@ check-qtest-xtensaeb-y = $(check-qtest-xtensa-y)
 check-qtest-ppc64-y += tests/postcopy-test$(EXESUF)
 
 check-qtest-generic-y += tests/qom-test$(EXESUF)
+check-qtest-generic-y += tests/ptimer-test$(EXESUF)
 
 qapi-schema += alternate-any.json
 qapi-schema += alternate-array.json
@@ -631,6 +632,7 @@ tests/test-filter-mirror$(EXESUF): tests/test-filter-mirror.o $(qtest-obj-y)
 tests/test-filter-redirector$(EXESUF): tests/test-filter-redirector.o $(qtest-obj-y)
 tests/ivshmem-test$(EXESUF): tests/ivshmem-test.o contrib/ivshmem-server/ivshmem-server.o $(libqos-pc-obj-y)
 tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o
+tests/ptimer-test$(EXESUF): tests/ptimer-test.o tests/ptimer-test-stubs.o hw/core/ptimer.o
 
 tests/migration/stress$(EXESUF): tests/migration/stress.o
 	$(call quiet-command, $(LINKPROG) -static -O3 $(PTHREAD_LIB) -o $@ $< ,"  LINK  $(TARGET_DIR)$@")
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
index 0000000..f207eeb
--- /dev/null
+++ b/tests/ptimer-test.c
@@ -0,0 +1,568 @@
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
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_false(triggered);
+
+    ptimer_stop(ptimer);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 11);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_false(triggered);
+
+    ptimer_run(ptimer, 1);
+
+    qemu_clock_step(2000000 * 7 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_false(triggered);
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
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_false(triggered);
+
+    ptimer_set_count(ptimer, 20);
+
+    qemu_clock_step(2000000 * 19 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
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
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_false(triggered);
+
+    ptimer_set_count(ptimer, 20);
+
+    qemu_clock_step(2000000 * 11 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 10);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_true(triggered);
+
+    ptimer_stop(ptimer);
+    triggered = false;
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_false(triggered);
+
+    ptimer_set_count(ptimer, 3);
+    ptimer_run(ptimer, 0);
+
+    qemu_clock_step(2000000 * 3 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
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
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_true(triggered);
+
+    ptimer_stop(ptimer);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 * 12 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_false(triggered);
+
+    ptimer_run(ptimer, 0);
+    ptimer_set_period(ptimer, 0);
+
+    qemu_clock_step(2000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
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
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 * 9);
+
+    ptimer_run(ptimer, 1);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 3);
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
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
+    g_assert_false(triggered);
+
+    ptimer_set_period(ptimer, 4000000);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
+
+    qemu_clock_step(4000000 * 2 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
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
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
+    g_assert_false(triggered);
+
+    ptimer_set_freq(ptimer, 250);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
+
+    qemu_clock_step(2000000 * 4 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
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
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 97);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
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
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 98);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
+    g_assert_true(triggered);
+
+    ptimer_stop(ptimer);
+}
+
+static void check_periodic_with_load_0(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_period(ptimer, 2000000);
+    ptimer_run(ptimer, 0);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_false(triggered);
+
+    ptimer_stop(ptimer);
+}
+
+static void check_oneshot_with_load_0(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_period(ptimer, 2000000);
+    ptimer_run(ptimer, 1);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_false(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 + 100000);
+
+    g_assert_false(triggered);
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
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/periodic_with_load_0 policy=%s", policy_name),
+        ppolicy, check_periodic_with_load_0);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/oneshot_with_load_0 policy=%s", policy_name),
+        ppolicy, check_oneshot_with_load_0);
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
+    qtest_allowed = true;
+
+    return g_test_run();
+}
diff --git a/tests/ptimer-test.h b/tests/ptimer-test.h
new file mode 100644
index 0000000..98d9b8f
--- /dev/null
+++ b/tests/ptimer-test.h
@@ -0,0 +1,22 @@
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
+extern bool qtest_allowed;
+
+extern int64_t ptimer_test_time_ns;
+
+struct QEMUTimerList {
+    QEMUTimer active_timers;
+};
+
+#endif
-- 
2.9.3

