Received: by 10.25.44.15 with SMTP id s15csp4669057lfs;
        Tue, 1 Aug 2017 02:36:51 -0700 (PDT)
X-Received: by 10.237.40.69 with SMTP id r63mr27070415qtd.72.1501580211613;
        Tue, 01 Aug 2017 02:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501580211; cv=none;
        d=google.com; s=arc-20160816;
        b=yNrQXalAqfCovlpwXmrFtKRTvEmfmLreyZiIZD2okkft5rzYy2tEQMrCSn+YQAPsiG
         VAh1FrliYUi57KOrTgYw6WVIQJTuUse6sHLZrxLXachOcRDPqkzonFAz2tuBoNlSl//7
         40P6gnDNITOgLTUQ8yhrpxzOqzrCk2z80fP0/dhghcYOef4ZigdM6XroeUqeH2rIEQfr
         MmDepmsgO8STgWw36jHRqw5CGPCtxDzIhXmFU7Z3jQlMSClEliwdSxYJZGJbTTxq3AJF
         88R5M7mjcRQqJYV1wwMclJTwcK5tCqsmJ1xiloXhjKatYe5vcxw9H+XHfl4tQsX3AjPB
         lJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=HMsKDzBaafuSCLZDfgZrqUVfyZx7e02qzAqg+dc2Llw=;
        b=U+sCQVlQN4/53RrCLziyZTGdvrRTlj1qgjOjMPZH5CaqDHgNEtpp/E8CRKcNIcq42M
         VSARzfaotyxWQwJFfsM0uwQW06DFjR2cttqtW3AXAlaXbRmXsKSuQkKKT9OMPvevsWLX
         wA+9d3dN9xyJ0QGcgXBxOdCcWNDGQ0HlagH1YwwrVzx1PX6xQLl4BITYDf1TPYUQ+Dfv
         8h0ojX/CqP9RgagharoP18FdaYBrCpXImMXGK6Lb3zVWPS2dTbofdgtUyfNLW7LByIVe
         /GnLtSDrSSvPvAF0CPf7QSfXa0DnuqfL4LD/WybLAJNwHXsEV4gJYQJhGyuMJmTBbZzs
         Ywig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a18si24822750qth.454.2017.08.01.02.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Aug 2017 02:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcTbc-0000PG-Q4
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 05:36:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTZb-0007UF-10
	for qemu-devel@nongnu.org; Tue, 01 Aug 2017 05:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTZZ-0001Zk-PW
	for qemu-devel@nongnu.org; Tue, 01 Aug 2017 05:34:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44160)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dcTZU-0001QL-Ei; Tue, 01 Aug 2017 05:34:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42E8512E52D;
	Tue,  1 Aug 2017 09:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 42E8512E52D
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-181.ams2.redhat.com
	[10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCEBA60186;
	Tue,  1 Aug 2017 09:34:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue,  1 Aug 2017 11:33:08 +0200
Message-Id: <1501579994-3320-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 01 Aug 2017 09:34:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v3 2/8] linux-headers: Update for virtio-iommu
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
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gs0kGkT/i2A5

This is a partial linux header update against Jean-Philippe's branch:
git://linux-arm.org/linux-jpb.git virtio-iommu/base (unstable)

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/standard-headers/linux/virtio_ids.h   |   1 +
 include/standard-headers/linux/virtio_iommu.h | 142 ++++++++++++++++++++++++++
 linux-headers/linux/virtio_iommu.h            |   1 +
 3 files changed, 144 insertions(+)
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
index 0000000..e139587
--- /dev/null
+++ b/include/standard-headers/linux/virtio_iommu.h
@@ -0,0 +1,142 @@
+/*
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
+
+QEMU_PACKED
+struct virtio_iommu_config {
+	/* Supported page sizes */
+	uint64_t					page_sizes;
+	struct virtio_iommu_range {
+		uint64_t				start;
+		uint64_t				end;
+	} input_range;
+	uint8_t 					ioasid_bits;
+};
+
+/* Request types */
+#define VIRTIO_IOMMU_T_ATTACH			0x01
+#define VIRTIO_IOMMU_T_DETACH			0x02
+#define VIRTIO_IOMMU_T_MAP			0x03
+#define VIRTIO_IOMMU_T_UNMAP			0x04
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
+QEMU_PACKED
+struct virtio_iommu_req_head {
+	uint8_t					type;
+	uint8_t					reserved[3];
+};
+
+QEMU_PACKED
+struct virtio_iommu_req_tail {
+	uint8_t					status;
+	uint8_t					reserved[3];
+};
+
+QEMU_PACKED
+struct virtio_iommu_req_attach {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					address_space;
+	uint32_t					device;
+	uint32_t					reserved;
+
+	struct virtio_iommu_req_tail		tail;
+};
+
+QEMU_PACKED
+struct virtio_iommu_req_detach {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					device;
+	uint32_t					reserved;
+
+	struct virtio_iommu_req_tail		tail;
+};
+
+#define VIRTIO_IOMMU_MAP_F_READ			(1 << 0)
+#define VIRTIO_IOMMU_MAP_F_WRITE		(1 << 1)
+#define VIRTIO_IOMMU_MAP_F_EXEC			(1 << 2)
+
+#define VIRTIO_IOMMU_MAP_F_MASK			(VIRTIO_IOMMU_MAP_F_READ |	\
+						 VIRTIO_IOMMU_MAP_F_WRITE |	\
+						 VIRTIO_IOMMU_MAP_F_EXEC)
+
+QEMU_PACKED
+struct virtio_iommu_req_map {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					address_space;
+	uint32_t					flags;
+	uint64_t					virt_addr;
+	uint64_t					phys_addr;
+	uint64_t					size;
+
+	struct virtio_iommu_req_tail		tail;
+};
+
+QEMU_PACKED
+struct virtio_iommu_req_unmap {
+	struct virtio_iommu_req_head		head;
+
+	uint32_t					address_space;
+	uint32_t					flags;
+	uint64_t					virt_addr;
+	uint64_t					size;
+
+	struct virtio_iommu_req_tail		tail;
+};
+
+union virtio_iommu_req {
+	struct virtio_iommu_req_head		head;
+
+	struct virtio_iommu_req_attach		attach;
+	struct virtio_iommu_req_detach		detach;
+	struct virtio_iommu_req_map		map;
+	struct virtio_iommu_req_unmap		unmap;
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

