Received: by 10.28.71.27 with SMTP id u27csp2516738wma;
        Mon, 5 Feb 2018 05:47:55 -0800 (PST)
X-Google-Smtp-Source: AH8x225Jwvbqo3O/i+P5Mo2dKhNRE6Xn4SWVftH6gfBUAGkPYdzNeQlVi8U3WKO8lpV0U+IVsuOc
X-Received: by 10.37.65.216 with SMTP id o207mr14650131yba.96.1517838475725;
        Mon, 05 Feb 2018 05:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517838475; cv=none;
        d=google.com; s=arc-20160816;
        b=EohpSk3UwFd2c3PzWyGpNFu1z5MEyrvUKf7MrqZDqwZBqIW76KIwL8wyYrRuT+xybO
         yPwG2O/slH9+qLJoQq7dR3RRHiVrZGZUYTxCX5am2tcFV2V2t2cphubOOv/wlh5pDkD1
         SQE3OWF1x0FVWYsRUUjONJKOvGw6wunAM76/d8PvJ4JS3qulLUx4FVWiNQRVpi7n8xyb
         kghyQqj4R39iktIj/KH8wfCfJNbW0UUSsc5PNJkFIB1TFbvNOU2T8ITgz7PxEqasaE78
         vnNew+qvONDVz3m8UgDiJbZyc0acQDvYUerfvFDKOB3gtpHzWYX0D9CUY3h9oGhMN6gE
         IzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=s6DKr07jdTB5fUP+eOjXHiuxn0kqPIjPKDPIbMa1vb4=;
        b=e7h3RJ75kkpc3U+RGV6E9owEM64A+KNJbDSKU/YjvAV28oF+3OeWg01f/iDfblfZvb
         BoH28mmgNLGhOT0d/Da8ZJCnFJEt8DHBb4ryVkxXQlYTRG5Ci8dhhedIhC9WMBrkgPnV
         jt9wL0m2yqNGaX8aRB7I0s6hY6sU/HlLETqhv+DzPHS74pi0f4Ez0Hlocgx0nBqmq3e3
         xlWDXPuD3tKy6F0ScEIMKvwoa2yncd6b7JyVeUpVZ1vkbuTKHRvL115FTf4g40/eNOSg
         HN/oCZQL/js9RUwY0QTtN4hMzmj2bzMU8k6ysBgyzcCN0IEg/f+Q2RzZSxTO6XW/Npb+
         ZmyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s185si938244ybf.713.2018.02.05.05.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 05:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eih7j-0001n3-3N
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 08:47:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih2C-0006BA-RW
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 08:42:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih27-0006wp-VF
	for qemu-devel@nongnu.org; Mon, 05 Feb 2018 08:42:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52448)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eih24-0006sm-MS; Mon, 05 Feb 2018 08:42:04 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8F7EC047B94;
	Mon,  5 Feb 2018 13:42:03 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 920EA17240;
	Mon,  5 Feb 2018 13:41:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Mon,  5 Feb 2018 14:39:25 +0100
Message-Id: <1517837972-1904-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
References: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 05 Feb 2018 13:42:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v8 07/14] hw/arm/smmuv3: Implement MMIO write
 operations
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, edgar.iglesias@gmail.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2dNc/JWwVMY1

Now we have relevant helpers for queue and irq
management, let's implement MMIO write operations.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8:
- precise in the commit message invalidation commands
  are not yet treated.
- use new queue helpers
- do not decode unhandled commands at this stage
---
 hw/arm/smmuv3-internal.h |  24 +++++++---
 hw/arm/smmuv3.c          | 111 +++++++++++++++++++++++++++++++++++++++++++++--
 hw/arm/trace-events      |   6 +++
 3 files changed, 132 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 44564ed..799bce0 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -152,6 +152,25 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
     return extract64(r, offset << 3, 32);
 }
 
+static inline void smmu_write64(uint64_t *r, unsigned offset,
+                                unsigned size, uint64_t value)
+{
+    if (size == 8 && !offset) {
+        *r  = value;
+    }
+
+    /* 32 bit access */
+
+    if (offset && offset != 4)  {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SMMUv3 MMIO write: bad offset/size %u/%u\n",
+                      offset, size);
+        return ;
+    }
+
+    *r = deposit64(*r, offset << 3, 32, value);
+}
+
 /* Interrupts */
 
 #define smmuv3_eventq_irq_enabled(s)                   \
@@ -159,9 +178,6 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
 #define smmuv3_gerror_irq_enabled(s)                  \
     (FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN))
 
-void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
-void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
-
 /* Queue Handling */
 
 #define LOG2SIZE(q)        extract64((q)->base, 0, 5)
@@ -302,6 +318,4 @@ enum { /* Command completion notification */
             addr;                                       \
         })
 
-int smmuv3_cmdq_consume(SMMUv3State *s);
-
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 79970d7..8e9eab2 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -37,7 +37,8 @@
  * @irq: irq type
  * @gerror_mask: mask of gerrors to toggle (relevant if @irq is GERROR)
  */
-void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask)
+static void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq,
+                               uint32_t gerror_mask)
 {
 
     bool pulse = false;
@@ -75,7 +76,7 @@ void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask)
     }
 }
 
-void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
+static void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
 {
     uint32_t pending = s->gerror ^ s->gerrorn;
     uint32_t toggled = s->gerrorn ^ new_gerrorn;
@@ -202,7 +203,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->sid_split = 0;
 }
 
