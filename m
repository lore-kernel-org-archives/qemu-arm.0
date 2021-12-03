Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1076847lfk;
        Thu, 2 Dec 2021 19:36:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/jPz6TCfOm9ynGISqDcGXA2Qwj6IojR1G+707kLec4DuFpl9nj283uKnCdKrosXeKUoIu
X-Received: by 2002:a25:26cc:: with SMTP id m195mr20191647ybm.268.1638502590072;
        Thu, 02 Dec 2021 19:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638502590; cv=none;
        d=google.com; s=arc-20160816;
        b=DILlEj9N4TA21xs3JjtVHN1gCJDKRvIAGnGJOGVl9/nWnrQ+vjPGZ++7N3m+/Iqjep
         2kAnZzTTe4gYnNwBWvkFkmd94s4IUjoxeYoex5fW5t0GHcM7R5LUGi02wmFwNMxpU7xu
         6p3Fyik4wXj3yi+3gnyGMUX6FoI0oa7zhQEn++ZcyjdHDtaRfU7ULmiDk399Zee4t8tH
         Nnk5O1XeLbOjCbhMo9prMB9YLrXV8b8Eu6ZCbVrkSkWJ8ifvuELm1ktiINLMpFxf5tV0
         9W2SRZA5xJ4FFHFSvR6fjtA7qSCaNPwMXzk6e1Qkb9/IPRXSYLs5ZLHNh60p673mEDpy
         OAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8hU0l5Um/uFc8zNQCLk0xQemnNqgLFX59nVDvUWvMio=;
        b=Kgj2t2OYeaLOOr1Sl5RSMAABWcGMugSZNDYXeTPkcKpKGgqrUFoDe2FKXCX/Xcubh6
         PxVD5PDb+0gFiE8dndHJ4pqL6GWFi/mHLy7WmCZhsuUY4/HJz97c4Tot7YnDap2FbBqR
         wrt4H4UHCBejdLgUOLt4dPeRRKPMO5U82gqoxtNeOGuS97OwVs/ugN4qL+Kqp++8rv3D
         iAxuzP2v4kJzwIkIHigJ/7bqVkhwoM+YHaEdZ7PoxpAgVjMmX2fY7zZQrt/ujPmfVyNF
         sZdHqRMXmd4pPCJxBxIeVn4ew1zC/qovblQIIaGdPQepe9CcbkoyOsxBQYiL5rulrqkC
         MGsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MY9Poonq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si2389546ybm.324.2021.12.02.19.36.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Dec 2021 19:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MY9Poonq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mszN7-0002BT-Eq
	for alex.bennee@linaro.org; Thu, 02 Dec 2021 22:36:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mszMx-00029i-Rk
 for qemu-arm@nongnu.org; Thu, 02 Dec 2021 22:36:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mszMu-0002SE-UT
 for qemu-arm@nongnu.org; Thu, 02 Dec 2021 22:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638502576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8hU0l5Um/uFc8zNQCLk0xQemnNqgLFX59nVDvUWvMio=;
 b=MY9PoonqtLEYzVzcw/bJm0OVgW2HjCQJSLv7mKc3u/WcE/gh2l28L8onJppwjCU9jzxu4y
 NZfmpVHrSd9XhNK+0czs8CIkR0iW7ZjriMcwEmcps3ydxMMpBBCJNgdunGKxfpDQUGNHxy
 9QWiraRINLJu5gMeNaJLTHA0erx5zlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-lt6BvFJjMrWxl23xlhjK0Q-1; Thu, 02 Dec 2021 22:36:13 -0500
X-MC-Unique: lt6BvFJjMrWxl23xlhjK0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF4D281430E;
 Fri,  3 Dec 2021 03:36:11 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C199519724;
 Fri,  3 Dec 2021 03:35:24 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 0/2] hw/arm/virt: Support for virtio-mem-pci
Date: Fri,  3 Dec 2021 11:35:20 +0800
Message-Id: <20211203033522.27580-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 shan.gavin@gmail.com, Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cmApB6iu3dzw

