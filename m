Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2830886ejy;
        Tue, 4 Jul 2023 04:15:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHNnWnbXenkDnZRkUb+BljEkA5Y0iiuoyQ0TiMNdlXk794Y2gU7FKRpnPN5j2kVniVFX4fp
X-Received: by 2002:a25:4d07:0:b0:be5:fa6b:1fcd with SMTP id a7-20020a254d07000000b00be5fa6b1fcdmr9360957ybb.30.1688469349005;
        Tue, 04 Jul 2023 04:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688469348; cv=none;
        d=google.com; s=arc-20160816;
        b=xR4gI4DxSh+rAvvYF4FKwmfTIMxbDp+ASxGkTb0BqgwevhqlJ3EweVmYyTbw/P3Uxh
         UdCmaopcEpcMMCPeO91Gw/v1UQrYKshMdqf48srMraAEhfuOT/0p8XpJTO9BX0q5eFHu
         hYo3X6uXiDDgl5gfxKgBVYfTWRPmvVHVqA7W6ru+OJB311W3CEm+nrRlXvuJNiD2/8Rl
         WW6dZjUk62GMSZGRozjZJ5hSOAFXqvDGILYfbdQhVafrMl/iPqhULG6kptuIg6m0bbMg
         4qZmRbZFWbdExxWapZ39q4s78SU71y28y5X+z5w6W5Zo75HsnRMn7y7j65rad8VjUkqH
         jdQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tX8ZFcsG9GHyEa+T27aCsGLNRIQ+UJHZ6kjlwaE8ezo=;
        fh=/Dl/NeO9VSZBx/GyE3TzFvtr0pKsNgGxJD1Ef3YG7Zg=;
        b=NT5SGAHpQyFcvK4wkA20ipIcIZrdKRptbm8QGDqg6vkBDTuGUdwL6QA4P4GKzkysYj
         I08VU+D+VPZCn9vDdJpObrYypURriLWqW4n9Andu35aTJlYzg/dtDVQdpFS7ibvhLfFe
         tpdJu60kwKB8ARrMGM/79Q0w8pg+FfHE7NFTHsP0q+LpazuHnHbONb0059rA/k/ZNqCm
         T6jKEN208eg0U7AaI6RnjbWIXuVZ0FtWf9F7/JzX3r8N/ltLNV8sGblVVrlhANhABRfF
         6uJlk0FYRiQr5zp7c0zcQ+cAt6jSCLWxg5viqIc2G93hi7vFpa2YyvYz955tOpBQwMGE
         V2dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TkMS9QP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16-20020a05622a04d000b004034acc2d78si4955416qtx.314.2023.07.04.04.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 04:15:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TkMS9QP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGe0Y-0002hF-F6; Tue, 04 Jul 2023 07:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qGe0V-0002fu-Nf
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 07:15:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qGe0T-0007xX-2H
 for qemu-arm@nongnu.org; Tue, 04 Jul 2023 07:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688469339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tX8ZFcsG9GHyEa+T27aCsGLNRIQ+UJHZ6kjlwaE8ezo=;
 b=TkMS9QP1R+gUIhBLkS+T3TsFDI3zNfFALSc1AZbmlFvbDpIRADEPydA7rsq1LEyhHnMktJ
 Xn+h3n+kjzV2spEkHnFCaXdtSr5OoS4VvUYhTlrqW+Y2l68nl7SoP2cbAoLXWMi8j7n6J4
 GKaZ74LMSnRslx0R0mci9QBnC/nr8qw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-QlEtqMBFPfua95mp--Yo2A-1; Tue, 04 Jul 2023 07:15:36 -0400
X-MC-Unique: QlEtqMBFPfua95mp--Yo2A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D2383C11C71;
 Tue,  4 Jul 2023 11:15:35 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24F8D492C13;
 Tue,  4 Jul 2023 11:15:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, clg@redhap.com, bharat.bhushan@nxp.com,
 peter.maydell@linaro.org
Subject: [PATCH 0/2] VIRTIO-IOMMU/VFIO page size related fixes
Date: Tue,  4 Jul 2023 13:15:25 +0200
Message-Id: <20230704111527.3424992-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: uGHzb27J7r+n

When assigning a host device and protecting it with the virtio-iommu we may
end up with qemu crashing with

    qemu-kvm: virtio-iommu page mask 0xfffffffffffff000 is incompatible
    with mask 0x20010000
    qemu: hardware error: vfio: DMA mapping failed, unable to continue

This happens if the host features a 64kB page size and constraints
the physical IOMMU to use a 64kB page size. By default 4kB granule is used
by the qemu virtio-iommu device and this latter becomes aware of the 64kB
requirement too late, after the machine init, when the vfio device domain is
attached. virtio_iommu_set_page_size_mask() fails and this causes
vfio_listener_region_add() to end up with hw_error(). Currently the
granule is global to all domains.

To work around this issue, despite the IOMMU MR may be bypassed, we
transiently enable it on machine init done to get vfio_listener_region_add
and virtio_iommu_set_page_size_mask called ealier, before the domain
attach. That way the page size requirement can be taken into account
before the guest gets started.

Also get benefit of this series to do some cleanups in some traces
which may confuse the end user.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/virtio-iommu-page-size-v1

Eric Auger (2):
  virtio-iommu: Fix 64kB host page size VFIO device assignment
  virtio-iommu: Rework the trace in virtio_iommu_set_page_size_mask()

 include/hw/virtio/virtio-iommu.h |  2 ++
 hw/virtio/virtio-iommu.c         | 49 +++++++++++++++++++++++---------
 hw/virtio/trace-events           |  1 +
 3 files changed, 38 insertions(+), 14 deletions(-)

-- 
2.38.1

