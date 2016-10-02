Received: by 10.80.163.71 with SMTP id 65csp1173272edn;
        Sun, 2 Oct 2016 09:14:02 -0700 (PDT)
X-Received: by 10.55.31.76 with SMTP id f73mr15655589qkf.260.1475424842561;
        Sun, 02 Oct 2016 09:14:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n132si17570785qka.92.2016.10.02.09.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjOr-0004js-TU
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:14:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC8-0002jy-6v
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC5-0003MB-1D
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:51 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjC4-0003LH-GS; Sun, 02 Oct 2016 12:00:48 -0400
Received: by mail-lf0-x243.google.com with SMTP id s64so7954958lfs.2;
	Sun, 02 Oct 2016 09:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vGcR371EoYbM5wKEvSRj3UAdn6lAhwO7n2KZVis4NXo=;
	b=ZtjwHOIjJCiUz4OiGN59Tja20w0IcCoYBZg2p842Wj1lIId2QDmzF2kccxfqubVLgW
	ZTgPqsPAYEf5NOGKpVqTlR87Q5Kt944OFw6Fzw5GtXYjQDN71sg7cvHiU0Jj8K9Eojie
	wUNOBrlYgcxtoMsX0c9iJOzxusVD73vyOlOUmlozK56BLplhXUIC3EmIfQZA/XTqFK+f
	WdlGse26XlrIFrcEYoBmshmovKR/vTbhyNmjRPPH9u+OGPnmKYnoTktdSctPWOTq2rdD
	H4VoGxwPT+8JIEjH9Ade1Ob4lHsjkrDAzJM1EewLmGP9BqgJHAWav6pdrMWInaBXVZ1p
	WZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vGcR371EoYbM5wKEvSRj3UAdn6lAhwO7n2KZVis4NXo=;
	b=DiGx15EUr3ebeVjFnTMiJwZijUi+J/+B3ItuHKlGQpW4i1hUNN6X51W2Et7DNI+bIq
	t6y8bgpAyEerKX4pN2ryXfALjuai3OH+QZx1HdER9ic88BAyGvzgUHwTn3p4NSdfUetI
	cbv2JNv1Z03nrzo+beaoMv2cXqKqzQ2vr6Socu4V2d7ZdcqywvdqnuRGlNmoFco5G2N9
	//OiFOyXefe54+u/S6pskd5OP9Sg5cm0DJAbvZ/X/+tI/Kvtksu91ov2jRgclMUEJH+m
	udIc/FpXiTRcsOH7y+WaFRQfgSVoGpD62+eZ/Vpq1zd42v60oDRrs8mz583NuRNamQs+
	n5Wg==
X-Gm-Message-State: AA6/9Rlcjab6zH9G1Z1iMhpi4Pn23CMYzEJ0nBjnhObsVbFKH3ky21eP+UB8LAX9HFXk5A==
X-Received: by 10.46.1.74 with SMTP id 71mr4125441ljb.77.1475424016532;
	Sun, 02 Oct 2016 09:00:16 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:16 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:42 +0300
Message-Id: <0082889309b3dc66c03c8de00b8c1ef40c1e3955.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v17 10/14] tests: ptimer: Add tests for "no
 counter round down" policy
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
X-TUID: ZAyRbPVd7WaM

PTIMER_POLICY_NO_COUNTER_ROUND_DOWN makes ptimer_get_count() return the
actual counter value and not the one less.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 117 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 76 insertions(+), 41 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 0badfe7..1bd5924 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -99,6 +99,7 @@ static void check_oneshot(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -108,32 +109,44 @@ static void check_oneshot(gconstpointer arg)
 
     qemu_clock_step(2000000 * 2 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 8 : 7);
     g_assert_false(triggered);
 
     ptimer_stop(ptimer);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 8 : 7);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 11);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 8 : 7);
     g_assert_false(triggered);
 
     ptimer_run(ptimer, 1);
 
     qemu_clock_step(2000000 * 7 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
-    g_assert_true(triggered);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
 
-    triggered = false;
+    if (no_round_down) {
+        g_assert_false(triggered);
+    } else {
+        g_assert_true(triggered);
+
+        triggered = false;
+    }
 
     qemu_clock_step(2000000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
-    g_assert_false(triggered);
+
+    if (no_round_down) {
+        g_assert_true(triggered);
+
+        triggered = false;
+    } else {
+        g_assert_false(triggered);
+    }
 
     qemu_clock_step(4000000);
 
@@ -158,14 +171,14 @@ static void check_oneshot(gconstpointer arg)
 
     qemu_clock_step(2000000 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 8 : 7);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 20);
 
     qemu_clock_step(2000000 * 19 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000);
@@ -191,6 +204,7 @@ static void check_periodic(gconstpointer arg)
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -203,7 +217,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 10 : 9);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 10 - 100000);
@@ -213,14 +227,16 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     wrap_policy ? 0 : (no_round_down ? 10 : 9));
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    (no_round_down ? 9 : 8) + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 20);
@@ -230,17 +246,18 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 19);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 20 : 19);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 11 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 9 : 8);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 10);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    (no_round_down ? 9 : 8) + (wrap_policy ? 1 : 0));
     g_assert_true(triggered);
 
     triggered = false;
