Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp3124846lfj;
        Tue, 18 Jan 2022 12:47:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4n9IVdbfULXTRPNmYqXpZZ1gVnfVQQ7zb/B3M7TpfvCk4vi5foJ2TLKIIAueB9s61CmZD
X-Received: by 2002:a25:6dc5:: with SMTP id i188mr33266692ybc.72.1642538846120;
        Tue, 18 Jan 2022 12:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642538846; cv=none;
        d=google.com; s=arc-20160816;
        b=uxKc7XrFvjm4Y49vbxLaGVf+uFwIH38mU0Yy3/GczgKaQOn6UW8o/Ej00VVt6BUHs9
         SkF5nJzCN6h6rIW08Ov2TJAX/oO7GN/6gieCv1nYFVDfVVgJS6nGbc7G3EPW2U0WhDva
         Vh1/irjxjuVmYU0lV8dvdKabI3y8pbYpD3oFgsZDNQx6AMlbk2w6ncsshpWeVeXrAHW/
         fMol4MSVSSLvM2J+dyDeJksIeUUtEPF/ErNJTOxJ0Ja2RKBazOuheQEVqjoG/A9spqwN
         aZBAcAuM2/toBxWCffmoNq94RwKzLPmXp6Omt1PtDaWHZnmAJuswe80v5GTOwvtTNc5u
         RT4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KCL4s1oWVVgFbaSzYuwDwQsNuFYm6/osfpXc/Qc+HkY=;
        b=DFwAd6slLhfAaWPbUVZYX75mN/JK1C9tsX3J6CszdYT+qClYNDv30HChNmvBqCL8tk
         FfOCKBjbNS7kLiRBbhsToUIOUaWN79TQnTXY744h+U41hY6eqCBvddshyroHvbO3uzqG
         kG1GP01IKKKqhLyQTU4JD7Hsg82l4wKJ1QEC07+ay3ludaiKrQvKk1lzr7i7XfA2gHPx
         l8UuqwmNsa2KMCi+BJA0GLMmqAlN2dWsBsK9r89lU5aS7/7xZOv/snux7ovGMv8djUfX
         /qfQgsyQiww9/TrG/Kkuw+0zlBPR5m7tUWemuGQun4bjx7BPgXFgx01eUxihjs/gZo9X
         1Gjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O7HwGF3M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si12741842yba.11.2022.01.18.12.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jan 2022 12:47:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O7HwGF3M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n9vO1-0004H0-Em
	for alex.bennee@linaro.org; Tue, 18 Jan 2022 15:47:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9vG9-0005xl-6v
 for qemu-arm@nongnu.org; Tue, 18 Jan 2022 15:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9vG7-0003Hp-EY
 for qemu-arm@nongnu.org; Tue, 18 Jan 2022 15:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642538354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KCL4s1oWVVgFbaSzYuwDwQsNuFYm6/osfpXc/Qc+HkY=;
 b=O7HwGF3MZ+0Z0LhAqnEhFtkYrLIxKBar/8+l0EDRyy9oXdrrxusgtEAWjxuZZyHFqXCv3R
 kMXHeJOLg9CUGkAk2wuliTvMxlHXKIjPaRIBUPI15UsiVbuvJLsnerpqDFOK6hk/4rQcUa
 fs7SfssqCuDO4xQNEC21Yo69KkeyI3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-QEtLclgZMC-bkisJv_OiQQ-1; Tue, 18 Jan 2022 15:39:11 -0500
X-MC-Unique: QEtLclgZMC-bkisJv_OiQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7D9985EE67;
 Tue, 18 Jan 2022 20:39:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E77295DB83;
 Tue, 18 Jan 2022 20:39:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com
Subject: [PATCH v2 3/6] tests/qtest/libqos: Skip hotplug tests if pci root bus
 is not hotpluggable
Date: Tue, 18 Jan 2022 21:38:30 +0100
Message-Id: <20220118203833.316741-4-eric.auger@redhat.com>
In-Reply-To: <20220118203833.316741-1-eric.auger@redhat.com>
References: <20220118203833.316741-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9b7H3NyFH7Q

ARM does not not support hotplug on pcie.0. Add a flag on the bus
which tells if devices can be hotplugged and skip hotplug tests
if the bus cannot be hotplugged. This is a temporary solution to
enable the other pci tests on aarch64.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>

---

