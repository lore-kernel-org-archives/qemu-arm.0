Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1433952ivh;
        Tue, 3 Jul 2018 10:25:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd7ino6zyA76Fwgwk5AV/uH1ayfYYPm3fs9TxLO6h2/XeTQjT4XsT8svAgSyOuXAvwwrljV
X-Received: by 2002:a0c:9b93:: with SMTP id o19-v6mr27459321qve.89.1530638713796;
        Tue, 03 Jul 2018 10:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530638713; cv=none;
        d=google.com; s=arc-20160816;
        b=fjCnXlhzMjCH2fT3DyGJVV+/dFuAzQWYlE6fd+f8YdJIFqzfkBCOhO+aUQTgn0qQJv
         Cy1L4BO8Ho4QTHqL4UaUXLzUOif0yMUYRlSHjsuXmJg/8sJ2yKqJNZJXu0ujX8DejUF+
         IhZLDxfdocbBS866Q4YNlS8EQrMhwITWf+Mi2IP/CtVuZw2wkD1cybK6AsPjb2f5YGOp
         k4sYncXUy0fJfMwYUq1hjFrtnGdC7dpVP5IB/m1Smj7LXVgzQJyGwRzqdx2Wy2NmKEdH
         iDmvmrsamZ3ROewi2TSEMqzD6cBJ0siS23CC+ZXVaqjOpyhu+AXQGXwqCKsllEvp1enc
         hLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=N+ikNAGjDmD5Ead/5T+2G3mNr/p6QYxS/H56NVIt2tQ=;
        b=DED2LkRDuto3IJScE3Dp98QsXKQ0ydYAwQWyo99n7igCyU3mlUJBXSLw+mzDfeR03Q
         xkOtQ35U/UgrN+c6SPHK98dHRH03LeO87/9LqMpy0+lcs0Qb69uI05mHC9Bvu9DsH8TB
         6u9qxW5tlYbgeQjj1UxuTIZqvy4COrpH/VBDPiBXRuljRTACJ0lKdq+ris1jo2NG5Tkv
         gSYSQy10OKOSMO4nADNJMiDO3EaxazEP6EdLkeC6kxO5haiGehup/iqH6Xxc7N7sxVMU
         Dnmw1TMY//B4HlnPfdyNBc1WxMErVfpxx9eJdNaOPQzjmCLCE61PoXL6VxahX29BOpS6
         2a6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4-v6si840875qtc.35.2018.07.03.10.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 10:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faP2o-0008Ay-M4
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 13:24:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faP2h-0008AW-9d
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 13:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1faP2f-0005WS-U1
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 13:24:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1faP2f-0005Vo-JL; Tue, 03 Jul 2018 13:24:41 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1faOpC-00033H-Io; Tue, 03 Jul 2018 18:10:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  3 Jul 2018 18:10:41 +0100
Message-Id: <20180703171044.9503-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180703171044.9503-1-peter.maydell@linaro.org>
References: <20180703171044.9503-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 1/4] ptimer: Add
 TRIGGER_ONLY_ON_DECREMENT policy option
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Guenter Roeck <linux@roeck-us.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0kHep9/nulTf

The CMSDK timer behaviour is that an interrupt is triggered when the
counter counts down from 1 to 0; however one is not triggered if the
counter is manually set to 0 by a guest write to the counter register.
Currently ptimer can't handle this; add a policy option to allow
a ptimer user to request this behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/ptimer.h |  9 +++++++++
 hw/core/ptimer.c    | 22 +++++++++++++++++++++-
 tests/ptimer-test.c | 25 +++++++++++++++++++------
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index fc4ef5cc1d2..0731d9aef19 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -69,6 +69,15 @@
  * not the one less.  */
 #define PTIMER_POLICY_NO_COUNTER_ROUND_DOWN (1 << 4)
 
+/*
+ * Starting to run with a zero counter, or setting the counter to "0" via
+ * ptimer_set_count() or ptimer_set_limit() will not trigger the timer
+ * (though it will cause a reload). Only a counter decrement to "0"
+ * will cause a trigger. Not compatible with NO_IMMEDIATE_TRIGGER;
+ * ptimer_init() will assert() that you don't set both.
+ */
+#define PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT (1 << 5)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 7221c68a984..170fd34d8b5 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -45,8 +45,20 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
     uint32_t period_frac = s->period_frac;
     uint64_t period = s->period;
     uint64_t delta = s->delta;
