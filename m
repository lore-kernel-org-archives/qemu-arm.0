Received: by 10.223.172.38 with SMTP id v35csp4642814wrc;
        Tue, 19 Sep 2017 00:50:27 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCH8Gk/U8+ti3Lp0GgABpvo3/e0z+MeiBr6pboA016hvXDzaow2vYeSzlvu4jjwIxsoMqOi
X-Received: by 10.237.37.182 with SMTP id x51mr737244qtc.9.1505807427514;
        Tue, 19 Sep 2017 00:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807427; cv=none;
        d=google.com; s=arc-20160816;
        b=fA3XGwLAk4FNtktAO5UjpGSVZSbB1LyaIbVE+jU1mJuKg3QaZR23vH3KCOkkqptx3D
         PGAQCKOv/tPZJpAp/8asnWp7wiNny0RWDVAA2xmtNAmOAA7B9oTsUxjtr6qbsRegIiWA
         UQKeuIOwmKwC+9Vv7HdmOWJpLyIIBUQOJf6HuuChVIvGToQZI+J3Y3rPrV4WR0PBTzGO
         QMz24Wq72gHUl89ej+gDH+AZ41YX0kbq+orlbm4arev2q9hXaBfwsx3Pe0WmdOtVaq1/
         8xK65uMnpTpkHamUsQi79O1JmvE1XLna0vNoBH3y+KHfTbFmNXFj3xnIOUJETKGKvwX/
         UoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=hmYVgGL7QrfCNhgjxLA17tVXsjZk2CNEhgkGsDxHang=;
        b=y7hpn5ra+GQqi+5HoVO+n7b4Neqo9xkEfDfBbpAG6Ggo/ICeP/ZEWTBRlrbdDm6OpL
         ooO1/U1uoUV4BwNv9hcfRHWTCUjIT+aF9Ln4JADOiSg9sMVoZvOu9h+GLBJDnlER4liy
         YA0ZpBd5YnGg9pcRrfHDj10CPARiJSPNzJBDMOAECVqRQS7Dl/VGP5Ulf5XEcrrp4yWj
         J+UTh65K/WskHYWGshlzlJJ29OUkLjwykm9xUYjcPUohilsAj+bv/n7nHPiSBgPBWMdT
         FTc5K6rlKj+4o6xJPExHxmVS2MTou4lmydJlDxY4gnh6sdrV5lAS6AVRA6pactt2cPmW
         +VNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si336480qkm.116.2017.09.19.00.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:50:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDIX-0001Xa-3n
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:50:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDFo-0007oL-NN
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:47:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDFn-0000ZC-Dd
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 03:47:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44828)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDFn-0000Yv-5e; Tue, 19 Sep 2017 03:47:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 202444A6E9;
	Tue, 19 Sep 2017 07:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 202444A6E9
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D41DC61342;
	Tue, 19 Sep 2017 07:47:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:34 +0200
Message-Id: <1505807208-9063-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 19 Sep 2017 07:47:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 02/16] linux-headers: Update for virtio-iommu
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5/VvNmVCkMkC

This is a partial linux header update against Jean-Philippe's branch:
git://linux-arm.org/linux-jpb.git virtio-iommu/v0.4 (unstable)

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3- >v3:
- upgrade the API from v0.1 to v0.4
---
 include/standard-headers/linux/virtio_ids.h   |   1 +
 include/standard-headers/linux/virtio_iommu.h | 177 ++++++++++++++++++++++++++
 linux-headers/linux/virtio_iommu.h            |   1 +
 3 files changed, 179 insertions(+)
 create mode 100644 include/standard-headers/linux/virtio_iommu.h
 create mode 100644 linux-headers/linux/virtio_iommu.h

diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index 6d5c3b2..934ed3d 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -43,5 +43,6 @@
 #define VIRTIO_ID_INPUT        18 /* virtio input */
 #define VIRTIO_ID_VSOCK        19 /* virtio vsock transport */
 #define VIRTIO_ID_CRYPTO       20 /* virtio crypto */
