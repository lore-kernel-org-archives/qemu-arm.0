Received: by 10.25.21.96 with SMTP id l93csp320166lfi;
        Sat, 25 Jun 2016 05:38:31 -0700 (PDT)
X-Received: by 10.200.51.35 with SMTP id t32mr10887957qta.91.1466858311817;
        Sat, 25 Jun 2016 05:38:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q38si8919234qtb.16.2016.06.25.05.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Jun 2016 05:38:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGmr1-0000TI-8Z
	for alex.bennee@linaro.org; Sat, 25 Jun 2016 08:38:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGmqx-0000Ro-U8
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 08:38:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGmqw-0001mF-80
	for qemu-arm@nongnu.org; Sat, 25 Jun 2016 08:38:27 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36848)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bGmqq-0001jG-LX; Sat, 25 Jun 2016 08:38:20 -0400
Received: by mail-lf0-x241.google.com with SMTP id a2so24358283lfe.3;
	Sat, 25 Jun 2016 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=X6Yh41+MqX6UohJFk1nfq5yGtOZJdgsThHYtSN93jVE=;
	b=oLgIHKFiq3WRWJrAMvaf8E7U5Ev6oVjzu0NpWCDT4GbCQsj6HsVnRmFLZuNSinanJC
	7nzR2m8ecsDQMEbg8sEf06ze9Ou1f7h/sr/3myAIKhmTVWx9Uvc3pBMiNtnKZPsNJJJ0
	QY4MVEUI1xLkMuQac51hiYzhjkqR+XkMUPWmEsW8s0RikP25mxeaHuSQd7DOLasHdcSk
	yMnOiL2f2mWfQ9yecUjnyCnhXNG2I2QmKbvr769/zzH84OEnwO+VGT9AdFxLJNzrbdUD
	s6IR5GDeB3ZIrb0wWlaOAAPvUgcmOe2MNZtd8m5q3A9ogKQIKTgkbR0iEmeyJdQaL7qP
	zHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=X6Yh41+MqX6UohJFk1nfq5yGtOZJdgsThHYtSN93jVE=;
	b=M3VxxsOijSr6F3aHrM+s9x2K6D/W+lU9sfvH6SQo27et6349fip4LkrbeU2mLim7AV
	7LBje4X7eYPAnzQ9aCQFqxeGcOitYVTVHW5+8lrxKqOfvd4uyTkm041lTNMHXWarjCpW
	NJVsI3eE7gzgS3xjjAbabCP5+Qe4IFt0InNr5hbI4SkHP3NaD6U0luodIouQ6JT0BIUw
	MwL+h0zHO8q0NaYwx5aredqrvo0HvY8TQpgvReE+weBONUaty+zOMC7nwrERpxN+beDN
	oZCj1uUGc2OYUuhSAyl5BW906W5Yj/Q8qJUTwuxTAIFPrt8pPwFoFTe2yZwtm42Ao7my
	Hwhg==
X-Gm-Message-State: ALyK8tIsQq0lpahVDCsO7L6RIUV25j9iybQkrSMYyJLH9VzjLsi4xuCtCEq2/qk5/slclA==
X-Received: by 10.25.90.209 with SMTP id o200mr2313965lfb.193.1466858299692;
	Sat, 25 Jun 2016 05:38:19 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	e32sm1620871lji.41.2016.06.25.05.38.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 Jun 2016 05:38:19 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 25 Jun 2016 15:35:21 +0300
Message-Id: <20160625123521.16752-1-digetx@gmail.com>
X-Mailer: git-send-email 2.9.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-arm] [PATCH v2] hw/ptimer: Don't wrap around counter for
 expired timer that uses tick handler
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
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BFo+3DCkLaVt

Software should see timer counter wrap around only after IRQ being triggered.
Change returned counter value to "1" for the expired timer and avoid returning
wrapped around counter value in periodic mode for the timer that has bottom-half
handler setup, assuming it drives timer IRQ.

This fixes regression introduced by the commit 5a50307 ("hw/ptimer: Perform
counter wrap around if timer already expired") on SPARC emulated machine as
reported by Mark Cave-Ayland.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 05b0c27..8006442 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -93,10 +93,10 @@ uint64_t ptimer_get_count(ptimer_state *s)
         bool oneshot = (s->enabled == 2);
 
         /* Figure out the current counter value.  */
-        if (s->period == 0 || (expired && (oneshot || use_icount))) {
+        if (expired && (oneshot || use_icount || s->bh != NULL)) {
             /* Prevent timer underflowing if it should already have
                triggered.  */
-            counter = 0;
+            counter = 1;
         } else {
             uint64_t rem;
             uint64_t div;
@@ -143,7 +143,9 @@ uint64_t ptimer_get_count(ptimer_state *s)
 
             if (expired && counter != 0) {
                 /* Wrap around periodic counter.  */
-                counter = s->limit - (counter - 1) % s->limit;
+                counter = s->delta = s->limit - (counter - 1) % s->limit;
+                /* Re-arm timer according to the wrapped around value.  */
+                ptimer_reload(s);
             }
         }
     } else {
-- 
2.9.0

