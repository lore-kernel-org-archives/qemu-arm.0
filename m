Received: by 10.25.21.156 with SMTP id 28csp439123lfv;
        Thu, 21 Jul 2016 07:43:24 -0700 (PDT)
X-Received: by 10.37.220.79 with SMTP id y76mr34410829ybe.100.1469112204002;
        Thu, 21 Jul 2016 07:43:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o13si5195063qko.135.2016.07.21.07.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:43:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQFC7-0003n3-C3
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:43:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1c-00034N-3m
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1a-0003mG-MW
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:32 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1a-0003lq-Ds; Thu, 21 Jul 2016 10:32:30 -0400
Received: by mail-lf0-x243.google.com with SMTP id l89so5648283lfi.2;
	Thu, 21 Jul 2016 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xChj0cd9FV5l6e2ZGuNTkfObNGxyJVg0Hbz0BssDals=;
	b=OcPjAFpz1nfgf52AzuV6sBXhF8UsLjslHlZl48hrCIzxRsTE+683aMUSmz8XFW5B/i
	Cf1CK6+dzsSqY2UtZwKx4Jc/2G1AfROt5vYIcae0uGnzazJeKF9Z1M1Ci49N4Cn+qBam
	q4l8T+OcS4+HrmMI/or23YOTJP+Xhlmau3UpN+6o4UbS3xiLyOrkIMKj97IvVn8zFUbj
	/Glm4jNzZvq13cjJLfdQTNzKhpKYAYDTKKvZ0blkslmZRTxGsSaNWKRnYnxwgdg4MLKt
	EmEF6vtGtXCLXfYw4lJq8j4FNqlUmNnD77KeHpKZ0rmtYdXOuVkHEpxh9IElvXsJUyGM
	4Thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=xChj0cd9FV5l6e2ZGuNTkfObNGxyJVg0Hbz0BssDals=;
	b=ACHNqMh0QlFRoqubBKz2nuU1rQK/FRKoPBQkkJXakLrz0UCx7lcwGmL60nhwNZOIHf
	EGAlsmE/1dz/eFYw8c2r6SWhSmyYXcYmb47n6YeFBowF3Luu6K1OCPjw2ZBtJ1HEtz3M
	2Tyf2mi3ZY3QwCHNiIJAgvEoLomLtoi5dG6p2bCkkNbYedNF6NEXB4fh7QqmBtD1FrGr
	yDcMRFYk+rG1nkIhFqMMgDOFtldOuJuRk40IHODT0Af5BTIxkx/WkD1PVE6w4mO67lMz
	cqmK0IZ3yZ5QqSky7tfpOI0wvKOnODs12w5A+52XUKnQ67qi+0cGt6lVkl05/cZiDJnz
	wq5Q==
X-Gm-Message-State: ALyK8tLJ+ZGxOOt91i6LWcSPVDxJKxM5tXK9pxgbWsH4lsxOC2jcZB9hSZlCnumZs5fSkQ==
X-Received: by 10.25.209.68 with SMTP id i65mr25438499lfg.20.1469111549658;
	Thu, 21 Jul 2016 07:32:29 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:29 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:21 +0300
Message-Id: <4f59caa4ce3786410b7d1afee30d480a8ff33aac.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v15 10/15] hw/ptimer: Add "no immediate
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
X-TUID: 1S6wTbYQprr3

Performing trigger on setting (or starting to run with) counter = 0 could
be a wrong behaviour for some of the timers, provide "no immediate trigger"
policy to maintain correct behaviour for such timers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 9 ++++++++-
 include/hw/ptimer.h | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 8578861..d37e8ab 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -40,8 +40,11 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
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
 
@@ -62,6 +65,10 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         }
     }
 
+    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)) {
+        delta = 1;
+    }
+
     if (delta == 0) {
         fprintf(stderr, "Timer with delta zero, disabling\n");
         timer_del(s->timer);
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index c97f02e..ec76183 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -19,6 +19,9 @@
 /* Periodic timer that has load = 0 would continuously re-trigger every
  * period.  */
 #define PTIMER_POLICY_CONTINUOUS_TRIGGER    (1 << 1)
+/* Starting to run with/setting counter = 0 won't perform immediate
+ * trigger.  */
+#define PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  (1 << 2)
 
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
-- 
2.9.2

