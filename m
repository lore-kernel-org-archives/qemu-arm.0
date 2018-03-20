Received: by 10.28.91.67 with SMTP id p64csp3779902wmb;
        Tue, 20 Mar 2018 05:41:30 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt5Mu7g46Od9xMDil2dajohNdzpG+RadqQXOOqGmXA7egJldIjAoaY5Q9oNK3BdP/cYWZN8
X-Received: by 10.200.38.7 with SMTP id u7mr8919094qtu.269.1521549690013;
        Tue, 20 Mar 2018 05:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521549690; cv=none;
        d=google.com; s=arc-20160816;
        b=JZCtQRLPg0oRHudw2oxX8gpZPxXQ0O+c3KyPLB46o1J9sFZQ/ugxu7OKoLjBhtxoiD
         vYpKdcAbOgKrSknGPPIa9VzfTVzY6LnIrwhgFmnd9RAnJPeH/XEQ02ySrMZUru9mPy9Q
         vEXVUiEuDcFEaYxuZSEStXmFdTiGqDLauxss8RcAYFPkrWqBZ0T34x4nif5pMonqnUaU
         XFC1lK7fYD15F8PhnqHYwVEpXbuKJBNUwfs7FcHL2i+zXpQzHXVR5uXhD6x/mLZPfTMy
         v1CLkQpnaQebeh1RZwswdcEnrCvqagPZEH6kDCrIH1A4O3Qd6EZoccqE1uNizl/WHxcr
         kkRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MRaRS4nKwxSRRjRt2fnGxoTZNa5sikBjxo8/6pgsc0Y=;
        b=Zq9MH1eg+X6O/BvFbQQ6wOGIXGomleQc5g2YbwY4PDvBSxQG+5aAXsA8a+MXHvILxg
         iwMaMr5f0Z+fMl1rYGYSZTxjnsrSjQos8NQEJ3ptr/JtZVLwYUVI+VGdRGFD18pADIgd
         cryr+tINEypDWWHu3VDWbcHjHInr3eZ4vOVDaDxp9YGRZiAEniuQjwGkUyeXYH4Atw/c
         3MSQl9z3a7lAvGFmqAIUF6PsZ6lrbSlh33BcOdBAXyIBKvf9YoS1q9LQ8N1MWGynJIzA
         TjEbNcIwkc/Bx/bhYkHj1ydhJNLgfKGlxO593YbkGuHQHuKADA7DcZsXkViM5JJ8beuo
         G7jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p126si2746174qkc.425.2018.03.20.05.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGa1-0001uR-Dt
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:41:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXD-0007jP-3a
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXB-0003aC-JC
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:35 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38484 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGXB-0003Zx-DZ; Tue, 20 Mar 2018 08:38:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E50E84026129;
	Tue, 20 Mar 2018 12:38:32 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55A9A94583;
	Tue, 20 Mar 2018 12:38:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:30 +0100
Message-Id: <1521549456-14072-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
References: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 12:38:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 20 Mar 2018 12:38:33 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v10 08/14] hw/arm/smmuv3: Event queue recording
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: btcq45T5I63e

Let's introduce a helper function aiming at recording an
event in the event queue.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v9 -> v10:
- rework SMMU_EVENT_STRING
- trigger a GERROR EVENTQ_ABT_ERR in case of eventq write failure

v8 -> v9:
- add SMMU_EVENT_STRING

v7 -> v8:
- use dma_addr_t instead of hwaddr in smmuv3_record_event()
- introduce struct SMMUEventInfo
- add event_stringify + helpers for all fields
---
 hw/arm/smmuv3-internal.h | 142 ++++++++++++++++++++++++++++++++++++++++++++++-
 hw/arm/smmuv3.c          | 108 +++++++++++++++++++++++++++++++++--
 hw/arm/trace-events      |   1 +
 3 files changed, 243 insertions(+), 8 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 8550be0..8e546bf 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -205,8 +205,6 @@ static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
     s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
 }
 
