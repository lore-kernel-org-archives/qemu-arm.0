Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1068788eje;
        Mon, 10 Jul 2023 03:08:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlETdFjEEUpxhP3ZYhh6Bg1gReiKaH5fH4XvxD4sI3RSuODVb2xzW+jk7Wyr+vzibpHujNRc
X-Received: by 2002:ac8:57d1:0:b0:3fd:eb53:3d8a with SMTP id w17-20020ac857d1000000b003fdeb533d8amr14958603qta.26.1688983704678;
        Mon, 10 Jul 2023 03:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688983704; cv=none;
        d=google.com; s=arc-20160816;
        b=ozIuaXt1/RMnGH9iDRzOeWZrQGdQ+LyCzT8NIi9+c8NW8N9hFxJXmMFWIobYipWNN8
         G+DCP+2OBGeYV0dYCy5fiTrjpqB7qk5CDo7W8j/xPTXVCRf4JUKJpmF1vBBdYrgiyIy8
         +0S/LziBHP9qnFqi8tMD7rohADSkJSo6w7eUT9M3uqYxAjmcnT6G35ExwpHw/6gsq0+2
         ruvWrk/ANrXKyB+5qcxcGTXtlTtpFbBusQtcBm9ORe+BSSMZpTclaXvA1P9jtT6jW/1T
         PB55h4K3vuz7l8UyNZsm5Px4e8RqtK/mgQ2X3mZ0y+xtKrH1JqubzVzKdy7ghr0sLbor
         EKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YoxMG4iTkPZLehoWO3OXHc8JLdddwXi1LqzpJbiwRLo=;
        fh=he34ucSNOi56U9wkr/s+M3ZTDgBY7iRqVjLgddG0i4w=;
        b=q5ZuzT9pDixgHGPOANApq0F3ge0kCE3Tnsr6o56Qw3hAl8saMtV9O+4STZ7GLzfMbG
         xpWP0zGoABVNF172oSmcJc7OPjB9UBhrAZY1EVN6fSNXyNkN20g3NaMghk0JvY8TGWeC
         Fm5IcxK/+qcGYru2p7BzaVT/TsEq5cBMt/sgpyY8rgFXHlmriQSUaa7Dqd0bhjvo6BLJ
         iaOqdGAHxOjUlPN+GrDFzHNbEvddSGL3Ht7WCas+evcoV9XcCno2Fe013TplLGEv/e7i
         OP2TesttBLj6TTitRgVPHinyLiFhfetgyTHeqooWHhDuBTvM/OAVNZz4KbonteAJEhPw
         s+qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IBJjacea;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6-20020a05622a120600b004039b8e1214si3442673qtx.4.2023.07.10.03.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 03:08:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IBJjacea;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIno2-0003uJ-Mp; Mon, 10 Jul 2023 06:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qIno1-0003tL-90
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 06:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qInnz-0004oS-IC
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 06:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688983663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoxMG4iTkPZLehoWO3OXHc8JLdddwXi1LqzpJbiwRLo=;
 b=IBJjaceablLtW/E/qIXE63kpBMfNglgBIsPHmXg9xUA0rvZtGzQK+5uTgxCDR7G3ENdASo
 sAWT7Ytcm6EYIOVA5dbkDcmPdmHlABiEqAH9MtJ+qIbyD1msJFMJhi7MVkZLVBDE/6pwai
 mYhm/qv4CZ9q45/K9KPI97O50pBSG3c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-Zdvh4be_P5Ko-zHMMenzxQ-1; Mon, 10 Jul 2023 06:07:41 -0400
X-MC-Unique: Zdvh4be_P5Ko-zHMMenzxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E437384CC4D;
 Mon, 10 Jul 2023 10:07:41 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23A88111CA03;
 Mon, 10 Jul 2023 10:07:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Mario Casquero <mcasquer@redhat.com>
