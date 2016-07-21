Received: by 10.25.21.156 with SMTP id 28csp435585lfv;
        Thu, 21 Jul 2016 07:35:58 -0700 (PDT)
X-Received: by 10.55.139.2 with SMTP id n2mr36764127qkd.49.1469111758327;
        Thu, 21 Jul 2016 07:35:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u18si5174367qta.65.2016.07.21.07.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQF4v-0005Xs-JL
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:35:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1Y-00030y-Gv
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1U-0003iv-Du
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:28 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1U-0003ic-71; Thu, 21 Jul 2016 10:32:24 -0400
Received: by mail-lf0-x241.google.com with SMTP id l89so5648055lfi.2;
	Thu, 21 Jul 2016 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kQ8Ku6bL5itKmaunWgJl3AM88BULUpzaxUC8l+OvF1o=;
	b=igHN1t5de/m0mRYyAyO6DKUeT/1Wxzbl2nFfcgF8mb7oFgnMXqttyR8p9FxaoNHVm+
	HkqteHTV7hvWLZrHQ9BiSJL1IUo6MAd/fi8lWtbyYnwReIovAs4lcmm+HjwkaeB2JYYm
	FbnRr2cQ2uDOY+GAlyVqC8j+a9ynC/OcOP0k81AoF8MC8E2lomZZ7TqoQRtJXgSnDBrX
	A/VwdFBX3/dhnZlPjXluuWYeMyWYB2jWwfW859hFBPtwjpRFKdWhTRAMaClsSzOeqQQg
	jfEa1TFsAqieG+BudhR/0Eqf+ypxvGEK/RfBkVESZkRh3eiw+eYpdifqFj0hlfKTVw07
	ZR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=kQ8Ku6bL5itKmaunWgJl3AM88BULUpzaxUC8l+OvF1o=;
	b=W9WzRf2hXu6uI7KSO3vv8TZzSH4OclqNSCMU4OFblkihuNST6Yfzl86mEp9wHui6Yj
	SddT1mdx1VLL98OgIvNCw+9a3tuLQ+LlAOWnEKoQS2myO/0NZ3SEaCGcJlYIQG7QQu7k
	myqNpLEreF6uWvdZuL8DzCrH2goQtRXszhsm1ah0+9PXlvnl3G88+fW0oPkzpkyfE5bK
	j2M4npWR/MBExsl4x7jQaARSSjdDKkE6/6XwS6GlRuP0NHNAU/uKNjj/iQP+0w/3HWVX
	5kZftxcl2Nu9PqRZ2EKNZUhS5D9VtkqHtNBWtBIab85RWsudLNk3EcJQB5XnHE7ejjsO
	/BrA==
X-Gm-Message-State: ALyK8tJmpzKTRUBrETjyYFM+Gwy3G6C657LgKFE9vmcYZrSRzD1esSGm3HSe8Uex8RxFmg==
X-Received: by 10.25.79.132 with SMTP id d126mr15820447lfb.68.1469111543441;
	Thu, 21 Jul 2016 07:32:23 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:14 +0300
Message-Id: <ffcb377ed7793be91586692755f37aea81f66a0d.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v15 03/15] hw/ptimer: Actually stop timer in
 case of error
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
X-TUID: wf4LmAv+KX7v

Running with counter / period = 0 is treated as a error case, printing error
message claiming that timer has been disabled. However, timer is only marked
as disabled, keeping to tick till expired and triggering after being claimed
as disabled. Stop the QEMU timer to avoid confusion.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 461b91c..1dd2d32 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -44,6 +44,7 @@ static void ptimer_reload(ptimer_state *s)
     }
     if (s->delta == 0 || s->period == 0) {
         fprintf(stderr, "Timer with period zero, disabling\n");
+        timer_del(s->timer);
         s->enabled = 0;
         return;
     }
-- 
2.9.2

