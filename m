Received: by 10.28.4.212 with SMTP id 203csp881862wme;
        Wed, 25 Apr 2018 07:25:36 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqn+Q1y9WxHPrCFf0dg0o5pXZBeX/vnH3j+N/+IdmfzgZEUjGAgZMsv3PPYYeaLKdTgDCit
X-Received: by 10.55.109.129 with SMTP id i123mr28945343qkc.114.1524666336563;
        Wed, 25 Apr 2018 07:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666336; cv=none;
        d=google.com; s=arc-20160816;
        b=AotZa9HSeXWf7jdbCDpG8XuRqCtHIvgX1rXZH+d09SSqsmPFuTiFrEfUaDwObU5r1+
         0mGiC82JDNlqygBdaRU7rIbpidFsX2pcaRhdr611ql48TIFkPcaRJ1+aNKcWXm39uKia
         8yLB17RqFCYOkox2c0N73Wd7j2HoLTbvrPlpnl4xt3yh0pirOf9uxa6IROKJwRlalyHk
         DoJWzy4Ls0FbbZKVgw2jTuJHyl6Yc536e3bRrcNW7H7pQrJO80+iSg/P3KeX6H+yVGEf
         Ia9fXJgluDjJWMlpYrZgZtk6QPDQO6MoAnF0HteiAjsHkmtTt4qWljkzoOb0UGea2thl
         ubqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BuMiVaG6DR/RRSbO1buowNd2zAzE8+xiqy9IbOQQZJc=;
        b=md9qZjEJGR4zLX41mqqpQIKh6IYNMiNAJzSxgEGs363n3qw4ASa/xlBrkSfSJAY9qs
         do8rmM6bETMrTtVdyFUtf3M14Ab4nvK/p0PwJLYmX87hSuy1TOIFs8kwvCn5JpuF/wxk
         Bqi0uA1eHiQfF6c615AJ1S96JKXGqaQPB9Mb2zr3A6GQ7Mo7baFFlvW+L+SOC8rO0nPr
         3OPQGCGXCT4Ih37O1YPmuPRauLQb6YCQ/pbYF7OoKMwbCiA24WBhvz1UHZCXEQ09nrXG
         LHSjem5qN4h5seVYAhLblHLaWhH+vJ28oWKwMPBKVx8ClAgd2EIZxyuB6iwRnJvlhadd
         1GPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o57-v6si5138370qtf.181.2018.04.25.07.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLMV-0007T7-Uq
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:25:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDp-0000cn-6N
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:16:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDm-0005sC-2w
	for qemu-arm@nongnu.org; Wed, 25 Apr 2018 10:16:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33128 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLDl-0005ru-US; Wed, 25 Apr 2018 10:16:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B8098DC3B;
	Wed, 25 Apr 2018 14:16:33 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 040BC2023239;
	Wed, 25 Apr 2018 14:16:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:52 +0200
Message-Id: <1524665762-31355-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 25 Apr 2018 14:16:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 25 Apr 2018 14:16:33 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v12 07/17] hw/arm/smmuv3: Implement MMIO write
 operations
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
X-TUID: 2ZPQqc76EA+e

Now we have relevant helpers for queue and irq
management, let's implement MMIO write operations.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v11 -> v12:
- s/value/data in smmu_write_mmio and friends
- added Peter's R-b

v9 -> v10:
- s/hwaddr/uint64_t in trace-events
- added SMMU_FEATURE_2LVL_STE in this patch
- removed smmu_write64 and created writel/writell infra
- store capped log2size
- mask CR0 reserved bits

v7 -> v8:
- precise in the commit message invalidation commands
  are not yet treated.
- use new queue helpers
- do not decode unhandled commands at this stage
---
 hw/arm/smmuv3-internal.h |   8 +--
 hw/arm/smmuv3.c          | 170 +++++++++++++++++++++++++++++++++++++++++++++--
 hw/arm/trace-events      |   6 ++
 3 files changed, 174 insertions(+), 10 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 223d840..282285d 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -61,6 +61,8 @@ REG32(CR0,                 0x20)
     FIELD(CR0, EVENTQEN,      2, 1)
     FIELD(CR0, CMDQEN,        3, 1)
 
+#define SMMU_CR0_RESERVED 0xFFFFFC20
+
 REG32(CR0ACK,              0x24)
 REG32(CR1,                 0x28)
 REG32(CR2,                 0x2c)
