Received: by 10.182.158.201 with SMTP id ww9csp362268obb;
        Mon, 16 Nov 2015 14:10:32 -0800 (PST)
X-Received: by 10.31.128.9 with SMTP id b9mr182246vkd.124.1447711832161;
        Mon, 16 Nov 2015 14:10:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v68si159935vkd.25.2015.11.16.14.10.32
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 14:10:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:50495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyRyp-0001r4-Si
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 17:10:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJle-0008Uq-SH
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlb-00087G-0R
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:22 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:38401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJla-000878-RS
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:18 -0500
Received: by wmec201 with SMTP id c201so119501056wme.1
	for <qemu-devel@nongnu.org>; Mon, 16 Nov 2015 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W5AZn3OXYI57puxgMFZE+kBVDyMD/xw4WomDuh2CEVI=;
	b=GfmI/RYS2f513KXsWRUey+2tHUc9KXh/2JCujH9SVwJRrtw3t0xopoNHAbqk7+eErQ
	FsbVoyNEB1kIg175A+zcIGkMK1Oq5TKmONwq6GYp0QLe9BxcT+w4Y1NnLXtVmVv7niow
	FLPVmFq8eIdTebk0l3Y5QFr7rotPIkOdDDN4GnGA8WGhXst1bnHox9o+n0quFUxCkInG
	pkTOEtOF45XPxWWtAtaX7kRDNO0WkGu+AvuAFJLizIJJf0k3DT450rOgos3fx1+BXTP/
	6pf5JWR68hUO9Q7sVEf+OPGYhXtB2NTsdwTyHHi+oiPGPYOkw5k3Qix8PaalafoHPA8N
	2OPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W5AZn3OXYI57puxgMFZE+kBVDyMD/xw4WomDuh2CEVI=;
	b=Rmi7D8SpZtpCjPguceDg1sX9mOE0oDAw3M4nWVtjZFc6tSkJ0wSfLQvqS2cnQIFqqX
	4gE7eFoQ5w51ofjSpscfQxsgOkk0zXkqtDpbjavzifhgafZmlM2N2YkESaHLwWNHGCDX
	BftrnTrnKGkgrqJjRGkS6bfIcelViBbNg41y5Gcoc5vnWVfiG/W97usvt/IjaAtVJ7AY
	Ok5iX/r/n++YwT+6o8qbEVVhaY/EGoBfyvfpMa5xUKB0EilVshhBeRDW6bXyhQ5pRbuV
	O1YSlOqM2DKaXCv3tz3Jg5NT8JkZQQsMmu1S1XCcUmy5lL26B49YEMqAGtSBi6R/kbn9
	33Tg==
X-Gm-Message-State: ALoCoQm8BASVD9ogRn89tK5NncewEU712KO+JR772X+UjPcAA/XSnPf/85N6t1sV3Uvb9kchf/pw
X-Received: by 10.28.212.84 with SMTP id l81mr9517532wmg.50.1447680258231;
	Mon, 16 Nov 2015 05:24:18 -0800 (PST)
Received: from localhost ([78.129.130.236]) by smtp.gmail.com with ESMTPSA id
	m64sm18580434wmf.14.2015.11.16.05.24.16
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 05:24:17 -0800 (PST)
From: shannon.zhao@linaro.org
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
Date: Mon, 16 Nov 2015 21:23:07 +0800
Message-Id: <1447680189-2128-7-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::229
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-devel] [PATCH v3 6/8] hw/arm/virt-acpi-build: Add _E03 for
	Power Button
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
X-TUID: eU5qA4t+BnNB

From: Shannon Zhao <shannon.zhao@linaro.org>

Here GPIO pin 3 is used for Power Button, add _E03 in ACPI DSDT table.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt-acpi-build.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b25c90b..12c9e8b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -337,6 +337,19 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
                                   AML_EXCLUSIVE, gpio_irq));
     aml_append(dev, aml_name_decl("_CRS", crs));
+
+    Aml *aei = aml_resource_template();
+    /* Pin 3 for power button */
+    int32_t pin_num[1] = {3};
+    aml_append(aei, aml_gpio_int(AML_CONSUMER_PRODUCER, AML_EDGE,
+                                 AML_ACTIVE_HIGH, AML_EXCLUSIVE, AML_PULL_UP, 0,
+                                 pin_num, 1, "GPO0", NULL));
+    aml_append(dev, aml_name_decl("_AEI", aei));
+
+    /* _E03 is handle for power button */
+    Aml *method = aml_method("_E03", 0);
+    aml_append(method, aml_notify(aml_name("PWRB"), aml_int(0x80)));
+    aml_append(dev, method);
     aml_append(scope, dev);
 }
 
-- 
2.1.0

