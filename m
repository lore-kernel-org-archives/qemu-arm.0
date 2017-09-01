Received: by 10.223.188.70 with SMTP id a6csp1285796wrh;
        Fri, 1 Sep 2017 10:23:07 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6XiGPg6pn/zxEKK078E5WM9kc1l1xJpkE0QW3vyQl2OUvL7jWOA3azv52wHlN8qgfD/Sxm
X-Received: by 10.237.34.79 with SMTP id o15mr3692667qtc.138.1504286587473;
        Fri, 01 Sep 2017 10:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504286587; cv=none;
        d=google.com; s=arc-20160816;
        b=hJWWVK60UxvycItM1Qkj2yepAcoYYMoF6DLNvXpSNaiFaY5wEfOF6hdTG+XLN0wFQf
         kFTpaCpKZgZz13qhm1ZOgkI0r2V7uxFOoiy5/HCx9p+x0r4BJS+SkuM7Sg9IsgkLegdw
         miC5qAluROH3rNtyokA55e89+IPMpuYAvTvCWnawrSLMy4IWmgrN2cYfPLQv2yuISeIm
         W7Har5Wy4sprj3KhFPZiMSeuhrEfV3qqKjb3a+vjDSw4nyprwwU9r3x0GWm6WwU6OMM6
         4BLetATDnoXWwJ+CMp7XRp8skjPfq2WhEmnsXjjmMb3EkfhCUUAg3NWt18yDbAp509CW
         uRew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=wnu17lNo9MiNL/rJ4wAd4h8FAdZronWVFVU+jeJMdPM=;
        b=m9F+mIOWtJgEAyF+CsNPCYIsXS3RE4C8+G36ySZqFjy+AZxJTDjPckLWPGMS8KS32d
         TBZI3QjqPJIplY44WUL5VSDkCN9xbFI+3ZyPew78mJRrj2m+tJ+kb21DmL9wd5RStYw+
         PjbXMdbzekFJ2+9gvNUgYktm/Ys5V4V1z9qQrb5uJtFtDFvIyu4uOfU1Tlyru8eSUDWJ
         D33ETWgBvqZ3JvwCuqNp6vrHvlJY9uveopw/MIqV7kxc3Z02MGxC8GNY/TWgVhGeqbsw
         gghxBfamapFigAdgJxkviUv2JHLyprgFO/U4X3dwB9oD9SIGMQt6zsllqcwitLmtQwhn
         3mfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h185si10576795qkf.499.2017.09.01.10.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:23:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnper-0005dE-46
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:23:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpeZ-0005PW-Nd
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpeU-0002lx-Px
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:22:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpeU-0002kw-Ik; Fri, 01 Sep 2017 13:22:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95E3961980;
	Fri,  1 Sep 2017 17:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 95E3961980
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D33A0627DE;
	Fri,  1 Sep 2017 17:22:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:10 +0200
Message-Id: <1504286483-23327-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 01 Sep 2017 17:22:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 07/20] hw/arm/smmuv3: Queue helpers
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1vDQI/q8BeGt

We introduce helpers to read/write into the circular queues.
smmuv3_read_cmdq and smmuv3_write_evtq will become static
later on.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3-internal.h | 48 ++++++++++++++++++++++++++++++-
 hw/arm/smmuv3.c          | 75 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 2b44ee2..d88f141 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -215,7 +215,53 @@ static inline int smmu_enabled(SMMUV3State *s)
 
 #define SMMU_CMDQ_ERR(s) (SMMU_PENDING_GERRORS(s) & SMMU_GERROR_CMDQ)
 
-void smmuv3_irq_trigger(SMMUV3State *s, SMMUIrq irq, uint32_t gerror_val);
 void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn);
 
