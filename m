Received: by 10.223.150.237 with SMTP id u100csp3629467wrb;
        Fri, 10 Nov 2017 03:15:01 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RCMAQHc7BFvWLInKiTf+Fnfzr1bypcp3ogEaQwNSrUM1TCwBzBJllClNVWrlDf6mHZyJX1
X-Received: by 10.84.176.163 with SMTP id v32mr3936890plb.175.1510312501851;
        Fri, 10 Nov 2017 03:15:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312501; cv=none;
        d=google.com; s=arc-20160816;
        b=QRVFYdTZgmUCPDdajQQMOkJRI8zbMIdWWCxokwTn/eEDIr/txWc3SgTVJVyU1Y6lmr
         Lvq8O/gxbxKCK1KVd4OJcBBw9oNtsn0tK2qvYov5uC9sHi2yxrwVjbr7Y2JeUH6nbXru
         Db4vuI6K64rWU8XL3SN+fdMu4ATmTV8hkD2rVZQAXCh2yV4tmGpKvCkAVKylybQzAJzS
         BR1jJFEx2aqFD8gRt60n0mRHFIEmThdfmjVXXUnsHwfDJuFl2N43qabp9jRgY1n61ZFc
         hlOgYLrleI0ewee/sxUr5JM/2YWxOx2hoU1SqUE93D5hewJ3vfJdD3Qr99ZVYQIiFRB9
         uTzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=DFfvA7Frbd3+GPwO40HHqImBWAi004rhZajQ9tgZtAQ=;
        b=vVKbkdQPxiABLYkZit1mTTOON+/FCDKHxszUX8KFIWE8nUgCtYGQ52MqUW7vgG7sJI
         uvTGJgHxQHEjlNej6e+DEFRPDuOuY6LihtJK1/pBSZH2NLID0FHE2TdekDvdo+ZNWDhN
         cLGt7Mfp4B1ktTjLlFpq/COBHX20IFdmGI70iBg+goyPgQZZLFToFVXACdFWYW4KHs0q
         mpLg5nn8EnCGDVNfS9iLA/0aeJkc2U0F3ATu4aA2iTQWEA6QeOdRK9fcQi/94F3DrPE9
         uo7CtThvVQmfIJVMzYx2bdRlYRsgfb5e2cSoOW99cmB3S59VX4oZYLyCZRfICcdmCO0f
         SHrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.15.01;
        Fri, 10 Nov 2017 03:15:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753056AbdKJLO7 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:59 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10438 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752933AbdKJLO5 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:57 -0500
Received: from 172.30.72.58 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKO46194;
        Fri, 10 Nov 2017 19:14:10 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:14:02 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v12 05/12] linux-headers: sync against Linux v4.14-rc8
Date:   Sat, 11 Nov 2017 03:19:44 +0800
Message-ID: <1510341591-22817-6-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090203.5A058A05.00BF,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f215c6c5b5a61944770d34b51d2a57ad
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: tikRQmEITTAa

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

---
Suggested by here:
https://lkml.org/lkml/2017/9/5/575

---
 include/standard-headers/asm-s390/kvm_virtio.h     | 1 +
 include/standard-headers/asm-s390/virtio-ccw.h     | 1 +
 include/standard-headers/asm-x86/hyperv.h          | 1 +
 include/standard-headers/linux/input-event-codes.h | 1 +
 include/standard-headers/linux/input.h             | 1 +
 include/standard-headers/linux/pci_regs.h          | 1 +
 linux-headers/asm-arm/kvm.h                        | 1 +
 linux-headers/asm-arm/kvm_para.h                   | 1 +
 linux-headers/asm-arm/unistd.h                     | 1 +
 linux-headers/asm-arm64/kvm.h                      | 1 +
 linux-headers/asm-arm64/unistd.h                   | 1 +
 linux-headers/asm-powerpc/epapr_hcalls.h           | 1 +
 linux-headers/asm-powerpc/kvm.h                    | 1 +
 linux-headers/asm-powerpc/kvm_para.h               | 1 +
 linux-headers/asm-powerpc/unistd.h                 | 1 +
 linux-headers/asm-s390/kvm.h                       | 1 +
 linux-headers/asm-s390/kvm_para.h                  | 1 +
 linux-headers/asm-s390/unistd.h                    | 1 +
 linux-headers/asm-x86/kvm.h                        | 1 +
 linux-headers/asm-x86/kvm_para.h                   | 1 +
 linux-headers/asm-x86/unistd.h                     | 1 +
 linux-headers/linux/kvm.h                          | 4 ++++
 linux-headers/linux/kvm_para.h                     | 1 +
 linux-headers/linux/psci.h                         | 1 +
 linux-headers/linux/userfaultfd.h                  | 1 +
 linux-headers/linux/vfio.h                         | 1 +
 linux-headers/linux/vfio_ccw.h                     | 1 +
 linux-headers/linux/vhost.h                        | 1 +
 28 files changed, 31 insertions(+)

