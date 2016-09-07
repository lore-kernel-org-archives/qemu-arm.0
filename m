Received: by 10.25.87.130 with SMTP id l124csp312196lfb;
        Wed, 7 Sep 2016 06:32:22 -0700 (PDT)
X-Received: by 10.55.26.75 with SMTP id a72mr35765598qka.242.1473255142579;
        Wed, 07 Sep 2016 06:32:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q133si14884485qke.327.2016.09.07.06.32.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:32:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcxh-00020u-Pl
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:32:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp5-0001bL-Le
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp4-0005i8-KP
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:27 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcp1-0005fv-PR; Wed, 07 Sep 2016 09:23:23 -0400
Received: by mail-lf0-x244.google.com with SMTP id j41so826302lfi.3;
	Wed, 07 Sep 2016 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ovcjMDLPMNEykZvKTZD5IRym6t/qM8GLfHmouWzA8L0=;
	b=jmnayoumSmBMOTXjYO40Sr4/6Lg3asKMT9eWb0ZImnW9zqYZaBBT2ZGIhX1hRmErc3
	beZyyi5m9YeijEtzhmddfR7bAoUGt1OrbOxAklyqScWgI28zhmlLyNx8XpYpG0vFwfWj
	UrmIa/RhvzWqjAE1ZAPzBjJBmBhUOCWLUAn3AaaNXze1viuS3gtyuovY1r7VRYk2gJAU
	a4VXzToAIc+JzqFkcBpX5GfyEGHMTLt/9ovpe7APDjHi0RWecUHh7t0zn5DFMoMhaCj+
	KnuWnw7i7+qdDIzIGTX+lxg7kC6PX568/arEK5CQHg/1Bh8DfxAQV1xEjd6zYeJ8SL9c
	m6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=ovcjMDLPMNEykZvKTZD5IRym6t/qM8GLfHmouWzA8L0=;
	b=frPPsRmsUPIN13x3YiVLbfTPjPcP2CWMf8cmllZRpS2QRBhJ2ZvTxQiZsy7NLIetH4
	vPUaPDwWDeBf9y6ocWWLYM27fc6DXX/SW94/KBJb++Z6oNgWFM4jmJm6P8l488UMDJQc
	XxafvXUt6glG5UzmNvye913Tp/fDdXEBzGj9mvl+Ev+N6ke/KOgpbLSEuJKO+CNPQpKf
	gvWVvkbsHhUKtEeBqT+ETC78H+lCJ0i4tDBqAx4tJx7tmekni8zlmeMO/ZJeMM8DGI1I
	zJU7oNpRgMt+n6FPPYVblcpnumgK2IRCpbInLUUQzaLLqsAnuX9knA/XGDYwPs2SiYuL
	+KFQ==
X-Gm-Message-State: AE9vXwPsbuQefGY0JmZBlgHejVRpS3O547/KPcBG3mc8hbFohqL0bRVjneMY6DjX0trBFw==
X-Received: by 10.25.18.20 with SMTP id h20mr22176lfi.148.1473254602931;
	Wed, 07 Sep 2016 06:23:22 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:19 +0300
Message-Id: <27fd4f883dc108eb383f849d15563c37b6448373.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH v16 08/16] tests: ptimer: Add tests for
 "continuous trigger" policy
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
X-TUID: J0C3XCU8hNfJ

PTIMER_POLICY_CONTINUOUS_TRIGGER makes periodic ptimer to re-trigger every
period in case of load = delta = 0.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/hw/ptimer.h |  4 ++--
 tests/ptimer-test.c | 14 ++++++++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 4c9c700..e2f4c55 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -38,8 +38,8 @@
  * around.  */
 #define PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD (1 << 0)
 
-/* Periodic timer that has load = 0 would continuously re-trigger every
- * period.  */
+/* Running periodic timer that has counter = limit = 0 would continuously
+ * re-trigger every period.  */
 #define PTIMER_POLICY_CONTINUOUS_TRIGGER    (1 << 1)
 
 /* ptimer.c */
diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 5b0d75b..30a2ae1 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -450,6 +450,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
 
     triggered = false;
 
@@ -464,7 +465,12 @@ static void check_periodic_with_load_0(gconstpointer arg)
     qemu_clock_step(2000000 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
-    g_assert_false(triggered);
+
+    if (continuous_trigger) {
+        g_assert_true(triggered);
+    } else {
+        g_assert_false(triggered);
+    }
 
     ptimer_stop(ptimer);
 }
@@ -512,6 +518,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "wrap_after_one_period,", 256);
     }
 
+    if (policy & PTIMER_POLICY_CONTINUOUS_TRIGGER) {
+        g_strlcat(policy_name, "continuous_trigger,", 256);
+    }
+
     qtest_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -559,7 +569,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD;
+    int last_policy = PTIMER_POLICY_CONTINUOUS_TRIGGER;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.3

