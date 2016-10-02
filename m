Received: by 10.80.163.71 with SMTP id 65csp1171283edn;
        Sun, 2 Oct 2016 09:08:18 -0700 (PDT)
X-Received: by 10.55.72.209 with SMTP id v200mr2455737qka.262.1475424498626;
        Sun, 02 Oct 2016 09:08:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y197si18474249qka.7.2016.10.02.09.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjJK-0008Eu-1s
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:08:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC2-0002f7-8N
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC0-0003I6-CR
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:46 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjBz-0003Hd-T5; Sun, 02 Oct 2016 12:00:44 -0400
Received: by mail-lf0-x242.google.com with SMTP id l131so7946141lfl.0;
	Sun, 02 Oct 2016 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=an+ZR1Sb9iyqA6wwK07fAODNhtz27/A7MuUV+qqK+D0=;
	b=dP3G7Puh3ohPdpBKUJZtVnvHQIHCVLJGudmYSW9b8nVnc40mPuBfnTFbMtAS1v8GYs
	ZammVS2zBg8DCbSlO6/TF4hZJRgv6NLAbGjPa8PJNElSnCmuPE34zVY0V/jfSo4wp5iU
	1MlvkQ+9WuUk5iweLXHf0mZlEt01wEGCkEstXZppAq7voSHpJIX0RIghxe4+TS1bSBRY
	CxCDE38lsrcVT64k1KpxI1ClGoULFlTBZ3DUWMqkF99orMH0NaShbZWpnqg4qLeRk5FT
	tGWe6f8moR3ZGRdSdKazXKBIFSh0tJIXFkeYxoV8sJu7L46bmdObY1s7LRf5kkqSQGQC
	Onyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=an+ZR1Sb9iyqA6wwK07fAODNhtz27/A7MuUV+qqK+D0=;
	b=FUMpYlzlRQKkuCCIY9/F8HTlBc5IGdvfIIhxM4P0p6Z6g4pYfS0x04A4KXh6Z1HCMl
	ydMoiBM65e64nrI4OO31aEs1JudNYoWDrFb4IHdcS8dhSmyLAaguzSIlz7YlWzguFl6h
	tuf2ZxOhyycFv9AMU/Efw3NSknS2Z70A3s9BK6U8ENARLcIgYH0IcC5W/HwzlxwKQZs5
	oGKGQEt+26BOYvf7xIpZSfSKtkKLV0gMjgQU2pHprGd//2+cunW8xEIcE2ttzSGtyxhY
	ZoNgndVmxbCIUHaBiIUMsJwtHhcMYrk9TnH07DDruRawGIbGXXzjDB4d14mOjGGcKkIU
	uk4g==
X-Gm-Message-State: AA6/9RmFS4zJDiAU3SFXAz9U2cFbJzfjX7P22t96ieeLeqrJb7WRAOfqcc+8Hb1SKuqoQg==
X-Received: by 10.25.72.14 with SMTP id v14mr677180lfa.12.1475424011890;
	Sun, 02 Oct 2016 09:00:11 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:11 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:36 +0300
Message-Id: <7a908ab38b902d521eb959941f9efe2df8ce4297.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH v17 04/14] tests: ptimer: Add tests for
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
X-TUID: k1TwQkJcypNL

PTIMER_POLICY_CONTINUOUS_TRIGGER makes periodic ptimer to re-trigger every
period in case of load = delta = 0.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index b95958f..dd4b1a1 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -503,6 +503,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
     const uint8_t *policy = arg;
     QEMUBH *bh = qemu_bh_new(ptimer_trigger, NULL);
     ptimer_state *ptimer = ptimer_init(bh, *policy);
+    bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
 
     triggered = false;
 
@@ -517,7 +518,12 @@ static void check_periodic_with_load_0(gconstpointer arg)
     qemu_clock_step(2000000 + 100000);
 
     g_assert_cmpuint(ptimer_get_count(ptimer), ==, 0);
-    g_assert_false(triggered);
+
+    if (continuous_trigger) {
+        g_assert_true(triggered);
+    } else {
+        g_assert_false(triggered);
+    }
 
     triggered = false;
 
@@ -534,7 +540,12 @@ static void check_periodic_with_load_0(gconstpointer arg)
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
@@ -576,6 +587,10 @@ static void add_ptimer_tests(uint8_t policy)
         g_strlcat(policy_name, "wrap_after_one_period,", 256);
     }
 
+    if (policy & PTIMER_POLICY_CONTINUOUS_TRIGGER) {
+        g_strlcat(policy_name, "continuous_trigger,", 256);
+    }
+
     g_test_add_data_func(
         g_strdup_printf("/ptimer/set_count policy=%s", policy_name),
         ppolicy, check_set_count);
@@ -623,7 +638,7 @@ static void add_ptimer_tests(uint8_t policy)
 
 static void add_all_ptimer_policies_comb_tests(void)
 {
-    int last_policy = PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD;
+    int last_policy = PTIMER_POLICY_CONTINUOUS_TRIGGER;
     int policy = PTIMER_POLICY_DEFAULT;
 
     for (; policy < (last_policy << 1); policy++) {
-- 
2.9.3

