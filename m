Received: by 10.182.158.201 with SMTP id ww9csp361523obb;
        Mon, 16 Nov 2015 14:08:40 -0800 (PST)
X-Received: by 10.31.9.137 with SMTP id 131mr176717vkj.26.1447711720785;
        Mon, 16 Nov 2015 14:08:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b85si152902vka.202.2015.11.16.14.08.40
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 14:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:50455 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyRx2-0006Um-F2
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 17:08:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlU-0008UW-O4
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlT-00085Z-Mx
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:12 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:36303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlT-00085J-Gv
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:11 -0500
Received: by wmww144 with SMTP id w144so109956684wmw.1
	for <qemu-devel@nongnu.org>; Mon, 16 Nov 2015 05:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ItSCtQvq0ajOhUWKq7Zsu4yntzTt9s3z97dT50KDUWI=;
	b=BAAhdVQPQwyG4wklWRJvVDF/dGr3ohur84whOeOAjDu+A7qv/XpyA7TDDtcMrCag3+
	Jxxiib4F3/7Bt3OZMri2BcQJgE4tw5oJhJLeigOpCMGN3mcBYRtWxKLdRey9Sb6upw7w
	MW7/8RGQDzwaZI3VXmwQU/g7kcyOQECeg56M2Oe/nHlXGJXPt0S5ltjSCWG5ZEfXWoMC
	lQ6dywuqBEf5Dn5LvA3l0oj2b4DftLeLa/ATGfzXUpyKWRk4vxes5c/UsrtHw6i0a+Tm
	7rDXoMZQquYxnh0HIXIeuzBx+TrX4nQhvV3ExtkSt3Wx8CfbhUy8GA40pa6HIqiLmr7G
	K5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ItSCtQvq0ajOhUWKq7Zsu4yntzTt9s3z97dT50KDUWI=;
	b=LWlXnisvSdfZ/wF2/RKaU+OCgVWydD2DLpnAv1mxSV9CnkyOwUxN1cC0c7zLgT3pzr
	xNN4/+VHggWW5JZBQkS1qgL3koNQt8HW5sjRP7YKv2Tf1lSxgSBxUwRUFnRtAaD8ncDP
	v3Vuqi17K+ZL9DYz+gvIM7oHZtT9AhGvDj1IHje099fWApN2A9IjtiCE6EBI6+CORnO1
	2iVhqWhY0sNIy+OHeofvdxynoXQvfFg8GOxVsUBCNkWvDBCx+ijn++K54XZfVcKMyyCF
	xncuz1KcQdWyM5r7Oy+LNmB55N74hu7C8xGAaxK4nzCjCGg0Byz59LWvm1idbGeKMmxj
	gEiw==
X-Gm-Message-State: ALoCoQkHpV6/svojqTTrOOO+ey6e9lOSwahS9MwpwwmhW82NPqJo3Oo1DzcXcvAwFG+FyPHG9yvk
X-Received: by 10.194.84.174 with SMTP id a14mr36932296wjz.52.1447680250950;
	Mon, 16 Nov 2015 05:24:10 -0800 (PST)
Received: from localhost ([78.129.130.236]) by smtp.gmail.com with ESMTPSA id
	wx10sm34546990wjb.40.2015.11.16.05.24.08
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 05:24:10 -0800 (PST)
From: shannon.zhao@linaro.org
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
Date: Mon, 16 Nov 2015 21:23:06 +0800
Message-Id: <1447680189-2128-6-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::236
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-devel] [PATCH v3 5/8] hw/acpi/aml-build: Add a wrapper for
	GPIO Interrupt Connection
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
X-TUID: Wc86DrHpndNM

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/acpi/aml-build.c         | 18 ++++++++++++++++++
 include/hw/acpi/aml-build.h |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 60d4703..8e18b22 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -626,6 +626,24 @@ static Aml *aml_gpio_connection(AmlGpioConnectionType type,
 }
 
 /*
+ * ACPI 5.0: 19.5.53
+ * GpioInt(GPIO Interrupt Connection Resource Descriptor Macro)
+ */
+Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
+                  AmlLevelAndEdge level_and_edge,
+                  AmlActiveHighAndLow high_and_low, AmlShared shared,
+                  AmlPinConfig pin_cfg, int16_t debounce_timeout,
+                  int32_t pin_num[], int32_t pin_count, const char *name,
+                  const char *vendor_data)
+{
+    uint8_t flags = level_and_edge | (high_and_low << 1) | (shared << 3);
+
+    return aml_gpio_connection(AML_INTERRUPT_CONNECTION, con_and_pro, flags,
+                               pin_cfg, 0, debounce_timeout, pin_num, pin_count,
+                               name, vendor_data);
+}
+
+/*
  * ACPI 1.0b: 6.4.3.4 32-Bit Fixed Location Memory Range Descriptor
  * (Type 1, Large Item Name 0x6)
  */
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 4e88882..bce813b 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -232,6 +232,12 @@ Aml *aml_call1(const char *method, Aml *arg1);
 Aml *aml_call2(const char *method, Aml *arg1, Aml *arg2);
 Aml *aml_call3(const char *method, Aml *arg1, Aml *arg2, Aml *arg3);
 Aml *aml_call4(const char *method, Aml *arg1, Aml *arg2, Aml *arg3, Aml *arg4);
+Aml *aml_gpio_int(AmlConsumerAndProducer con_and_pro,
+                  AmlLevelAndEdge level_and_edge,
+                  AmlActiveHighAndLow high_and_low, AmlShared shared,
+                  AmlPinConfig pin_cfg, int16_t debounce_timeout,
+                  int32_t pin_num[], int32_t pin_count, const char *name,
+                  const char *vendor_data);
 Aml *aml_memory32_fixed(uint32_t addr, uint32_t size,
                         AmlReadAndWrite read_and_write);
 Aml *aml_interrupt(AmlConsumerAndProducer con_and_pro,
-- 
2.1.0

