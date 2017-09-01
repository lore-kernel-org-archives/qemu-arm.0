Received: by 10.223.188.70 with SMTP id a6csp1286067wrh;
        Fri, 1 Sep 2017 10:23:25 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6zaQLQEFUgqGMrYzHfsBQiUnRg8FImyEb761Vn4IFTTGIuNZKmdrO8yh/LbZCVy2bQUcN8
X-Received: by 10.237.49.130 with SMTP id 2mr4016856qth.171.1504286605415;
        Fri, 01 Sep 2017 10:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504286605; cv=none;
        d=google.com; s=arc-20160816;
        b=QK1eBd7yUmfQQCy5IqgF8/xsPMJrdWGCkDTiIqAXm9GtTtWdIpj1/XG0rLXDuFpYic
         iTEQfvaFwliUHn3CV3f0h3IawtRw/XJIqeEL5A9elKHHKFxjUFmuAZzWHPPKh/nwh6wQ
         lXc36kuzYtsJsdUNmjWW39oPuV8np0dotfzDThLPsu5FQDpLMZSkS8kYM4F6UIWPDtKD
         ymrACnX1tFE8/qHmtfZ0rgNmXKeU/Vsjp7ayUzcDLoIp7WIofs6eu+QPwkrbJ+WhPjoM
         E2JiwCI8KCdxT067yVKSyR2ONiRxWIQcUmjUtI/4e8NPG9/3R4ZTXYJNx70nbrv443of
         dv1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=T2wag/Dv+zI7CllAe6m9H3YZbszNaMkUvcBCQPMMv80=;
        b=DjXPB5/k25pLYh3FF+2aLPV0y+URprbdoWx7A8dxKV1dv591Xui9jPmCsHmYcYmIUH
         DoTfYPuOGlj2tSACAM0R9xHK2ridOK/LUWQhqdFf4RuwbLzKcxQDXu72fDRNXwVTOUXB
         0GJYmKmkc1j6ql3RHXjVIjbga7GEFeauAEtxH7dC1xRUu/X+ALSYlbKvnBMDjfI5qt00
         SkKiwRrqwcz2ipMI2x29/WgVQR9IaYn8Xd/vGrEgykm1qcuHr6hfRH6SEpLK2w+CfzI5
         buz3zmoJjayHfbjF2qGrSJMD3zd6GC71eDXugk1ERVEquLPzAqRQLWi9ayOWFtJGOvy2
         qrIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s66si10538508qkf.413.2017.09.01.10.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpf9-0005qX-2W
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:23:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpeq-0005fr-7p
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:23:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpen-000371-Cj
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:23:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55408)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpen-000369-3c; Fri, 01 Sep 2017 13:23:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16CFA61481;
	Fri,  1 Sep 2017 17:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 16CFA61481
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A6D4C669FC;
	Fri,  1 Sep 2017 17:22:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:12 +0200
Message-Id: <1504286483-23327-10-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 01 Sep 2017 17:23:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 09/20] hw/arm/smmuv3: Event queue recording
 helper
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
X-TUID: vLFWAFWaCIz+

Let's introduce a helper function aiming at recording an
event in the event queue.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

At the moment, for some events we do not fill all the fields.
Typically filling the FetchAddr field resulting of an abort
on page table walk would require to return more information
from this latter in case of error.

However with enabled use cases I have not seen any event
recorded yet.
---
 hw/arm/smmuv3-internal.h | 45 ++++++++++++++++++++++++--
 hw/arm/smmuv3.c          | 84 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 126 insertions(+), 3 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index a5d60b4..e3e9828 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -259,8 +259,6 @@ static inline void smmu_write_cmdq_err(SMMUV3State *s, uint32_t err_type)
                         regval | err_type << SMMU_CMD_CONS_ERR_SHIFT);
 }
 
-void smmuv3_write_evtq(SMMUV3State *s, Evt *evt);
-
 /*****************************
  * Commands
  *****************************/
@@ -361,4 +359,47 @@ enum { /* Command completion notification */
             addr;                                       \
         })
 
