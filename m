Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9BFC88E75
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 16:02:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6VbL-0007oS-OO; Tue, 15 Sep 2026 12:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1x6VbI-0007ks-9Q
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:01:40 -0400
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1x6VbF-0003Qc-BP
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 12:01:39 -0400
Received: by mail-ej2-x10.google.com with SMTP id
 a640c23a62f3a-c254fa663c2so504721666b.3
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 09:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789488086; x=1790092886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9YCy6DQ0BZQW71Ys8BPvP9f9laR4cAYvw0UQPtL7jF8=;
 b=LKZJ4rkUlIHzL3S0NOsDaCIoyrBr7M1qqSKDoFsOPkcXrFTGJ2b1eI3YjPKlGTPELt
 eWmDyV7toZQAL5FuOfBtDp7B2biOyArvFYOKMo73k+0rVSKXuUOVTKsDjN6D0vP5QTr4
 z7nJyORVJcmk9PDIpVvjJXJx/1CC9EZ7tdQnWyA9wxVvwt7w0P6SLlENaGmBrjs1Tuur
 cvpp8huSdvy8CCDsY2+uXtzkaR7qUUY2FlvTdfgazHHRdY5DXViacYp02XdIsdi1N4e1
 o75o7Xyo5bmdssBvcsneMmOsonrVTg9CmLDN/yNmx/0tyan25GFzvNBxTD8BH9Rpp9LA
 wmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789488086; x=1790092886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9YCy6DQ0BZQW71Ys8BPvP9f9laR4cAYvw0UQPtL7jF8=;
 b=tIXCGrgi476vOBZpnZZiaMNpeb82OJi3lzWbm1LSr5wKYorHxBOdgf6HOIP6eXBV23
 GEyDZNKrrtx2G7n7lLIEjEkuAJMxyUMaxDMHscOKLqWoDgOSb7cmZeiCr/vqADK2r0Zh
 asTfe3Hs5HDzHHsJ0bcBK81lbzYCHwORk5rX7kjzFfF+P64uotDH+hYuGrdW4JqruaMp
 XLFlTbDOVQjzRLuWTU6w44TP7RorBotJpwWI96zBAonv6mH6mJUWydTycujMSBkXOpS2
 y1Xiox8h8aRRHiwD7RkpSw30dRDCDt95Wchp2spQh50FiI3yqNn5x2HR4tLBZpz5vwu1
 Ayrw==
X-Gm-Message-State: AFuF++lH/VUfCcALJGkiLLoK4WvMBbLG85QGXlGeZ3OIBtDXQdNUM0Ty
 1PQb6tZtSxX7fXizsjufaouM+UMCYwJiVieM3MwwkWTPhasx2IDqjLCo
X-Gm-Gg: AYBFou0MUmoMMWNSHgDct4Iw8wW57ae3S4gDloA2y/v6TLmAVDxetYJuY/hgzWSdMkn
 j+RrQt/XFv6ezTCcf0If4paV4hDlm69jMVHpwpKmmAebPC7e3UwVhNXJ7utS8n/bHGv3K+RolWL
 HdIxRFcKGCTtsl1nHr/keKHcVa1qu2eM4sFzuorgNlS2ohp+xl+d3UZ6qbYIASRSqLDbAUAywUC
 CK1XL7N0Ar2+m4FEjeq4Fgts67e9SDrFvslL602ffloy8Pt36JRBzXsBhkPTwYMaSdv3ae6EwU+
 Dmv1LpatJ8ngA+4uyCx0jOUTJCuU7TFiqDgrkNKkMDAKLFbY0P1kG49qyCUGbV2qMXBGjLAdiDP
 RTz3TSbm4T+uJXYp/XyjuEX0QRbjTXmWZNz7C7thl3a58of8lElwss3VieVggS3NPjKKe0ayrcD
 diP2LnNkjwJ74VSEvfbDW0PJWVVnS4ptlRSpxQjDFRkou9AqT1NXRFrWK1vD0LLphSrAPVIVPQZ
 htJRbNqM50/JNy2W4aW+WTDJVt7QwDR38d4q2UQp/obOw==
