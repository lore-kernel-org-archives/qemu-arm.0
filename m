Received: by 10.28.71.27 with SMTP id u27csp2511800wma;
        Mon, 5 Feb 2018 05:42:19 -0800 (PST)
X-Google-Smtp-Source: AH8x2272VUq4YJD/d0KBt4vbFfkIbbDsC2AzUcBVRGpZk4NmzODseuqCGSzCQNcGFikjlPs+Q2DX
X-Received: by 10.129.39.84 with SMTP id n81mr32120998ywn.5.1517838139485;
        Mon, 05 Feb 2018 05:42:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517838139; cv=none;
        d=google.com; s=arc-20160816;
        b=FmbssDbvZ08AtJ+tU9kd63bW7nBTH6ZDZLZNYAfa1qVFMj/bjIf6Hq8rJvIa5/z9nQ
         RPMe3WyDuvHVxHMbcfQahDgJP82lWo8t1Zwv0nXuL8Ezpj5OUZpWXIJZv9LyMnyJQLkr
         u9Cs9HcWp4dhdkbsc+ycFUm4K7XqEjNdFzHxtmzZJOQiCVTCBZ45aEtRDThfCqlXwPEY
         h10EGB6uffqwnWUTMdgr+oRKPlR2p1lrr9IS8b2m2+rfKo0DI1OF6gZxun070/ix2K+P
         iS6H6XFmJclevJJmwT5YDC/8aRlfv5VSNiQCx8oOXUnwsXio16kLXNuSdNvV9mnffC5X
         pNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=u1s1n7vCeMR4GVBoWlw2e0UBw0JAH/12lLTBnSJ425w=;
        b=gycrMloN4G60+v22fUtzr8ECZrY4swR19l5xsGXwqtZWShYv+WPQBHQF53478ZlZ3q
         vTHhvNcimwJrnOEsjNsbRHxYkj66+qVWqAulTd1B02l1FnF7RPf1jHILwye4z38oebag
         JCyNGYbjspWlh0HgHvNkgnnXlt2dHDel0OmWGirMcqqZs1Me2Du5mjI5jYnNP+rrULSv
         474yPToFBnSMVkoVsI9013DXXqVD7EnuBUCPKWxrRRTAdy/N1uPw2oPK1zmthxSbnSvh
         OKDDn19yRLc/4FHqR4b3NdNYE8wexMoMlm47OAukm90E7B9Kvo8L2IooaaTo9o8BlSud
         MfFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g38si1518275ybj.387.2018.02.05.05.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 05:42:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eih2I-00068S-OP
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 08:42:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih1m-0005pa-Il
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:41:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih1l-0006ZW-9d
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:41:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52172)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eih1l-0006Z6-1v; Mon, 05 Feb 2018 08:41:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25F98C001F16;
	Mon,  5 Feb 2018 13:41:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB46017558;
	Mon,  5 Feb 2018 13:41:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Mon,  5 Feb 2018 14:39:23 +0100
Message-Id: <1517837972-1904-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
References: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 05 Feb 2018 13:41:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 05/14] hw/arm/smmuv3: Wired IRQ and GERROR
 helpers
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kuyEXdfocxOP

We introduce some helpers to handle wired IRQs and especially
GERROR interrupt. SMMU writes GERROR register on GERROR event
and SW acks GERROR interrupts by setting GERRORn.

The Wired interrupts are edge sensitive hence the pulse usage.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8:
- remove SMMU_PENDING_GERRORS macro
- properly toggle gerror
- properly sanitize gerrorn write
---
 hw/arm/smmuv3-internal.h | 10 ++++++++
 hw/arm/smmuv3.c          | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events      |  3 +++
 3 files changed, 77 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 84a15c1..72d9c6c 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -152,4 +152,14 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
     return extract64(r, offset << 3, 32);
 }
 
+/* Interrupts */
+
+#define smmuv3_eventq_irq_enabled(s)                   \
+    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, EVENTQ_IRQEN))
+#define smmuv3_gerror_irq_enabled(s)                  \
+    (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN))
+
+void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
+void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c9a13b0..6bad7e8 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -30,6 +30,70 @@
 #include "hw/arm/smmuv3.h"
 #include "smmuv3-internal.h"
 
+/**
+ * smmuv3_trigger_irq - pulse @irq if enabled and update
+ * GERROR register in case of GERROR interrupt
+ *
+ * @irq: irq type
+ * @gerror_mask: mask of gerrors to toggle (relevant if @irq is GERROR)
+ */
+void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask)
+{
+
+    bool pulse = false;
+
+    switch (irq) {
+    case SMMU_IRQ_EVTQ:
+        pulse = smmuv3_eventq_irq_enabled(s);
+        break;
+    case SMMU_IRQ_PRIQ:
+        error_setg(&error_fatal, "PRI not supported");
+        break;
+    case SMMU_IRQ_CMD_SYNC:
+        pulse = true;
+        break;
+    case SMMU_IRQ_GERROR:
+    {
+        uint32_t pending = s->gerror ^ s->gerrorn;
+        uint32_t new_gerrors = ~pending & gerror_mask;
+
+        if (!new_gerrors) {
+            /* only toggle non pending errors */
+            return;
+        }
+        s->gerror ^= new_gerrors;
+        trace_smmuv3_write_gerror(new_gerrors, s->gerror);
+
+        /* pulse the GERROR irq only if all previous gerrors were acked */
+        pulse = smmuv3_gerror_irq_enabled(s) && !pending;
+        break;
+    }
+    }
+    if (pulse) {
+            trace_smmuv3_trigger_irq(irq);
+            qemu_irq_pulse(s->irq[irq]);
+    }
+}
+
+void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
+{
+    uint32_t pending = s->gerror ^ s->gerrorn;
+    uint32_t toggled = s->gerrorn ^ new_gerrorn;
+    uint32_t acked;
+
+    if (toggled & ~pending) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "guest toggles non pending errors = 0x%x\n",
+                      toggled & ~pending);
+    }
+
+    /* Make sure SW does not toggle irqs that are not active */
+    acked = toggled & pending;
+    s->gerrorn ^= acked;
+
+    trace_smmuv3_write_gerrorn(acked, s->gerrorn);
+}
+
 static void smmuv3_init_regs(SMMUv3State *s)
 {
     /**
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 8affbf7..957a67e 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -17,3 +17,6 @@ smmu_set_translated_address(hwaddr iova, hwaddr pa) "iova = 0x%"PRIx64" -> pa =
 
 #hw/arm/smmuv3.c
 smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
+smmuv3_trigger_irq(int irq) "irq=%d"
+smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=0x%x, new gerror=0x%x"
+smmuv3_write_gerrorn(uint32_t acked, uint32_t gerrorn) "acked=0x%x, new gerrorn=0x%x"
-- 
2.5.5

