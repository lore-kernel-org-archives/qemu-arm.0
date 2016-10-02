Received: by 10.80.163.71 with SMTP id 65csp1169839edn;
        Sun, 2 Oct 2016 09:04:24 -0700 (PDT)
X-Received: by 10.200.37.73 with SMTP id 9mr15743455qtn.44.1475424264249;
        Sun, 02 Oct 2016 09:04:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d28si2627021qte.67.2016.10.02.09.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjFX-00052C-Js
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:04:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjBu-0002XV-3J
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjBr-0003Cm-5x
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:37 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjBq-0003CX-Mq; Sun, 02 Oct 2016 12:00:35 -0400
Received: by mail-lf0-x243.google.com with SMTP id b75so429284lfg.3;
	Sun, 02 Oct 2016 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Fhrbbe3iaRTDfAMDC0a1rmZIfe1OU5NHOk31+4HOK+s=;
	b=DloO5Q9j7CjuiXwQ7n3fAxC8c6e9P5BG5E/e3MFtRH4MPYFrPOl2m6MYLmLxEqknQp
	k2iLdX6TczhD0XhnIVfXwEBMsvFYEmi0k8a+LwORk9KrJ0qTbkS8FIXMnWpcnYC/Xhng
	VJ8BEDypBGg8fJ2PBtSCZ6Ot3dvSmaiqAlfpZZFAWUDWVSMakeg1yNvVh02gv4R2lPXS
	Kk9I30G6obiZ2TSzZ4Ybdv+mDh4tT3NwWATLGwpQWvsuiZEh2HYmk99il9k4r/h66MY/
	e+1rttZhe/r+okNJaB5Gygc5jxXPzpJnJ2ywKyDscbn0A8JMcRl1sGcLOY2BAsSBY8eM
	l1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Fhrbbe3iaRTDfAMDC0a1rmZIfe1OU5NHOk31+4HOK+s=;
	b=J4i3B0Z1HKzjAjDC+PH4deAre8rnZEuPbJ2086RZ5j+QhkAZhxNZpLdCWxsqgXkWL8
	H5WY7H2ZzV7Y6Dap5wOz562Z/M+BXNNfS5n7X+Qj5bF66xGThTuI8Vj9aLEQNUZzAx1Y
	2jfqbxThiP1MjAULEShh4yJJ4QkGeutrqXXGyt0m95DDS0HYGSPut5Il4gyqA8mKqWAE
	e/qwPKYPfekFh6qaq88gBDgjjy74ZkbAT1sfUxDkokAmCj/S/1ZOKJfLzRrHaNbRwDxS
	knP8OLbbbmQJ4ai8vop12Oq6S/+f6TL6Ta7SE3dpP5PpHM/zZM86ZPBOUjnGZL/Zt33X
	XvcQ==
X-Gm-Message-State: AA6/9RmIWKaZF4vO8bTpPv5JelKTPn4PE8UE4qKrvRDizMZVnQagvyJwLFS1vbGnN/ejfg==
X-Received: by 10.25.38.146 with SMTP id m140mr7295952lfm.110.1475424018307;
	Sun, 02 Oct 2016 09:00:18 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:17 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:44 +0300
Message-Id: <63256eaac54c84dac7c797f41296cc49e751d09d.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v17 12/14] tests: ptimer: Replace 10000 with 1
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
X-TUID: OvbVdg1LaIiZ

The 10000 is an arbitrarily chosen value used for advancing the QEMU
time, so that ptimer's now != last. Change it to 1 to make code a bit
more readable.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 56 ++++++++++++++++++++++++++---------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 47fccd3..b36a476 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -107,7 +107,7 @@ static void check_oneshot(gconstpointer arg)
     ptimer_set_count(ptimer, 10);
     ptimer_run(ptimer, 1);
 
-    qemu_clock_step(2000000 * 2 + 100000);
+    qemu_clock_step(2000000 * 2 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 8 : 7);
     g_assert_false(triggered);
@@ -124,7 +124,7 @@ static void check_oneshot(gconstpointer arg)
 
     ptimer_run(ptimer, 1);
 
