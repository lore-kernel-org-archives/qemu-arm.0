Received: by 10.182.158.201 with SMTP id ww9csp328398obb;
        Mon, 16 Nov 2015 12:48:58 -0800 (PST)
X-Received: by 10.13.214.19 with SMTP id y19mr38771719ywd.63.1447706938317;
        Mon, 16 Nov 2015 12:48:58 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y80si25084459ywd.41.2015.11.16.12.48.58
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 12:48:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:49217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyQht-00014t-II
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 15:48:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlQ-0008UK-Pm
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlM-00083u-Ly
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:08 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:35640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlM-00083k-Cv
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:04 -0500
Received: by wmdw130 with SMTP id w130so110792553wmd.0
	for <qemu-devel@nongnu.org>; Mon, 16 Nov 2015 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g25KxGUeEBQf/6ZTxkFMRkXGcYsUVKvjJvaXiN04kA0=;
	b=LJOJiaGD97IboV/EBFwtWS4lM+OuLRC4luo/z6WxgcJe2iIih3y8coxGFckJZQU7Is
	B5krGVvcc5uPPuFIHw85mCOmdjeLENZwUZpX02yS5FbhR5i3JqKSo8gtjITipXqSGGPC
	xrv6MW5oQlhnk4xT9Bu82uiOv0ECmjs2ZdS1cirfbRBMFciI8Z2G/1+yl5HoTGy08yF3
	HK5dUrEHysRSWYdOG9NkHm3GeFcvxPyxcx5oN+6p2fTALg8RC9KR8uPIsemr6Aqd4SQ8
	Vl/5Yho0LF7pfMtLAbGShdPiYL7aD3qjMS+CuY/agjjZdtQ53a9nVhEgERwcpH4HArvY
	olYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g25KxGUeEBQf/6ZTxkFMRkXGcYsUVKvjJvaXiN04kA0=;
	b=XFIXUv80gjbyb0uRoy2A9ufsw6mh0VqgoM9mgMLYXwO1XIyfg948gcqX7JhYNXTRJW
	wxG7QRk6U+S4cgKvzBJhtsUj++JxELS6aDTl6YNqQ0IliCyKkluH1rrViTrVKoNED2PY
	IOcdo7vbsN65ZhjjtiCNrq6G2mdwcN15rTG60HAKM0b9CdjUl68+8OArir/1LihOn/3x
	d9sKzDvUk++stWDhmsZyRsggiV+vQVSUuoqwFOfnAhmd8Gn3OqwAWidAw7q262GNtMoB
	4awij2wQbuYJvb39A3ejSTQq50oKiJEBOKAloT0/y0OQq8J1S+vpDVS2NLZVHaa0WP8l
	CgXg==
X-Gm-Message-State: ALoCoQlsDhm0pMnYN/IiS3YeX5fxze+osjaDp3Mhpjf8ZRIb9OtCYXG6+601s8axSG87h/+rilpR
X-Received: by 10.194.189.133 with SMTP id gi5mr37335181wjc.13.1447680243792; 
	Mon, 16 Nov 2015 05:24:03 -0800 (PST)
Received: from localhost ([78.129.130.236])
	by smtp.gmail.com with ESMTPSA id s9sm18603015wmf.2.2015.11.16.05.24.00
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 05:24:03 -0800 (PST)
From: shannon.zhao@linaro.org
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
Date: Mon, 16 Nov 2015 21:23:05 +0800
Message-Id: <1447680189-2128-5-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22a
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-devel] [PATCH v3 4/8] hw/acpi/aml-build: Add GPIO Connection
	Descriptor
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J+GIqU8jwtMk

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/acpi/aml-build.c         | 61 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h | 20 +++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index a00a0ab..60d4703 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -565,6 +565,67 @@ Aml *aml_call4(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4)
 }
 
 /*
+ * ACPI 5.0: 6.4.3.8.1 GPIO Connection Descriptor
+ * Type 1, Large Item Name 0xC
+ */
+
+static Aml *aml_gpio_connection(AmlGpioConnectionType type,
+                                AmlConsumerAndProducer con_and_pro,
+                                uint8_t flags, AmlPinConfig pin_cfg,
+                                int16_t output_drive, int16_t debounce_timeout,
+                                int32_t pin_num[], int32_t pin_count,
+                                const char *name, const char *vendor_data)
+{
+    Aml *var = aml_alloc();
+    uint16_t name_len = name ? (strlen(name) + 1) : 0;
+    uint16_t vendor_data_len = vendor_data ? (strlen(vendor_data) + 1) : 0;
+    uint16_t length = 0x16 + name_len + vendor_data_len;
+    uint16_t name_offset = 0x17 + pin_count * 2;
+    uint16_t vendor_data_offset = name_offset + name_len;
+    int i;
+
+    build_append_byte(var->buf, 0x8C);  /* GpioInt Resource Descriptor */
+    build_append_int_noprefix(var->buf, length, 2); /* Length */
+    build_append_byte(var->buf, 1);     /* Revision ID */
+    build_append_byte(var->buf, type);  /* GPIO Connection Type */
+    /* General Flags (2 bytes) */
+    build_append_int_noprefix(var->buf, con_and_pro, 2);
+    /* Interrupt and IO Flags (2 bytes) */
+    build_append_int_noprefix(var->buf, flags, 2);
+    /* Pin Configuration 0 = Default 1 = Pull-up 2 = Pull-down 3 = No Pull */
+    build_append_byte(var->buf, pin_cfg);
+    /* Output Drive Strength (2 bytes) */
+    build_append_int_noprefix(var->buf, output_drive, 2);
+    /* Debounce Timeout (2 bytes) */
+    build_append_int_noprefix(var->buf, debounce_timeout, 2);
+    /* Pin Table Offset (2 bytes) */
+    build_append_int_noprefix(var->buf, 0x17, 2);
+    build_append_byte(var->buf, 0);     /* Resource Source Index */
+    /* Resource Source Name Offset (2 bytes) */
+    build_append_int_noprefix(var->buf, name_offset, 2);
+    /* Vendor Data Offset (2 bytes) */
+    build_append_int_noprefix(var->buf, vendor_data_offset, 2);
+    /* Vendor Data Length (2 bytes) */
+    build_append_int_noprefix(var->buf, vendor_data_len, 2);
+    /* Pin Number (2n bytes)*/
+    for (i = 0; i < pin_count; i++) {
+        build_append_int_noprefix(var->buf, pin_num[i], 2);
+    }
+    /* Resource Source Name */
+    if (name != NULL) {
+        build_append_namestring(var->buf, "%s", name);
+        build_append_byte(var->buf, '\0');
+    }
+    /* Vendor-defined Data */
+    if (vendor_data != NULL) {
+        build_append_namestring(var->buf, "%s", vendor_data);
+        build_append_byte(var->buf, '\0');
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
index 1b632dc..4e88882 100644
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
+    AML_DEFAULT_CONFIG = 0,
+    AML_PULL_UP = 1,
+    AML_PULL_DOWN = 2,
+    AML_NO_PULL = 3,
+} AmlPinConfig;
+
 typedef
 struct AcpiBuildTables {
     GArray *table_data;
-- 
2.1.0

