Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp1224311ejf;
        Fri, 7 Jun 2024 15:46:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaAsUEy+5VFl6PhyOVRfEIHLxFU5Vg0FLtPhWcUiI3VqjsgVCqbwVBCrNrrc1cm/USC9ScwHc7qqu/RLZqyln47I4011O6
X-Google-Smtp-Source: AGHT+IHomz96g3BHMuaoU1TcoVYVk/5wCTQ0jW8sm+Hom5RXIg+QQTMcKR/Y1v/qn1nDHLdSAkH0
X-Received: by 2002:a05:6214:5c01:b0:6ae:116b:ef71 with SMTP id 6a1803df08f44-6b059bc7f92mr47819096d6.35.1717800405121;
        Fri, 07 Jun 2024 15:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717800405; cv=none;
        d=google.com; s=arc-20160816;
        b=fF08WrVnC5uZS+VUphD7Kt7rrkcFnf77/Zd0DG/hpNJRWglPnG6/y23crU0QFpggAB
         lQFd0F0GFIlUK/eR1WcymHB6ql1R4TVH9oN268k6nYPCY/LcuK72s+3+tI7HbNiLcT9+
         SdgPD/XUO65Rq6qZK+wYZGhwOhRkZwF/MyL3cGspfLMHUBUNbVGvlDdVpcROIBob4FP8
         3Ko6sEjAVUjv8XcDSGv2T4qpuJMnexwEr5/JF2SoAoUBtP/lmij/TWxjNNELIuSeEmlP
         p18sLn6QNhRJQrUBXSXQ4DQMT9/WSeyyZoojfFEMnOnWV/s6ifQhmOAZIpMQM7BU3XEY
         u5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZuVDDqob31KAlDwmKxXvSjL1dLO0Pn1dcxk60z/nri8=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=gQPvmWGcYACplehRsXPyyEyR+ig8uAtPp3O5ycZAuTApX5tlmaYIapbCa9eJrH9UDi
         gbXtE5wP4qihZibgB/t8j95eeB4w5s3mBUXDD/kk08uUlVUIWv/yMjz+ksTFSXNoGGn6
         H9jQYcWdsWH7/JI/FH5uAvSR0OQeTSWUXxgqwujc+9Se0vSGP1hWx2daNCbWPDvrVVQp
         2Scqwqk0T1h/duYN2Cr4z+/M3Tmazd6JBx33uTLG9gT4C2hyyfOaFYkDTGO7DFowaNQ/
         oZHOOVHpq7YX+ONtEmgNMypW5bNmD6OfcsV7efh4rV3JTH1DdDqVQvAPg6wtgpc7kvZ5
         e+8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HFyofKnD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b04f9951b4si52527556d6.317.2024.06.07.15.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 15:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HFyofKnD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sFal4-0006uP-Iu; Fri, 07 Jun 2024 10:39:58 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFal3-0006rm-6V
 for qemu-devel@nongnu.org; Fri, 07 Jun 2024 10:39:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFal1-0003Q1-Om
 for qemu-devel@nongnu.org; Fri, 07 Jun 2024 10:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717771195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuVDDqob31KAlDwmKxXvSjL1dLO0Pn1dcxk60z/nri8=;
 b=HFyofKnDOd62bIJdUfwY4v/KbbdFkX+DfdsRPVdkZzopVCS4brrv4yE2i/B9GS92zRK/ad
 6aYU1F/8R6bQomwuv1ModdtY7xl+e07rhsMdaVLfzuYfXyxRkrFHkSTBWE7gSxdY6xaypv
 iJa/xrVuzkd1IBf2I1cFPyPUFPcG1vI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-312-WwWYGm_qMmqjPTaKL60Qeg-1; Fri,
 07 Jun 2024 10:39:51 -0400
X-MC-Unique: WwWYGm_qMmqjPTaKL60Qeg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6502819560B4; Fri,  7 Jun 2024 14:39:50 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C48731956048; Fri,  7 Jun 2024 14:39:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [RFC v2 6/7] hw/vfio: Remove memory_region_iommu_set_iova_ranges()
 call
Date: Fri,  7 Jun 2024 16:37:26 +0200
Message-ID: <20240607143905.765133-7-eric.auger@redhat.com>
In-Reply-To: <20240607143905.765133-1-eric.auger@redhat.com>
References: <20240607143905.765133-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: lJYGynuCGpcX

As we have just removed the only implementation of
iommu_set_iova_ranges IOMMU MR callback in the virtio-iommu,
let's remove the call to the memory wrapper. Usable IOVA ranges
are now conveyed through the PCIIOMMUOps in VFIO-PCI.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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

