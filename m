Received: by 10.223.159.82 with SMTP id f18csp2158241wrg;
        Fri, 24 Nov 2017 06:18:51 -0800 (PST)
X-Google-Smtp-Source: AGs4zMatQzsMevV4BblotnkzYVTNvgb2eX0Y+zhvlzyJfvCsKW2inCymjpPGqVoQ6fMv2q6YOL5Q
X-Received: by 10.129.117.193 with SMTP id q184mr19293283ywc.195.1511533131098;
        Fri, 24 Nov 2017 06:18:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511533131; cv=none;
        d=google.com; s=arc-20160816;
        b=ZfoUAoihV+xm+M7+28LUTYDrK1MsHvhFO/VmVnAfBkmdZWVmPfDEEk6/rSLRsHyYrk
         k43/3vphrfhUQQ2RbDJPBumBmhETrDlqe2iKtoiGOnqyL7EdVby/z+x3SYRFK5EK3LOc
         qcIonWMJOR+1uzW2MTiPzs1fmB21zrnBnYiuSsbTQaZzt5mNrxOFfjXjDqFjWNl7T/Dd
         KalcyCkSFENQ2o0MhGyXM/KsAtI/MwUIHJuXLnGK6AgeeAM/iD7XtvMHECDeQiVCR6an
         sAs3bkAMUgjZVx2rwxTNxVrvLpqTXOZuaKDirB5vMasrb86oS6UYNgcZYmuupP5AJ+YM
         wO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=YlOiLLOfcEFUzI0ULlm7INEF1DJ15/KhTcEMPDPV0a0=;
        b=ap829UasjoBRdk6dnG3+g/P9jEugt8ovzEvRtzAnPTNmb0pZ1YD8Zf1mbYMVmzTQWl
         0fzZXXWkLkLDM0KduI/zK9mIyHGUWlr7bpM5EYbb7nN3AOkIHAYM146/qgYXoAUrWI2r
         w+Z3roo6pLeXbOm+N2ljEGqCKcs+EbHIY+6w10yesGHMlJlUljNiAsXRo0PrLwrYtwTC
         YqjLGc3TAX690z15UpAdEB6WszDjJQJaEpvBQpfyEhCORvUrz8PqHiB1tHkwR/IKnXks
         fyD97plqzhRk+SPtcxjRXMQiOVwwzlwwcJxIZAjVTT5k0Cp/NcRjFz1VwYuFUk91o3Qv
         YekQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si4767013ywg.382.2017.11.24.06.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 06:18:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIEoc-0005G8-HI
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 09:18:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIEoT-0005G2-1E
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:18:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eIEoO-0001At-IV
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 09:18:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50070)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eIEoO-0001AT-9z; Fri, 24 Nov 2017 09:18:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58DC390901;
	Fri, 24 Nov 2017 14:18:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9214A60465;
	Fri, 24 Nov 2017 14:18:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Fri, 24 Nov 2017 15:18:23 +0100
Message-Id: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 24 Nov 2017 14:18:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 0/4] ITS Reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, wu.wubin@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ak4AOpIeHoSu

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
https://github.com/eauger/qemu/tree/2.11.0-rc2-its-reset-v5

History:
v4 -> v5:
- correct error message in 2/4

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