-void smmuv3_write_eventq(SMMUv3State *s, Evt *evt);
-
 /* Commands */
 
 typedef enum SMMUCommandType {
@@ -308,4 +306,144 @@ enum { /* Command completion notification */
 
 #define SMMU_FEATURE_2LVL_STE (1 << 0)
 
+/* Events */
+
+typedef enum SMMUEventType {
+    SMMU_EVT_OK                 = 0x00,
+    SMMU_EVT_F_UUT              = 0x01,
+    SMMU_EVT_C_BAD_STREAMID     = 0x02,
+    SMMU_EVT_F_STE_FETCH        = 0x03,
+    SMMU_EVT_C_BAD_STE          = 0x04,
+    SMMU_EVT_F_BAD_ATS_TREQ     = 0x05,
+    SMMU_EVT_F_STREAM_DISABLED  = 0x06,
+    SMMU_EVT_F_TRANS_FORBIDDEN  = 0x07,
+    SMMU_EVT_C_BAD_SUBSTREAMID  = 0x08,
+    SMMU_EVT_F_CD_FETCH         = 0x09,
+    SMMU_EVT_C_BAD_CD           = 0x0a,
+    SMMU_EVT_F_WALK_EABT        = 0x0b,
+    SMMU_EVT_F_TRANSLATION      = 0x10,
+    SMMU_EVT_F_ADDR_SIZE        = 0x11,
+    SMMU_EVT_F_ACCESS           = 0x12,
+    SMMU_EVT_F_PERMISSION       = 0x13,
+    SMMU_EVT_F_TLB_CONFLICT     = 0x20,
+    SMMU_EVT_F_CFG_CONFLICT     = 0x21,
+    SMMU_EVT_E_PAGE_REQ         = 0x24,
+} SMMUEventType;
+
+static const char *event_stringify[] = {
+    [SMMU_EVT_OK]                       = "SMMU_EVT_OK",
+    [SMMU_EVT_F_UUT]                    = "SMMU_EVT_F_UUT",
+    [SMMU_EVT_C_BAD_STREAMID]           = "SMMU_EVT_C_BAD_STREAMID",
+    [SMMU_EVT_F_STE_FETCH]              = "SMMU_EVT_F_STE_FETCH",
+    [SMMU_EVT_C_BAD_STE]                = "SMMU_EVT_C_BAD_STE",
+    [SMMU_EVT_F_BAD_ATS_TREQ]           = "SMMU_EVT_F_BAD_ATS_TREQ",
+    [SMMU_EVT_F_STREAM_DISABLED]        = "SMMU_EVT_F_STREAM_DISABLED",
+    [SMMU_EVT_F_TRANS_FORBIDDEN]        = "SMMU_EVT_F_TRANS_FORBIDDEN",
+    [SMMU_EVT_C_BAD_SUBSTREAMID]        = "SMMU_EVT_C_BAD_SUBSTREAMID",
+    [SMMU_EVT_F_CD_FETCH]               = "SMMU_EVT_F_CD_FETCH",
+    [SMMU_EVT_C_BAD_CD]                 = "SMMU_EVT_C_BAD_CD",
+    [SMMU_EVT_F_WALK_EABT]              = "SMMU_EVT_F_WALK_EABT",
+    [SMMU_EVT_F_TRANSLATION]            = "SMMU_EVT_F_TRANSLATION",
+    [SMMU_EVT_F_ADDR_SIZE]              = "SMMU_EVT_F_ADDR_SIZE",
+    [SMMU_EVT_F_ACCESS]                 = "SMMU_EVT_F_ACCESS",
+    [SMMU_EVT_F_PERMISSION]             = "SMMU_EVT_F_PERMISSION",
+    [SMMU_EVT_F_TLB_CONFLICT]           = "SMMU_EVT_F_TLB_CONFLICT",
+    [SMMU_EVT_F_CFG_CONFLICT]           = "SMMU_EVT_F_CFG_CONFLICT",
+    [SMMU_EVT_E_PAGE_REQ]               = "SMMU_EVT_E_PAGE_REQ",
+};
+
+static inline const char *smmu_event_string(SMMUEventType type)
+{
+    return event_stringify[type] ? event_stringify[type] : "UNKNOWN";
+}
+
+/*  Encode an event record */
+typedef struct SMMUEventInfo {
+    SMMUEventType type;
+    uint32_t sid;
+    bool recorded;
+    bool record_trans_faults;
+    union {
+        struct {
+            uint32_t ssid;
+            bool ssv;
+            dma_addr_t addr;
+            bool rnw;
+            bool pnu;
+            bool ind;
+       } f_uut;
+       struct ssid_info {
+            uint32_t ssid;
+            bool ssv;
+       } c_bad_streamid;
+       struct ssid_addr_info {
+            uint32_t ssid;
+            bool ssv;
+            dma_addr_t addr;
+       } f_ste_fetch;
+       struct ssid_info c_bad_ste;
+       struct {
+            dma_addr_t addr;
+            bool rnw;
+       } f_transl_forbidden;
+       struct {
+            uint32_t ssid;
+       } c_bad_substream;
+       struct ssid_addr_info f_cd_fetch;
+       struct ssid_info c_bad_cd;
+       struct full_info {
+            bool stall;
+            uint16_t stag;
+            uint32_t ssid;
+            bool ssv;
+            bool s2;
+            dma_addr_t addr;
+            bool rnw;
+            bool pnu;
+            bool ind;
+            uint8_t class;
+            dma_addr_t addr2;
+       } f_walk_eabt;
+       struct full_info f_translation;
+       struct full_info f_addr_size;
+       struct full_info f_access;
+       struct full_info f_permission;
+       struct ssid_info f_cfg_conflict;
+       /**
+        * not supported yet:
+        * F_BAD_ATS_TREQ
+        * F_BAD_ATS_TREQ
+        * F_TLB_CONFLICT
+        * E_PAGE_REQUEST
+        * IMPDEF_EVENTn
+        */
+    } u;
+} SMMUEventInfo;
+
+/* EVTQ fields */
+
+#define EVT_Q_OVERFLOW        (1 << 31)
+
+#define EVT_SET_TYPE(x, v)              deposit32((x)->word[0], 0 , 8 ,  v)
+#define EVT_SET_SSV(x, v)               deposit32((x)->word[0], 11, 1 ,  v)
+#define EVT_SET_SSID(x, v)              deposit32((x)->word[0], 12, 20, v)
+#define EVT_SET_SID(x, v)               ((x)->word[1] =  v)
+#define EVT_SET_STAG(x, v)              deposit32((x)->word[2], 0 , 16, v)
+#define EVT_SET_STALL(x, v)             deposit32((x)->word[2], 31, 1 , v)
+#define EVT_SET_PNU(x, v)               deposit32((x)->word[3], 1 , 1 , v)
+#define EVT_SET_IND(x, v)               deposit32((x)->word[3], 2 , 1 , v)
+#define EVT_SET_RNW(x, v)               deposit32((x)->word[3], 3 , 1 , v)
+#define EVT_SET_S2(x, v)                deposit32((x)->word[3], 7 , 1 , v)
+#define EVT_SET_CLASS(x, v)             deposit32((x)->word[3], 8 , 2 , v)
+#define EVT_SET_ADDR(x, addr) ({                    \
+            (x)->word[5] = (uint32_t)(addr >> 32);        \
+            (x)->word[4] = (uint32_t)(addr & 0xffffffff); \
+        })
+#define EVT_SET_ADDR2(x, addr) ({                    \
+            deposit32((x)->word[7], 3, 29, addr >> 16);        \
+            deposit32((x)->word[7], 0, 16, addr & 0xffff); \
+        })
+
+void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *event);
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 77ec58d..30daad6 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -116,23 +116,119 @@ static MemTxResult queue_write(SMMUQueue *q, void *data)
     return MEMTX_OK;
 }
 
