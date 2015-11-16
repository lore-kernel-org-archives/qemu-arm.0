Received: by 10.182.158.201 with SMTP id ww9csp331756obb;
        Mon, 16 Nov 2015 12:56:47 -0800 (PST)
X-Received: by 10.129.153.135 with SMTP id q129mr27824600ywg.15.1447707407684;
        Mon, 16 Nov 2015 12:56:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k190si25088956ywd.396.2015.11.16.12.56.47
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 12:56:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:49320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyQpT-0007kO-9M
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 15:56:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlF-0008U3-Hf
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:24:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlE-0007w5-K1
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:57 -0500
Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229]:34507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJlE-0007vp-EC
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:56 -0500
Received: by wmvv187 with SMTP id v187so176087378wmv.1
	for <qemu-devel@nongnu.org>; Mon, 16 Nov 2015 05:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PvN9OQrfqq284FcbM9ugvYliXb0oKjFGojetrrj+QVw=;
	b=ZpOZqfaixwsnXc24kFvnOaKvAyGZ1TyRuFVjxUai/r4I/ziaUkwT7tolWu9uY8PLVl
	pWuzrT5riQuX3LKezO9buD6q1ZGPnk17cUzNglmq5Mu+GJaO+DQIk3fwyA9kwm8OHFWw
	mR4QNQPQGobh5xjwVuFnGMKaFXSa1xDuPPcnddtT1lBzCNpjSrb4EaNqGrCzG/QlpClv
	18yuAqReDFPomO5xlJs/W9g0s4cFARvuuSvvdz0STr7pzXqXB3B/65ivb4cNsQbdFKPt
	AYqN6iJbhTQhiaEnJPUc/K3L5XlFqLNbio0zLO5c1eR6cWtugUL1jR4daTN9CvIKQjvb
	WWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PvN9OQrfqq284FcbM9ugvYliXb0oKjFGojetrrj+QVw=;
	b=lVUaTtdk8RleRsImSkInSHNqfPtmV1B3jzc+4GUnSl4E1WSEIBm1K/N0HNxcCZOYRz
	i2WIjpXpanyhRZbW+pA1Sls2z20w21dr3kaa63k/7mdUCubFoWqS20BBoHFK6sMoZK+D
	E4bhFYTwKfOsHgJUjRJ0dXNbXGJv5r2k8P8wZbt/2rhroIXZdHXu7C06pVCx43dNePaJ
	EY9G5cL9CzECVatLZK94PoP++IsTMEOh7xXLBPl0dMHFGx/aen4GYWVuJIjTRve9Lpk4
	4kpplEsvYWhvSB5s62pw1D0BMW2n1O0fEwNJkjAQxc7nrKCB34t8y1ly7UzjDaDz4c3D
	tPiQ==
X-Gm-Message-State: ALoCoQna4PCd1VZAvhip4aqhv2dNNqEMRCFBU4qXqEZAehayTBKJP4GXc9+oojtvJMKjhFsjxHHo
X-Received: by 10.28.55.212 with SMTP id e203mr19838100wma.7.1447680235872;
	Mon, 16 Nov 2015 05:23:55 -0800 (PST)
Received: from localhost ([78.129.130.236]) by smtp.gmail.com with ESMTPSA id
	t194sm18577315wmt.11.2015.11.16.05.23.53
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 05:23:55 -0800 (PST)
From: shannon.zhao@linaro.org
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
Date: Mon, 16 Nov 2015 21:23:04 +0800
Message-Id: <1447680189-2128-4-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::229
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-devel] [PATCH v3 3/8] hw/arm/virt-acpi-build: Add power
	button device in ACPI DSDT table
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
X-TUID: V6PvlN3FW4Lk

From: Shannon Zhao <shannon.zhao@linaro.org>

Add power button device in ACPI DSDT table.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Wei Huang <wei@redhat.com>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt-acpi-build.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bf6b934..b25c90b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -340,6 +340,18 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(scope, dev);
 }
 
+static void acpi_dsdt_add_power_button(Aml *scope)
+{
+    Aml *dev = aml_device("PWRB");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
+    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    Aml *method = aml_method("_STA", 0);
+    aml_append(method, aml_return(aml_int(0x0F)));
+    aml_append(dev, method);
+    aml_append(scope, dev);
+}
+
 /* RSDP */
 static GArray *
 build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
@@ -558,6 +570,7 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
                       guest_info->use_highmem);
     acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
                        (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
+    acpi_dsdt_add_power_button(scope);
 
     aml_append(dsdt, scope);
 
-- 
2.1.0

