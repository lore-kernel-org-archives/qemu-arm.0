Received: by 10.25.87.130 with SMTP id l124csp314996lfb;
        Wed, 7 Sep 2016 06:38:25 -0700 (PDT)
X-Received: by 10.55.201.7 with SMTP id q7mr22042187qki.221.1473255504941;
        Wed, 07 Sep 2016 06:38:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g29si12671318qte.30.2016.09.07.06.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:38:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhd3Y-0007SQ-9G
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:38:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp4-0001Zx-0Y
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp2-0005h2-S0
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:25 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcp2-0005gf-JU; Wed, 07 Sep 2016 09:23:24 -0400
Received: by mail-lf0-x243.google.com with SMTP id s64so834376lfs.2;
	Wed, 07 Sep 2016 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=akRnbvVs9mMrzAqRjeDiiwPbVMvGxFlcNTZrRHM+50U=;
	b=w2XgPQfHK2cF3FFfrlZ9PQjG2gSKhXk9OwiUzg9MsT+M8qN/d+aoHCKu3pLHHgrodS
	IyMlTNFTJiZ9Qn1LfzB+G5GJYDhXWSVlqLKYZVSDHULXJ7aRpiZmHj4m0jG9xV/LC0DU
	ZAKgRJZlMOtG0kVzLJQ7JoV80BSmjJXg9+Ir43q1VYvx4jL2MeU3uRyAoZ6jR5W61K2A
	5wvJ7OVtG4bfsOvv8RHZyiVUXSi9emM24nIihPR8R261iZs4aLmzHPGqSz6vnJUAzzDe
	54MsnNvO34q2XNJglVgKSFLNRiHrN82Rfj2vDSrWq+LEd8YTuPBtKlXB2/V86t1NoxZp
	r7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=akRnbvVs9mMrzAqRjeDiiwPbVMvGxFlcNTZrRHM+50U=;
	b=h7BB8W4G+jxU8Syv6rg59d+MyjKkiRallOiuTFsX6P4ipAaQ6zlfvvrHumS7t4EkEr
	cVvUtDYrG3IFtTG10e2X+SqLgaf3w2kPZgj0ioa2+eIY4j5co5uPYLwk1gV0W7i4zsM7
	r84qWtMQBgt5KxLIn4HJXwk1Osi6EIWO4WKevmXjy/6ah4QqTI1NVtGFLG8c5ngVqXdZ
	wAukBXbUyACvqeKem/m/R17jh8vK+1a3Q9Q1RAYtHpTCoh5PEIg8veDGqx2T4JWtCpHn
	EGZDKrfG915VgVZm483nP5iQHPRtUVJvRarbp00zuoK/J3V5xmuljRZsqJl0dJvTgdvd
	Wn3A==
X-Gm-Message-State: AE9vXwPGEZUEewiRk10b94zytuJi2zUgCi1+8LNvEbwsVJJS7oD+8pWXPQQji10FVjVNjA==
X-Received: by 10.25.91.148 with SMTP id p142mr10661lfb.161.1473254603739;
	Wed, 07 Sep 2016 06:23:23 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:23 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:20 +0300
Message-Id: <ad97b8cd130a9cda20205d227b05558462e273c4.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v16 09/16] hw/ptimer: Add "no immediate
 trigger" policy
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
X-TUID: Hz8q0qF0c5HH

Performing trigger on setting (or starting to run with) counter = 0 could
be a wrong behaviour for some of the timers, provide "no immediate trigger"
policy to maintain correct behaviour for such timers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 9 ++++++++-
 include/hw/ptimer.h | 4 ++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 97ce8ae..018589d 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -41,8 +41,11 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
     uint64_t period = s->period;
     uint64_t delta = s->delta;
 
-    if (delta == 0) {
+    if (delta == 0 && !(s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)) {
         ptimer_trigger(s);
+    }
+
+    if (delta == 0) {
         delta = s->delta = s->limit;
     }
 
@@ -65,6 +68,10 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         }
     }
 
+    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)) {
+        delta = 1;
+    }
+
     if (delta == 0) {
         if (!qtest_enabled()) {
             fprintf(stderr, "Timer with delta zero, disabling\n");
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index e2f4c55..4b7c53c 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -42,6 +42,10 @@
  * re-trigger every period.  */
 #define PTIMER_POLICY_CONTINUOUS_TRIGGER    (1 << 1)
 
+/* Starting to run with/setting counter = 0 won't perform immediate
+ * trigger.  */
+#define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
-- 
2.9.3

