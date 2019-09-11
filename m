Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1033471wrp;
        Wed, 11 Sep 2019 08:52:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbf5T5URxbh7GrqqjiJsa/XuZpe4TKT/uCzIFTaPCphB22EASHuux/NOSJpX/UIWYCiom0
X-Received: by 2002:a17:906:1d11:: with SMTP id n17mr30678167ejh.68.1568217178369;
        Wed, 11 Sep 2019 08:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568217178; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvgW83dx5ZkaIwkCs0jO1WybTHUA8LDnZ2uFJn/ilDTsbZ45ddj7Cw2LdA0RxrtSIM
         /nZ8oIY4pePf+/MlNOdJAqJ/wxLPdjETkpwNYc3IwNIVhbad1E8tCcbIN7ybg/5qDMpK
         YBrgHYpvueuFD4YBX5syOC8TxJLTKcUpBEwA2MRKmxl6uq7cYzwyyigG8UdqW1mKhp9c
         oWXQedJ8jcCpldqJRoOrzVZJriLOMnWsGq+l1FjqqUHXc/TUF1/fq63V3/+VeHXn0hsJ
         M3y7Qs0zUJmMnNRrq4MkzDKuDI0QynY5fQqSE06QGPreVsLJktr3W5Su1SwZF2/XCFYk
         iIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=jK1NDxcmxoKmiez8HqSYx3CbAZD9ZZWDDJpTkK8T83c=;
        b=WUvoGEjhKKvnqGipnvsFg12FqdFrH4EeL0zLQgIYOYvjYXiedPEWGnTMG7OmOcemGB
         ZbCub3IOZYm7TAVNuSJopdWRRXxLm2KP/kI58VGoFKMHfPPktHHpQDvAQPFltucjMHi+
         PBCEouBb2yfe+OBVYp9isA3sjK40r9o+5izB2fNzdkd2Wnt/dfD5oG+sBVF+Rjn2BJQV
         qm7NJkf87vKtCdLhIMBeE2r5VZ1XVmBFXvmczytIPMrO64m+JY9AX9iK70UHy63qAxFE
         ijqnu0LOQ9/S1bia9nq6OF0e2yE3TZQEHoTZn8C4wlSWe/nw2kHuoll15x12dTNqoht2
         EdSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si6579997ejj.24.2019.09.11.08.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 08:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i84vQ-0002ih-Hm
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 11:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i84uG-0002Gq-9x
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 11:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i84uE-00035w-NC
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 11:51:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50088)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i84uE-00035N-3z; Wed, 11 Sep 2019 11:51:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6DA4B10CC1F1;
 Wed, 11 Sep 2019 15:51:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-168.ams2.redhat.com [10.36.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1304E60872;
 Wed, 11 Sep 2019 15:51:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 11 Sep 2019 17:51:24 +0200
Message-Id: <20190911155125.11932-3-eric.auger@redhat.com>
In-Reply-To: <20190911155125.11932-1-eric.auger@redhat.com>
References: <20190911155125.11932-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Wed, 11 Sep 2019 15:51:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 2/3] intc/arm_gic: Support IRQ injection for
 more than 256 vpus
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O+lvgXKxngHc

Host kernels that expose the KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 capability
allow injection of interrupts along with vcpu ids larger than 255.
Let's encode the vpcu id on 12 bits according to the upgraded KVM_IRQ_LIN=
E
ABI when needed.

Given that we have two callsites that need to assemble
the value for kvm_set_irq(), a new helper routine, kvm_arm_set_irq
is introduced.

Without that patch qemu exits with "kvm_set_irq: Invalid argument"
message.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/intc/arm_gic_kvm.c |  7 ++-----
 target/arm/cpu.c      | 10 ++++------
 target/arm/kvm.c      | 16 ++++++++++++++++
 target/arm/kvm_arm.h  |  1 +
 4 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index b56fda144f..9deb15e7e6 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -55,7 +55,7 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int=
 level)
      * has separate fields in the irq number for type,
      * CPU number and interrupt number.
      */
