Received: by 10.25.159.19 with SMTP id i19csp1542062lfe;
        Sat, 30 Jan 2016 08:49:43 -0800 (PST)
X-Received: by 10.140.164.141 with SMTP id k135mr15356577qhk.37.1454172583042;
        Sat, 30 Jan 2016 08:49:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r10si22403498qhc.128.2016.01.30.08.49.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:49:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYiU-0005zL-JZ
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:49:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgi-0002Wp-NQ
	for qemu-arm@nongnu.org; Sat, 30 Jan 2016 11:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgh-0002Dv-QC
	for qemu-arm@nongnu.org; Sat, 30 Jan 2016 11:47:52 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYgf-0002D3-N3; Sat, 30 Jan 2016 11:47:49 -0500
Received: by mail-lf0-x242.google.com with SMTP id t141so5187259lfd.3;
	Sat, 30 Jan 2016 08:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4OxWyW7VSoNMuoZEeqGTVN21Yv8SeYOoh4+3nFRklZg=;
	b=01r3FWs6qLkYAjtowaAzslGT0wdl+Q3TiupzRmluqw0XJ0/95sqLa4Hhix8Q1Wr2vC
	OVMa/M/czPoSomtALOKgV34zci9J8GTkOYgp8POCjldh8gyRM/cC41c0YmUOfFlhAOOP
	fL6323pYsDVPyb14M1jbMxsUs6svb9u91l+7oTwqOEVNIh5dDIgXuDimY2Pb6PyF7GGX
	n5JrhzBBYCqDztb+S4bAja6WUFN/PyJrNiuC6Lzg2HLUlGnV0sKSwMiZSAG8lWfAolvu
	Lj8wO3XE9uiqZ1A0ldJ68gGB14apAsaIjkh2J/3q4ZCk8gGkS4jKn5BFMvkst5jiwjcO
	5tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=4OxWyW7VSoNMuoZEeqGTVN21Yv8SeYOoh4+3nFRklZg=;
	b=H9K6HAAcOmn0/52XaXEL6+QHQuZun0snR4/ZD+fp4sIaHLUxCLHCAUhb4XnljW1ASG
	lAxpuLBRrTR5WW88ticNTmhG8MiBH9Xnbf/kI5SkUXyrlxeLhjJJBg9/Ujh3niLrH1x+
	s/LlNS9RT1S0gPqQsRhQ5WZYI+NqxfGdowLmxwaaFHV+RlYq0jL2h6fr65yKJudcA9hd
	rOczqzDk2JqUaE0y+GCri+TvU/AMYM5Bv+mFrhI13TB4houEZ8VGh5r2aCg2g7yhx4sP
	x6YNOXVwEDtfuRybCSLxUVdZ6lwNAM3YCioTUy357RMTMAotEJ27SL5pvT2CwEntHXzK
	Y1iA==
X-Gm-Message-State: AG10YOT7cMyy9rR3jSMozPR0ItV0761ZyoMNppYk1YR7P7bQWOV+FHsymzvokKSk3vkbog==
X-Received: by 10.25.84.7 with SMTP id i7mr4236174lfb.44.1454172468944;
	Sat, 30 Jan 2016 08:47:48 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:11 +0300
Message-Id: <0fc4f003c91dfbaa10aebc88e3a62607192700c2.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-arm] [PATCH v12 2/9] hw/ptimer: Perform counter wrap around
	if timer already expired
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
X-TUID: XcbkA2GYidbk

ptimer_get_count() might be called while QEMU timer already been expired.
In that case ptimer would return counter = 0, which might be undesirable
in case of polled timer. Do counter wrap around for periodic timer to keep
it distributed. In order to achieve more accurate emulation behaviour of
certain hardware, don't perform wrap around when in icount mode and return
counter = 0 in that case (that doesn't affect polled counter distribution).

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 5edcd71..d4452d3 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -83,14 +83,16 @@ static void ptimer_tick(void *opaque)
 
 uint64_t ptimer_get_count(ptimer_state *s)
 {
-    int64_t now;
     uint64_t counter;
 
     if (s->enabled) {
-        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        int64_t next = s->next_event;
+        bool expired = (now - next >= 0);
+        bool oneshot = (s->enabled == 2);
+
         /* Figure out the current counter value.  */
-        if (now - s->next_event > 0
-            || s->period == 0) {
+        if (s->period == 0 || (expired && (oneshot || use_icount))) {
             /* Prevent timer underflowing if it should already have
                triggered.  */
             counter = 0;
@@ -102,7 +104,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
             uint32_t period_frac = s->period_frac;
             uint64_t period = s->period;
 
-            if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
+            if (!oneshot && (s->delta * period < 10000) && !use_icount) {
                 period = 10000 / s->delta;
                 period_frac = 0;
             }
@@ -117,7 +119,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
                backwards.
             */
 
-            rem = s->next_event - now;
+            rem = expired ? now - next : next - now;
             div = period;
 
             clz1 = clz64(rem);
@@ -137,6 +139,11 @@ uint64_t ptimer_get_count(ptimer_state *s)
                     div += 1;
             }
             counter = rem / div;
+
+            if (expired && counter != 0) {
+                /* Wrap around periodic counter.  */
+                counter = s->limit - (counter - 1) % s->limit;
+            }
         }
     } else {
         counter = s->delta;
-- 
2.7.0