+#define VIRTIO_ID_IOMMU	    61216 /* virtio IOMMU (temporary) */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
diff --git a/include/standard-headers/linux/virtio_iommu.h b/include/standard-headers/linux/virtio_iommu.h
new file mode 100644
index 0000000..7f486cf
--- /dev/null
+++ b/include/standard-headers/linux/virtio_iommu.h
@@ -0,0 +1,177 @@
+/*
+ * Virtio-iommu definition v0.4
+ *
+ * Copyright (C) 2017 ARM Ltd.
+ *
+ * This header is BSD licensed so anyone can use the definitions
+ * to implement compatible drivers/servers:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ * 3. Neither the name of ARM Ltd. nor the names of its contributors
+ *    may be used to endorse or promote products derived from this software
+ *    without specific prior written permission.
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
+ * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL IBM OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
+ * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
+ * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
+ * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+ * SUCH DAMAGE.
+ */
+#ifndef _LINUX_VIRTIO_IOMMU_H
+#define _LINUX_VIRTIO_IOMMU_H
+
+/* Feature bits */
+#define VIRTIO_IOMMU_F_INPUT_RANGE		0
+#define VIRTIO_IOMMU_F_IOASID_BITS		1
+#define VIRTIO_IOMMU_F_MAP_UNMAP		2
+#define VIRTIO_IOMMU_F_BYPASS			3
+#define VIRTIO_IOMMU_F_PROBE			4
+
+struct virtio_iommu_config {
+	/* Supported page sizes */
+	uint64_t					page_size_mask;
+	struct virtio_iommu_range {
+		uint64_t				start;
+		uint64_t				end;
+	} input_range;
+	uint8_t 					ioasid_bits;
+	uint8_t					padding[3];
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
+	uint32_t					address_space;
+	uint32_t					device;
+	uint32_t					reserved;
+
+	struct virtio_iommu_req_tail		tail;
+} QEMU_PACKED;
+
+struct virtio_iommu_req_detach {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					device;
+	uint32_t					reserved;
+
+	struct virtio_iommu_req_tail		tail;
+} QEMU_PACKED;
+
+#define VIRTIO_IOMMU_MAP_F_READ			(1 << 0)
+#define VIRTIO_IOMMU_MAP_F_WRITE		(1 << 1)
+#define VIRTIO_IOMMU_MAP_F_EXEC			(1 << 2)
+
+#define VIRTIO_IOMMU_MAP_F_MASK			(VIRTIO_IOMMU_MAP_F_READ |	\
+						 VIRTIO_IOMMU_MAP_F_WRITE |	\
+						 VIRTIO_IOMMU_MAP_F_EXEC)
+
+struct virtio_iommu_req_map {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					address_space;
+	uint64_t					virt_addr;
+	uint64_t					phys_addr;
+	uint64_t					size;
+	uint32_t					flags;
+
+	struct virtio_iommu_req_tail		tail;
+} QEMU_PACKED;
+
+QEMU_PACKED
+struct virtio_iommu_req_unmap {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					address_space;
+	uint64_t					virt_addr;
+	uint64_t					size;
+	uint32_t					reserved;
+
+	struct virtio_iommu_req_tail		tail;
+} QEMU_PACKED;
+
+#define VIRTIO_IOMMU_PROBE_RESV_MEM_T_ABORT	0
+#define VIRTIO_IOMMU_PROBE_RESV_MEM_T_BYPASS	1
+
+#define VIRTIO_IOMMU_PROBE_RESV_MEM_F_MSI	(1 << 0)
+
+struct virtio_iommu_probe_resv_mem {
+	uint8_t					subtype;
+	uint8_t					reserved[3];
+	uint64_t					addr;
+	uint64_t					size;
+	uint32_t					flags;
+} QEMU_PACKED;
+
+#define VIRTIO_IOMMU_PROBE_T_NONE		0
+#define VIRTIO_IOMMU_PROBE_T_RESV_MEM		2
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
+	uint32_t					device;
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

