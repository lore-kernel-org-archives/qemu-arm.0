Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4965992njc;
        Fri, 8 Nov 2024 06:48:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9Ak1y1bUsd8lXZd19J7SgA14bGxND+lqT4FzXytkivs4GMj4mOlSKiobAtFg9E+x+69pU2yuOINJSbw==@linaro.org
X-Google-Smtp-Source: AGHT+IE3KNhrmvGSNPc8QgWDj2rMqx+A2uaiDAFiLFmrfTJdFVmdKPV1s0V3T0BZO7TUD/mzjP9V
X-Received: by 2002:a05:620a:2a0f:b0:7a9:aba6:d024 with SMTP id af79cd13be357-7b331f183c9mr374895185a.43.1731077334025;
        Fri, 08 Nov 2024 06:48:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731077334; cv=none;
        d=google.com; s=arc-20240605;
        b=KP4E/BqzLWWrGmIh55pBYJ5Pr5ERBHGSe2W53fDXeybhEmSSBacG6yWi7pXq109Tuc
         8gFvBr6aAVP/gGEKQ8U8jJmsP64NJXWSzasNhSaSadIj03SoDFJ6XBtcOGPMT6lT0hSl
         FnlTGUh0gIE1/DkpMPcAvE2PeBdiZiv1aLiqPUKUlwExWcS7eu/YQmcqK/ZcfdGqjBIx
         72tdoTNBGQ2v3wRpT7ULr5Gv7pqwQm/FnZeJmGOL/y3+eR6+DO4uOqtr5IudrXxGXmzY
         SBgWBY1VRMeZUyFj2a7wo+vo42E4nxyLfztLEswmihV8/ZLA9UR3Yy9wWV0+96Gb+mlw
         Gwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xGyiyIXBuBoOe5HAAD4h8VEZ8LbjC1rfwis/bjnPfwk=;
        fh=5LBixJ8vr5uax3UmhCk7G4LQRT8RMdf5m3SKcVHfskk=;
        b=SslZ45RWA4KebXQimyVZ0xa9iLdFCOdICUBOEKD7H7MUBUl1gPE4pdqpQ1C6gnHoR/
         tOxlXKaBE/hgUo5c/6QUSriqggzMBFnLxxrTKEhKaxMLkt/k5/1yvVO+vgN4/DfnJOf9
         Rjk1HBAcM0egd7l1iIl8Pv6Bpx5XOTFwsug/rUkITUAcrSU0x5tZHW2/Gf8ReTWclHEV
         OIlxXyi8hf4dnEXDNESNt0FTPdJIoZp6lKW3duMMr8NQYhcwHeOIVlZyNA1GBx+qBoc3
         9hVYoR1ppqjSaUc1x1cn6jtUpxlt83olpD4ugfzHoqCJRq156Yw8ezXWhif/WvzoNp/l
         uKyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=HIuvfC9D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad3a860si427005985a.702.2024.11.08.06.48.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 06:48:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=HIuvfC9D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9QHy-0006j2-29; Fri, 08 Nov 2024 09:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QH3-0004a1-FO
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:48 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QH0-0005N8-3E
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:45 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so378534366b.0
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 06:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731077261; x=1731682061;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGyiyIXBuBoOe5HAAD4h8VEZ8LbjC1rfwis/bjnPfwk=;
 b=HIuvfC9DjQ6TAC9SbiC6E/y5Wj82crEQVS+KyIOFRMeRo5NChBhJ4pnDNMqnLx68/L
 5Grt3rZc9DAY5wY/q1g3QXJMMmg88dvJjkWWVcrB9grFCeMJXhafFBtuaVeC/PLQ6qie
 4F+R4lNxlIl0Y3BMsaaxVB6Ia3zFHgjau787ikXOflWbCoes1jh65EGEbcbsCAYLn+Zm
 pE9zT/1dgC3nsyH0bO2PNmnVRipLrFrLMVzWys0jrIj6YONWc9rBFbuOFCoLOECvOfTj
 2V0ClppKU4HNY/T1gftWaDc6usf4HMqnd91cjTe4kJ6r5JbeRFT76+m1hC9zdYgRjQqb
 +SMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731077261; x=1731682061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGyiyIXBuBoOe5HAAD4h8VEZ8LbjC1rfwis/bjnPfwk=;
 b=UDCLwNqamV4NH04N8AJbeGwaqvMJv+I4HzCYY20zcsr1yD9uyMprrDopWlT17efGNr
 1LXdgOMt3cGq+X8QZXJ9cfomyG/PyQ6q1CiqxPZVOSgWFAtBJ59+g63DlXpxsPcbFtCn
 Y4QHRckaxB0btaFmi/qan52GDK4MBq8LvhTrzxso4mZk139sJgGs/V0797oLflZAsu+X
 Skw8tgkVWx13b6wLVrLE5WXoDhhxGRkhvLFJqij2SvW9Prov4lCfba1Akol/joJdVKK0
 wVgFN7HKjNSeLWsI4dVdLuuaj4//gjykOi0bUyK5TnYj9/wkLmnG1qHd3kXxamzvtZao
 yugw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPlosT0qZUOoPczHfiChw9CGfQHlFruDiQ5SSGOBpA3y6/V7KuySSQgPz7NjTAwS9sFXj/zN/1aQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw/wbxYC6yWzV5MmurnPEc9JtZZ2a6e7HScjUqR72lVdn8omz/Z
 sPOpwVwfEOC5SFgaa+M0dWU4tFPwlTocJfXx6Q5RVLXaMpPtlGLIqH43ITFo9A==
