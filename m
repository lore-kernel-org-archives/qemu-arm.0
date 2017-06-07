Received: by 10.25.0.23 with SMTP id 23csp1977364lfa;
        Wed, 7 Jun 2017 01:36:43 -0700 (PDT)
X-Received: by 10.55.27.206 with SMTP id m75mr36454836qkh.166.1496824603652;
        Wed, 07 Jun 2017 01:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496824603; cv=none;
        d=google.com; s=arc-20160816;
        b=vAv9NB4gli/wVY7UcjxTTr7zfvlNxkE9svYZUqOIP11h9C3hVie8mfyqbH1WB5uCQY
         /f3y2KcNydWCU6S75FtrgTiMWoTlwPKdbvDf5cSP9ROd9pCZn6gjmxOZ3FJUDNuUTv1h
         LgjTEZQyxm68jysmxSgp8h/NE57+Jg1r1lgFxriT96RjR91PQhMKt+9fZzJbC6s+UMlD
         hQy1hXhAxzY7HYImv/afxk1LNTLMgCOEDCkVF5IR7VaSJ615fh2RxldC2BZtLkRHed5H
         FBp6YO0CD+ChzW/Q1q1I+e/KO+tpOzF2uFCTKREXJx9+3Z5AyZNxoZxjfsua8OUkK9eG
         P9/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=HMsKDzBaafuSCLZDfgZrqUVfyZx7e02qzAqg+dc2Llw=;
        b=AcvyMRe2uImFKTgvWJNoyLhhtpqaGWa+imYZGVjBDFDFVjt65gc2U9yesMULVnd9Ue
         9UTCEhCF7gYQMbcm7fQOPiJJLTv6dQ7MdBFeb6SzYiXHbAsBenq51oXqGY8JdMZtDRZx
         W4nEck3VAavDNFhIRmiY2UXQLoocI0ZWmZYI9AqPYSD9Rnu8KNWuCPpkqV0ByJNX6wLp
         VR/ZCBTUJfxIqa/hlzJ8wTQ+5S0xNjWM3sT9Yspx2If6UR5JYzg8bAINNo0RC8l5mjkp
         Sgw5ID9lDQaWOT1zKKJiMiQNxeK690duTyHBbYWlP/iRfy3EULlRAls7Ac51QJK6sKr0
         LlFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s20si1304107qtc.140.2017.06.07.01.36.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 01:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIWSG-0003Lf-O5
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 04:36:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWS2-0003Dc-Rc
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWS1-0000xb-IS
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48394)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIWS1-0000xE-9k; Wed, 07 Jun 2017 04:36:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 197A3C0587D3;
	Wed,  7 Jun 2017 08:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 197A3C0587D3
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 197A3C0587D3
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F4951837B;
	Wed,  7 Jun 2017 08:36:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 10:35:50 +0200
Message-Id: <1496824556-1883-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
References: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 07 Jun 2017 08:36:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 2/8] linux-headers: Update for virtio-iommu
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
Cc: kevin.tian@intel.com, bharat.bhushan@nxp.com, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uiIRAaLvarGG

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

