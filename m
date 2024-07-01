Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1229169njm;
        Mon, 1 Jul 2024 01:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKUIw8iW7TX+wj/TjLQdOoqNuJ2+r/EshOxfFGWRkioiRotdMW98yCFUbNHBUz2c34ExrVB7eWdeBq3agY1m5yb17n6eXZ
X-Google-Smtp-Source: AGHT+IH+bU17YyY5IArJ5fbo1o6aqyys1I+UOFC8AzHtZOXpqpif1Trf849AdMmtk21tf/JTDmrl
X-Received: by 2002:a81:4415:0:b0:643:c2bf:c156 with SMTP id 00721157ae682-64c718f83d6mr46622527b3.19.1719823862793;
        Mon, 01 Jul 2024 01:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719823862; cv=none;
        d=google.com; s=arc-20160816;
        b=SS+l3j0g6VuLQEWsqHsyGNwz5Sdq/poXWwP0b2BFDTU9XkCy9rXEQQvntbCqEzUAX6
         lLWj9m0uFAOOJDCsK46OodGIzpF+9h1aRcAOSVybM9Y10QymsIGBB/ZeCIjM0qvTlf5B
         zavTQUJ1Loknc/BN8fwh665mjw7j+GgoNEfj5Wrm3qifhMK9IPkRUjAHWC7OQEezzyWc
         k2cr6ZNee+FQOfkkNSeetMRHxqU5IpQUppuA3ITJjYbne8zezexyM+LOAXKx7LfLRopb
         WPtIpX+8atGwHNBHwJ60fFVrbpmzp07qcQXGxWVUV+Rhz3CEiDqVajaJHcYTIoV8ITs+
         05iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=cgJfWjCJSsqWY8stLMqK0V9ndyG+mMup/arO83wAq2o=;
        fh=7BmF12x8JIX7i2ysPViD3oS3tFYG9mZ+u60lEXguOKc=;
        b=Z7XXAUCE8oyFnl+16PXBDAvoDGf/wwKYIM5kmTzrKu4GpKsnPbHvNW1l/E2b/vK3uR
         6HRGPyUSVe1ZWWWax+FvgfMcWnZAcMtFe9J3yIJlnNrb3Rae2WmmqIeoD8ABqEvmlUOk
         TXkwQ1JBVN6TZbbrT0Iq+l4ypJiF2SDHxC4/MNI7SfMNpZr5F70vzxfJeguQ1xr153WR
         or/yLhq5P8sFLtgqp2c6JjPifyMBcEIRMqLKkqCdJIIh94OtWp/nC1lWUW+9xv8ZEdHy
         ECQabwO0bIOXPUJ9LUaEK7AAEeKcOruGS71iwbRvoMyRzQqB7tmPrPU+NhN+xLBnsWsm
         cDeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="c8V/DD+u";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514c830esi75039371cf.608.2024.07.01.01.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 01:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="c8V/DD+u";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOCkI-0003or-E3; Mon, 01 Jul 2024 04:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sOCjk-00033q-So
 for qemu-devel@nongnu.org; Mon, 01 Jul 2024 04:50:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sOCji-0005K0-2p
 for qemu-devel@nongnu.org; Mon, 01 Jul 2024 04:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719823808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cgJfWjCJSsqWY8stLMqK0V9ndyG+mMup/arO83wAq2o=;
 b=c8V/DD+uTV/bQNFhSWbcS8fB2/YZclm6yHKDz6ak6eYzrTAXBCtCM7e9NW7kY+ASyYum/l
 sc4llWFZ/yR54OXhFqsZcyfqzeCLJMRE3F6rqpo6PUHpnFihx+n0nEHwFSssFBrTxOXwKA
 sT4Co/8ud7BEizJTxpwK7St5URDjomI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-DKkEpFk_N-OclL7wr9YSkQ-1; Mon,
 01 Jul 2024 04:50:06 -0400
X-MC-Unique: DKkEpFk_N-OclL7wr9YSkQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4F05619560B1; Mon,  1 Jul 2024 08:50:05 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.22.9.3])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 45D781956089; Mon,  1 Jul 2024 08:50:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com
Subject: [PATCH v2 0/7] VIRTIO-IOMMU/HostIOMMUDevice: Fixes and page size mask
 rework
Date: Mon,  1 Jul 2024 10:48:52 +0200
Message-ID: <20240701084957.1567641-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: brZyWDvuLHOk

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
https://github.com/eauger/qemu/tree/virtio-iommu-psmask-rework-v2

---
v1 -> v2:
- Don't update mask if the granule is frozen (Zhenzhong)
- Collected Zhenzhong's and Cédric's R-bs

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
 hw/virtio/virtio-iommu.c              | 123 +++++++++++++-------------
 system/memory.c                       |  13 ---
 hw/virtio/trace-events                |   2 +-
 10 files changed, 119 insertions(+), 137 deletions(-)

-- 
2.41.0

