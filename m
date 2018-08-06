Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3442511wru;
        Mon, 6 Aug 2018 13:15:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf12sakRX+9Dt73VBZQa/vp9X4c62CLvQgf4/rFe/ym2QevkaC0+ZGowfqu67qJCfQj/8Bp
X-Received: by 2002:a0c:80a8:: with SMTP id 37-v6mr14165204qvb.13.1533586505917;
        Mon, 06 Aug 2018 13:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533586505; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3kTWqIWP+9lxaYMIaAkp+JotzxQlBjEo3JBAXfQepNUZIVBvk6GlQEU+4ok3uLMM/
         2eMpVQw1T5ELu+dgr3xkiE0T4hKcsZNCGh+Za0ofUXenjwrkM8LaXTmjRgz9EiiDykPL
         OM9s4LPreWuR1FyCIztdP4tcBp9jLDsFXdf9TG75aDM7TYJ8J6RhJm5mdlP5I/4YyAYp
         2Yteo7hP53J3PqTqY64uAIyZzpeaBvma3g6CmKivty3MIDYPWlF9SC+hdG7sy1z3muSx
         mYBjxxxcRRPNfcgF++3NTgQ3i4viovhnffEeaiHYvFCFWez0S8lgGbMYNt4iO1Z46/Jv
         rcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=vW5VyTjKdVEiIh+YGG1Sl0Fuj+yYYuEe1jyvgUyipsg=;
        b=EcVG90ZvZekEzkY8ni2iY+D770LfbVW3q/cJ+gO6HwhLWe1aFs0f+OoVJ9Q/nb82bc
         ogh2fsoU8DN9r7gFoYnq2E48VaztJWSGLT3grQxTdpoV7g5Be1s0EH9GDMiqE2z23Ncn
         8kAcGMmgNcQUCCjiyFDtnYKrRxfJTfrfkpQXAhSEbmhef19KV5SzKEHZwiFYHQ1y+TnV
         P0kgSMUlybWqKOfyk8PKtopfFBUNE8kfj65x8R5kAnVuHmOr+56dVUXZFpAi0fPD2Vpf
         M+XYZ1hu8hjmYwcIebEf4/U17fby4tHAA2cMId1ycma9hPJ/K7TgIanMxaI4NcIudTv4
         Kf9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j28-v6si2274838qtk.372.2018.08.06.13.15.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:15:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmluD-0005oO-EL
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:15:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlu4-0005mk-IC
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:14:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlu3-0006QY-1I
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:14:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56732 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmlu2-0006PP-QY; Mon, 06 Aug 2018 16:14:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 537D07C6A9;
	Mon,  6 Aug 2018 20:14:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC01C2156711;
	Mon,  6 Aug 2018 20:14:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:29 +0200
Message-Id: <1533586484-5737-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 20:14:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 06 Aug 2018 20:14:54 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v7 01/16] linux-headers: Partial update for
 virtio-iommu v0.7
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
Cc: kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QJMMGkjyTiK+

Partial sync against Jean-Philippe's branch:
git://linux-arm.org/linux-jpb.git virtio-iommu/v0.7

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/standard-headers/linux/virtio_ids.h   |   1 +
 include/standard-headers/linux/virtio_iommu.h | 172 ++++++++++++++++++++++++++
 linux-headers/linux/virtio_iommu.h            |   1 +
 3 files changed, 174 insertions(+)
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index 6d5c3b2..cfe47c5 100644
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
index 0000000..a233206
--- /dev/null
+++ b/include/standard-headers/linux/virtio_iommu.h
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Virtio-iommu definition v0.7
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
+} QEMU_PACKED;
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
+} QEMU_PACKED;
+
+struct virtio_iommu_req_tail {
+	uint8_t					status;
+	uint8_t					reserved[3];
+} QEMU_PACKED;
+
+struct virtio_iommu_req_attach {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					domain;
+	uint32_t					endpoint;
+	uint32_t					reserved;
+
+	struct virtio_iommu_req_tail		tail;
+} QEMU_PACKED;
+
+struct virtio_iommu_req_detach {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					endpoint;
+	uint32_t					reserved;
+
+	struct virtio_iommu_req_tail		tail;
+} QEMU_PACKED;
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
+
+	uint32_t					domain;
+	uint64_t					virt_start;
+	uint64_t					virt_end;
+	uint64_t					phys_start;
+	uint32_t					flags;
+
+	struct virtio_iommu_req_tail		tail;
+} QEMU_PACKED;
+
+struct virtio_iommu_req_unmap {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					domain;
+	uint64_t					virt_start;
+	uint64_t					virt_end;
+	uint32_t					reserved;
+
+	struct virtio_iommu_req_tail		tail;
+} QEMU_PACKED;
+
+#define VIRTIO_IOMMU_RESV_MEM_T_RESERVED	0
+#define VIRTIO_IOMMU_RESV_MEM_T_MSI		1
+
+struct virtio_iommu_probe_resv_mem {
+	uint8_t					subtype;
+	uint8_t					reserved[3];
+	uint64_t					start;
+	uint64_t					end;
+} QEMU_PACKED;
+
+#define VIRTIO_IOMMU_PROBE_T_NONE		0
+#define VIRTIO_IOMMU_PROBE_T_RESV_MEM		1
+
+#define VIRTIO_IOMMU_PROBE_T_MASK		0xfff
+
+struct virtio_iommu_probe_property {
+	uint16_t					type;
+	uint16_t					length;
+	uint8_t					value[];
+} QEMU_PACKED;
+
+struct virtio_iommu_req_probe {
+	struct virtio_iommu_req_head		head;
+	uint32_t					endpoint;
+	uint8_t					reserved[64];
+
+	uint8_t					properties[];
+
+	/* Tail follows the variable-length properties array (no padding) */
+} QEMU_PACKED;
+
+union virtio_iommu_req {
+	struct virtio_iommu_req_head		head;
+
+	struct virtio_iommu_req_attach		attach;
+	struct virtio_iommu_req_detach		detach;
+	struct virtio_iommu_req_map		map;
+	struct virtio_iommu_req_unmap		unmap;
+	struct virtio_iommu_req_probe		probe;
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
+	uint8_t					padding[3];
+	uint32_t					flags;
+	uint32_t					endpoint;
+	uint64_t					address;
+} QEMU_PACKED;
+
+#endif
diff --git a/linux-headers/linux/virtio_iommu.h b/linux-headers/linux/virtio_iommu.h
new file mode 100644
index 0000000..2dc4609
--- /dev/null
+++ b/linux-headers/linux/virtio_iommu.h
@@ -0,0 +1 @@
+#include "standard-headers/linux/virtio_iommu.h"
-- 
2.5.5