v1 ->v2:
- reword g_test_skip msg into "pci bus does not support hotplug"
---
 tests/qtest/e1000e-test.c         |  6 ++++++
 tests/qtest/libqos/pci.h          |  1 +
 tests/qtest/vhost-user-blk-test.c | 10 ++++++++++
 tests/qtest/virtio-blk-test.c     |  5 +++++
 tests/qtest/virtio-net-test.c     |  5 +++++
 tests/qtest/virtio-rng-test.c     |  5 +++++
 6 files changed, 32 insertions(+)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 0273fe4c15..48f3dbb0fd 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -235,6 +235,12 @@ static void test_e1000e_multiple_transfers(void *obj, void *data,
 static void test_e1000e_hotplug(void *obj, void *data, QGuestAllocator * alloc)
 {
     QTestState *qts = global_qtest;  /* TODO: get rid of global_qtest here */
+    QE1000E_PCI *dev = obj;
+
+    if (dev->pci_dev.bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
 
     qtest_qmp_device_add(qts, "e1000e", "e1000e_net", "{'addr': '0x06'}");
     qpci_unplug_acpi_device_test(qts, "e1000e_net", 0x06);
diff --git a/tests/qtest/libqos/pci.h b/tests/qtest/libqos/pci.h
index 44f6806fe4..6a28b40522 100644
--- a/tests/qtest/libqos/pci.h
+++ b/tests/qtest/libqos/pci.h
@@ -52,6 +52,7 @@ struct QPCIBus {
     uint64_t pio_alloc_ptr, pio_limit;
     uint64_t mmio_alloc_ptr, mmio_limit;
     bool has_buggy_msi; /* TRUE for spapr, FALSE for pci */
+    bool not_hotpluggable; /* TRUE if devices cannot be hotplugged */
 
 };
 
diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 62e670f39b..1316aae0fa 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -676,6 +676,11 @@ static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtioPCIDevice *dev;
     QTestState *qts = dev1->pdev->bus->qts;
 
+    if (dev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     /* plug secondary disk */
     qtest_qmp_device_add(qts, "vhost-user-blk-pci", "drv1",
                          "{'addr': %s, 'chardev': 'char2'}",
@@ -703,6 +708,11 @@ static void multiqueue(void *obj, void *data, QGuestAllocator *t_alloc)
     uint64_t features;
     uint16_t num_queues;
 
+    if (pdev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("bus pci.0 does not support hotplug");
+        return;
+    }
+
     /*
      * The primary device has 1 queue and VIRTIO_BLK_F_MQ is not enabled. The
      * VIRTIO specification allows VIRTIO_BLK_F_MQ to be enabled when there is
diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c
index 2a23698211..acb44c9fb8 100644
--- a/tests/qtest/virtio-blk-test.c
+++ b/tests/qtest/virtio-blk-test.c
@@ -701,6 +701,11 @@ static void pci_hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QVirtioPCIDevice *dev;
     QTestState *qts = dev1->pdev->bus->qts;
 
+    if (dev1->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     /* plug secondary disk */
     qtest_qmp_device_add(qts, "virtio-blk-pci", "drv1",
                          "{'addr': %s, 'drive': 'drive1'}",
diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index 8bf74e516c..af3027144f 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -174,6 +174,11 @@ static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
     QTestState *qts = dev->pdev->bus->qts;
     const char *arch = qtest_get_arch();
 
+    if (dev->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     qtest_qmp_device_add(qts, "virtio-net-pci", "net1",
                          "{'addr': %s}", stringify(PCI_SLOT_HP));
 
diff --git a/tests/qtest/virtio-rng-test.c b/tests/qtest/virtio-rng-test.c
index e6b8cd8e0c..5ce444ad72 100644
--- a/tests/qtest/virtio-rng-test.c
+++ b/tests/qtest/virtio-rng-test.c
@@ -20,6 +20,11 @@ static void rng_hotplug(void *obj, void *data, QGuestAllocator *alloc)
     QVirtioPCIDevice *dev = obj;
     QTestState *qts = dev->pdev->bus->qts;
 
+   if (dev->pdev->bus->not_hotpluggable) {
+        g_test_skip("pci bus does not support hotplug");
+        return;
+    }
+
     const char *arch = qtest_get_arch();
 
     qtest_qmp_device_add(qts, "virtio-rng-pci", "rng1",
-- 
2.26.3

