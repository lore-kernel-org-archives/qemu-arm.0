Received: by 10.25.27.66 with SMTP id b63csp275551lfb;
        Fri, 27 May 2016 10:06:32 -0700 (PDT)
X-Received: by 10.55.87.197 with SMTP id l188mr14678960qkb.13.1464368792071;
        Fri, 27 May 2016 10:06:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 198si18328890qhb.51.2016.05.27.10.06.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 10:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6LDT-0003We-E7
	for alex.bennee@linaro.org; Fri, 27 May 2016 13:06:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBq-0002NP-N9
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBp-0003qB-Px
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:04:50 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35696)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6LBp-0003pr-Hp; Fri, 27 May 2016 13:04:49 -0400
Received: by mail-lf0-x241.google.com with SMTP id p10so8980950lfb.2;
	Fri, 27 May 2016 10:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TnLQuRbLVhU6oZjGPsk30/ZkMhd4D5vyyj7Qq9/ZbRw=;
	b=s4RASWqhKuH/Tw0Oxr477JHJ/9TLgSbsEhhXY21eXgPOGvl/BwttKcYLsOfoMpCdYJ
	FJDxVKsL7xMRTzyI2xxx4D4tsEiMIWXvs6OC4h6srUuQeMfh4cY42YXob3l6EoqvuOZY
	UipNiQY+NP8y9+nO04l+SScPWHWq4Et45FklzH4svtM9MiCK8nERlq7WgReeKY7gSEEK
	CEJuGXMMb6/XTDcAgaWwMGSyQ6X715qZt00iizAZlLNcj0h+e52jnPeXLLmKs1QHXBIY
	LaVhxe4YtAU22NFffL3RtT97EnsQfHHtxfINKvuRbat3WvfXLPo7BKCoNwRl4QpDRxGO
	xRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TnLQuRbLVhU6oZjGPsk30/ZkMhd4D5vyyj7Qq9/ZbRw=;
	b=RpRIX6qievJu/uGdf/HetdAntkQOy+kK7dluqJI4xVgND0nRYXHQ+WqtM/4LfMp+5T
	VaD5gtzfFlibbtJpxTwhfon8sOBlut4BMqtaijwXhP5y0mrUuecb7J2afMsCZ4wAIogq
	8UMh0t923yXNJUep+7EYyZaUmZCNJTJ6iK96xEEgf1b8RKZTnCfQg9Hto0pzpm43bXjU
	Xoisa9ExUaKZKU7CwEy9RqOvNwKp+pm+8qXKRIqzICqhZtb3bqPtV9ucFf0r+VmhRCbr
	p6gaP6XovKvq9BjFBol4euaBMX/+Jd8QRxkspPrUDjep+nr/nVhi2Rs6nMqnHbCtUKvw
	i7Tw==
X-Gm-Message-State: ALyK8tLp+J5O2GkrQlrv5wpMqyoWNFPJM8UNLsXIx9ep/zoIC0b5hFGDKu4kR0xJZQtTqw==
X-Received: by 10.25.8.7 with SMTP id 7mr4963445lfi.201.1464368688745;
	Fri, 27 May 2016 10:04:48 -0700 (PDT)
Received: from localhost.localdomain ([109.252.52.1])
	by smtp.gmail.com with ESMTPSA id p4sm3123088lfe.40.2016.05.27.10.04.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 10:04:48 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 27 May 2016 20:03:35 +0300
Message-Id: <46f79ce4f464c423bdd5d2b218702854808e3778.1464367869.git.digetx@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v13 7/8] hw/ptimer: Fix counter - 1 returned by
 ptimer_get_count for the active timer
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
X-TUID: HYlIA5D+tgeb

Due to rounding down performed by ptimer_get_count, it returns counter - 1 for
the active timer. That's incorrect because counter should decrement only after
period been expired, not before. I.e. if running timer has been loaded with
value X, then timer counter should stay with X until period expired and
decrement after. Fix this by adding 1 to the counter value for the active and
unexpired timer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 9bc70f5..c9f2604 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -89,10 +89,10 @@ static void ptimer_tick(void *opaque)
 
 uint64_t ptimer_get_count(ptimer_state *s)
 {
+    int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     uint64_t counter;
 
-    if (s->enabled && s->delta != 0) {
-        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    if (s->enabled && s->delta != 0 && now != s->last_event) {
         int64_t next = s->next_event;
         bool expired = (now - next >= 0);
         bool oneshot = (s->enabled == 2);
@@ -144,7 +144,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
                 if ((uint32_t)(period_frac << shift))
                     div += 1;
             }
-            counter = rem / div;
+            counter = rem / div + (expired ? 0 : 1);
 
             if (expired && counter != 0) {
                 /* Wrap around periodic counter.  */
-- 
2.8.3

