Received: by 10.28.4.212 with SMTP id 203csp877891wme;
        Wed, 25 Apr 2018 07:21:37 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoYzgZwjNR4XeyYsA/abuqjrtxHt+O8JqzzLk3FHOLg2NH1+hVPxHS16BUqAH/6PCa7zdfb
X-Received: by 10.55.155.211 with SMTP id d202mr30839710qke.337.1524666097454;
        Wed, 25 Apr 2018 07:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666097; cv=none;
        d=google.com; s=arc-20160816;
        b=IMuTkjtIjS2ExiLhuCKm14nbrYKruSi9bMuzFVLVGJFJnHoHlM848cEVnteW7r640M
         IpQvaMoOuyOW/k3qkWgvwrdyJWN1CLjxmhMDR8Xhr8NP/exZM5XHjYoOEQOBUHz6EX4e
         53NduBRDkbftiqlcvZWbF3gbWWQd3rAAUtYJdTPjWCOyG2QiId52okzn9F1m1yS0wZYW
         NKKZwunBPtOIqAO5hsutd0WuFHDdvTGyF06/6SWFyENNwyY2oB4zXKoUIuYXQdjiT5m8
         iIkyAjDRXWbR4tK/wBbXgnDWoM9JA0vMQuNMVlqYaxsuGlfayzQ/SayYJyUyB3MmEEAr
         vR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=XZ+RVjXAvt7PP5h6dY2DF23oLMLMXdE6fvDVPzGaR5g=;
        b=z4vne/FCTDK8FiBHD41YzsgJA6KlUlZCR/hN9+YnygXMclXup05f4Ptj1+71NeoNj1
         MbPTg1RF27Ugw2aSZAFFleuY+0o1HbHXhWydWRcrbhEd1mbyCrw1u2+2VLzv9HCtCe6A
         21gUe92rR5d3Tgv2qr7pR36gCQZpKwWZdc/eNOHVbXGM2D2KIA9vhdf6MajREV3DzjS7
         m2l9+kqm4Ss70wra+CLQYUSEFeV1FOMENkqNu2UZauNqb/Q6P98AopOgkTtmmZAkGw8D
         hqWjg95CNa21aGGdqU0Y+BEo9/8lZr0wMCij/w86/LTfXZftGLVwZA+2OqzNqoB/DnoZ
         bnvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w41si419038qvc.210.2018.04.25.07.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLIe-0003rP-Qn
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:21:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDq-0000dv-BE
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLDo-0005uy-Md
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:16:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43364 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLDj-0005qU-51; Wed, 25 Apr 2018 10:16:31 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B41F9EBFF0;
	Wed, 25 Apr 2018 14:16:30 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2938D2023239;
	Wed, 25 Apr 2018 14:16:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:51 +0200
Message-Id: <1524665762-31355-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:30 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v12 06/17] hw/arm/smmuv3: Queue helpers
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ES6Rxx6LTD7z

We introduce helpers to read/write into the command and event
circular queues.

smmuv3_write_eventq and smmuv3_cmq_consume will become static
in subsequent patches.

Invalidation commands are not yet dealt with. We do not cache
data that need to be invalidated. This will change with vhost
integration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v11 -> v12:
- added a comment related to queue_cons_incr deposit usage
- check type value in smmu_cmd_string
- added Peter's R-b

v9 -> v10:
- simplified macros
- s/BASE/Q_BASE
- use log2size field
- static inline functions replacing some macros
- simplified queue_prod_incr/queue_cons_incr and use deposit32
- trace for cmdq_consume failure

v8 -> v9:
- fix CMD_SSID & CMD_ADDR + some renamings
- do cons increment after the execution of the command
- add Q_INCONSISTENT()

v7 -> v8
- use address_space_rw
- helpers inspired from spec
---
 hw/arm/smmuv3-internal.h | 163 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/smmuv3.c          | 136 +++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events      |   5 ++
 3 files changed, 304 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index e27c128..223d840 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -153,4 +153,167 @@ static inline bool smmuv3_gerror_irq_enabled(SMMUv3State *s)
 void smmuv3_trigger_irq(SMMUv3State *s, SMMUIrq irq, uint32_t gerror_mask);
 void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t gerrorn);
 
