Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1206980ejl;
        Thu, 16 May 2024 01:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVZ1qWqzeSn9Fi6crWzBxY+RpFt1zGdMY3aigN/4H9Msjto/5Nq4aFlQ+9jlYPOuuORNYGQCRw2QBPQKaNdS/Y5OMh/yqB
X-Google-Smtp-Source: AGHT+IHvngIBly6m2WMFvkQ6az/Acp0InXqiAWLTkBHENM0GSHjDmH2aceD9AZTj6P3jnPOgEhkG
X-Received: by 2002:a25:20c5:0:b0:dee:4e47:808d with SMTP id 3f1490d57ef6-dee4f31a7d5mr19617437276.3.1715848877523;
        Thu, 16 May 2024 01:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715848877; cv=none;
        d=google.com; s=arc-20160816;
        b=AZ7NEizUC0LomiqB2Fqgtd4c8Qb8qklI94Vf5LQzXrOSwKzBr2G0+C0Ru7P3LUxqtR
         D3oCiHjUcrjPlMGllWjETy53o5Ku4Rwy7J0O/KvoDVZBBufghP2EJly1CSbmYunMt6aB
         16m7mihF09ygxrkmmsdMlZ/80gLdp6dVZR8HFi0YDttcDhrsd/wPuygn2mGbtc5TNHmE
         WI0d6iPNP0fcJZ+0eAam36f8um9L5xnWeihsnu3G/Zj8wxaZG7sk5TA8AAIGvNkRnQ/y
         RMqbiKEmcuZCSfgvLSCFB6LCmqJHw4CdMaoxKSuqeC0/hn7TXad1HY3LpF/pG+3514W6
         zwAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FIXqs9q5OgAW0BqxmoEwMBs7O0+ftBRUTKAjChCNT1A=;
        fh=3rKrmVGlLGnE8IV3p8v3FKLInAe/rTYQZyGxjdKIRRU=;
        b=vL64G4jVKjs5kbmmDuKgYtKFp37cEoW62cyrKZldcmbUZkz98jAIYARXS1EFKzsOOY
         +MU1wP5uTYm3Cmu8VLta/mpwLOLB9Ubnte7OxhsDy2SUAKgfBlPK7nrP4LXU3KzRGPT7
         9ZgLv3EgTZsrie5Y6/zqct8hCUQmiY5mXw3FJzCUY9x9Nn8ZSfA0YYHIpoP4Bwnq40Ws
         lznbGMk8+orWwQsw8wiNGDDu3SIff7GuK+r73dItseNwkpZyYGcV5Hn/k3FGbKtZry1V
         H3k9dTo2zuVcWiSvjF0ZN9CtFoBZx+WDYnqkNlcAcbOj4gO6hsPjw0+2N9WvnmiNxfOf
         fTWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hRwrJMmI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df56eef6dsi3144171cf.800.2024.05.16.01.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2024 01:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hRwrJMmI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7Wfk-0003qa-Lc; Thu, 16 May 2024 04:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7WfZ-0003hs-Qk
 for qemu-arm@nongnu.org; Thu, 16 May 2024 04:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7WfY-0003dK-2k
 for qemu-arm@nongnu.org; Thu, 16 May 2024 04:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715848853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIXqs9q5OgAW0BqxmoEwMBs7O0+ftBRUTKAjChCNT1A=;
 b=hRwrJMmIp6e6dMvnimhT/MITwKd8UrfMRKstYK8x/a5wjlXoPH0MpHVF71wOWuFENpdhY/
 CfXhI9flWD7aQch0Uet6Un+Z3Ycf0O1T18P6FmM/FhGRxhNrve+6LBtstbKmnzM5Df9zrM
 TeBZR2/h1muV3eXSZsPspiG0yE79nOM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-jrVoozZlP6CQyTNG80qsWg-1; Thu, 16 May 2024 04:40:40 -0400
X-MC-Unique: jrVoozZlP6CQyTNG80qsWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 052888058C8;
 Thu, 16 May 2024 08:40:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D425740F;
 Thu, 16 May 2024 08:40:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Fabiano Rosas <farosas@suse.de>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 3/3] virtio-gpu: fix v2 migration
