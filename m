Received: by 10.80.163.71 with SMTP id 65csp1174386edn;
        Sun, 2 Oct 2016 09:17:25 -0700 (PDT)
X-Received: by 10.55.43.80 with SMTP id r77mr15617002qkh.34.1475425045169;
        Sun, 02 Oct 2016 09:17:25 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q11si9060902qkq.33.2016.10.02.09.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjS8-0007NC-Hp
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:17:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC2-0002f8-8X
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjBz-0003HH-0P
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:46 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjBy-0003Ga-CV; Sun, 02 Oct 2016 12:00:42 -0400
Received: by mail-lf0-x244.google.com with SMTP id l131so7946126lfl.0;
	Sun, 02 Oct 2016 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=T4a/lHK6Aj/JHWaKNglwDY2PkE22jMkZWei2MqhP64o=;
	b=Hy+70CVgr0CZM9duoHXlR6544LnKEWFPrjGj+69Xq7fKjkJEa5cTCI7MEF39Ly3IlN
	YiNdeaBe2gxpNhnGJHPN4ToexO1ZrLfXvOyNuJhNeMe1DBo2Fxqq6z3tF4shGFOmWyEI
	tub5UJCg3BfizGI6g96OpaXC0dP0Rp101Cj7MpLjpHLcJJolLnK2w+t8xmy36poqUz9P
	Du+VSi3yikHgw644EdwC8cKgqcbSbciu/M9XUovmWzbmDSfMhY6ztAQkoc/ih3IIBtVw
	EepYLlvpNNOkdigsawMV4N4LmjzWx2XWjkHLjdTdlVz0AGvawBguDow8VNIP308jkX5Z
	6TPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=T4a/lHK6Aj/JHWaKNglwDY2PkE22jMkZWei2MqhP64o=;
	b=MLp+ZTU26I6r9miS75Izm5V3eKzee2znj1Gb/BwvAeMDudxAYBbOAkCgWFtmUW9BzJ
	sufM18TKcm8W+QaXBqfG0XZBoPC4xx28eM3VTcqwUILlHY0nOc3n84zMm5//AA2+ZQLP
	ddOLEfWiMi7JL4BVaeSfE/DgvnoDUeCiSHjy3zJoMyUQ/jQ1/Joal26TjRrMxxSiNeWQ
	SQABJd3L36ns3Ag4U6FgBewFPSUKDNuM65ihJHjNZByGNhqlHP/dzvJNovBqzYqjN4ec
	k0fKEU9N0XO7/aLUXjYgJwYSRuffVYzDA7x3rDaDDAUdsKPL8h2DyBIQUC/YXgy1jgeD
	DcDw==
X-Gm-Message-State: AA6/9RlP9pQ08JuuqSdzNROkEIR+D24DNlVq3O7E0zc2q5JszBxFn4CWGyvJehNe8rd0fQ==
X-Received: by 10.25.129.147 with SMTP id c141mr5297955lfd.59.1475424010418;
	Sun, 02 Oct 2016 09:00:10 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:10 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:34 +0300
Message-Id: <ce27bb84ed9f2b64300dd4e90f3eff235a7dcedf.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-devel] [PATCH v17 02/14] tests: ptimer: Add tests for
 "wraparound after one period" policy
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
X-TUID: QhvumunuxOiq

PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD changes ptimer behaviour in a such way,
that it would wrap around after one period instead of doing it immediately.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 127 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 104 insertions(+), 23 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 7b0ddf6..b95958f 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -188,6 +188,7 @@ static void check_periodic(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
 
     triggered = false;
 
@@ -195,20 +196,41 @@ static void check_periodic(gconstpointer arg)
     ptimer_set_limit(ptimer, 10, 1);
     ptimer_run(ptimer, 0);
 
-    qemu_clock_step(2000000 * 10 + 100000);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 10);
+    g_assert_false(triggered);
+
+    qemu_clock_step(100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 10 - 100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 10);
+    g_assert_true(triggered);
+
+    qemu_clock_step(100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 9);
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 20);
 
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 20);
+    g_assert_false(triggered);
+
+    qemu_clock_step(100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 19);
+    g_assert_false(triggered);
+
     qemu_clock_step(2000000 * 11 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
@@ -216,7 +238,24 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 10);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
+    g_assert_true(triggered);
+
+    triggered = false;
+
+    ptimer_set_count(ptimer, 3);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 3);
+    g_assert_false(triggered);
+
+    qemu_clock_step(100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 2);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 4);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -224,7 +263,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 3);
@@ -232,14 +271,14 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 * 3 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 9);
     g_assert_true(triggered);
 
     triggered = false;
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 8);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 9 : 8);
     g_assert_false(triggered);
 
     ptimer_set_count(ptimer, 0);