X-Received: by 2002:a17:907:c15:b0:a99:8a0e:8710 with SMTP id
 a640c23a62f3a-a9eefee6682mr244897966b.14.1731077260646; 
 Fri, 08 Nov 2024 06:47:40 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a9b1sm240534066b.52.2024.11.08.06.47.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 06:47:40 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v8 13/15] hw/vmapple/virtio-blk: Add support for apple
 virtio-blk
Date: Fri,  8 Nov 2024 15:47:07 +0100
Message-Id: <20241108144709.95498-14-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241108144709.95498-1-phil@philjordan.eu>
References: <20241108144709.95498-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::633;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x633.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: I1cIte8YWDCP

From: Alexander Graf <graf@amazon.com>

Apple has its own virtio-blk PCI device ID where it deviates from the
official virtio-pci spec slightly: It puts a new "apple type"
field at a static offset in config space and introduces a new barrier
command.

This patch first creates a mechanism for virtio-blk downstream classes to
handle unknown commands. It then creates such a downstream class and a new
vmapple-virtio-blk-pci class which support the additional apple type config
identifier as well as the barrier command.

It then exposes 2 subclasses from that that we can use to expose root and
aux virtio-blk devices: "vmapple-virtio-root" and "vmapple-virtio-aux".

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

v4:

 * Use recommended object type declaration pattern.
 * Correctly log unimplemented code paths.
 * Most header code moved to .c, type name #defines moved to vmapple.h

v5:

 * Corrected handling of potentially unaligned writes to virtio config area.
 * Simplified passing through device variant type to subobject.

 hw/block/virtio-blk.c          |  19 ++-
 hw/vmapple/Kconfig             |   3 +
 hw/vmapple/meson.build         |   1 +
 hw/vmapple/virtio-blk.c        | 226 +++++++++++++++++++++++++++++++++
 include/hw/pci/pci_ids.h       |   1 +
 include/hw/virtio/virtio-blk.h |  12 +-
 include/hw/vmapple/vmapple.h   |   4 +
 7 files changed, 261 insertions(+), 5 deletions(-)
 create mode 100644 hw/vmapple/virtio-blk.c

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 9166d7974d4..9e8337bb639 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -50,12 +50,12 @@ static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
     req->mr_next = NULL;
 }
 
-static void virtio_blk_free_request(VirtIOBlockReq *req)
+void virtio_blk_free_request(VirtIOBlockReq *req)
 {
     g_free(req);
 }
 
-static void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
+void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
 {
     VirtIOBlock *s = req->dev;
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
@@ -966,8 +966,18 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
         break;
     }
     default:
-        virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
-        virtio_blk_free_request(req);
+    {
+        /*
+         * Give subclasses a chance to handle unknown requests. This way the
+         * class lookup is not in the hot path.
+         */
+        VirtIOBlkClass *vbk = VIRTIO_BLK_GET_CLASS(s);
+        if (!vbk->handle_unknown_request ||
+            !vbk->handle_unknown_request(req, mrb, type)) {
+            virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
+            virtio_blk_free_request(req);
+        }
+    }
     }
     return 0;
 }
