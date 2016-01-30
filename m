Received: by 10.25.159.19 with SMTP id i19csp1541531lfe;
        Sat, 30 Jan 2016 08:47:58 -0800 (PST)
X-Received: by 10.55.78.131 with SMTP id c125mr18477743qkb.71.1454172477456;
        Sat, 30 Jan 2016 08:47:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v16si20499191qka.127.2016.01.30.08.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:47:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYgm-0002dO-Vl
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:47:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgk-0002Yt-97
	for qemu-arm@nongnu.org; Sat, 30 Jan 2016 11:47:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgj-0002F2-Gw
	for qemu-arm@nongnu.org; Sat, 30 Jan 2016 11:47:54 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYgh-0002Do-RB; Sat, 30 Jan 2016 11:47:52 -0500
Received: by mail-lf0-x244.google.com with SMTP id t141so5187291lfd.3;
	Sat, 30 Jan 2016 08:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Mxp7s/OZdtUUVPrduRicDC26L2HlOOWcFQ0y8HoDZ0k=;
	b=QeMRh/2gQRVyitCIRzfzPbUYey2kceg6U9gjVlc4djfqWVEkSfSp71W09jQ0A9lISo
	ouiusHFHpcy4tBAGkzS9YfpVY8olKh0EudNZhGZwW7FQjop3FdS/7qaZErsRge4SEuUu
	ti+uw0jd/hlf4hP79av6tBKT2GOHoFhrj7iebfqTkb08OnLkHGM8zTVh2FQzYqkvB+ts
	dotGcWgBhDSI9vd6op5S2gnG/d7GTPg8umFdqjoqQ0qn2Oyrdvk9l2sWHviS7xV1JQmU
	h9nkg8WsrG7i9wh6VyYJt1KW4h3nmHUn98LA19Djz2R3YzEsmeJfZ87AOz5WeovsRdKy
	6+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Mxp7s/OZdtUUVPrduRicDC26L2HlOOWcFQ0y8HoDZ0k=;
	b=GiebRZO052UbbeWijq/LQK1rERFD3loS4cwFLTAwpDVGZdYP5e2fDo3Ke81SqJZceR
	WazTeVnt4o9ZXv3IHf7fS3Ecj9RSicU33iPuLuLb/791RjYteniieR8TO+1TrhTyQ+Bw
	c8NgN60RnfNaSaAiqACxYwEjyAaarq/JTvBt2zu3E/A5ewNdqpVEpt/MExOj3OImAsU1
	wQe+LvRPeS6mpPOh28MbA5TC/x3NybhOsLLsRL604HTPlhuQkfK8FTv9xFzLglzYi1BD
	eVlAGKxZCY7aDygytAekyr/qT8EpeAUYXMZj4Hm73oUmc54Bs5gIegCL7IhOZkYWeU+5
	h7Tw==
X-Gm-Message-State: AG10YORkmzHF4W3Uo2J2m1/+z+AO5D5soL449kWXvV/qUli1lDS77ZFmm5rvM0Kb20zmfQ==
X-Received: by 10.25.91.81 with SMTP id p78mr5572707lfb.19.1454172470997;
	Sat, 30 Jan 2016 08:47:50 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:50 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:13 +0300
Message-Id: <b2412975dd867adeb73c21da74d1d111bc987d2e.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-arm] [PATCH v12 4/9] hw/ptimer: Support "on the fly" timer
	mode switch
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y0VYSkBykWx8

Allow switching between periodic <-> oneshot modes while timer is running.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index f58790a..78ae443 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -162,16 +162,17 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
 
 void ptimer_run(ptimer_state *s, int oneshot)
 {
-    if (s->enabled) {
-        return;
-    }
-    if (s->period == 0) {
+    bool was_disabled = !s->enabled;
+
+    if (was_disabled && s->period == 0) {
         fprintf(stderr, "Timer with period zero, disabling\n");
         return;
     }
     s->enabled = oneshot ? 2 : 1;
-    s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    ptimer_reload(s);
+    if (was_disabled) {
+        s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        ptimer_reload(s);
+    }
 }
 
 /* Pause a timer.  Note that this may cause it to "lose" time, even if it
-- 
2.7.0

