Received: by 10.28.91.67 with SMTP id p64csp3780146wmb;
        Tue, 20 Mar 2018 05:41:43 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuuHfMDUIhPMxZcXUZ5PCNiJRIDMrphbKuc/EBBws92yTEiQ/Wl0dkbUR+/06xIWklkZz+k
X-Received: by 10.200.62.154 with SMTP id y26mr23803279qtf.13.1521549702954;
        Tue, 20 Mar 2018 05:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521549702; cv=none;
        d=google.com; s=arc-20160816;
        b=WQM9+nygMPZ9RQTsQjKg5VACbvMtdfMq3MUp0QrqOVuUh9U95McydzqXP6kt9gPBCl
         68DWhln4tZNtzKp5N54TJzvtPOaWt/wBn6fQJ96G4nhl6Hk05BAMLELpTbwZQKO/mTyh
         VWvaMKdQEZ2J4byS6oNWTrigyUlIZjbg/YwSe8cxApuKhbxyrkA0nHq2MgpGdTSevgNI
         ftRCbhuajxKGVi0bxQHWyBGUoxmkO9tYTlkvQSP9jJc05wTanG7kSlrv2vZvFFEPyBm/
         6lMlhVFcqNL+mDZyXMvEujhSiJeVixrYyLFf9WaPNrYLGlxV2iEu7NW7DOcMadteXh3k
         dESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=V6FAuJLVkE9WPIop6X/+LNDuVn5gCJbY1mKkxQSGgGA=;
        b=R0ajZkeB2TAtVyDdZ46x5lTXKzfSwc57RZG7oxkYkbXG9GW5WCkUaijwAMqpjSz7hB
         TTJruKpssQqky6ip8Bz+vxGhX+K/uNA6OIn8fhwVciA3qQIYDVjSB++ksE3WIPU8mfC8
         LY1X+8aP+mkYOsJFThVAjAjhrgMGCcN/+BEHoCIOSyelkVk38MlcTa9uSFV+rM0KrWjx
         ZPFTYL9GOTtN61kt/JwNv1tLEIIafQo82o1Jwepn4UzxqP72UrsTSIRYqNGxMoLvZ4P9
         wJ9N4F1rNBoJL7aCwlJ2+/PHvT1obG9UKcfTS5eqQgrIkBu+IqvaVV6aV2na4ye3XDQ6
         sTxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t124si2815070qkb.430.2018.03.20.05.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGaE-00025m-Cu
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:41:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWw-0007Or-Sy
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGWu-0003Kq-FN
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38464 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGWu-0003KD-7f; Tue, 20 Mar 2018 08:38:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88BBE4025F15;
	Tue, 20 Mar 2018 12:38:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE5E36F9D9;
	Tue, 20 Mar 2018 12:38:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:27 +0100
Message-Id: <1521549456-14072-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
References: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 12:38:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 12:38:15 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v10 05/14] hw/arm/smmuv3: Wired IRQ and GERROR
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1CP7xHWKtYPo

We introduce some helpers to handle wired IRQs and especially
GERROR interrupt. SMMU writes GERROR register on GERROR event
and SW acks GERROR interrupts by setting GERRORn.

The Wired interrupts are edge sensitive hence the pulse usage.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>

---
v9 - v10:
- s/hwaddr/uint64_t in trace-events
- use qemu_log_mask LOG_UNIMP on PRI IRQ
- add a comment saying smmuv3_trigger_irq and smmuv3_write_gerrorn
  will become static later on
- write gerrorn without filtering (ie. even if the guest toggles non
  active IRQs)
- pulse if at least one new IRQ type
- smmuv3_eventq_irq_enabled and smmuv3_gerror_irq_enabled become
  static inline

v7 -> v8:
- remove SMMU_PENDING_GERRORS macro
- properly toggle gerror
- properly sanitize gerrorn write
---
 hw/arm/smmuv3-internal.h | 36 +++++++++++----------------
 hw/arm/smmuv3.c          | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events      |  3 +++
 3 files changed, 81 insertions(+), 22 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index a6461fe..32f81d4 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -129,28 +129,6 @@ typedef struct Evt  {
     uint32_t word[8];
 } Evt;
 
-/**
- * smmu_read64 - 64-bit register read utility function supporting
- * aligned 32-bit word access to both 32-bit halves and aligned 64-bit
- * access.
- *
- * @r: register address
- * @offset: byte offset if 32-bit access
- * @size: read byte size
- */
-static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
-                                   unsigned size)
-{
-    if (size == 8) {
-        return r;
-    }
-
-    /* 32 bit access */
-    assert(!offset || offset == 4);
-
-    return extract64(r, offset << 3, 32);
-}
-
 static inline uint32_t smmuv3_idreg(int regoffset)
 {
     /*
@@ -164,4 +142,18 @@ static inline uint32_t smmuv3_idreg(int regoffset)
     return smmuv3_ids[regoffset / 4];
 }
 
+static inline bool smmuv3_eventq_irq_enabled(SMMUv3State *s)
+{
+    return FIELD_EX32(s->irq_ctrl, IRQ_CTRL, EVENTQ_IRQEN);
+}
+
+static inline bool smmuv3_gerror_irq_enabled(SMMUv3State *s)
+{
+    return FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN);
+}
+
+/* public until callers get introduced */
+void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
+void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3472163..990c02e 100644
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
+        qemu_log_mask(LOG_UNIMP, "PRI not yet supported\n");
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
+        pulse = smmuv3_gerror_irq_enabled(s);
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
+
+    if (toggled & ~pending) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "guest toggles non pending errors = 0x%x\n",
+                      toggled & ~pending);
+    }
+
+    /*
+     * We do not raise any error in case guest toggles bits corresponding
+     * to not active IRQs (CONSTRAINED UNPREDICTABLE)
+     */
+    s->gerrorn = new_gerrorn;
+
+    trace_smmuv3_write_gerrorn(toggled & pending, s->gerrorn);
+}
+
 static void smmuv3_init_regs(SMMUv3State *s)
 {
     /**
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 2f3d74a..b77f8d2 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -15,3 +15,6 @@ smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "base
 
 #hw/arm/smmuv3.c
 smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
+smmuv3_trigger_irq(int irq) "irq=%d"
+smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=0x%x, new GERROR=0x%x"
+smmuv3_write_gerrorn(uint32_t acked, uint32_t gerrorn) "acked=0x%x, new GERRORN=0x%x"
-- 
2.5.5