@@ -2044,6 +2054,7 @@ static const TypeInfo virtio_blk_info = {
     .instance_size = sizeof(VirtIOBlock),
     .instance_init = virtio_blk_instance_init,
     .class_init = virtio_blk_class_init,
+    .class_size = sizeof(VirtIOBlkClass),
 };
 
 static void virtio_register_types(void)
diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
index 8bbeb9a9237..bcd1be63e3c 100644
--- a/hw/vmapple/Kconfig
+++ b/hw/vmapple/Kconfig
@@ -7,3 +7,6 @@ config VMAPPLE_BDIF
 config VMAPPLE_CFG
     bool
 
+config VMAPPLE_VIRTIO_BLK
+    bool
+
diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
index 64b78693a31..bf17cf906c9 100644
--- a/hw/vmapple/meson.build
+++ b/hw/vmapple/meson.build
@@ -1,3 +1,4 @@
 system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
 system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true: files('bdif.c'))
 system_ss.add(when: 'CONFIG_VMAPPLE_CFG',  if_true: files('cfg.c'))
+system_ss.add(when: 'CONFIG_VMAPPLE_VIRTIO_BLK',  if_true: files('virtio-blk.c'))
diff --git a/hw/vmapple/virtio-blk.c b/hw/vmapple/virtio-blk.c
new file mode 100644
index 00000000000..1652151ec9c
--- /dev/null
+++ b/hw/vmapple/virtio-blk.c
@@ -0,0 +1,226 @@
+/*
+ * VMApple specific VirtIO Block implementation
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * VMApple uses almost standard VirtIO Block, but with a few key differences:
+ *
+ *  - Different PCI device/vendor ID
+ *  - An additional "type" identifier to differentiate AUX and Root volumes
+ *  - An additional BARRIER command
+ */
+
+#include "qemu/osdep.h"
+#include "hw/vmapple/vmapple.h"
+#include "hw/virtio/virtio-blk.h"
+#include "hw/virtio/virtio-pci.h"
+#include "qemu/bswap.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+
+OBJECT_DECLARE_TYPE(VMAppleVirtIOBlk, VMAppleVirtIOBlkClass, VMAPPLE_VIRTIO_BLK)
+
+typedef struct VMAppleVirtIOBlkClass {
+    VirtIOBlkClass parent;
+
+    void (*get_config)(VirtIODevice *vdev, uint8_t *config);
+} VMAppleVirtIOBlkClass;
+
+typedef struct VMAppleVirtIOBlk {
+    VirtIOBlock parent_obj;
+
+    uint32_t apple_type;
+} VMAppleVirtIOBlk;
+
+/*
+ * vmapple-virtio-blk-pci: This extends VirtioPCIProxy.
+ */
+#define TYPE_VMAPPLE_VIRTIO_BLK_PCI "vmapple-virtio-blk-pci-base"
+OBJECT_DECLARE_SIMPLE_TYPE(VMAppleVirtIOBlkPCI, VMAPPLE_VIRTIO_BLK_PCI)
+
+#define VIRTIO_BLK_T_APPLE_BARRIER     0x10000
+
+#define VIRTIO_APPLE_TYPE_ROOT 1
+#define VIRTIO_APPLE_TYPE_AUX  2
+
+static bool vmapple_virtio_blk_handle_unknown_request(VirtIOBlockReq *req,
+                                                      MultiReqBuffer *mrb,
+                                                      uint32_t type)
+{
+    switch (type) {
+    case VIRTIO_BLK_T_APPLE_BARRIER:
+        qemu_log_mask(LOG_UNIMP, "%s: Barrier requests are currently no-ops\n",
+                      __func__);
+        virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
+        virtio_blk_free_request(req);
+        return true;
+    default:
+        return false;
+    }
+}
+
+/*
+ * VMApple virtio-blk uses the same config format as normal virtio, with one
+ * exception: It adds an "apple type" specififer at the same location that
+ * the spec reserves for max_secure_erase_sectors. Let's hook into the
+ * get_config code path here, run it as usual and then patch in the apple type.
+ */
+static void vmapple_virtio_blk_get_config(VirtIODevice *vdev, uint8_t *config)
+{
+    VMAppleVirtIOBlk *dev = VMAPPLE_VIRTIO_BLK(vdev);
+    VMAppleVirtIOBlkClass *vvbk = VMAPPLE_VIRTIO_BLK_GET_CLASS(dev);
+    struct virtio_blk_config *blkcfg = (struct virtio_blk_config *)config;
+
+    vvbk->get_config(vdev, config);
+
+    g_assert(dev->parent_obj.config_size >= endof(struct virtio_blk_config, zoned));
+
+    /* Apple abuses the field for max_secure_erase_sectors as type id */
+    stl_he_p(&blkcfg->max_secure_erase_sectors, dev->apple_type);
+}
+
+static void vmapple_virtio_blk_class_init(ObjectClass *klass, void *data)
+{
+    VirtIOBlkClass *vbk = VIRTIO_BLK_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+    VMAppleVirtIOBlkClass *vvbk = VMAPPLE_VIRTIO_BLK_CLASS(klass);
+
+    vbk->handle_unknown_request = vmapple_virtio_blk_handle_unknown_request;
+    vvbk->get_config = vdc->get_config;
+    vdc->get_config = vmapple_virtio_blk_get_config;
+}
+
+static const TypeInfo vmapple_virtio_blk_info = {
+    .name          = TYPE_VMAPPLE_VIRTIO_BLK,
+    .parent        = TYPE_VIRTIO_BLK,
+    .instance_size = sizeof(VMAppleVirtIOBlk),
+    .class_init    = vmapple_virtio_blk_class_init,
+};
+
+/* PCI Devices */
+
+struct VMAppleVirtIOBlkPCI {
+    VirtIOPCIProxy parent_obj;
+    VMAppleVirtIOBlk vdev;
+    uint32_t apple_type;
+};
+
+
+static Property vmapple_virtio_blk_pci_properties[] = {
+    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
+    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
+                       DEV_NVECTORS_UNSPECIFIED),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void vmapple_virtio_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+    VirtIOBlkConf *conf = &dev->vdev.parent_obj.conf;
+
+    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
+        conf->num_queues = virtio_pci_optimal_num_queues(0);
+    }
+
+    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
+        vpci_dev->nvectors = conf->num_queues + 1;
+    }
+
+    /*
+     * We don't support zones, but we need the additional config space size.
+     * Let's just expose the feature so the rest of the virtio-blk logic
+     * allocates enough space for us. The guest will ignore zones anyway.
+     */
+    virtio_add_feature(&dev->vdev.parent_obj.host_features, VIRTIO_BLK_F_ZONED);
+    /* Propagate the apple type down to the virtio-blk device */
+    dev->vdev.apple_type = dev->apple_type;
+    /* and spawn the virtio-blk device */
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
+
+    /*
+     * The virtio-pci machinery adjusts its vendor/device ID based on whether
+     * we support modern or legacy virtio. Let's patch it back to the Apple
+     * identifiers here.
+     */
+    pci_config_set_vendor_id(vpci_dev->pci_dev.config, PCI_VENDOR_ID_APPLE);
+    pci_config_set_device_id(vpci_dev->pci_dev.config,
+                             PCI_DEVICE_ID_APPLE_VIRTIO_BLK);
+}
+
+static void vmapple_virtio_blk_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    device_class_set_props(dc, vmapple_virtio_blk_pci_properties);
+    k->realize = vmapple_virtio_blk_pci_realize;
+    pcidev_k->vendor_id = PCI_VENDOR_ID_APPLE;
+    pcidev_k->device_id = PCI_DEVICE_ID_APPLE_VIRTIO_BLK;
+    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
+    pcidev_k->class_id = PCI_CLASS_STORAGE_SCSI;
+}
+
+static void vmapple_virtio_blk_pci_instance_init(Object *obj)
+{
+    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VMAPPLE_VIRTIO_BLK);
+}
+
+static const VirtioPCIDeviceTypeInfo vmapple_virtio_blk_pci_info = {
+    .base_name     = TYPE_VMAPPLE_VIRTIO_BLK_PCI,
+    .generic_name  = "vmapple-virtio-blk-pci",
+    .instance_size = sizeof(VMAppleVirtIOBlkPCI),
+    .instance_init = vmapple_virtio_blk_pci_instance_init,
+    .class_init    = vmapple_virtio_blk_pci_class_init,
+};
+
+static void vmapple_virtio_root_instance_init(Object *obj)
+{
+    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(obj);
+
+    dev->apple_type = VIRTIO_APPLE_TYPE_ROOT;
+}
+
+static const TypeInfo vmapple_virtio_root_info = {
+    .name          = TYPE_VMAPPLE_VIRTIO_ROOT,
+    .parent        = "vmapple-virtio-blk-pci",
+    .instance_size = sizeof(VMAppleVirtIOBlkPCI),
+    .instance_init = vmapple_virtio_root_instance_init,
+};
+
+static void vmapple_virtio_aux_instance_init(Object *obj)
+{
+    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(obj);
+
+    dev->apple_type = VIRTIO_APPLE_TYPE_AUX;
+}
+
+static const TypeInfo vmapple_virtio_aux_info = {
+    .name          = TYPE_VMAPPLE_VIRTIO_AUX,
+    .parent        = "vmapple-virtio-blk-pci",
+    .instance_size = sizeof(VMAppleVirtIOBlkPCI),
+    .instance_init = vmapple_virtio_aux_instance_init,
+};
+
+static void vmapple_virtio_blk_register_types(void)
+{
+    type_register_static(&vmapple_virtio_blk_info);
+    virtio_pci_types_register(&vmapple_virtio_blk_pci_info);
+    type_register_static(&vmapple_virtio_root_info);
+    type_register_static(&vmapple_virtio_aux_info);
+}
+
+type_init(vmapple_virtio_blk_register_types)
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index f1a53fea8d6..33e2898be95 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -191,6 +191,7 @@
 #define PCI_DEVICE_ID_APPLE_UNI_N_AGP    0x0020
 #define PCI_DEVICE_ID_APPLE_U3_AGP       0x004b
 #define PCI_DEVICE_ID_APPLE_UNI_N_GMAC   0x0021
