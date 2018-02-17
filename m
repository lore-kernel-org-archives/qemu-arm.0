Received: by 10.28.71.27 with SMTP id u27csp2126166wma;
        Sat, 17 Feb 2018 11:45:46 -0800 (PST)
X-Google-Smtp-Source: AH8x224SWuhA+xBVfYp2wP8jxQLcVFvAbpP42ikDG+MXAxQQfF6vmfwjwZ/Wjys3tUYdqIihoOA8
X-Received: by 10.129.108.135 with SMTP id h129mr512521ywc.197.1518896746353;
        Sat, 17 Feb 2018 11:45:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518896746; cv=none;
        d=google.com; s=arc-20160816;
        b=XSbBxct/K4lFykJebYPSRiNbMkfSBoMRmlkCc6bcWbC+i697en5q2K8knFWe3ld//E
         iMBVlyc35TDLIP6UyKIFjLHo96ZY4FKPAwo2ACtv+DsIRHwFzTQYrtje7TByCWlgBL2r
         wlJW8Gf4emDCIBULz8bR3qHUEZEq0VdK6xfYAfHw1Af00LqilPN/HJxbTkkg1bNcX852
         QEXJNsaGGRsVJhv1+dhBKFL+4XyKNp/yy7UuMsfP32rMLXcM9hBQZ1V9ZpEjjOmDq/h5
         TxiUIFnV+hcRCDznbeHsCS8zMvNccKjBg6cl2XZgLvpRGSJfqtoTAPsLnW1lox7OIpw0
         df8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8rP774WliJ8M6nVgw2vU6wuAAvPuzNfyxGnacOh+8lY=;
        b=hPXsX6jB+3DfWwKVwA/PPqTSTDJ4iHZxLCzvqYLw/+bWnq7v3jMgzaWoOlKTyTLvmH
         Fko2EmE23fK7q3bZai0NAgwUwXgdwc+te9/E1EikhGvC2zN41W9b3dBI5GcQ0c6at53X
         TJHRS7QEkd0h9Z1PEHxvtcX8IahkqKQD9p0T0g7uSIXOxv+LCoJt72EeQiTeH2Zc7qOz
         mOApC++A/Ju1W3zHjqEqlgI7qPC/mBbDXzWICXt2V/SJspGisNV8GIRLs7rUbMr1Ly9A
         yz6+VHbizrUMlf+/O6hCc9eQcfck5rwjiLmFG8wQrwcnaEvNvmdeKVeuOO8Zd9nGaA/w
         mg8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m204si3589246ywm.646.2018.02.17.11.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:45:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en8Qb-0007do-RZ
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:45:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7WC-0003Pg-04
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7W8-0001Kw-90
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:27 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41980 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1en7W8-0001JR-3z; Sat, 17 Feb 2018 13:47:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8069C40FB633;
	Sat, 17 Feb 2018 18:47:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE8942024CA2;
	Sat, 17 Feb 2018 18:47:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Sat, 17 Feb 2018 19:46:48 +0100
Message-Id: <1518893216-9983-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Sat, 17 Feb 2018 18:47:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Sat, 17 Feb 2018 18:47:23 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v9 06/14] hw/arm/smmuv3: Queue helpers
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
X-TUID: VfNTqQxL6p0d

We introduce helpers to read/write into the command and event
circular queues.

smmuv3_write_eventq and smmuv3_cmq_consume will become static
in subsequent patches.

Invalidation commands are not yet dealt with. We do not cache
data that need to be invalidated. This will change with vhost
integration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8 -> v9:
- fix CMD_SSID & CMD_ADDR + some renamings
- do cons increment after the execution of the command
- add Q_INCONSISTENT()

v7 -> v8
- use address_space_rw
- helpers inspired from spec
---
 hw/arm/smmuv3-internal.h | 150 +++++++++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3.c          | 162 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events      |   4 ++
 3 files changed, 316 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 40b39a1..c0771ce 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -162,4 +162,154 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
 void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
 void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
 
