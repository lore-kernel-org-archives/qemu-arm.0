Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1168287lfj;
        Mon, 10 Jan 2022 13:36:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBXgd6cvX+cWmNdSFRgNBuPzA5Og9upl5jDGRnn4K8uA8vYw35pVfszUeiaYviDNXHBVwA
X-Received: by 2002:a25:d750:: with SMTP id o77mr2122499ybg.543.1641850613344;
        Mon, 10 Jan 2022 13:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641850613; cv=none;
        d=google.com; s=arc-20160816;
        b=dk+eDmhU97baMreZmrNBUp4Os3mMndRM65p24aSygJyUpc6KsUvg6u2Dkk9S/Z96L1
         QPd1LXh8SHkVSUCDAemh0oKXtuksU7QN2l8NCNjxf/X5v+wn1e/wWVLnwm7ZIPEw3rX1
         ZuHw56BNzgjxYI5PjdUVmov1DBBQUkAty2/t1qjAb6mQ3Hb2xYAnwgGaE9O8+0FVQccH
         Aj8YeqAARP0RatJ1XXng1zRY55Lm/pbDwCTmGstjF8W05JhC8Ph5hFgATQnGVtUfhtfe
         oVOyNQ/8dsYCA3jB2OGaMRjZzs1pDNmzX9eTxszRunmd3r/b0tdkxWBX2eCmc5m1Higw
         eViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0Q7Kpur1KSgTZQSYvZxdZr1XOr4nijd7s9YR7ZVgDyM=;
        b=e37dXDOFd5gbTgGo2rgZf4YzzOBoDPKjZJaNi+N5lo99ODMI64wQkSmQbgS56kVNsM
         GyfwuUYLyEfTj/NnjgkWYtxkYgzQg0fkJUOC3JlKYlG7IOtgTpgM+ULZj2Mx5ECvatxu
         gk/gmgPLXCmK2Hv1skz8LKErbozyin7gsQ/JObHHqp33outLNPkb22fBNUnBBOLOYrH8
         poHYpG56IDicfCgPG7hdUqAvO93HJLiiz5ovlALmXF5tUdp/rZZ9TREaOQXKFKDZSwOu
         YpFQU+6S3ZWgSvx1HNRvlNmLa2qnNh2oZp7GiNFE0AgvHFIzBXHj498Y6xt+24XdRhc3
         0fOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJvXYBJW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135si5758114ybc.58.2022.01.10.13.36.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jan 2022 13:36:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJvXYBJW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n72LU-0007Wp-Ou
	for alex.bennee@linaro.org; Mon, 10 Jan 2022 16:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n726C-0005qw-5e
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:21:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7269-0006vm-BR
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641849660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Q7Kpur1KSgTZQSYvZxdZr1XOr4nijd7s9YR7ZVgDyM=;
 b=MJvXYBJWeiyph/fI3EuHK098hyF0DxlGt8/JttJikFoqtTygLsje1s9LEOSwwe0sVPp5xR
 G7r6K9fQWeBlZAMBdRfJKF8NoEOb7Fm56z93tW9bU37oqaWRXEwWjC1QK6RerBT5/EhGHo
 gETibH0qL9Nh8j22pV/BvH/JScJu41Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-IH3Rbw6bOBaE5mp6QfAEGw-1; Mon, 10 Jan 2022 16:20:52 -0500
X-MC-Unique: IH3Rbw6bOBaE5mp6QfAEGw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B508100C660;
 Mon, 10 Jan 2022 21:20:51 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 079CB19811;
 Mon, 10 Jan 2022 21:20:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
Subject: [PATCH 5/6] tests/qtest/vhost-user-blk-test: Factorize vq setup code
Date: Mon, 10 Jan 2022 22:19:14 +0100
Message-Id: <20220110211915.2749082-6-eric.auger@redhat.com>
In-Reply-To: <20220110211915.2749082-1-eric.auger@redhat.com>
References: <20220110211915.2749082-1-eric.auger@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: USRsyWqsx+UD

The vq setup code is repeated several times and can be
easily factorized.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 33 +++++++++++++++----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 2024aa5923e..236af80e4ad 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -211,6 +211,19 @@ static void test_invalid_discard_write_zeroes(QVirtioDevice *dev,
     guest_free(alloc, req_addr);
 }
 
+static QVirtQueue *setup_vq(QVirtioDevice *dev, QGuestAllocator *alloc)
+{
+    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
+    QVirtQueue *vq;
+
+    qpci_msix_enable(vpcidev->pdev);
+    qvirtio_pci_set_msix_configuration_vector(vpcidev, alloc, 0);
+
+    vq = qvirtqueue_setup(dev, alloc, 0);
+    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, alloc, 1);
+    return vq;
+}
+
 /* Returns the request virtqueue so the caller can perform further tests */
 static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
 {
@@ -223,10 +236,6 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
     char *data;
     QTestState *qts = global_qtest;
     QVirtQueue *vq;
-    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
-
-    qpci_msix_enable(vpcidev->pdev);
-    qvirtio_pci_set_msix_configuration_vector(vpcidev, alloc, 0);
 
     features = qvirtio_get_features(dev);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
@@ -238,8 +247,7 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
     capacity = qvirtio_config_readq(dev, 0);
     g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
 
-    vq = qvirtqueue_setup(dev, alloc, 0);
-    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, alloc, 1);
+    vq = setup_vq(dev, alloc);
 
     qvirtio_set_driver_ok(dev);
 
@@ -474,10 +482,6 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
     uint8_t status;
     char *data;
     QTestState *qts = global_qtest;
-    QVirtioPCIDevice *vpcidev = container_of(dev, QVirtioPCIDevice, vdev);
-
-    qpci_msix_enable(vpcidev->pdev);
-    qvirtio_pci_set_msix_configuration_vector(vpcidev, t_alloc, 0);
 
     features = qvirtio_get_features(dev);
     g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
@@ -489,8 +493,7 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
     capacity = qvirtio_config_readq(dev, 0);
     g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
 
-    vq = qvirtqueue_setup(dev, t_alloc, 0);
-    qvirtqueue_pci_msix_setup(vpcidev, (QVirtQueuePCI *)vq, t_alloc, 1);
+    vq = setup_vq(dev, t_alloc);
 
     qvirtio_set_driver_ok(dev);
 
@@ -576,9 +579,6 @@ static void idx(void *obj, void *u_data, QGuestAllocator *t_alloc)
         return;
     }
 
-    qpci_msix_enable(pdev->pdev);
-    qvirtio_pci_set_msix_configuration_vector(pdev, t_alloc, 0);
-
     features = qvirtio_get_features(dev);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
                             (1u << VIRTIO_RING_F_INDIRECT_DESC) |
@@ -589,8 +589,7 @@ static void idx(void *obj, void *u_data, QGuestAllocator *t_alloc)
     capacity = qvirtio_config_readq(dev, 0);
     g_assert_cmpint(capacity, ==, TEST_IMAGE_SIZE / 512);
 
-    vq = qvirtqueue_setup(dev, t_alloc, 0);
-    qvirtqueue_pci_msix_setup(pdev, (QVirtQueuePCI *)vq, t_alloc, 1);
+    vq = setup_vq(dev, t_alloc);
 
     qvirtio_set_driver_ok(dev);
 
-- 
2.26.3

