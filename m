Received: by 10.223.150.237 with SMTP id u100csp2131065wrb;
        Sun, 12 Nov 2017 22:27:23 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaLO+qKJtgVtdcKRBWhRPfbWlcFYbAI/o7uhG2vUkZPANelxozhRkdPxQXfVFTjCZNtBxdA
X-Received: by 10.37.186.76 with SMTP id z12mr4904423ybj.274.1510554442902;
        Sun, 12 Nov 2017 22:27:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510554442; cv=none;
        d=google.com; s=arc-20160816;
        b=hwt/u0/dWk/V3jJwHEb/Yg8LfaM/QakU1bMndCqLkrCk3l8SXg+hQtFOLHCqwGdTWs
         vnCIMe3fEt0i6Pg2phn4O+z3Xhrqx9kFCdNjiswxqqfVWMVVlCN9QEjvANYdb+qgYJU2
         zbtczypaWhCPF3l+SURJUWZ9lfkHanQx6IdBXV7WmW5aTEEVhIdE/NGuVytDQJceBoh/
         RioZa3Xd96SEbYPgbymz8ORw1bAbCI/8Y0A8nDlLo8DqoK9NxOF0Tkf5Gycq5OHjMB9O
         6XyhijvW2XoQI2uuf5tMPTiR3lYtu0KaOUlCs6OodRjhw+006fyb2hgNi91x0ch2D8MN
         GU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=fY7OC0yWCt5SSBeaW9oVW+xZZyjwUIEjgozcvDRTVxk=;
        b=TKRL7Q6ew7/dts+j2S/ParE2RK/d7u+Ab1Vc87omNrHvHGmfDH5U8S76Zx87NmMJWa
         oIZMo1xbm3x/t+RDJy1tqNbCzP6WRPyO7KIQqTx3Pj5dZCOnngy7NTx1kJwwRwuieyl5
         G9yy2gsDIev/CyiNLIGSjRVziFVeAA2ulo2RB4othxN5ED1gxX/y8GsfSZyEVLAGCncg
         PMnbtIIcSD12hrVXbBWV8T2bXHe8B5Lx2wE+fd3XpkAtp+FR2KWVSJdWuW+X0jwjkuJ2
         RZ+Nbm00fZ5FP6Lj8FSZCOiROQnUo6WOieWSAd+SIkKPC0yKerqnSfS4CNDMmDI+4fsK
         bB1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r63si3345931ybf.621.2017.11.12.22.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 12 Nov 2017 22:27:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eE8DK-0003ED-6U
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 01:27:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eE8D8-0003E7-Sr
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 01:27:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1eE8D5-00069h-Li
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 01:27:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52326)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1eE8D5-00068w-F1; Mon, 13 Nov 2017 01:27:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 577E8C02C005;
	Mon, 13 Nov 2017 06:27:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.65.150.186])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 388535C301;
	Mon, 13 Nov 2017 06:27:01 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Mon, 13 Nov 2017 11:56:58 +0530
Message-Id: <20171113062658.9697-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 13 Nov 2017 06:27:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] highbank: validate register offset before
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
X-TUID: 8wzyhoBJghwW

From: Prasad J Pandit <pjp@fedoraproject.org>

An 'offset' parameter sent to highbank register r/w functions
could be greater than number(NUM_REGS=0x200) of hb registers,
leading to an OOB access issue. Add check to avoid it.

Reported-by: Moguofang (Dennis mo) <moguofang@huawei.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/arm/highbank.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

Update: use HWADDR_PRIx to print offset
  -> https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg02116.html

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 354c6b25a8..287392bbdc 100644
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
 
-    regs[offset/4] = value;
+    if (offset / 4 >= NUM_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                  "highbank: bad write offset 0x%" HWADDR_PRIx "\n", offset);
+        return;
+    }
+    regs[offset / 4] = value;
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
+                  "highbank: bad read offset 0x%" HWADDR_PRIx "\n", offset);
+        return 0;
+    }
+    value = regs[offset / 4];
 
     if ((offset == 0x100) || (offset == 0x108) || (offset == 0x10C)) {
         value |= 0x30000000;
-- 
2.13.6

