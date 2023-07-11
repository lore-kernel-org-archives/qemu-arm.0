Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1981138eje;
        Tue, 11 Jul 2023 08:35:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGfVxyvRorVsqUvr3hGVUsvp1DIWNEmCGsZO0kCGBuG3q/3t83TnduTtZnx7AQ/xW9MXHJy
X-Received: by 2002:a0c:8d45:0:b0:635:dd30:8181 with SMTP id s5-20020a0c8d45000000b00635dd308181mr14417305qvb.56.1689089752737;
        Tue, 11 Jul 2023 08:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689089752; cv=none;
        d=google.com; s=arc-20160816;
        b=wcO8wZOatF/2X59VqKFm3b7cD98VinTU33dy4KHpP99NQcc+4K6zpnXiX0JIfi8EGf
         RbESczRALvHZ+wu/MmsGmHIfnB2IMw+qxGPynE7yHYRDSQG6ceHhtZt7+VYqstVDYeOq
         6wrUNs0XigDENDnxcowHVs+ZIuIAazGQJ3ivBxncDNSp7SJh41gO4hSVy2Fb4kmJ8+oT
         OpaAfBH9P1jfmI29Gkc2mwe2CKFHTsqP5pnzJB2RApe+Gyz1tyWezAJTFJnENjVRYLNN
         utWHtiQ0bek/WfdUvy070TBQWxLI/goi9cTgoEpV4MhDdGX4vA41fS0zFXp29KHybdBC
         r9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2uLwmFuTr/wAV/uBvTQzX96h8o4ZK3oUljwgdfMzvkU=;
        fh=he34ucSNOi56U9wkr/s+M3ZTDgBY7iRqVjLgddG0i4w=;
        b=H9fU01Op9A29CyzoZRGBf1Yicy/MfX+Hh21q1j8XnoaasECMFScSSsVAMUJJ/C1PvN
         L08f296t2pBXLBFuVi+QbuwDPs4JnClRglmWEyaejFaE4WgyWdYRUplhYa1JyEs/3jL7
         aAsi+G3MRshMZ0/sBUiXPqy11OdENWGK4hp1GD2AG4GqyaDurvsa5qJyFeQ1jprFLLTA
         SeG3jYkJfQ0Opj8kcL7Z4HXbF2HqoqczS50RZ8GXcHoupHBfc5uDBZci2odkYrKOwaaa
         GP5Fs3cd4HLIQqRAvIPiNuZe5Hrn6Sq9rbE6MtsHuhRK6cCCEoCOFvw63EGtZB9x9ASK
         a7yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OY0R2lVW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1-20020a0cdb01000000b0063673095de0si873974qvk.179.2023.07.11.08.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 08:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OY0R2lVW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJFOa-0007vi-R2; Tue, 11 Jul 2023 11:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJFOQ-0007rU-ON
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:35:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qJFOO-0005pJ-3H
 for qemu-arm@nongnu.org; Tue, 11 Jul 2023 11:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689089707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2uLwmFuTr/wAV/uBvTQzX96h8o4ZK3oUljwgdfMzvkU=;
 b=OY0R2lVWvN31GfpTMkDYSMCFZVk1B8kQ/VPT+OEot/E8uva36eZI8CApguFvoH6ICYh6+V
 Vn4Nx7XVFGkkkTtI+SC0zfrdMo1KL50HAkhLdWtf2MhxTl4M0zE/eLJGWlMnfsejBjkDSe
 M5qIZIEgPTm8pCJ13cLRsivSOpFumSw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-3Xp0wFMfPK2rPDz1P6Lddw-1; Tue, 11 Jul 2023 11:35:03 -0400
X-MC-Unique: 3Xp0wFMfPK2rPDz1P6Lddw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 935E41043AC9;
 Tue, 11 Jul 2023 15:35:02 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A359C478DE;
 Tue, 11 Jul 2023 15:35:00 +0000 (UTC)
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
Subject: [PATCH v4 5/7] virtio-md-pci: Support unplug requests for compatible
 devices
Date: Tue, 11 Jul 2023 17:34:43 +0200
Message-ID: <20230711153445.514112-6-david@redhat.com>
In-Reply-To: <20230711153445.514112-1-david@redhat.com>
References: <20230711153445.514112-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kJ+3AB05IqVC

Let's support unplug requests for virtio-md-pci devices that provide
a unplug_request_check() callback.

We'll wire that up for virtio-mem-pci next.

Tested-by: Mario Casquero <mcasquer@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-md-pci.c         | 38 +++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-md-pci.h |  3 +++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-md-pci.c b/hw/virtio/virtio-md-pci.c
index a22a259e2d..62bfb7920b 100644
--- a/hw/virtio/virtio-md-pci.c
+++ b/hw/virtio/virtio-md-pci.c
@@ -69,8 +69,42 @@ void virtio_md_pci_plug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp)
 void virtio_md_pci_unplug_request(VirtIOMDPCI *vmd, MachineState *ms,
                                   Error **errp)
 {
-    /* We don't support hot unplug of virtio based memory devices */
-    error_setg(errp, "virtio based memory devices cannot be unplugged.");
+    VirtIOMDPCIClass *vmdc = VIRTIO_MD_PCI_GET_CLASS(vmd);
+    DeviceState *dev = DEVICE(vmd);
+    HotplugHandler *bus_handler = qdev_get_bus_hotplug_handler(dev);
+    HotplugHandlerClass *hdc;
+    Error *local_err = NULL;
+
+    if (!vmdc->unplug_request_check) {
+        error_setg(errp, "this virtio based memory devices cannot be unplugged");
+        return;
+    }
+
+    if (!bus_handler) {
+        error_setg(errp, "hotunplug of virtio based memory devices not"
+                   "supported on this bus");
+        return;
+    }
+
+    vmdc->unplug_request_check(vmd, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /*
+     * Forward the async request or turn it into a sync request (handling it
+     * like qdev_unplug()).
+     */
+    hdc = HOTPLUG_HANDLER_GET_CLASS(bus_handler);
+    if (hdc->unplug_request) {
+        hotplug_handler_unplug_request(bus_handler, dev, &local_err);
+    } else {
+        virtio_md_pci_unplug(vmd, ms, &local_err);
+        if (!local_err) {
+            object_unparent(OBJECT(dev));
+        }
+    }
 }
 
 void virtio_md_pci_unplug(VirtIOMDPCI *vmd, MachineState *ms, Error **errp)
diff --git a/include/hw/virtio/virtio-md-pci.h b/include/hw/virtio/virtio-md-pci.h
index f9fa857aec..5912e16674 100644
--- a/include/hw/virtio/virtio-md-pci.h
+++ b/include/hw/virtio/virtio-md-pci.h
@@ -26,6 +26,9 @@ OBJECT_DECLARE_TYPE(VirtIOMDPCI, VirtIOMDPCIClass, VIRTIO_MD_PCI)
 struct VirtIOMDPCIClass {
     /* private */
     VirtioPCIClass parent;
+
+    /* public */
+    void (*unplug_request_check)(VirtIOMDPCI *vmd, Error **errp);
 };
 
 struct VirtIOMDPCI {
-- 
2.41.0