X-Received: by 2002:a17:907:a089:b0:c25:c7a9:7b8a with SMTP id
 a640c23a62f3a-c29b86b80b0mr805978666b.12.1789488085815; 
 Tue, 15 Sep 2026 09:01:25 -0700 (PDT)
Received: from thinkpad-t470s.. (83-131-196-251.adsl.net.t-com.hr.
 [83.131.196.251]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-c29ddd86344sm3235866b.0.2026.09.15.09.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 09:01:25 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com,
 edgar.iglesias@gmail.com, berrange@redhat.com, eugene@nuvacore.ai,
 Ruslan_Ruslichenko@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v2 08/20] hw/core: Implement Remote Port response handling
Date: Tue, 15 Sep 2026 18:00:32 +0200
Message-ID: <20260915160044.345788-9-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160044.345788-1-ruslichenko.r@gmail.com>
References: <20260915160044.345788-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:34::10;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add infrastructure to handle transaction responses from
remote peers.

This patch enables QEMU to wait for replies when it initiates
a memory access (Read/Write). It implements a mechanism to track
outstanding transaction IDs and block the execution thread until
the matching response is received.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Signed-off-by: Takahiro Nakata <takahiro.nakata.wr@renesas.com>
Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/remote-port.c         | 133 +++++++++++++++++++++++++++++++++-
 hw/core/trace-events          |   3 +-
 include/hw/core/remote-port.h |  29 ++++++++
 3 files changed, 163 insertions(+), 2 deletions(-)

diff --git a/hw/core/remote-port.c b/hw/core/remote-port.c
index 89f799493c..83515fc89c 100644
--- a/hw/core/remote-port.c
+++ b/hw/core/remote-port.c
@@ -35,6 +35,16 @@
 
 static void rp_event_read_and_process(RemotePort *s);
 
+void rp_rsp_mutex_lock(RemotePort *s)
+{
+    qemu_mutex_lock(&s->rsp_mutex);
+}
+
+void rp_rsp_mutex_unlock(RemotePort *s)
+{
+    qemu_mutex_unlock(&s->rsp_mutex);
+}
+
 static void rp_fatal_error(RemotePort *s, const char *reason)
 {
     error_report("%s: %s", s->prefix, reason);
@@ -80,6 +90,80 @@ static unsigned int rp_has_work(RemotePort *s)
     return work;
 }
 
