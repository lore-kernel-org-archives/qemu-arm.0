Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp506598dyc;
        Thu, 3 Jul 2025 05:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRX9xY7dUzSrYKv5oqsikf9OsK4gZM/yHhJ0n8pS9k027dvruRhPUKrGmJZMimEnGqFpEY62au/2Y/Dg==@linaro.org
X-Google-Smtp-Source: AGHT+IG6ocnuoPFHJw4nmAK9DRZ/hheDDs1EAY6atMuIvBMR9vWbWBDwyx1R5dFkNzr+ncq84s7L
X-Received: by 2002:a05:622a:1a90:b0:4a7:189b:98ad with SMTP id d75a77b69052e-4a98799987emr51318961cf.14.1751546437525;
        Thu, 03 Jul 2025 05:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546437; cv=none;
        d=google.com; s=arc-20240605;
        b=eax77hZrSQVZ/C/CCUDZ9qqq2alq5z+qqhHkSZR4QVuaiK/2+V3MEjtSJOBb/Ayz4W
         MgdH098FPi8UsrLmt2e59FDV3Kpks5z+Lew7tKFhlpOZKuxFLjAQRpfOF75pYt40Yfb6
         q4FznIbxD3HCJ4sZ2REvlbzvlD1bg5HSJdm7VfWdFKbQ9gG/JtiowSRYj2Io9aTx0mNp
         1lOYJlsklZe9JsIEKEpGasDRXpQ5z+MXDpLsoTlodGl5NC+ycLXAvfYDDrYBa6EAxQep
         DrZdRxl7KXQTLss23EueV6f0lr2C5P4Ql3vAuBiU3boOdH5BzDXN6vr3LMALxtDMMPmj
         tsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7z4t23L2CEjvRbW4POxEjlHbPc7Y86a0BBQtX1AsNc0=;
        fh=wjCXBlYiEFaE/nRXdXhm/QzbgpklGNl9u9+2G4gHJbk=;
        b=CH2iT0PnIKSckJqBsSB9897CeL3p2mohG2VzBwFBR1Un78PuO3yx42Cp02FE0IXgmQ
         MtjFon+Kl5eZUw4PXMz01cfG+14Ad6UH0i9m0F5a4d2QLJnYIONhHNSO1mLWF4XqNs03
         vCx1k6p6MbVbSWCgwRvbwNP+emwkHXwX0RtrIeNFKqr01v6ONvLrqcHLsemSGRmklX3Z
         lqMtlH0/YYejerg9YHx8rl/aYgM4uRpiVNpvD7W0GqPSVrUUlCoGO2IAilM55VVnCTsE
         4KPorqQyU31eIZvUc+20ZGXJ/36Rbi1b0M6UegnYLpJvpjE1R1bm6YFy6LSp19kQtTdp
         3iDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TLPJMqEC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc23260csi149617481cf.332.2025.07.03.05.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TLPJMqEC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751546437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7z4t23L2CEjvRbW4POxEjlHbPc7Y86a0BBQtX1AsNc0=;
	b=TLPJMqEChlp9mM4fmfL8ei3b23yUgT4ZcGNEb0cZafwA0pJ6C+pujCJI9MkZpjvUcPuY3a
	MjIfRTQZhLONtLAHjGu3dVkhaNhoAFyxoQdV4I50hl9Ll+RPkr0oDmRm+YDxNn2ObExHae
	fCzL/v46auYryRCEcIwzm46hjKX+Nac=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-VCGK9_JxP4qRm1RqCS9Uxg-1; Thu,
 03 Jul 2025 08:40:36 -0400
X-MC-Unique: VCGK9_JxP4qRm1RqCS9Uxg-1
X-Mimecast-MFC-AGG-ID: VCGK9_JxP4qRm1RqCS9Uxg_1751546434
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72ABA1955F38;
	Thu,  3 Jul 2025 12:40:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.16])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EE13E180045C;
	Thu,  3 Jul 2025 12:40:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	Jonathan.Cameron@huawei.com,
	gustavo.romero@linaro.org,
	anisinha@redhat.com,
	mst@redhat.com,
	shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v5 34/36] tests/qtest/bios-tables-test: Add aarch64 ACPI PCI hotplug test
Date: Thu,  3 Jul 2025 14:35:34 +0200
Message-ID: <20250703123728.414386-35-eric.auger@redhat.com>
In-Reply-To: <20250703123728.414386-1-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: kZwA5KpoIfa7

From: Gustavo Romero <gustavo.romero@linaro.org>

Add 2 new tests:
- test_acpi_aarch64_virt_acpi_pci_hotplug tests the acpi pci hotplug
  using -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
- test_acpi_aarch64_virt_pcie_root_port_hpoff tests static-acpi index
  on a root port with disabled hotplug

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

---
v3 -> v4:
- add -device pci-testdev for the first test case
- fix the chassis
- add a test for static acpi-index
---
 tests/qtest/bios-tables-test.c | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 357bcefd37..1074b8d67a 100644
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
@@ -2602,6 +2650,10 @@ int main(int argc, char *argv[])
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
