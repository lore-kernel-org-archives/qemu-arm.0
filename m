Received: by 10.25.21.156 with SMTP id 28csp441007lfv;
        Thu, 21 Jul 2016 07:47:30 -0700 (PDT)
X-Received: by 10.200.38.107 with SMTP id v40mr29031227qtv.76.1469112450073;
        Thu, 21 Jul 2016 07:47:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v143si5204331qka.149.2016.07.21.07.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQFG5-0007c0-DE
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:47:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1k-0003DY-SZ
	for qemu-arm@nongnu.org; Thu, 21 Jul 2016 10:32:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1j-0003tr-Ex
	for qemu-arm@nongnu.org; Thu, 21 Jul 2016 10:32:40 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33560)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1b-0003ml-DW; Thu, 21 Jul 2016 10:32:31 -0400
Received: by mail-lf0-x243.google.com with SMTP id f93so5656942lfi.0;
	Thu, 21 Jul 2016 07:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=t+B/xN2sCmL2tPWbXe/WjMP5LwXYfrQnRgj5kfbBqls=;
	b=IEdMfGWlzZoDtyzM9aLlyRIdVYwIpQyXB9HSkZsrL2cBs486WPQ6vE9YRr3+o/ZuD9
	SFxEIELDjP2fTwUt9ElsQp4uE5eR9QF28v7kE57ZVBHWpsNa9izGqCGgXHt8+n5SYdoD
	ku9ImX6KBCOIL8D85ZUMbCbLGsD+3n+Vwo+ZYzkPdth27LN8R+9gMKiIIKpagHtYKgJH
	tZrPDTlGMYWSqQkXT8o6+IM0a4Igp44C8sDOrhH9OUqGqCfRNYytDrT83Q+rQQMz2ibN
	L4WxDsVWUsEOFs6VpSco6avEbCo2IFJlxXIjOpBRzS7DEPcxdFtXvMzHsNhdEYXslmsV
	pWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=t+B/xN2sCmL2tPWbXe/WjMP5LwXYfrQnRgj5kfbBqls=;
	b=RqzYOQUrN1rgPsE+cQVos/qE0j00hVqPHOACZGfOT3Q/y1D5wdPNZcB0HCq5xTFkm2
	q0Zfrrovizjmd9VOcRlRYXFK+I1oy+bLlX3H7RkD8bz+40tgRZYHKvJWdyxSBpoamh62
	8gPl7aomHP+ZHq6++d7Y9l19ZzRauUh8Ea9IcnhpFRz9FVztPoBfyhUD8SYGbe1yfbmY
	Ud6vG7V21ovzDAXpXSWvfysHg7WX55UOktvHjxgM2eeTV5227lWYpJzXagvTV10SOZHl
	3SbZojqxLXuwuzmZSK7FC0zFaYV1w1la2eqNXREEAegtq8qyRla+dGjgKPxo+mQFOqd+
	fpgw==
X-Gm-Message-State: ALyK8tKtdrb10Hwy478n9e2GkkoA2NQ1XUq+wpPxqo/V01OwOLWoiFLzWMB7Ih5cZVEbmQ==
X-Received: by 10.46.1.163 with SMTP id f35mr13809907lji.52.1469111550548;
	Thu, 21 Jul 2016 07:32:30 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:30 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:22 +0300
Message-Id: <a775969cf11061a7581cdf5684d5d4232597f31d.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-arm] [PATCH v15 11/15] tests: ptimer: Add tests for "no
 immediate trigger" policy
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
X-TUID: hdZjLBYPbnyE

PTIMER_POLICY_NO_IMMEDIATE_TRIGGER makes ptimer to not to trigger on starting
to run with / setting counter to "0".

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index cdf8d28..ba9ae39 100644
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
 
@@ -389,6 +395,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -396,7 +403,12 @@ static void check_run_with_delta_0(gconstpointer arg)
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
 
@@ -420,7 +432,12 @@ static void check_run_with_delta_0(gconstpointer arg)
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
 
@@ -443,6 +460,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
     bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -450,7 +468,12 @@ static void check_periodic_with_load_0(gconstpointer arg)
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
 
@@ -458,7 +481,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
 
-    if (continuous_trigger) {
+    if (continuous_trigger || no_immediate_trigger) {
         g_assert_true(triggered);
     } else {
         g_assert_false(triggered);
@@ -472,6 +495,7 @@ static void check_oneshot_with_load_0(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
 
     triggered = false;
 
@@ -479,13 +503,29 @@ static void check_oneshot_with_load_0(gconstpointer arg)
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
 }
 
@@ -508,6 +548,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "continuous_trigger,", 256);
     }
 
+    if (policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER) {
+        g_strlcat(policy_name, "no_immediate_trigger,", 256);
+    }
+
     qtest_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -555,7 +599,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_CONTINUOUS_TRIGGER;
+    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_TRIGGER;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.2

