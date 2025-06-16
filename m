Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1741591njc;
        Mon, 16 Jun 2025 02:51:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVveG3ec8WwN/Q05p0sy6SoVCPeuHxzX5YI81IiBH9bKn/H1djEaShICEn3xTl/s4BC9et3zf2dAdK+Vw==@linaro.org
X-Google-Smtp-Source: AGHT+IHY9MFBBLnrR0g0pOZAo0IccEZ+XRr72ICXOMcoElF7ui5jgtBcSgG8YFLnf1JpnN52JcFF
X-Received: by 2002:ac8:5fc1:0:b0:4a3:530b:2880 with SMTP id d75a77b69052e-4a73c4beb28mr135907371cf.14.1750067505005;
        Mon, 16 Jun 2025 02:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750067504; cv=none;
        d=google.com; s=arc-20240605;
        b=O6XzkqJLq8JBh8HacHWpWxRHjxKgpDgHCuuEl8bn4thNRy63o8f8luv01llzDEz9G9
         zB4hB08BgkNGFFoNsoCbbAQrAeOPkvREGWHgkezcZKGDz3nnITSA08Rclphv3guIW2g6
         /Mzvj5Ti1q4saToRKQ6bPGArHWwm3h97mpzq+cZo3W4HHvBnsbO8S2Sl6m8MQ4BNsVia
         yI8ubmLxyuP2JetBN/+e+QYlqG1tWMVIc2QHLjEpDgoJgkY8wlXX2nwZx5U9XI6XCE3X
         Y6yXvnqoQm2KNTebbwCAd+UrPh9mhEwMmquAbP97viTAVQSn4oa9vzV8WeAtWyz2tuwP
         Glyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ektIfxHpFePB3v4eolQYFQ2vxfgZoC+zxDbNNrDcpes=;
        fh=3+/pQVIKD31FE8qJaDVh0A7e2m9TMoY7e0VvIw0mRHw=;
        b=FMH8nPXXmTSJ13LZqZMVmAXTvn/A1B10UeNOQ1C5e9YPUJhuvHKKhXcF8mAzBwQgQH
         2963RhBOsBhIlmdhx3+Q32WPaTk8S9kzBkYVgNCWZH2xQaI/qojfWzyj1Q55AFFeCAUo
         SUXyZli22DEsnWyzDnikSyIqxw3MmhGHWdGb6M41uEEJoOM7aVuReqp1ezp9ms6Xlw5x
         QNsTGR2oz8H51U3kS+ecQpPnlvg3dJF9wXDUq0yzItT5EzrDeM94nGkruZOf0eHZN23y
         oFhQMjaJzF8dI1vkdctETvsQgLwz9huWYvgwvjfgsyoIVV0T2pp4D/lrmQC0J5Kw13xn
         RPUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SNvunNdz;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a47cfeasi96214521cf.271.2025.06.16.02.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SNvunNdz;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750067504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ektIfxHpFePB3v4eolQYFQ2vxfgZoC+zxDbNNrDcpes=;
	b=SNvunNdzsPoDD8foBwPGNAhv4EXu8YTS6o4oZ9JOpnVOTbTNa8W8Q/VsELkB0IpwdKx1H7
	S4d0+JEBLIqcSDMXajalIQzcOyApSUpNbcNuw6R3QJFVQ56d4zROu9w1oEPymqcuehJHRm
	7NtLyRYguWyi2qxOZcmtv9cu9Ze49nw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647--zxra9qZP8aP7G0rzjIsPQ-1; Mon,
 16 Jun 2025 05:51:41 -0400
X-MC-Unique: -zxra9qZP8aP7G0rzjIsPQ-1
X-Mimecast-MFC-AGG-ID: -zxra9qZP8aP7G0rzjIsPQ_1750067500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E6ED51809C97;
	Mon, 16 Jun 2025 09:51:39 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 65E7C19560A3;
	Mon, 16 Jun 2025 09:51:35 +0000 (UTC)
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
Subject: [PATCH v3 28/29] tests/qtest/bios-tables-test: Add aarch64 ACPI PCI hotplug test
Date: Mon, 16 Jun 2025 11:46:57 +0200
Message-ID: <20250616094903.885753-29-eric.auger@redhat.com>
In-Reply-To: <20250616094903.885753-1-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 0K9ASYgMBjEx

From: Gustavo Romero <gustavo.romero@linaro.org>

The test uses -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
to force the usage of ACPI PCI hotplug.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/bios-tables-test.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0b2bdf9d0d..4b9e391eaf 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1643,6 +1643,38 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
 
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
+                 /*
+                  * We just pick address=0x04 for the root port to avoid
+                  * collisions with other PCI devices on the root bus (pcie.0).
+                  * It could be any other value that doesn't collide.
+                  *
+                  * The 'chassis' and 'slot' options equal to 1 have no special
+                  * meaning here, could be any integer, but we set them to known
+                  * values to keep the test consistent.
+                  */
+                 " -device pcie-root-port,bus=pcie.0,chassis=1,slot=1,addr=0x04.0x00",
+                 &data);
+
+    free_test_data(&data);
+}
+
 static void test_acpi_microvm_prepare(test_data *data)
 {
     data->machine = "microvm";
@@ -2580,6 +2612,8 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/virt/numamem",
                            test_acpi_aarch64_virt_tcg_numamem);
             qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/acpipcihp",
+                           test_acpi_aarch64_virt_acpi_pci_hotplug);
             qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
             qtest_add_func("acpi/virt/oem-fields",
                            test_acpi_aarch64_virt_oem_fields);
-- 
2.49.0
