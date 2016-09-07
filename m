Received: by 10.25.87.130 with SMTP id l124csp313158lfb;
        Wed, 7 Sep 2016 06:34:16 -0700 (PDT)
X-Received: by 10.55.200.201 with SMTP id t70mr37433413qkl.238.1473255255968;
        Wed, 07 Sep 2016 06:34:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si14227864qkj.71.2016.09.07.06.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhczX-0003tu-8d
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:34:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcpC-0001iQ-V9
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp7-0005kG-LV
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 09:23:33 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcp4-0005hd-Qy; Wed, 07 Sep 2016 09:23:26 -0400
Received: by mail-lf0-x244.google.com with SMTP id 29so830675lfv.1;
	Wed, 07 Sep 2016 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kBlC89+jislZ+IPNNYdKi0ZJ8fOfiOLrjgU05JvMSjs=;
	b=rEFi14V6cNaqNiHLqAB/HbRxSUDPjQ+OgMQWuKXNtI1+fUjbuN4MqcK9R1p3aDsoEx
	uWZG7VM2c8RW9ZTSvepltKrYH7uHll/BdW2cIUC/QwSUyVZmO5Ho+PG145D/pZ9wJh/A
	oq6SW/wwJUgU5WpHnOfm96ODqTBphk/9vG5lIpCRkFbrQ6y69SXYqajc27IbnkA+vOHm
	mFuyRTT0aPZmCVBQ7aVZ6jAZkqMie7SMED5bQHLMEOv3Hqsz9qPkW1xh0uORc7D+LShU
	5nZRHZgvBvlSRRJECC/Shb79TrhN6/cS7RvI2lpXGpNmNk9IlFmldVn7fJ1DAMLOP4i1
	xIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=kBlC89+jislZ+IPNNYdKi0ZJ8fOfiOLrjgU05JvMSjs=;
	b=TDOvo0vURM+O44yD2NWQj0maKqdnza3lxT7DEJZkREJXXumwWsa/isu2dK+UE+bLZW
	O3M0eGrKZ2d1VUmOh5suM5wRy0a/18ZJyEUroXrvnL+veZHgLxiOT/JDWMnpjMiY4YN4
	LidQTzXeCVIZXyTKPLKAkYFxxJgOCjXnmnnc5SzCRE11e0O+BaXS6Adah2WbG9yIucd2
	ehT94RjqJjdL2R6O4NkXfAR4zZZ2KxWnxpJe4MxkWhBjvXuAkRAkf38zO743hjKbclKi
	Oi3eUpdxv69LfRgMN7D+PW4+SWuT7Heq0g9MYbFXXMgbT1tXjX/wPc0u8JWLssKFA2Fr
	QGNg==
X-Gm-Message-State: AE9vXwNvYDM+EhpC+g7p3j+x+LlEStT6v5eG1cRKDj9QSYk4UV/HtgUW/ozaY5MgdvVPig==
X-Received: by 10.46.71.147 with SMTP id u141mr12438527lja.15.1473254602051;
	Wed, 07 Sep 2016 06:23:22 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:21 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:18 +0300
Message-Id: <b485e92cac7725a75f7de9ca6b458ffa4082e099.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH v16 07/16] hw/ptimer: Add "continuous trigger"
 policy
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
X-TUID: HkmlAZtwXXJf

Currently, periodic timer that has load = delta = 0 performs trigger
on timer reload and stops, printing a "period zero" error message.
Introduce new policy that makes periodic timer to continuously trigger
with a period interval in case of load = 0.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 18 +++++++++++++++++-
 include/hw/ptimer.h |  4 ++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index e9b2e15..97ce8ae 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -45,7 +45,8 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         ptimer_trigger(s);
         delta = s->delta = s->limit;
     }
-    if (delta == 0 || s->period == 0) {
+
+    if (s->period == 0) {
         if (!qtest_enabled()) {
             fprintf(stderr, "Timer with period zero, disabling\n");
         }
@@ -58,6 +59,21 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
         delta += delta_adjust;
     }
 
+    if (delta == 0 && (s->policy_mask & PTIMER_POLICY_CONTINUOUS_TRIGGER)) {
+        if (s->enabled == 1) {
+            delta = 1;
+        }
+    }
+
+    if (delta == 0) {
+        if (!qtest_enabled()) {
+            fprintf(stderr, "Timer with delta zero, disabling\n");
+        }
+        timer_del(s->timer);
+        s->enabled = 0;
+        return;
+    }
+
     /*
      * Artificially limit timeout rate to something
      * achievable under QEMU.  Otherwise, QEMU spends all
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index a13a12e..4c9c700 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -38,6 +38,10 @@
  * around.  */
 #define PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD (1 << 0)
 
+/* Periodic timer that has load = 0 would continuously re-trigger every
+ * period.  */
+#define PTIMER_POLICY_CONTINUOUS_TRIGGER    (1 << 1)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
-- 
2.9.3

