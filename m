Received: by 10.182.158.201 with SMTP id ww9csp2143770obb;
        Sun, 6 Dec 2015 23:46:04 -0800 (PST)
X-Received: by 10.140.174.68 with SMTP id u65mr37268086qhu.62.1449474364369;
        Sun, 06 Dec 2015 23:46:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63si19829569qka.95.2015.12.06.23.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 23:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5qUm-0001MR-27
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 02:46:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qTq-0008Fc-Hi
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:45:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qTm-0005ry-8X
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:45:06 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:2751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a5qTl-0005qE-Er; Mon, 07 Dec 2015 02:45:02 -0500
Received: from 172.24.1.50 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BSG33295; Mon, 07 Dec 2015 15:40:18 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 7 Dec 2015 15:40:10 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <mst@redhat.com>,
	<imammedo@redhat.com>, <wei@redhat.com>
Date: Mon, 7 Dec 2015 15:39:49 +0800
Message-ID: <1449473992-11560-6-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.566537E5.00D7, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9014f4744c7983cc58fe3ec86be00066
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH v4 5/8] ACPI: Add aml_gpio_int() wrapper for GPIO
	Interrupt Connection
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aA0nBuzkLtuR

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/acpi/aml-build.c         | 20 ++++++++++++++++++++
 include/hw/acpi/aml-build.h |  7 +++++++
 2 files changed, 27 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4e1469a..41ac5db 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -633,6 +633,26 @@ static Aml *aml_gpio_connection(AmlGpioConnectionType type,
 }
 
 /*
+ * ACPI 5.0: 19.5.53
+ * GpioInt(GPIO Interrupt Connection Resource Descriptor Macro)
+ */
+Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
+                  AmlLevelAndEdge edge_level,
+                  AmlActiveHighAndLow active_level, AmlShared shared,
+                  AmlPinConfig pin_config, uint16_t debounce_timeout,
+                  const uint32_t pin_list[], uint32_t pin_count,
+                  const char *resource_source_name,
+                  const uint8_t *vendor_data, uint16_t vendor_data_len)
+{
+    uint8_t flags = edge_level | (active_level << 1) | (shared << 3);
+
+    return aml_gpio_connection(AML_INTERRUPT_CONNECTION, con_and_pro, flags,
+                               pin_config, 0, debounce_timeout, pin_list,
+                               pin_count, resource_source_name, vendor_data,
+                               vendor_data_len);
+}
+
+/*
  * ACPI 1.0b: 6.4.3.4 32-Bit Fixed Location Memory Range Descriptor
  * (Type 1, Large Item Name 0x6)
  */
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index a8dba9e..41ffe29 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -232,6 +232,13 @@ Aml *aml_call1(const char *method, Aml *arg1);
 Aml *aml_call2(const char *method, Aml *arg1, Aml *arg2);
 Aml *aml_call3(const char *method, Aml *arg1, Aml *arg2, Aml *arg3);
 Aml *aml_call4(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4);
+Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
+                  AmlLevelAndEdge edge_level,
+                  AmlActiveHighAndLow active_level, AmlShared shared,
+                  AmlPinConfig pin_config, uint16_t debounce_timeout,
+                  const uint32_t pin_list[], uint32_t pin_count,
+                  const char *resource_source_name,
+                  const uint8_t *vendor_data, uint16_t vendor_data_len);
 Aml *aml_memory32_fixed(uint32_t addr, uint32_t size,
                         AmlReadAndWrite read_and_write);
 Aml *aml_interrupt(AmlConsumerAndProducer con_and_pro,
-- 
2.0.4


