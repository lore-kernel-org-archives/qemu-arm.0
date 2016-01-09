Received: by 10.25.134.130 with SMTP id i124csp1101278lfd;
        Sat, 9 Jan 2016 09:44:44 -0800 (PST)
X-Received: by 10.55.75.144 with SMTP id y138mr61523430qka.96.1452361484482;
        Sat, 09 Jan 2016 09:44:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8si27885695qgf.2.2016.01.09.09.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 09:44:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41773 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHxZE-0006wO-5E
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 12:44:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXP-0003JH-Ho
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 12:42:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXO-0000jP-77
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 12:42:51 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aHxXL-0000hS-LI; Sat, 09 Jan 2016 12:42:47 -0500
Received: by mail-lf0-x243.google.com with SMTP id z62so2165055lfd.0;
	Sat, 09 Jan 2016 09:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=q6ZONjxJsW+0kRQlATejY1hf2hilbO3k2YXM4UNAWFM=;
	b=z1ANECd2fX+KrT03Z+Gf4KpVNalq7AbpWUO3xrqNLmdox5fRIXxVFu5hKZug0WsBLw
	nHVz44FiL/Mrr19RGwNQHblilctb5aBof3pCw8VixDcUz6Th7zY6+jGvvnSiJBF2xNda
	/8VkVUggSnw4neS2kwT7TUI7Ooqfd2TCGMBWKhjx8t8j0qYIMi11nyQtPekMffHw5PIE
	2wB+x3znoGo8VCYPILO6uQ0720PcPZaj+1GxJIS4nw8Xu469NB9RKKjx5T384oVZxqVi
	nyVZWGuWlk9DAyNWT36LW9Pvl0RJPMOhHBEFi+Cb82/C3Mz3GfEGSUxlgQRZUPNxO4Qx
	nh8w==
X-Received: by 10.25.18.66 with SMTP id h63mr34830792lfi.11.1452361367055;
	Sat, 09 Jan 2016 09:42:47 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	f186sm8406450lfd.26.2016.01.09.09.42.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jan 2016 09:42:46 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat,  9 Jan 2016 20:39:54 +0300
Message-Id: <112f8a3527ada5a92ec851b5c6c2d8e5b84d6d0b.1452359845.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-arm] [PATCH v10 6/7] hw/ptimer: Introduce ptimer_get_limit
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
X-TUID: A21HA4pitJ+M

Currently ptimer users are used to store copy of the limit value, because
ptimer doesn't provide facility to retrieve the limit. Let's provide it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 5 +++++
 include/hw/ptimer.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 42e44f9..0201d1b 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -235,6 +235,11 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
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
2.6.4

