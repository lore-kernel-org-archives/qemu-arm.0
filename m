Received: by 10.80.163.71 with SMTP id 65csp1171004edn;
        Sun, 2 Oct 2016 09:07:29 -0700 (PDT)
X-Received: by 10.55.166.194 with SMTP id p185mr5342720qke.18.1475424449305;
        Sun, 02 Oct 2016 09:07:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15si11753084qkl.283.2016.10.02.09.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjIW-0007Z7-KT
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:07:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC3-0002gQ-Fx
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC1-0003J1-Qa
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:47 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36683)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjC1-0003Ib-Eb; Sun, 02 Oct 2016 12:00:45 -0400
Received: by mail-lf0-x241.google.com with SMTP id b75so429220lfg.3;
	Sun, 02 Oct 2016 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ylZoYezIcy0kLE5nQYDyGt1w/cffZpFnYtC2Q5LlX2A=;
	b=fgo/4bP5bFnpf8rrB4YvJspt1c48I73TmRRaDFAvQ0839WcTuIqr9BdTKhey5zwSXP
	a1Wp36ZOT13kyVkT2Aqc7LQXE2M0PrY3YcBxEWU0K0Oa4C4OnAmqyCt1nnTQra5ZGZSm
	JTKB37WHrrf2Xvg3Q3gvfb934chC/C5E4uaO009tAsW1lsrFzugQPoFNb/1KItFynu8i
	LRMLzqFrzGlEu3AykJUjQV8yCPD0PTYxQxvWTnGgzt7tTAQztSPSQxRDMr9ramzEf8Xk
	ReYgdeM98iJUN209GUgSH76wFDlOjp5o3+q1Ri94++7FpBhay+zZDL7o5WTXbRjMHbij
	o4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ylZoYezIcy0kLE5nQYDyGt1w/cffZpFnYtC2Q5LlX2A=;
	b=icyK4lvOAlF+6C/NZMV5ehA/iDY0iKZTOMnTcGfuDYWyjAKY77eQUn5K60XwrmHQ/t
	n2KDyarRDHbOZWJSRM051t5NiPNen+kHLKQIHCknAPE5GYSx4bBa6YEDp1nUROQgnEBi
	fNJHgVe2zj155LBrIXTUorCcwDK2URP8FZmaTDn9nScJKywHJ8CuKBKlA1YaYoiUbEwQ
	75xDaKufxJEia5QQZBFK9LzBUYJZUIjGtoBLnbF5eMOafn7RsRoTgU6Y+WIGFno6jCxv
	ERqdhr/sslDOXqGCn7opBLFINSjOgS9xUWj72kbbIS1Mf/4iR67+acOts3dyxgbvuOEJ
	Ucfg==
X-Gm-Message-State: AA6/9RnzUG6ChD3gJloUvGcj2ZUMqbhhzOkDHeUlImevNRTCMmm/NfOiwfPM2WruX/+V5w==
X-Received: by 10.46.33.217 with SMTP id h86mr6369836lji.53.1475424013552;
	Sun, 02 Oct 2016 09:00:13 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:13 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:38 +0300
Message-Id: <12b1e745f90fe2ca3d59197166bc3d379260f912.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v17 06/14] tests: ptimer: Add tests for "no
 immediate trigger" policy
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
X-TUID: c8ebXqlyvlGu

PTIMER_POLICY_NO_IMMEDIATE_TRIGGER makes ptimer to not to trigger on starting
to run with / setting counter to "0".

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index dd4b1a1..d55cc79 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -189,6 +189,7 @@ static void check_periodic(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -283,7 +284,12 @@ static void check_periodic(gconstpointer arg)
 
     ptimer_set_count(ptimer, 0);
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
-    g_assert_true(triggered);
+
+    if (no_immediate_trigger) {
+        g_assert_false(triggered);
+    } else {
+        g_assert_true(triggered);
+    }
 
     triggered = false;
 
@@ -443,6 +449,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -450,10 +457,25 @@ static void check_run_with_delta_0(gconstpointer arg)
     ptimer_set_limit(ptimer, 99, 0);
     ptimer_run(ptimer, 1);
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
-    g_assert_true(triggered);
+
+    if (no_immediate_trigger) {
+        g_assert_false(triggered);
+    } else {
+        g_assert_true(triggered);
+    }
 
     triggered = false;
 
+    if (no_immediate_trigger) {
+        qemu_clock_step(2000000 + 100000);
+
+        g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
+        g_assert_false(triggered);
+
+        ptimer_set_count(ptimer, 99);
+        ptimer_run(ptimer, 1);
+    }
+
     qemu_clock_step(2000000 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
@@ -474,7 +496,12 @@ static void check_run_with_delta_0(gconstpointer arg)
     ptimer_set_count(ptimer, 0);
     ptimer_run(ptimer, 0);
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
-    g_assert_true(triggered);
+
+    if (no_immediate_trigger) {
+        g_assert_false(triggered);
+    } else {
+        g_assert_true(triggered);
+    }
 
     triggered = false;
 
@@ -504,6 +531,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -511,7 +539,12 @@ static void check_periodic_with_load_0(gconstpointer arg)
     ptimer_run(ptimer, 0);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
-    g_assert_true(triggered);
+
+    if (no_immediate_trigger) {
+        g_assert_false(triggered);
+    } else {
+        g_assert_true(triggered);
+    }
 
     triggered = false;
 
@@ -519,7 +552,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
 
-    if (continuous_trigger) {
+    if (continuous_trigger || no_immediate_trigger) {
         g_assert_true(triggered);
     } else {
         g_assert_false(triggered);
@@ -555,6 +588,7 @@ static void check_oneshot_with_load_0(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -562,14 +596,24 @@ static void check_oneshot_with_load_0(gconstpointer arg)
     ptimer_run(ptimer, 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
-    g_assert_true(triggered);
+
+    if (no_immediate_trigger) {
+        g_assert_false(triggered);
+    } else {
+        g_assert_true(triggered);
+    }
 
     triggered = false;
 
     qemu_clock_step(2000000 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
-    g_assert_false(triggered);
+
+    if (no_immediate_trigger) {
+        g_assert_true(triggered);
+    } else {
+        g_assert_false(triggered);
+    }
 }
 
 static void add_ptimer_tests(uint8_t policy)
@@ -591,6 +635,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "continuous_trigger,", 256);
     }
 
+    if (policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER) {
+        g_strlcat(policy_name, "no_immediate_trigger,", 256);
+    }
+
     g_test_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -638,7 +686,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_CONTINUOUS_TRIGGER;
+    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_TRIGGER;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.3