+/* Queue Handling */
+
+#define LOG2SIZE(q)        extract64((q)->base, 0, 5)
+#define BASE(q)            ((q)->base & SMMU_BASE_ADDR_MASK)
+#define WRAP_MASK(q)       (1 << LOG2SIZE(q))
+#define INDEX_MASK(q)      ((1 << LOG2SIZE(q)) - 1)
+#define WRAP_INDEX_MASK(q) ((1 << (LOG2SIZE(q) + 1)) - 1)
+
+#define Q_CONS_ENTRY(q)  (BASE(q) + \
+                          (q)->entry_size * ((q)->cons & INDEX_MASK(q)))
+#define Q_PROD_ENTRY(q)  (BASE(q) + \
+                          (q)->entry_size * ((q)->prod & INDEX_MASK(q)))
+
+#define Q_CONS(q) ((q)->cons & INDEX_MASK(q))
+#define Q_PROD(q) ((q)->prod & INDEX_MASK(q))
+
+#define Q_CONS_WRAP(q) (((q)->cons & WRAP_MASK(q)) >> LOG2SIZE(q))
+#define Q_PROD_WRAP(q) (((q)->prod & WRAP_MASK(q)) >> LOG2SIZE(q))
+
+#define Q_FULL(q) \
+    (((((q)->cons) & INDEX_MASK(q)) == \
+      (((q)->prod) & INDEX_MASK(q))) && \
+     ((((q)->cons) & WRAP_MASK(q)) != \
+      (((q)->prod) & WRAP_MASK(q))))
+
+#define Q_EMPTY(q) \
+    (((((q)->cons) & INDEX_MASK(q)) == \
+      (((q)->prod) & INDEX_MASK(q))) && \
+     ((((q)->cons) & WRAP_MASK(q)) == \
+      (((q)->prod) & WRAP_MASK(q))))
+
+#define Q_INCONSISTENT(q) \
+((((((q)->prod) & INDEX_MASK(q)) > (((q)->cons) & INDEX_MASK(q))) && \
+((((q)->prod) & WRAP_MASK(q)) != (((q)->cons) & WRAP_MASK(q)))) || \
+(((((q)->prod) & INDEX_MASK(q)) < (((q)->cons) & INDEX_MASK(q))) && \
+((((q)->prod) & WRAP_MASK(q)) == (((q)->cons) & WRAP_MASK(q))))) \
+
+#define SMMUV3_CMDQ_ENABLED(s) \
+     (FIELD_EX32(s->cr[0], CR0, CMDQEN))
+
+#define SMMUV3_EVENTQ_ENABLED(s) \
+     (FIELD_EX32(s->cr[0], CR0, EVENTQEN))
+
+static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
+{
+    s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
+}
+
+void smmuv3_write_eventq(SMMUv3State *s, Evt *evt);
+
+/* Commands */
+
+enum {
+    SMMU_CMD_PREFETCH_CONFIG = 0x01,
+    SMMU_CMD_PREFETCH_ADDR,
+    SMMU_CMD_CFGI_STE,
+    SMMU_CMD_CFGI_STE_RANGE,
+    SMMU_CMD_CFGI_CD,
+    SMMU_CMD_CFGI_CD_ALL,
+    SMMU_CMD_CFGI_ALL,
+    SMMU_CMD_TLBI_NH_ALL     = 0x10,
+    SMMU_CMD_TLBI_NH_ASID,
+    SMMU_CMD_TLBI_NH_VA,
+    SMMU_CMD_TLBI_NH_VAA,
+    SMMU_CMD_TLBI_EL3_ALL    = 0x18,
+    SMMU_CMD_TLBI_EL3_VA     = 0x1a,
+    SMMU_CMD_TLBI_EL2_ALL    = 0x20,
+    SMMU_CMD_TLBI_EL2_ASID,
+    SMMU_CMD_TLBI_EL2_VA,
+    SMMU_CMD_TLBI_EL2_VAA,  /* 0x23 */
+    SMMU_CMD_TLBI_S12_VMALL  = 0x28,
+    SMMU_CMD_TLBI_S2_IPA     = 0x2a,
+    SMMU_CMD_TLBI_NSNH_ALL   = 0x30,
+    SMMU_CMD_ATC_INV         = 0x40,
+    SMMU_CMD_PRI_RESP,
+    SMMU_CMD_RESUME          = 0x44,
+    SMMU_CMD_STALL_TERM,
+    SMMU_CMD_SYNC,          /* 0x46 */
+};
+
+static const char *cmd_stringify[] = {
+    [SMMU_CMD_PREFETCH_CONFIG] = "SMMU_CMD_PREFETCH_CONFIG",
+    [SMMU_CMD_PREFETCH_ADDR]   = "SMMU_CMD_PREFETCH_ADDR",
+    [SMMU_CMD_CFGI_STE]        = "SMMU_CMD_CFGI_STE",
+    [SMMU_CMD_CFGI_STE_RANGE]  = "SMMU_CMD_CFGI_STE_RANGE",
+    [SMMU_CMD_CFGI_CD]         = "SMMU_CMD_CFGI_CD",
+    [SMMU_CMD_CFGI_CD_ALL]     = "SMMU_CMD_CFGI_CD_ALL",
+    [SMMU_CMD_CFGI_ALL]        = "SMMU_CMD_CFGI_ALL",
+    [SMMU_CMD_TLBI_NH_ALL]     = "SMMU_CMD_TLBI_NH_ALL",
+    [SMMU_CMD_TLBI_NH_ASID]    = "SMMU_CMD_TLBI_NH_ASID",
+    [SMMU_CMD_TLBI_NH_VA]      = "SMMU_CMD_TLBI_NH_VA",
+    [SMMU_CMD_TLBI_NH_VAA]     = "SMMU_CMD_TLBI_NH_VAA",
+    [SMMU_CMD_TLBI_EL3_ALL]    = "SMMU_CMD_TLBI_EL3_ALL",
+    [SMMU_CMD_TLBI_EL3_VA]     = "SMMU_CMD_TLBI_EL3_VA",
+    [SMMU_CMD_TLBI_EL2_ALL]    = "SMMU_CMD_TLBI_EL2_ALL",
+    [SMMU_CMD_TLBI_EL2_ASID]   = "SMMU_CMD_TLBI_EL2_ASID",
+    [SMMU_CMD_TLBI_EL2_VA]     = "SMMU_CMD_TLBI_EL2_VA",
+    [SMMU_CMD_TLBI_EL2_VAA]    = "SMMU_CMD_TLBI_EL2_VAA",
+    [SMMU_CMD_TLBI_S12_VMALL]  = "SMMU_CMD_TLBI_S12_VMALL",
+    [SMMU_CMD_TLBI_S2_IPA]     = "SMMU_CMD_TLBI_S2_IPA",
+    [SMMU_CMD_TLBI_NSNH_ALL]   = "SMMU_CMD_TLBI_NSNH_ALL",
+    [SMMU_CMD_ATC_INV]         = "SMMU_CMD_ATC_INV",
+    [SMMU_CMD_PRI_RESP]        = "SMMU_CMD_PRI_RESP",
+    [SMMU_CMD_RESUME]          = "SMMU_CMD_RESUME",
+    [SMMU_CMD_STALL_TERM]      = "SMMU_CMD_STALL_TERM",
+    [SMMU_CMD_SYNC]            = "SMMU_CMD_SYNC",
+};
+
+#define SMMU_CMD_STRING(type) (                                      \
+(type < ARRAY_SIZE(cmd_stringify)) ? cmd_stringify[type] : "UNKNOWN" \
+)
+
+/* CMDQ fields */
+
+typedef enum {
+    SMMU_CERROR_NONE = 0,
+    SMMU_CERROR_ILL,
+    SMMU_CERROR_ABT,
+    SMMU_CERROR_ATC_INV_SYNC,
+} SMMUCmdError;
+
+enum { /* Command completion notification */
+    CMD_SYNC_SIG_NONE,
+    CMD_SYNC_SIG_IRQ,
+    CMD_SYNC_SIG_SEV,
+};
+
+#define CMD_TYPE(x)         extract32((x)->word[0], 0 , 8)
+#define CMD_SSEC(x)         extract32((x)->word[0], 10, 1)
+#define CMD_SSV(x)          extract32((x)->word[0], 11, 1)
+#define CMD_RESUME_AC(x)    extract32((x)->word[0], 12, 1)
+#define CMD_RESUME_AB(x)    extract32((x)->word[0], 13, 1)
+#define CMD_SYNC_CS(x)      extract32((x)->word[0], 12, 2)
+#define CMD_SSID(x)         extract32((x)->word[0], 12, 20)
+#define CMD_SID(x)          ((x)->word[1])
+#define CMD_VMID(x)         extract32((x)->word[1], 0 , 16)
+#define CMD_ASID(x)         extract32((x)->word[1], 16, 16)
+#define CMD_RESUME_STAG(x)  extract32((x)->word[2], 0 , 16)
+#define CMD_RESP(x)         extract32((x)->word[2], 11, 2)
+#define CMD_LEAF(x)         extract32((x)->word[2], 0 , 1)
+#define CMD_STE_RANGE(x)    extract32((x)->word[2], 0 , 5)
+#define CMD_ADDR(x) ({                                        \
+            uint64_t high = (uint64_t)(x)->word[3];           \
+            uint64_t low = extract32((x)->word[2], 12, 20);    \
+            uint64_t addr = high << 32 | (low << 12);         \
+            addr;                                             \
+        })
+
+int smmuv3_cmdq_consume(SMMUv3State *s);
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 8779d3f..0b57215 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -94,6 +94,72 @@ void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
     trace_smmuv3_write_gerrorn(acked, s->gerrorn);
 }
 
