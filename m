Received: by 10.25.21.156 with SMTP id 28csp439769lfv;
        Thu, 21 Jul 2016 07:44:48 -0700 (PDT)
X-Received: by 10.200.36.83 with SMTP id d19mr40931516qtd.94.1469112288309;
        Thu, 21 Jul 2016 07:44:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m51si5220845qtb.13.2016.07.21.07.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQFDT-0004xH-Id
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:44:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1b-00033i-Mw
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1a-0003lk-09
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:31 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1Z-0003l5-K3; Thu, 21 Jul 2016 10:32:29 -0400
Received: by mail-lf0-x242.google.com with SMTP id f93so5656876lfi.0;
	Thu, 21 Jul 2016 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HcfAL6Bq38mL6xZ7Kn3+cqOCTWGivjpNpt+pJM51o1Y=;
	b=M+oYOP9nOSIDQ16nCtu3eVpcnifxkdjSbDryNglBiBqNw0xwVgIgHYPkl/lI9999Sa
	cRc2OA/WC7xnR+OwxP6zC3MaLOYs9tj5CFyRx+oOQNTQCJCOJBnyFOy++47IGKohziqc
	8kn3Sk/tYLvLTx1ozjzZkVp3CYEhvxK4ZbmBSUxLL8rS5E3dKQUjEKJSU74p21F8jkdM
	ZnaHBPwDZja461bsuEhW5KmitBYyS9Nvy1QiD1dadS0BilYcUJMFWi0aCQ+Ig1F9l++1
	4E94PbaWjIf4uGoQEHhN47tFBNFAd98gPNTh09kAirBXBsI4pH/KECo4XlmrpmUaluBe
	tPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HcfAL6Bq38mL6xZ7Kn3+cqOCTWGivjpNpt+pJM51o1Y=;
	b=ZyHCkYUc06BcrTLQdk5/nL4nAbrwao2gDVslip75Mr2XcW606io1XMJPgoz1uG5Hd/
	OmmpKERzOwyEHtl5fZDWC63DR4RorIGkIcqLOHqumYvtsHBxOUevnrUYKmsdbOTsDTb+
	kUnpNstGtD0x1E/ek8mb6U+SIKDXXgdw6j479CKxLPVI5TX08ctAuurw0fnoxpNm0o7i
	T5Ya0T6DFXvPgANHqgofgiGW6VsFBCoisI3hUO+TXpwi0hg07hITnKEcelIBymn13qWi
	kSRgBB+PJ7NnPKkds+q1HIqyZX5fZvG/DOrRR8QDbAiumEaaIvBxNtqA2EY2HK06u6PD
	wrvw==
X-Gm-Message-State: ALyK8tLfNZMGzBmUjEzBwWPBio+7lpCTNtjH0+mleCbFgEwzy+21jVGOrNnTTmWURqJuiQ==
X-Received: by 10.25.154.19 with SMTP id c19mr15270121lfe.188.1469111548824;
	Thu, 21 Jul 2016 07:32:28 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:28 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:20 +0300
Message-Id: <638cddbcb65b0e5e4bcedacbd991cba12779fafc.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v15 09/15] tests: ptimer: Add tests for
 "continuous trigger" policy
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
X-TUID: YozjgCQTKyb9

PTIMER_POLICY_CONTINUOUS_TRIGGER makes periodic ptimer to re-trigger every
period in case of load = delta = 0.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 981414d..cdf8d28 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -437,6 +437,58 @@ static void check_run_with_delta_0(gconstpointer arg)
     ptimer_stop(ptimer);
 }
 
+static void check_periodic_with_load_0(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
+
+    triggered = false;
+
+    ptimer_set_period(ptimer, 2000000);
+    ptimer_run(ptimer, 0);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+
+    if (continuous_trigger) {
+        g_assert_true(triggered);
+    } else {
+        g_assert_false(triggered);
+    }
+
+    ptimer_stop(ptimer);
+}
+
+static void check_oneshot_with_load_0(gconstpointer arg)
+{
+    const uint8_t *policy = arg;
+    QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
+    ptimer_state *ptimer = ptimer_init(bh, *policy);
+
+    triggered = false;
+
+    ptimer_set_period(ptimer, 2000000);
+    ptimer_run(ptimer, 1);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000 + 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_false(triggered);
+}
+
 static void add_ptimer_tests(uint8_t policy)
 {
     uint8_t *ppolicy = g_malloc(1);
@@ -452,6 +504,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "wrap_after_one_period,", 256);
     }
 
+    if (policy & PTIMER_POLICY_CONTINUOUS_TRIGGER) {
+        g_strlcat(policy_name, "continuous_trigger,", 256);
+    }
+
     qtest_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -487,11 +543,19 @@ static void add_ptimer_tests(uint8_t policy)
     qtest_add_data_func(
         g_strdup_printf("/ptimer/run_with_delta_0 policy=%s", policy_name),
         ppolicy, check_run_with_delta_0);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/periodic_with_load_0 policy=%s", policy_name),
+        ppolicy, check_periodic_with_load_0);
+
+    qtest_add_data_func(
+        g_strdup_printf("/ptimer/oneshot_with_load_0 policy=%s", policy_name),
+        ppolicy, check_oneshot_with_load_0);
 }
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD;
+    int last_policy = PTIMER_POLICY_CONTINUOUS_TRIGGER;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.2

