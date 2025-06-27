Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp788463dye;
        Fri, 27 Jun 2025 02:59:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNhE55iQf+rsTNkkdSTzJ+7JmvetJJbW/SmmfqOL5C4QiBPFeRXhelxE6YxznPrAFIV07VQPf12aiPmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHBcAaKPSiuMlH01yc0IgeQLxR9Ctswci2vcDoSTee/8yqimAn9aKJEdrpmnkarl0JjFlJn
X-Received: by 2002:a05:6a21:1343:b0:220:92f:4d97 with SMTP id adf61e73a8af0-220a127f936mr3616849637.4.1751018354000;
        Fri, 27 Jun 2025 02:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751018353; cv=none;
        d=google.com; s=arc-20240605;
        b=AJYA30TrEJ/iKjFCTiY+CIKrmGicaUQpAIymlXJmLDe1/H5iPLKeiJpULiqHuvJhcU
         Y2Bq5zWWxqsDtDRpIaSqqqWNrcoLX9w6W8mqF3v7PmikvVJlwBhKtiWwntG/5v2jVdqN
         qUDIYGhuknmjE+Uxo9hrMTSMmxz5W9o6JT3HLkdlkJN5lu/AZZkA38bCENVmFJKcjeFu
         qeJbDVmeo/4Ki+soKm0s3d/UHWXLWPzSEdddwm0vKOKZGGGQEQXo+SSC5jwuKxopU56i
         Gr+h335Grw9daiTEiNZmp+IUF8yclBck47dYXGUKYxy97WMIjW5Ls4kwoGHudLy4jU46
         WQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M9GO+cAOqe10bNsJBdFignWcaS8Shu48ZQc9EONYkr0=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=LsxMXc7t1Kkm86nzGWfqwFQTpNTYP62vX6q231UQELMxPIIKCaT1Bi2M86bA1HPZJs
         DFvHeIpViMboZ8P1SaEEh/3Vm43ymFBw+87x0epjqVxOeuLG5FR7ygO++XwJRH3C2ZYx
         qx6OJpabkNmTGX3uABuiVcJXWP6dh7Dx5dDGBTd8kTN8cp3DER9VOJYISph7YqprqEM3
         ktNDylyZrtpbTsK1YgKDVlqXAsWETOcUYQN/U0QB28kdlB7tBB0cWNSbyCVOqKi8fsMF
         n/xynX9phOaVBcDA+aFcm2mO8WIc/AyjdN10fnEwjHOaCccjgh7rMAtUKdseMkxmmonx
         4/7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMYVzmZv;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b34e3244419si1601473a12.517.2025.06.27.02.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMYVzmZv;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751018352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M9GO+cAOqe10bNsJBdFignWcaS8Shu48ZQc9EONYkr0=;
	b=OMYVzmZvO0W9OjWu7Z/eRfVUE8AEDZs7HwdyrAV392RcmwqOOX9QQjp/Y9EDgsVM5XOFzt
	rU2d1sZxG7WPxwkp8lmRj6yxJGz8sxXuVjURQOuu04pP/hH27DLKMZIkySOWaq7fLsN7jZ
	8fbPHCokS2VBE9j2BxHTrFa8YV+FQ90=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-p1lmLlWUP26elnNAp9zNOQ-1; Fri,
 27 Jun 2025 05:59:07 -0400
X-MC-Unique: p1lmLlWUP26elnNAp9zNOQ-1
X-Mimecast-MFC-AGG-ID: p1lmLlWUP26elnNAp9zNOQ_1751018346
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B29D7180028A;
	Fri, 27 Jun 2025 09:59:05 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9DE7E19560A7;
	Fri, 27 Jun 2025 09:59:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 31/32] tests/qtest/bios-tables-test: Add aarch64 ACPI PCI hotplug test
Date: Fri, 27 Jun 2025 11:55:20 +0200
Message-ID: <20250627095620.3300028-32-eric.auger@redhat.com>
In-Reply-To: <20250627095620.3300028-1-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: crwLHWkvIr7G

From: Gustavo Romero <gustavo.romero@linaro.org>

Add 2 new tests:
- test_acpi_aarch64_virt_acpi_pci_hotplug tests the acpi pci hotplug
  using -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
- test_acpi_aarch64_virt_pcie_root_port_hpoff tests static-acpi index
  on a root port with disabled hotplug

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- add -device pci-testdev for the first test case
- fix the chassis
- add a test for static acpi-index
---
 tests/qtest/bios-tables-test.c | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0b2bdf9d0d..fbb56f6422 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1643,6 +1643,54 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
 
 }
 
+static void test_acpi_aarch64_virt_acpi_pci_hotplug(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .arch = "aarch64",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 256ULL * MiB,
+        .variant = ".acpipcihp",
+    };
+
+   /* Use ACPI PCI Hotplug */
+   test_acpi_one(" -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on"
+                 " -cpu cortex-a57"
+                 " -device pcie-root-port,id=pcie.1,bus=pcie.0,chassis=0,slot=1,addr=7.0"
+                 " -device pci-testdev,bus=pcie.1",
+                 &data);
+
+    free_test_data(&data);
+}
+
+static void test_acpi_aarch64_virt_pcie_root_port_hpoff(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .arch = "aarch64",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 256ULL * MiB,
+        .variant = ".hpoffacpiindex",
+    };
+
+   /* turn hotplug off on the pcie-root-port and use static acpi-index*/
+   test_acpi_one(" -device pcie-root-port,id=pcie.1,chassis=0,"
+                                          "slot=1,hotplug=off,addr=7.0"
+                 " -device pci-testdev,bus=pcie.1,acpi-index=12"
+                 " -cpu cortex-a57",
+                 &data);
+
+    free_test_data(&data);
+}
+
 static void test_acpi_microvm_prepare(test_data *data)
 {
     data->machine = "microvm";
@@ -2580,6 +2628,10 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/virt/numamem",
                            test_acpi_aarch64_virt_tcg_numamem);
             qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/acpipcihp",
+                           test_acpi_aarch64_virt_acpi_pci_hotplug);
+            qtest_add_func("acpi/virt/hpoffacpiindex",
+                          test_acpi_aarch64_virt_pcie_root_port_hpoff);
             qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
             qtest_add_func("acpi/virt/oem-fields",
                            test_acpi_aarch64_virt_oem_fields);
-- 
2.49.0
