Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp4223580eje;
        Fri, 14 Jul 2023 11:25:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHfcNe5RSYuIp20CxmS+1aEuI6RXM4AyXt9SjCj+3xiMtJfCYD1w/oCDTlZsrJGqONNLTVZ
X-Received: by 2002:a05:6870:b6a9:b0:1ba:4136:942 with SMTP id cy41-20020a056870b6a900b001ba41360942mr2585188oab.10.1689359122434;
        Fri, 14 Jul 2023 11:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689359122; cv=none;
        d=google.com; s=arc-20160816;
        b=fi1T6LudzE/q8XeLA8gTw82wK/AJtKy4CtYfESJwuW+eE2va96ez8uEPUlXXQ6w4hr
         uV77WZxmFn8Gw0hGAP7U4LJgcmUOiPXJOGLYr/s2VVde7RBJwTtTEbiGuftZKRcz4MF1
         3e61Xw/HAuS66UcnZSEB0sc6YVCw22YBm/b2IfBVZyLDNJbfFiZjmYnKsfgkk2W6KTA+
         SJt/bdeq9PxuITVPXhsnC2seDJaszC5oYgjoAH9lW6c7LJR+ob7oXgyRVrUPGCMm8L3Y
         EppR/Xnooas9Hi5Sly2eKZbL2bAft64/iQX7yuEoCcq3QT64VXce3Ls/86/VvSyBidOL
         mPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=T6MK5YzOYCNol9ozDKibgbWnFnHIfqfo9K9xoth9Ugw=;
        fh=EpjJ0MSS0T+uEHPamrlZK54B5mK0PZzFXGXVQytxkdM=;
        b=agpHR/SMqkNySN3x6/lB3C7BURcIh06Cexrou81ZiwIg2VKCC09t1s3/h9A4oImhuF
         oHNyAu12AXrxN3tocp2vacGsXMm0Ijh5VzHKwNRhjToleYv8Dsrbo3Ae9AsUZGkU+YkJ
         G93sHv1AGUX20Zv42AnW+DzslgO9mcyAioWvUe7lTurJZzlmnxCT47iyjynABCsmqXho
         L54ATBpD7FgP1IRV+F3KcaevHZGRa1u1lF10onvbhmPgWj+06Esl2KXKswex8esBbNOG
         20Mlegxhb35Orl5Cjm/YA0ShTrzlEAehHQnMs67hevQ5V6mkU+TmVhnEL7lWWjXwxsGK
         0q8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AmLNKzIL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21-20020ac87d15000000b004033ca9d122si4837937qtb.391.2023.07.14.11.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jul 2023 11:25:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AmLNKzIL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qKNTN-0007Kc-Co; Fri, 14 Jul 2023 14:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qKNTM-0007KH-18
 for qemu-devel@nongnu.org; Fri, 14 Jul 2023 14:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qKNTK-0008FH-IZ
 for qemu-devel@nongnu.org; Fri, 14 Jul 2023 14:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689359093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=T6MK5YzOYCNol9ozDKibgbWnFnHIfqfo9K9xoth9Ugw=;
 b=AmLNKzILAlL7sIq34FrjhzN4FWuvF1gq6YPlVnkzFAREy9jsh2PUnB7DHj405MoyonwuWt
 6Qc1ocdEYmiy2x8DOAnr5EJA7/8+L03xthLqUMonguEL3LPKwvs9LUeS58XsjzhfkgszIG
 O90WEmB5xJiP1/XdZgpexZwQFrMYXN8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-U47EfWqaOriHxzRXV0q_PA-1; Fri, 14 Jul 2023 14:24:51 -0400
X-MC-Unique: U47EfWqaOriHxzRXV0q_PA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B466B101A54E;
 Fri, 14 Jul 2023 18:24:49 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CFF7201EE6E;
 Fri, 14 Jul 2023 18:24:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] hw/virtio-iommu: Fix potential OOB access in
 virtio_iommu_handle_command()
Date: Fri, 14 Jul 2023 20:24:45 +0200
Message-Id: <20230714182445.877168-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UYcp/5so7iHX

In the virtio_iommu_handle_command() when a PROBE request is handled,
output_size takes a value greater than the tail size and on a subsequent
iteration we can get a stack out-of-band access. Initialize the
output_size on each iteration.

The issue was found with ASAN. Credits to:
Yiming Tao(Zhejiang University)
Gaoning Pan(Zhejiang University)

Fixes: 1733eebb9e7 ("virtio-iommu: Implement RESV_MEM probe request")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 hw/virtio/virtio-iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 201127c488..4dcf1d5c62 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -728,13 +728,15 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
     struct virtio_iommu_req_head head;
     struct virtio_iommu_req_tail tail = {};
-    size_t output_size = sizeof(tail), sz;
     VirtQueueElement *elem;
     unsigned int iov_cnt;
     struct iovec *iov;
     void *buf = NULL;
+    size_t sz;
 
     for (;;) {
+        size_t output_size = sizeof(tail);
+
         elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
         if (!elem) {
             return;
-- 
2.38.1