+/* Response handling.  */
+RemotePortRespSlot *rp_dev_timed_wait_resp(RemotePort *s, uint32_t dev,
+                                            uint32_t id, int timems)
+{
+    int i;
+
+    assert(s->devs[dev]);
+
+    /* Find a free slot.  */
+    for (i = 0; i < ARRAY_SIZE(s->dev_state[dev].rsp_queue); i++) {
+        if (s->dev_state[dev].rsp_queue[i].used == false) {
+            break;
+        }
+    }
+
+    if (i == ARRAY_SIZE(s->dev_state[dev].rsp_queue) ||
+        s->dev_state[dev].rsp_queue[i].used == true) {
+        error_report("Number of outstanding transactions exceeded! %d",
+                      RP_MAX_OUTSTANDING_TRANSACTIONS);
+        rp_fatal_error(s, "Internal error");
+    }
+
+    /* Got a slot, fill it in.  */
+    s->dev_state[dev].rsp_queue[i].id = id;
+    s->dev_state[dev].rsp_queue[i].valid = false;
+    s->dev_state[dev].rsp_queue[i].used = true;
+
+    while (!s->dev_state[dev].rsp_queue[i].valid) {
+        rp_rsp_mutex_unlock(s);
+        rp_event_read_and_process(s);
+        rp_rsp_mutex_lock(s);
+        if (s->dev_state[dev].rsp_queue[i].valid) {
+            break;
+        }
+        if (!rp_has_work(s)) {
+            if (timems) {
+                if (!qemu_cond_timedwait(&s->progress_cond, &s->rsp_mutex,
+                                       timems)) {
+                    /*
+                     * TimeOut!
+                     */
+                    break;
+                }
+            } else {
+                qemu_cond_wait(&s->progress_cond, &s->rsp_mutex);
+            }
+        }
+    }
+    return &s->dev_state[dev].rsp_queue[i];
+}
+
+RemotePortRespSlot *rp_dev_wait_resp(RemotePort *s, uint32_t dev, uint32_t id)
+{
+    return rp_dev_timed_wait_resp(s, dev, id, 0);
+}
+
+RemotePortDynPkt rp_wait_resp(RemotePort *s)
+{
+    while (!rp_dpkt_is_valid(&s->rspqueue)) {
+        rp_rsp_mutex_unlock(s);
+        rp_event_read_and_process(s);
+        rp_rsp_mutex_lock(s);
+        /* Need to recheck the condition with the rsp lock taken.  */
+        if (rp_dpkt_is_valid(&s->rspqueue)) {
+            break;
+        }
+        trace_rp_wait_resp(s->prefix);
+        if (!rp_has_work(s)) {
+            qemu_cond_wait(&s->progress_cond, &s->rsp_mutex);
+        }
+    }
+    return s->rspqueue;
+}
+
 static void rp_cmd_hello(RemotePort *s, struct rp_pkt *pkt)
 {
     s->peer.version = pkt->hello.version;
@@ -220,13 +304,50 @@ static bool rp_pt_process_pkt(RemotePort *s, RemotePortDynPkt *dpkt)
 {
     struct rp_pkt *pkt = dpkt->pkt;
 
-    trace_rp_pt_process_pkt(s->prefix, pkt->hdr.cmd, pkt->hdr.id, pkt->hdr.dev);
+    trace_rp_pt_process_pkt(s->prefix, pkt->hdr.cmd, pkt->hdr.id, pkt->hdr.dev,
+                            pkt->hdr.flags & RP_PKT_FLAGS_response);
 
     if (pkt->hdr.dev >= ARRAY_SIZE(s->devs)) {
         /* FIXME: Respond with an error.  */
         return true;
     }
 
+    if (pkt->hdr.flags & RP_PKT_FLAGS_response) {
+        uint32_t dev = pkt->hdr.dev;
+        uint32_t id = pkt->hdr.id;
+        int i;
+
+        if (pkt->hdr.flags & RP_PKT_FLAGS_posted) {
+            return true;
+        }
+
+        qemu_mutex_lock(&s->rsp_mutex);
+
+        /* Try to find a per-device slot first.  */
+        for (i = 0; i < ARRAY_SIZE(s->dev_state[dev].rsp_queue); i++) {
+            if (s->devs[dev] && s->dev_state[dev].rsp_queue[i].used == true
+                && s->dev_state[dev].rsp_queue[i].id == id) {
+                break;
+            }
+        }
+
+        if (i < ARRAY_SIZE(s->dev_state[dev].rsp_queue)) {
+            /* Found a per device one.  */
+            assert(s->dev_state[dev].rsp_queue[i].valid == false);
+
+            rp_dpkt_swap(&s->dev_state[dev].rsp_queue[i].rsp, dpkt);
+            s->dev_state[dev].rsp_queue[i].valid = true;
+
+            qemu_cond_signal(&s->progress_cond);
+        } else {
+            rp_dpkt_swap(&s->rspqueue, dpkt);
+            qemu_cond_signal(&s->progress_cond);
+        }
+
+        qemu_mutex_unlock(&s->rsp_mutex);
+        return true;
+    }
+
     switch (pkt->hdr.cmd) {
     case RP_CMD_hello:
         rp_cmd_hello(s, pkt);
@@ -280,6 +401,7 @@ static void *rp_protocol_thread(void *arg)
 
     /* Make sure we have a decent bufsize to start with.  */
     rp_dpkt_alloc(&s->rsp, sizeof s->rsp.pkt->busaccess + 1024);
+    rp_dpkt_alloc(&s->rspqueue, sizeof s->rspqueue.pkt->busaccess + 1024);
     for (i = 0; i < ARRAY_SIZE(s->rx_queue.pkt); i++) {
         rp_dpkt_alloc(&s->rx_queue.pkt[i],
                       sizeof s->rx_queue.pkt[i].pkt->busaccess + 1024);
@@ -407,6 +529,7 @@ static void rp_prop_allow_set_link(const Object *obj, const char *name,
 static void rp_init(Object *obj)
 {
     RemotePort *s = REMOTE_PORT(obj);
+    int t;
     int i;
 
     for (i = 0; i < REMOTE_PORT_MAX_DEVS; ++i) {
@@ -416,6 +539,14 @@ static void rp_init(Object *obj)
                              rp_prop_allow_set_link,
                              OBJ_PROP_LINK_STRONG);
         g_free(name);
+
+
+        for (t = 0; t < RP_MAX_OUTSTANDING_TRANSACTIONS; t++) {
+            s->dev_state[i].rsp_queue[t].used = false;
+            s->dev_state[i].rsp_queue[t].valid = false;
+            rp_dpkt_alloc(&s->dev_state[i].rsp_queue[t].rsp,
+               sizeof s->dev_state[i].rsp_queue[t].rsp.pkt->busaccess + 1024);
+        }
     }
 }
 
diff --git a/hw/core/trace-events b/hw/core/trace-events
index 612d5730b9..631cbb9c37 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -34,6 +34,7 @@ clock_set_mul_div(const char *clk, uint32_t oldmul, uint32_t mul, uint32_t olddi
 cpu_reset(int cpu_index) "%d"
 
 # remote-port.c
-rp_pt_process_pkt(const char *rp, uint32_t cmd, uint32_t id, uint32_t dev) "%s: cmd=0x%"PRIx32" id=0x%"PRIx32" dev=0x%"PRIx32
+rp_pt_process_pkt(const char *rp, uint32_t cmd, uint32_t id, uint32_t dev, bool response) "%s: cmd=0x%"PRIx32" id=0x%"PRIx32" dev=0x%"PRIx32" rsp=%d"
 rp_process(const char *rp, unsigned int rpos, unsigned int wpos, uint32_t cmd, uint32_t dev) "%s: io-thread rpos=%u wpos=%u cmd=0x%"PRIx32" dev=0x%"PRIx32
 rp_pt_rx_queue_full(const char *rp, unsigned int rpos, unsigned int wpos) "%s: rpos=%u wpos=%u"
+rp_wait_resp(const char *rp) "'%s'"
diff --git a/include/hw/core/remote-port.h b/include/hw/core/remote-port.h
index 2d8a191bce..2cb070158f 100644
--- a/include/hw/core/remote-port.h
+++ b/include/hw/core/remote-port.h
@@ -55,6 +55,13 @@ typedef struct RemotePortDeviceClass {
 #define TYPE_REMOTE_PORT "remote-port"
 #define REMOTE_PORT(obj) OBJECT_CHECK(RemotePort, (obj), TYPE_REMOTE_PORT)
 
+typedef struct RemotePortRespSlot {
+            RemotePortDynPkt rsp;
+            uint32_t id;
+            bool used;
+            bool valid;
+} RemotePortRespSlot;
+
 struct RemotePort {
     DeviceState parent;
 
@@ -88,6 +95,13 @@ struct RemotePort {
      */
     RemotePortDynPkt rsp;
 
+    /*
+     * rspqueue holds received responses from the remote side.
+     * Only one for the moment but it might grow.
+     * Used by the master.
+     */
+    RemotePortDynPkt rspqueue;
+
     const char *prefix;
     const char *remote_prefix;
 
@@ -95,9 +109,24 @@ struct RemotePort {
     bool reset_done;
 
 #define REMOTE_PORT_MAX_DEVS 1024
+#define RP_MAX_OUTSTANDING_TRANSACTIONS 32
+    struct {
+        RemotePortRespSlot rsp_queue[RP_MAX_OUTSTANDING_TRANSACTIONS];
+    } dev_state[REMOTE_PORT_MAX_DEVS];
+
     RemotePortDevice *devs[REMOTE_PORT_MAX_DEVS];
 };
 
+
+void rp_rsp_mutex_lock(RemotePort *s);
+void rp_rsp_mutex_unlock(RemotePort *s);
+
+RemotePortDynPkt rp_wait_resp(RemotePort *s);
+
+RemotePortRespSlot *rp_dev_wait_resp(RemotePort *s, uint32_t dev, uint32_t id);
+RemotePortRespSlot *rp_dev_timed_wait_resp(RemotePort *s, uint32_t dev,
+                                           uint32_t id, int timems);
+
 void rp_process(RemotePort *s);
 
 ssize_t rp_write(RemotePort *s, const void *buf, size_t count);
-- 
2.43.0


