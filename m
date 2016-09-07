Received: by 10.25.87.130 with SMTP id l124csp316604lfb;
        Wed, 7 Sep 2016 06:42:16 -0700 (PDT)
X-Received: by 10.55.7.130 with SMTP id 124mr55786866qkh.228.1473255735973;
        Wed, 07 Sep 2016 06:42:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a46si16408688qtb.131.2016.09.07.06.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhd7H-0002oF-6n
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:42:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp5-0001at-60
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp3-0005hX-PI
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:27 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcp3-0005h7-Ch; Wed, 07 Sep 2016 09:23:25 -0400
Received: by mail-lf0-x241.google.com with SMTP id 29so830719lfv.1;
	Wed, 07 Sep 2016 06:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QkKMecv1xG36fm5MfUG+RFjHmRs02eNDCV0zZRhIfDE=;
	b=0XlVL7u7eIBkF52CraFIBf8Rc7oXqa6NopH0wHfh32TblJX/eCLdxfcFxTZNMwpJ/V
	40p/4r+viu/sfV3CugdAdh6fMYf84uYsoAky+eVnyxQ6M86Vh0/dvT/YnKfKwqguEXlS
	EC3pS8cPdb5Y4O2AC8HSwiuwxy4lo7m6OiYbdtryjGYRjnecOVt+TpQWq/QQXTle9DPL
	r/ElQIeVsbbItIFXWZ6WeWk6Kj1AosbdskgM+tD0Flp/C/uCwA9wdEMSpqj99MfO4CYQ
	aZmnEN6Uw7+UvB5OVw458MrQLq0KcqQ7R+k+rOAVhyxRrz+ltXTn3uN7w+gPuzDDwtKK
	Jh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=QkKMecv1xG36fm5MfUG+RFjHmRs02eNDCV0zZRhIfDE=;
	b=OXkj3niMWH2GHMfsvJAf0Nr3ReUgi7LiTD+F4QufUeYAQvvtvt27btdBJNsFeONFly
	RECvLn8ib331f1rKRDwX0REoIQqWxmDnj5CVfQ9ttO4t5kKady0On0aX9PmJaOlh6e/y
	ZKBq3w6UdCTReQk7eBLcap2kLgN+auqgLohYyggehYJiqfvOPL78p08S+R1UFds0X+VJ
	3fBwe7PVm3PFtHOYcEqQxUrS/CxZ1ku6JMCglzPHruhRmOPDlC4kS0bvFIZckaduGc7X
	AmDu9yly1d6HX+RTgBy48EYk8gGiBQGA3ncOltyNBikDdh/pMVoeclBspgkdjOqycfDJ
	4gXQ==
X-Gm-Message-State: AE9vXwNw9bpzrHVaNy1SzO0eJ/rNI+xisHZkTuVo/66A+AeNIpqER/8gBqndfbbkUTZlbw==
X-Received: by 10.46.33.8 with SMTP id h8mr13212322ljh.36.1473254604573;
	Wed, 07 Sep 2016 06:23:24 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:24 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:21 +0300
Message-Id: <5781e47a3ab7e58e8f0d676689d36ed0161cdaa5.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v16 10/16] tests: ptimer: Add tests for "no
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
X-TUID: q7bdY21CIfbq

PTIMER_POLICY_NO_IMMEDIATE_TRIGGER makes ptimer to not to trigger on starting
to run with / setting counter to "0".

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 30a2ae1..3e44b8d 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -189,6 +189,7 @@ static void check_periodic(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -245,7 +246,12 @@ static void check_periodic(gconstpointer arg)
 
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
 
@@ -397,6 +403,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -404,7 +411,12 @@ static void check_run_with_delta_0(gconstpointer arg)
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
 
@@ -428,7 +440,12 @@ static void check_run_with_delta_0(gconstpointer arg)
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
 
@@ -451,6 +468,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -458,7 +476,12 @@ static void check_periodic_with_load_0(gconstpointer arg)
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
 
@@ -466,7 +489,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
 
-    if (continuous_trigger) {
+    if (continuous_trigger || no_immediate_trigger) {
         g_assert_true(triggered);
     } else {
         g_assert_false(triggered);
@@ -480,6 +503,7 @@ static void check_oneshot_with_load_0(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -487,13 +511,29 @@ static void check_oneshot_with_load_0(gconstpointer arg)
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
+
+    if (no_immediate_trigger) {
+        g_assert_true(triggered);
+    } else {
+        g_assert_false(triggered);
+    }
+
+    triggered = false;
+
+    qemu_clock_step(2000000 + 100000);
+
     g_assert_false(triggered);
 
     triggered = false;
@@ -522,6 +562,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "continuous_trigger,", 256);
     }
 
+    if (policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER) {
+        g_strlcat(policy_name, "no_immediate_trigger,", 256);
+    }
+
     qtest_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -569,7 +613,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_CONTINUOUS_TRIGGER;
+    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_TRIGGER;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.3

