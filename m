Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1068518eje;
        Mon, 10 Jul 2023 03:07:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG1OZ/Wke1dC7wf8KQIyr9Dw27Fvt4/vW8SmpfVwh4IP1Elf7Gyaf0FwQYIn8YZ3bNr6VGI
X-Received: by 2002:a0d:d5c7:0:b0:579:ecfd:bb90 with SMTP id x190-20020a0dd5c7000000b00579ecfdbb90mr12074584ywd.1.1688983672531;
        Mon, 10 Jul 2023 03:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688983672; cv=none;
        d=google.com; s=arc-20160816;
        b=gR+2zMxf707VWYwquO0EqkPOf7DKiRVK977jf5doSFYQG9OhOvZB9JX/UzUQzbDwbW
         RZzszELBgniZZTfYYVUOwItmuUPniGQCBJwTUMUbSTmlB9f1qXu3Fj0RazCZoY4Ig6xM
         cSUes6ydtNrMp/nUyt2buDSBDHDAld2K3pFZCAxQToX4zs0ih51j065npM0TNGfxa6MI
         DGQh3pthKkFpGRDHRPRyVZ89HEGD5c+H3z8Hzf5byZ2r1zUVgA+xuYYFsl2TMOFBCh58
         T8hpWDl0qcBhD+2OenWFTkVsxZOQULAljOHFXQ3E0AUsNJmABEm/Q290K3P9FNncSY0y
         PCDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xfL8k0pPXx9PsE1cz1/9G0cs3ii5MC5h6YnO0QPX1Y0=;
        fh=he34ucSNOi56U9wkr/s+M3ZTDgBY7iRqVjLgddG0i4w=;
        b=pyU7RXtaST4Ju1UXZNaNjyyKBuCEwthWcnzGAsCekeygj22BCKsPZMmGX+tG2Fp9Wh
         93MrzYOZWjV1EnN7AtnNjE7DVQI3herbJg6bz+0akddv10dyyN898FF4h8WD4A91Zau7
         HkQw5f0j6CbEH4ViKNiINeSXbmh6hgDY97/BL5l0IpXNwHm9jawbcYR3wDaocqwTFmKo
         XSlkEVCopdAhBabqV33sdoOlOrEbOtLC1xujpd1x6UYjNUQrPQxLbVSHKRhGBP28h8mu
         AYmad9MWDkdCY7CMD0v8k8MHFsmrGLu2iq4n02N6h7Tl5WY6Gu7xv12z5/bd6Cwli7rJ
         oZ7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W0UdbhPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a0cdc0e000000b00636d76c80edsi5228658qvk.571.2023.07.10.03.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jul 2023 03:07:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W0UdbhPw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIno1-0003tZ-Gk; Mon, 10 Jul 2023 06:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qIno0-0003sW-0g
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 06:07:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qInny-0004oC-J8
 for qemu-arm@nongnu.org; Mon, 10 Jul 2023 06:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688983662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xfL8k0pPXx9PsE1cz1/9G0cs3ii5MC5h6YnO0QPX1Y0=;
 b=W0UdbhPwPbVM+My7JLSQuaekNLzOGwkTtsB6sOpGohazv9bwoBcIzAO0Ofuj2qlfV96TZA
 8f639HIMninxYIw/TadsFv26irx/xZEIDlm3rEZj7BKb0XTMoLG2WRzrxiCZSoBWHhY0UG
 EpzXa0YAoWBK055EY7rqsei2/9cMdYE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-58QOYagYMUuTOmbb3jYjfQ-1; Mon, 10 Jul 2023 06:07:36 -0400
X-MC-Unique: 58QOYagYMUuTOmbb3jYjfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77AA73C10145;
 Mon, 10 Jul 2023 10:07:36 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.194.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2815C111CA01;
 Mon, 10 Jul 2023 10:07:34 +0000 (UTC)
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
Subject: [PATCH v3 5/7] virtio-md-pci: Support unplug requests for compatible
 devices
Date: Mon, 10 Jul 2023 12:07:12 +0200
Message-ID: <20230710100714.228867-6-david@redhat.com>
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
X-TUID: AFCVT50g2Mwg

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
2.41.0

