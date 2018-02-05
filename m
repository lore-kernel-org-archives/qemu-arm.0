Received: by 10.28.71.27 with SMTP id u27csp2511623wma;
        Mon, 5 Feb 2018 05:42:07 -0800 (PST)
X-Google-Smtp-Source: AH8x226QNscz/C0uPnCmNF6Wq4YGMc79rcIh5L1zG5Yb2JvDonGs8uOzvDadHnSJh1Bi1HlkI9t3
X-Received: by 10.37.139.146 with SMTP id j18mr30636978ybl.256.1517838127846;
        Mon, 05 Feb 2018 05:42:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517838127; cv=none;
        d=google.com; s=arc-20160816;
        b=xvrHQg32gQjBwvJMQVV4Q3oXw1L21avTFvFIj/KBj8tCyNEEmt7pfF4lwdUc6Iz9Fa
         Ka/xXJCH3tn3ZXeNpU/4kJQMpE+5l7kC07QZWkwI9+NaxWwkKQ5M8I17ChTmV1RtjsO0
         /LcjyEuny6YTYYeL1s5aF8dePFRjuhR9EI3eAOGnx0bM3RIXC0/RuKGVVaAJw09dwkwU
         1rg35d/g6Tr2oKQ6b/rXfmlXPWFCLueBcD4ehU6EHVXdL+BBnpflMd+1h89UtIutBnm1
         gCN/4f5HZ26hNSKe/uYkTVRIZ+Pyh+sv4JapbkuBI9injg3vXL6UPLX60xQOzvntg58/
         RYMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=mQwJXYnPtr/HgxqL5QbCwHDtE3ykoAvCJc5iWEQXiok=;
        b=iJnyXIJWkTLH1cRqlU9jyED2/xlavrrml/9BmMmEwWPzc+Wtp7vxgmSSC2m97+UxuY
         Zwhne2HU8HTBM7Ax88pdBoCzzRwPv/XlzXh3LGu1uk32YuELj1XlqRxTiqZyaPnMFgqJ
         +Tea4KIoVSMkr+DH7nSjr7RKmVpfO3r/B4wi7/Y8/DAMrD4cA4JzITbP8oNXo/msAB/u
         odSNs8XeIS+39qIuhm0/XCEU4cPWEShwZqLGX849BIUh0M3A1yVqLY8+m1/WvqlXWgiB
         b0+fEXJRiERahVe+pKiF5yh/fQG/qCJ8mVWAo+bytmT+AMyW/7Q52poadEZZ6CzbhMuy
         KQdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p71si813257ywe.498.2018.02.05.05.42.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 05:42:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eih27-0005v8-88
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 08:42:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih1r-0005sT-Lo
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:41:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih1p-0006dM-DF
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:41:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41902)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eih1p-0006cX-4G; Mon, 05 Feb 2018 08:41:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F3268765E;
	Mon,  5 Feb 2018 13:41:48 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B4D017240;
	Mon,  5 Feb 2018 13:41:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Mon,  5 Feb 2018 14:39:24 +0100
Message-Id: <1517837972-1904-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
References: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 05 Feb 2018 13:41:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 06/14] hw/arm/smmuv3: Queue helpers
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
X-TUID: XSUCuBGNVe7h

We introduce helpers to read/write into the command and event
circular queues.

smmuv3_write_eventq and smmuv3_cmq_consume will become static
in subsequent patches.