-    int kvm_irq, irqtype, cpu;
+    int irqtype, cpu;
=20
     if (irq < (num_irq - GIC_INTERNAL)) {
         /* External interrupt. The kernel numbers these like the GIC
@@ -72,10 +72,7 @@ void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, in=
t level)
         cpu =3D irq / GIC_INTERNAL;
         irq %=3D GIC_INTERNAL;
     }
-    kvm_irq =3D (irqtype << KVM_ARM_IRQ_TYPE_SHIFT)
-        | (cpu << KVM_ARM_IRQ_VCPU_SHIFT) | irq;
-
-    kvm_set_irq(kvm_state, kvm_irq, !!level);
+    kvm_arm_set_irq(cpu, irqtype, irq, !!level);
 }
=20
 static void kvm_arm_gicv2_set_irq(void *opaque, int irq, int level)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2399c14471..13813fb213 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -576,16 +576,16 @@ static void arm_cpu_kvm_set_irq(void *opaque, int i=
rq, int level)
     ARMCPU *cpu =3D opaque;
     CPUARMState *env =3D &cpu->env;
     CPUState *cs =3D CPU(cpu);
-    int kvm_irq =3D KVM_ARM_IRQ_TYPE_CPU << KVM_ARM_IRQ_TYPE_SHIFT;
     uint32_t linestate_bit;
+    int irq_id;
=20
     switch (irq) {
     case ARM_CPU_IRQ:
-        kvm_irq |=3D KVM_ARM_IRQ_CPU_IRQ;
+        irq_id =3D KVM_ARM_IRQ_CPU_IRQ;
         linestate_bit =3D CPU_INTERRUPT_HARD;
         break;
     case ARM_CPU_FIQ:
-        kvm_irq |=3D KVM_ARM_IRQ_CPU_FIQ;
+        irq_id =3D KVM_ARM_IRQ_CPU_FIQ;
         linestate_bit =3D CPU_INTERRUPT_FIQ;
         break;
     default:
@@ -597,9 +597,7 @@ static void arm_cpu_kvm_set_irq(void *opaque, int irq=
, int level)
     } else {
         env->irq_line_state &=3D ~linestate_bit;
     }
-
-    kvm_irq |=3D cs->cpu_index << KVM_ARM_IRQ_VCPU_SHIFT;
-    kvm_set_irq(kvm_state, kvm_irq, level ? 1 : 0);
+    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level=
);
 #endif
 }
=20
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b2eaa50b8d..6cdfa2204f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -744,6 +744,22 @@ int kvm_arm_vgic_probe(void)
     }
 }
=20
+int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level)
+{
+    int kvm_irq =3D 0;
+
+    kvm_irq =3D (irqtype << KVM_ARM_IRQ_TYPE_SHIFT) | irq;
+
+    if (cpu !=3D 0) {
+        int cpu_idx2 =3D cpu / 256;
+        int cpu_idx1 =3D cpu % 256;
+
+        kvm_irq |=3D (cpu_idx1 << KVM_ARM_IRQ_VCPU_SHIFT) |
+           ((cpu_idx2 & KVM_ARM_IRQ_VCPU2_MASK) << KVM_ARM_IRQ_VCPU2_SHI=
FT);
+    }
+    return kvm_set_irq(kvm_state, kvm_irq, !!level);
+}
+
 int kvm_arch_fixup_msi_route(struct kvm_irq_routing_entry *route,
                              uint64_t address, uint32_t data, PCIDevice =
*dev)
 {
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b3106c8600..b4e19457a0 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -253,6 +253,7 @@ int kvm_arm_vgic_probe(void);
=20
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
 void kvm_arm_pmu_init(CPUState *cs);
+int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
=20
 #else
=20
--=20
2.20.1

