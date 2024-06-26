Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp879782njc;
        Wed, 26 Jun 2024 01:28:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOaoYB/Li+AbV5vczTSd8DKN2n2O+KKFKCg1sbL1NkXE5Yu8RHJhKG9UzGDY/4jePXeAiMod6XdS9k2k/Q6cwQ6CDuMFcN
X-Google-Smtp-Source: AGHT+IENFa9yHbZ3L3mNKOf0/ED/kVS/+ShEH7cnEZjnn4xejUWEsUs9qr6N+Zhl3/RuHyzio2da
X-Received: by 2002:a05:6830:1658:b0:700:c083:ba7b with SMTP id 46e09a7af769-700c083bcbemr6376127a34.16.1719390490704;
        Wed, 26 Jun 2024 01:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719390490; cv=none;
        d=google.com; s=arc-20160816;
        b=Q9HiX9isQcLvhaNofQxn/jPjRnXdnwDWQmX/qdMILTyvHvtdAKXLIWvNhtY5ZcFOeI
         PlMtMETMLglr5hC7yR1cq0uimxX5nebk4WFsrmnROuYnUnCz4Ehl+yrbaUNXI/l3MX5X
         9cwViVaV7dXjjDS+6ZaHGqBCs7qVYY6qVR9+UmYHXissQnxb9a0Gza8gBtjeTK3bNIoO
         XZbDwxpwfXi3GG88zdY0zKd49hG6zu+PrFqFI28wu6fdKOqn1rDBoAlN/98xRb3zeqw3
         p5/EyiTnh05ZnPm/WYA2Gvo4/LfXbKN8iPai9WKaLivRs/g0iAZwutUixiGdNbhdbAcZ
         TofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IIj8ad/t6QF6I2S65p7DeU6tGtDq1WeGUySH+lTT+ZI=;
        fh=7BmF12x8JIX7i2ysPViD3oS3tFYG9mZ+u60lEXguOKc=;
        b=PjnC2Y60Mwuk+N2leM67C3BsSXSt1YZdvDEGzBHJg+3mR9nzlK1D5jcV9VNavtsbD7
         LUsdDcE8YkcLnXYpQEfqNB9Ow0kNYkalHB12zQgcGs9Ygfa30qV8mE7WwJGrrq79kZMF
         4BYmclVTzk6mi8cARvq3O9OtI1yVBN3MW+7yaehnjr4DGrRs5o8S1bkU7Ggd88vELKgL
         SHH8Jn8u0J59cECwiVpqQqtRr/aGtkzZarF+4CNumADMffi5juw7+pAhFj0OI8Cr9k+z
         mm9WtwkzH/jMKmMq0zubaGkX8LC9PVmKdT27MgXxAwc3AB5aLVQW/0h45dMb2G0ze2Sj
         ovmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KamOyirX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce9424e2si1240876385a.649.2024.06.26.01.28.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 01:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KamOyirX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMO0O-0006vD-H7; Wed, 26 Jun 2024 04:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0M-0006tv-DM
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:27:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0K-00077u-9F
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:27:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719390467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIj8ad/t6QF6I2S65p7DeU6tGtDq1WeGUySH+lTT+ZI=;
 b=KamOyirXmuH8UQKpa5lvFAQMlutaRtkpM8ahm77oOYZ01/uR98/cfdykUPGSr9+E/SzOwf
 p884L5ENbGQmp8VyST8CvowD1HCfHy8k5poZWyZccwEAKdubb7mL3pcfYOZn/IW80H5aCJ
 1dSBD3cu6SSWhRVT4Aeub0uB2WTK53w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-355-eqvEHFaBPu6SvVecpm19uQ-1; Wed,
 26 Jun 2024 04:27:43 -0400
X-MC-Unique: eqvEHFaBPu6SvVecpm19uQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 185CD1956089; Wed, 26 Jun 2024 08:27:42 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7240E1955E82; Wed, 26 Jun 2024 08:27:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: [PATCH 1/7] virtio-iommu: Fix error handling in
 virtio_iommu_set_host_iova_ranges()
Date: Wed, 26 Jun 2024 10:26:46 +0200
Message-ID: <20240626082727.1278530-2-eric.auger@redhat.com>
In-Reply-To: <20240626082727.1278530-1-eric.auger@redhat.com>
References: <20240626082727.1278530-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: oVCQ/iejppVJ

In case no IOMMUPciBus/IOMMUDevice are found we need to properly
set the error handle and return.

Fixes : Coverity CID 1549006
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes: cf2647a76e ("virtio-iommu: Compute host reserved regions")
---
 hw/virtio/virtio-iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index b9a7ddcd14..b708fb96fd 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -543,10 +543,15 @@ static int virtio_iommu_set_host_iova_ranges(VirtIOIOMMU *s, PCIBus *bus,
     int ret = -EINVAL;
 
     if (!sbus) {
-        error_report("%s no sbus", __func__);
+        error_setg(errp, "%s: no IOMMUPciBus found!", __func__);
+        return ret;
     }
 
     sdev = sbus->pbdev[devfn];
+    if (!sdev) {
+        error_setg(errp, "%s: no IOMMUDevice found!", __func__);
+        return ret;
+    }
 
     current_ranges = sdev->host_resv_ranges;
 
-- 
2.41.0

