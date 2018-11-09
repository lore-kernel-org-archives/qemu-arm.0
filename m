Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp566909wrw;
        Fri, 9 Nov 2018 03:30:59 -0800 (PST)
X-Google-Smtp-Source: AJdET5f2ZV8BbR2BPhhXF+eaKdG/bYRL0enchZ6addTQEf1Hkj9+DJav7U4DWdPtNOv6ulufnYnY
X-Received: by 2002:a0c:98ca:: with SMTP id g10mr8355455qvd.13.1541763058988;
        Fri, 09 Nov 2018 03:30:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763058; cv=none;
        d=google.com; s=arc-20160816;
        b=fqwADP0lIFB6Tc7w1ucmJG80peOl5juGhVbQRif3vPPk221C/gsdyHR1Rat6++QZZW
         FQ+uLctkLGJwRY+ADBUcWjj+ar4U16be0M2OW5a/h5atN7c1CHWVu7ciZu5RFS3E+cYB
         CUnEbTn+uzgYKvU/wPtPSjCu5umjxJ+2bjSlcVDIz/TGVlD/GLJqjiomLyN3y7FSKSrG
         9CqMi2CPb1m7+Qucgt2O+HlSKE8iAry78sm9aQs2MmAhgTOA+ak+t1qSbEwh8G5pZtAI
         +hKf8SAOvFxoqfCV3w7a/QNpBLSu8F15vGiUY6jmAEmoQ46AT2hZ+aWWWODWD6HJDI89
         a2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=SgyD7wz72TifdoUHL4QAwH4+TwP4WlZmvcinz9JGkXk=;
        b=weq1+pDQQWtmr+R24YL2jTkJKWr5/xOYDFEn/B7dwdfjFLtHLonHBMVYq2cdRh8hp1
         lGKMbGhntrZyMas3lxVYP6NK3c5tV74y+qsgzvYGk13BDQ8vHSt4u1d/r4py/YHDY+um
         icrkCTvPkkdHPo5HoOY27rHLw+eNzoNfdOwjcR4bmkyYTxyElDc+KpgeaX7dfNz5Bcjr
         bVpEDgrdDr38LwjSKVbGHQwtIO0pJA1pPFqzPqHeAV3ptLApyjrwikBBGk6pfc6N4pQp
         /8KWRASjgep9c5HFQ795sJkq4sA+ejHz9OXjWImfzbHt624mX8utppW6Obakw/l4Ce73
         JGQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w54si5371662qtk.68.2018.11.09.03.30.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:30:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL506-0006Xu-AH
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:30:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zk-0006Ts-9j
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL4zc-0007ao-6p
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL4zZ-00071q-FX; Fri, 09 Nov 2018 06:30:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 706CF3084243;
	Fri,  9 Nov 2018 11:30:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 272945C219;
	Fri,  9 Nov 2018 11:30:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:41 +0100
Message-Id: <20181109112957.10067-3-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 09 Nov 2018 11:30:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 02/18] linux-headers: Partial update for
 virtio-iommu v0.8
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pOO4vSd0Yg0c

Partial sync against Jean-Philippe's branch:
git://linux-arm.org/linux-jpb.git virtio-iommu/v0.8

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/standard-headers/linux/virtio_ids.h   |   1 +
 include/standard-headers/linux/virtio_iommu.h | 159 ++++++++++++++++++
 linux-headers/linux/virtio_iommu.h            |   1 +
 3 files changed, 161 insertions(+)
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index 6d5c3b2d4f..cfe47c5d9a 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -43,5 +43,6 @@
 #define VIRTIO_ID_INPUT        18 /* virtio input */
 #define VIRTIO_ID_VSOCK        19 /* virtio vsock transport */
 #define VIRTIO_ID_CRYPTO       20 /* virtio crypto */
