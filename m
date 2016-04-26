Received: by 10.25.208.194 with SMTP id h185csp1422190lfg;
        Tue, 26 Apr 2016 03:47:04 -0700 (PDT)
X-Received: by 10.140.108.229 with SMTP id j92mr1390168qgf.17.1461667624458;
        Tue, 26 Apr 2016 03:47:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h33si1051730qgh.20.2016.04.26.03.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Apr 2016 03:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37392 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1av0WG-0000NI-06
	for alex.bennee@linaro.org; Tue, 26 Apr 2016 06:47:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1av0Ql-0006sD-8Y
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 06:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1av0Qg-0006C8-EZ
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 06:41:23 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:8672)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1av0Qb-0006AS-VN; Tue, 26 Apr 2016 06:41:14 -0400
Received: from 172.24.1.136 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.136])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAP01978; Tue, 26 Apr 2016 18:40:54 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml434-hub.china.huawei.com (10.82.67.225) with Microsoft SMTP
	Server id 14.3.235.1; Tue, 26 Apr 2016 18:40:42 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2016 18:40:27 +0800
Message-ID: <1461667229-9216-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461667229-9216-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461667229-9216-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.571F45B7.0063, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 39040758b7f8f5a60056e30d9a3fce2d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH v8 3/5] ACPI: Fix the definition of proximity in
 AcpiSratMemoryAffinity
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
Cc: drjones@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
	david.daney@cavium.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dHwixkyrdY0p

From: Shannon Zhao <shannon.zhao@linaro.org>

ACPI spec says that Proximity Domain is an "Integer that represents
the proximity domain to which the processor belongs". So define it as a
uint32_t.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/i386/acpi-build.c        | 3 +--
 include/hw/acpi/acpi-defs.h | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9ae4c0d..3c031aa 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2440,8 +2440,7 @@ acpi_build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 {
     numamem->type = ACPI_SRAT_MEMORY;
     numamem->length = sizeof(*numamem);
-    memset(numamem->proximity, 0, 4);
-    numamem->proximity[0] = node;
+    numamem->proximity = cpu_to_le32(node);
     numamem->flags = cpu_to_le32(flags);
     numamem->base_addr = cpu_to_le64(base);
     numamem->range_length = cpu_to_le64(len);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index bcf5c3f..850a962 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -475,7 +475,7 @@ typedef struct AcpiSratProcessorAffinity AcpiSratProcessorAffinity;
 struct AcpiSratMemoryAffinity
 {
     ACPI_SUB_HEADER_DEF
-    uint8_t     proximity[4];
+    uint32_t    proximity;
     uint16_t    reserved1;
     uint64_t    base_addr;
     uint64_t    range_length;
-- 
2.0.4