@@ -252,12 +269,13 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 2);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 3 : 2);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 4);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    (no_round_down ? 9 : 8) + (wrap_policy ? 1 : 0));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -265,7 +283,8 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    (no_round_down ? 9 : 8) + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 3);
@@ -273,14 +292,16 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 3 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     wrap_policy ? 0 : (no_round_down ? 10 : 9));
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    (no_round_down ? 9 : 8) + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 0);
@@ -312,12 +333,13 @@ static void check_periodic(gconstpointer arg)
         triggered = false;
     }
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 10 : 9);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 12);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7 + (wrap_policy ? 1 : 0));
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    (no_round_down ? 8 : 7) + (wrap_policy ? 1 : 0));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -326,7 +348,8 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 10);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7 + (wrap_policy ? 1 : 0));
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    (no_round_down ? 8 : 7) + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_run(ptimer, 0);
@@ -334,7 +357,8 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7 + (wrap_policy ? 1 : 0));
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    (no_round_down ? 8 : 7) + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 }
 
@@ -344,6 +368,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -353,17 +378,18 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     qemu_clock_step(2000000 * 9 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
     g_assert_false(triggered);
 
     ptimer_run(ptimer, 0);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    wrap_policy ? 0 : (no_round_down ? 10 : 9));
     g_assert_true(triggered);
 
     triggered = false;
@@ -372,7 +398,8 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     ptimer_run(ptimer, 1);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 1 : 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     (no_round_down ? 1 : 0) + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 3);
@@ -386,6 +413,7 @@ static void check_on_the_fly_period_change(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -395,15 +423,15 @@ static void check_on_the_fly_period_change(gconstpointer arg)
 
     qemu_clock_step(2000000 * 4 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 4 : 3);
     g_assert_false(triggered);
 
     ptimer_set_period(ptimer, 4000000);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 4 : 3);
 
     qemu_clock_step(4000000 * 2 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 2 : 0);
     g_assert_false(triggered);
 
     qemu_clock_step(4000000 * 2);
@@ -417,6 +445,7 @@ static void check_on_the_fly_freq_change(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -426,15 +455,15 @@ static void check_on_the_fly_freq_change(gconstpointer arg)
 
     qemu_clock_step(2000000 * 4 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 4 : 3);
     g_assert_false(triggered);
 
     ptimer_set_freq(ptimer, 250);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 4 : 3);
 
     qemu_clock_step(2000000 * 4 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 2 : 0);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 4);
@@ -468,6 +497,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -489,7 +519,7 @@ static void check_run_with_delta_0(gconstpointer arg)
         qemu_clock_step(2000000 + 100000);
 
         g_assert_cmpuint(ptimer_get_count(ptimer), ==,
-                         no_immediate_reload ? 0 : 97);
+                         no_immediate_reload ? 0 : (no_round_down ? 98 : 97));
 
         if (no_immediate_trigger && no_immediate_reload) {
             g_assert_true(triggered);
@@ -505,12 +535,12 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     qemu_clock_step(2000000 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 98 : 97);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 97);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 2);
@@ -539,7 +569,7 @@ static void check_run_with_delta_0(gconstpointer arg)
         qemu_clock_step(2000000);
     }
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 99 : 98);
 
     if (no_immediate_reload && no_immediate_trigger) {
         g_assert_true(triggered);
@@ -551,12 +581,13 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 98 : 97);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 98);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 98);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    wrap_policy ? 0 : (no_round_down ? 99 : 98));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -680,6 +711,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "no_immediate_reload,", 256);
     }
 
+    if (policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN) {
+        g_strlcat(policy_name, "no_counter_rounddown,", 256);
+    }
+
     g_test_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -727,7 +762,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_RELOAD;
+    int last_policy = PTIMER_POLICY_NO_COUNTER_ROUND_DOWN;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.3

