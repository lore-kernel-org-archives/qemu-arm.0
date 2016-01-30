Received: by 10.25.159.19 with SMTP id i19csp1542337lfe;
        Sat, 30 Jan 2016 08:50:30 -0800 (PST)
X-Received: by 10.140.32.194 with SMTP id h60mr18173111qgh.79.1454172629941;
        Sat, 30 Jan 2016 08:50:29 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e20si19233840qhe.130.2016.01.30.08.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:50:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYjF-0006y4-73
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:50:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgj-0002YD-Pa
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgi-0002EZ-RR
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:53 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34591)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYgi-0002EJ-IU; Sat, 30 Jan 2016 11:47:52 -0500
Received: by mail-lf0-x243.google.com with SMTP id n70so5192412lfn.1;
	Sat, 30 Jan 2016 08:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=AFXXZkVZBxRpf3BFlfgm4rBFW5cpD7UWoUGGqqK7NNs=;
	b=NBJFYd9Xua0kASHIP3wcp//KGz724EwUhiUDNLHWxZzy6YucpIoF267lXs/tUOy0a2
	Xeos73dk6wFw+fcuMCMFNjP/sQ+RKdkIQp21qkewfTHz7eZvWNjSDMEv6Zc7pMf0RTBb
	ZVYWPT3ZYlvyhrbqUiFpUGl7aVheVFI/BFj5+GEvUY3fn9dqnwqHHXy56ybg5EvFzXWB
	2WQVR1zfRjxYOOaeL4qjXCynzEPnMf1wcKBPmU38g9DK5Wk/xCueVfQ7koh+H7UUF0Tl
	x7grRVB0QoTt4bUxhKsMnZP/y6N8i3Iz6/mHJNLIhWWJPPhxAT9dJ86dTlOnaHatOiwO
	TxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=AFXXZkVZBxRpf3BFlfgm4rBFW5cpD7UWoUGGqqK7NNs=;
	b=K5ZdJ+s5OdHMug3RqKVcR0iQ7A6IpFxAz58EgFUVrVdJvJlZPudNJWaZ72xHEU8CEW
	RDZTX/3HfC+ss6HR6IbBMiUAPiHSB0Mmgh+ZJ21sKgYjpQPhQ+7IDOKIfqxy+2ietw7S
	67BTw1++kSbjkarGHgY66LDXWZ19B4UHiuVSq4D9mr9tHv3+cqxudcZFoY3QQBJegzPn
	HY5zF4U1g7HM+VrtVdrFKgndc0VVMoGmesBoViItKA0+7sWLs7ebimOrUhzxq8rxV7+M
	OunzmS4/VKWlko0uYaAthAWtluScU/OdnEdYVEP5EYvgfKZ7PVSstzdSo9W8vW+cPiwJ
	0LaA==
X-Gm-Message-State: AG10YORSTQ+jRGaS+z05W5+UilAgVZUDhFUqxGCuAKmpZw9X8lWcqZmPmGmZESi3uxFOJQ==
X-Received: by 10.25.7.10 with SMTP id 10mr4281908lfh.107.1454172471832;
	Sat, 30 Jan 2016 08:47:51 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:51 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:14 +0300
Message-Id: <a7573ef06360990fcd57b01618f56d99aabd46ef.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v12 5/9] hw/ptimer: Introduce ptimer_get_limit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KWJJhb/j0D+g

Currently ptimer users are used to store copy of the limit value, because
ptimer doesn't provide facility to retrieve the limit. Let's provide it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c    | 5 +++++
 include/hw/ptimer.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 78ae443..bf62fdd 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -224,6 +224,11 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
     }
 }
 
+uint64_t ptimer_get_limit(ptimer_state *s)
+{
+    return s->limit;
+}
+
 const VMStateDescription vmstate_ptimer = {
     .name = "ptimer",
     .version_id = 1,
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 8ebacbb..e397db5 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -19,6 +19,7 @@ typedef void (*ptimer_cb)(void *opaque);
 ptimer_state *ptimer_init(QEMUBH *bh);
 void ptimer_set_period(ptimer_state *s, int64_t period);
 void ptimer_set_freq(ptimer_state *s, uint32_t freq);
+uint64_t ptimer_get_limit(ptimer_state *s);
 void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload);
 uint64_t ptimer_get_count(ptimer_state *s);
 void ptimer_set_count(ptimer_state *s, uint64_t count);
-- 
2.7.0

