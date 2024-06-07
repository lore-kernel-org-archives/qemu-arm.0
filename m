Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp1234762ejf;
        Fri, 7 Jun 2024 16:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV9kJIbIonBMvKITuzEXGSpQeFr+OR+T18dtofm7aXPnzVSl7vUP+SVqPheXNVVbftlvT0/o/VsrTjHYgy7ytLsUf6B7tvL
X-Google-Smtp-Source: AGHT+IGs/3C4GVHstvxBX5ylpsgw3csNtrvhiFWewiwNE+Vh+nA9IMulwglxa+XWqBZ95Kr1kz7u
X-Received: by 2002:a05:6808:1901:b0:3d2:1b8a:be4b with SMTP id 5614622812f47-3d21b8ac114mr1382468b6e.46.1717802126406;
        Fri, 07 Jun 2024 16:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717802126; cv=none;
        d=google.com; s=arc-20160816;
        b=eX22pxGxicfvSYqgUCiRnoUB5qUcTo3eDFJbLydmivJ1HFDENO+hn4NrL9eH6RP/P9
         wwPboIXZKGIfi7zwkJzUL8pqyAUxx6Lsq6NE7jdX6HPYiU/VHC43Hf7ajp5AuTNu5qsR
         CtC7rATqySpUcpQt3AnqERF0f6+oi/ItZQoYETyhknK8rm3hZcBrY2hj+go1EblohHzO
         Zw9ZtRCEQVBCldiJbbNLD5F6d+qp7KRzetlFKbaqnjb3Myk+5tp8PQDdFTEQzkQj4aUF
         dwMg4HNy2NVRC1UZebowFNSkZDCaf5MQ+mLVyIMak1/KH1gCiWGOiThQjhgsCfVQ7M+M
         e8AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8m2kYAzpkGJ3Ey1H6NVbak4uUSK3PzHJop1nhkRKo+c=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=wI1qUMjazJhzrqMDRXSEs+NmKnU3y1AQdwqFIJwuU0dXWjYVmXlzlZyGX6s1EUUbFI
         oHQywZaArCJM8YXCRUWSOzTfGCgOlUjG/AuBx5BAcDQHl/sb+zR7JTHvk19VaKko+NrP
         g4IvaEMiHB7wn3iFigcAK0t1PaAroNxoyiK7tnrQFXRJYIGwZlle4ALL3UNVvCs7ItZW
         72/4TGVnZ+mA864a+xhEYR2D8eFg/aBrLkLj/6pzUWldpxjeqVArsYh73jxuvZvi65cf
         TeZ3FoWQUAL9rlwZ6mZJotgs2m19nwLJapfX7R5Kjuy7FG3JFja6uXuPOylM3g3rEHf4
         Rt3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AyYzPR0L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b067958f14si8038056d6.258.2024.06.07.16.15.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 16:15:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AyYzPR0L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sFakc-00054p-1y; Fri, 07 Jun 2024 10:39:30 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFaka-0004rC-0L
 for qemu-devel@nongnu.org; Fri, 07 Jun 2024 10:39:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFakY-0003MS-J8
 for qemu-devel@nongnu.org; Fri, 07 Jun 2024 10:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717771166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8m2kYAzpkGJ3Ey1H6NVbak4uUSK3PzHJop1nhkRKo+c=;
 b=AyYzPR0L5hvqIZhIks6ViO8YA10LmppVikCkiqfblIxRHBLkvJokbhlOynoL5zN6WQNU7z
 MpzySzJPH2Yp7RpPGFLwv0aY1AP1dHWxoPtVRH7rGs5g1cHN/S4+mrgPVFTadkFR8AxYuN
 Ld8i7jUfqjgjKffkM63fIzt7Gq92smY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-jz2ezpk1MUmu6D9BnI5Uxw-1; Fri,
 07 Jun 2024 10:39:22 -0400
X-MC-Unique: jz2ezpk1MUmu6D9BnI5Uxw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D1EC1956063; Fri,  7 Jun 2024 14:39:21 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 481B61956048; Fri,  7 Jun 2024 14:39:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [RFC v2 1/7] HostIOMMUDevice: Store the VFIO/VDPA agent
Date: Fri,  7 Jun 2024 16:37:21 +0200
Message-ID: <20240607143905.765133-2-eric.auger@redhat.com>
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
X-TUID: vN02YdRv7D5k

Store the agent device (VFIO or VDPA) in the host IOMMU device.
This will allow easy access to some of its resources.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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