Subject: [PATCH v3 7/7] virtio-mem-pci: Device unplug support
Date: Mon, 10 Jul 2023 12:07:14 +0200
Message-ID: <20230710100714.228867-8-david@redhat.com>
In-Reply-To: <20230710100714.228867-1-david@redhat.com>
References: <20230710100714.228867-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: SxNQJTRXU3hT

Let's support device unplug by forwarding the unplug_request_check()
callback to the virtio-mem device.

Further, disallow changing the requested-size once an unplug request is
pending.

Disallowing requested-size changes handles corner cases such as
(1) pausing the VM (2) requesting device unplug and (3) adjusting the
requested size. If the VM would plug memory (due to the requested size
change) before processing the unplug request, we would be in trouble.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem-pci.c | 49 +++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index 2ef0f07630..c4597e029e 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -93,12 +93,53 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
     g_free(qom_path);
 }
 
+static void virtio_mem_pci_unplug_request_check(VirtIOMDPCI *vmd, Error **errp)
+{
+    VirtIOMEMPCI *pci_mem = VIRTIO_MEM_PCI(vmd);
+    VirtIOMEM *vmem = &pci_mem->vdev;
+    VirtIOMEMClass *vpc = VIRTIO_MEM_GET_CLASS(vmem);
+
+    vpc->unplug_request_check(vmem, errp);
+}
+
+static void virtio_mem_pci_get_requested_size(Object *obj, Visitor *v,
+                                              const char *name, void *opaque,
+                                              Error **errp)
+{
+    VirtIOMEMPCI *pci_mem = VIRTIO_MEM_PCI(obj);
+
+    object_property_get(OBJECT(&pci_mem->vdev), name, v, errp);
+}
+
+static void virtio_mem_pci_set_requested_size(Object *obj, Visitor *v,
+                                              const char *name, void *opaque,
+                                              Error **errp)
+{
+    VirtIOMEMPCI *pci_mem = VIRTIO_MEM_PCI(obj);
+    DeviceState *dev = DEVICE(obj);
+
+    /*
+     * If we passed virtio_mem_pci_unplug_request_check(), making sure that
+     * the requested size is 0, don't allow modifying the requested size
+     * anymore, otherwise the VM might end up hotplugging memory before
+     * handling the unplug request.
+     */
+    if (dev->pending_deleted_event) {
+        error_setg(errp, "'%s' cannot be changed if the device is in the"
+                   " process of unplug", name);
+        return;
+    }
+
+    object_property_set(OBJECT(&pci_mem->vdev), name, v, errp);
+}
+
 static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
     PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
     MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(klass);
+    VirtIOMDPCIClass *vmdc = VIRTIO_MD_PCI_CLASS(klass);
 
     k->realize = virtio_mem_pci_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
@@ -111,6 +152,8 @@ static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
     mdc->get_memory_region = virtio_mem_pci_get_memory_region;
     mdc->fill_device_info = virtio_mem_pci_fill_device_info;
     mdc->get_min_alignment = virtio_mem_pci_get_min_alignment;
+
+    vmdc->unplug_request_check = virtio_mem_pci_unplug_request_check;
 }
 
 static void virtio_mem_pci_instance_init(Object *obj)
@@ -135,9 +178,9 @@ static void virtio_mem_pci_instance_init(Object *obj)
                               OBJECT(&dev->vdev), VIRTIO_MEM_BLOCK_SIZE_PROP);
     object_property_add_alias(obj, VIRTIO_MEM_SIZE_PROP, OBJECT(&dev->vdev),
                               VIRTIO_MEM_SIZE_PROP);
-    object_property_add_alias(obj, VIRTIO_MEM_REQUESTED_SIZE_PROP,
-                              OBJECT(&dev->vdev),
-                              VIRTIO_MEM_REQUESTED_SIZE_PROP);
+    object_property_add(obj, VIRTIO_MEM_REQUESTED_SIZE_PROP, "size",
+                        virtio_mem_pci_get_requested_size,
+                        virtio_mem_pci_set_requested_size, NULL, NULL);
 }
 
 static const VirtioPCIDeviceTypeInfo virtio_mem_pci_info = {
-- 
2.41.0

