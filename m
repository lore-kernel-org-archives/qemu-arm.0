Received: by 10.25.21.156 with SMTP id 28csp436978lfv;
        Thu, 21 Jul 2016 07:38:53 -0700 (PDT)
X-Received: by 10.200.56.35 with SMTP id q32mr81865280qtb.32.1469111933509;
        Thu, 21 Jul 2016 07:38:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k199si5166312qke.269.2016.07.21.07.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQF7k-00081n-PE
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1Y-000312-Hv
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1T-0003iX-I7
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:28 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33554)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1T-0003iD-Av; Thu, 21 Jul 2016 10:32:23 -0400
Received: by mail-lf0-x243.google.com with SMTP id f93so5656669lfi.0;
	Thu, 21 Jul 2016 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8Ap+fNmaDyuVVLUDgKl+76U72QR+p7T4vAb9TXqwCxA=;
	b=UcHOPyP6Y+LuxlbmQcl7RRjSHHKAO/zjN3gZPbWVf7kAzlQfSe+KZl6QSkByQjn2jA
	Cq3Z9lh3YKXE99+S1KvfTauodUHGXHa7Tk/Ep9LO6xZ8COd3yQd6xtQWksa290W34zWX
	LTGWrKzFugpPZq1ehjqUQ1zZO99O/rh1GxvtWky5g6l8/kc7W5Ju28oW4+rkslXap/x2
	JYBmRHOPvt0A9kPU4EaKOwMRNHkpvXk2quseaT3LuTIM6t9ifPjL20wVZhWonl/YC18N
	p06qbVlnKrtdbcU4gdMIzdLTQLY3h0ud3t5gwxPxcBEF2WapY+Qqnm92X6YBi/PUqlzT
	cEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=8Ap+fNmaDyuVVLUDgKl+76U72QR+p7T4vAb9TXqwCxA=;
	b=TWBD9bptPjW6stmBfjdWmBg8ey+d4WEeApJi1dYITPbcuMaceDJb43GTfz9JzU0kd8
	eBDgBvagohXZDCqcW80bYgnmIaCdMYHg5bjGj1Pyxf9vn0yqxZ3K5Qmu+HqkI5QT8j2R
	LnuheyYz1pHJpJfI2jnAjTt6PNQlJc7828o5nhMFeFiEuGd4vf0f0G5mKHjqeJCWDeJ7
	lfP7LBBRWONEm6V9aKoLHaZ8yFLNn4oRJB+7tMVMltZhDeOxnA8RNoEB73+tNhqomIbm
	Cq4WZs3S7zm1EDqy2xo8qFBYLNYcZjWNqktzX5imtVjXtVJicNHz1WsHytHbkiBpd1Kx
	bq0g==
X-Gm-Message-State: ALyK8tJRlAgP746USKccGUlIQagO7kwFNmF73O/srpJjTJog4+qtE+XVstHFfiqS2aaajQ==
X-Received: by 10.46.0.92 with SMTP id 89mr24183195lja.37.1469111542585;
	Thu, 21 Jul 2016 07:32:22 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:21 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:13 +0300
Message-Id: <2592778c5f9be74a63c50647075843f13e6e24f6.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v15 02/15] hw/ptimer: Fix counter - 1 returned
 by ptimer_get_count for the active timer
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
X-TUID: ASaFeaUxASkH

Due to rounding down performed by ptimer_get_count, it returns counter - 1 for
the enabled timer. That's incorrect because counter should decrement only after
period been expired, not before. I.e. if running timer has been loaded with
value X, then timer counter should stay with X until period expired.
Fix this by adding 1 to the counter value.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 9dc2bb0..461b91c 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -89,6 +89,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
     if (s->enabled) {
         int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         int64_t next = s->next_event;
+        int64_t last = s->last_event;
         bool expired = (now - next >= 0);
         bool oneshot = (s->enabled == 2);
 
@@ -97,6 +98,8 @@ uint64_t ptimer_get_count(ptimer_state *s)
             /* Prevent timer underflowing if it should already have
                triggered.  */
             counter = 1;
+        } else if (now == last) {
+            counter = s->delta;
         } else {
             uint64_t rem;
             uint64_t div;
@@ -139,7 +142,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
                 if ((uint32_t)(period_frac << shift))
                     div += 1;
             }
-            counter = rem / div;
+            counter = rem / div + 1;
         }
     } else {
         counter = s->delta;
-- 
2.9.2

