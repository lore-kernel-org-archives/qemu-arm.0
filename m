Received: by 10.223.188.70 with SMTP id a6csp1291693wrh;
        Fri, 1 Sep 2017 10:28:19 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb7pk/S+LUoeNAdejfgWlTvAUJxuJSbUpcMuLsVdTDTXbjzi6FPcHXvm0QVRjJOW/8jUW+HC
X-Received: by 10.200.52.65 with SMTP id v1mr3783227qtb.232.1504286899551;
        Fri, 01 Sep 2017 10:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504286899; cv=none;
        d=google.com; s=arc-20160816;
        b=cSXJgoulDJOHlrzSVzsExf94QZvVvRlM7/Ip4kK1z2wft9kEep/WcUC62+Y/MwJUBO
         xqbWuwHls5v+9ZAtw260Mpg/SIL800ws7Tu1ynimjv06f712KSU9MH2dL3lZV8RLHFR4
         +U8u8ZgAJi1BMWshFb17dSww/ibMwzYvRlELINeCYHCb1TY1FwGDp1jXjl1Dr+nSXiet
         c3Y1llcUD9U2j3ois7AilC9gr7Blc/DqNokpK+N9pD9oJ/Lk23/Fjl+fjSgDO2dlvsuV
         Ia202f7KBsgrnt8APYuDHVK54AySgmvBoIDVHeHwZdaA/koCEsIEkPX0oDdFKHf18l+k
         a3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=93kleQjZoiN8dZlKmRKEy7wBfIsNMVzLprv+RytNd+8=;
        b=NxIWd+C0AW0DjS2r+SzSm6CfjVfKpNGSY5EVNV7w1Te1PWX0+vhWzikegXJUCXNKTe
         zV101C9IT3PLFJu0KISUypetYJfGSKnDcvpjztpke2fiM4+D3jiSkaA0EFn5zzNKCsio
         zxRCsdfd25Xm5aEbZ5uyL/NctLgLAqNdjKqdT0VZuT/Yy1in3xBXMdg3It8drLJSRPj/
         QIymO+LMj7aH/bEatLK0udFE2wJwDGSkVlR7X0DapM9e9zvBFYBX+2jf5yzZY2+gLUQh
         CrSungF5ha4zLB3HJBhKZuAA4gAvdDfmLheZviIWtMxuZkZag2lVPfSPqNzkK0NS/PSP
         W7ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b58si666978qtc.127.2017.09.01.10.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpjt-00027j-7l
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:28:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnped-0005SZ-OP
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpea-0002rL-Kf
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:22:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53016)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpea-0002qI-At; Fri, 01 Sep 2017 13:22:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C5307F7DA;
	Fri,  1 Sep 2017 17:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4C5307F7DA
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED6595450A;
	Fri,  1 Sep 2017 17:22:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:11 +0200
Message-Id: <1504286483-23327-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 01 Sep 2017 17:22:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 08/20] hw/arm/smmuv3: Implement MMIO write
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2zdymzMq8LEx

Now we have relevant helpers for queue and irq
management, let's implement MMIO write operations

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3-internal.h | 103 +++++++++++++++++++++++-
 hw/arm/smmuv3.c          | 204 ++++++++++++++++++++++++++++++++++++++++++++++-
 hw/arm/trace-events      |  15 ++++
 3 files changed, 317 insertions(+), 5 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index d88f141..a5d60b4 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -215,8 +215,6 @@ static inline int smmu_enabled(SMMUV3State *s)
 
 #define SMMU_CMDQ_ERR(s) (SMMU_PENDING_GERRORS(s) & SMMU_GERROR_CMDQ)
 
-void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn);
-
 /***************************
  * Queue Handling
  ***************************/
@@ -261,7 +259,106 @@ static inline void smmu_write_cmdq_err(SMMUV3State *s, uint32_t err_type)
                         regval | err_type << SMMU_CMD_CONS_ERR_SHIFT);
 }
 
-MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd);
 void smmuv3_write_evtq(SMMUV3State *s, Evt *evt);
 
+/*****************************
+ * Commands
+ *****************************/
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
+/*****************************
+ * CMDQ fields
+ *****************************/
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
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2f96463..f35fadc 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -72,7 +72,7 @@ static void smmuv3_irq_trigger(SMMUV3State *s, SMMUIrq irq, uint32_t gerror_val)
     }
 }
 
-void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn)
+static void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn)
 {
     uint32_t pending_gerrors = SMMU_PENDING_GERRORS(s);
     uint32_t sanitized;
@@ -116,7 +116,7 @@ static void smmu_q_write(SMMUQueue *q, void *data)
     }
 }
 
-MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd)
+static MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd)
 {
     SMMUQueue *q = &s->cmdq;
     MemTxResult ret = smmu_q_read(q, cmd);
@@ -224,6 +224,147 @@ static inline void smmu_update_base_reg(SMMUV3State *s, uint64_t *base,
     *base = val & ~(SMMU_BASE_RA | 0x3fULL);
 }
 
+static int smmuv3_cmdq_consume(SMMUV3State *s)
+{
+    SMMUCmdError cmd_error = SMMU_CERROR_NONE;
+
+    trace_smmuv3_cmdq_consume(SMMU_CMDQ_ERR(s), smmu_cmd_q_enabled(s),
+                              s->cmdq.prod, s->cmdq.cons,
+                              s->cmdq.wrap.prod, s->cmdq.wrap.cons);
+
+    if (!smmu_cmd_q_enabled(s)) {
+        return 0;
+    }
+
+    while (!SMMU_CMDQ_ERR(s) && !smmu_is_q_empty(s, &s->cmdq)) {
+        uint32_t type;
+        Cmd cmd;
+
+        if (smmuv3_read_cmdq(s, &cmd) != MEMTX_OK) {
+            cmd_error = SMMU_CERROR_ABT;
+            break;
+        }
+
+        type = CMD_TYPE(&cmd);
+
+        trace_smmuv3_cmdq_opcode(cmd_stringify[type]);
+
+        switch (CMD_TYPE(&cmd)) {
+        case SMMU_CMD_SYNC:
+            if (CMD_CS(&cmd) & CMD_SYNC_SIG_IRQ) {
+                smmuv3_irq_trigger(s, SMMU_IRQ_CMD_SYNC, 0);
+            }
+            break;
+        case SMMU_CMD_PREFETCH_CONFIG:
+        case SMMU_CMD_PREFETCH_ADDR:
+            break;
+        case SMMU_CMD_CFGI_STE:
+        {
+             uint32_t streamid = cmd.word[1];
+
+             trace_smmuv3_cmdq_cfgi_ste(streamid);
+            break;
+        }
+        case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
+        {
+            uint32_t start = cmd.word[1], range, end;
+
+            range = extract32(cmd.word[2], 0, 5);
+            end = start + (1 << (range + 1)) - 1;
+            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
+            break;
+        }
+        case SMMU_CMD_CFGI_CD:
+        case SMMU_CMD_CFGI_CD_ALL:
+            trace_smmuv3_unhandled_cmd(type);
+            break;
+        case SMMU_CMD_TLBI_NH_ALL:
+        case SMMU_CMD_TLBI_NH_ASID:
+            trace_smmuv3_unhandled_cmd(type);
+            break;
+        case SMMU_CMD_TLBI_NH_VA:
+        {
+            int asid = extract32(cmd.word[1], 16, 16);
+            int vmid = extract32(cmd.word[1], 0, 16);
+            uint64_t low = extract32(cmd.word[2], 12, 20);
+            uint64_t high = cmd.word[3];
+            uint64_t addr = high << 32 | (low << 12);
+
+            trace_smmuv3_cmdq_tlbi_nh_va(asid, vmid, addr);
+            break;
+        }
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
+            trace_smmuv3_unhandled_cmd(type);
+            break;
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
+    }
+
+    if (cmd_error) {
+        error_report("GERROR_CMDQ: CONS.ERR=%d", cmd_error);
+        smmu_write_cmdq_err(s, cmd_error);
+        smmuv3_irq_trigger(s, SMMU_IRQ_GERROR, SMMU_GERROR_CMDQ);
+    }
+
+    trace_smmuv3_cmdq_consume_out(s->cmdq.wrap.prod, s->cmdq.prod,
+                                  s->cmdq.wrap.cons, s->cmdq.cons);
+
+    return 0;
+}
+
+static void smmu_update_qreg(SMMUV3State *s, SMMUQueue *q, hwaddr reg,
+                             uint32_t off, uint64_t val, unsigned size)
+{
+   if (size == 8 && off == 0) {
+        smmu_write64_reg(s, reg, val);
+    } else {
+        smmu_write32_reg(s, reg, val);
+    }
+
+    switch (off) {
+    case 0:                             /* BASE register */
+        val = smmu_read64_reg(s, reg);
+        q->shift = val & 0x1f;
+        q->entries = 1 << (q->shift);
+        smmu_update_base_reg(s, &q->base, val);
+        break;
+
+    case 8:                             /* PROD */
+        q->prod = Q_IDX(q, val);
+        q->wrap.prod = val >> q->shift;
+        break;
+
+    case 12:                             /* CONS */
+        q->cons = Q_IDX(q, val);
+        q->wrap.cons = val >> q->shift;
+        trace_smmuv3_update_qreg(q->cons, val);
+        break;
+
+    }
+
+    if (reg == SMMU_REG_CMDQ_PROD) {
+        smmuv3_cmdq_consume(s);
+    }
+}
+
 static void smmu_write_mmio_fixup(SMMUV3State *s, hwaddr *addr)
 {
     switch (*addr) {
@@ -236,6 +377,65 @@ static void smmu_write_mmio_fixup(SMMUV3State *s, hwaddr *addr)
 static void smmu_write_mmio(void *opaque, hwaddr addr,
                             uint64_t val, unsigned size)
 {
+    SMMUState *sys = opaque;
+    SMMUV3State *s = SMMU_V3_DEV(sys);
+
+    smmu_write_mmio_fixup(s, &addr);
+
+    trace_smmuv3_write_mmio(addr, val, size);
+
+    switch (addr) {
+    case 0xFDC ... 0xFFC:
+    case SMMU_REG_IDR0 ... SMMU_REG_IDR5:
+        trace_smmuv3_write_mmio_idr(addr, val);
+        return;
+    case SMMU_REG_GERRORN:
+        smmuv3_write_gerrorn(s, val);
+        /*
+         * By acknowledging the CMDQ_ERR, SW may notify cmds can
+         * be processed again
+         */
+        smmuv3_cmdq_consume(s);
+        return;
+    case SMMU_REG_CR0:
+        smmu_write32_reg(s, SMMU_REG_CR0, val);
+        /* immediatly reflect the changes in CR0_ACK */
+        smmu_write32_reg(s, SMMU_REG_CR0_ACK, val);
+        /* in case the command queue has been enabled */
+        smmuv3_cmdq_consume(s);
+        return;
+    case SMMU_REG_IRQ_CTRL:
+        smmu_write32_reg(s, SMMU_REG_IRQ_CTRL_ACK, val);
+        return;
+    case SMMU_REG_STRTAB_BASE:
+        smmu_update_base_reg(s, &s->strtab_base, val);
+        return;
+    case SMMU_REG_STRTAB_BASE_CFG:
+        if (((val >> 16) & 0x3) == 0x1) {
+            s->sid_split = (val >> 6) & 0x1f;
+            s->features |= SMMU_FEATURE_2LVL_STE;
+        }
+        return;
+    case SMMU_REG_CMDQ_BASE ... SMMU_REG_CMDQ_CONS:
+        smmu_update_qreg(s, &s->cmdq, addr, addr - SMMU_REG_CMDQ_BASE,
+                         val, size);
+        return;
+
+    case SMMU_REG_EVTQ_BASE ... SMMU_REG_EVTQ_CONS:
+        smmu_update_qreg(s, &s->evtq, addr, addr - SMMU_REG_EVTQ_BASE,
+                         val, size);
+        return;
+
+    case SMMU_REG_PRIQ_BASE ... SMMU_REG_PRIQ_CONS:
+        error_report("%s PRI queue is not supported", __func__);
+        abort();
+    }
+
+    if (size == 8) {
+        smmu_write64_reg(s, addr, val);
+    } else {
+        smmu_write32_reg(s, addr, (uint32_t)val);
+    }
 }
 
 static uint64_t smmu_read_mmio(void *opaque, hwaddr addr, unsigned size)
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index c1ce8eb..40f2057 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -19,3 +19,18 @@ smmu_set_translated_address(hwaddr iova, hwaddr pa) "iova = 0x%"PRIx64" -> pa =
 smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
 smmuv3_irq_trigger(int irq, uint32_t gerror, uint32_t pending) "irq=%d gerror=0x%x pending gerrors=0x%x"
 smmuv3_write_gerrorn(uint32_t gerrorn, uint32_t sanitized, uint32_t pending) "gerrorn=0x%x sanitized=0x%x pending=0x%x"
+smmuv3_unhandled_cmd(uint32_t type) "Unhandled command type=%d"
+smmuv3_cmdq_consume(int error, bool enabled, uint32_t prod, uint32_t cons, uint8_t wrap_prod, uint8_t wrap_cons) "error=%d, enabled=%d prod=%d cons=%d wrap.prod=%d wrap.cons=%d"
+smmuv3_cmdq_consume_details(hwaddr base, uint32_t cons, uint32_t prod, uint32_t word, uint8_t wrap_cons) "CMDQ base: 0x%"PRIx64" cons:%d prod:%d val:0x%x wrap:%d"
+smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
+smmuv3_cmdq_cfgi_ste(int streamid) "     |_ streamid =%d"
+smmuv3_cmdq_cfgi_ste_range(int start, int end) "     |_ start=0x%d - end=0x%d"
+smmuv3_cmdq_tlbi_nh_va(int asid, int vmid, uint64_t addr) "     |_ asid =%d vmid =%d addr=0x%"PRIx64
+smmuv3_cmdq_consume_out(uint8_t prod_wrap, uint32_t prod, uint8_t cons_wrap, uint32_t cons) "prod_wrap:%d, prod:0x%x cons_wrap:%d cons:0x%x"
+smmuv3_update(bool is_empty, uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "q empty:%d prod:%d cons:%d p.wrap:%d p.cons:%d"
+smmuv3_update_check_cmd(int error) "cmdq not enabled or error :0x%x"
+smmuv3_update_qreg(uint32_t cons, uint64_t val) "cons written : %d val:0x%"PRIx64
+smmuv3_write_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
+smmuv3_write_mmio_idr(hwaddr addr, uint64_t val) "write to RO/Unimpl reg 0x%lx val64:0x%lx"
+smmuv3_write_mmio_evtq_cons_bef_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "Before clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
+smmuv3_write_mmio_evtq_cons_after_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "after clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
-- 
2.5.5

