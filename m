Received: by 10.182.158.201 with SMTP id ww9csp907113obb;
        Thu, 10 Dec 2015 19:30:12 -0800 (PST)
X-Received: by 10.55.82.132 with SMTP id g126mr20158054qkb.63.1449804612099;
        Thu, 10 Dec 2015 19:30:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c187si18213112qhd.24.2015.12.10.19.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 19:30:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7EPL-0001kG-Ob
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 22:30:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7EOH-0008MY-9i
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 22:29:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7EOD-0001RE-Uy
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 22:29:05 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:58018)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a7EOD-0001R7-3c; Thu, 10 Dec 2015 22:29:01 -0500
Received: from 172.24.1.48 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAQ94307; Fri, 11 Dec 2015 11:22:00 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Fri, 11 Dec 2015 11:21:51 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>, 
	<mst@redhat.com>, <wei@redhat.com>
Date: Fri, 11 Dec 2015 11:21:22 +0800
Message-ID: <1449804086-3464-7-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.566A4159.0127, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 73b89a3477712556fe8bc137b8b99342
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH v5 06/10] ACPI: Add GPIO Connection Descriptor
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
X-TUID: nsINHe8KaHNB

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build.c         | 68 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h | 20 +++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index cd25d06..d8c33a2 100644
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
index c2c0be3..f1817e4 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -154,6 +154,26 @@ typedef enum {
     AML_SERIALIZED = 1,
 } AmlSerializeFlag;
 
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