This series supports virtio-mem-pci device, by simply following the
implementation on x86. The exception is the block size is 512MB on
ARM64 instead of 128MB on x86, compatible with the memory section
size in linux guest.

The work was done by David Hildenbrand and then Jonathan Cameron. I'm
taking the patch and putting more efforts, which is all about testing
to me at current stage.

Testing
=======
The upstream linux kernel (v5.16.rc3) is used on host/guest during
the testing. The guest kernel includes changes to enable virtio-mem
driver, which is simply to enable CONFIG_VIRTIO_MEM on ARM64.

Mutiple combinations like page sizes on host/guest, memory backend
device etc are covered in the testing. Besides, migration is also
tested. The following command lines are used for VM or virtio-mem-pci
device hot-add. It's notable that virtio-mem-pci device hot-remove
isn't supported, similar to what we have on x86. 

  host.pgsize  guest.pgsize  backend    hot-add  hot-remove  migration
  ---------------------------------------------------------------------
   4KB         4KB           normal     ok       ok          ok
                             THP        ok       ok          ok
                             hugeTLB    ok       ok          ok
   4KB         64KB          normal     ok       ok          ok
                             THP        ok       ok          ok
                             hugeTLB    ok       ok          ok
  64KB         4KB           normal     ok       ok          ok
                             THP        ok       ok          ok
                             hugeTLB    ok       ok          ok
  64KB         64KB          normal     ok       ok          ok
                             THP        ok       ok          ok
                             hugeTLB    ok       ok          ok

The command lines are used for VM. When hugeTLBfs is used, all memory
backend objects are popuated on /dev/hugepages-2048kB or
/dev/hugepages-524288kB, depending on the host page sizes.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                       \
  -accel kvm -machine virt,gic-version=host                                     \
  -cpu host -smp 4,sockets=2,cores=2,threads=1                                  \
  -m 1024M,slots=16,maxmem=64G                                                  \
  -object memory-backend-ram,id=mem0,size=512M                                  \
  -object memory-backend-ram,id=mem1,size=512M                                  \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                                      \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                                      \
     :
  -kernel /home/gavin/sandbox/linux.guest/arch/arm64/boot/Image                 \
  -initrd /home/gavin/sandbox/images/rootfs.cpio.xz                             \
  -append earlycon=pl011,mmio,0x9000000                                         \
  -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                         \
  -device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                         \
  -device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                         \
  -object memory-backend-ram,id=vmem0,size=512M                                 \
  -device virtio-mem-pci,id=vm0,bus=pcie.1,memdev=vmem0,node=0,requested-size=0 \
  -object memory-backend-ram,id=vmem1,size=512M                                 \
  -device virtio-mem-pci,id=vm1,bus=pcie.2,memdev=vmem1,node=1,requested-size=0 

Command lines used for memory hot-add and hot-remove:

  (qemu) qom-set vm1 requested-size 512M
  (qemu) qom-set vm1 requested-size 0
  (qemu) qom-set vm1 requested-size 512M

Command lines used for virtio-mem-pci device hot-add:

  (qemu) object_add memory-backend-ram,id=hp-mem1,size=512M
  (qemu) device_add virtio-mem-pci,id=hp-vm1,bus=pcie.3,memdev=hp-mem1,node=1
  (qemu) qom-set hp-vm1 requested-size 512M
  (qemu) qom-set hp-vm1 requested-size 0
  (qemu) qom-set hp-vm1 requested-size 512M

Changelog
=========
v2:
  * Include David/Jonathan as co-developers in the commit log           (David)
  * Decrease VIRTIO_MEM_USABLE_EXTENT to 512MB on ARM64 in PATCH[1/2]   (David)
  * PATCH[2/2] is added to correct the THP sizes on ARM64               (David)

Gavin Shan (2):
  hw/arm/virt: Support for virtio-mem-pci
  virtio-mem: Correct default THP size for ARM64

 hw/arm/Kconfig         |  1 +
 hw/arm/virt.c          | 68 +++++++++++++++++++++++++++++++++++++++++-
 hw/virtio/virtio-mem.c | 36 ++++++++++++++--------
 3 files changed, 91 insertions(+), 14 deletions(-)

-- 
2.23.0