+/*****************************
+ * EVTQ fields
+ *****************************/
+
+#define EVT_Q_OVERFLOW        (1 << 31)
+
+#define EVT_SET_TYPE(x, t)    deposit32((x)->word[0], 0, 8, t)
+#define EVT_SET_SID(x, s)     ((x)->word[1] =  s)
+#define EVT_SET_INPUT_ADDR(x, addr) ({                    \
+            (x)->word[5] = (uint32_t)(addr >> 32);        \
+            (x)->word[4] = (uint32_t)(addr & 0xffffffff); \
+        })
+#define EVT_SET_RNW(x, rnw)     deposit32((x)->word[3], 3, 1, rnw)
+
+/*****************************
+ * Events
+ *****************************/
+
+typedef enum evt_err {
+    SMMU_EVT_OK,
+    SMMU_EVT_F_UUT,
+    SMMU_EVT_C_BAD_SID,
+    SMMU_EVT_F_STE_FETCH,
+    SMMU_EVT_C_BAD_STE,
+    SMMU_EVT_F_BAD_ATS_REQ,
+    SMMU_EVT_F_STREAM_DISABLED,
+    SMMU_EVT_F_TRANS_FORBIDDEN,
+    SMMU_EVT_C_BAD_SSID,
+    SMMU_EVT_F_CD_FETCH,
+    SMMU_EVT_C_BAD_CD,
+    SMMU_EVT_F_WALK_EXT_ABRT,
+    SMMU_EVT_F_TRANS        = 0x10,
+    SMMU_EVT_F_ADDR_SZ,
+    SMMU_EVT_F_ACCESS,
+    SMMU_EVT_F_PERM,
+    SMMU_EVT_F_TLB_CONFLICT = 0x20,
+    SMMU_EVT_F_CFG_CONFLICT = 0x21,
+    SMMU_EVT_E_PAGE_REQ     = 0x24,
+} SMMUEvtErr;
+
+void smmuv3_record_event(SMMUV3State *s, hwaddr iova,
+                         uint32_t sid, bool is_write, SMMUEvtErr type);
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index f35fadc..7470576 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -132,7 +132,7 @@ static MemTxResult smmuv3_read_cmdq(SMMUV3State *s, Cmd *cmd)
     return ret;
 }
 
-void smmuv3_write_evtq(SMMUV3State *s, Evt *evt)
+static void smmuv3_write_evtq(SMMUV3State *s, Evt *evt)
 {
     SMMUQueue *q = &s->evtq;
     bool was_empty = smmu_is_q_empty(s, q);
@@ -157,6 +157,88 @@ void smmuv3_write_evtq(SMMUV3State *s, Evt *evt)
     }
 }
 
+/*
+ * smmuv3_record_event - Record an event
+ */
+void smmuv3_record_event(SMMUV3State *s, hwaddr iova,
+                         uint32_t sid, IOMMUAccessFlags perm,
+                         SMMUEvtErr type)
+{
+    Evt evt;
+    bool rnw = perm & IOMMU_RO;
+
+    if (!smmu_evt_q_enabled(s)) {
+        return;
+    }
+
+    EVT_SET_TYPE(&evt, type);
+    EVT_SET_SID(&evt, sid);
+    /* SSV=0 (substream invalid) and substreamID= 0 */
+
+    switch (type) {
+    case SMMU_EVT_OK:
+        return;
+    case SMMU_EVT_F_UUT:
+        EVT_SET_INPUT_ADDR(&evt, iova);
+        EVT_SET_RNW(&evt, rnw);
+        /* PnU and Ind not filled */
+        break;
+    case SMMU_EVT_C_BAD_SID:
+        break;
+    case SMMU_EVT_F_STE_FETCH:
+        /* Implementation defined and FetchAddr not filled yet */
+        break;
+    case SMMU_EVT_C_BAD_STE:
+        break;
+    case SMMU_EVT_F_BAD_ATS_REQ:
+        /* ATS not yet implemented */
+        break;
+    case SMMU_EVT_F_STREAM_DISABLED:
+        break;
+    case SMMU_EVT_F_TRANS_FORBIDDEN:
+        EVT_SET_INPUT_ADDR(&evt, iova);
+        EVT_SET_RNW(&evt, rnw);
+        break;
+    case SMMU_EVT_C_BAD_SSID:
+        break;
+    case SMMU_EVT_F_CD_FETCH:
+        break;
+    case SMMU_EVT_C_BAD_CD:
+        /* Implementation defined and FetchAddr not filled yet */
+        break;
+    case SMMU_EVT_F_WALK_EXT_ABRT:
+        EVT_SET_INPUT_ADDR(&evt, iova);
+        EVT_SET_RNW(&evt, rnw);
+        /* Reason, Class, S2, Ind, PnU, FetchAddr not filled yet */
+        break;
+    case SMMU_EVT_F_TRANS:
+    case SMMU_EVT_F_ADDR_SZ:
+    case SMMU_EVT_F_ACCESS:
+        EVT_SET_INPUT_ADDR(&evt, iova);
+        EVT_SET_RNW(&evt, rnw);
+        /* STAG, Class, S2, InD, PnU, IPA not filled yet */
+        break;
+    case SMMU_EVT_F_PERM:
+        EVT_SET_INPUT_ADDR(&evt, iova);
+        EVT_SET_RNW(&evt, rnw);
+        /* STAG, TTRnW, Class, S2, InD, PnU, IPA not filled yet */
+        break;
+    case SMMU_EVT_F_TLB_CONFLICT:
+        EVT_SET_INPUT_ADDR(&evt, iova);
+        EVT_SET_RNW(&evt, rnw);
+        /* Reason, S2, InD, PnU, IPA not filled yet */
+        break;
+    case SMMU_EVT_F_CFG_CONFLICT:
+        /* Implementation defined reason not filled yet */
+        break;
+    case SMMU_EVT_E_PAGE_REQ:
+        /* PRI not supported */
+        break;
+    }
+
+    smmuv3_write_evtq(s, &evt);
+}
+
 static void smmuv3_init_regs(SMMUV3State *s)
 {
     uint32_t data =
-- 
2.5.5