+    bool suppress_trigger = false;
 
-    if (delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)) {
+    /*
+     * Note that if delta_adjust is 0 then we must be here because of
+     * a count register write or timer start, not because of timer expiry.
+     * In that case the policy might require us to suppress the timer trigger
+     * that we would otherwise generate for a zero delta.
+     */
+    if (delta_adjust == 0 &&
+        (s->policy_mask & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT)) {
+        suppress_trigger = true;
+    }
+    if (delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)
+        && !suppress_trigger) {
         ptimer_trigger(s);
     }
 
@@ -353,6 +365,14 @@ ptimer_state *ptimer_init(QEMUBH *bh, uint8_t policy_mask)
     s->bh = bh;
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ptimer_tick, s);
     s->policy_mask = policy_mask;
+
+    /*
+     * These two policies are incompatible -- trigger-on-decrement implies
+     * a timer trigger when the count becomes 0, but no-immediate-trigger
+     * implies a trigger when the count stops being 0.
+     */
+    assert(!((policy_mask & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT) &&
+             (policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)));
     return s;
 }
 
diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 41488896f76..b30aad07372 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -208,6 +208,7 @@ static void check_periodic(gconstpointer arg)
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
     bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
+    bool trig_only_on_dec = (*policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT);
 
     triggered = false;
 
@@ -311,7 +312,7 @@ static void check_periodic(gconstpointer arg)
     g_assert_cmpuint(ptimer_get_count(ptimer), ==,
                      no_immediate_reload ? 0 : 10);
 
-    if (no_immediate_trigger) {
+    if (no_immediate_trigger || trig_only_on_dec) {
         g_assert_false(triggered);
     } else {
         g_assert_true(triggered);
@@ -506,6 +507,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
     bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
+    bool trig_only_on_dec = (*policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT);
 
     triggered = false;
 
@@ -515,7 +517,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     g_assert_cmpuint(ptimer_get_count(ptimer), ==,
                      no_immediate_reload ? 0 : 99);
 
-    if (no_immediate_trigger) {
+    if (no_immediate_trigger || trig_only_on_dec) {
         g_assert_false(triggered);
     } else {
         g_assert_true(triggered);
@@ -563,7 +565,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     g_assert_cmpuint(ptimer_get_count(ptimer), ==,
                      no_immediate_reload ? 0 : 99);
 
-    if (no_immediate_trigger) {
+    if (no_immediate_trigger || trig_only_on_dec) {
         g_assert_false(triggered);
     } else {
         g_assert_true(triggered);
@@ -609,6 +611,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
+    bool trig_only_on_dec = (*policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT);
 
     triggered = false;
 
@@ -617,7 +620,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
 
-    if (no_immediate_trigger) {
+    if (no_immediate_trigger || trig_only_on_dec) {
         g_assert_false(triggered);
     } else {
         g_assert_true(triggered);
@@ -667,6 +670,7 @@ static void check_oneshot_with_load_0(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
+    bool trig_only_on_dec = (*policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT);
 
     triggered = false;
 
@@ -675,7 +679,7 @@ static void check_oneshot_with_load_0(gconstpointer arg)
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
 
-    if (no_immediate_trigger) {
+    if (no_immediate_trigger || trig_only_on_dec) {
         g_assert_false(triggered);
     } else {
         g_assert_true(triggered);
@@ -725,6 +729,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "no_counter_rounddown,", 256);
     }
 
+    if (policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT) {
+        g_strlcat(policy_name, "trigger_only_on_decrement,", 256);
+    }
+
     g_test_add_data_func_full(
         tmp = g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         g_memdup(&policy, 1), check_set_count, g_free);
@@ -790,10 +798,15 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_NO_COUNTER_ROUND_DOWN;
+    int last_policy = PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
+        if ((policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT) &&
+            (policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)) {
+            /* Incompatible policy flag settings -- don't try to test them */
+            continue;
+        }
         add_ptimer_tests(policy);
     }
 }
-- 
2.17.1