diff --git a/include/standard-headers/asm-s390/kvm_virtio.h b/include/standard-headers/asm-s390/kvm_virtio.h
index daad324..4af18ca 100644
--- a/include/standard-headers/asm-s390/kvm_virtio.h
+++ b/include/standard-headers/asm-s390/kvm_virtio.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * definition for virtio for kvm on s390
  *
diff --git a/include/standard-headers/asm-s390/virtio-ccw.h b/include/standard-headers/asm-s390/virtio-ccw.h
index a9a4ebf..967aad3 100644
--- a/include/standard-headers/asm-s390/virtio-ccw.h
+++ b/include/standard-headers/asm-s390/virtio-ccw.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * Definitions for virtio-ccw devices.
  *
diff --git a/include/standard-headers/asm-x86/hyperv.h b/include/standard-headers/asm-x86/hyperv.h
index fac7651..2c8a3ff 100644
--- a/include/standard-headers/asm-x86/hyperv.h
+++ b/include/standard-headers/asm-x86/hyperv.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _ASM_X86_HYPERV_H
 #define _ASM_X86_HYPERV_H
 
diff --git a/include/standard-headers/linux/input-event-codes.h b/include/standard-headers/linux/input-event-codes.h
index 2fa0f4e..7cc0fcb 100644
--- a/include/standard-headers/linux/input-event-codes.h
+++ b/include/standard-headers/linux/input-event-codes.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * Input event codes
  *
diff --git a/include/standard-headers/linux/input.h b/include/standard-headers/linux/input.h
index 666e201..bc3e6d3 100644
--- a/include/standard-headers/linux/input.h
+++ b/include/standard-headers/linux/input.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * Copyright (c) 1999-2002 Vojtech Pavlik
  *
diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
index c22d3eb..92500c3 100644
--- a/include/standard-headers/linux/pci_regs.h
+++ b/include/standard-headers/linux/pci_regs.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  *	pci_regs.h
  *
diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index fa9fae8..17ffa87 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * Copyright (C) 2012 - Virtual Open Systems and Columbia University
  * Author: Christoffer Dall <c.dall@virtualopensystems.com>
diff --git a/linux-headers/asm-arm/kvm_para.h b/linux-headers/asm-arm/kvm_para.h
index 14fab8f..baacc49 100644
--- a/linux-headers/asm-arm/kvm_para.h
+++ b/linux-headers/asm-arm/kvm_para.h
@@ -1 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #include <asm-generic/kvm_para.h>
diff --git a/linux-headers/asm-arm/unistd.h b/linux-headers/asm-arm/unistd.h
index 155571b..8ee6d25 100644
--- a/linux-headers/asm-arm/unistd.h
+++ b/linux-headers/asm-arm/unistd.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  *  arch/arm/include/asm/unistd.h
  *
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index d254700..2c79c6f 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * Copyright (C) 2012,2013 - ARM Ltd
  * Author: Marc Zyngier <marc.zyngier@arm.com>
diff --git a/linux-headers/asm-arm64/unistd.h b/linux-headers/asm-arm64/unistd.h
index 043d17a..5072cbd 100644
--- a/linux-headers/asm-arm64/unistd.h
+++ b/linux-headers/asm-arm64/unistd.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * Copyright (C) 2012 ARM Ltd.
  *
