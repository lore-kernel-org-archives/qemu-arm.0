Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4254988ejc;
        Sun, 26 Feb 2023 20:29:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/PR/f1IzRjYWyyBp6ndSycPCPWGcS3pJA3qALqcS6LrUgAjCtNCbK2heGA7SoYBS9iudT3
X-Received: by 2002:ad4:4ea7:0:b0:56f:b28f:cc30 with SMTP id ed7-20020ad44ea7000000b0056fb28fcc30mr14807346qvb.4.1677472161867;
        Sun, 26 Feb 2023 20:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677472161; cv=none;
        d=google.com; s=arc-20160816;
        b=EgcTRIS7o/DsIul1irX4ObnmGxgCvORv2OtaMNRXlo+uLAYz8E+DdJz9o/GhHxDuY/
         n4f8mWHN+ctEjrOKExugkLJvrjr1xzC9FSCIqAiD92T+ZpKLcPefYkQtH4uuU1d2VlOg
         iwv1LrBhwSBpBTDPLXVsLnPSAfjCIC0lZ7Pc33z0uRNk8LFJ1IIlEVadq7GaxKjnWjJP
         lpEQFFPOwy4q2dc2Wsvzpc3Znah4n4/o76mkCik9pLea/Mb0RG+Of6rdOGaD4GhDIqXR
         V5zvQxbk4n+CqrCcBB1G1LUAy4YscpFkpbpkMnG35c4ToUYhs62NDhF06BcoRxgmr7J/
         2CEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=U0KN3sj3DqIIHDocTLfGDF5AoIIq0gBYcZdUcBBTzCk=;
        b=U7M/0bkDV7RuNAtTkfBSuUYDQLdaIa7dY9iU9KwGwCNbf4/+JLFDFkU7sDbQ3aYv/3
         4wBCq2Nbj+Fbf/KeI2Y7TDNComfTvWlpmIxiGQwffmtANa+cBMtKDUwcSKQEp9h6A8x2
         Ahe1EgSces7uQbZ4tRRoYe6QpjaC7B4adPZ8AHaqgcyvOvOGd3+Xx9UPK7SJDBOiylI/
         1+h6+W+0u/Ed60G/YraKdH7for0BxFGfKXMQweDA9EKVyccWjcAxuGVqnQK8o4CQP1+n
         TUDVdb3Eo6/Trww1AUOCRkZu40w5xKk6bg5wZegxrAvWdyfEeFBYYjYA0NIoxv0iz7Pe
         JDqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YwFeJH00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a0ce30e000000b0056eefd611d6si5250457qvl.536.2023.02.26.20.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 20:29:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YwFeJH00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWV7l-0002bP-6u; Sun, 26 Feb 2023 23:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pWV7k-0002b6-AY
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 23:28:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pWV7i-0003sP-CA
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 23:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677472104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=U0KN3sj3DqIIHDocTLfGDF5AoIIq0gBYcZdUcBBTzCk=;
 b=YwFeJH00/UfrT6HJqTfT4JD595VwS50Y3xM1y5ovAf9n5ODFpYruYudyICuIevKvK2J32u
 IOmIBepXmPmDN6b5QR4rZFHQJlIyaC8a6sauELdUSUVIJHvOPe/CYWeaNLuRWA+128EmTg
 Zo/5juYaf0FEV+abwo1rKG67BpvWi1k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-Pm9Xa54pNGGrzLYcZp_KTQ-1; Sun, 26 Feb 2023 23:28:21 -0500
X-MC-Unique: Pm9Xa54pNGGrzLYcZp_KTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFEF029AA38A;
 Mon, 27 Feb 2023 04:28:20 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-58.bne.redhat.com [10.64.54.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C2B71121314;
 Mon, 27 Feb 2023 04:28:15 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 0/4] hw/arm/virt: Support dirty ring
Date: Mon, 27 Feb 2023 12:26:25 +0800
Message-Id: <20230227042629.339747-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
X-TUID: h0T0LdxioXHS

This series intends to support dirty ring for live migration for arm64. The
dirty ring use discrete buffer to track dirty pages. For arm64, the speciality
is to use backup bitmap to track dirty pages when there is no-running-vcpu
context. It's known that the backup bitmap needs to be synchronized when
KVM device "kvm-arm-gicv3" or "arm-its-kvm" has been enabled. The backup
bitmap is collected in the last stage of migration. The policy here is to
always enable the backup bitmap extension. The overhead to synchronize the
backup bitmap in the last stage of migration, when those two devices aren't
used, is introduced. However, the overhead should be very small and acceptable.
The benefit is to support future cases where those two devices are used without
modifying the code.

PATCH[1] add migration last stage indicator
PATCH[2] synchronize the backup bitmap in the last stage of migration
PATCH[3] add helper kvm_dirty_ring_init() to enable dirty ring
PATCH[4] enable dirty ring for arm64

   v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-02/msg00434.html
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
v2:
  * Drop PATCH[v1 1/6] to synchronize linux-headers                            (Gavin)
  * More restrictive comments about struct MemoryListener::log_sync_global     (PeterX)
  * Always enable the backup bitmap extension                                  (PeterM)
v1:
  * Combine two patches into one PATCH[v1 2/6] for the last stage indicator    (PeterX)
  * Drop the secondary bitmap and use the original one directly                (Juan)
  * Avoid "goto out" in helper kvm_dirty_ring_init()                           (Juan)


Gavin Shan (4):
  migration: Add last stage indicator to global dirty log
    synchronization
  kvm: Synchronize the backup bitmap in the last stage
  kvm: Add helper kvm_dirty_ring_init()
  kvm: Enable dirty ring for arm64

 accel/kvm/kvm-all.c      | 108 ++++++++++++++++++++++++++++-----------
 include/exec/memory.h    |   7 ++-
 include/sysemu/kvm_int.h |   1 +
 migration/dirtyrate.c    |   4 +-
 migration/ram.c          |  20 ++++----
 softmmu/memory.c         |  10 ++--
 6 files changed, 101 insertions(+), 49 deletions(-)

-- 
2.23.0