-int smmuv3_cmdq_consume(SMMUv3State *s)
+static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUCmdError cmd_error = SMMU_CERROR_NONE;
     SMMUQueue *q = &s->cmdq;
@@ -287,7 +288,109 @@ int smmuv3_cmdq_consume(SMMUv3State *s)
 static void smmu_write_mmio(void *opaque, hwaddr addr,
                             uint64_t val, unsigned size)
 {
-    /* not yet implemented */
+    SMMUState *sys = opaque;
+    SMMUv3State *s = ARM_SMMUV3(sys);
+
+    /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
+    addr &= ~0x10000;
+
+    if (size != 4 && size != 8) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SMMUv3 MMIO write: bad size %u\n", size);
+    }
+
+    trace_smmuv3_write_mmio(addr, val, size);
+
+    switch (addr) {
+    case A_CR0:
+        s->cr[0] = val;
+        s->cr0ack = val;
+        /* in case the command queue has been enabled */
+        smmuv3_cmdq_consume(s);
+        return;
+    case A_CR1:
+        s->cr[1] = val;
+        return;
+    case A_CR2:
+        s->cr[2] = val;
+        return;
+    case A_IRQ_CTRL:
+        s->irq_ctrl = val;
+        return;
+    case A_GERRORN:
+        smmuv3_write_gerrorn(s, val);
+        /*
+         * By acknowledging the CMDQ_ERR, SW may notify cmds can
+         * be processed again
+         */
+        smmuv3_cmdq_consume(s);
+        return;
+    case A_GERROR_IRQ_CFG0: /* 64b */
+        smmu_write64(&s->gerror_irq_cfg0, 0, size, val);
+        return;
+    case A_GERROR_IRQ_CFG0 + 4:
+        smmu_write64(&s->gerror_irq_cfg0, 4, size, val);
+        return;
+    case A_GERROR_IRQ_CFG1:
+        s->gerror_irq_cfg1 = val;
+        return;
+    case A_GERROR_IRQ_CFG2:
+        s->gerror_irq_cfg2 = val;
+        return;
+    case A_STRTAB_BASE: /* 64b */
+        smmu_write64(&s->strtab_base, 0, size, val);
+        return;
+    case A_STRTAB_BASE + 4:
+        smmu_write64(&s->strtab_base, 4, size, val);
+        return;
+    case A_STRTAB_BASE_CFG:
+        s->strtab_base_cfg = val;
+        if (FIELD_EX32(val, STRTAB_BASE_CFG, FMT) == 1) {
+            s->sid_split = FIELD_EX32(val, STRTAB_BASE_CFG, SPLIT);
+            s->features |= SMMU_FEATURE_2LVL_STE;
+        }
+        return;
+    case A_CMDQ_BASE: /* 64b */
+        smmu_write64(&s->cmdq.base, 0, size, val);
+        return;
+    case A_CMDQ_BASE + 4: /* 64b */
+        smmu_write64(&s->cmdq.base, 4, size, val);
+        return;
+    case A_CMDQ_PROD:
+        s->cmdq.prod = val;
+        smmuv3_cmdq_consume(s);
+        return;
+    case A_CMDQ_CONS:
+        s->cmdq.cons = val;
+        return;
+    case A_EVENTQ_BASE: /* 64b */
+        smmu_write64(&s->eventq.base, 0, size, val);
+        return;
+    case A_EVENTQ_BASE + 4:
+        smmu_write64(&s->eventq.base, 4, size, val);
+        return;
+    case A_EVENTQ_PROD:
+        s->eventq.prod = val;
+        return;
+    case A_EVENTQ_CONS:
+        s->eventq.cons = val;
+        return;
+    case A_EVENTQ_IRQ_CFG0: /* 64b */
+        s->eventq.prod = val;
+        smmu_write64(&s->eventq_irq_cfg0, 0, size, val);
+        return;
+    case A_EVENTQ_IRQ_CFG0 + 4:
+        smmu_write64(&s->eventq_irq_cfg0, 4, size, val);
+        return;
+    case A_EVENTQ_IRQ_CFG1:
+        s->eventq_irq_cfg1 = val;
+        return;
+    case A_EVENTQ_IRQ_CFG2:
+        s->eventq_irq_cfg2 = val;
+        return;
+    default:
+        error_report("%s unhandled access at 0x%"PRIx64, __func__, addr);
+    }
 }
 
 static uint64_t smmu_read_mmio(void *opaque, hwaddr addr, unsigned size)
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index d73e151..8a4acb9 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -24,3 +24,9 @@ smmuv3_unhandled_cmd(uint32_t type) "Unhandled command type=%d"
 smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod=%d cons=%d prod.wrap=%d cons.wrap=%d"
 smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
 smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
+smmuv3_update(bool is_empty, uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "q empty:%d prod:%d cons:%d p.wrap:%d p.cons:%d"
+smmuv3_update_check_cmd(int error) "cmdq not enabled or error :0x%x"
+smmuv3_write_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
+smmuv3_write_mmio_idr(hwaddr addr, uint64_t val) "write to RO/Unimpl reg 0x%lx val64:0x%lx"
+smmuv3_write_mmio_evtq_cons_bef_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "Before clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
+smmuv3_write_mmio_evtq_cons_after_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "after clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
-- 
2.5.5

