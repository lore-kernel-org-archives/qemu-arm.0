Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1515668wrq;
        Thu, 12 Jul 2018 08:42:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdPXiiGhEXu1Rh8m3NgeXTHFeVwYz7rXI/PDuv5k9LNsFZLPwqXlPsybKHNwGnz/sTzT+ZH
X-Received: by 2002:ac8:2b23:: with SMTP id 32-v6mr2435189qtu.119.1531410138659;
        Thu, 12 Jul 2018 08:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531410138; cv=none;
        d=google.com; s=arc-20160816;
        b=vPpY4CE5RyP1ycaF6LV0blSZaFW8XQPEXiO/9wsgypQR0a44YpYAqWAJL6A/YpPwFu
         uM6hZa1SgPpmVvOXl+Gd4zFT4auzkYiEvwcXqZsukFp9lI7Glon8cL6c5GfQGa8CmqPK
         hQUQxUEscBgVho1MnFHMvrygCi9p6U0JeXwYg2mhpMOJWUARWiJmeMSWw44zS5kf4b58
         RQjesLkVgk6AusSqLEjd4aSnb2UQ/d7+ycDSGzj+5yce/BMEYb/1Zd3/kHwI8e3+5D9Z
         nqJjZoz45hQ4n26hKg2Owf67OXUQVd3dVwwsPXYIPS1rwKxE6Y/VvwblRIyb8izFzaCf
         m3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Synm6rndvSmMJH3jLEKBz7LKYrjqBi+LcWwf96lel0I=;
        b=HN/uYtFqmo+Te8zJ2WCMmQiqu+XUeMMWttFGvwvXMtDLHyDyXVmAtUEAMQq3tzNthr
         c3rN79DtCIXb2JO6sN3foft7z1+ySd+x+dv+faTMibf/RxHRaGMdE/tBaDUX81+VU/mR
         7lP4FRGSdgzpIScrk6aUMqJh2iKkpOZTL8jDzXa46vw6P6lyIcZr0wujGoWyfC46Jzsz
         29eCg5BZKNvD7UB7jaixmICkq5OPbVRQVq6szE6irKSsJOpwjPYKOz/iQ2rxdVI0KxUV
         ysIx0vxaXZ5zLYbKGtXN9zb289YAd4ArukEBLm1RxaxZFAT1L9s2cilvBKp7HqCHVO4a
         kMqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14-v6si5688442qkh.182.2018.07.12.08.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:42:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddjW-0004cX-4P
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:42:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fddjI-0004ai-U3
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:42:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fddjH-0008Pc-VQ
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:42:04 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43486)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fddjH-0008GP-OT; Thu, 12 Jul 2018 11:42:03 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fddj8-0003qR-9G; Thu, 12 Jul 2018 16:41:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 12 Jul 2018 16:41:51 +0100
Message-Id: <20180712154152.32183-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180712154152.32183-1-peter.maydell@linaro.org>
References: <20180712154152.32183-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 1/2] hw/intc/arm_gic: Check interrupt
 number in gic_deactivate_irq()
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
Cc: Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yAkgoG3oWdoH

In gic_deactivate_irq() the interrupt number comes from the guest
(on a write to the GICC_DIR register), so we need to sanity check
that it isn't out of range before we use it as an array index.
Handle this in a similar manner to the check we do in
gic_complete_irq() for the GICC_EOI register.

The array overrun is not disastrous because the calling code
uses (value & 0x3ff) to extract the interrupt field, so the
only out-of-range values possible are 1020..1023, which allow
overrunning only from irq_state[] into the following
irq_target[] array which the guest can already manipulate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index ea0323f9691..b0a69d6386e 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -543,7 +543,21 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
 static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
     int cm = 1 << cpu;
-    int group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
+    int group;
+
+    if (irq >= s->num_irq) {
+        /*
+         * This handles two cases:
+         * 1. If software writes the ID of a spurious interrupt [ie 1023]
+         * to the GICC_DIR, the GIC ignores that write.
+         * 2. If software writes the number of a non-existent interrupt
+         * this must be a subcase of "value written is not an active interrupt"
+         * and so this is UNPREDICTABLE. We choose to ignore it.
+         */
+        return;
+    }
+
+    group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
 
     if (!gic_eoi_split(s, cpu, attrs)) {
         /* This is UNPREDICTABLE; we choose to ignore it */
-- 
2.17.1