@@ -149,10 +151,6 @@ static inline bool smmuv3_gerror_irq_enabled(SMMUv3State *s)
     return FIELD_EX32(s->irq_ctrl, IRQ_CTRL, GERROR_IRQEN);
 }
 
-/* public until callers get introduced */
-void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
-void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
-
 /* Queue Handling */
 
 #define Q_BASE(q)          ((q)->base & SMMU_BASE_ADDR_MASK)
@@ -314,6 +312,6 @@ enum { /* Command completion notification */
             addr;                                             \
         })
 
-int smmuv3_cmdq_consume(SMMUv3State *s);
+#define SMMU_FEATURE_2LVL_STE (1 << 0)
 
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8f50f15..d581ada 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -38,7 +38,8 @@
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
@@ -174,7 +175,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->sid_split = 0;
 }
 
-int smmuv3_cmdq_consume(SMMUv3State *s)
+static int smmuv3_cmdq_consume(SMMUv3State *s)
 {
     SMMUCmdError cmd_error = SMMU_CERROR_NONE;
     SMMUQueue *q = &s->cmdq;
@@ -270,11 +271,170 @@ int smmuv3_cmdq_consume(SMMUv3State *s)
     return 0;
 }
 
+static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
+                               uint64_t data, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case A_GERROR_IRQ_CFG0:
+        s->gerror_irq_cfg0 = data;
+        return MEMTX_OK;
+    case A_STRTAB_BASE:
+        s->strtab_base = data;
+        return MEMTX_OK;
+    case A_CMDQ_BASE:
+        s->cmdq.base = data;
+        s->cmdq.log2size = extract64(s->cmdq.base, 0, 5);
+        if (s->cmdq.log2size > SMMU_CMDQS) {
+            s->cmdq.log2size = SMMU_CMDQS;
+        }
+        return MEMTX_OK;
+    case A_EVENTQ_BASE:
+        s->eventq.base = data;
+        s->eventq.log2size = extract64(s->eventq.base, 0, 5);
+        if (s->eventq.log2size > SMMU_EVENTQS) {
+            s->eventq.log2size = SMMU_EVENTQS;
+        }
+        return MEMTX_OK;
+    case A_EVENTQ_IRQ_CFG0:
+        s->eventq_irq_cfg0 = data;
+        return MEMTX_OK;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s Unexpected 64-bit access to 0x%"PRIx64" (WI)\n",
+                      __func__, offset);
+        return MEMTX_OK;
+    }
+}
+
+static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
+                               uint64_t data, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case A_CR0:
+        s->cr[0] = data;
+        s->cr0ack = data & ~SMMU_CR0_RESERVED;
+        /* in case the command queue has been enabled */
+        smmuv3_cmdq_consume(s);
+        return MEMTX_OK;
+    case A_CR1:
+        s->cr[1] = data;
+        return MEMTX_OK;
+    case A_CR2:
+        s->cr[2] = data;
+        return MEMTX_OK;
+    case A_IRQ_CTRL:
+        s->irq_ctrl = data;
+        return MEMTX_OK;
+    case A_GERRORN:
+        smmuv3_write_gerrorn(s, data);
+        /*
+         * By acknowledging the CMDQ_ERR, SW may notify cmds can
+         * be processed again
+         */
+        smmuv3_cmdq_consume(s);
+        return MEMTX_OK;
+    case A_GERROR_IRQ_CFG0: /* 64b */
+        s->gerror_irq_cfg0 = deposit64(s->gerror_irq_cfg0, 0, 32, data);
+        return MEMTX_OK;
+    case A_GERROR_IRQ_CFG0 + 4:
+        s->gerror_irq_cfg0 = deposit64(s->gerror_irq_cfg0, 32, 32, data);
+        return MEMTX_OK;
+    case A_GERROR_IRQ_CFG1:
+        s->gerror_irq_cfg1 = data;
+        return MEMTX_OK;
+    case A_GERROR_IRQ_CFG2:
+        s->gerror_irq_cfg2 = data;
+        return MEMTX_OK;
+    case A_STRTAB_BASE: /* 64b */
+        s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
+        return MEMTX_OK;
+    case A_STRTAB_BASE + 4:
+        s->strtab_base = deposit64(s->strtab_base, 32, 32, data);
+        return MEMTX_OK;
+    case A_STRTAB_BASE_CFG:
+        s->strtab_base_cfg = data;
+        if (FIELD_EX32(data, STRTAB_BASE_CFG, FMT) == 1) {
+            s->sid_split = FIELD_EX32(data, STRTAB_BASE_CFG, SPLIT);
+            s->features |= SMMU_FEATURE_2LVL_STE;
+        }
+        return MEMTX_OK;
+    case A_CMDQ_BASE: /* 64b */
+        s->cmdq.base = deposit64(s->cmdq.base, 0, 32, data);
+        s->cmdq.log2size = extract64(s->cmdq.base, 0, 5);
+        if (s->cmdq.log2size > SMMU_CMDQS) {
+            s->cmdq.log2size = SMMU_CMDQS;
+        }
+        return MEMTX_OK;
+    case A_CMDQ_BASE + 4: /* 64b */
+        s->cmdq.base = deposit64(s->cmdq.base, 32, 32, data);
+        return MEMTX_OK;
+    case A_CMDQ_PROD:
+        s->cmdq.prod = data;
+        smmuv3_cmdq_consume(s);
+        return MEMTX_OK;
+    case A_CMDQ_CONS:
+        s->cmdq.cons = data;
+        return MEMTX_OK;
+    case A_EVENTQ_BASE: /* 64b */
+        s->eventq.base = deposit64(s->eventq.base, 0, 32, data);
+        s->eventq.log2size = extract64(s->eventq.base, 0, 5);
+        if (s->eventq.log2size > SMMU_EVENTQS) {
+            s->eventq.log2size = SMMU_EVENTQS;
+        }
+        return MEMTX_OK;
+    case A_EVENTQ_BASE + 4:
+        s->eventq.base = deposit64(s->eventq.base, 32, 32, data);
+        return MEMTX_OK;
+    case A_EVENTQ_PROD:
+        s->eventq.prod = data;
+        return MEMTX_OK;
+    case A_EVENTQ_CONS:
+        s->eventq.cons = data;
+        return MEMTX_OK;
+    case A_EVENTQ_IRQ_CFG0: /* 64b */
+        s->eventq_irq_cfg0 = deposit64(s->eventq_irq_cfg0, 0, 32, data);
+        return MEMTX_OK;
+    case A_EVENTQ_IRQ_CFG0 + 4:
+        s->eventq_irq_cfg0 = deposit64(s->eventq_irq_cfg0, 32, 32, data);
+        return MEMTX_OK;
+    case A_EVENTQ_IRQ_CFG1:
+        s->eventq_irq_cfg1 = data;
+        return MEMTX_OK;
+    case A_EVENTQ_IRQ_CFG2:
+        s->eventq_irq_cfg2 = data;
+        return MEMTX_OK;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s Unexpected 32-bit access to 0x%"PRIx64" (WI)\n",
+                      __func__, offset);
+        return MEMTX_OK;
+    }
+}
+
 static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
                                    unsigned size, MemTxAttrs attrs)
 {
-    /* not yet implemented */
-    return MEMTX_ERROR;
+    SMMUState *sys = opaque;
+    SMMUv3State *s = ARM_SMMUV3(sys);
+    MemTxResult r;
+
+    /* CONSTRAINED UNPREDICTABLE choice to have page0/1 be exact aliases */
+    offset &= ~0x10000;
+
+    switch (size) {
+    case 8:
+        r = smmu_writell(s, offset, data, attrs);
+        break;
+    case 4:
+        r = smmu_writel(s, offset, data, attrs);
+        break;
+    default:
+        r = MEMTX_ERROR;
+        break;
+    }
+
+    trace_smmuv3_write_mmio(offset, data, size, r);
+    return r;
 }
 
 static MemTxResult smmu_readll(SMMUv3State *s, hwaddr offset,
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 38b35fa..781542a 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -23,3 +23,9 @@ smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t con
 smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
 smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
 smmuv3_cmdq_consume_error(const char *cmd_name, uint8_t cmd_error) "Error on %s command execution: %d"
+smmuv3_update(bool is_empty, uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "q empty:%d prod:%d cons:%d p.wrap:%d p.cons:%d"
+smmuv3_update_check_cmd(int error) "cmdq not enabled or error :0x%x"
+smmuv3_write_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
+smmuv3_write_mmio_idr(uint64_t addr, uint64_t val) "write to RO/Unimpl reg 0x%lx val64:0x%lx"
+smmuv3_write_mmio_evtq_cons_bef_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "Before clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
+smmuv3_write_mmio_evtq_cons_after_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "after clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
-- 
2.5.5

