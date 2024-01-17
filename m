Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1391835ejf;
        Wed, 17 Jan 2024 00:04:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsJ9Q9trJ7GZkYrj/wKZrKby/g8bovSn1yqNzZlth1FSFmgPI0SJiAzfS6kkpi2pGGOABQ
X-Received: by 2002:a05:622a:4cf:b0:429:c852:9307 with SMTP id q15-20020a05622a04cf00b00429c8529307mr10105969qtx.133.1705478687097;
        Wed, 17 Jan 2024 00:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705478687; cv=none;
        d=google.com; s=arc-20160816;
        b=A5isaXJ1lgrkMhYL8gotw3lEG887PgICH6S8vJNMSDCilyuLYZgv7iJLs8f2mCnJfS
         THB4gbf3AaYYZs8u3VoU30ORB79KA938vJf/kkluyOK0qzq/eesQC8MuLA2Ml80uybWX
         UCVTKuPLHazmrAIBWAEV8zyS4lT103P+mAC1xj1+OCxwJAxsXtQ4XNyRezebIckk7jTw
         m26xy6wnQODx9R0+drR7I7ipUCY60U+i1ihq5ARxo+r+dqO8CW3Aw+yNCTKmSPdOz56C
         BnV3mg9dU4Gtm/TGHVGF/phGUgk03hAmrXxeVzD6QFussge+bnVeKL6O2/PFpRD+nVml
         RCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tRwUXM4uEOyRCpSPFh7F6GKgG/yzJq5yx0Ax39Yn5Pc=;
        fh=E3c4Lx6w2odu/6SlG6b7ImsRAg1mlDohYwN4BQaBgGo=;
        b=d3uMbj4aZ5IHbHtZnOAzmIo8lD5a+sXc/HzH3oJtuyLc1PRYjwlMFxSXTQnCFB3pK6
         NEZJAAt9i9jq617L46sLXKMmPurSWknSzlDT4rRk1eowXy4H41qZOZIKOEA1rtA/vhRX
         lzV4DH2D9sQ2eiBEYKpRlrZcK+V88ekdDA/repFtByyIHZyK/+Gw5gzQhKA/mILjUh6B
         hTu4sNm8luWdezjJZfKRU5ZgBrcAsE0gA+jMoAzE9RDHTVvjFrzBJ2m+DnJv9YbgB5+N
         dLjJxlnOT077aSuQQ1koLwyfvNrb5MN++JvWPXphVwgPcUvqFvdxeP2ccPwzDMUG+kyA
         4+wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qpl4bHh1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020ac85a41000000b00429c925a828si10572179qta.334.2024.01.17.00.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 00:04:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qpl4bHh1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ0ud-000293-FY; Wed, 17 Jan 2024 03:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0ub-000276-Na
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rQ0uT-000330-2t
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705478668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tRwUXM4uEOyRCpSPFh7F6GKgG/yzJq5yx0Ax39Yn5Pc=;
 b=Qpl4bHh1bZb0bx9fAiqnejSTQ37QE5mmlDLe74KlHSz3e2Z0aF5IN21AsBQ8VMB+6erod1
 IT1wLX2LWt91f7C274vjHUblUeQ5D7BtP8Dj6YevP+kLpIcvzoTPTpbAYmFq0x5pl620lJ
 Oej7HrINdhFAHGeaTs88tbu03mMVdQ8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198-pKFr1q1oOUKOEwDnv8PCBg-1; Wed,
 17 Jan 2024 03:04:24 -0500
X-MC-Unique: pKFr1q1oOUKOEwDnv8PCBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 808373C0008C;
 Wed, 17 Jan 2024 08:04:24 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E733F1BDB0;
 Wed, 17 Jan 2024 08:04:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, alex.williamson@redhat.com,
 peter.maydell@linaro.org, zhenzhong.duan@intel.com, peterx@redhat.com,
 yanghliu@redhat.com, pbonzini@redhat.com
Cc: mst@redhat.com,
	clg@redhat.com
Subject: [RFC 0/7] VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling for
 hotplugged devices
Date: Wed, 17 Jan 2024 09:02:04 +0100
Message-ID: <20240117080414.316890-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: W2rQJA2I0cPz

