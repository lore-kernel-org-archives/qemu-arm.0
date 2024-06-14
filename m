Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp149530ejb;
        Fri, 14 Jun 2024 02:55:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPQ7oW+CesD7RyQErJM2fFo4YZeqzrYaNchrgSDZCDpNHEtHt8Z1soqoBdAtl9sZ602hrH6awnuH5oSog2tKCJuID65/4k
X-Google-Smtp-Source: AGHT+IGdaYIsT6a2/QALEMrhV/8zLBGP7E0FoCMwEmXzHwZ6NVedfqjVJCUG1FGeK84ZQdIP6NJI
X-Received: by 2002:a05:620a:394f:b0:795:4fee:81aa with SMTP id af79cd13be357-798d242b402mr229224885a.33.1718358932783;
        Fri, 14 Jun 2024 02:55:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718358932; cv=none;
        d=google.com; s=arc-20160816;
        b=i149dpPPUwtLVdSrJJ8iaVFtbdUUW7z0euukXNtVLKAOOwrdBHC1Uld56+OeO2KNK3
         Q8zAdTMqO/qf2bNp3sk+duBh/ch+tnKP6AUWdy2P392J1kRHfEd6vnDAtfuRHP8RIT4h
         FAqNIFiN1cFP1yQVWXD9leIoER8EZUS+d7o9ghjVrm/8/RqlblxRnVQwGAhBggYNfN+B
         YEORASFX872ryML4nLQFRWSeEIGNEtrwTW7UJdnk2TyqWrf7X5/1ZZh/q0scd7WLqrAT
         jOXz+seD4Uamjiz3Z4pjyf1OrzfIYxWICiGS4DtkfnGHOS2qI/jEmxTExKhQUJF3jWWn
         G8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VJxQB3J/KK3J2NcdJlm9ObpzgS8HDFxzvPOt034qunE=;
        fh=NBkbC8z0yxZVnBu5+T/osSPCS2NzeZu/yHpj5pv7NrY=;
        b=pECewQg5Z4AeCEAxYDZNyBaolvK0ZKvYErPFy0vqwYaCfS21QOhQ7Ffb/01Om6YZqd
         rRZbCnacq9PnbwwFJAYnMKvlqqe4d9Jkpypb0K5/MPDQOEYTUJaKsK80tyJ/nMQotTfE
         zsdOn9033fEyqCLrKrOqITtQb0bwsFXCDSpaNLd0xzgR9yn5OpBSTxMf83hrRY80yGG/
         aZj+WA9pYLHqgrKnxxo/k33SlxvUHkm0lTknIcVA7oroh+CIsQdlS65KE3hNfKXPSUtb
         OmfmcH4jXq8iJwlKYWV0XLYbPMV7gUB1tDaUum5rJ/+1+u6tMtCL54VREEMJ9yaVeG2l
         tb3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a+Vwp8/s";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abd1754bsi329120885a.492.2024.06.14.02.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 02:55:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a+Vwp8/s";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sI3e4-0006LA-Sp; Fri, 14 Jun 2024 05:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI3e4-0006Kw-9k
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 05:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI3e2-0003h7-VH
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 05:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718358894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJxQB3J/KK3J2NcdJlm9ObpzgS8HDFxzvPOt034qunE=;
 b=a+Vwp8/s74U0bsAoOL2Mev0aJrBowWONvJ7wP1GKqVeFqOBZYiWwj88lGJFMYdmIto+TNB
 NwDh9/fwGLBXvrDYkxlq3T/OARBmVYv4WZpVjabToTpfl+uYu1Db8UAeqjO+zVMVJASex4
 Gx0kAAAkN2mT5AQut+QFUg9pSKGV0Aw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-8rGDq9O5O06-q1ERIpOezQ-1; Fri,
 14 Jun 2024 05:54:50 -0400
X-MC-Unique: 8rGDq9O5O06-q1ERIpOezQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A352F1956089; Fri, 14 Jun 2024 09:54:49 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 292AD3000219; Fri, 14 Jun 2024 09:54:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v4 7/8] hw/vfio: Remove memory_region_iommu_set_iova_ranges()
 call
Date: Fri, 14 Jun 2024 11:52:57 +0200
Message-ID: <20240614095402.904691-8-eric.auger@redhat.com>
In-Reply-To: <20240614095402.904691-1-eric.auger@redhat.com>
References: <20240614095402.904691-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: +BC3swoPbGsI

As we have just removed the only implementation of
iommu_set_iova_ranges IOMMU MR callback in the virtio-iommu,
let's remove the call to the memory wrapper. Usable IOVA ranges
are now conveyed through the PCIIOMMUOps in VFIO-PCI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/vfio/common.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f20a7b5bba..9e4c0cc95f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -630,16 +630,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
             goto fail;
         }
 
-        if (bcontainer->iova_ranges) {
-            ret = memory_region_iommu_set_iova_ranges(giommu->iommu_mr,
-                                                      bcontainer->iova_ranges,
-                                                      &err);
-            if (ret) {
-                g_free(giommu);
-                goto fail;
-            }
-        }
-
         ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
                                                     &err);
         if (ret) {
-- 
2.41.0

