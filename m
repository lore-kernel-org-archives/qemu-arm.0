Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2130119wrd;
        Sun, 2 Sep 2018 23:58:26 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYpcM1bIkXdkPTUW5DpyssktG6xDRtHYAp0h8B2B2u2p/kdXvExrKQnjs7e3j9lSd/kSrWj
X-Received: by 2002:ac8:218d:: with SMTP id 13-v6mr24333848qty.122.1535957906534;
        Sun, 02 Sep 2018 23:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535957906; cv=none;
        d=google.com; s=arc-20160816;
        b=aBhs3clIdL0jhEj8y4WvNUbfuq39gMRg89u9G/Ue95CHYAdizZL6ITLG6NCqBlPA7t
         l66n2pYlJTSLFkdomJRMRWWTamn8BOedqGOyDycGTA8k2RJgZl64u9zvkE8aJ0CxY0yX
         /rBQ4ysEVJnYiun/M9Z2OZ8+NsDa9NYSZq6H92cNKr1uhxzXJ2xWajYNVwC/f6UunV5n
         xH8EQjnvND4Om23ERhGydICJmh19BfcBLQaDeBnhPzFxFQ2Yi/Iq5tt/lGzvkeO0pMF4
         mXRFi26BsfD4uBc3pNBZgyDpwoVgLuFr/6WFrWwBYHFxBao2RDwcwAcD/Qkk7oR8zSuW
         Vm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gbJCbTbCTcF5ijp3pKwI4axWpqqEPi4JDLi8ZJebI0M=;
        b=Xjw/gJ9D65v5QtcKSmmBeQ39+iq33ol/dgw4C3qYfXA58YcreAFVbcFBIch9ogQIx3
         utJcU6TskEPhRCqeDU1/gse+XmvkMjeoxDemai1g6e/8qb5bi1lG9Pm4gKOyUrksBQBo
         dQBCCjobbgdEpLsb97NeG2bTF2IXqrA4tCvinixZYMbs9XZhl0BWQwehG2Yd/lq5q4va
         tqyPmKwE8az21LO33kUBZC85TeXmiAN0i26Xt6XLT+RvhxTZfnFFiKu7AhO/CzgaE1OI
         ECeA+17nae3kAipN66VsPdTtzdFNPkm/6KrLnkZze1rUP8TbBpNcLKptldsi4a8h7EZZ
         vbfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35-v6si1431906qvi.283.2018.09.02.23.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Sep 2018 23:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fwioc-0002rC-2u
	for alex.bennee@linaro.org; Mon, 03 Sep 2018 02:58:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio7-0001lP-Hy
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio4-0008Cn-DP
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36372 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fwio4-0008Bl-6S; Mon, 03 Sep 2018 02:57:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8355C40216EA;
	Mon,  3 Sep 2018 06:57:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-66.ams2.redhat.com
	[10.36.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8DE12027069;
	Mon,  3 Sep 2018 06:57:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 2207B9B1D; Mon,  3 Sep 2018 08:57:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Sep 2018 08:57:44 +0200
Message-Id: <20180903065745.23055-5-kraxel@redhat.com>
In-Reply-To: <20180903065745.23055-1-kraxel@redhat.com>
References: <20180903065745.23055-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 4/5] virtio-gpu: pass down VirtIOGPU pointer to a
 bunch of functions
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4M/H0GA3VtNG

No functional change, just preparation for a followup patch
which needs a VirtIOGPU pointer.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20180829122101.29852-2-kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  6 ++++--
 hw/display/virtio-gpu-3d.c     |  8 ++++----
 hw/display/virtio-gpu.c        | 25 +++++++++++++++----------
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2374f022e8..c8c599f1b9 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -159,10 +159,12 @@ void virtio_gpu_ctrl_response_nodata(VirtIOGPU *g,
                                      enum virtio_gpu_ctrl_type type);
 void virtio_gpu_get_display_info(VirtIOGPU *g,
                                  struct virtio_gpu_ctrl_command *cmd);
-int virtio_gpu_create_mapping_iov(struct virtio_gpu_resource_attach_backing *ab,
+int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
+                                  struct virtio_gpu_resource_attach_backing *ab,
                                   struct virtio_gpu_ctrl_command *cmd,
                                   uint64_t **addr, struct iovec **iov);
-void virtio_gpu_cleanup_mapping_iov(struct iovec *iov, uint32_t count);
+void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
+                                    struct iovec *iov, uint32_t count);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 
 /* virtio-gpu-3d.c */
diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
index 3558f38fe8..55d76405a9 100644
--- a/hw/display/virtio-gpu-3d.c
+++ b/hw/display/virtio-gpu-3d.c
@@ -86,7 +86,7 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
                                        &res_iovs,
                                        &num_iovs);
     if (res_iovs != NULL && num_iovs != 0) {
-        virtio_gpu_cleanup_mapping_iov(res_iovs, num_iovs);
+        virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
     }
     virgl_renderer_resource_unref(unref.resource_id);
 }