In [1] we attempted to fix a case where a VFIO-PCI device protected
with a virtio-iommu was assigned to an x86 guest. On x86 the physical
IOMMU may have an address width (gaw) of 39 or 48 bits whereas the
virtio-iommu used to expose a 64b address space by default.
Hence the guest was trying to use the full 64b space and we hit
DMA MAP failures. To work around this issue we managed to pass
usable IOVA regions (excluding the out of range space) from VFIO 
to the virtio-iommu device. This was made feasible by introducing
a new IOMMU Memory Region callback dubbed iommu_set_iova_regions().
This latter gets called when the IOMMU MR is enabled which
causes the vfio_listener_region_add() to be called.

However with VFIO-PCI hotplug, this technique fails due to the
race between the call to the callback in the add memory listener
and the virtio-iommu probe request. Indeed the probe request gets
called before the attach to the domain. So in that case the usable
regions are communicated after the probe request and fail to be
conveyed to the guest. To be honest the problem was hinted by
Jean-Philippe in [1] and I should have been more careful at
listening to him and testing with hotplug :-(

For coldplugged device the technique works because we make sure all
the IOMMU MR are enabled once on the machine init done: 94df5b2180
("virtio-iommu: Fix 64kB host page size VFIO device assignment")
for granule freeze. But I would be keen to get rid of this trick.

Using an IOMMU MR Ops is unpractical because this relies on the IOMMU
MR to have been enabled and the corresponding vfio_listener_region_add()
to be executed. Instead this series proposes to replace the usage of this
API by the recently introduced PCIIOMMUOps: ba7d12eb8c  ("hw/pci: modify
pci_setup_iommu() to set PCIIOMMUOps"). That way, the callback can be
called earlier, once the usable IOVA regions have been collected by
VFIO, without the need for the IOMMU MR to be enabled.

This looks cleaner. In the short term this may also be used for
passing the page size mask, which would allow to get rid of the
hacky transient IOMMU MR enablement mentionned above.

[1] [PATCH v4 00/12] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
    https://lore.kernel.org/all/20231019134651.842175-1-eric.auger@redhat.com/

[2] https://lore.kernel.org/all/20230929161547.GB2957297@myrica/

Extra Notes:
With that series, the reserved memory regions are communicated on time
so that the virtio-iommu probe request grabs them. However this is not
sufficient. In some cases (my case), I still see some DMA MAP failures
and the guest keeps on using IOVA ranges outside the geometry of the
physical IOMMU. This is due to the fact the VFIO-PCI device is in the
same iommu group as the pcie root port. Normally the kernel
iova_reserve_iommu_regions (dma-iommu.c) is supposed to call reserve_iova()
for each reserved IOVA, which carves them out of the allocator. When
iommu_dma_init_domain() gets called for the hotplugged vfio-pci device
the iova domain is already allocated and set and we don't call
iova_reserve_iommu_regions() again for the vfio-pci device. So its
corresponding reserved regions are not properly taken into account.

This is not trivial to fix because theoretically the 1st attached
devices could already have allocated IOVAs within the reserved regions
of the second device. Also we are somehow hijacking the reserved
memory regions to model the geometry of the physical IOMMU so not sure
any attempt to fix that upstream will be accepted. At the moment one
solution is to make sure assigned devices end up in singleton group.
Another solution is to work on a different approach where the gaw
can be passed as an option to the virtio-iommu device, similarly at
what is done with intel iommu.

This series can be found at:
https://github.com/eauger/qemu/tree/hotplug-resv-rfc


Eric Auger (7):
  hw/pci: Introduce PCIIOMMUOps::set_host_iova_regions
  hw/pci: Introduce pci_device_iommu_bus
  vfio/pci: Pass the usable IOVA ranges through PCIIOMMUOps
  virtio-iommu: Implement PCIIOMMUOps set_host_resv_regions
  virtio-iommu: Remove the implementation of iommu_set_iova_ranges
  hw/vfio: Remove memory_region_iommu_set_iova_ranges() call
  memory: Remove IOMMU MR iommu_set_iova_range API

 include/exec/memory.h    |  32 -------
 include/hw/pci/pci.h     |  16 ++++
 hw/pci/pci.c             |  16 ++++
 hw/vfio/common.c         |  10 --
 hw/vfio/pci.c            |  27 ++++++
 hw/virtio/virtio-iommu.c | 201 ++++++++++++++++++++-------------------
 system/memory.c          |  13 ---
 7 files changed, 160 insertions(+), 155 deletions(-)

-- 
2.41.0

