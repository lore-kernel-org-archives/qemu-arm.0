Received: by 10.223.159.82 with SMTP id f18csp2104259wrg;
        Fri, 24 Nov 2017 05:33:20 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaPx3S+6J+HTlx0h7JIJLPZ+TU+gj0h0h1/bfYAyxl12ap5EMj4FN9N1kHYtyPeGVg8inTW
X-Received: by 10.129.196.12 with SMTP id j12mr19439937ywi.393.1511530400564;
        Fri, 24 Nov 2017 05:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511530400; cv=none;
        d=google.com; s=arc-20160816;
        b=t1EKa5vn0U7u0lwHoBZgk4e72FaQNuiJyFBqrS0PFXWQ65JI+V/EPPHIRjikEWniUh
         oL9Jk0F8TMh+s8TsdMmhGlT+0aocSDGTGCIVbY/PCgtV2wAzPlDv/6mRkS5+VRKm8CmI
         BqLH61s2vq9ECRGwP9/YyfqZtczwuD+9fglJB2lPCy5GgvQWNAxn8PDTt7Z8wN0xO/Bo
         5yyTNbhiInKML0hBsTcnYwL9wi4Si7N0hxYE3PLxYnbMOy1h0vrGCmxZhoxJIv+Przrl
         E7ZmToKGZl9u2uuC6mvZxNd/vLxGxClfi9q5ttBzqgLXV/zJ8QHSUNJohlsge1B+Wi5R
         /E1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=4YQhHizb9jJ+yy2rhzMncZpYM0oPKHHHDcVAdfgYc/Q=;
        b=noE4YVs1NfLuq20Lsaorj1q2xysqaNKpgBgao7jXwU+yuMzCGcKZIoqCCDSzcSaN7a
         YKfH0GwsRPqIFRY9L7cDrFyM/kOwdm4LW4OkBhOrpiHICW6lNXsleSMYPL7tWtSDGeVz
         PwmnLMVopb/CrLZhQWc7jmPcXu2Ag9hS+cX/yMUiJvFRXEo/30lhvKg6lMadGA1YPgSN
         FOTjvgBUYLMavmeM0xxoDzuWViLTx9TYc3NpjfWYmcPCq5s7raT2VLL0iWERqRmyeZFc
         yvdWnATISoyyLzhC2fDiPslQtZsikoGQfjxJKFdEFEHa6cTy2+WIFikr1yKgyBDKUa1C
         ak7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l29si4979360ybj.53.2017.11.24.05.33.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 05:33:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIE6Z-0002vX-U7
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 08:33:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIE4O-0001bI-MM
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 08:31:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIE4K-0001qT-De
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 08:31:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIE4A-0001oM-TX; Fri, 24 Nov 2017 08:30:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01B1C80B22;
	Fri, 24 Nov 2017 13:30:50 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95A535D6B4;
	Fri, 24 Nov 2017 13:30:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Fri, 24 Nov 2017 14:30:34 +0100
Message-Id: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 24 Nov 2017 13:30:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 0/4] vITS Reset
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, drjones@redhat.com, vijay.kilari@gmail.com,
	quintela@redhat.com, dgilbert@redhat.com, wu.wubin@huawei.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oNF9SDE3S315

At the moment the ITS is not properly reset. On System reset or
reboot, previous ITS register values and caches are left
unchanged. Some of the registers might point to some guest RAM
tables which are not valid anymore. This leads to state
inconsistencies that are detected by the kernel save/restore
code. And eventually this may cause qemu abort.

This series adds vITS reset modality:
- the 2 first patches bring a minimalist reset through individual
  register writes. However, with kernel versions < 4.15, this reset
  is not complete (vITS caches are not voided).
- With kernel versions >= 4.15 we can rely on a new ITS KVM device
  reset IOTCL. The last 2 patches introduce the full reset.

Tested with 4.11, 4.14 and 4.15 host kernels.

Best Regards

Eric

The series is available at:
https://github.com/eauger/qemu/tree/2.11.0-rc2-its-reset-v4

History:
v3 -> v4:
- replace partial linux header update by an exhaustive one

v2 -> v3:
- don't call post_load on reset (no iidr check anymore)

v1 -> v2:
- Clarify why abort should be removed for save. Leave abort
  for restore.
- Adopt the same reset infra as vgic
- introduce "hw/intc/arm_gicv3_its: Implement a minimalist reset"
  which perform individual register writes. This is sufficient to
  fix the issues without ioctl


Eric Auger (4):
  hw/intc/arm_gicv3_its: Don't call post_load on reset
  hw/intc/arm_gicv3_its: Implement a minimalist reset
  linux-headers: update to pre 4.15-rc0
  hw/intc/arm_gicv3_its: Implement full reset

 hw/intc/arm_gicv3_its_common.c                     |   2 -
 hw/intc/arm_gicv3_its_kvm.c                        |  52 ++-
 include/standard-headers/asm-s390/virtio-ccw.h     |   1 +
 include/standard-headers/asm-x86/hyperv.h          | 394 +--------------------
 include/standard-headers/linux/input-event-codes.h |   2 +
 include/standard-headers/linux/input.h             |   1 +
 include/standard-headers/linux/pci_regs.h          |  45 ++-
 linux-headers/asm-arm/kvm.h                        |   8 +
 linux-headers/asm-arm/kvm_para.h                   |   1 +
 linux-headers/asm-arm/unistd.h                     |   2 +
 linux-headers/asm-arm64/kvm.h                      |   8 +
 linux-headers/asm-arm64/unistd.h                   |   1 +
 linux-headers/asm-powerpc/epapr_hcalls.h           |   1 +
 linux-headers/asm-powerpc/kvm.h                    |   1 +
 linux-headers/asm-powerpc/kvm_para.h               |   1 +
 linux-headers/asm-powerpc/unistd.h                 |   1 +
 linux-headers/asm-s390/kvm.h                       |   1 +
 linux-headers/asm-s390/kvm_para.h                  |   1 +
 linux-headers/asm-s390/unistd.h                    |   4 +-
 linux-headers/asm-x86/kvm.h                        |   1 +
 linux-headers/asm-x86/kvm_para.h                   |   2 +-
 linux-headers/asm-x86/unistd.h                     |   1 +
 linux-headers/linux/kvm.h                          |   2 +
 linux-headers/linux/kvm_para.h                     |   1 +
 linux-headers/linux/psci.h                         |   1 +
 linux-headers/linux/userfaultfd.h                  |   1 +
 linux-headers/linux/vfio.h                         |   1 +
 linux-headers/linux/vfio_ccw.h                     |   1 +
 linux-headers/linux/vhost.h                        |   1 +
 29 files changed, 122 insertions(+), 417 deletions(-)

-- 
2.5.5