Invalidation commands are not yet dealt with. We do not cache
data that need to be invalidated. This will change with vhost
integration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8
- use address_space_rw
- helpers inspired from spec
---
 hw/arm/smmuv3-internal.h | 142 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3.c          | 151 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events      |   4 ++
 3 files changed, 297 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 72d9c6c..44564ed 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -162,4 +162,146 @@ static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
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
+#define CMD_TYPE(x)  extract32((x)->word[0], 0, 8)
+#define CMD_SEC(x)   extract32((x)->word[0], 9, 1)
+#define CMD_SEV(x)   extract32((x)->word[0], 10, 1)
+#define CMD_AC(x)    extract32((x)->word[0], 12, 1)
+#define CMD_AB(x)    extract32((x)->word[0], 13, 1)
+#define CMD_CS(x)    extract32((x)->word[0], 12, 2)
+#define CMD_SSID(x)  extract32((x)->word[0], 16, 16)
+#define CMD_SID(x)   ((x)->word[1])
+#define CMD_VMID(x)  extract32((x)->word[1], 0, 16)
+#define CMD_ASID(x)  extract32((x)->word[1], 16, 16)
+#define CMD_STAG(x)  extract32((x)->word[2], 0, 16)
+#define CMD_RESP(x)  extract32((x)->word[2], 11, 2)
+#define CMD_GRPID(x) extract32((x)->word[3], 0, 8)
+#define CMD_SIZE(x)  extract32((x)->word[3], 0, 16)
+#define CMD_LEAF(x)  extract32((x)->word[3], 0, 1)
+#define CMD_SPAN(x)  extract32((x)->word[3], 0, 5)
+#define CMD_ADDR(x) ({                                  \
+            uint64_t addr = (uint64_t)(x)->word[3];     \
+            addr <<= 32;                                \
+            addr |=  extract32((x)->word[3], 12, 20);   \
+            addr;                                       \
+        })
+
+int smmuv3_cmdq_consume(SMMUv3State *s);
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 6bad7e8..79970d7 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -94,6 +94,75 @@ void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
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
+static MemTxResult smmu_queue_read(SMMUQueue *q, void *data)
+{
+    dma_addr_t addr = Q_CONS_ENTRY(q);
+    MemTxResult ret;
+
+    ret = dma_memory_read(&address_space_memory, addr,
+                          (uint8_t *)data, q->entry_size);
+    if (ret != MEMTX_OK) {
+        return ret;
+    }
+
+    q->cons = queue_index_inc(q->cons, INDEX_MASK(q), WRAP_MASK(q));
+    return ret;
+}
+
+static void smmu_queue_write(SMMUQueue *q, void *data)
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
+    q->prod = queue_index_inc(q->prod, INDEX_MASK(q), WRAP_MASK(q));
+}
+
+static inline MemTxResult smmuv3_read_cmdq(SMMUv3State *s, Cmd *cmd)
+{
+    SMMUQueue *q = &s->cmdq;
+    return smmu_queue_read(q, cmd);
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
+    smmu_queue_write(q, evt);
+
+    if (q_empty) {
+        smmuv3_trigger_irq(s, SMMU_IRQ_EVTQ, 0);
+    }
+}
+
 static void smmuv3_init_regs(SMMUv3State *s)
 {
     /**
@@ -133,6 +202,88 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->sid_split = 0;
 }
 
+int smmuv3_cmdq_consume(SMMUv3State *s)
+{
+    SMMUCmdError cmd_error = SMMU_CERROR_NONE;
+    SMMUQueue *q = &s->cmdq;
+
+
+    if (!SMMUV3_CMDQ_ENABLED(s)) {
+        return 0;
+    }
+
+    while (!Q_EMPTY(q)) {
+        uint32_t pending = s->gerror ^ s->gerrorn;
+        uint32_t type;
+        Cmd cmd;
+
+        trace_smmuv3_cmdq_consume(Q_PROD(q), Q_CONS(q),
+                                  Q_PROD_WRAP(q), Q_CONS_WRAP(q));
+
+        if (FIELD_EX32(pending, GERROR, CMDQ_ERR)) {
+            break;
+        }
+
+        if (smmuv3_read_cmdq(s, &cmd) != MEMTX_OK) {
+            cmd_error = SMMU_CERROR_ABT;
+            break;
+        }
+
+        type = CMD_TYPE(&cmd);
+
+        switch (type) {
+        case SMMU_CMD_SYNC:
+            if (CMD_CS(&cmd) & CMD_SYNC_SIG_IRQ) {
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
+        if (type != SMMU_CERROR_ILL) {
+            trace_smmuv3_cmdq_opcode(cmd_stringify[type]);
+        }
+    }
+
+    if (cmd_error) {
+        error_report("GERROR_CMDQ: CONS.ERR=%d", cmd_error);
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
index 957a67e..d73e151 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -20,3 +20,7 @@ smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" va
 smmuv3_trigger_irq(int irq) "irq=%d"
 smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=0x%x, new gerror=0x%x"
 smmuv3_write_gerrorn(uint32_t acked, uint32_t gerrorn) "acked=0x%x, new gerrorn=0x%x"
+smmuv3_unhandled_cmd(uint32_t type) "Unhandled command type=%d"
+smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod=%d cons=%d prod.wrap=%d cons.wrap=%d"
+smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
+smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
-- 
2.5.5

