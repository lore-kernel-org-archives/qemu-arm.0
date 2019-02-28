Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp685030wrx;
        Thu, 28 Feb 2019 07:09:04 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYG8GswxwADAWJtenPV/wvdqBwPjVAjmXndDVo5XFXYKTBtyhiSb3CvPVOSpuHZHfLuwPqo
X-Received: by 2002:a81:b712:: with SMTP id v18mr5971437ywh.283.1551366543913;
        Thu, 28 Feb 2019 07:09:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551366543; cv=none;
        d=google.com; s=arc-20160816;
        b=ylRoyliHry1esEa3ziibwgawI3bcK1Ycdxtrmi+9ZR0lorhRqxteXsdTfuMqTAdX9S
         2q0X3FpBztjWatBo7IcZlD3y0DCrqa7qZ9O1RuZLnDkcdtZi2TRMu6VcRkuBwdMD+T9I
         fPBpRYA2MmYHiWc5bazou0RpLDmZuc6jFKXtr0EowHUldey1ZI1Zkzd+kqZ1lQD48W9X
         dhqIzbmVq95XYS67oJPOqfW3T2WeqqfutD4iyGoH85kmF4oZ10qK1882cT3tb+5rP6gq
         n+HkC5AouLDFMPE3cXQCE0Ww/xqRyd7sC2i0eHftAPH9iuUjDhThJ0tdbKkzl8KkTwxA
         ycUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oIE87mZKaXD5BawL9YDuMEUHC+qrw3lgh0NUMbAaGZk=;
        b=HUiAbdfc1uK807ZbgmRR6IsOcjBedKkj+q5oB2WtZIMCnwG24+Gm93E5p98AJxXzBs
         UfEphpLz7eXS/rvCWKe0O4dJXze8tIvYzzpjE0ygJK+7xv2oN+d0pveMBp9KBxAaDGYN
         +8pPce/qtattVHsD/7u3yWjtbdJ55p2U9vZ2vS3gkjoADLgLeo7gSWVH9XvnLdw/odIJ
         SLmz+D1amX/b9N+/7vzihXbkj9HnLo4SudtWIasF61uW0A12OOc2F1P6LqPvbCALQ9CQ
         vf9XCqqHzq2hzUz6bBDzGOXWn79HrmYwbHx62iH8u1A6iVtm4Uj7owlUBVPMMS/V9wlv
         wzyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si10741935ybp.251.2019.02.28.07.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:09:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNJ1-0005Lj-9C
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:09:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNER-0001de-2D
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:04:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEL-000437-0x
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:04:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzNEK-00042n-Oq; Thu, 28 Feb 2019 10:04:12 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE5F030C90DD;
	Thu, 28 Feb 2019 15:04:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E19B19C5B;
	Thu, 28 Feb 2019 15:04:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Thu, 28 Feb 2019 16:03:19 +0100
Message-Id: <20190228150324.25973-6-eric.auger@redhat.com>
In-Reply-To: <20190228150324.25973-1-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 28 Feb 2019 15:04:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v10 05/10] kvm: add kvm_arm_get_max_vm_ipa_size
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QCWQ1Ul68HKp

Add the kvm_arm_get_max_vm_ipa_size() helper that returns the
number of bits in the IPA address space supported by KVM.

This capability needs to be known to create the VM with a
specific IPA max size (kvm_type passed along KVM_CREATE_VM ioctl.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v6 -> v7:
- s/kvm_arm_get_max_vm_phys_shift/kvm_arm_get_max_vm_ipa_size
- reword the comment

v4 -> v5:
- return 40 if the host does not support the capability

v3 -> v4:
- s/s/ms in kvm_arm_get_max_vm_phys_shift function comment
- check KVM_CAP_ARM_VM_IPA_SIZE extension

v1 -> v2:
- put this in ARM specific code
---
 target/arm/kvm.c     | 10 ++++++++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e00ccf9c98..79a79f0190 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -18,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "sysemu/kvm_int.h"
 #include "kvm_arm.h"
 #include "cpu.h"
 #include "trace.h"
@@ -162,6 +163,15 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
     env->features =3D arm_host_cpu_features.features;
 }
=20
+int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
+{
+    KVMState *s =3D KVM_STATE(ms->accelerator);
+    int ret;
+
+    ret =3D kvm_check_extension(s, KVM_CAP_ARM_VM_IPA_SIZE);
+    return ret > 0 ? ret : 40;
+}
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     /* For ARM interrupt delivery is always asynchronous,
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 6393455b1d..2a07333c61 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -207,6 +207,14 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeature=
s *ahcf);
  */
 void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
=20
+/**
+ * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
+ * IPA address space supported by KVM
+ *
+ * @ms: Machine state handle
+ */
+int kvm_arm_get_max_vm_ipa_size(MachineState *ms);
+
 /**
  * kvm_arm_sync_mpstate_to_kvm
  * @cpu: ARMCPU
@@ -239,6 +247,11 @@ static inline void kvm_arm_set_cpu_features_from_hos=
t(ARMCPU *cpu)
     cpu->host_cpu_probe_failed =3D true;
 }
=20
+static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
+{
+    return -ENOENT;
+}
+
 static inline int kvm_arm_vgic_probe(void)
 {
     return 0;
--=20
2.20.1

