Received: by 10.25.21.96 with SMTP id l93csp753376lfi;
        Wed, 6 Jul 2016 02:46:51 -0700 (PDT)
X-Received: by 10.55.58.6 with SMTP id h6mr7982483qka.185.1467798411762;
        Wed, 06 Jul 2016 02:46:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h3si1938559qkf.92.2016.07.06.02.46.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jul 2016 02:46:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKjPv-0000ry-2r
	for alex.bennee@linaro.org; Wed, 06 Jul 2016 05:46:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bKjPh-0000Q8-BU
	for qemu-arm@nongnu.org; Wed, 06 Jul 2016 05:46:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bKjPg-000730-3m
	for qemu-arm@nongnu.org; Wed, 06 Jul 2016 05:46:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37224)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bKjPf-00071h-SJ; Wed, 06 Jul 2016 05:46:36 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F271AD7E4D;
	Wed,  6 Jul 2016 09:46:34 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-6-81.ams2.redhat.com
	[10.36.6.81])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u669kPEI013861; Wed, 6 Jul 2016 05:46:32 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Wed,  6 Jul 2016 11:46:01 +0200
Message-Id: <1467798364-9049-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
References: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 06 Jul 2016 09:46:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 3/6] linux-headers: update to 4.7-rc6 + ITS
 emulation and GSI routing
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
Cc: diana.craciun@freescale.com, shlomopongratz@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 42v6ZPmuu/x1

From: Pavel Fedin <p.fedin@samsung.com>

Linux header update for in-kernel ITS emulation and KVM MSI routing.

The kernel can be found at
https://github.com/eauger/linux/tree/v4.7-rc6-its-emul-v7-gsi-routing-v5

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- upgrade
---
 include/standard-headers/linux/input-event-codes.h | 31 ++++++++++++++++++++++
 include/standard-headers/linux/input.h             |  1 +
 linux-headers/asm-arm64/kvm.h                      |  2 ++
 linux-headers/linux/kvm.h                          | 12 +++++++--
 4 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/include/standard-headers/linux/input-event-codes.h b/include/standard-headers/linux/input-event-codes.h
index 354f0de..1f33521 100644
--- a/include/standard-headers/linux/input-event-codes.h
+++ b/include/standard-headers/linux/input-event-codes.h
@@ -611,6 +611,37 @@
 #define KEY_KBDINPUTASSIST_ACCEPT		0x264
 #define KEY_KBDINPUTASSIST_CANCEL		0x265
 
+/* Diagonal movement keys */
+#define KEY_RIGHT_UP			0x266
+#define KEY_RIGHT_DOWN			0x267
+#define KEY_LEFT_UP			0x268
+#define KEY_LEFT_DOWN			0x269
+
+#define KEY_ROOT_MENU			0x26a /* Show Device's Root Menu */
+/* Show Top Menu of the Media (e.g. DVD) */
+#define KEY_MEDIA_TOP_MENU		0x26b
+#define KEY_NUMERIC_11			0x26c
+#define KEY_NUMERIC_12			0x26d
+/*
+ * Toggle Audio Description: refers to an audio service that helps blind and
+ * visually impaired consumers understand the action in a program. Note: in
+ * some countries this is referred to as "Video Description".
+ */
+#define KEY_AUDIO_DESC			0x26e
+#define KEY_3D_MODE			0x26f
+#define KEY_NEXT_FAVORITE		0x270
+#define KEY_STOP_RECORD			0x271
+#define KEY_PAUSE_RECORD		0x272
+#define KEY_VOD				0x273 /* Video on Demand */
+#define KEY_UNMUTE			0x274
+#define KEY_FASTREVERSE			0x275
+#define KEY_SLOWREVERSE			0x276
+/*
+ * Control a data application associated with the currently viewed channel,
+ * e.g. teletext or data broadcast application (MHEG, MHP, HbbTV, etc.)
+ */
+#define KEY_DATA			0x275
+
 #define BTN_TRIGGER_HAPPY		0x2c0
 #define BTN_TRIGGER_HAPPY1		0x2c0
 #define BTN_TRIGGER_HAPPY2		0x2c1
diff --git a/include/standard-headers/linux/input.h b/include/standard-headers/linux/input.h
index a52b202..7361a16 100644
--- a/include/standard-headers/linux/input.h
+++ b/include/standard-headers/linux/input.h
@@ -244,6 +244,7 @@ struct input_mask {
 #define BUS_ATARI		0x1B
 #define BUS_SPI			0x1C
 #define BUS_RMI			0x1D
+#define BUS_CEC			0x1E
 
 /*
  * MT_TOOL types
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 7d82d1f..dc6f750 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -87,9 +87,11 @@ struct kvm_regs {
 /* Supported VGICv3 address types  */
 #define KVM_VGIC_V3_ADDR_TYPE_DIST	2
 #define KVM_VGIC_V3_ADDR_TYPE_REDIST	3
+#define KVM_VGIC_ITS_ADDR_TYPE		4
 
 #define KVM_VGIC_V3_DIST_SIZE		SZ_64K
 #define KVM_VGIC_V3_REDIST_SIZE		(2 * SZ_64K)
+#define KVM_VGIC_V3_ITS_SIZE		SZ_64K
 
 #define KVM_ARM_VCPU_POWER_OFF		0 /* CPU is started in OFF state */
 #define KVM_ARM_VCPU_EL1_32BIT		1 /* CPU running a 32bit VM */
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index e60e21b..37c05e2 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -866,6 +866,7 @@ struct kvm_ppc_smmu_info {
 #define KVM_CAP_ARM_PMU_V3 126
 #define KVM_CAP_VCPU_ATTRIBUTES 127
 #define KVM_CAP_MAX_VCPU_ID 128
+#define KVM_CAP_MSI_DEVID 129
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -878,7 +879,10 @@ struct kvm_irq_routing_msi {
 	__u32 address_lo;
 	__u32 address_hi;
 	__u32 data;
-	__u32 pad;
+	union {
+		__u32 pad;
+		__u32 devid;
+	};
 };
 
 struct kvm_irq_routing_s390_adapter {
@@ -1024,12 +1028,14 @@ struct kvm_one_reg {
 	__u64 addr;
 };
 
+#define KVM_MSI_VALID_DEVID	(1U << 0)
 struct kvm_msi {
 	__u32 address_lo;
 	__u32 address_hi;
 	__u32 data;
 	__u32 flags;
-	__u8  pad[16];
+	__u32 devid;
+	__u8  pad[12];
 };
 
 struct kvm_arm_device_addr {
@@ -1074,6 +1080,8 @@ enum kvm_device_type {
 #define KVM_DEV_TYPE_FLIC		KVM_DEV_TYPE_FLIC
 	KVM_DEV_TYPE_ARM_VGIC_V3,
 #define KVM_DEV_TYPE_ARM_VGIC_V3	KVM_DEV_TYPE_ARM_VGIC_V3
+	KVM_DEV_TYPE_ARM_VGIC_ITS,
+#define KVM_DEV_TYPE_ARM_VGIC_ITS	KVM_DEV_TYPE_ARM_VGIC_ITS
 	KVM_DEV_TYPE_MAX,
 };
 
-- 
2.5.5

