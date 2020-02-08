Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1687153lfp;
        Sat, 8 Feb 2020 04:00:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKAQjabaamk8c7ODd/zxusOvyorO/qHDC6GFgy5GjJWZhyBX8VMFpjWTwRjMXOAlE1fmTz
X-Received: by 2002:ae9:e710:: with SMTP id m16mr2748051qka.242.1581163259014;
        Sat, 08 Feb 2020 04:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581163259; cv=none;
        d=google.com; s=arc-20160816;
        b=Jz03FdopZRR7AY1ti13q7EepSzo0EOpowUFxAB8TgKJDoE11G1V07QFlqh8DkggtjT
         ediP1ZIhXzaRN171ERZJWz+JF3Bz5BA2FMhuUUIhYdwXAiUBENU1btbldNomeV6p0BT5
         ABcWfYmByWeQ+xYlxDeEIgkala/ThX10MIW895SIztyt1Ggw7QllWWtldcWas9Mkbqba
         3DMwuCPYSHiiijc/XlWfPQLeir2+ncHBqItOPzDbw1UMPSBX8+pzxD3t9E+hdoaXk7ZL
         YmIJVN+UHSi3fuaHw0VKgK7metnPVuzjMcboJ3p6G3V7jnBkj8ReomQRs3Str0ounryj
         /+hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Ql6sCDmwQqiMHt7RScYYvNPQPGSbR7kryjtCjoCIyoU=;
        b=FXNPgPv8bwZr6M1k3ZOjngTBbPwLaEnubL9VlVvHyIlkdBYcSqnt8q3TqDEWf58/Yz
         EzPM4G8owV+drBgsfaCmrcoqxKT3AoOuMGrQubbqXHdMaEjvs7BqCeS0T7kq1RHLI9Pq
         s4FKD06zO7udkSm2wJ3OmvzAC63E0z5t6a3BOwL6nHEcCTN66XwHw4rL6ANUk1edev51
         yL+KE/Vsgc9BTlhIZjR3WwvtRjHVN+8juYEtShGxLxudxkKNwYdyFNTzwaTCUqPG4uy+
         ZKocmb0JKOzfFnW0/tolr4xv6yF9rWTuDW9AyceKlMLtYZ70miBh9zBxd1FaU64BpY8/
         p2zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="drNbh/Lb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si1474561qkk.284.2020.02.08.04.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 04:00:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="drNbh/Lb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0OnC-0004zP-FK
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 07:00:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j0Omy-0004kj-D9
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 07:00:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j0Omw-0008Nb-PF
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 07:00:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55861
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j0Omv-0008Mo-QM
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 07:00:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581163240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ql6sCDmwQqiMHt7RScYYvNPQPGSbR7kryjtCjoCIyoU=;
 b=drNbh/LbaredsQ0NQPhzy+qxMNrooStCiSl6JIQtIi9nIz+voYuAl7ZO0VyNS4spWU8vHT
 MRg8Y3f6PP6vjAOZO5NKwPvPqEEu7lwMpU9zjj2zDaK1tdXPTP6AjDy7ooH5oLts1Bd2mq
 lmXnvlHkRDSfP3Zl3UEUA+Cocv9lo/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-gq5crHP9OXq0Wtka23kBww-1; Sat, 08 Feb 2020 07:00:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E6948010EF;
 Sat,  8 Feb 2020 12:00:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFF415C545;
 Sat,  8 Feb 2020 12:00:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v15 0/9] VIRTIO-IOMMU device
Date: Sat,  8 Feb 2020 13:00:13 +0100
Message-Id: <20200208120022.1920-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: gq5crHP9OXq0Wtka23kBww-1
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
X-TUID: lYgRpTc9Iexq

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
https://github.com/eauger/qemu/tree/v4.2-virtio-iommu-v15

References:
[1] [RFC 00/13] virtio-iommu on non-devicetree platforms
[2] [PATCH RFC v5 0/5] virtio-iommu: VFIO integration

Testing:
- tested with guest using virtio-net-pci
  (,vhost=3Doff,iommu_platform,disable-modern=3Doff,disable-legacy=3Don)
  and virtio-blk-pci
- migration

History:

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
- call virtio_iommu_detach_endpoint_from_domain from
  virtio_iommu_put_endpoint

v12 -> v13:
- Take into account Peter's comments
- fix qtest error and accomodate for directory changes in
  test
- remove "[PATCH v12 01/13] migration: Support QLIST migration"
  which is now upstream
- fix iommu_find_iommu_pcibus()
- squash commits as requested by Peter
- remove spurious guest log

../..

Eric Auger (9):
  virtio-iommu: Add skeleton
  virtio-iommu: Decode the command payload
  virtio-iommu: Implement attach/detach command
  virtio-iommu: Implement map/unmap
  virtio-iommu: Implement translate
  virtio-iommu: Implement fault reporting
  virtio-iommu-pci: Add virtio iommu pci support
  hw/arm/virt: Add the virtio-iommu device tree mappings
  virtio-iommu: Support migration

 hw/arm/virt.c                    |  57 +-
 hw/virtio/Kconfig                |   5 +
 hw/virtio/Makefile.objs          |   2 +
 hw/virtio/trace-events           |  20 +
 hw/virtio/virtio-iommu-pci.c     | 103 ++++
 hw/virtio/virtio-iommu.c         | 890 +++++++++++++++++++++++++++++++
 include/hw/arm/virt.h            |   2 +
 include/hw/pci/pci.h             |   1 +
 include/hw/virtio/virtio-iommu.h |  61 +++
 qdev-monitor.c                   |   1 +
 10 files changed, 1135 insertions(+), 7 deletions(-)
 create mode 100644 hw/virtio/virtio-iommu-pci.c
 create mode 100644 hw/virtio/virtio-iommu.c
 create mode 100644 include/hw/virtio/virtio-iommu.h

--=20
2.20.1

