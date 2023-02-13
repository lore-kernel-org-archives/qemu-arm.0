Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3999269ejb;
        Sun, 12 Feb 2023 16:40:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/akkvEkVGQ+kw0KtvmlmC5sXToWoqbJANrpltvtfTr+SYC4WPWpsBFARA3CNgcBJNT1xKE
X-Received: by 2002:ad4:5766:0:b0:56e:b5a0:29cc with SMTP id r6-20020ad45766000000b0056eb5a029ccmr459799qvx.32.1676248804798;
        Sun, 12 Feb 2023 16:40:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676248804; cv=none;
        d=google.com; s=arc-20160816;
        b=BnopMHDKJpp6jKNwCKlGAwAxJiq2K83xRmZHwvOMZL5Y3Qz4FI/nDO98MyNgBSB9MQ
         h7AVgAcBsWEj3qCAstPzEedd8AoqslLbQnNJcK47CZAmQa6DsiMd0upETNJeIr9d3J2I
         5tiGYh9UX6wuLThHFDsQYw+oWOxnhXsH0WOcjDnrWWq+zMUMHqSbtUQkLIdRatFKslRZ
         9a/LFq0Wr4vss6YIyxdsLhxjRh9rNN7Qq3EpOAHethlpTqe25al/43iuDBtoXYfhZvXx
         QmqJqBcUslxtullrI/NoG6VcyEPxf4aPHcjPhoUWqFwmNPuizY8ulemErbHP8zTiziTa
         zE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Df4jp6gamqU46w877R8ozW9UXRgdHLovmNlD+4tUQ/0=;
        b=qfb96hMLP2+EZyYMIqwbJZXFwX/1O5PcmHyDaA5JAt5/qRdnVuAiBOdN7pOjHY86Sh
         upxG4f6wjIDVH0OLuhkvU/zZQKuzIjUzQk8IBD9P+u2yNhBnkKTu++rtDX/JaGHl7mzR
         hdc1Pg839DO02i/k4NEs2ItJP671ibSQzhqHNjKatyTpMSATVxNu7tcXQwR+D37iFDny
         kHnaLe8WOyRKHVmk2qLUgb5us6ZVBSnTFO65/7tQuv1Nong3Xql9AAxYEDHvz/6PG8/K
         8gEL6mIOd8g7NBMBH7NTBhcBDiy/aMNAnjD4BzEHKysAdYWJXuU48K69cspjV+UxS1h5
         gNcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWTkx15Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5-20020a0cda85000000b0056eb364bd4bsi660714qvj.203.2023.02.12.16.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 16:40:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LWTkx15Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRMsw-0008Vo-3S; Sun, 12 Feb 2023 19:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMsq-0008VO-Jq
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 19:39:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMso-00030o-8t
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 19:39:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676248788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Df4jp6gamqU46w877R8ozW9UXRgdHLovmNlD+4tUQ/0=;
 b=LWTkx15QtKXExe98rttoQySSduXTlE72Osryi6Asvvuovfh2PjOvJI2yTLA5+FU9vZU19D
 6s0vlAUSL039YSR4i65dlzP7yxcYeYweXBc6EzdoK1I2+2xdYNb9n9DGqhLAn3UQFkum/9
 miax/D5dbp/GwrFu2dSHVVbhuFSArzw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-7v-1nZw6OHOeOPqvsANqEA-1; Sun, 12 Feb 2023 19:39:46 -0500
X-MC-Unique: 7v-1nZw6OHOeOPqvsANqEA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 242D5101A521;
 Mon, 13 Feb 2023 00:39:46 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-114.bne.redhat.com [10.64.54.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88C5C401014C;
 Mon, 13 Feb 2023 00:39:40 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v1 0/6] hw/arm/virt: Support dirty ring
Date: Mon, 13 Feb 2023 08:39:19 +0800
Message-Id: <20230213003925.40158-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-TUID: ZwPfqdhVOghy

This series intends to support dirty ring for live migration. The dirty
ring use discrete buffer to track dirty pages. For ARM64, the speciality
is to use backup bitmap to track dirty pages when there is no-running-vcpu
context. It's known that the backup bitmap needs to be synchronized when
KVM device "kvm-arm-gicv3" or "arm-its-kvm" has been enabled. The backup
bitmap is collected in the last stage of migration.

PATCH[1]    Synchronize linux-headers for dirty ring
PATCH[2]    Introduce indicator of the last stage migration and pass it
            all the way down
PATCH[3]    Synchronize the backup bitmap in the last stage of live migration
PATCH[4]    Introduce helper kvm_dirty_ring_init() to enable the dirty ring
PATCH[5-6]  Enable dirty ring for hw/arm/virt

RFCv1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00171.html

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

Changelog
=========
v1:
  * Combine two patches into one PATCH[v1 2/6] for the last stage indicator    (Peter)
  * Drop the secondary bitmap and use the original one directly                (Juan)
  * Avoid "goto out" in helper kvm_dirty_ring_init()                           (Juan)


Gavin Shan (6):
  linux-headers: Update for dirty ring
  migration: Add last stage indicator to global dirty log
    synchronization
  kvm: Synchronize the backup bitmap in the last stage
  kvm: Add helper kvm_dirty_ring_init()
  hw/arm/virt: Enable backup bitmap for dirty ring
  kvm: Enable dirty ring for arm64

 accel/kvm/kvm-all.c           | 95 ++++++++++++++++++++++++-----------
 hw/arm/virt.c                 | 26 ++++++++++
 include/exec/memory.h         |  5 +-
 include/sysemu/kvm_int.h      |  1 +
 linux-headers/asm-arm64/kvm.h |  1 +
 linux-headers/linux/kvm.h     |  2 +
 migration/dirtyrate.c         |  4 +-
 migration/ram.c               | 20 ++++----
 softmmu/memory.c              | 10 ++--
 target/arm/kvm64.c            | 25 +++++++++
 target/arm/kvm_arm.h          | 12 +++++
 11 files changed, 152 insertions(+), 49 deletions(-)

-- 
2.23.0

