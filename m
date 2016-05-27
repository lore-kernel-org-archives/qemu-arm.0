Received: by 10.25.27.66 with SMTP id b63csp278616lfb;
        Fri, 27 May 2016 10:12:28 -0700 (PDT)
X-Received: by 10.200.49.194 with SMTP id i2mr14767716qte.102.1464369148880;
        Fri, 27 May 2016 10:12:28 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o66si18340024qkd.123.2016.05.27.10.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 10:12:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6LJE-00010A-7Q
	for alex.bennee@linaro.org; Fri, 27 May 2016 13:12:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBv-0002RA-N8
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBl-0003om-KW
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:04:54 -0400
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:36386)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6LBl-0003oc-CZ; Fri, 27 May 2016 13:04:45 -0400
Received: by mail-lb0-x242.google.com with SMTP id r5so6038587lbj.3;
	Fri, 27 May 2016 10:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vfrdAqvjQocCojn4Uuecg80X2PSNj2hSjYkX2CUydWw=;
	b=mzeEIiNfs2kpI8Zw8a8up530TiJPiZEwiUgSPXiOmHnswJkgKqvx1gMx38NO6Y7SGw
	S3V6t1lJDY/p1XdjIU78EhKlPYWS3eq2CdeJqeuE1lXR2raC9qN/VEwO9DckOVF8b5YJ
	Nu/69p1yRXmPvqaZRvf9MEZUh4wDuPh7yHRslNe8OaQVaaMf8hvCtcQ9bJRe9i7z7YZl
	gx89mudg/fuIMbIt3iNWKezIUkzPeFYg1lkAY8kR+M0rWB61BgBTrkjAJwGZXrbQ6Gj8
	etRFG3+DosT9wS9KfCqsMHm2V4T4n7vf8D/T3rpXkOo76G3gMiDu8+kKGWR9+gnAABZG
	adLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vfrdAqvjQocCojn4Uuecg80X2PSNj2hSjYkX2CUydWw=;
	b=FAUb4qm8F1f2EP5eh+yp9RMC67kIvesy+I4lZyYWU8i3qE5vDA8Eu5kAKUGqghfDri
	clrjdqw3/bppRV5mZe6f42TDfORNcLrEcehNOHTsOQ8wblhUSAE4VihHSJPC60liCd+X
	I9G/UtVnydeph6WNh+NL0TW66NBR5yelNUldPiNGgixs3YEn4F2pb9Z1JTQGBS20IpTw
	hOX3kTtfQF1ncP1cbC8PQUQXG+2qJ8/0rZBnJOJ02AGlABEpoQX+ArPBfrnLXY4jFilL
	lDuUSgCc+dw2aU+g+m4HO1Um9sbKEdlonSwUNQVPeg9ZeVCvSNbYEIv4Iuob+A1CHXRQ
	Pc3A==
X-Gm-Message-State: ALyK8tLGqGtNIgbuotc9aMY4IsASmkoVvJm/KmitLQkn9vJRne6CPI3aHMnM0RqJ0OQlxg==
X-Received: by 10.112.204.167 with SMTP id kz7mr4747559lbc.71.1464368684578;
	Fri, 27 May 2016 10:04:44 -0700 (PDT)
Received: from localhost.localdomain ([109.252.52.1])
	by smtp.gmail.com with ESMTPSA id p4sm3123088lfe.40.2016.05.27.10.04.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 10:04:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 27 May 2016 20:03:30 +0300
Message-Id: <4ce381c7d24d85d165ff251d2875d16a4b6a5c04.1464367869.git.digetx@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Subject: [Qemu-devel] [PATCH v13 2/8] hw/ptimer: Perform counter wrap around
 if timer already expired
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
X-TUID: w4QVbitWuQ6c

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
index 16d7dd5..7e6fc2d 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -84,14 +84,16 @@ static void ptimer_tick(void *opaque)
 
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
@@ -103,7 +105,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
             uint32_t period_frac = s->period_frac;
             uint64_t period = s->period;
 
-            if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
+            if (!oneshot && (s->delta * period < 10000) && !use_icount) {
                 period = 10000 / s->delta;
                 period_frac = 0;
             }
@@ -118,7 +120,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
                backwards.
             */
 
-            rem = s->next_event - now;
+            rem = expired ? now - next : next - now;
             div = period;
 
             clz1 = clz64(rem);
@@ -138,6 +140,11 @@ uint64_t ptimer_get_count(ptimer_state *s)
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
2.8.3

