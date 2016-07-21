Received: by 10.25.21.156 with SMTP id 28csp438818lfv;
        Thu, 21 Jul 2016 07:42:41 -0700 (PDT)
X-Received: by 10.129.70.194 with SMTP id t185mr34452095ywa.34.1469112161055;
        Thu, 21 Jul 2016 07:42:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t67si5193504qkd.66.2016.07.21.07.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQFBQ-0003fg-AA
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:42:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1e-00035P-3m
	for qemu-arm@nongnu.org; Thu, 21 Jul 2016 10:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1b-0003nc-St
	for qemu-arm@nongnu.org; Thu, 21 Jul 2016 10:32:33 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33557)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1X-0003jp-T3; Thu, 21 Jul 2016 10:32:28 -0400
Received: by mail-lf0-x241.google.com with SMTP id f93so5656812lfi.0;
	Thu, 21 Jul 2016 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mK9XIQhKNx4/xCllYR+26lkQHpjyjd2BmNNVz0XHflk=;
	b=YbaiWf80ly37kRFkr0xkpZ4M5RxIvV1dlrrKBT9z2a4mmznKWwaOiZ82qjmVlvPWV4
	IOpTFRhLCYjZ5PpfqOMjW03ccgNbRsjBZPIUqf0EUxpoySNEpzE59N90Q0fQOV6oxJHp
	WuZXaIXz6/iXrmUHDoNAqzI6DCL8TjuHBTU7DIcpB3JeI7u8eT32HLxM/TkUew3ie2J7
	hEuS5DwHzOi0Yy3WA1ygPO/8QLiu2py7es4ePg/NUNMyLJSgI117J3TEPZYTY/d28Lm+
	6LgFoe1dicTffUuCGB6y0/02D9iNpX5ywap6OA0Unx1FVFr+aywpzesapbEKTwncXaID
	gPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=mK9XIQhKNx4/xCllYR+26lkQHpjyjd2BmNNVz0XHflk=;
	b=Bi75dEOXIeQEyurEw4jTKy0cgYqQy6Ya4zqybDPjKOzPMhGKddymzYet0m83owFfMR
	beIjr962mtbmJXBBSoSuq6l8ZCc2J1E/G7zLcjFj4VjrwGaa6zAST/DpCa6/DXfDT2C7
	jgCXunilM+KxiFyARAc9V8dufRMg9zGtkWqzXeZNLJMFm766AJHxRgeCwob7qRTWy59U
	ZfP6EOiTRb2vWmDvNwSLnqoyyMetvNki6kPvYxhT9S+zp7bbY1rkmYiMtRav6Kp9NJiy
	V2tSZyOd4jOL0O2UiVODi95caSlJaF4gUjnEWUtp9OztmMH8nwvgpE55OPTtWc6MqOHA
	SWxg==
X-Gm-Message-State: ALyK8tK+OaZECoRQ+VNWyzWewm916HuBZAOky8ybpKFikDaTAHWJ76GYx0a+0pw/7Zk9hw==
X-Received: by 10.25.82.202 with SMTP id g193mr10895212lfb.141.1469111547015; 
	Thu, 21 Jul 2016 07:32:27 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:26 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:18 +0300
Message-Id: <70ea1352cd384c47ab0ab407cf407c1cb42b5e43.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-arm] [PATCH v15 07/15] tests: ptimer: Add tests for
 "wraparound after one period" policy
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R/zvw8nGgENS

PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD changes ptimer behaviour in a such way,
that it would wrap around after one period instead of doing it immediately.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 5c87828..981414d 100644
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
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 10);
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 20);
@@ -216,7 +217,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 10);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -224,7 +225,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 3);
@@ -232,14 +233,14 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 3 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 10);
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 0);
@@ -250,7 +251,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 12 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -259,7 +260,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 12 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_false(triggered);
 }
 
@@ -268,6 +269,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
 
     triggered = false;
 
@@ -284,7 +286,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 10);
     g_assert_true(triggered);
 
     triggered = false;
@@ -293,10 +295,10 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     ptimer_run(ptimer, 1);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 1);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 2 : 1);
     g_assert_false(triggered);
 
-    qemu_clock_step(2000000);
+    qemu_clock_step(2000000 * 3);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
     g_assert_true(triggered);
@@ -386,6 +388,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
 
     triggered = false;
 
@@ -428,7 +431,7 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     qemu_clock_step(2000000 * 98);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 99);
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -437,7 +440,7 @@ static void check_run_with_delta_0(gconstpointer arg)
 static void add_ptimer_tests(uint8_t policy)
 {
     uint8_t *ppolicy = g_malloc(1);
-    char *policy_name = g_malloc(64);
+    char *policy_name = g_malloc0(256);
 
     *ppolicy = policy;
 
@@ -445,6 +448,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_sprintf(policy_name, "default");
     }
 
+    if (policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
+        g_strlcat(policy_name, "wrap_after_one_period,", 256);
+    }
+
     qtest_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -482,6 +489,16 @@ static void add_ptimer_tests(uint8_t policy)
         ppolicy, check_run_with_delta_0);
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
@@ -492,7 +509,7 @@ int main(int argc, char **argv)
         main_loop_tlg.tl[i] = g_new0(QEMUTimerList, 1);
     }
 
-    add_ptimer_tests(PTIMER_POLICY_DEFAULT);
+    add_all_ptimer_policies_comb_tests();
 
     return g_test_run();
 }
-- 
2.9.2

