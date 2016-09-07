Received: by 10.25.87.130 with SMTP id l124csp318391lfb;
        Wed, 7 Sep 2016 06:46:29 -0700 (PDT)
X-Received: by 10.55.186.65 with SMTP id k62mr51771093qkf.204.1473255989724;
        Wed, 07 Sep 2016 06:46:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si25062037qkc.77.2016.09.07.06.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhdBN-0007JP-2e
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:46:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcpE-0001jr-5I
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp7-0005k7-A9
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:36 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:32848)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcp6-0005jl-UR; Wed, 07 Sep 2016 09:23:29 -0400
Received: by mail-lf0-x241.google.com with SMTP id l131so830866lfl.0;
	Wed, 07 Sep 2016 06:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Jyerh4002uKSd8LtMgtEq7IgzYcos7trkDuRhTXjuwU=;
	b=zTkwFqAPT6/YostYQJQZoy2lzFsTKD56PhMIiuOQUDvlMrzZX7DDpXWyqqsIW8BX2n
	4vWpUkEDb8rgacpnJ+WJ3AlW57u7VUB9JgjQ2CzB0G9j1o7TaCqdQH8PFE/4E7ZbuJDd
	u1ZuXXZC0zhNb8tDuyg2Nz2HnT3ZLHojKfeaF/XHPPBvjE3sm67hxP/ImqBGL4VBIEL5
	8xJdPZg5lQjNPc9qvp1L8cuBc5zhP27d63hjAsXT3mFxEaxce55UrtRHNRPPm/cUagSE
	/F47YgGkwMcG3SzSRw4NtpHrhjoDwfy1D6wCd2K88P8L3qaG/KF9eTCNWbLzNL4IcyGs
	5u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Jyerh4002uKSd8LtMgtEq7IgzYcos7trkDuRhTXjuwU=;
	b=DZoFSkj3JpcwabAtnj5eweCrtjGvocVmZ4KoehdLuQUOakB3YbJdwq7ywryPxyyVAJ
	JXVPuN3U7e3k8NGf/wG0G0LjYnKJPF+idA4oouRoJAFJSA0gEC3WrcuhmqBTjGIvTaxe
	Etp6u9CmBnngk+05QALnhMqH1Eu7yqxpf4MHKXxaVW/b1eVvGYCQCLQOZlX3L9k81fKd
	l9SyJ1W/G+4GQsRWFr+JuNVp0buzSlln4DkctsYXWWMXV93wAxyLOvGL8xggDoUyZhmN
	kn0HBNHFh8YTc91iZ4t3aW2ayI5Xfm0cabZpxI0/IUpmgnIBjQL7aLJTWm6kmAWVMKIJ
	e+UA==
X-Gm-Message-State: AE9vXwOKUeKmxqSivBACEcjH0abbVz7KG1JNdgefAI6TLsvOwcxANYibGu8ezsA9KyKb3Q==
X-Received: by 10.25.217.146 with SMTP id s18mr34710lfi.46.1473254608091;
	Wed, 07 Sep 2016 06:23:28 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:27 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:25 +0300
Message-Id: <01572cb1da3d772cb03c477916879fed988b1a8e.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v16 14/16] tests: ptimer: Add tests for "no
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
X-TUID: NhcDAgpaZHiU

