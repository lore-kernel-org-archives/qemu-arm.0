Received: by 10.25.27.66 with SMTP id b63csp274729lfb;
        Fri, 27 May 2016 10:05:05 -0700 (PDT)
X-Received: by 10.55.125.7 with SMTP id y7mr15082808qkc.46.1464368704990;
        Fri, 27 May 2016 10:05:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d90si9132640qgd.122.2016.05.27.10.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 10:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6LC4-0002YB-B2
	for alex.bennee@linaro.org; Fri, 27 May 2016 13:05:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBz-0002VX-A2
	for qemu-arm@nongnu.org; Fri, 27 May 2016 13:05:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBy-0003t9-BK
	for qemu-arm@nongnu.org; Fri, 27 May 2016 13:04:59 -0400
Received: from mail-lb0-x244.google.com ([2a00:1450:4010:c04::244]:36386)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6LBm-0003p9-Ul; Fri, 27 May 2016 13:04:47 -0400
Received: by mail-lb0-x244.google.com with SMTP id r5so6038616lbj.3;
	Fri, 27 May 2016 10:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TQnMpbtvU7lGRNgY5cGe8YJUa9WOOKjvmR/MKv6Y5CE=;
	b=INejF5xrPOz6EglbkTUNUBZZx617zMzXGKGBZHxpkSd92ZyXes9hdIjKYOvbvdxDTp
	opfRS31LOxsgqLwOZcsTA9GIghjVQZvJUFI4PSH92+4hFeorJ6Y3i0xGizEBSTs/tBln
	d+2bWeLasG/qeLvK0jrNaEPjAAngGId3M2VUgPR3T5eHlz7es0KZx+qp1VZ1tx2OBPzz
	eiBlKGUwg4pZ2UHaQoO0ZozakY4l90zQGyLWMtS0NSVVlJXo3zlTufPyGQwMsDOzn9o7
	CtPyM/640kyWJGg5gVp7efaOlJhb2Rss09I25xC+hef1iKmaRDVqF62pXtQ1hx3GH8bU
	eoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TQnMpbtvU7lGRNgY5cGe8YJUa9WOOKjvmR/MKv6Y5CE=;
	b=L4hdlnkNFWF0d6W8ZbpT9PWHTzlXnWhJXpP4pzJ7EdWVA6LrWOh7lMAFfviE9mR7Kx
	e4Z+PRhVgv5GqTFJ4QgfTUeeo2nnCsCfFgc6AGm641vHaXVSvJEMSRxZrEF/9rY8en8z
	HaFC1h62xr3Ev1e/1MA7JnYoIZYZl1PeglCTJN5rRLGRZx0s66bZS0tRl0XTCnCwlORG
	sNbmg+dOiz3JyuMGY2L7WjgBXGzXKUTnvE28txLdabulu6f3NRHgu30QF+eKbivXN/gZ
	Y7aLiUSW+wPa2Th6QMbdVOfwvL0hRF9zO3lnOA5T43Di02a4lZOfo+eckILAoybumXBS
	BMjg==
X-Gm-Message-State: ALyK8tLmSOcHyQOEjX23NtkDxYmbZMdcD74wRe7cfRut/AUN9rHoJwnXaVnaU5nW3JoIdA==
X-Received: by 10.112.43.210 with SMTP id y18mr4907123lbl.105.1464368686232;
	Fri, 27 May 2016 10:04:46 -0700 (PDT)
Received: from localhost.localdomain ([109.252.52.1])
	by smtp.gmail.com with ESMTPSA id p4sm3123088lfe.40.2016.05.27.10.04.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 10:04:45 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 27 May 2016 20:03:32 +0300
Message-Id: <f030be6e28fbd219e1e8d22297aee367bd9af5bb.1464367869.git.digetx@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::244
Subject: [Qemu-arm] [PATCH v13 4/8] hw/ptimer: Support "on the fly" timer
 mode switch
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
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: un/8KkqhgSCR

Allow switching between periodic <-> oneshot modes while timer is running.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 76ebe9b..d0b2f38 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -163,16 +163,17 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
 
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
2.8.3