@@ -248,18 +287,23 @@ static void check_periodic(gconstpointer arg)
 
     triggered = false;
 
-    qemu_clock_step(2000000 * 12 + 100000);
+    qemu_clock_step(100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_false(triggered);
+
+    qemu_clock_step(2000000 * 12);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
 
     triggered = false;
 
-    qemu_clock_step(2000000 * 12 + 100000);
+    qemu_clock_step(2000000 * 10);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
     g_assert_false(triggered);
 
     ptimer_run(ptimer, 0);
@@ -267,7 +311,7 @@ static void check_periodic(gconstpointer arg)
 
     qemu_clock_step(2000000 + 100000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 7);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 8 : 7);
     g_assert_false(triggered);
 }
 
@@ -276,6 +320,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
 
     triggered = false;
 
@@ -285,6 +330,9 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     qemu_clock_step(2000000 * 9 + 100000);
 
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_false(triggered);
+
     ptimer_run(ptimer, 0);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
@@ -292,7 +340,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     qemu_clock_step(2000000);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 9);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 9);
     g_assert_true(triggered);
 
     triggered = false;
@@ -301,7 +349,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 
     ptimer_run(ptimer, 1);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 1 : 0);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 3);
@@ -394,6 +442,7 @@ static void check_run_with_delta_0(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
 
     triggered = false;
 
@@ -429,14 +478,21 @@ static void check_run_with_delta_0(gconstpointer arg)
 
     triggered = false;
 
-    qemu_clock_step(2000000 + 100000);
+    qemu_clock_step(100000);
+
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
+    g_assert_false(triggered);
+
+    triggered = false;
+
+    qemu_clock_step(2000000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 97);
     g_assert_false(triggered);
 
     qemu_clock_step(2000000 * 98);
 
-    g_assert_cmpuint(ptimer_get_count(ptimer), ==, 98);
+    g_assert_cmpuint(ptimer_get_count(ptimer), ==, wrap_policy ? 0 : 98);
     g_assert_true(triggered);
 
     ptimer_stop(ptimer);
@@ -463,6 +519,23 @@ static void check_periodic_with_load_0(gconstpointer arg)
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
     g_assert_false(triggered);
 
+    triggered = false;
+
+    ptimer_set_count(ptimer, 10);
+    ptimer_run(ptimer, 0);
+
+    qemu_clock_step(2000000 * 10 + 100000);
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
+
     ptimer_stop(ptimer);
 }
 
@@ -486,18 +559,12 @@ static void check_oneshot_with_load_0(gconstpointer arg)
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
     g_assert_false(triggered);
-
-    triggered = false;
-
-    qemu_clock_step(2000000 + 100000);
-
-    g_assert_false(triggered);
 }
 
 static void add_ptimer_tests(uint8_t policy)
 {
     uint8_t *ppolicy = g_malloc(1);
-    char *policy_name = g_malloc(64);
+    char *policy_name = g_malloc0(256);
 
     *ppolicy = policy;
 
@@ -505,6 +572,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_sprintf(policy_name, "default");
     }
 
+    if (policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
+        g_strlcat(policy_name, "wrap_after_one_period,", 256);
+    }
+
     g_test_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -550,6 +621,16 @@ static void add_ptimer_tests(uint8_t policy)
         ppolicy, check_oneshot_with_load_0);
 }
 
+static void add_all_ptimer_policies_comb_tests(void)
+{
+    int last_policy = PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD;
+    int policy = PTIMER_POLICY_DEFAULT;
+
+    for (; policy < (last_policy << 1); policy++) {
+        add_ptimer_tests(policy);
+    }
+}
+
 int main(int argc, char **argv)
 {
     int i;
@@ -560,7 +641,7 @@ int main(int argc, char **argv)
         main_loop_tlg.tl[i] = g_new0(QEMUTimerList, 1);
     }
 
-    add_ptimer_tests(PTIMER_POLICY_DEFAULT);
+    add_all_ptimer_policies_comb_tests();
 
     qtest_allowed = true;
 
-- 
2.9.3