-void smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
+static MemTxResult smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
 {
     SMMUQueue *q = &s->eventq;
+    MemTxResult r;
+
+    if (!smmuv3_eventq_enabled(s)) {
+        return MEMTX_ERROR;
+    }
+
+    if (smmuv3_q_full(q)) {
+        return MEMTX_ERROR;
+    }
+
+    r = queue_write(q, evt);
+    if (r != MEMTX_OK) {
+        return r;
+    }
+
+    if (smmuv3_q_empty(q)) {
+        smmuv3_trigger_irq(s, SMMU_IRQ_EVTQ, 0);
+    }
+    return MEMTX_OK;
+}
+
+void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
+{
+    Evt evt;
+    MemTxResult r;
 
     if (!smmuv3_eventq_enabled(s)) {
         return;
     }
 
-    if (smmuv3_q_full(q)) {
+    EVT_SET_TYPE(&evt, info->type);
+    EVT_SET_SID(&evt, info->sid);
+
+    switch (info->type) {
+    case SMMU_EVT_OK:
         return;
+    case SMMU_EVT_F_UUT:
+        EVT_SET_SSID(&evt, info->u.f_uut.ssid);
+        EVT_SET_SSV(&evt,  info->u.f_uut.ssv);
+        EVT_SET_ADDR(&evt, info->u.f_uut.addr);
+        EVT_SET_RNW(&evt,  info->u.f_uut.rnw);
+        EVT_SET_PNU(&evt,  info->u.f_uut.pnu);
+        EVT_SET_IND(&evt,  info->u.f_uut.ind);
+        break;
+    case SMMU_EVT_C_BAD_STREAMID:
+        EVT_SET_SSID(&evt, info->u.c_bad_streamid.ssid);
+        EVT_SET_SSV(&evt,  info->u.c_bad_streamid.ssv);
+        break;
+    case SMMU_EVT_F_STE_FETCH:
+        EVT_SET_SSID(&evt, info->u.f_ste_fetch.ssid);
+        EVT_SET_SSV(&evt,  info->u.f_ste_fetch.ssv);
+        EVT_SET_ADDR(&evt, info->u.f_ste_fetch.addr);
+        break;
+    case SMMU_EVT_C_BAD_STE:
+        EVT_SET_SSID(&evt, info->u.c_bad_ste.ssid);
+        EVT_SET_SSV(&evt,  info->u.c_bad_ste.ssv);
+        break;
+    case SMMU_EVT_F_STREAM_DISABLED:
+        break;
+    case SMMU_EVT_F_TRANS_FORBIDDEN:
+        EVT_SET_ADDR(&evt, info->u.f_transl_forbidden.addr);
+        EVT_SET_RNW(&evt, info->u.f_transl_forbidden.rnw);
+        break;
+    case SMMU_EVT_C_BAD_SUBSTREAMID:
+        EVT_SET_SSID(&evt, info->u.c_bad_substream.ssid);
+        break;
+    case SMMU_EVT_F_CD_FETCH:
+        EVT_SET_SSID(&evt, info->u.f_cd_fetch.ssid);
+        EVT_SET_SSV(&evt,  info->u.f_cd_fetch.ssv);
+        EVT_SET_ADDR(&evt, info->u.f_cd_fetch.addr);
+        break;
+    case SMMU_EVT_C_BAD_CD:
+        EVT_SET_SSID(&evt, info->u.c_bad_cd.ssid);
+        EVT_SET_SSV(&evt,  info->u.c_bad_cd.ssv);
+        break;
+    case SMMU_EVT_F_WALK_EABT:
+    case SMMU_EVT_F_TRANSLATION:
+    case SMMU_EVT_F_ADDR_SIZE:
+    case SMMU_EVT_F_ACCESS:
+    case SMMU_EVT_F_PERMISSION:
+        EVT_SET_STALL(&evt, info->u.f_walk_eabt.stall);
+        EVT_SET_STAG(&evt, info->u.f_walk_eabt.stag);
+        EVT_SET_SSID(&evt, info->u.f_walk_eabt.ssid);
+        EVT_SET_SSV(&evt, info->u.f_walk_eabt.ssv);
+        EVT_SET_S2(&evt, info->u.f_walk_eabt.s2);
+        EVT_SET_ADDR(&evt, info->u.f_walk_eabt.addr);
+        EVT_SET_RNW(&evt, info->u.f_walk_eabt.rnw);
+        EVT_SET_PNU(&evt, info->u.f_walk_eabt.pnu);
+        EVT_SET_IND(&evt, info->u.f_walk_eabt.ind);
+        EVT_SET_CLASS(&evt, info->u.f_walk_eabt.class);
+        EVT_SET_ADDR2(&evt, info->u.f_walk_eabt.addr2);
+        break;
+    case SMMU_EVT_F_CFG_CONFLICT:
+        EVT_SET_SSID(&evt, info->u.f_cfg_conflict.ssid);
+        EVT_SET_SSV(&evt,  info->u.f_cfg_conflict.ssv);
+        break;
+    /* rest is not implemented */
+    case SMMU_EVT_F_BAD_ATS_TREQ:
+    case SMMU_EVT_F_TLB_CONFLICT:
+    case SMMU_EVT_E_PAGE_REQ:
+    default:
+        g_assert_not_reached();
     }
 
-    queue_write(q, evt);
-
-    if (smmuv3_q_empty(q)) {
-        smmuv3_trigger_irq(s, SMMU_IRQ_EVTQ, 0);
+    trace_smmuv3_record_event(smmu_event_string(info->type), info->sid);
+    r = smmuv3_write_eventq(s, &evt);
+    if (r != MEMTX_OK) {
+        smmuv3_trigger_irq(s, SMMU_IRQ_GERROR, R_GERROR_EVENTQ_ABT_ERR_MASK);
     }
+    info->recorded = true;
 }
 
 static void smmuv3_init_regs(SMMUv3State *s)
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 781542a..9936e10 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -29,3 +29,4 @@ smmuv3_write_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr:
 smmuv3_write_mmio_idr(uint64_t addr, uint64_t val) "write to RO/Unimpl reg 0x%lx val64:0x%lx"
 smmuv3_write_mmio_evtq_cons_bef_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "Before clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
 smmuv3_write_mmio_evtq_cons_after_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "after clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
+smmuv3_record_event(const char *type, uint32_t sid) "%s sid=%d"
-- 
2.5.5

