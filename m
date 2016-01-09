Received: by 10.25.134.130 with SMTP id i124csp1101286lfd;
        Sat, 9 Jan 2016 09:44:45 -0800 (PST)
X-Received: by 10.140.38.73 with SMTP id s67mr143098767qgs.82.1452361484756;
        Sat, 09 Jan 2016 09:44:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9si35636081qkh.31.2016.01.09.09.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 09:44:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHxZE-0006wm-Au
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 12:44:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXO-0003Ia-SM
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 12:42:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXN-0000j7-Pq
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 12:42:50 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aHxXK-0000gu-4Y; Sat, 09 Jan 2016 12:42:46 -0500
Received: by mail-lf0-x243.google.com with SMTP id c134so2046175lfb.2;
	Sat, 09 Jan 2016 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0sdxLU8sl+k3NjhfFtqghzVzfDM6VOEndkAIvlkexaE=;
	b=k3sPmYrSSgGLt+xCmTDNnEjAR19VwYD18H9b2L8GS4bVnIKSyvAV9L8P/NxCniOcPa
	EwzhIbbkNFQF5kVa6yQtdXd612ThOIzrhlNF7eIeCwKvX+HiosjNs33/0o5jNQyvnILQ
	GY7qCIzWv+BPGZL8R5SR//mHEHKDyy7VvOO/FHrqfLfktg9n7zvmhzpYZpz4Mios+39Z
	kgqtDHaEM1pbP4xxYHKaammGvnIDwFhejnMN8NQRiXg2hYPPaxyY9FKCio7Hsm1ldq6u
	z0S13CRuKfALwsGUO+tOSy5gkF6PDCkfJ4g7ixN53IHFsqJMP+c7TnYJeBMhtI+AyM2I
	FCtQ==
X-Received: by 10.25.147.200 with SMTP id v191mr23265121lfd.167.1452361365463; 
	Sat, 09 Jan 2016 09:42:45 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	f186sm8406450lfd.26.2016.01.09.09.42.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jan 2016 09:42:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat,  9 Jan 2016 20:39:52 +0300
Message-Id: <f515e61fa162411d0a75c3d0583780531fe8cc6e.1452359845.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-arm] [PATCH v10 4/7] hw/ptimer: Support "on the fly" timer
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
X-TUID: GyCPNa5AiDeq

Allow to switch between periodic <-> oneshot modes while timer is running.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 0a54212..6960738 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -167,16 +167,16 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
 
 void ptimer_run(ptimer_state *s, int oneshot)
 {
-    if (s->enabled) {
-        return;
-    }
-    if (s->period == 0) {
+    int was_disabled = !s->enabled;
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
2.6.4