-    qemu_clock_step(2000000 * 7 + 100000);
+    qemu_clock_step(2000000 * 7 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
 
@@ -155,28 +155,28 @@ static void check_oneshot(gconstpointer arg)
 
     ptimer_set_count(ptimer, 10);
 
-    qemu_clock_step(20000000 + 100000);
+    qemu_clock_step(20000000 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
     g_assert_false(triggered);
 
     ptimer_set_limit(ptimer, 9, 1);
 
-    qemu_clock_step(20000000 + 100000);
+    qemu_clock_step(20000000 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
     g_assert_false(triggered);
 
     ptimer_run(ptimer, 1);
 
-    qemu_clock_step(2000000 + 100000);
+    qemu_clock_step(2000000 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 8 : 7);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 20);
 
-    qemu_clock_step(2000000 * 19 + 100000);
+    qemu_clock_step(2000000 * 19 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
     g_assert_false(triggered);
@@ -190,7 +190,7 @@ static void check_oneshot(gconstpointer arg)
 
     triggered = false;
 
-    qemu_clock_step(2000000 * 12 + 100000);
+    qemu_clock_step(2000000 * 12 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
     g_assert_false(triggered);
@@ -215,17 +215,17 @@ static void check_periodic(gconstpointer arg)
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
     g_assert_false(triggered);
 
-    qemu_clock_step(100000);
+    qemu_clock_step(1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 10 : 9);
     g_assert_false(triggered);
 
-    qemu_clock_step(2000000 * 10 - 100000);
+    qemu_clock_step(2000000 * 10 - 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 10);
     g_assert_true(triggered);
 
-    qemu_clock_step(100000);
+    qemu_clock_step(1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==,
                      wrap_policy ? 0 : (no_round_down ? 10 : 9));
@@ -244,12 +244,12 @@ static void check_periodic(gconstpointer arg)
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 20);
     g_assert_false(triggered);
 
-    qemu_clock_step(100000);
+    qemu_clock_step(1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 20 : 19);
     g_assert_false(triggered);
 
-    qemu_clock_step(2000000 * 11 + 100000);
+    qemu_clock_step(2000000 * 11 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 9 : 8);
     g_assert_false(triggered);
@@ -267,7 +267,7 @@ static void check_periodic(gconstpointer arg)
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
     g_assert_false(triggered);
 
-    qemu_clock_step(100000);
+    qemu_clock_step(1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 3 : 2);
     g_assert_false(triggered);
@@ -290,7 +290,7 @@ static void check_periodic(gconstpointer arg)
     ptimer_set_count(ptimer, 3);
     ptimer_run(ptimer, 0);
 
-    qemu_clock_step(2000000 * 3 + 100000);
+    qemu_clock_step(2000000 * 3 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==,
                      wrap_policy ? 0 : (no_round_down ? 10 : 9));
@@ -316,7 +316,7 @@ static void check_periodic(gconstpointer arg)
 
     triggered = false;
 
-    qemu_clock_step(100000);
+    qemu_clock_step(1);
 
     if (no_immediate_reload) {
         g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
@@ -355,7 +355,7 @@ static void check_periodic(gconstpointer arg)
     ptimer_run(ptimer, 0);
     ptimer_set_period(ptimer, 0);
 
-    qemu_clock_step(2000000 + 100000);
+    qemu_clock_step(2000000 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==,
                     (no_round_down ? 8 : 7) + (wrap_policy ? 1 : 0));
@@ -376,7 +376,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
     ptimer_set_limit(ptimer, 10, 1);
     ptimer_run(ptimer, 1);
 
-    qemu_clock_step(2000000 * 9 + 100000);
+    qemu_clock_step(2000000 * 9 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 1 : 0);
     g_assert_false(triggered);
@@ -421,7 +421,7 @@ static void check_on_the_fly_period_change(gconstpointer arg)
     ptimer_set_limit(ptimer, 8, 1);
     ptimer_run(ptimer, 1);
 
-    qemu_clock_step(2000000 * 4 + 100000);
+    qemu_clock_step(2000000 * 4 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 4 : 3);
     g_assert_false(triggered);
@@ -429,7 +429,7 @@ static void check_on_the_fly_period_change(gconstpointer arg)
     ptimer_set_period(ptimer, 4000000);
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 4 : 3);
 
-    qemu_clock_step(4000000 * 2 + 100000);
+    qemu_clock_step(4000000 * 2 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 2 : 0);
     g_assert_false(triggered);
@@ -453,7 +453,7 @@ static void check_on_the_fly_freq_change(gconstpointer arg)
     ptimer_set_limit(ptimer, 8, 1);
     ptimer_run(ptimer, 1);
 
-    qemu_clock_step(2000000 * 4 + 100000);
+    qemu_clock_step(2000000 * 4 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 4 : 3);
     g_assert_false(triggered);
@@ -461,7 +461,7 @@ static void check_on_the_fly_freq_change(gconstpointer arg)
     ptimer_set_freq(ptimer, 250);
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 4 : 3);
 
-    qemu_clock_step(2000000 * 4 + 100000);
+    qemu_clock_step(2000000 * 4 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 2 : 0);
     g_assert_false(triggered);
@@ -516,7 +516,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     triggered = false;
 
     if (no_immediate_trigger || no_immediate_reload) {
-        qemu_clock_step(2000000 + 100000);
+        qemu_clock_step(2000000 + 1);
 
         g_assert_cmpuint(ptimer_get_count(ptimer), ==,
                          no_immediate_reload ? 0 : (no_round_down ? 98 : 97));
@@ -533,7 +533,7 @@ static void check_run_with_delta_0(gconstpointer arg)
         ptimer_run(ptimer, 1);
     }
 
-    qemu_clock_step(2000000 + 100000);
+    qemu_clock_step(2000000 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, no_round_down ? 98 : 97);
     g_assert_false(triggered);
@@ -563,7 +563,7 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     triggered = false;
 
-    qemu_clock_step(100000);
+    qemu_clock_step(1);
 
     if (no_immediate_reload) {
         qemu_clock_step(2000000);
@@ -616,7 +616,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
 
     triggered = false;
 
-    qemu_clock_step(2000000 + 100000);
+    qemu_clock_step(2000000 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
 
@@ -631,14 +631,14 @@ static void check_periodic_with_load_0(gconstpointer arg)
     ptimer_set_count(ptimer, 10);
     ptimer_run(ptimer, 0);
 
-    qemu_clock_step(2000000 * 10 + 100000);
+    qemu_clock_step(2000000 * 10 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
     g_assert_true(triggered);
 
     triggered = false;
 
-    qemu_clock_step(2000000 + 100000);
+    qemu_clock_step(2000000 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
 
@@ -673,7 +673,7 @@ static void check_oneshot_with_load_0(gconstpointer arg)
 
     triggered = false;
 
-    qemu_clock_step(2000000 + 100000);
+    qemu_clock_step(2000000 + 1);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
 
-- 
2.9.3

