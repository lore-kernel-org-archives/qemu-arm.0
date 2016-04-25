Received: by 10.25.208.194 with SMTP id h185csp768493lfg;
        Mon, 25 Apr 2016 01:08:57 -0700 (PDT)
X-Received: by 10.55.198.19 with SMTP id b19mr17081970qkj.116.1461571732366;
        Mon, 25 Apr 2016 01:08:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n108si10113377qge.73.2016.04.25.01.08.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 01:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aubZa-0007uC-E5
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 04:08:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubYk-0006ef-9w
	for qemu-devel@nongnu.org; Mon, 25 Apr 2016 04:07:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubYg-00057R-0K
	for qemu-devel@nongnu.org; Mon, 25 Apr 2016 04:07:57 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:44141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aubYf-00057E-Cy; Mon, 25 Apr 2016 04:07:53 -0400
Received: from 172.24.1.47 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFY28061; Mon, 25 Apr 2016 16:07:38 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 25 Apr 2016 16:07:28 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 25 Apr 2016 16:05:45 +0800
Message-ID: <1461571547-13132-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.571DD04A.0102, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 60ceb2a64c85f4bd3b701b2e091723ce
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-devel] [PATCH v7 3/5] ACPI: Fix the definition of proximity
 in AcpiSratMemoryAffinity
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
Cc: drjones@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
	david.daney@cavium.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3zYETAO3OZCM

From: Shannon Zhao <shannon.zhao@linaro.org>

ACPI spec says that Proximity Domain is an "Integer that represents
the proximity domain to which the processor belongs". So define it as a
uint32_t.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
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


