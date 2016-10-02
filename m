Received: by 10.80.163.71 with SMTP id 65csp1174163edn;
        Sun, 2 Oct 2016 09:16:44 -0700 (PDT)
X-Received: by 10.55.154.135 with SMTP id c129mr15839113qke.304.1475425004444;
        Sun, 02 Oct 2016 09:16:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63si12247903qkc.251.2016.10.02.09.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjRT-0006u8-QL
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:16:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC6-0002iH-GU
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC3-0003KJ-Hz
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:49 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjC2-0003Jj-Vp; Sun, 02 Oct 2016 12:00:47 -0400
Received: by mail-lf0-x244.google.com with SMTP id l131so7946174lfl.0;
	Sun, 02 Oct 2016 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uMoDl4UByVGc9T0Xdj5I2VVhUHRte4VTK/8epl90lIM=;
	b=iJlF6p3iA7sujaliDt2RPqDR7bOsWvNuvEMpOOBv6xRQ149lNaGYa8CoSmhS5OAatv
	Xf7mkcKjlTmS/ZGCLN4Ah/bIl1Haw5Cqpp221WAwzE5bwgGAOk0wWHaZelOOOmPCoO2w
	JdF78978YLJFvaSGJirjR8ltSAepk3ce5uddtDwJpEZvQ/PRs77srCHghCC18EdwR8yI
	jVUxwkwJ8SAA6Fvuso8nCxkISAcorbwonlUPF5zYhjg3XGPgu8Q2DqRACKm7BZc21XHn
	ayNTAKFArYwGFf35cszmopOR14HDDW7XXYcigTRZLCrjvJtzcunchyrtHuj/uBKnsel1
	15DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uMoDl4UByVGc9T0Xdj5I2VVhUHRte4VTK/8epl90lIM=;
	b=O2s7vxU77OpgP6gC6IA0oct7Y1w1xEDL89JIhzFPSqqqdh9/sCojfujQOEL+w00iGL
	91Vj2IwwUwfCWS5Fzl/LzkEaljIq9XVm9EpbVdI7ORFFR4Uc2AvECHizzh5DBcaVdQfW
	Iy+sMAdY5qJDfU4Ne+6lCUZ+/P/uFycIT7yanNXeLeDHWYbT75/YLIAkWAflEiyTnzJp
	tBS2VK4RdVL0/VtamIRNbDCoZianbuRjbeJMYhzg6+D93n0ApJA+Xbw5kvA1bDzWUf1l
	HkAMzSajmyoPAqECddZeYObO2tLTFNYqbST5rvkHzKJiiWsM9Zk2I9Qe16egHo+9RCBh
	ABXQ==
X-Gm-Message-State: AA6/9Rl8tK59sWyP/RuRbD+YCud25Ex7l0HakfVbBewBpy7MNLQhlFghqOWm3ySFBIpVgA==
X-Received: by 10.46.32.4 with SMTP id g4mr6300106ljg.69.1475424015045;
	Sun, 02 Oct 2016 09:00:15 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:14 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:40 +0300
Message-Id: <a7acf805e447cc7f637ecacbd45cca34ea3bf425.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-devel] [PATCH v17 08/14] tests: ptimer: Add tests for "no
 immediate reload" policy
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
X-TUID: siv6XK7Pgo8x

PTIMER_POLICY_NO_IMMEDIATE_RELOAD makes ptimer to not to re-load
counter on setting counter value to "0" or starting to run with "0".

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 73 +++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 57 insertions(+), 16 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index d55cc79..0badfe7 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -190,6 +190,7 @@ static void check_periodic(gconstpointer arg)
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
+    bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
 
     triggered = false;
 
@@ -219,7 +220,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 20);
@@ -239,7 +240,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 10);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
     g_assert_true(triggered);
 
     triggered = false;
@@ -256,7 +257,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 4);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -264,7 +265,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 3);
@@ -279,11 +280,12 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8 + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 0);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     no_immediate_reload ? 0 : 10);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -295,12 +297,27 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(100000);
 
+    if (no_immediate_reload) {
+        g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+        g_assert_false(triggered);
+
+        qemu_clock_step(2000000);
+
+        if (no_immediate_trigger) {
+            g_assert_true(triggered);
+        } else {
+            g_assert_false(triggered);
+        }
+
+        triggered = false;
+    }
+
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 12);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7 + (wrap_policy ? 1 : 0));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -309,7 +326,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 10);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7 + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_run(ptimer, 0);
@@ -317,7 +334,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7 + (wrap_policy ? 1 : 0));
     g_assert_false(triggered);
 }
 
@@ -450,13 +467,15 @@ static void check_run_with_delta_0(gconstpointer arg)
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
+    bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
 
     triggered = false;
 
     ptimer_set_period(ptimer, 2000000);
     ptimer_set_limit(ptimer, 99, 0);
     ptimer_run(ptimer, 1);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     no_immediate_reload ? 0 : 99);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -466,11 +485,19 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     triggered = false;
 
-    if (no_immediate_trigger) {
+    if (no_immediate_trigger || no_immediate_reload) {
         qemu_clock_step(2000000 + 100000);
 
-        g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
-        g_assert_false(triggered);
+        g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                         no_immediate_reload ? 0 : 97);
+
+        if (no_immediate_trigger && no_immediate_reload) {
+            g_assert_true(triggered);
+
+            triggered = false;
+        } else {
+            g_assert_false(triggered);
+        }
 
         ptimer_set_count(ptimer, 99);
         ptimer_run(ptimer, 1);
@@ -495,7 +522,8 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     ptimer_set_count(ptimer, 0);
     ptimer_run(ptimer, 0);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                     no_immediate_reload ? 0 : 99);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -507,8 +535,17 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     qemu_clock_step(100000);
 
+    if (no_immediate_reload) {
+        qemu_clock_step(2000000);
+    }
+
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
-    g_assert_false(triggered);
+
+    if (no_immediate_reload && no_immediate_trigger) {
+        g_assert_true(triggered);
+    } else {
+        g_assert_false(triggered);
+    }
 
     triggered = false;
 
@@ -639,6 +676,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "no_immediate_trigger,", 256);
     }
 
+    if (policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD) {
+        g_strlcat(policy_name, "no_immediate_reload,", 256);
+    }
+
     g_test_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -686,7 +727,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_TRIGGER;
+    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_RELOAD;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.3

