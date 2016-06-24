Received: by 10.25.21.96 with SMTP id l93csp65577lfi;
        Fri, 24 Jun 2016 13:31:07 -0700 (PDT)
X-Received: by 10.55.116.195 with SMTP id p186mr7010326qkc.52.1466800267273;
        Fri, 24 Jun 2016 13:31:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u82si5804806qku.15.2016.06.24.13.31.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 13:31:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGXko-00035M-NV
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 16:31:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGXkl-0002ue-9Q
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 16:31:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bGXkk-0001cA-Ao
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 16:31:03 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34633)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bGXke-0001ar-T1; Fri, 24 Jun 2016 16:30:57 -0400
Received: by mail-lf0-x244.google.com with SMTP id l184so22878987lfl.1;
	Fri, 24 Jun 2016 13:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4NYSbLHeGnMunz+YmizcGvO8lNR2QG5vP+z3WGr7dAg=;
	b=tF4mhYj33PZp8jMwViE02VJyzjXVdCcJQlyoCsDu5/tzK0v3C1dsN4djczJ35P4P0z
	E1AHfK+3JH+fgMN9xo3TmEa8bxNfZFr8YJjeWgmyC6LXxKWxmf29xzFZ9kBeAbKaacEj
	tEpaNCM7o07rekfMBVSSiFuJBZIY072FwQP1QYYithV8LZE2KEZHHVZG8xGvc2xPQJov
	xG429aIJaaapN6veYZytxvCpL3oFUWEHIiH5wnJpEuI7o3ljkpS0qVkKe1995YFNmiU8
	PTuoJUFmED36Ep8Y5QgTC0HFV42MSSsULZhCIb8emUrmXwzptK+7BXsrGjzy1o2fMWY7
	ZPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4NYSbLHeGnMunz+YmizcGvO8lNR2QG5vP+z3WGr7dAg=;
	b=OIMCNhOTxO+JKzo+Th5JbaSBWEseriHfUiH9pFZLWWi9fAnM536zaPhbaSBFNN21Mm
	8cHmAuZKbKVIIuLBKh/PkO5Tl4CqGbRP+fGR4FwcfHtbe0qxxsnQD2kUfMqkBeUlgaxP
	vCWjNbPcselD0zAi6OxcjzYnoCyLFfSSnsAl5Ju7I5DxQwdwmZuobR2cqhbz4psw0qu1
	w8igB7ucTdJbH6CA8uktr57enWAYipS+tHJsCv3UrmeiALSzBvPPwNZ3H8IBLZGA5v4V
	ubi+67PESfwvRVHFGZx9EQRYzXR9spZzzbT9uTyqteWQiMhYpRe3vmtTNeWZ19rjqKbG
	vDzw==
X-Gm-Message-State: ALyK8tKPCPsCjv2OLYFbbeY6f/G/+WnYmbTtx3t7hZ19rv+tWTmUdYdDt0bY0FtkYvGeLg==
X-Received: by 10.25.169.7 with SMTP id s7mr2092482lfe.57.1466800255981;
	Fri, 24 Jun 2016 13:30:55 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	u13sm1119542lja.15.2016.06.24.13.30.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jun 2016 13:30:55 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 24 Jun 2016 23:29:34 +0300
Message-Id: <20160624202934.702-1-digetx@gmail.com>
X-Mailer: git-send-email 2.9.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH] hw/ptimer: Don't wrap around counter for expired
 timer that uses tick handler
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
X-TUID: VPS0I4UOZHA/

Software should see timer counter wrap around only after IRQ being triggered.
Change returned counter value to "1" for the expired timer and avoid returning
wrapped around counter value in periodic mode for the timer that has bottom-half
handler setup, assuming it is IRQ handler.

This fixes regression introduced by the commit 5a50307 ("hw/ptimer: Perform
counter wrap around if timer already expired") on SPARC emulated machine as
reported by Mark Cave-Ayland.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 7f89001..620ac2e 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -98,10 +98,10 @@ uint64_t ptimer_get_count(ptimer_state *s)
         bool oneshot = (s->enabled == 2);
 
         /* Figure out the current counter value.  */
-        if (expired && (oneshot || use_icount)) {
+        if (expired && (oneshot || use_icount || s->bh != NULL)) {
             /* Prevent timer underflowing if it should already have
                triggered.  */
-            counter = 0;
+            counter = 1;
         } else {
             uint64_t rem;
             uint64_t div;
@@ -148,7 +148,9 @@ uint64_t ptimer_get_count(ptimer_state *s)
 
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

