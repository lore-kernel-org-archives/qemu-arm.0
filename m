Received: by 10.182.158.201 with SMTP id ww9csp2143328obb;
        Sun, 6 Dec 2015 23:44:51 -0800 (PST)
X-Received: by 10.55.16.205 with SMTP id 74mr16017386qkq.15.1449474291645;
        Sun, 06 Dec 2015 23:44:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l130si26312480qhc.36.2015.12.06.23.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 23:44:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5qTb-0007oT-9y
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 02:44:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qTY-0007kI-1n
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:44:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qTU-0005js-L0
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:44:47 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:2539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a5qTT-0005iD-Po; Mon, 07 Dec 2015 02:44:44 -0500
Received: from 172.24.1.50 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BSG33294; Mon, 07 Dec 2015 15:40:18 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 7 Dec 2015 15:40:08 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <mst@redhat.com>,
	<imammedo@redhat.com>, <wei@redhat.com>
Date: Mon, 7 Dec 2015 15:39:48 +0800
Message-ID: <1449473992-11560-5-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.566537E5.005B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 1b78e859bc8df639138bf3f7b5ac4a9a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH v4 4/8] ACPI: Add GPIO Connection Descriptor
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
X-TUID: 8+3aZ0VaF4GR

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/acpi/aml-build.c         | 68 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h | 20 +++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index a00a0ab..4e1469a 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -565,6 +565,74 @@ Aml *aml_call4(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4)
 }
 
 /*
+ * ACPI 5.0: 6.4.3.8.1 GPIO Connection Descriptor
+ * Type 1, Large Item Name 0xC
+ */
+
+static Aml *aml_gpio_connection(AmlGpioConnectionType type,
+                                AmlConsumerAndProducer con_and_pro,
+                                uint8_t flags, AmlPinConfig pin_config,
+                                uint16_t output_drive,
+                                uint16_t debounce_timeout,
+                                const uint32_t pin_list[], uint32_t pin_count,
+                                const char *resource_source_name,
+                                const uint8_t *vendor_data,
+                                uint16_t vendor_data_len)
+{
+    Aml *var = aml_alloc();
+    const uint16_t min_desc_len = 0x16;
+    uint16_t resource_source_name_len, length;
+    uint16_t pin_table_offset, resource_source_name_offset, vendor_data_offset;
+    uint32_t i;
+
+    assert(resource_source_name);
+    resource_source_name_len = strlen(resource_source_name) + 1;
+    length = min_desc_len + resource_source_name_len + vendor_data_len;
+    pin_table_offset = min_desc_len + 1;
+    resource_source_name_offset = pin_table_offset + pin_count * 2;
+    vendor_data_offset = resource_source_name_offset + resource_source_name_len;
+
+    build_append_byte(var->buf, 0x8C);  /* GPIO Connection Descriptor */
+    build_append_int_noprefix(var->buf, length, 2); /* Length */
+    build_append_byte(var->buf, 1);     /* Revision ID */
+    build_append_byte(var->buf, type);  /* GPIO Connection Type */
+    /* General Flags (2 bytes) */
+    build_append_int_noprefix(var->buf, con_and_pro, 2);
+    /* Interrupt and IO Flags (2 bytes) */
+    build_append_int_noprefix(var->buf, flags, 2);
+    /* Pin Configuration 0 = Default 1 = Pull-up 2 = Pull-down 3 = No Pull */
+    build_append_byte(var->buf, pin_config);
+    /* Output Drive Strength (2 bytes) */
+    build_append_int_noprefix(var->buf, output_drive, 2);
+    /* Debounce Timeout (2 bytes) */
+    build_append_int_noprefix(var->buf, debounce_timeout, 2);
+    /* Pin Table Offset (2 bytes) */
+    build_append_int_noprefix(var->buf, pin_table_offset, 2);
+    build_append_byte(var->buf, 0);     /* Resource Source Index */
+    /* Resource Source Name Offset (2 bytes) */
+    build_append_int_noprefix(var->buf, resource_source_name_offset, 2);
+    /* Vendor Data Offset (2 bytes) */
+    build_append_int_noprefix(var->buf, vendor_data_offset, 2);
+    /* Vendor Data Length (2 bytes) */
+    build_append_int_noprefix(var->buf, vendor_data_len, 2);
+    /* Pin Number (2n bytes)*/
+    for (i = 0; i < pin_count; i++) {
+        build_append_int_noprefix(var->buf, pin_list[i], 2);
+    }
+
+    /* Resource Source Name */
+    build_append_namestring(var->buf, "%s", resource_source_name);
+    build_append_byte(var->buf, '\0');
+
+    /* Vendor-defined Data */
+    if (vendor_data != NULL) {
+        g_array_append_vals(var->buf, vendor_data, vendor_data_len);
+    }
+
+    return var;
+}
+
+/*
  * ACPI 1.0b: 6.4.3.4 32-Bit Fixed Location Memory Range Descriptor
  * (Type 1, Large Item Name 0x6)
  */
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 1b632dc..a8dba9e 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -148,6 +148,26 @@ typedef enum {
     AML_SHARED_AND_WAKE = 3,
 } AmlShared;
 
+/*
+ * ACPI 5.0: Table 6-189 GPIO Connection Descriptor Definition
+ * GPIO Connection Type
+ */
+typedef enum {
+    AML_INTERRUPT_CONNECTION = 0,
+    AML_IO_CONNECTION = 1,
+} AmlGpioConnectionType;
+
+/*
+ * ACPI 5.0: Table 6-189 GPIO Connection Descriptor Definition
+ * _PPI field definition
+ */
+typedef enum {
+    AML_PULL_DEFAULT = 0,
+    AML_PULL_UP = 1,
+    AML_PULL_DOWN = 2,
+    AML_PULL_NONE = 3,
+} AmlPinConfig;
+
 typedef
 struct AcpiBuildTables {
     GArray *table_data;
-- 
2.0.4