Date: Thu, 16 May 2024 12:40:22 +0400
Message-ID: <20240516084022.1398919-4-marcandre.lureau@redhat.com>
In-Reply-To: <20240516084022.1398919-1-marcandre.lureau@redhat.com>
References: <20240516084022.1398919-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pIvUopzTSlJw

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Commit dfcf74fa ("virtio-gpu: fix scanout migration post-load") broke
forward/backward version migration. Versioning of nested VMSD structures
is not straightforward, as the wire format doesn't have nested
structures versions. Introduce x-scanout-vmstate-version and a field
test to save/load appropriately according to the machine version.

Fixes: dfcf74fa ("virtio-gpu: fix scanout migration post-load")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  1 +
 hw/core/machine.c              |  1 +
 hw/display/virtio-gpu.c        | 24 ++++++++++++++++--------
 3 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 56d6e821bf..7a59379f5a 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -177,6 +177,7 @@ typedef struct VGPUDMABuf {
 struct VirtIOGPU {
     VirtIOGPUBase parent_obj;
 
+    uint8_t scanout_vmstate_version;
     uint64_t conf_max_hostmem;
 
     VirtQueue *ctrl_vq;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c7ceb11501..8d6dc69f0e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -42,6 +42,7 @@ GlobalProperty hw_compat_8_2[] = {
     { "migration", "zero-page-detection", "legacy"},
     { TYPE_VIRTIO_IOMMU_PCI, "granule", "4k" },
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "64" },
+    { "virtio-gpu-device", "x-scanout-vmstate-version", "1" },
 };
 const size_t hw_compat_8_2_len = G_N_ELEMENTS(hw_compat_8_2);
 
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index ae831b6b3e..85323daf99 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1166,10 +1166,17 @@ static void virtio_gpu_cursor_bh(void *opaque)
     virtio_gpu_handle_cursor(&g->parent_obj.parent_obj, g->cursor_vq);
 }
 
+static bool scanout_vmstate_after_v2(void *opaque, int version)
+{
+    struct VirtIOGPUBase *base = container_of(opaque, VirtIOGPUBase, scanout);
+    struct VirtIOGPU *gpu = container_of(base, VirtIOGPU, parent_obj);
+
+    return gpu->scanout_vmstate_version >= 2;
+}
+
 static const VMStateDescription vmstate_virtio_gpu_scanout = {
     .name = "virtio-gpu-one-scanout",
-    .version_id = 2,
-    .minimum_version_id = 1,
+    .version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32(resource_id, struct virtio_gpu_scanout),
         VMSTATE_UINT32(width, struct virtio_gpu_scanout),
@@ -1181,12 +1188,12 @@ static const VMStateDescription vmstate_virtio_gpu_scanout = {
         VMSTATE_UINT32(cursor.hot_y, struct virtio_gpu_scanout),
         VMSTATE_UINT32(cursor.pos.x, struct virtio_gpu_scanout),
         VMSTATE_UINT32(cursor.pos.y, struct virtio_gpu_scanout),
-        VMSTATE_UINT32_V(fb.format, struct virtio_gpu_scanout, 2),
-        VMSTATE_UINT32_V(fb.bytes_pp, struct virtio_gpu_scanout, 2),
-        VMSTATE_UINT32_V(fb.width, struct virtio_gpu_scanout, 2),
-        VMSTATE_UINT32_V(fb.height, struct virtio_gpu_scanout, 2),
-        VMSTATE_UINT32_V(fb.stride, struct virtio_gpu_scanout, 2),
-        VMSTATE_UINT32_V(fb.offset, struct virtio_gpu_scanout, 2),
+        VMSTATE_UINT32_TEST(fb.format, struct virtio_gpu_scanout, scanout_vmstate_after_v2),
+        VMSTATE_UINT32_TEST(fb.bytes_pp, struct virtio_gpu_scanout, scanout_vmstate_after_v2),
+        VMSTATE_UINT32_TEST(fb.width, struct virtio_gpu_scanout, scanout_vmstate_after_v2),
+        VMSTATE_UINT32_TEST(fb.height, struct virtio_gpu_scanout, scanout_vmstate_after_v2),
+        VMSTATE_UINT32_TEST(fb.stride, struct virtio_gpu_scanout, scanout_vmstate_after_v2),
+        VMSTATE_UINT32_TEST(fb.offset, struct virtio_gpu_scanout, scanout_vmstate_after_v2),
         VMSTATE_END_OF_LIST()
     },
 };
@@ -1659,6 +1666,7 @@ static Property virtio_gpu_properties[] = {
     DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
     DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
+    DEFINE_PROP_UINT8("x-scanout-vmstate-version", VirtIOGPU, scanout_vmstate_version, 2),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0.28.gd7d8841f67