+#define VIRTIO_ID_IOMMU        23 /* virtio IOMMU */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
diff --git a/include/standard-headers/linux/virtio_iommu.h b/include/standard-headers/linux/virtio_iommu.h
new file mode 100644
index 0000000000..0a40b21ea9
--- /dev/null
+++ b/include/standard-headers/linux/virtio_iommu.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Virtio-iommu definition v0.8
+ *
+ * Copyright (C) 2018 Arm Ltd.
+ */
+#ifndef _LINUX_VIRTIO_IOMMU_H
+#define _LINUX_VIRTIO_IOMMU_H
+
+#include "standard-headers/linux/types.h"
+
+/* Feature bits */
+#define VIRTIO_IOMMU_F_INPUT_RANGE		0
+#define VIRTIO_IOMMU_F_DOMAIN_BITS		1
+#define VIRTIO_IOMMU_F_MAP_UNMAP		2
+#define VIRTIO_IOMMU_F_BYPASS			3
+#define VIRTIO_IOMMU_F_PROBE			4
+
+struct virtio_iommu_config {
+	/* Supported page sizes */
+	uint64_t					page_size_mask;
+	/* Supported IOVA range */
+	struct virtio_iommu_range {
+		uint64_t				start;
+		uint64_t				end;
+	} input_range;
+	/* Max domain ID size */
+	uint8_t					domain_bits;
+	uint8_t					padding[3];
+	/* Probe buffer size */
+	uint32_t					probe_size;
+};
+
+/* Request types */
+#define VIRTIO_IOMMU_T_ATTACH			0x01
+#define VIRTIO_IOMMU_T_DETACH			0x02
+#define VIRTIO_IOMMU_T_MAP			0x03
+#define VIRTIO_IOMMU_T_UNMAP			0x04
+#define VIRTIO_IOMMU_T_PROBE			0x05
+
+/* Status types */
+#define VIRTIO_IOMMU_S_OK			0x00
+#define VIRTIO_IOMMU_S_IOERR			0x01
+#define VIRTIO_IOMMU_S_UNSUPP			0x02
+#define VIRTIO_IOMMU_S_DEVERR			0x03
+#define VIRTIO_IOMMU_S_INVAL			0x04
+#define VIRTIO_IOMMU_S_RANGE			0x05
+#define VIRTIO_IOMMU_S_NOENT			0x06
+#define VIRTIO_IOMMU_S_FAULT			0x07
+
+struct virtio_iommu_req_head {
+	uint8_t					type;
+	uint8_t					reserved[3];
+};
+
+struct virtio_iommu_req_tail {
+	uint8_t					status;
+	uint8_t					reserved[3];
+};
+
+struct virtio_iommu_req_attach {
+	struct virtio_iommu_req_head		head;
+	uint32_t					domain;
+	uint32_t					endpoint;
+	uint8_t					reserved[8];
+	struct virtio_iommu_req_tail		tail;
+};
+
+struct virtio_iommu_req_detach {
+	struct virtio_iommu_req_head		head;
+	uint32_t					domain;
+	uint32_t					endpoint;
+	uint8_t					reserved[8];
+	struct virtio_iommu_req_tail		tail;
+};
+
+#define VIRTIO_IOMMU_MAP_F_READ			(1 << 0)
+#define VIRTIO_IOMMU_MAP_F_WRITE		(1 << 1)
+#define VIRTIO_IOMMU_MAP_F_EXEC			(1 << 2)
+#define VIRTIO_IOMMU_MAP_F_MMIO			(1 << 3)
+
+#define VIRTIO_IOMMU_MAP_F_MASK			(VIRTIO_IOMMU_MAP_F_READ |	\
+						 VIRTIO_IOMMU_MAP_F_WRITE |	\
+						 VIRTIO_IOMMU_MAP_F_EXEC |	\
+						 VIRTIO_IOMMU_MAP_F_MMIO)
+
+struct virtio_iommu_req_map {
+	struct virtio_iommu_req_head		head;
+	uint32_t					domain;
+	uint64_t					virt_start;
+	uint64_t					virt_end;
+	uint64_t					phys_start;
+	uint32_t					flags;
+	struct virtio_iommu_req_tail		tail;
+};
+
+struct virtio_iommu_req_unmap {
+	struct virtio_iommu_req_head		head;
+	uint32_t					domain;
+	uint64_t					virt_start;
+	uint64_t					virt_end;
+	uint8_t					reserved[4];
+	struct virtio_iommu_req_tail		tail;
+};
+
+#define VIRTIO_IOMMU_PROBE_T_NONE		0
+#define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
+
+#define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
+
+struct virtio_iommu_probe_property {
+	uint16_t					type;
+	uint16_t					length;
+};
+
+#define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
+#define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
+
+struct virtio_iommu_probe_resv_mem {
+	struct virtio_iommu_probe_property	head;
+	uint8_t					subtype;
+	uint8_t					reserved[3];
+	uint64_t					start;
+	uint64_t					end;
+};
+
+struct virtio_iommu_req_probe {
+	struct virtio_iommu_req_head		head;
+	uint32_t					endpoint;
+	uint8_t					reserved[64];
+
+	uint8_t					properties[];
+
+	/*
+	 * Tail follows the variable-length properties array. No padding,
+	 * property lengths are all aligned on 8 bytes.
+	 */
+};
+
+/* Fault types */
+#define VIRTIO_IOMMU_FAULT_R_UNKNOWN		0
+#define VIRTIO_IOMMU_FAULT_R_DOMAIN		1
+#define VIRTIO_IOMMU_FAULT_R_MAPPING		2
+
+#define VIRTIO_IOMMU_FAULT_F_READ		(1 << 0)
+#define VIRTIO_IOMMU_FAULT_F_WRITE		(1 << 1)
+#define VIRTIO_IOMMU_FAULT_F_EXEC		(1 << 2)
+#define VIRTIO_IOMMU_FAULT_F_ADDRESS		(1 << 8)
+
+struct virtio_iommu_fault {
+	uint8_t					reason;
+	uint8_t					reserved[3];
+	uint32_t					flags;
+	uint32_t					endpoint;
+	uint8_t					reserved2[4];
+	uint64_t					address;
+};
+
+#endif
diff --git a/linux-headers/linux/virtio_iommu.h b/linux-headers/linux/virtio_iommu.h
new file mode 100644
index 0000000000..2dc4609c16
--- /dev/null
+++ b/linux-headers/linux/virtio_iommu.h
@@ -0,0 +1 @@
+#include "standard-headers/linux/virtio_iommu.h"
-- 
2.17.2