+/* Queue Handling */
+
+#define Q_BASE(q)          ((q)->base & SMMU_BASE_ADDR_MASK)
+#define WRAP_MASK(q)       (1 << (q)->log2size)
+#define INDEX_MASK(q)      (((1 << (q)->log2size)) - 1)
+#define WRAP_INDEX_MASK(q) ((1 << ((q)->log2size + 1)) - 1)
+
+#define Q_CONS(q) ((q)->cons & INDEX_MASK(q))
+#define Q_PROD(q) ((q)->prod & INDEX_MASK(q))
+
+#define Q_CONS_ENTRY(q)  (Q_BASE(q) + (q)->entry_size * Q_CONS(q))
+#define Q_PROD_ENTRY(q)  (Q_BASE(q) + (q)->entry_size * Q_PROD(q))
+
+#define Q_CONS_WRAP(q) (((q)->cons & WRAP_MASK(q)) >> (q)->log2size)
+#define Q_PROD_WRAP(q) (((q)->prod & WRAP_MASK(q)) >> (q)->log2size)
+
+static inline bool smmuv3_q_full(SMMUQueue *q)
+{
+    return ((q->cons ^ q->prod) & WRAP_INDEX_MASK(q)) == WRAP_MASK(q);
+}
+
+static inline bool smmuv3_q_empty(SMMUQueue *q)
+{
+    return (q->cons & WRAP_INDEX_MASK(q)) == (q->prod & WRAP_INDEX_MASK(q));
+}
+
+static inline void queue_prod_incr(SMMUQueue *q)
+{
+    q->prod = (q->prod + 1) & WRAP_INDEX_MASK(q);
+}
+
+static inline void queue_cons_incr(SMMUQueue *q)
+{
+    /*
+     * We have to use deposit for the CONS registers to preserve
+     * the ERR field in the high bits.
+     */
+    q->cons = deposit32(q->cons, 0, q->log2size + 1, q->cons + 1);
+}
+
+static inline bool smmuv3_cmdq_enabled(SMMUv3State *s)
+{
+    return FIELD_EX32(s->cr[0], CR0, CMDQEN);
+}
+
+static inline bool smmuv3_eventq_enabled(SMMUv3State *s)
+{
+    return FIELD_EX32(s->cr[0], CR0, EVENTQEN);
+}
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
+typedef enum SMMUCommandType {
+    SMMU_CMD_NONE            = 0x00,
+    SMMU_CMD_PREFETCH_CONFIG       ,
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
+    SMMU_CMD_TLBI_EL2_VAA,
+    SMMU_CMD_TLBI_S12_VMALL  = 0x28,
+    SMMU_CMD_TLBI_S2_IPA     = 0x2a,
+    SMMU_CMD_TLBI_NSNH_ALL   = 0x30,
+    SMMU_CMD_ATC_INV         = 0x40,
+    SMMU_CMD_PRI_RESP,
+    SMMU_CMD_RESUME          = 0x44,
+    SMMU_CMD_STALL_TERM,
+    SMMU_CMD_SYNC,
+} SMMUCommandType;
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
+static inline const char *smmu_cmd_string(SMMUCommandType type)
+{
+    if (type > SMMU_CMD_NONE && type < ARRAY_SIZE(cmd_stringify)) {
+        return cmd_stringify[type] ? cmd_stringify[type] : "UNKNOWN";
+    } else {
+        return "INVALID";
+    }
+}
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
index c0cedca..8f50f15 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -95,6 +95,46 @@ void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
     trace_smmuv3_write_gerrorn(toggled & pending, s->gerrorn);
 }
 
+static inline MemTxResult queue_read(SMMUQueue *q, void *data)
+{
+    dma_addr_t addr = Q_CONS_ENTRY(q);
+
+    return dma_memory_read(&address_space_memory, addr, data, q->entry_size);
+}
+
+static MemTxResult queue_write(SMMUQueue *q, void *data)
+{
+    dma_addr_t addr = Q_PROD_ENTRY(q);
+    MemTxResult ret;
+
+    ret = dma_memory_write(&address_space_memory, addr, data, q->entry_size);
+    if (ret != MEMTX_OK) {
+        return ret;
+    }
+
+    queue_prod_incr(q);
+    return MEMTX_OK;
+}
+
+void smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
+{
+    SMMUQueue *q = &s->eventq;
+
+    if (!smmuv3_eventq_enabled(s)) {
+        return;
+    }
+
+    if (smmuv3_q_full(q)) {
+        return;
+    }
+
+    queue_write(q, evt);
+
+    if (smmuv3_q_empty(q)) {
+        smmuv3_trigger_irq(s, SMMU_IRQ_EVTQ, 0);
+    }
+}
+
 static void smmuv3_init_regs(SMMUv3State *s)
 {
     /**
@@ -134,6 +174,102 @@ static void smmuv3_init_regs(SMMUv3State *s)
     s->sid_split = 0;
 }
 
+int smmuv3_cmdq_consume(SMMUv3State *s)
+{
+    SMMUCmdError cmd_error = SMMU_CERROR_NONE;
+    SMMUQueue *q = &s->cmdq;
+    SMMUCommandType type = 0;
+
+    if (!smmuv3_cmdq_enabled(s)) {
+        return 0;
+    }
+    /*
+     * some commands depend on register values, typically CR0. In case those
+     * register values change while handling the command, spec says it
+     * is UNPREDICTABLE whether the command is interpreted under the new
+     * or old value.
+     */
+
+    while (!smmuv3_q_empty(q)) {
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
+        trace_smmuv3_cmdq_opcode(smmu_cmd_string(type));
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
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Illegal command type: %d\n", CMD_TYPE(&cmd));
+            break;
+        }
+        if (cmd_error) {
+            break;
+        }
+        /*
+         * We only increment the cons index after the completion of
+         * the command. We do that because the SYNC returns immediately
+         * and does not check the completion of previous commands
+         */
+        queue_cons_incr(q);
+    }
+
+    if (cmd_error) {
+        trace_smmuv3_cmdq_consume_error(smmu_cmd_string(type), cmd_error);
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
 static MemTxResult smmu_write_mmio(void *opaque, hwaddr offset, uint64_t data,
                                    unsigned size, MemTxAttrs attrs)
 {
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index b77f8d2..38b35fa 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -18,3 +18,8 @@ smmuv3_read_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr:
 smmuv3_trigger_irq(int irq) "irq=%d"
 smmuv3_write_gerror(uint32_t toggled, uint32_t gerror) "toggled=0x%x, new GERROR=0x%x"
 smmuv3_write_gerrorn(uint32_t acked, uint32_t gerrorn) "acked=0x%x, new GERRORN=0x%x"
+smmuv3_unhandled_cmd(uint32_t type) "Unhandled command type=%d"
+smmuv3_cmdq_consume(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod=%d cons=%d prod.wrap=%d cons.wrap=%d"
+smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
+smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
+smmuv3_cmdq_consume_error(const char *cmd_name, uint8_t cmd_error) "Error on %s command execution: %d"
-- 
2.5.5