@@ -291,7 +291,7 @@ static void virgl_resource_attach_backing(VirtIOGPU *g,
     VIRTIO_GPU_FILL_CMD(att_rb);
     trace_virtio_gpu_cmd_res_back_attach(att_rb.resource_id);
 
-    ret = virtio_gpu_create_mapping_iov(&att_rb, cmd, NULL, &res_iovs);
+    ret = virtio_gpu_create_mapping_iov(g, &att_rb, cmd, NULL, &res_iovs);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
@@ -301,7 +301,7 @@ static void virgl_resource_attach_backing(VirtIOGPU *g,
                                              res_iovs, att_rb.nr_entries);
 
     if (ret != 0)
-        virtio_gpu_cleanup_mapping_iov(res_iovs, att_rb.nr_entries);
+        virtio_gpu_cleanup_mapping_iov(g, res_iovs, att_rb.nr_entries);
 }
 
 static void virgl_resource_detach_backing(VirtIOGPU *g,
@@ -320,7 +320,7 @@ static void virgl_resource_detach_backing(VirtIOGPU *g,
     if (res_iovs == NULL || num_iovs == 0) {
         return;
     }
-    virtio_gpu_cleanup_mapping_iov(res_iovs, num_iovs);
+    virtio_gpu_cleanup_mapping_iov(g, res_iovs, num_iovs);
 }
 
 
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 410cf0c98a..cf31b5f710 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -29,7 +29,8 @@
 static struct virtio_gpu_simple_resource*
 virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
 
-static void virtio_gpu_cleanup_mapping(struct virtio_gpu_simple_resource *res);
+static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
+                                       struct virtio_gpu_simple_resource *res);
 
 static void
 virtio_gpu_ctrl_hdr_bswap(struct virtio_gpu_ctrl_hdr *hdr)
@@ -442,7 +443,7 @@ static void virtio_gpu_resource_destroy(VirtIOGPU *g,
     }
 
     pixman_image_unref(res->image);
-    virtio_gpu_cleanup_mapping(res);
+    virtio_gpu_cleanup_mapping(g, res);
     QTAILQ_REMOVE(&g->reslist, res, next);
     g->hostmem -= res->hostmem;
     g_free(res);
@@ -688,7 +689,8 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
     scanout->height = ss.r.height;
 }
 
-int virtio_gpu_create_mapping_iov(struct virtio_gpu_resource_attach_backing *ab,
+int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
+                                  struct virtio_gpu_resource_attach_backing *ab,
                                   struct virtio_gpu_ctrl_command *cmd,
                                   uint64_t **addr, struct iovec **iov)
 {
@@ -732,7 +734,7 @@ int virtio_gpu_create_mapping_iov(struct virtio_gpu_resource_attach_backing *ab,
             qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map MMIO memory for"
                           " resource %d element %d\n",
                           __func__, ab->resource_id, i);
-            virtio_gpu_cleanup_mapping_iov(*iov, i);
+            virtio_gpu_cleanup_mapping_iov(g, *iov, i);
             g_free(ents);
             *iov = NULL;
             if (addr) {
@@ -746,7 +748,8 @@ int virtio_gpu_create_mapping_iov(struct virtio_gpu_resource_attach_backing *ab,
     return 0;
 }
 
-void virtio_gpu_cleanup_mapping_iov(struct iovec *iov, uint32_t count)
+void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
+                                    struct iovec *iov, uint32_t count)
 {
     int i;
 
@@ -757,9 +760,10 @@ void virtio_gpu_cleanup_mapping_iov(struct iovec *iov, uint32_t count)
     g_free(iov);
 }
 
-static void virtio_gpu_cleanup_mapping(struct virtio_gpu_simple_resource *res)
+static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
+                                       struct virtio_gpu_simple_resource *res)
 {
-    virtio_gpu_cleanup_mapping_iov(res->iov, res->iov_cnt);
+    virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
     res->iov = NULL;
     res->iov_cnt = 0;
     g_free(res->addrs);
@@ -791,7 +795,7 @@ virtio_gpu_resource_attach_backing(VirtIOGPU *g,
         return;
     }
 
-    ret = virtio_gpu_create_mapping_iov(&ab, cmd, &res->addrs, &res->iov);
+    ret = virtio_gpu_create_mapping_iov(g, &ab, cmd, &res->addrs, &res->iov);
     if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         return;
@@ -818,7 +822,7 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
         cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
         return;
     }
-    virtio_gpu_cleanup_mapping(res);
+    virtio_gpu_cleanup_mapping(g, res);
 }
 
 static void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
@@ -1144,6 +1148,7 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
             hwaddr len = res->iov[i].iov_len;
             res->iov[i].iov_base =
                 cpu_physical_memory_map(res->addrs[i], &len, 1);
+
             if (!res->iov[i].iov_base || len != res->iov[i].iov_len) {
                 /* Clean up the half-a-mapping we just created... */
                 if (res->iov[i].iov_base) {
@@ -1152,7 +1157,7 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
                 }
                 /* ...and the mappings for previous loop iterations */
                 res->iov_cnt = i;
-                virtio_gpu_cleanup_mapping(res);
+                virtio_gpu_cleanup_mapping(g, res);
                 pixman_image_unref(res->image);
                 g_free(res);
                 return -EINVAL;
-- 
2.9.3

