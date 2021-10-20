Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1838222lfc;
        Wed, 20 Oct 2021 10:42:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWDbA8wfJU4ho5o7WmssNdC/DnQlPexwi1g0jKv7rzqyYIGgdh7UTGtlSP4Q8TiX+7rN9Z
X-Received: by 2002:a05:6102:2913:: with SMTP id cz19mr1079519vsb.36.1634751765741;
        Wed, 20 Oct 2021 10:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634751765; cv=none;
        d=google.com; s=arc-20160816;
        b=uyWRtcz21x9z8TRc6qFe15U0Y/WBm322glNmf+x7T5dJARq0hBju3nw86fgN/93FCy
         vamoZPoZCp97bNQ3FZlzsjhxxG1N4UrpZlf6qsMKXJbOwOtmOPvod6zKVMhlR1TMHHsd
         8pC8R4PNBwgW1MQ0Uy931WM6bmdBLbhWBQ03g0LLzAfxAx+BlMu7j34fms0kvly60hHT
         yL/hZN6gGEon/s7y3GxqYlBwdlS5kM61zhpjubZXMpBTq/ouhWqdbsZrKsAf4vqWLVy2
         NB+a1KHhJeKK9uuSDp4oRT9HEhlqxtD0WjXFV3xf3tVkeyawQ/7tdvN6ZnnBeaQOlaH8
         9SVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=b6FkINxR9TYPTnIwt4QFR5QO1CjWz4r+7L+WyL24pqY=;
        b=lN/A5PSkrPGzGeI299tQet8Fzk281J0VDy8vjPGVN7OqruAzvSDtHyotM3XLYnNRqP
         Vkhcpqi4DQn9Dn7OxayJuyJc52xazhl3Qv/yvHU9oSM/L7/bOLHZgA+E9IhUu62z7ivR
         pnxlupn346PpJ19xxNxbYG9TiL+ycEU5yEFssy368rKNmyG9Ec7cU6k0DGcC/Lns+zmh
         Z2S56oGr1ZCqSAZ7fBSaG9YO5GdrGvWSLzZxmDlocsIWE49yIel40tGXfqjyeZKyV2/B
         p0TEIUQYjz9dLps+/AEITHTQQSf5eTDjOL6p8rQvfq1TJFlNCLMqBlJvbnecv9CfCukq
         XbBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TUt58ZwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ba8si3422162uab.64.2021.10.20.10.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 10:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TUt58ZwL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdFbx-0005i0-1T
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 13:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUf-0005S4-Qk
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 13:35:14 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUc-0002hw-JJ
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 13:35:13 -0400
Received: by mail-wm1-x32c.google.com with SMTP id o24so13032948wms.0
 for <qemu-arm@nongnu.org>; Wed, 20 Oct 2021 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b6FkINxR9TYPTnIwt4QFR5QO1CjWz4r+7L+WyL24pqY=;
 b=TUt58ZwLOXqIzqa7Z8fjADGTOnCKRNIroPpeCTpryE1y7pUkb6zTXOqDaT500SzV/K
 G9XMxhJOneCzhTeegp0gDEyrQOUqarpJ3KAPHQZZdSiOjBKug0hzb4kCuKoXovs8/JfM
 CLg5RBo2vLpaIOIrNbAnj3o3DusDMutYDen5zNnqhXJf+wsEhBBgXZ+m6+zKCcGyQYA3
 f+lUNNFMmZMze3BVQXyjrJx5HXvo6xYcu38XJsKqxmoXjVMF7SNXzLtxt2opggS1Yx4B
 onQMRZzCTuOlPgQZterx98AftbkNBtt/E9fOVd7RTRc8XA8Fp8xK10Stj05/jf1awryr
 GJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b6FkINxR9TYPTnIwt4QFR5QO1CjWz4r+7L+WyL24pqY=;
 b=PxHrU0ynRGFgb7QTfmJOZF274FffiRdAyQPJpfiJOmfixVZmbRHiaQtxs/d1dPrKsh
 Ps4pht21BFSXDdz/VLCg11DhCoDX5PGmS7KaZg1n28r/XPhr71NjvLSrasJK7YsHNFlK
 V7A7q1YLOH8iAhropiiGXDND6V2nmfiIE6T9U1wSPB3JIxdA7IYgRhiBDOr3bqSdibaW
 RQXaF5wZXz+y0BgKxhaH8Gssnymc45B7gcstEvyXRXISjTmvIyBvuRFZLcIsISci1EvM
 Vbrg/DHNPzkTobKmy5fgogrvlE+ktHu7O38R7Xr+rI3eCqqnPlysndsd84MK9xCHfhkA
 Z6QQ==
X-Gm-Message-State: AOAM533Uy7VOAKd+UqOArKBlNHnvziU46uT1V4GxGBs+/PApeMYntV6X
 GX/D8H8mkbn9KskLi7hKM4PNlg==
X-Received: by 2002:a05:600c:1c10:: with SMTP id
 j16mr713499wms.28.1634751309034; 
 Wed, 20 Oct 2021 10:35:09 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:35:08 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 10/12] tests/acpi: add test cases for VIOT
Date: Wed, 20 Oct 2021 18:27:44 +0100
Message-Id: <20211020172745.620101-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jmbXKnsob2tk

Add two test cases for VIOT, one on the q35 machine and the other on
virt. To test complex topologies the q35 test has two PCIe buses that
bypass the IOMMU (and are therefore not described by VIOT), and two
buses that are translated by virtio-iommu.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03055..599b155201 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1403,6 +1403,42 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_viot(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".viot",
+    };
+
+    /*
+     * To keep things interesting, two buses bypass the IOMMU.
+     * VIOT should only describes the other two buses.
+     */
+    test_acpi_one("-machine default_bus_bypass_iommu=on "
+                  "-device virtio-iommu-pci "
+                  "-device pxb-pcie,bus_nr=0x10,id=pcie.100,bus=pcie.0 "
+                  "-device pxb-pcie,bus_nr=0x20,id=pcie.200,bus=pcie.0,bypass_iommu=on "
+                  "-device pxb-pcie,bus_nr=0x30,id=pcie.300,bus=pcie.0",
+                  &data);
+    free_test_data(&data);
+}
+
+static void test_acpi_virt_viot(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    test_acpi_one("-cpu cortex-a57 "
+                  "-device virtio-iommu-pci", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1567,12 +1603,14 @@ int main(int argc, char *argv[])
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
+        qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
         qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.33.0