+static uint32_t queue_index_inc(uint32_t val,
+                                uint32_t qidx_mask, uint32_t qwrap_mask)
+{
+    uint32_t i = (val + 1) & qidx_mask;
+
+    if (i <= (val & qidx_mask)) {
+        i = ((val & qwrap_mask) ^ qwrap_mask) | i;
+    } else {
+        i = (val & qwrap_mask) | i;
+    }
+    return i;
+}
+
+static inline void queue_prod_incr(SMMUQueue *q)
+{
+    q->prod = queue_index_inc(q->prod, INDEX_MASK(q), WRAP_MASK(q));
+}
+
+static inline void queue_cons_incr(SMMUQueue *q)
+{
+    q->cons = queue_index_inc(q->cons, INDEX_MASK(q), WRAP_MASK(q));
+}
+
+static inline MemTxResult queue_read(SMMUQueue *q, void *data)
+{
+    dma_addr_t addr = Q_CONS_ENTRY(q);
+
+    return dma_memory_read(&address_space_memory, addr,
+                           (uint8_t *)data, q->entry_size);
+}
+
+static void queue_write(SMMUQueue *q, void *data)
+{
+    dma_addr_t addr = Q_PROD_ENTRY(q);
+    MemTxResult ret;
+
+    ret = dma_memory_write(&address_space_memory, addr,
+                           (uint8_t *)data, q->entry_size);
+    if (ret != MEMTX_OK) {
+        return;
+    }
+
+    queue_prod_incr(q);
+}
+
+void smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
+{
+    SMMUQueue *q = &s->eventq;
+    bool q_empty = Q_EMPTY(q);
+    bool q_full = Q_FULL(q);
+
+    if (!SMMUV3_EVENTQ_ENABLED(s)) {
+        return;
+    }
+
+    if (q_full) {
+        return;
+    }
+
+    queue_write(q, evt);
+
+    if (q_empty) {
+        smmuv3_trigger_irq(s, SMMU_IRQ_EVTQ, 0);
+    }
+}
+
 static void smmuv3_init_regs(SMMUv3State *s)
 {
     /**
@@ -133,6 +199,102 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->sid_split = 0;
 }
 
+int smmuv3_cmdq_consume(SMMUv3State *s)
+{
+    SMMUCmdError cmd_error = SMMU_CERROR_NONE;
+    SMMUQueue *q = &s->cmdq;
+    uint32_t type = 0;
+
+    if (!SMMUV3_CMDQ_ENABLED(s)) {
+        return 0;
+    }
+    /*
+     * some commands depend on register values, as above. In case those
+     * register values change while handling the command, spec says it
+     * is UNPREDICTABLE whether the command is interpreted under the new
+     * or old value.
+     */
+
+    while (!Q_EMPTY(q)) {
+        uint32_t pending = s->gerror ^ s->gerrorn;
+        Cmd cmd;
+
+        trace_smmuv3_cmdq_consume(Q_PROD(q), Q_CONS(q),
+                                  Q_PROD_WRAP(q), Q_CONS_WRAP(q));
+
+        if (FIELD_EX32(pending, GERROR, CMDQ_ERR)) {
+            break;
+        }
+
+        if (queue_read(q, &cmd) != MEMTX_OK) {
+            cmd_error = SMMU_CERROR_ABT;
+            break;
+        }
+
+        type = CMD_TYPE(&cmd);
+
+        trace_smmuv3_cmdq_opcode(SMMU_CMD_STRING(type));
+
+        switch (type) {
+        case SMMU_CMD_SYNC:
+            if (CMD_SYNC_CS(&cmd) & CMD_SYNC_SIG_IRQ) {
+                smmuv3_trigger_irq(s, SMMU_IRQ_CMD_SYNC, 0);
+            }
+            break;
+        case SMMU_CMD_PREFETCH_CONFIG:
+        case SMMU_CMD_PREFETCH_ADDR:
+        case SMMU_CMD_CFGI_STE:
+        case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
+        case SMMU_CMD_CFGI_CD:
+        case SMMU_CMD_CFGI_CD_ALL:
+        case SMMU_CMD_TLBI_NH_ALL:
+        case SMMU_CMD_TLBI_NH_ASID:
+        case SMMU_CMD_TLBI_NH_VA:
+        case SMMU_CMD_TLBI_NH_VAA:
+        case SMMU_CMD_TLBI_EL3_ALL:
+        case SMMU_CMD_TLBI_EL3_VA:
+        case SMMU_CMD_TLBI_EL2_ALL:
+        case SMMU_CMD_TLBI_EL2_ASID:
+        case SMMU_CMD_TLBI_EL2_VA:
+        case SMMU_CMD_TLBI_EL2_VAA:
+        case SMMU_CMD_TLBI_S12_VMALL:
+        case SMMU_CMD_TLBI_S2_IPA:
+        case SMMU_CMD_TLBI_NSNH_ALL:
+        case SMMU_CMD_ATC_INV:
+        case SMMU_CMD_PRI_RESP:
+        case SMMU_CMD_RESUME:
+        case SMMU_CMD_STALL_TERM:
+            trace_smmuv3_unhandled_cmd(type);
+            break;
+        default:
+            cmd_error = SMMU_CERROR_ILL;
+            error_report("Illegal command type: %d", CMD_TYPE(&cmd));
+            break;
+        }
+        if (cmd_error) {
+            break;
+        }
+        /*
+         * We only increment the cons index after the completion of
+         * the command. We do that because the SYNC returns immediatly
+         * and do not check the completion of previous commands
+         */
+        queue_cons_incr(q);
+    }
+
+    if (cmd_error) {
+        error_report("Error on %s command execution: %d",
+                     SMMU_CMD_STRING(type), cmd_error);
+        smmu_write_cmdq_err(s, cmd_error);
+        smmuv3_trigger_irq(s, SMMU_IRQ_GERROR, R_GERROR_CMDQ_ERR_MASK);
+    }
+
+    trace_smmuv3_cmdq_consume_out(Q_PROD(q), Q_CONS(q),
+                                  Q_PROD_WRAP(q), Q_CONS_WRAP(q));
+
+    return 0;
+}
+
 static void smmu_write_mmio(void *opaque, hwaddr addr,
                             uint64_t val, unsigned size)
 {
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 2ddae40..1c5105d 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -18,3 +18,7 @@ smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" va
 smmuv3_trigger_irq(int irq) "irq=%d"
 smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=0x%x, new gerror=0x%x"
 smmuv3_write_gerrorn(uint32_t acked, uint32_t gerrorn) "acked=0x%x, new gerrorn=0x%x"
+smmuv3_unhandled_cmd(uint32_t type) "Unhandled command type=%d"
+smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod=%d cons=%d prod.wrap=%d cons.wrap=%d"
+smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
+smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
-- 
2.5.5

