Received: by 10.25.87.130 with SMTP id l124csp312878lfb;
        Wed, 7 Sep 2016 06:33:41 -0700 (PDT)
X-Received: by 10.237.43.71 with SMTP id p65mr52354039qtd.116.1473255221127;
        Wed, 07 Sep 2016 06:33:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7si14752830qte.47.2016.09.07.06.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:33:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcyy-0003Pq-DS
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:33:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcpD-0001jp-AK
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcpC-0005n9-2N
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:35 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcp5-0005iI-3o; Wed, 07 Sep 2016 09:23:27 -0400
Received: by mail-lf0-x243.google.com with SMTP id s64so834419lfs.2;
	Wed, 07 Sep 2016 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=An9vjf0aAO5RZQKS4vtNK5mkmqMsB2vyrpotWCROync=;
	b=Y0YIROo+YFERbl1FhQCt+xSYIcO3lhqG/7zcsdsHcB0uLy+A2fOizODSjtMYpifIMY
	1CnyK11HtfgADVHZBQaDIFTm4mAqq4JRu+Jy1j58sqic2nu1Pd8h6cTWTtSleB/aXWag
	bUQHOK7X8qYqk6f5p2RB236uOotYgU2Dq11EKoTSdEMLG1HrcrN2nLCnw3fJ50moj4ot
	h3uKSePB0DZExo4DyPp1tC3+HzdA5oTvlvXG+7Kj3OuibaW1apKrxPTPhZUXuqHTaDN4
	MwbQhYlAsDyzIF2mD0HP/3WJoDjoMQJUDMWwla09g91/bQnFPK77GQrJTg8ryZ5EtOSY
	uGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=An9vjf0aAO5RZQKS4vtNK5mkmqMsB2vyrpotWCROync=;
	b=lQRfYHVXTULwLfTupZnY89XFT5M0cG8oAm7Vk3DbsyGLOTR7xeZFL/Yu5E4KjUSZ+x
	imsUrZk+e3Rmdp9SYQiVMFT0eM5HwVctHPWfmPyAhx92+HaFgqEdK8gp8IAepRoBrekj
	bezPa9RzMX/OON2++ZpdRQmEGrJxlORlCZajvqK3uJ3le4VqKRXgDF0SpKO5rlFXIwIO
	hVfQi+TccKkEja1AXSsGrPkShwQWkRR1GKKI25kHCkUUWo4uwHDGK6vZ107EOEofNRuS
	iLtyPAgBSl+Qe4/yLTi72Krm1NcedUNRr5+KhWTn/qA5g+v4Q1bfIgfDd5FBCBP26gLA
	JOnQ==
X-Gm-Message-State: AE9vXwOf9UDvqyT6qskff6mG5oPMFaHT/ifusFvoBWgx98kZXFAeEeI0J2IDz65ITA+Jcw==
X-Received: by 10.46.9.195 with SMTP id 186mr580372ljj.4.1473254606304;
	Wed, 07 Sep 2016 06:23:26 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:25 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:23 +0300
Message-Id: <4dc3ffac62a3199fcdc45ad1d2ebec859e9ab634.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-arm] [PATCH v16 12/16] tests: ptimer: Add tests for "no
 immediate reload" policy
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
X-TUID: s+crbrzj99ZA

PTIMER_POLICY_NO_IMMEDIATE_RELOAD makes ptimer to not to re-load
counter on setting counter value to "0" or starting to run with "0".

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 3e44b8d..bb49670 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -190,6 +190,8 @@ static void check_periodic(gconstpointer arg)
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
+    bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
+    bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
 
     triggered = false;
 
@@ -245,7 +247,7 @@ static void check_periodic(gconstpointer arg)
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 0);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_immediate_reload ? 0 : 10);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -257,7 +259,14 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 12 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
+    if (no_immediate_reload && (!continuous_trigger && !no_immediate_trigger)) {
+        g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+        g_assert_false(triggered);
+        return;
+    }
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    7 + (wrap_policy ? 1 : 0) + (no_immediate_reload ? 1 : 0));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -266,7 +275,8 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 12 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    7 + (wrap_policy ? 1 : 0) + (no_immediate_reload ? 1 : 0));
     g_assert_false(triggered);
 
     ptimer_run(ptimer, 0);
@@ -274,7 +284,8 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    7 + (wrap_policy ? 1 : 0) + (no_immediate_reload ? 1 : 0));
     g_assert_false(triggered);
 }
 
@@ -404,13 +415,15 @@ static void check_run_with_delta_0(gconstpointer arg)
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
+    bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
+    bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
 
     triggered = false;
 
     ptimer_set_period(ptimer, 2000000);
     ptimer_set_limit(ptimer, 99, 0);
     ptimer_run(ptimer, 1);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_immediate_reload ? 0 : 99);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -420,6 +433,11 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     triggered = false;
 
+    if (no_immediate_reload) {
+        ptimer_set_count(ptimer, 99);
+        ptimer_run(ptimer, 1);
+    }
+
     qemu_clock_step(2000000 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
@@ -439,7 +457,7 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     ptimer_set_count(ptimer, 0);
     ptimer_run(ptimer, 0);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_immediate_reload ? 0 : 99);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -449,6 +467,21 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     triggered = false;
 
+    if (no_immediate_reload) {
+        qemu_clock_step(2000000 + 100000);
+
+        if (continuous_trigger || no_immediate_trigger) {
+            g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
+            g_assert_true(triggered);
+
+            triggered = false;
+        } else {
+            g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+            g_assert_false(triggered);
+            return;
+        }
+    }
+
     qemu_clock_step(2000000 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
@@ -566,6 +599,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "no_immediate_trigger,", 256);
     }
 
+    if (policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD) {
+        g_strlcat(policy_name, "no_immediate_reload,", 256);
+    }
+
     qtest_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -613,7 +650,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_TRIGGER;
+    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_RELOAD;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.3

