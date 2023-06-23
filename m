Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp114397ejn;
        Fri, 23 Jun 2023 05:23:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HXNsMRZXT0SR00/QsX26sg9iuguE7tKduhO+84zB33Br7rTajoawQnZIm4fIIRQ9wa7+A
X-Received: by 2002:a05:622a:1113:b0:3f6:be32:63e8 with SMTP id e19-20020a05622a111300b003f6be3263e8mr26214333qty.55.1687522989140;
        Fri, 23 Jun 2023 05:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687522989; cv=none;
        d=google.com; s=arc-20160816;
        b=XXEcNGYyvRg+FsCge3vW/Yf+P5rawv6Byh/htap5holrUG3vitREot4O2MzkrIYP3n
         Q+HJ4zSCCs/kbKVu23GD9Z+Uo+lOcn/WV+12+G+sdki4+VGLIxvxvA/bJJ95jaVHwrH6
         HyziKFqeaqSuIh9KgvQ3IjQ63/ZXsqXt36BLxXHP6S/IjJZfhV5l6XjVgckj+GRfFw8a
         r1iXlwYJDnBpT0VdMvHGJMwol52OCDNTA/hRBX0eqlL/uD1+gqc0NZQln7LqjYj6le4l
         MOqn3Xpgc5cTmdh/VpcvnMDq/B8g21Okt+iwB94tUNe93h5h2/Hx57Ag7RBT0eXfhzAJ
         ScSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/O01eTYetJ4kEOUzh7C1X/NfigiYJlLAlUGeC6Q7ByQ=;
        b=Gfix76Lc6hhKsPdTMG/WRMt63wgfBcrXt6ay7yfHaICfsTrXH88p+uWZnHoyG+6xw/
         O3A/ycoBYqcBu7lMqa1qGm0QR3ivW/zWZgYPm9dj91C7+Ops1L2XQn54EIAqmY96AMh2
         EICdLCxXUZFzZ1b0DUfWqlsTY7cjx4Xb1UfQBULx3tadzrkdolvQrnvMNRc+WPCsd84g
         VJnNxnshEp9kjh0bwb/C2tscMd6YPgEiLkdQ/9JIlHN2meIZv06sucuWc7AgeZeB0K3O
         vbMmo38KclFmdqOU4YXnWERzQJ4O5k4HnuGghpUg8iUByxtMe2ITuAnr6nZGlfkJ0lO6
         rpyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QTbxytKs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21-20020ac87d55000000b003f9a7bba2casi3542030qtb.406.2023.06.23.05.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 05:23:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QTbxytKs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCfoQ-00068k-7K; Fri, 23 Jun 2023 08:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCfn3-0003pU-PP
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 08:21:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCfmv-0003nz-Am
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 08:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687522875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/O01eTYetJ4kEOUzh7C1X/NfigiYJlLAlUGeC6Q7ByQ=;
 b=QTbxytKsJP14lXBWLQRn01QxYiCqtna6yEEruw3y+1Lk/zNK+pqGyMBMqvD4U6+/W3QFjj
 VfGSHP+uCrFd21q6OapBZfZXkRub8/IdogVKMY3S6oZOPeMYWLJAGrJCHTfFZu1k8At0uW
 LiAefbHNJzrY8Ly3xjpVrpL3iHPGRFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-DCw_G-5WP-atOpERiYWXnQ-1; Fri, 23 Jun 2023 08:21:12 -0400
X-MC-Unique: DCw_G-5WP-atOpERiYWXnQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D3680027F;
 Fri, 23 Jun 2023 12:21:12 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.32.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3A7D40C2063;
 Fri, 23 Jun 2023 12:21:09 +0000 (UTC)
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
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 5/7] virtio-md-pci: Support unplug requests for compatible
 devices
Date: Fri, 23 Jun 2023 14:20:54 +0200
Message-Id: <20230623122056.374312-6-david@redhat.com>
In-Reply-To: <20230623122056.374312-1-david@redhat.com>
References: <20230623122056.374312-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: oLRNIZVyrmb+

Let's support unplug requests for virtio-md-pci devices that provide
a unplug_request_check() callback.

We'll wire that up for virtio-mem-pci next.

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
2.40.1

