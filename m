Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp739475lfk;
        Fri, 3 Dec 2021 15:36:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVgG09PwHGPrSIZCEME1ZRPi/Cy0/b3GVIFDXy4T2SgM5X05aE/qTMjpS1ozhfuhDzspL8
X-Received: by 2002:a25:2c85:: with SMTP id s127mr25561954ybs.250.1638574617799;
        Fri, 03 Dec 2021 15:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638574617; cv=none;
        d=google.com; s=arc-20160816;
        b=jJ6oA5DVeiKMki0+sSY8mdJRvIrt6TQQF9sjAGfx76l2r2/1/sgVDbX2OzGnm4OZek
         f9wY14SdlMu8POTyezA32P0Lj8a8y7L8NsL87NR6TXUv0BudGqguW8inqPOWIdNARh5D
         09ZBtWpT229Gr9YQa4LDHua+q+RACH2B+gSJ256KGylM6yYKD642RhFZuowMPHaWgA0Y
         YKXXaN5o/lPaYVqMdg1Ef/qvbjHLk7zY3XPSzYddKjB6stzVIMU4l/4Lt9sQvkW5JLq5
         4tIC5EM2huiBUuEmmOTnBSyzDKxJ+XY3r+VbSKVKglhuU07PBlxnfZz6bGKfLSBItn6R
         rmAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=dWviY50ulgk7QUZ4Zl6w1zIRPVTHBypFtNmTxW/yV7o=;
        b=MRRtbeKii5/X9ogj76qhlbmg4NbVKXW7n2ocMmUgO0v5CZah7rLijn+NG9ZGbNXOIQ
         VpSqJ0kyXcXkClJa7gNq/gJEhjow0x3E0yxx7I/1twyP+vUDU9ITAESJyK4OHJFacrLa
         bJsjx5e06mmyQb5IAJ593BlWZ4vQfgZat8eNa3EzIGGee+aonai5FGKV7Zrnwve3Qexj
         wxeNw6xlcteI6INHInjqw+BMiI8zOaADZHomI+CZa6TH3btnyM6NNEX0PkFd7V9fW1Qd
         oiJNYnjPIAlpWNTmJm5Qoxs+MfpecsB2jjm6M13Vz6YlLOIhqQ7emWLk8gqgEf6ceU7W
         O/aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dr5J09uV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z81si5561151ybb.267.2021.12.03.15.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Dec 2021 15:36:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dr5J09uV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mtI6r-00020S-2X
	for alex.bennee@linaro.org; Fri, 03 Dec 2021 18:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtI4a-0005ta-Vc
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 18:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtI4W-0001oI-QE
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 18:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638574471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dWviY50ulgk7QUZ4Zl6w1zIRPVTHBypFtNmTxW/yV7o=;
 b=dr5J09uVpEyuXY+dWcD5wGvdGGA59Rm8st1yQIaBW6/ixcDU9/mmFs0EB/1pD9jSKjcY9J
 DD5ZuDpWMzNhUzhCaP4sooJILntHDBILVi421N5pG6kb9COdlu1km/0cXFtCoFAuu8ndcI
 jyjiDXlxFpSPmNV8Iiwo32bvzGPL20Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-cK-L5SawOuiazmEqdGdcTg-1; Fri, 03 Dec 2021 18:34:28 -0500
X-MC-Unique: cK-L5SawOuiazmEqdGdcTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 436762F23;
 Fri,  3 Dec 2021 23:34:27 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C21C60843;
 Fri,  3 Dec 2021 23:34:14 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 0/2] hw/arm/virt: Support for virtio-mem-pci
Date: Sat,  4 Dec 2021 07:34:02 +0800
Message-Id: <20211203233404.37313-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: T4V3o1sVElc9

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
v3:
  * Reshuffle patches                                                   (David)
  * Suggested code refactoring for virtio_mem_default_thp_size()        (David)
  * Pick r-b from Jonathan and David                                    (Gavin)
v2:
  * Include David/Jonathan as co-developers in the commit log           (David)
  * Decrease VIRTIO_MEM_USABLE_EXTENT to 512MB on ARM64 in PATCH[1/2]   (David)
  * PATCH[2/2] is added to correct the THP sizes on ARM64               (David)

Gavin Shan (2):
  virtio-mem: Correct default THP size for ARM64
  hw/arm/virt: Support for virtio-mem-pci

 hw/arm/Kconfig         |  1 +
 hw/arm/virt.c          | 68 +++++++++++++++++++++++++++++++++++++++++-
 hw/virtio/virtio-mem.c | 36 ++++++++++++++--------
 3 files changed, 91 insertions(+), 14 deletions(-)

-- 
2.23.0