diff --git a/linux-headers/asm-powerpc/epapr_hcalls.h b/linux-headers/asm-powerpc/epapr_hcalls.h
index 33b3f89..6cca559 100644
--- a/linux-headers/asm-powerpc/epapr_hcalls.h
+++ b/linux-headers/asm-powerpc/epapr_hcalls.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3-Clause) */
 /*
  * ePAPR hcall interface
  *
diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kvm.h
index 8cf8f0c..61d6049 100644
--- a/linux-headers/asm-powerpc/kvm.h
+++ b/linux-headers/asm-powerpc/kvm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License, version 2, as
diff --git a/linux-headers/asm-powerpc/kvm_para.h b/linux-headers/asm-powerpc/kvm_para.h
index 2abcc46..9beb49c 100644
--- a/linux-headers/asm-powerpc/kvm_para.h
+++ b/linux-headers/asm-powerpc/kvm_para.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License, version 2, as
diff --git a/linux-headers/asm-powerpc/unistd.h b/linux-headers/asm-powerpc/unistd.h
index a178634..36abf58 100644
--- a/linux-headers/asm-powerpc/unistd.h
+++ b/linux-headers/asm-powerpc/unistd.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
 /*
  * This file contains the system call numbers.
  *
diff --git a/linux-headers/asm-s390/kvm.h b/linux-headers/asm-s390/kvm.h
index 8387d71..a0ed5b7 100644
--- a/linux-headers/asm-s390/kvm.h
+++ b/linux-headers/asm-s390/kvm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef __LINUX_KVM_S390_H
 #define __LINUX_KVM_S390_H
 /*
diff --git a/linux-headers/asm-s390/kvm_para.h b/linux-headers/asm-s390/kvm_para.h
index ff1f4e7..0dc86b3 100644
--- a/linux-headers/asm-s390/kvm_para.h
+++ b/linux-headers/asm-s390/kvm_para.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * User API definitions for paravirtual devices on s390
  *
diff --git a/linux-headers/asm-s390/unistd.h b/linux-headers/asm-s390/unistd.h
index 65e7e59..4deb1fe 100644
--- a/linux-headers/asm-s390/unistd.h
+++ b/linux-headers/asm-s390/unistd.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  *  S390 version
  *
diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index c2824d0..f3a9604 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _ASM_X86_KVM_H
 #define _ASM_X86_KVM_H
 
diff --git a/linux-headers/asm-x86/kvm_para.h b/linux-headers/asm-x86/kvm_para.h
index cefa127..ba3d11e 100644
--- a/linux-headers/asm-x86/kvm_para.h
+++ b/linux-headers/asm-x86/kvm_para.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _ASM_X86_KVM_PARA_H
 #define _ASM_X86_KVM_PARA_H
 
diff --git a/linux-headers/asm-x86/unistd.h b/linux-headers/asm-x86/unistd.h
index 1f99b12..c04f638 100644
--- a/linux-headers/asm-x86/unistd.h
+++ b/linux-headers/asm-x86/unistd.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _ASM_X86_UNISTD_H
 #define _ASM_X86_UNISTD_H
 
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 7971a4f..0d6d52c 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef __LINUX_KVM_H
 #define __LINUX_KVM_H
 
@@ -929,6 +930,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SMT_POSSIBLE 147
 #define KVM_CAP_HYPERV_SYNIC2 148
 #define KVM_CAP_HYPERV_VP_INDEX 149
+#define KVM_CAP_ARM_INJECT_SERROR_ESR 150
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1355,6 +1357,8 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_S390_CMMA_MIGRATION */
 #define KVM_S390_GET_CMMA_BITS      _IOWR(KVMIO, 0xb8, struct kvm_s390_cmma_log)
 #define KVM_S390_SET_CMMA_BITS      _IOW(KVMIO, 0xb9, struct kvm_s390_cmma_log)
+/* Available with KVM_CAP_ARM_INJECT_SERROR_ESR */
+#define KVM_ARM_INJECT_SERROR_ESR       _IOW(KVMIO,  0xba, __u32)
 
 #define KVM_DEV_ASSIGN_ENABLE_IOMMU	(1 << 0)
 #define KVM_DEV_ASSIGN_PCI_2_3		(1 << 1)
diff --git a/linux-headers/linux/kvm_para.h b/linux-headers/linux/kvm_para.h
index 15b24ff..8bcd0aa 100644
--- a/linux-headers/linux/kvm_para.h
+++ b/linux-headers/linux/kvm_para.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef __LINUX_KVM_PARA_H
 #define __LINUX_KVM_PARA_H
 
diff --git a/linux-headers/linux/psci.h b/linux-headers/linux/psci.h
index 08d443f..ccd1773 100644
--- a/linux-headers/linux/psci.h
+++ b/linux-headers/linux/psci.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * ARM Power State and Coordination Interface (PSCI) header
  *
diff --git a/linux-headers/linux/userfaultfd.h b/linux-headers/linux/userfaultfd.h
index 9701772..f7fd160 100644
--- a/linux-headers/linux/userfaultfd.h
+++ b/linux-headers/linux/userfaultfd.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  *  include/linux/userfaultfd.h
  *
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 4e7ab4c..4312e96 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * VFIO API definition
  *
diff --git a/linux-headers/linux/vfio_ccw.h b/linux-headers/linux/vfio_ccw.h
index 3a56551..5bf96c3 100644
--- a/linux-headers/linux/vfio_ccw.h
+++ b/linux-headers/linux/vfio_ccw.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * Interfaces for vfio-ccw
  *
diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
index 1e86a3d..e336395 100644
--- a/linux-headers/linux/vhost.h
+++ b/linux-headers/linux/vhost.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _LINUX_VHOST_H
 #define _LINUX_VHOST_H
 /* Userspace interface for in-kernel virtio accelerators. */
-- 
1.8.3.1
