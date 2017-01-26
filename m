Received: by 10.25.77.65 with SMTP id a62csp111798lfb;
        Thu, 26 Jan 2017 01:20:27 -0800 (PST)
X-Received: by 10.237.33.185 with SMTP id l54mr1608427qtc.111.1485422427862;
        Thu, 26 Jan 2017 01:20:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w58si686326qtc.245.2017.01.26.01.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 01:20:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWgED-0004HH-A5
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 04:20:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWgE0-0004EC-Lv
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:20:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWgDz-0003oX-M2
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:20:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cWgDz-0003oA-EY; Thu, 26 Jan 2017 04:20:11 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E2137F368;
	Thu, 26 Jan 2017 09:20:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0Q9K4vX003187; Thu, 26 Jan 2017 04:20:08 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Date: Thu, 26 Jan 2017 10:19:38 +0100
Message-Id: <1485422381-29019-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 26 Jan 2017 09:20:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 1/4] linux-headers: Partial update for vITS
 save/restore
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
	dgilbert@redhat.com, peterx@redhat.com, Vijaya.Kumar@cavium.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WeioVzEgNIB5

This is a partial update aiming at enhancing the KVM user
API with vITS save/restore capability. This consists in two
new groups for the ARM_VGIC_ITS KVM device, named:
KVM_DEV_ARM_VGIC_GRP_ITS_REGS, KVM_DEV_ARM_VGIC_GRP_ITS_TABLES.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
The goal is to import KVM_DEV_ARM_VGIC_GRP_ITS_REGS. Applying
scripts/update-linux-headers.sh pulls other diffs and especially
a rename of KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS into
KVM_DEV_ARM_VGIC_CPU_SYSREGS.

Conflicts:
	linux-headers/asm-arm/kvm.h
---
 linux-headers/asm-arm/kvm.h   | 25 +++++++++++++++++++------
 linux-headers/asm-arm64/kvm.h | 14 +++++++++-----
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/linux-headers/asm-arm/kvm.h b/linux-headers/asm-arm/kvm.h
index e3dd0e1..84fdfb0 100644
--- a/linux-headers/asm-arm/kvm.h
+++ b/linux-headers/asm-arm/kvm.h
@@ -84,6 +84,15 @@ struct kvm_regs {
 #define KVM_VGIC_V2_DIST_SIZE		0x1000
 #define KVM_VGIC_V2_CPU_SIZE		0x2000
 
+/* Supported VGICv3 address types  */
+#define KVM_VGIC_V3_ADDR_TYPE_DIST	2
+#define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
+#define KVM_VGIC_ITS_ADDR_TYPE		4
+
+#define KVM_VGIC_V3_DIST_SIZE		SZ_64K
+#define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
+#define KVM_VGIC_V3_ITS_SIZE		(2 * SZ_64K)
+
 #define KVM_ARM_VCPU_POWER_OFF		0 /* CPU is started in OFF state */
 #define KVM_ARM_VCPU_PSCI_0_2		1 /* CPU uses PSCI v0.2 */
 
@@ -174,20 +183,22 @@ struct kvm_arch_memory_slot {
 #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
 #define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
 #define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
-                       (0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
+			(0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
 #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
 #define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
 #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
 #define KVM_DEV_ARM_VGIC_GRP_CTRL       4
 #define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
-#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
+#define KVM_DEV_ARM_VGIC_CPU_SYSREGS    6
 #define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
-#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 10
+#define KVM_DEV_ARM_VGIC_GRP_ITS_REGS	8
+#define KVM_DEV_ARM_VGIC_GRP_ITS_TABLES	9
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
-                       (0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
-#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
-#define VGIC_LEVEL_INFO_LINE_LEVEL     0
+			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK	0x3ff
+#define VGIC_LEVEL_INFO_LINE_LEVEL	0
 
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT    0
 
@@ -213,7 +224,9 @@ struct kvm_arch_memory_slot {
  * and only here to provide source code level compatibility with older
  * userland. The highest SPI number can be set via KVM_DEV_ARM_VGIC_GRP_NR_IRQS.
  */
+#ifndef __KERNEL__
 #define KVM_ARM_IRQ_GIC_MAX		127
+#endif
 
 /* One single KVM irqchip, ie. the VGIC */
 #define KVM_NR_IRQCHIPS          1
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 6698bdd..31e1137 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -203,19 +203,21 @@ struct kvm_arch_memory_slot {
 #define   KVM_DEV_ARM_VGIC_CPUID_MASK	(0xffULL << KVM_DEV_ARM_VGIC_CPUID_SHIFT)
 #define   KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT 32
 #define   KVM_DEV_ARM_VGIC_V3_MPIDR_MASK \
-                       (0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
+			(0xffffffffULL << KVM_DEV_ARM_VGIC_V3_MPIDR_SHIFT)
 #define   KVM_DEV_ARM_VGIC_OFFSET_SHIFT	0
 #define   KVM_DEV_ARM_VGIC_OFFSET_MASK	(0xffffffffULL << KVM_DEV_ARM_VGIC_OFFSET_SHIFT)
 #define   KVM_DEV_ARM_VGIC_SYSREG_INSTR_MASK (0xffff)
 #define KVM_DEV_ARM_VGIC_GRP_NR_IRQS	3
 #define KVM_DEV_ARM_VGIC_GRP_CTRL	4
 #define KVM_DEV_ARM_VGIC_GRP_REDIST_REGS 5
-#define KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS 6
+#define KVM_DEV_ARM_VGIC_CPU_SYSREGS    6
 #define KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO 7
-#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT 10
+#define KVM_DEV_ARM_VGIC_GRP_ITS_REGS 8
+#define KVM_DEV_ARM_VGIC_GRP_ITS_TABLES 9
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT	10
 #define KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_MASK \
-                       (0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
-#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK 0x3ff
+			(0x3fffffULL << KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT)
+#define KVM_DEV_ARM_VGIC_LINE_LEVEL_INTID_MASK	0x3ff
 #define VGIC_LEVEL_INFO_LINE_LEVEL	0
 
 #define   KVM_DEV_ARM_VGIC_CTRL_INIT	0
@@ -247,7 +249,9 @@ struct kvm_arch_memory_slot {
  * and only here to provide source code level compatibility with older
  * userland. The highest SPI number can be set via KVM_DEV_ARM_VGIC_GRP_NR_IRQS.
  */
+#ifndef __KERNEL__
 #define KVM_ARM_IRQ_GIC_MAX		127
+#endif
 
 /* One single KVM irqchip, ie. the VGIC */
 #define KVM_NR_IRQCHIPS          1
-- 
2.5.5

