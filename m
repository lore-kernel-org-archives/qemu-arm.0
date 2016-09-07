Received: by 10.25.87.130 with SMTP id l124csp308988lfb;
        Wed, 7 Sep 2016 06:25:27 -0700 (PDT)
X-Received: by 10.55.156.213 with SMTP id f204mr12886524qke.148.1473254727521;
        Wed, 07 Sep 2016 06:25:27 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c134si9878556qkg.168.2016.09.07.06.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:25:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcr0-0002hZ-Pn
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:25:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp1-0001Z3-Kt
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcoy-0005fJ-Dr
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:23 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcoy-0005eq-60; Wed, 07 Sep 2016 09:23:20 -0400
Received: by mail-lf0-x241.google.com with SMTP id 29so830617lfv.1;
	Wed, 07 Sep 2016 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bqB2hhibdPMcvHoWpP2gLWRsej+rL38AdyE9ESvTX1g=;
	b=TZxRoD28VcqNNtT7XbeYbtPZXLp1nLbkF/DuqWdmdYhP59tnItprAXMQE+HcDHj1Sw
	uUsvgE4CV9UL+4hYdO4HIpnNTSA5M7BG0tV1lptIaHtgRtap2FTxmlO0a2VcvmrjZKiU
	ou4RV1rVJHPwEjoYf+Ps6Y0aqSec62Ll7HfWBLJgrerrx1HdRVJhlL0hxHTRfYwpd9xp
	P8hOnaWiHZzgVAnR9VR90UTsLGCdH3sh0VvqJfTagmHaKtCJ9Jod9QvndB8PqJKaB2j0
	7UXNuccVBog2YBEm7kUBiN9L1wFviUt0kEqVjBMgb9WfRp2prp5PO5S6bF6npwIkGulL
	Gcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bqB2hhibdPMcvHoWpP2gLWRsej+rL38AdyE9ESvTX1g=;
	b=Gfgar8heeTUBWveGkhj5x3g/a40h4OemWngRSifoqLdBYzW1nK6BCJuBFHZQEH1wTp
	Xge6PVoyct0LK060cSAhdmVf7PCswP/IDR1lR5FNCQH0ABHxByG2lhjSU/ysLZNw1Jro
	ZwOAamCdPNDlZdayU+m1+CusEIIVx7/IBtikTjiS6GV4drWUFgsDV6wWPa+lEDBEBNZF
	BKztbm6jMkqr6V10i+LXrKD+bkg/ATawl0Z4wK7xojxPnWaBf85UQerYwO9nYiYJ04b8
	HvFt7tDuhotlRkNAnGk2sTVVrQlX7PcLcGNRgJsmAdmfQjAyJFxWN+25Q4hZ6XGFOALj
	BOEQ==
X-Gm-Message-State: AE9vXwNFF46MPRslGtOHtKux2HhgjDPOgNy4TxSjtn7DEdc2/MEBRTQsrMC4FU5tIdKttw==
X-Received: by 10.25.37.84 with SMTP id l81mr15761lfl.41.1473254599385;
	Wed, 07 Sep 2016 06:23:19 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:18 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:15 +0300
Message-Id: <44877fff4ff03205590698d3dc189ad6d091472f.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v16 04/16] hw/ptimer: Suppress error messages
 under qtest
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
X-TUID: 8u/jjXM8DIjZ

Under qtest ptimer emits lots of warning messages. The messages are caused
by the actual checking of the ptimer error conditions. Suppress those
messages, so they do not distract.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 00fdf15..c45c835 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -11,6 +11,7 @@
 #include "hw/ptimer.h"
 #include "qemu/host-utils.h"
 #include "sysemu/replay.h"
+#include "sysemu/qtest.h"
 
 struct ptimer_state
 {
@@ -44,7 +45,9 @@ static void ptimer_reload(ptimer_state *s)
         s->delta = s->limit;
     }
     if (s->delta == 0 || s->period == 0) {
-        fprintf(stderr, "Timer with period zero, disabling\n");
+        if (!qtest_enabled()) {
+            fprintf(stderr, "Timer with period zero, disabling\n");
+        }
         timer_del(s->timer);
         s->enabled = 0;
         return;
@@ -163,7 +166,9 @@ void ptimer_run(ptimer_state *s, int oneshot)
     bool was_disabled = !s->enabled;
 
     if (was_disabled && s->period == 0) {
-        fprintf(stderr, "Timer with period zero, disabling\n");
+        if (!qtest_enabled()) {
+            fprintf(stderr, "Timer with period zero, disabling\n");
+        }
         return;
     }
     s->enabled = oneshot ? 2 : 1;
-- 
2.9.3

