Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4284888lfk;
        Mon, 29 Nov 2021 16:34:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFHZsLJnru7De0xyY7k38jlROobCH+FwdNyWKokrxRT3FY1GMZjlLShfyY8hI0vZ9ld5yB
X-Received: by 2002:a05:6102:292c:: with SMTP id cz44mr37990155vsb.9.1638232481629;
        Mon, 29 Nov 2021 16:34:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638232481; cv=none;
        d=google.com; s=arc-20160816;
        b=FSCbIaxAvjgVZlh2Y/JcrrlhSgtj+S2QkTBbUC0hKIPWe+GnUr5XX4JW0Xx21bl+1D
         txjb7+If2BosuaU3gl4fit8+1oYxCkLKbFaGwOcfMa7966vhEXxgBN5gkZzWj///06MR
         uLG5ObBVBg219DN+aW0sZ/I8VMOeOaQ2okraCzpLqu+wKbcuQm3VZNwCUwgGjXwVgAdE
         lEvT/vFxvgUtcCnDfAI9ZLVCiPxYKfoaamEZlkS2mMnwcLrFL7Gm0ooznmcvRocRSBzN
         se2mZDhjbJie4C859gPKN6T4tMyztE2ecLGIUwByg623YYfiocphd5/4kgIKyS4m8N3H
         BIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Mgo4l8HJBZsEfg87QT1IbD0RhLZsHe2QCguxWCiMWUI=;
        b=kQ8xpqEf3dXKOm3F2hFh+pf0lh3YOWkInHU9+7L7pnKMrm16XEf8S2T/4EdUNR9YgB
         C1xliO0BsRXq6OeWWYVq3s6ee/YOVLrz9+csEGMft1fX/ljsxBzcZQozhxmrzarCHRH2
         3RvDJxfZshAHdbtBNGIa+L6XcpHQfCKCjDYDyRZVF3lHVtXhfBEpZwfKydUOQKvmh+qq
         hUkVRlw5cojp/8IdMY05xqUs6fZveVU6taQBacTqxqXyNfhITKItK80iERWMghCq6XoQ
         dGHJYv5iLSjNNsawrlkWpq5xwT4nMYMOppCRM2FUZsr5EMZHMcASMnJ2gCWUQKfq+xhT
         JtJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EvKptmWq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si3817274vks.232.2021.11.29.16.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 16:34:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EvKptmWq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrr6W-0003hF-Un
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 19:34:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mrr62-0003KS-9D
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 19:34:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mrr5z-0003dX-8W
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 19:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638232446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mgo4l8HJBZsEfg87QT1IbD0RhLZsHe2QCguxWCiMWUI=;
 b=EvKptmWqtld+3WfiNVbw6eL33n7w44+ou7daRFkoTPhgmwPbAAWpELkCl0PMpgdBYZNaQ0
 h2crZMRvM5dHLZDAP1ykGDDnPC/+aJyeSqDj6c5p8eGZFkmL84tga5H34Cnsr2PDYbOP1V
 risd9XlFpe8jUmGpszFAgL+IHF9zhUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-OAZ0d0vsMZyguOOu_9hIOw-1; Mon, 29 Nov 2021 19:34:02 -0500
X-MC-Unique: OAZ0d0vsMZyguOOu_9hIOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51FA180F041;
 Tue, 30 Nov 2021 00:34:01 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-223.bne.redhat.com [10.64.54.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64BEB5C232;
 Tue, 30 Nov 2021 00:33:46 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 0/1] hw/arm/virt: Support for virtio-mem-pci
Date: Tue, 30 Nov 2021 08:33:27 +0800
Message-Id: <20211130003328.201270-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
X-TUID: Z+svqKK5amFF

This series supports virtio-mem-pci device, by simply following the
implementation on x86. The exception is the block size is 1GB on ARM64
instead of 128MB on x86.

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

Gavin Shan (1):
  hw/arm/virt: Support for virtio-mem-pci

 hw/arm/Kconfig         |  1 +
 hw/arm/virt.c          | 68 +++++++++++++++++++++++++++++++++++++++++-
 hw/virtio/virtio-mem.c |  2 ++
 3 files changed, 70 insertions(+), 1 deletion(-)

-- 
2.23.0

