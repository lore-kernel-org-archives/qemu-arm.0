Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4075252ejb;
        Mon, 6 Feb 2023 03:22:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+gU7AyqR6H9eM0vSV4ZLt+e3kY8WGrOpN+uULGPHMWsvjHVfzuNM1/JrhP9Zsn0VHfe/dq
X-Received: by 2002:a05:6214:1912:b0:561:89bd:342c with SMTP id er18-20020a056214191200b0056189bd342cmr19614850qvb.18.1675682563731;
        Mon, 06 Feb 2023 03:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675682563; cv=none;
        d=google.com; s=arc-20160816;
        b=anMyzLXcX5sEUx54tm/Vr5Q+5NcO2fnMgzGmIrCSz1t7PVt9QZOQvnHQPVUng4wXcj
         HZEDl4VI2b36P47nCJhxS9EE0POA3AtPNVZKnO67rpQGlfr0SwEHCd/C6xhieOl20iHB
         t4+HBTvehD9Gh+ffTFkIS4UmQnYa2hS1AK1cDsMSrLbrC45hZxIYG05LZh7yDS9CdkYf
         rMMgvT40guP7tf0DSOLeFtkRDg2wiOKB9e8nyyQGHcEuCMp6u+Rc7vWaI35qu9vAgwYS
         R73lB7UbR3Nkk2RZT0Cqes2RqsQ2gJIyjsC3rvSsJoYOhqxR5MneHn6lWp7fwhnYP0kx
         1mgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=X4/ItBPPJAnDvyXgl70Ve2C6m7UmhgLBo5CGA8m1l08=;
        b=dBjp7MgsZ9WGbW+rz6yhdHLz0ufwPwpRZeDqC+q7CEZZkUEV4KyXyJFUjbJkKmdBzE
         6rJim7v5liA/4A3ON6Ri/hI5w76BiCR25qnjrgQKccLiaSqZ8X2fESysnmRxxPICnBG4
         O7KX2ZQtontqvUaT4Y72jxzBcnuXX7cLcLtBjxZTDTjVaVKRRi9k/iJXtmJw53SQ2Vfn
         9xzb94RVT0uTmsQAvaBYTFZvh1Gf+sREpVmgXIFkGRP3noIAB/a8ke9UnDLafqp45pu8
         DXSYpvN9ECgltKlMCaWE13d5S5BKrI+HMzcnFq4gXm+Gf0VQ+JKGp6h7D7cZExiH3+MZ
         uUcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PaYIFJt5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020a370415000000b0071d94250f64si8030982qke.346.2023.02.06.03.22.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 03:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PaYIFJt5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzZe-0004Dk-Dq; Mon, 06 Feb 2023 06:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzZT-0004Cg-Q2
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:22:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzZR-0003Lq-N9
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675682520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X4/ItBPPJAnDvyXgl70Ve2C6m7UmhgLBo5CGA8m1l08=;
 b=PaYIFJt5PGR4AyOMqBYP4O1wuqxJnKhY+pBQaQLKf0/KSbiECFEqpsAV4K6VzJyAaltRlu
 LFtrr17DwbcUXdRHgxovlsbRLWPBuQN1UBncX/c+lOtZO1D7mvCSTgJMuMe1b7LkEiqS9S
 yGk0JqHNlK42abq1zzYFihuD4lmFxfs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-qvNki5FAPr2dpYFyKrwwDQ-1; Mon, 06 Feb 2023 06:20:54 -0500
X-MC-Unique: qvNki5FAPr2dpYFyKrwwDQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33E7529ABA01;
 Mon,  6 Feb 2023 11:20:54 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4453E492B21;
 Mon,  6 Feb 2023 11:20:48 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH RFCv1 0/8] hw/arm/virt: Support dirty ring
Date: Mon,  6 Feb 2023 19:20:02 +0800
Message-Id: <20230206112010.99871-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Bqk9djRBWq1X

This series intends to support dirty ring for live migration. The dirty
ring use discrete buffer to track dirty pages. For ARM64, the speciality
is to use backup bitmap to track dirty pages when there is no-running-vcpu
context. It's known that the backup bitmap needs to be synchronized when
KVM device "kvm-arm-gicv3" or "arm-its-kvm" has been enabled. The backup
bitmap is collected in the last stage of migration.

PATCH[1]    Synchronize linux-headers for dirty ring
PATCH[2-3]  Introduce indicator of the last stage migration and pass it
            all the way down
PATCH[4-5]  Introduce secondary bitmap, corresponding to the backup bitmap
PATCH[6-8]  Enable dirty ring for hw/arm/virt

Testing
=======
(1) kvm-unit-tests/its-pending-migration and kvm-unit-tests/its-migration with
    dirty ring or normal dirty page tracking mechanism. All test cases passed.

    QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
    ./its-pending-migration

    QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm \
    ./its-migration

    QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
    ./its-pending-migration

    QEMU=./qemu.main/build/qemu-system-aarch64 ACCEL=kvm,dirty-ring-size=65536 \
    ./its-migration

(2) Combinations of migration, post-copy migration, e1000e and virtio-net
    devices. All test cases passed.

    -netdev tap,id=net0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown  \
    -device e1000e,bus=pcie.5,netdev=net0,mac=52:54:00:f1:26:a0

    -netdev tap,id=vnet0,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
    -device virtio-net-pci,bus=pcie.6,netdev=vnet0,mac=52:54:00:f1:26:b0

Gavin Shan (8):
  linux-headers: Update for dirty ring
  memory: Add last stage indicator to global dirty log synchronization
  migration: Add last stage indicator to global dirty log
    synchronization
  kvm: Introduce secondary dirty bitmap
  kvm: Synchronize secondary bitmap in last stage
  kvm: Add helper kvm_dirty_ring_init()
  hw/arm/virt: Enable backup bitmap for dirty ring
  kvm: Enable dirty ring for arm64

 accel/kvm/kvm-all.c           | 138 ++++++++++++++++++++++++----------
 hw/arm/virt.c                 |  26 +++++++
 include/exec/memory.h         |   5 +-
 include/sysemu/kvm_int.h      |   1 +
 linux-headers/asm-arm64/kvm.h |   1 +
 linux-headers/linux/kvm.h     |   2 +
 migration/dirtyrate.c         |   4 +-
 migration/ram.c               |  20 ++---
 softmmu/memory.c              |  10 +--
 target/arm/kvm64.c            |  25 ++++++
 target/arm/kvm_arm.h          |  12 +++
 11 files changed, 185 insertions(+), 59 deletions(-)

-- 
2.23.0