+#define PCI_DEVICE_ID_APPLE_VIRTIO_BLK   0x1a00
 
 #define PCI_VENDOR_ID_SUN                0x108e
 #define PCI_DEVICE_ID_SUN_EBUS           0x1000
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 5c14110c4b1..28d5046ea6c 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -24,7 +24,7 @@
 #include "qapi/qapi-types-virtio.h"
 
 #define TYPE_VIRTIO_BLK "virtio-blk-device"
-OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBlock, VIRTIO_BLK)
+OBJECT_DECLARE_TYPE(VirtIOBlock, VirtIOBlkClass, VIRTIO_BLK)
 
 /* This is the last element of the write scatter-gather list */
 struct virtio_blk_inhdr
@@ -100,6 +100,16 @@ typedef struct MultiReqBuffer {
     bool is_write;
 } MultiReqBuffer;
 
+typedef struct VirtIOBlkClass {
+    /*< private >*/
+    VirtioDeviceClass parent;
+    /*< public >*/
+    bool (*handle_unknown_request)(VirtIOBlockReq *req, MultiReqBuffer *mrb,
+                                   uint32_t type);
+} VirtIOBlkClass;
+
 void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
+void virtio_blk_free_request(VirtIOBlockReq *req);
+void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status);
 
 #endif
diff --git a/include/hw/vmapple/vmapple.h b/include/hw/vmapple/vmapple.h
index 3bba59f5ec7..b20956e1286 100644
--- a/include/hw/vmapple/vmapple.h
+++ b/include/hw/vmapple/vmapple.h
@@ -18,4 +18,8 @@
 
 #define TYPE_VMAPPLE_CFG "vmapple-cfg"
 
+#define TYPE_VMAPPLE_VIRTIO_BLK  "vmapple-virtio-blk"
+#define TYPE_VMAPPLE_VIRTIO_ROOT "vmapple-virtio-root"
+#define TYPE_VMAPPLE_VIRTIO_AUX  "vmapple-virtio-aux"
+
 #endif /* HW_VMAPPLE_VMAPPLE_H */
-- 
2.39.3 (Apple Git-145)

