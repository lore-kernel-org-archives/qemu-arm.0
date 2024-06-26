Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp879732njc;
        Wed, 26 Jun 2024 01:27:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpMS38vFXDYjZ6z0vH+qDtA5z4IyVGv9kQrXa3sOFhdgf51wPkkEnPEsLXaXQzD2kn6GhHCxxTWCslCFuwS1ypo2Vq/Tft
X-Google-Smtp-Source: AGHT+IHsR/y0cfcIBz9rSGwchXcQ7E+iKpr1ggCbF5prYXx9VBiZe27BXlpjLRPtHFEu7yErKrhH
X-Received: by 2002:a0c:f2c3:0:b0:6b0:938e:44e0 with SMTP id 6a1803df08f44-6b540ceceb0mr99234186d6.62.1719390475157;
        Wed, 26 Jun 2024 01:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719390475; cv=none;
        d=google.com; s=arc-20160816;
        b=RneNVCCPO7RC/CeHFX0O9cpmgrdQlMVWJmnuvkBR2fgjJrnxoeKSpobUqUi+LqH7WN
         IXqIX8gflKrIYErnKB4XVi/3u4OLqAQP3vVBhPsLv5K269Bqs6+XoSApVEeL0HY3oBvU
         nbmlayZ5DjPnOcs8SlYAZWqu1H4Xe71Ni8tbutO8tiqoeC8X8MlH7eGy1LBlHNSnrNdD
         +PSGcVWkZ7gIgEJUw3yH7drYqNXw/jyDiN3cEAiMJpKqak2Uhv8s93PG9Q31rI43Dl2k
         hrZnNRKMP1Cckve0N22YmDnifoMSRYQMpBu0UNwIoHhTGrx7OktL/bC0L7nMRpfanMPN
         cmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Z4TXulyFdXuDYnRFkMcuYu30552IRlokgdYw7ahEtCw=;
        fh=7BmF12x8JIX7i2ysPViD3oS3tFYG9mZ+u60lEXguOKc=;
        b=NoexwXWu+PqoqhYurnlXFp2hHZ0scCegb3QANu1Gl92qbYqM9RwYZslZ9soBsPVRlv
         8YOiFhW0t77UPdTa4AxO0HJ/dq6KcC570NVCKMqO4cnDwVlCc2CeNuBMEkIhQRH6RnC6
         kcYXceoD0PIuJYboELPpSXbc3s/G2bAZDJgdDTSElu3ic7qnLHpRcsoQxF8Mhtjuj7EQ
         l7keledPVD8pvmemqh3gmOzPz/jVyfPAqbYgzPMGPnkieX/C00ZywfLsJdJiVkR8YZ2z
         4V5KA4HyZnAejRnPj9VJRHFYYnrY2hP1hA56sxpo3pq5V5wAEURjA8XThvjsfsJdDYV6
         ASIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=goiOour+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ecf5e8asi128421766d6.93.2024.06.26.01.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 01:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=goiOour+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMO0J-0006rL-Ic; Wed, 26 Jun 2024 04:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0I-0006qh-Mv
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:27:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sMO0H-000778-1W
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 04:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719390462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z4TXulyFdXuDYnRFkMcuYu30552IRlokgdYw7ahEtCw=;
 b=goiOour+8j6CoDO3s+Oml8B8cYmWqcxb4QocmKI6zMLrSuPdW+2NhrWmRbE04ch+hGdgJe
 wBT25yoBR5kWDN+thtTGiROyqCeqWQDPnmgft+pLGZsuVS8ucwyUjm6FUA5wGazmt/Rsb9
 2coqDcqiN7cA1VNBfUbhWOF87YdBKII=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-fB0mPjV6OKK5282KstcsEw-1; Wed,
 26 Jun 2024 04:27:40 -0400
X-MC-Unique: fB0mPjV6OKK5282KstcsEw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 05C181956086; Wed, 26 Jun 2024 08:27:38 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3A4CA1956087; Wed, 26 Jun 2024 08:27:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: [PATCH 0/7] VIRTIO-IOMMU/HostIOMMUDevice: Fixes and page size mask
 rework
Date: Wed, 26 Jun 2024 10:26:45 +0200
Message-ID: <20240626082727.1278530-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124;
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
X-TUID: f/s6tT1lL/1p

The 2 first patches are fixes of
cf2647a76e ("virtio-iommu: Compute host reserved regions")
They can be taken separately of the rest.

Then the series uses the HostIOMMUDevice interface to fetch
information about the page size mask supported along the assigned
device and propagate it to the virtio-iommu. This is a similar
work as what was done in

VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling series

but this time for the page size mask. Using this new
infrastructure allows to handle page size mask conflicts
earlier on device hotplug as opposed to current QEMU
abort:

qemu-system-aarch64: virtio-iommu virtio-iommu-memory-region-8-0
does not support frozen granule 0x10000
qemu: hardware error: vfio: DMA mapping failed, unable to continue

With this series the hotplug nicely fails.

Also this allows to remove hacks consisting in transiently enabling
IOMMU MRs to collect coldplugged device page size mask before machine
init. Those hacks were introduced by

94df5b2180d6 ("virtio-iommu: Fix 64kB host page size VFIO device
assignment")

The series can be found at:
https://github.com/eauger/qemu/tree/virtio-iommu-psmask-rework-v1


Eric Auger (7):
  virtio-iommu: Fix error handling in
    virtio_iommu_set_host_iova_ranges()
  vfio-container-base: Introduce vfio_container_get_iova_ranges() helper
  HostIOMMUDevice : remove Error handle from get_iova_ranges callback
  HostIOMMUDevice: Introduce get_page_size_mask() callback
  virtio-iommu : Retrieve page size mask on
    virtio_iommu_set_iommu_device()
  memory: remove IOMMU MR iommu_set_page_size_mask() callback
  virtio-iommu: Revert transient enablement of IOMMU MR in bypass mode

 include/exec/memory.h                 |  38 --------
 include/hw/vfio/vfio-container-base.h |   9 ++
 include/sysemu/host_iommu_device.h    |  11 ++-
 hw/vfio/common.c                      |   8 --
 hw/vfio/container-base.c              |  15 ++++
 hw/vfio/container.c                   |  16 ++--
 hw/vfio/iommufd.c                     |  21 +++--
 hw/virtio/virtio-iommu.c              | 121 +++++++++++++-------------
 system/memory.c                       |  13 ---
 hw/virtio/trace-events                |   2 +-
 10 files changed, 117 insertions(+), 137 deletions(-)

-- 
2.41.0

