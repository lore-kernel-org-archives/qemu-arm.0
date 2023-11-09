Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp620567ejq;
        Thu, 9 Nov 2023 09:07:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYmi2ezdZ33qfzJWGma+R5rUArybVf61sDK5hyXBCqT9I1mIfGImeL+moukP1fU5D3K39H
X-Received: by 2002:a05:620a:6541:b0:76f:1268:9e26 with SMTP id qc1-20020a05620a654100b0076f12689e26mr4044950qkn.24.1699549667682;
        Thu, 09 Nov 2023 09:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699549667; cv=none;
        d=google.com; s=arc-20160816;
        b=vfRbjNsPn57xVcWvu2ey0o4zzdASVqExUxtdkW1/EN3dIAcAvul7Bs2zAB7rSsfj1I
         wYu0WJLzgPYc7dN+9m2e93deCAUmIbMk/xCSuw5MgYmnJ7EigZq1BmzIZod6fP7UPpLE
         +S3pUE7BY5FWBQ2io7zxvKd+dE1h/9PehNERjW2TiyDXP4UsB9EA24QF7LRBXIyAS0QT
         ABx4ptAwuwkhuPHrgsDjyIGa/SDABsEHITIO755td9AE+fsPSlJursTelBi7lJj9Za/9
         TjKupp+cMOkJc36qv/Xi+v1E2Ix0i4Vp9PzWbNgY5fjJhjKuYKfT1M0GdoLmZIW4JFKF
         7bXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2g173LzwlNG1UZ2ytVKC6y+FtXCeB8wlX3gt4AG2AAo=;
        fh=o9D/RsuucffVLqBPhzCLnd0bXUqN7a+AOvWzkBJaMwY=;
        b=GWAwUqH5pmNYILR2QSwfNNdBzt314y0HtkbeccZDGXJ480kqnZHOauFY6bu9V+iDCu
         s/nLPvltYtJ9MTYNdWh6FAnGcgrbuDAL3wOM+QyZQJpnwoQZFiKnpftRx80aRgWP6DG9
         aidAqF/27kfGXNR6tA+nfi72ewIXbDAR1Jtf+EYWroVTHpMHqjgY5GhAD7JxNjNasvo4
         GQLc0KLd8S4UNSAJwgRtCgnM7+VMlVyehrIDMagggg4YPk1zFfZ9x/NZzThnaVH5uBWe
         gxIFHNjDXh0wdvTjWlKxFsq0n0UJ7p2g5eZRp+vjYefjiNpqDI2qDRtS5WhcgAS4xEiw
         BWvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HTSSvnls;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn3-20020a05620a2ac300b0076da5b428c1si3075696qkb.785.2023.11.09.09.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Nov 2023 09:07:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HTSSvnls;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r18V6-000812-JB; Thu, 09 Nov 2023 12:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1r18V4-00080E-Bv
 for qemu-devel@nongnu.org; Thu, 09 Nov 2023 12:07:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1r18V3-0005yA-0J
 for qemu-devel@nongnu.org; Thu, 09 Nov 2023 12:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699549643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2g173LzwlNG1UZ2ytVKC6y+FtXCeB8wlX3gt4AG2AAo=;
 b=HTSSvnlsSVOtbtDZCFcc2W0cx3r9EuPTpEZXP//qtKlDUKFzJZrz1RexupSfoLRIkqu/lu
 b8uwY9HjdLDh3zhk7neyMn3O69UZIIcLv3T7Pl1twZUx1IcmhUdNeCnfuH1JIqvCKNr4/z
 zx92vvAjjulTzZHXxTsYO0j4055AV4g=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-DMwr-JpvOumr2uwz603DoQ-1; Thu,
 09 Nov 2023 12:07:20 -0500
X-MC-Unique: DMwr-JpvOumr2uwz603DoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3DE13816B4E;
 Thu,  9 Nov 2023 17:07:19 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3AD8C1290F;
 Thu,  9 Nov 2023 17:07:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Cc: clg@redhat.com, mst@redhat.com, yanghliu@redhat.com,
 alex.williamson@redhat.com
Subject: [PATCH] virtio-iommu: Remove useless !sdev check in
 virtio_iommu_probe()
Date: Thu,  9 Nov 2023 18:07:15 +0100
Message-ID: <20231109170715.259520-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: e/UcJtlc61Q4

The code already checks iommu_mr is not NULL so there is no
need to check container_of() is not NULL. Remove the check.

Fixes: CID 1523901
Fixes: 09b4c3d6a2 ("virtio-iommu: Record whether a probe request has
been issued")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Coverity (CID 1523901)
---
 hw/virtio/virtio-iommu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 89fb5767d1..9d463efc52 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -698,9 +698,6 @@ static int virtio_iommu_probe(VirtIOIOMMU *s,
     }
 
     sdev = container_of(iommu_mr, IOMMUDevice, iommu_mr);
-    if (!sdev) {
-        return -EINVAL;
-    }
 
     count = virtio_iommu_fill_resv_mem_prop(sdev, ep_id, buf, free);
     if (count < 0) {
-- 
2.41.0

