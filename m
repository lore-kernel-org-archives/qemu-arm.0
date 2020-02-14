Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1910262lfp;
        Fri, 14 Feb 2020 05:28:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzkaodhQZvtDbCCK/n6a83tNn9iSZIksZJP/oMU1Espyos1Z6i+RQced3jNIucDovNwNz42
X-Received: by 2002:ae9:e206:: with SMTP id c6mr928239qkc.454.1581686910080;
        Fri, 14 Feb 2020 05:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581686910; cv=none;
        d=google.com; s=arc-20160816;
        b=ZlxSxMqwMtSo46KhWCLwK9GRZ1BmRw0vBbww9CQJ5/9byulpdF1DDtZSN0CDZ5dksK
         UrBo4iaakpuXs7w3QXyUlZePXVOo3/OipnXRNv34sYosKJc1j4ZUAuBzgMUEy+C6kpIN
         bGY+0h9QsgBdtfsoB92FWvNVHWrYuIdCWP0EKBNyk+0KY+f+cEU/ORiLo8IMWBFRvJHa
         hRDuLdqsBJztGzTGm/mF7VNT2dIDcFe4GWwDzx0TEhknJI01gF0tZYAnhWudCgDHDjD8
         rN73a1F9EXHZ60YCpbpAIbs+X25EmknQrruYq3GRHvNS4GadRA6xWl0BKLpLTfBGGjSg
         NPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=7NtGgfBdLtzVFf1Ie0LYk3mAjNAT01IiNwPNSYamCyM=;
        b=PfO5lgs4t1QUL6fujEDyxbsuMllKILnSdm60dS0QlT+5GB+1fbDl+3Kz/Cvp9dOBS2
         VvBB69HUx/NRntZdD/bSeA8IhXunp9Nj6UoHHxZDb2zpkUVqWaku0sLrDkZsApKsshIL
         ew8OHUoPiZBlP2dpb6JlDvtW/ZHCEWNYypIiKn3DAcTyJ5D10HWE4CU58vOXI3IiHqHh
         f6TCOhgKTQL4igNWje2tP+AyJWqQnjHmleHfFxlRCMaWlrdMgPI+pkuAvtMLWw37p+Ok
         CgKyJYVia/sQX7lyBXpWYg/rluYlkW+uMviB4vJ4E/6r9P6ky8Np1vFAevRCojCFh/vc
         6qyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D5IaUpCs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q143si2891364qke.276.2020.02.14.05.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 05:28:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D5IaUpCs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2b1B-0000Pk-HF
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 08:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51847)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j2b0t-0000Ot-R7
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 08:28:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j2b0r-0005kH-5u
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 08:28:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51177
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j2b0p-0005X6-7U
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 08:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581686886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7NtGgfBdLtzVFf1Ie0LYk3mAjNAT01IiNwPNSYamCyM=;
 b=D5IaUpCsSycwZtWYcbcm/bgg5zkBjeuJ1XfM/pz2EDgNzFHlC8yxhc4uWuTJdPKzJk/svX
 VF4pX98ki4cGkdS9vVEgDW0ds6T9eGc0dBHhtBMdQOVcKEBrimPHxjzYrc0xiMLscKmt9M
 qqi89ibqS2tE9pzboukexthogyA02+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-k1kr6YqAP0mEnheJbICZfw-1; Fri, 14 Feb 2020 08:28:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DA6C13F7;
 Fri, 14 Feb 2020 13:28:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A5C55DA7D;
 Fri, 14 Feb 2020 13:27:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v16 00/10] VIRTIO-IOMMU device
Date: Fri, 14 Feb 2020 14:27:35 +0100
Message-Id: <20200214132745.23392-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: k1kr6YqAP0mEnheJbICZfw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, bharatb.linux@gmail.com, tnowicki@marvell.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o25QpCh+ZeYC

This series implements the QEMU virtio-iommu device.

This matches the v0.12 spec (voted) and the corresponding
virtio-iommu driver upstreamed in 5.3. All kernel dependencies
are resolved for DT integration. The virtio-iommu can be
instantiated in ARM virt using:

"-device virtio-iommu-pci".

Non DT mode is not yet supported as it has non resolved kernel
dependencies [1].

This feature targets 5.0.

Integration with vhost devices and vfio devices is not part
of this series. Please follow Bharat's respins [2].

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.2-virtio-iommu-v16

References:
[1] [RFC 00/13] virtio-iommu on non-devicetree platforms
[2] [PATCH RFC v5 0/5] virtio-iommu: VFIO integration

Testing:
- tested with guest using virtio-net-pci
  (,vhost=3Doff,iommu_platform,disable-modern=3Doff,disable-legacy=3Don)
  and virtio-blk-pci
- migration

History:

v15 -> v16:
- Collected Jean, Peter and Michael's R-bs
- last patches without R-b is the one related to hw/arm/virt.c
  + the last patch, added in this version
- Made the virtio-iommu-pci not hotpluggable (I dared to
  leave the R-b though)
- Renamed create_virtio_iommu into create_virtio_iommu_dt_bindings
- added entry in maintenance file

v14 -> v15:
- removed x-dt-binding and just kept check on hotplug_handler
- removed "tests: Add virtio-iommu test" as the check on
  hotplug_handler fails on PC machine
- destroy mappings in put_domain and remove
  g_tree_destroy(domain->mappings) in virtio_iommu_detach

v13 -> v14:
- added "virtio-iommu-pci: Introduce the x-dt-binding option"
- Removed the mappings gtree ref counting and simply delete
  the gtree when the last EP is detached from the domain


Eric Auger (10):
  virtio-iommu: Add skeleton
  virtio-iommu: Decode the command payload
  virtio-iommu: Implement attach/detach command
  virtio-iommu: Implement map/unmap
  virtio-iommu: Implement translate
  virtio-iommu: Implement fault reporting
  virtio-iommu: Support migration
  virtio-iommu-pci: Add virtio iommu pci support
  hw/arm/virt: Add the virtio-iommu device tree mappings
  MAINTAINERS: add virtio-iommu related files

 MAINTAINERS                      |   6 +
 hw/arm/virt.c                    |  57 +-
 hw/virtio/Kconfig                |   5 +
 hw/virtio/Makefile.objs          |   2 +
 hw/virtio/trace-events           |  20 +
 hw/virtio/virtio-iommu-pci.c     | 104 ++++
 hw/virtio/virtio-iommu.c         | 890 +++++++++++++++++++++++++++++++
 include/hw/arm/virt.h            |   2 +
 include/hw/pci/pci.h             |   1 +
 include/hw/virtio/virtio-iommu.h |  61 +++
 qdev-monitor.c                   |   1 +
 11 files changed, 1142 insertions(+), 7 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu-pci.c
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h

--=20
2.20.1