PTIMER_POLICY_NO_COUNTER_ROUND_DOWN makes ptimer_get_count() return the
actual counter value and not the one less.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 115 +++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 78 insertions(+), 37 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index bb49670..a69e759 100644
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
@@ -192,6 +205,7 @@ static void check_periodic(gconstpointer arg)
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
     bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -201,26 +215,29 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 10 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+            wrap_policy ? (no_round_down ? 0 : 10) : (no_round_down ? 10 : 9));
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     (no_round_down ? 1 : 0) + (wrap_policy ? 9 : 8));
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 20);
 
     qemu_clock_step(2000000 * 11 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 9 : 8);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 10);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     (no_round_down ? 1 : 0) + (wrap_policy ? 9 : 8));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -228,7 +245,8 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     (no_round_down ? 1 : 0) + (wrap_policy ? 9 : 8));
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 3);
@@ -236,18 +254,21 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 3 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+            wrap_policy ? (no_round_down ? 0 : 10) : (no_round_down ? 10 : 9));
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     (no_round_down ? 1 : 0) + (wrap_policy ? 9 : 8));
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 0);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_immediate_reload ? 0 : 10);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     no_immediate_reload ? 0 : 10);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -266,7 +287,9 @@ static void check_periodic(gconstpointer arg)
     }
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==,
-                    7 + (wrap_policy ? 1 : 0) + (no_immediate_reload ? 1 : 0));
+                    (no_immediate_reload ? 8 : 7) +
+                    (no_round_down ? 1 : 0) +
+                    (wrap_policy ? 1 : 0));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -276,7 +299,9 @@ static void check_periodic(gconstpointer arg)
     qemu_clock_step(2000000 * 12 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==,
-                    7 + (wrap_policy ? 1 : 0) + (no_immediate_reload ? 1 : 0));
+                    (no_immediate_reload ? 8 : 7) +
+                    (no_round_down ? 1 : 0) +
+                    (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_run(ptimer, 0);
@@ -285,7 +310,9 @@ static void check_periodic(gconstpointer arg)
     qemu_clock_step(2000000 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==,
-                    7 + (wrap_policy ? 1 : 0) + (no_immediate_reload ? 1 : 0));
+                    (no_immediate_reload ? 8 : 7) +
+                    (no_round_down ? 1 : 0) +
+                    (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 }
 
@@ -295,6 +322,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -306,12 +334,13 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     ptimer_run(ptimer, 0);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 10 : 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+            wrap_policy ? (no_round_down ? 0 : 10) : (no_round_down ? 10 : 9));
     g_assert_true(triggered);
 
     triggered = false;
@@ -320,7 +349,8 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     ptimer_run(ptimer, 1);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 1 : 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     (no_round_down ? 1 : 0) + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 3);
@@ -334,6 +364,7 @@ static void check_on_the_fly_period_change(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -343,15 +374,15 @@ static void check_on_the_fly_period_change(gconstpointer arg)
 
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
@@ -365,6 +396,7 @@ static void check_on_the_fly_freq_change(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
@@ -374,15 +406,15 @@ static void check_on_the_fly_freq_change(gconstpointer arg)
 
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
@@ -417,13 +449,15 @@ static void check_run_with_delta_0(gconstpointer arg)
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
     bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
+    bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
 
     ptimer_set_period(ptimer, 2000000);
     ptimer_set_limit(ptimer, 99, 0);
     ptimer_run(ptimer, 1);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_immediate_reload ? 0 : 99);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     no_immediate_reload ? 0 : 99);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -440,12 +474,12 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     qemu_clock_step(2000000 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 98 : 97);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 97);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 2);
@@ -457,7 +491,8 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     ptimer_set_count(ptimer, 0);
     ptimer_run(ptimer, 0);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_immediate_reload ? 0 : 99);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     no_immediate_reload ? 0 : 99);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -471,7 +506,8 @@ static void check_run_with_delta_0(gconstpointer arg)
         qemu_clock_step(2000000 + 100000);
 
         if (continuous_trigger || no_immediate_trigger) {
-            g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
+            g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                             no_round_down ? 99 : 98);
             g_assert_true(triggered);
 
             triggered = false;
@@ -484,12 +520,13 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     qemu_clock_step(2000000 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 98 : 97);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 98);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 99 : 98);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+            wrap_policy ? (no_round_down ? 0 : 99) : (no_round_down ? 99 : 98));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -603,6 +640,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "no_immediate_reload,", 256);
     }
 
+    if (policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN) {
+        g_strlcat(policy_name, "no_counter_rounddown,", 256);
+    }
+
     qtest_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -650,7 +691,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_RELOAD;
+    int last_policy = PTIMER_POLICY_NO_COUNTER_ROUND_DOWN;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.3

