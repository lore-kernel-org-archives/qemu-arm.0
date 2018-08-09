Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1874606wru;
        Thu, 9 Aug 2018 06:03:58 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzwHzkUNS2VCnumWcAYDoSsq7MipVpKDJZHP4kNItlR3vbCtWVYi+pia+NQ2vLg7bJIlv8u
X-Received: by 2002:ac8:3226:: with SMTP id x35-v6mr1918669qta.21.1533819838911;
        Thu, 09 Aug 2018 06:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819838; cv=none;
        d=google.com; s=arc-20160816;
        b=CRKjTA3AltWyHmATMbgoFhnIm4w9S4jdv2R2x3mRdzzfK7Nh8dWKyZFDlqfw0LWHlx
         MdTz5pWPgU9k2UCUbl0p87SwpXpiw8eHeOF7QlxytgigBAbXlFG2nFbtFumiNBxGassY
         L+yN5EN+lo22nBpJrjOxQn+aav8HAp9MJQ7pkr700psptBPNBkTlvJ6x/Vl4B7q4Rn4L
         DyrnMhXbgmrW8+iAAG9HoiblsNWVeHASEIltxeQcWDHVnyT9QSp7l5bkjg/4bgojEy7e
         QeyTbSGSDLfAPZVy8tKLrX/EryGUFt6jgeI3dgQlKDDgo8u/nTOa99AKFx7Vccbn0P0s
         YVGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=hka9hIxdADblY+Ix/TAYRt8XYcW42JEeyxKN78kg7C4=;
        b=CurYaYv/p7hbSaDwH9BBv1i2Hqe3cp/kMNxaMaNwkRlBKWVA3wsZBrWckwmUb3lrDy
         d4Y4JFDJy+YdzVBw7/Xj7t2uefUk8MR4UjEROGxpjwWNhTAVRsK8PqFX5Nd7iATocHC4
         2aQC8MEgMwDM87oSzdMxUuVRZqWcDM5bsnsweGbXOQUo4b7tmy6oFatYBQFg5pRM3kEa
         IzYnhQgKuBphGhaQEcncvRhB6niZuixrCIBLnNJbltVxJhObE19BShfUwFQcfd9CRM9r
         zenkKXzUgW4h1TT8m53OO1lY/fYxe9O0ysGgk3RfA7ZaDo62JKn0y0ltZvDR9vQDCktI
         MDaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7-v6si6977988qta.91.2018.08.09.06.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkbe-0007n0-En
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:03:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZI-0005ug-T6
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZG-0003I9-KQ
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44220)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZG-0003Hp-CR; Thu, 09 Aug 2018 09:01:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZF-0003Jc-Ba; Thu, 09 Aug 2018 14:01:29 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:10 +0100
Message-Id: <20180809130115.28951-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 11/16] hw/dma/pl080: Support all three interrupt
 lines
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
X-TUID: zzDZgvBhIFyM

The PL080 and PL081 have three outgoing interrupt lines:
 * DMACINTERR signals DMA errors
 * DMACINTTC is the DMA count interrupt
 * DMACINTR is a combined interrupt, the logical OR of the other two

We currently only implement DMACINTR, because that's all the
realview and versatile boards needed, but the instances of the
PL081 in the MPS2 firmware images use all three interrupt lines.
Implement the missing DMACINTERR and DMACINTTC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/dma/pl080.h |  6 +++++-
 hw/dma/pl080.c         | 13 ++++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/hw/dma/pl080.h b/include/hw/dma/pl080.h
index 7deb46c8578..7c6a4184833 100644
--- a/include/hw/dma/pl080.h
+++ b/include/hw/dma/pl080.h
@@ -17,7 +17,9 @@
  * http://infocenter.arm.com/help/topic/com.arm.doc.ddi0218e/DDI0218.pdf
  *
  * QEMU interface:
- * + sysbus IRQ: DMACINTR combined interrupt line
+ * + sysbus IRQ 0: DMACINTR combined interrupt line
+ * + sysbus IRQ 1: DMACINTERR error interrupt request
+ * + sysbus IRQ 2: DMACINTTC count interrupt request
  * + sysbus MMIO region 0: MemoryRegion for the device's registers
  */
 
@@ -57,6 +59,8 @@ typedef struct PL080State {
     /* Flag to avoid recursive DMA invocations.  */
     int running;
     qemu_irq irq;
+    qemu_irq interr;
+    qemu_irq inttc;
 } PL080State;
 
 #endif
diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 0f79c2d8a6c..301030dd118 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -75,11 +75,12 @@ static const unsigned char pl081_id[] =
 
 static void pl080_update(PL080State *s)
 {
-    if ((s->tc_int & s->tc_mask)
-            || (s->err_int & s->err_mask))
-        qemu_irq_raise(s->irq);
-    else
-        qemu_irq_lower(s->irq);
+    bool tclevel = (s->tc_int & s->tc_mask);
+    bool errlevel = (s->err_int & s->err_mask);
+
+    qemu_set_irq(s->interr, errlevel);
+    qemu_set_irq(s->inttc, tclevel);
+    qemu_set_irq(s->irq, errlevel || tclevel);
 }
 
 static void pl080_run(PL080State *s)
@@ -352,6 +353,8 @@ static void pl080_init(Object *obj)
     memory_region_init_io(&s->iomem, OBJECT(s), &pl080_ops, s, "pl080", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
+    sysbus_init_irq(sbd, &s->interr);
+    sysbus_init_irq(sbd, &s->inttc);
     s->nchannels = 8;
 }
 
-- 
2.17.1