+/***************************
+ * Queue Handling
+ ***************************/
+
+typedef enum {
+    CMD_Q_EMPTY,
+    CMD_Q_FULL,
+    CMD_Q_PARTIALLY_FILLED,
+} SMMUQStatus;
+
+#define Q_ENTRY(q, idx)  (q->base + q->ent_size * idx)
+#define Q_WRAP(q, pc)    ((pc) >> (q)->shift)
+#define Q_IDX(q, pc)     ((pc) & ((1 << (q)->shift) - 1))
+
+static inline SMMUQStatus __smmu_queue_status(SMMUV3State *s, SMMUQueue *q)
+{
+    uint32_t prod = Q_IDX(q, q->prod);
+    uint32_t cons = Q_IDX(q, q->cons);
+
+    if ((prod == cons) && (q->wrap.prod != q->wrap.cons)) {
+        return CMD_Q_FULL;
+    } else if ((prod == cons) && (q->wrap.prod == q->wrap.cons)) {
+        return CMD_Q_EMPTY;
+    }
+    return CMD_Q_PARTIALLY_FILLED;
+}
+#define smmu_is_q_full(s, q) (__smmu_queue_status(s, q) == CMD_Q_FULL)
+#define smmu_is_q_empty(s, q) (__smmu_queue_status(s, q) == CMD_Q_EMPTY)
+
+static inline int __smmu_q_enabled(SMMUV3State *s, uint32_t q)
+{
+    return smmu_read32_reg(s, SMMU_REG_CR0) & q;
+}
+#define smmu_cmd_q_enabled(s) __smmu_q_enabled(s, SMMU_CR0_CMDQ_ENABLE)
+#define smmu_evt_q_enabled(s) __smmu_q_enabled(s, SMMU_CR0_EVTQ_ENABLE)
+
+static inline void smmu_write_cmdq_err(SMMUV3State *s, uint32_t err_type)
+{
+    uint32_t regval = smmu_read32_reg(s, SMMU_REG_CMDQ_CONS);
+
+    smmu_write32_reg(s, SMMU_REG_CMDQ_CONS,
+                        regval | err_type << SMMU_CMD_CONS_ERR_SHIFT);
+}
+
+MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd);
+void smmuv3_write_evtq(SMMUV3State *s, Evt *evt);
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 468134f..2f96463 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -36,7 +36,7 @@
  * @irq: irq type
  * @gerror: gerror new value, only relevant if @irq is GERROR
  */
-void smmuv3_irq_trigger(SMMUV3State *s, SMMUIrq irq, uint32_t gerror_val)
+static void smmuv3_irq_trigger(SMMUV3State *s, SMMUIrq irq, uint32_t gerror_val)
 {
     uint32_t pending_gerrors = SMMU_PENDING_GERRORS(s);
     bool pulse = false;
@@ -84,6 +84,79 @@ void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn)
     trace_smmuv3_write_gerrorn(gerrorn, sanitized, SMMU_PENDING_GERRORS(s));
 }
 
+static MemTxResult smmu_q_read(SMMUQueue *q, void *data)
+{
+    uint64_t addr = Q_ENTRY(q, Q_IDX(q, q->cons));
+    MemTxResult ret;
+
+    ret = smmu_read_sysmem(addr, data, q->ent_size, false);
+    if (ret != MEMTX_OK) {
+        return ret;
+    }
+
+    q->cons++;
+    if (q->cons == q->entries) {
+        q->cons = 0;
+        q->wrap.cons++;
+    }
+
+    return ret;
+}
+
+static void smmu_q_write(SMMUQueue *q, void *data)
+{
+    uint64_t addr = Q_ENTRY(q, Q_IDX(q, q->prod));
+
+    smmu_write_sysmem(addr, data, q->ent_size, false);
+
+    q->prod++;
+    if (q->prod == q->entries) {
+        q->prod = 0;
+        q->wrap.prod++;
+    }
+}
+
+MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd)
+{
+    SMMUQueue *q = &s->cmdq;
+    MemTxResult ret = smmu_q_read(q, cmd);
+    uint32_t val = 0;
+
+    if (ret != MEMTX_OK) {
+        return ret;
+    }
+
+    val |= (q->wrap.cons << q->shift) | q->cons;
+    smmu_write32_reg(s, SMMU_REG_CMDQ_CONS, val);
+
+    return ret;
+}
+
+void smmuv3_write_evtq(SMMUV3State *s, Evt *evt)
+{
+    SMMUQueue *q = &s->evtq;
+    bool was_empty = smmu_is_q_empty(s, q);
+    bool was_full = smmu_is_q_full(s, q);
+    uint32_t val;
+
+    if (!smmu_evt_q_enabled(s)) {
+        return;
+    }
+
+    if (was_full) {
+        return;
+    }
+
+    smmu_q_write(q, evt);
+
+    val = (q->wrap.prod << q->shift) | q->prod;
+    smmu_write32_reg(s, SMMU_REG_EVTQ_PROD, val);
+
+    if (was_empty) {
+        smmuv3_irq_trigger(s, SMMU_IRQ_EVTQ, 0);
+    }
+}
+
 static void smmuv3_init_regs(SMMUV3State *s)
 {
     uint32_t data =
-- 
2.5.5

