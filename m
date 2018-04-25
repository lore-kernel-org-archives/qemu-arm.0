Received: by 10.28.4.212 with SMTP id 203csp877173wme;
        Wed, 25 Apr 2018 07:20:55 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq3VYc+8v0vfm4vpaa5AWCi3bF/1wIwSBqfMxwywLRYxWSHU3cghfKcD/sl85F9LWKiibdq
X-Received: by 10.12.193.42 with SMTP id f39mr8187176qvh.203.1524666055879;
        Wed, 25 Apr 2018 07:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666055; cv=none;
        d=google.com; s=arc-20160816;
        b=EkyjHEI87tLvAenHWFmJ79Vx1T+/13qtmSkU+mNqBxANpsO1R53+gXMEofPdxzYbte
         bkx4ryl5NeArUL60ri9xhkIxQC7VUSTYKBhaYupN2D2aObmaGkczFagOuqKVYv4pyrb0
         onzDBBb7oE4m4VMWC7KB2P5/+cRfTx0IaQFjgLJ0qBTS9JUgSFsNcqIm04CMOMOJ6Gzy
         l8V/h8NK09WUflN9kfs9qyuplcLm4Hk8zZXLtARfcW9P+XRH52aEFh4r9g0UCI4BRVq0
         pVxudyIedGa/PYZPt+zgrW59ARtM40ZBcxE3tGEYBQplKWf/kouGFD6PloPkWYUELMoD
         8G6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BMJ2MqZNJgUNFmqAP5h4bHvYMn91XkWzssivW3Pe8gk=;
        b=fcAsPE5QE10K2HrznQtUePYXKCmF/GVOGJ14lGk3JZuPj+xxrZacQUtlN8uGpywLFE
         +o+sQHONmxle/F3aZK0ahTFdoBEFbqQeTB/Uf8hFl0XHHvZLK0a8CsSvd5AMlL4+EztL
         rtsQbm8YTrSDKK6fMBpH3wZh1ROEQiqmudr9xCRNRZCjxcqnKOZMwWOPQBu8ysexu7Vc
         whKSMH2ES6TIGz6h/YAP+vC6P8r62XQYwbrnG0+LoLnw/2ZO2HR6SHzCGKdoDg42gbk+
         +fds5GoLW45vEm/7VEtPnCGBrMc8MTW6ipM5n1+7zPq5ktENKkxeXt2M2P6RqyThmLte
         8yYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9si973063qkl.203.2018.04.25.07.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLHz-0003dI-9I
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:20:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDh-0000Xf-GW
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDg-0005p8-DK
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:16:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43340 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLDg-0005os-8w; Wed, 25 Apr 2018 10:16:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D872BEC011;
	Wed, 25 Apr 2018 14:16:27 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F8BA2023239;
	Wed, 25 Apr 2018 14:16:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:50 +0200
Message-Id: <1524665762-31355-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:27 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v12 05/17] hw/arm/smmuv3: Wired IRQ and GERROR
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
X-TUID: wvGmcWouuwpo

We introduce some helpers to handle wired IRQs and especially
GERROR interrupt. SMMU writes GERROR register on GERROR event
and SW acks GERROR interrupts by setting GERRORn.

The Wired interrupts are edge sensitive hence the pulse usage.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v11 -> v12:
- added Peter's R-b

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
 hw/arm/smmuv3-internal.h | 14 +++++++++++
 hw/arm/smmuv3.c          | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events      |  3 +++
 3 files changed, 81 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 8da38d4..e27c128 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -139,4 +139,18 @@ static inline uint32_t smmuv3_idreg(int regoffset)
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
index b61f274..c0cedca 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -31,6 +31,70 @@
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

