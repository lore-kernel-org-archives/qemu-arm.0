Received: by 10.25.44.15 with SMTP id s15csp4840969lfs;
        Mon, 17 Jul 2017 09:52:38 -0700 (PDT)
X-Received: by 10.55.16.4 with SMTP id a4mr28153677qkh.40.1500310358686;
        Mon, 17 Jul 2017 09:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500310358; cv=none;
        d=google.com; s=arc-20160816;
        b=Nker0qBlcJ9hS5Mu7OgFY8b2+VFyJSzd43gsRRCO6TtAP6HJH54ePL0kQaelrm3Xig
         FQHgXfBHVGcqKC2Bbym4KY/81fez+5WM4udR2lhHgoUEAHeqKM9GuTZ/Y/IasvF5jH5b
         MwbOFjRkRCKPomhJZheR6kgKu0yVGAGg1UmZfmX4SNCxEJCbVLL45eENYHEPPvw75JM/
         NAiUcc70T39EqFOIgW942xj2NGIvfqWxOqJVg3rgB3JGhpUE+2nzu2dlBw3vbdL3Hetz
         UXXDhu/+F9Ih4Gzfcs66xjPn4PY+x2KzNa1eAsgnCj8wHS8FtJbu/VHJMy7u2Kxaedzk
         RO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=GZGVGunsGtske2AH3ceH6gb0tB+CPMNDABLjXDOGAdY=;
        b=RUZVNjskfSdn0DtqPsih3bipwcZLpB8ay7QGlGBKnq/MTltlxLq11po5a8lyqN17Ko
         vZD03dr6VHk4J0Z2on9nZrlg8jDfCctRcz8UJsUP9pB2ulFFKKqM2QCEhiX7lMjulkI5
         JuUMMcjlq4J14xfGCx/lZ7obA5DU3X1b7Mu2Cmq5/sRk4SvbUWPn6BQWV+ODKhuxZehR
         khSpzlzWiq+cUz4B31umvhjobE/TJGMF4Thi+l+RwO+KABLHUrClSKd4U6LjcttjLVyL
         eSPkiMZDU5TkcuTgjKsef37B0ApRExdLmyHVVqzT3z4X7dI0z0BIgqpeSj92CpTZOlxg
         ycFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w67si15067885qka.296.2017.07.17.09.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Jul 2017 09:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dX9G8-0006Q7-3U
	for alex.bennee@linaro.org; Mon, 17 Jul 2017 12:52:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dX9Fy-0006Q1-UU
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 12:52:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dX9Fy-0000xG-3E
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 12:52:27 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37647)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dX9Fx-0000wO-TD; Mon, 17 Jul 2017 12:52:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dX9Fu-0003nD-Gm; Mon, 17 Jul 2017 17:52:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 17 Jul 2017 17:52:21 +0100
Message-Id: <1500310341-28931-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10] integratorcp: Don't migrate flash using
 vmstate_register_ram_global()
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33J1Zzctu/Pb

Instead of migrating the flash by creating the memory region
with memory_region_init_ram_nomigrate() and then calling
vmstate_register_ram_global(), just use memory_region_init_ram(),
which now handles migration registration automatically.

This is a migration compatibility break for the integratorcp
board, because the RAM region's migration name changes to
include the device path. This is OK because we don't guarantee
migration compatibility for this board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/integratorcp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index d79221d..d9530ed 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -276,9 +276,8 @@ static void integratorcm_init(Object *obj)
     s->cm_init = 0x00000112;
     s->cm_refcnt_offset = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), 24,
                                    1000);
-    memory_region_init_ram_nomigrate(&s->flash, obj, "integrator.flash", 0x100000,
+    memory_region_init_ram(&s->flash, obj, "integrator.flash", 0x100000,
                            &error_fatal);
-    vmstate_register_ram_global(&s->flash);
 
     memory_region_init_io(&s->iomem, obj, &integratorcm_ops, s,
                           "integratorcm", 0x00800000);
-- 
2.7.4

