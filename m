Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp748200lfp;
        Tue, 14 Sep 2021 07:40:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXnCky8EUi7txbyajkvXOIAo34MGOC9cyNV9UnujPjrisZfY68JhGQoCCVFncG73fDtK/w
X-Received: by 2002:a05:6402:206d:: with SMTP id bd13mr19801998edb.196.1631630440493;
        Tue, 14 Sep 2021 07:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631630440; cv=none;
        d=google.com; s=arc-20160816;
        b=qD8ozpJGE/OLOX2BrfvWj1N5YmS0PfUdcVYJjqEltBzvHTiBGU3bBAC71rf/nP7ZNk
         XXGHY8yo5JXIUD0dgsFwtaGmtsgrCLe5R/FZ30THMmFj+J2dubgFpHMHyeOHvKyN+0QD
         /JX1+VODJw+Xrzfc9erqw1kT8kM34iqqt2kawpcKnGjHPJVSSsoYNMScAsrP3Loq+JFn
         Y5HN6CtB0eg3UuHgnSZa+igxzI1A/7ra8d/ceCJ2fXDDWrRo0KACxvn06tWaQYxq6OU4
         XRw7U6+L2tZx3wX0MGMzPMdylJ92a+STJFy2fHSCpNPNqx4/2Gh2ymcXL5wTUejWCm8y
         oF/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3D6Y3PvRWCDvWbbifCcyvKIH074CbOWIFebtpK8KpRk=;
        b=GDPb+T538S1GCHofAAMXhFEhMf7gUehFl6eHpA2BzCWAxhw5M8UGlLPR2q25m19l92
         GfVbsnvWMMqJhxSmAgBRixBQjyV2q9N7+1aF/xNtcxPvBNTuhy2mUG0jbBLRgWg9wE6u
         G98Yb19zY/k9BQP6+P7qcu3rvNTNc+XI+U+TxTjFjX0eD0b6WztvymW5XwdFM4pZeAM8
         tD2jQ/kkUSJRq13m7MooB+QJ2YlyqhFxsUqynNSvJe/H8ZfAYNpiDsW00bPoo9lQ+lR8
         EazNxUv6ganqr9nCTOc1cQEXUcJ3leeuL+iYnas4GRMu9zvJsNKf1ehSbrzY1IFeb6Gv
         D24g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wHr8Bc/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si10459889ejl.583.2021.09.14.07.40.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:40:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wHr8Bc/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9bz-0005Vq-Ij
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MX-0006Fh-4z
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:45 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MP-0005Rh-Bd
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:40 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so2266126wmq.1
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3D6Y3PvRWCDvWbbifCcyvKIH074CbOWIFebtpK8KpRk=;
 b=wHr8Bc/xfufFLw8hn6VUZNdbS2j4KdCkE9Nmy6YtCnuWrPpIdid1/7QYAFo/eV1MMM
 6nHglWfTlQnzP0PUU0pAvRTECKHwpZjcdFoLNNR5dHUOAXaltaD1h8JeXd/7OWOaNa0U
 rC+VGI1vUk4SL2t1naba0qh6QNvE99Csa41CjhnF1i1ZNLh4he79EAG4tDQ8zL15w1Je
 DCiJFUl4II6iHot7PbZEkhgvGWWgyGlhBlFU7TnjtKBOjYiQEHGlFBmKZDO7NYN2QZXt
 WiNTUUE73OlIh03zS4s+U7nZo3DM5PY66c4BW+FRu3ULU8biC64fFuKeJUDnN7gLcPrb
 HMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3D6Y3PvRWCDvWbbifCcyvKIH074CbOWIFebtpK8KpRk=;
 b=36RT83ubtcUzCkRNtQzfxvrf3aeLy3EapGUZaY8cssjF8+eGYemQwvi8ORTTTR6ag1
 9Jn22Gxr1K9SqRY74nmiKsJl60I+lGm6OjOEeUO548/lWB0f3IiWza3DF8K+fjJ+48SY
 kdvDdG3pXnJx0sfqzAs+1DmF69mcxqmnue2+qRGPpaeETwDxtR3wtYArN/77CI0dZdNM
 1f/nw9+EkxcFvyKxASWlU7uzjosi7uDg4LylnJdDtByA52UQ/rq/C4apPtQkkOGvNDnG
 b/m55eu75HoVikNdqJNP0iLGYiNXDvSRj0anwBZro3JivrrMih5py+PuR/JV7Lhm22lY
 79ew==
X-Gm-Message-State: AOAM532bkFu8CZxcozZAPPAnxydSAtYRTu5DNBHUI6ctqiXjPGTDz/bj
 +D7FTwsGjTidduiIZF6yRQdcQA==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr2532533wmq.39.1631629468447; 
 Tue, 14 Sep 2021 07:24:28 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:28 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 07/10] tests/acpi: add test cases for VIOT
Date: Tue, 14 Sep 2021 15:20:02 +0100
Message-Id: <20210914142004.2433568-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TFsiN2bwdYFQ

Add two test cases for VIOT, one on the q35 machine and the other on
virt. To test complex topologies the q35 test has two PCIe buses that
bypass the IOMMU (and are therefore not described by VIOT), and two
buses that are translated by virtio-iommu.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test.c | 39 ++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03055..f8bfe2f247 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1403,6 +1403,43 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_viot(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".viot",
+        .blkdev = "virtio-blk,bus=pcie.0",
+    };
+
+    /*
+     * To keep things interesting, two buses bypass the IOMMU.
+     * VIOT should only describes the other two buses.
+     */
+    test_acpi_one("-machine default_bus_bypass_iommu=on "
+                  "-device virtio-iommu "
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
+                  "-device virtio-iommu", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1567,12 +1604,14 @@ int main(int argc, char *argv[])
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

