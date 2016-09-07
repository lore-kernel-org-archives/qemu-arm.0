Received: by 10.25.87.130 with SMTP id l124csp309119lfb;
        Wed, 7 Sep 2016 06:25:45 -0700 (PDT)
X-Received: by 10.55.44.69 with SMTP id s66mr53598070qkh.174.1473254745659;
        Wed, 07 Sep 2016 06:25:45 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r48si24987840qtb.104.2016.09.07.06.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcrJ-0002wu-0E
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:25:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp2-0001ZA-8S
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp0-0005fk-Ix
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:24 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcp0-0005fe-6J; Wed, 07 Sep 2016 09:23:22 -0400
Received: by mail-lf0-x241.google.com with SMTP id 29so830657lfv.1;
	Wed, 07 Sep 2016 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BWgcALkJzhXV3uaXmMy9xgFpOWWG0PFCUpgqPeuzx/0=;
	b=M1EJOsEUE+pW4pfCMN3tm85FPd4SpRBzS0kQJP1W518HhDR0iuVbcIGzIbya2ChmWl
	ETArJz5p7RdgVLRfGCdzH2LpLQtC+pMiEIsQfMo+YK8Of8xpHL59ScV9vPyKrve7ZAj8
	Isg9qELKJSlq/uK1wy88erpYyRAjedalxWvTuaQFCXnNXoLNJ3E3FGu40fr4+fMv2zl/
	pVZwLLBd+qW0hZxRV7vn7sDNoND7Lc1s9hd+uBN6Cd5y3ELPujwfz+l1kDbUVz5FIpmf
	ch7uYYTtBwj4k5jaYWvW2cn3ylpfGQMqQz+2WHFrNTtApxeFiuDQiuSjxVgV0vPoTXx9
	IiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=BWgcALkJzhXV3uaXmMy9xgFpOWWG0PFCUpgqPeuzx/0=;
	b=UKyEpO4psFHXa+NNIbGW2jESc0gs0dIq+enU9Lhd/EEyVwqXQ47M0H7LixN6tkfmS/
	2kJ0hvO1PBGStgW9BIYtW98JEmQqSQZ9vjLDc0KVUwxFl0i/7Ya8sS+GbAnTZSBa2DCb
	DJ+nJLh4ltbKQdkmvnfg742eNHTXGNdMYKRvbmYPCPvjVFtWw8h1eLMr0CRtDZtof3Be
	1YxwOSx7bYWNx5OqUmYnhUGq5gHtLmUMQYY32fGPY8DcWc4lVcXmd/LhCnbg+9oE9ZB5
	3y5SbDP0DmZMQDIOQ7icjCr7DvRVBz093VIT6H1BB4uFGX1pG99WhRD0v+fs2pVZCz8+
	+KtA==
X-Gm-Message-State: AE9vXwMmAYMZI1I4B9Q5loV5gGUjZT+MgnN8+CV3nACEvikMheOGbpouUxBQ5HcTCwHF9A==
X-Received: by 10.25.16.74 with SMTP id f71mr16747lfi.21.1473254601130;
	Wed, 07 Sep 2016 06:23:21 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:20 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:17 +0300
Message-Id: <2dfb2ebbd0d50e8c81f6d57bf8b351c7a3849da8.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v16 06/16] tests: ptimer: Add tests for
 "wraparound after one period" policy
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
X-TUID: wMSmbOUYVY8e

PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD changes ptimer behaviour in a such way,
that it would wrap around after one period instead of doing it immediately.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index f207eeb..5b0d75b 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -188,6 +188,7 @@ static void check_periodic(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
 
     triggered = false;
 
@@ -197,14 +198,14 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 10 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 20);
@@ -216,7 +217,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 10);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -224,7 +225,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 3);
@@ -232,14 +233,14 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 3 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 0);
@@ -250,7 +251,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 12 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -259,7 +260,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 12 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
     g_assert_false(triggered);
 
     ptimer_run(ptimer, 0);
@@ -267,7 +268,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
     g_assert_false(triggered);
 }
 
@@ -276,6 +277,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
 
     triggered = false;
 
@@ -292,7 +294,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
     g_assert_true(triggered);
 
     triggered = false;
@@ -301,7 +303,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     ptimer_run(ptimer, 1);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 1 : 0);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 3);
@@ -394,6 +396,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
 
     triggered = false;
 
@@ -436,7 +439,7 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     qemu_clock_step(2000000 * 98);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 99 : 98);
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -497,7 +500,7 @@ static void check_oneshot_with_load_0(gconstpointer arg)
 static void add_ptimer_tests(uint8_t policy)
 {
     uint8_t *ppolicy = g_malloc(1);
-    char *policy_name = g_malloc(64);
+    char *policy_name = g_malloc0(256);
 
     *ppolicy = policy;
 
@@ -505,6 +508,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_sprintf(policy_name, "default");
     }
 
+    if (policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
+        g_strlcat(policy_name, "wrap_after_one_period,", 256);
+    }
+
     qtest_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -550,6 +557,16 @@ static void add_ptimer_tests(uint8_t policy)
         ppolicy, check_oneshot_with_load_0);
 }
 
+static void add_all_ptimer_policies_comb_tests(void)
+{
+    int last_policy = PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD;
+    int policy = PTIMER_POLICY_DEFAULT;
+
+    for (; policy < (last_policy << 1); policy++) {
+        add_ptimer_tests(policy);
+    }
+}
+
 int main(int argc, char **argv)
 {
     int i;
@@ -560,7 +577,7 @@ int main(int argc, char **argv)
         main_loop_tlg.tl[i] = g_new0(QEMUTimerList, 1);
     }
 
-    add_ptimer_tests(PTIMER_POLICY_DEFAULT);
+    add_all_ptimer_policies_comb_tests();
 
     qtest_allowed = true;
 
-- 
2.9.3

