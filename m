Received: by 10.223.159.74 with SMTP id f10csp2422928wrg;
        Mon, 11 Dec 2017 02:56:16 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaZXFWY5kv1ToFvHMXCtZGI27MW5NwgZ0mfu9XsHEy1+0yG8IkLoE/GHAArYSoY4RKiIjhj
X-Received: by 10.129.222.9 with SMTP id k9mr27248222ywj.47.1512989776205;
        Mon, 11 Dec 2017 02:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512989776; cv=none;
        d=google.com; s=arc-20160816;
        b=BxnuVdO+/8p5cCf4ldqDBSEWZHgu9s4CverTWCKb5mn+VTLXUeQVJ3NLxmZYeTVXYr
         gTdhq5NZz38ITwTxSOLDN2Yhln9umuA1zjyb78VvVpePuWunKTVneLncGDsGomVLzaK1
         1k34fJQuUUYiaFqesgxjcpm3Qm8zXiQ1/i5hqpp6IpN6gIEU5N5dzKXpQCsQz7TlL85o
         VM2rvIOkLAm6nrVDzfD7OKTCfKlB4yV8MEtCsiZ7p9/lzqxaM+u+sZBi3bOKdzLajMEg
         ZXmiwB7Q981rteauF+GMvoo557Yi4NFALVAZ9Hv7Ay0dE6Ov4tX87ncSPuACQHZ2Qxj2
         17dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=yo82Qc9hu61YtJs77gZIaxp70PrHQ7+d5ozzjYtKSDc=;
        b=V3vwZaSlJMO3PFVYHi8IQ28iZFU6LqAxUJizGWg52KCsaeMrjub95PZJ0kT/HQzms9
         XPXq9CgLOj6XaGDSnWzmlwHDj4tasInlP5yEAvGKNkw1vnSb8gzljXwVUG36fJbEJcAP
         44CksACu7B8PCvM3KeHCXZnPpjZJcrGmaHurOuUpMod0dnGOMwPGT6r7qOfWA2d1x75x
         Y8z6Jvtdxc7od55/3ktleR3lC5cZ4N8uqmAZWHsS/6/M50vMkGMtC47Lmn6OIEoATy7R
         D0RG23li5V3/WnyDWF9y4h+ydsYa1WUiD6rzBZAwOHyAbo2+aJsB1iNT7YsbIz+4hDZW
         TA8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q133si2916497ywb.245.2017.12.11.02.56.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 02:56:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOLkt-0005bu-NN
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 05:56:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eOLki-0005bn-R0
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 05:56:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eOLkf-0001wX-Ox
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 05:56:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58900)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1eOLkf-0001uy-Iz; Mon, 11 Dec 2017 05:56:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 488AD6A7C1;
	Mon, 11 Dec 2017 10:55:59 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-44.bne.redhat.com [10.64.54.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1BA717515;
	Mon, 11 Dec 2017 10:55:54 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Mon, 11 Dec 2017 16:25:46 +0530
Message-Id: <20171211105546.16466-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 11 Dec 2017 10:55:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] display: check irq handler index before access
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Moguofang <moguofang@huawei.com>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9BB+yS0okE4a

From: Prasad J Pandit <pjp@fedoraproject.org>

The ctz32() routine could return value greater than
TC6393XB_GPIOS=16. This could lead to an OOB array access.
Add check to avoid it.

Reported-by: Moguofang <moguofang@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/display/tc6393xb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 74d10af3d4..78292cb847 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -175,6 +175,10 @@ static void tc6393xb_gpio_handler_update(TC6393xbState *s)
 
     for (diff = s->prev_level ^ level; diff; diff ^= 1 << bit) {
         bit = ctz32(diff);
+        if (bit >= TC6393XB_GPIOS) {
+            fprintf(stderr, "TC6393xb: no GPIO pin %d\n", bit);
+            return;
+        }
         qemu_set_irq(s->handler[bit], (level >> bit) & 1);
     }
 
-- 
2.13.6

