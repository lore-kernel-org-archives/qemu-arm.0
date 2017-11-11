Received: by 10.223.150.237 with SMTP id u100csp402341wrb;
        Sat, 11 Nov 2017 00:11:31 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaB004Nr9GBHVGWMaYq8z7Go0jN4aqr+6Yr8lXg624434RKvLHyN343NbABo1b2r+Q0XNTI
X-Received: by 10.129.128.1 with SMTP id q1mr2019014ywf.436.1510387891253;
        Sat, 11 Nov 2017 00:11:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510387891; cv=none;
        d=google.com; s=arc-20160816;
        b=BpjIptIlCwcMd6eS6pdhQfeYYqlpNR991y3gLQA0V5Sa/ahWaYRx9f0OdOQ8S970L8
         PQ0F/uOQW4edeZq+kNztgZGqique/fmErTTLT0qeaAlhwMkmhNSUvQ39nIlnlzkObtBq
         koVIGwL9CbILNjo8r/twWRNp9pO9ZIjq/FzZCLyBmmW/nIjwWqAhHL2ydn7k/IGHb29u
         31ehKDYPC89+/Bh0ceqb6eor3y9WVp7yFhY9rzm2MzLXPgGasI0Cv6uNLabo6qBW2P8R
         jMBw5Ui5YvT3FOPSP5Nw0WgS/RPonQnjpwxLJTuMYS88vxE01PKqDd5JVG4QSXhMg+Kl
         eOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=znLr00WbAzQcN2t3FZn7Te6Gl5U2l9hgzeKWhZxw+oE=;
        b=jId2kqL962P5xCg3g5Y/KHz0cDypTGT9TvqMpYKsfwz9ZSF8Zfj98fQtIXioeK46XI
         LoZxobPMBASKCLpqTI7pCLzGIFw4FnOBB2eopXqnFLr8hYYxcEvh7SXUChjjoGnd2szM
         Jrtkkp2Gzki6Iuiq/KBI+0yNc1vB/qNvA1Z0tv7itxhDHwUQgTLzluAF+cl36Rr0u4AW
         /WME4YcBvaFESgYaL3VjgC5alnb1A4nso0/0W5iz9S6ZfHU3dCzr0fSQVnlCIMidq7Br
         719CzBI5kBJGa270aexy7iRpeCG2qXsKXVhxr6XlKNq+JFYXiv1hon78C/VFZhOEssoe
         JEOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u124si2625063yba.51.2017.11.11.00.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 11 Nov 2017 00:11:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDQt0-0006RF-M3
	for alex.bennee@linaro.org; Sat, 11 Nov 2017 03:11:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eDQsu-0006R7-9k
	for qemu-arm@nongnu.org; Sat, 11 Nov 2017 03:11:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eDQsr-0006dj-32
	for qemu-arm@nongnu.org; Sat, 11 Nov 2017 03:11:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36514)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1eDQsq-0006dC-TD; Sat, 11 Nov 2017 03:11:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD5A26A7E6;
	Sat, 11 Nov 2017 08:11:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-27.ams2.redhat.com
	[10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 404375D6A5;
	Sat, 11 Nov 2017 08:11:14 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Sat, 11 Nov 2017 13:41:11 +0530
Message-Id: <20171111081111.32724-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 11 Nov 2017 08:11:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v1] highbank: validate register offset before
 access
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
Cc: Rob Herring <robh@kernel.org>, Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Shawn Guo <shawn.guo@linaro.org>,
	Moguofang <moguofang@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5I2KDV1WfJbb

From: Prasad J Pandit <pjp@fedoraproject.org>

An 'offset' parameter sent to highbank register r/w functions
could be greater than number(NUM_REGS=0x200) of hb registers,
leading to an OOB access issue. Add check to avoid it.

Reported-by: Moguofang (Dennis mo) <moguofang@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/arm/highbank.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

Update: log error message(via qemu_log_mask) before returning
  -> https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg01914.html

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 354c6b25a8..8494dc6a48 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -34,6 +34,7 @@
 #include "hw/ide/ahci.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/cpu/a15mpcore.h"
+#include "qemu/log.h"
 
 #define SMP_BOOT_ADDR           0x100
 #define SMP_BOOT_REG            0x40
@@ -117,14 +118,26 @@ static void hb_regs_write(void *opaque, hwaddr offset,
         }
     }
 
+    if (offset / 4 >= NUM_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "highbank: bad write offset 0x%x\n", (uint32_t)offset);
+        return;
+    }
     regs[offset/4] = value;
 }
 
 static uint64_t hb_regs_read(void *opaque, hwaddr offset,
                              unsigned size)
 {
+    uint32_t value;
     uint32_t *regs = opaque;
-    uint32_t value = regs[offset/4];
+
+    if (offset / 4 >= NUM_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "highbank: bad read offset 0x%x\n", (uint32_t)offset);
+        return 0;
+    }
+    value = regs[offset/4];
 
     if ((offset == 0x100) || (offset == 0x108) || (offset == 0x10C)) {
         value |= 0x30000000;
-- 
2.13.6

