Received: by 10.28.71.27 with SMTP id u27csp2110815wma;
        Sat, 17 Feb 2018 11:22:27 -0800 (PST)
X-Google-Smtp-Source: AH8x226+162A47bCW3IsPgUJA3RAZy/cUp8GWGe42snllrBMAau/Fk0segP0oPP47gpn0hEc6qWf
X-Received: by 10.37.97.18 with SMTP id v18mr7536561ybb.15.1518895347811;
        Sat, 17 Feb 2018 11:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895347; cv=none;
        d=google.com; s=arc-20160816;
        b=UAW4LWQZ7EJ/wzmbvsGK10gCfW4HlKgjK0dQINOUGZwzKQTAE5fDXoydWo8+Jk9QzN
         NX/KZG7dZqzLcaEsKVHTaQe/9kSHlPIlTVrgzbaVSNPFvjimTfAg+sjgakcCKmzWCms4
         NqATA/W+DgbGrwOPqkKzgj2uYNdjdklxJaPW2Y9GljPZOgfjGVUvtgS/vPuytBDZfN4s
         pRa5i9aAdXmsrmRtkzW4mugTJtkSGVeO1HNiMc8GFXBUHMo9pmZhKXkQM9Uj8nPQ0P+o
         9y+yvRFbI0lco4O35cbTRBOBmRE6CeCoIgc8EV+HXcQAd1dX5C3TihM6s2JfjOtUoiYi
         0avA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=U5XY61jztlKpezxn3xPRJn2EduELI/7HE5swdLfSwvY=;
        b=AgLBhx7REnhjyamH6/UjUseRnJyG0mO5Y1xeqbPqE9vs3lUrY1pZB0mcQijsAifITP
         w/So3LxNlPgRu3X+o1tgoqRwUjO9vqXecKbDezG12kCohgPUMmJj5EkG9Dxq5kQNpxZk
         ovtBj5DTqwzyZZDMROBkaB7hS8p5hcr9XtHiQmJySmgAjMZ7q67AUgf97LgQNDwomg+M
         Or/LTCxcpCM6+kF/yXkWjwAXieFNANTPeDi5n0R+zfRu0mds1hJ1BuUmxgBio1uU5AYn
         drod6kBs1+05xIKi7WqrNgsIkXkXOKT0pn0tVP5rmRhmZc9bSXJgKZFckf/7Ngkc2+WI
         rkpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s203si3546539yws.394.2018.02.17.11.22.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en843-000145-5c
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:22:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7WG-0003V3-TJ
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1en7WE-0001m9-6W
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:47:32 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56734 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1en7WD-0001jB-SP; Sat, 17 Feb 2018 13:47:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 423998182D06;
	Sat, 17 Feb 2018 18:47:29 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-21.ams2.redhat.com
	[10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A55B12024CA2;
	Sat, 17 Feb 2018 18:47:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Sat, 17 Feb 2018 19:46:50 +0100
Message-Id: <1518893216-9983-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Sat, 17 Feb 2018 18:47:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Sat, 17 Feb 2018 18:47:29 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v9 08/14] hw/arm/smmuv3: Event queue recording
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AUWdedwGdYWF

Let's introduce a helper function aiming at recording an
event in the event queue.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8 -> v9:
- add SMMU_EVENT_STRING

v7 -> v8:
- use dma_addr_t instead of hwaddr in smmuv3_record_event()
- introduce struct SMMUEventInfo
- add event_stringify + helpers for all fields
---
 hw/arm/smmuv3-internal.h | 140 ++++++++++++++++++++++++++++++++++++++++++++++-
 hw/arm/smmuv3.c          |  91 +++++++++++++++++++++++++++++-
 hw/arm/trace-events      |   1 +
 3 files changed, 229 insertions(+), 3 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 5af97ae..3929f69 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -226,8 +226,6 @@ static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
     s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
 }
 
-void smmuv3_write_eventq(SMMUv3State *s, Evt *evt);
-
 /* Commands */
 
 enum {
@@ -326,4 +324,142 @@ enum { /* Command completion notification */
             addr;                                             \
         })
 
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
+#define SMMU_EVENT_STRING(event) (                                         \
+(event < ARRAY_SIZE(event_stringify)) ? event_stringify[event] : "UNKNOWN" \
+)
+
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
index fcfdbb0..0adfe53 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -140,7 +140,7 @@ static void queue_write(SMMUQueue *q, void *data)
     queue_prod_incr(q);
 }
 
-void smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
+static void smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
 {
     SMMUQueue *q = &s->eventq;
     bool q_empty = Q_EMPTY(q);
@@ -161,6 +161,95 @@ void smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
     }
 }
 
+void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
+{
+    Evt evt;
+
+    if (!SMMUV3_EVENTQ_ENABLED(s)) {
+        return;
+    }
+
+    EVT_SET_TYPE(&evt, info->type);
+    EVT_SET_SID(&evt, info->sid);
+
+    switch (info->type) {
+    case SMMU_EVT_OK:
+        return;
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
+        error_report("%s event %d not supported", __func__,
+                     info->type);
+        return;
+    }
+
+    trace_smmuv3_record_event(SMMU_EVENT_STRING(info->type), info->sid);
+    smmuv3_write_eventq(s, &evt);
+    info->recorded = true;
+}
+
 static void smmuv3_init_regs(SMMUv3State *s)
 {
     /**
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index ed5dce0..c79c15e 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -28,3 +28,4 @@ smmuv3_write_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" v
 smmuv3_write_mmio_idr(hwaddr addr, uint64_t val) "write to RO/Unimpl reg 0x%lx val64:0x%lx"
 smmuv3_write_mmio_evtq_cons_bef_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "Before clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
 smmuv3_write_mmio_evtq_cons_after_clear(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "after clearing interrupt prod:0x%x cons:0x%x prod.w:%d cons.w:%d"
+smmuv3_record_event(const char *type, uint32_t sid) "%s sid=%d"
-- 
2.5.5

