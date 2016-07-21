Received: by 10.25.21.156 with SMTP id 28csp439727lfv;
        Thu, 21 Jul 2016 07:44:43 -0700 (PDT)
X-Received: by 10.37.196.65 with SMTP id u62mr32259783ybf.175.1469112283665;
        Thu, 21 Jul 2016 07:44:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m190si5179801qkf.253.2016.07.21.07.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQFDO-0004sf-Uq
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:44:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1f-00036u-SC
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1d-0003ob-OB
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:34 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1d-0003oG-BW; Thu, 21 Jul 2016 10:32:33 -0400
Received: by mail-lf0-x244.google.com with SMTP id 33so5660932lfw.3;
	Thu, 21 Jul 2016 07:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=37bT2+MHBo1yOi0WaoILpBxzhBoFBiP6h634wRJEyg8=;
	b=ilVEUwb3i3uJVUNuhbvNafbrcD5ufXM4cNRDoy/cNA25C7IE164kVaPEr9HdSl+XAl
	ca+0ZnRvUUJTXdWUSCQXcYqlKlM28y9896TnXKIDJriX1DzzQL7sa9I5mx2vSNs9L00h
	NEcOpDfc4cK2OHAb8ka93bz/DFoSI1Co+ISf22NuyKYojd4yWN96G7Me4SCzYOxnLcBk
	REG6SMqpMi4DS6R6nMRD9JRJb5CgopUblkVoe8wNI99bOJ2XhYEir210JTbN6AYYv1mW
	7LpEHLdj1Gi2INPpoN+/YpPPC6COI6rhemcIuxY/WD/T4lJDMYeOQ+ivsN1AKl3sDLsW
	+3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=37bT2+MHBo1yOi0WaoILpBxzhBoFBiP6h634wRJEyg8=;
	b=VC3zuamkIaVlU0/m27rUXyIR1FhLTjwZuT8h+hE/7t124oaELXqOKJzlzisf6FbHAV
	eubqyAufE55//oUfttVAXkSA8F38H2EItp8pde8dd4pY65YKIQaF5vymbwvEJQqIuUk2
	PpfLuoYG+P8RavUeom3HjcgQpNO8L//6SK1HQpm6Hs5wzmfJMi3qQPWIhHR20rn0WBdZ
	T5yKazD73cigPsH6JaHZjrlquQvPqztS8Mo1fJj4wUlM7cKq3mEsRk9lNuCLjoG+wx8h
	b73RheshFZrt2boWpfKRnr+fPnQFvq1rvF0Lxht8WSSjQtbWX1jG3/eyGGP/DoU2pFUI
	eW6Q==
X-Gm-Message-State: ALyK8tIGsHzvwAr7EJzy7g5v376efVs6zH4PzTTW1oLgIHYFemH9hIXXYdR1ClPZ23l/3Q==
X-Received: by 10.46.5.9 with SMTP id 9mr20540426ljf.17.1469111552547;
	Thu, 21 Jul 2016 07:32:32 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:32 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:24 +0300
Message-Id: <29c20fb7ac048028d8fb05c51f45cdb4838b685b.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-devel] [PATCH v15 13/15] tests: ptimer: Add tests for "no
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
X-TUID: F533lhXl0k/G

PTIMER_POLICY_NO_IMMEDIATE_RELOAD makes ptimer to not to re-load
counter on setting counter value to "0" or starting to run with "0".

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 48 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index ba9ae39..c99f923 100644
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
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    if (no_immediate_reload && (!continuous_trigger && !no_immediate_trigger)) {
+        g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+        g_assert_false(triggered);
+        return;
+    }
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    8 + (wrap_policy ? 1 : 0) + (no_immediate_reload ? 1 : 0));
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -266,7 +275,8 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 12 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==,
+                    8 + (wrap_policy ? 1 : 0) + (no_immediate_reload ? 1 : 0));
     g_assert_false(triggered);
 }
 
@@ -396,13 +406,15 @@ static void check_run_with_delta_0(gconstpointer arg)
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
@@ -412,6 +424,11 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     triggered = false;
 
+    if (no_immediate_reload) {
+        ptimer_set_count(ptimer, 99);
+        ptimer_run(ptimer, 1);
+    }
+
     qemu_clock_step(2000000 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
@@ -431,7 +448,7 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     ptimer_set_count(ptimer, 0);
     ptimer_run(ptimer, 0);
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_immediate_reload ? 0 : 99);
 
     if (no_immediate_trigger) {
         g_assert_false(triggered);
@@ -441,6 +458,21 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     triggered = false;
 
+    if (no_immediate_reload) {
+        qemu_clock_step(2000000 + 100000);
+
+        if (continuous_trigger || no_immediate_trigger) {
+            g_assert_cmpuint(ptimer_get_count(ptimer), ==, 99);
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
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
@@ -552,6 +584,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "no_immediate_trigger,", 256);
     }
 
+    if (policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD) {
+        g_strlcat(policy_name, "no_immediate_reload,", 256);
+    }
+
     qtest_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -599,7 +635,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_TRIGGER;
+    int last_policy = PTIMER_POLICY_NO_IMMEDIATE_RELOAD;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.2

