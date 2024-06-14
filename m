Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp149294ejb;
        Fri, 14 Jun 2024 02:55:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPcOGltDGpnTSz4Vksh0WDHCP+fKpkr2cy1KqTOolmstEKFfYBRvmMCbHkEnm+WXt4iTI7VEXO6ejY91/BtAA2fu3EzWZs
X-Google-Smtp-Source: AGHT+IH6WnssVKv+zJMa9irx2H4U2G6q7npCZtv8BIR2+Fb+F8TgPiGXvRepx2Rh5t2Nnf8dAwY2
X-Received: by 2002:ac8:5a56:0:b0:441:2b3:595c with SMTP id d75a77b69052e-442168b02a1mr24789141cf.30.1718358900464;
        Fri, 14 Jun 2024 02:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718358900; cv=none;
        d=google.com; s=arc-20160816;
        b=aTyFc3d5EvATIyb65iz0gd8ZgJcwL6qdJ7rgT0qveUjRSo231cb4Fbn0YePH0CfQXH
         /7Ybbo/NjMPf5VzbZ4pWauA25BQUp470bVtVaZMqQTLQXXoObQp9IaD5ivvb2ibXEax0
         wGmpYmuW04zwWnR2qTUwsflwEpyHw3yRR9RECbsJbwANp6ake8q/PifWgplLxFwnxk5n
         34KnU6NJcdBB1WT2UK9e4UfYxADmqgnoyUZL2SINn+pwTiQAof08lluGSpw7FkCOQWKy
         785fiaXiEiZIdAGfNv9sDxKZ0gV3yDD1pmZEJ8Ejb3u6NM86dNdr+xFupejQ33063evE
         DQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b468c27YIaodWhCUoR2euqW9Eev+chYW0+hCXZU8pBE=;
        fh=NBkbC8z0yxZVnBu5+T/osSPCS2NzeZu/yHpj5pv7NrY=;
        b=o37S/i4K0fIcVCWTwT7sfoRGx/MOcqOPLjBU3m3Ws2T+5P+1fi1J/2MfVWa61ZxOBW
         zfJ/Modu/bGZJJa3x5JOswp8uA9GBja1NCB/LwcAVkDAyDp5UQjj7jisWGyhJAdo4Zpw
         +Cl+a55hLo4Q08wwhoCJpCNYUygh5Wdzn72w413m0NKoMn9NEWKCr0+Peq+hmAPQMRsu
         VBpPDhb1Dudj2sbsGV6SiC1P3ffx7Fu36kIB9dE+5Jas6sqVlALaNmzo8NsnzA4iu1k1
         8Zu/nres0L3T1ZaDMPCmn31fh/1bvohB+G7VRA6HOE4F7v0dH/ZrWre1o/XCk3K3Jqb+
         V2yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F9Pkn5Aw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f30f8b18si38064651cf.702.2024.06.14.02.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 02:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F9Pkn5Aw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sI3df-0006Ar-1T; Fri, 14 Jun 2024 05:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI3dd-00069w-0M
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 05:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI3da-0003Vn-4K
 for qemu-devel@nongnu.org; Fri, 14 Jun 2024 05:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718358865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b468c27YIaodWhCUoR2euqW9Eev+chYW0+hCXZU8pBE=;
 b=F9Pkn5AwbuilwVVqgR8T5iB8f3hyzCLeEdTJ89yIHCVFwI8nHJHcQNBZgvG26mgK546hdL
 EKU2fERuOrLEVVc70vlL5Neffdm8U/CaihxGVETNU04BTItz+zFcNwTJPeDoJR6cY5dFe7
 IYWA1PlsQ9WzEKCKO9i4oVLwDUoBj8g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-Wem5vcc-MSSzI1p_gLSWkA-1; Fri,
 14 Jun 2024 05:54:19 -0400
X-MC-Unique: Wem5vcc-MSSzI1p_gLSWkA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AF09A195608C; Fri, 14 Jun 2024 09:54:18 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2E871300021A; Fri, 14 Jun 2024 09:54:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v4 1/8] HostIOMMUDevice: Store the VFIO/VDPA agent
Date: Fri, 14 Jun 2024 11:52:51 +0200
Message-ID: <20240614095402.904691-2-eric.auger@redhat.com>
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
X-TUID: SoYAps7DNgL6

Store the agent device (VFIO or VDPA) in the host IOMMU device.
This will allow easy access to some of its resources.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 include/sysemu/host_iommu_device.h | 1 +
 hw/vfio/container.c                | 1 +
 hw/vfio/iommufd.c                  | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/include/sysemu/host_iommu_device.h b/include/sysemu/host_iommu_device.h
index a57873958b..3e5f058e7b 100644
--- a/include/sysemu/host_iommu_device.h
+++ b/include/sysemu/host_iommu_device.h
@@ -34,6 +34,7 @@ struct HostIOMMUDevice {
     Object parent_obj;
 
     char *name;
+    void *agent; /* pointer to agent device, ie. VFIO or VDPA device */
     HostIOMMUDeviceCaps caps;
 };
 
diff --git a/hw/vfio/container.c b/hw/vfio/container.c
index 26e6f7fb4f..b728b978a2 100644
--- a/hw/vfio/container.c
+++ b/hw/vfio/container.c
@@ -1145,6 +1145,7 @@ static bool hiod_legacy_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
 
     hiod->name = g_strdup(vdev->name);
     hiod->caps.aw_bits = vfio_device_get_aw_bits(vdev);
+    hiod->agent = opaque;
 
     return true;
 }
diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
index 409ed3dcc9..dbdae1adbb 100644
--- a/hw/vfio/iommufd.c
+++ b/hw/vfio/iommufd.c
@@ -631,6 +631,8 @@ static bool hiod_iommufd_vfio_realize(HostIOMMUDevice *hiod, void *opaque,
         struct iommu_hw_info_vtd vtd;
     } data;
 
+    hiod->agent = opaque;
+
     if (!iommufd_backend_get_device_info(vdev->iommufd, vdev->devid,
                                          &type, &data, sizeof(data), errp)) {
         return false;
-- 
2.41.0

