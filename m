Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1373890lfg;
        Sat, 1 May 2021 15:37:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzozukw5nKPu2KAY/D7JSWT1HriN0aj6Y1IIJ2DShIMZNCnPZblOt+wPzuOShsXp7aIFuF/
X-Received: by 2002:a17:906:fb8e:: with SMTP id lr14mr4424030ejb.357.1619908643969;
        Sat, 01 May 2021 15:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619908643; cv=none;
        d=google.com; s=arc-20160816;
        b=lS9ybGk5Q4aVjg38/r6B4FzuEIZR2oNeh3kz8ECnrsG1J5/W41Z2sGH+tYca9stx68
         iw77R2LcDc52cOXh6f5Q/UIOuOqmG6WTpT7PW+ynH1k4gylvmStRLJGUdocrrodGoT/K
         uxsEMibAAXd1oIMegn4Q7Zt6yfdsQ6+lBjI80oev23jntQTDl9zAkHh6FuW2dL9wP7P0
         EYJkKyzVHTGD2RQkLwdfs4UUvJ7zsr5dJE5CdCXYUZzdeKrrnHNwrw/OBBj81yHdgZaE
         nHwbExlTl3QvrIPLDeV9u8nNlAdiSs1k8UNV17WIaaXiy60GPvYfdSTTXUfVQ0d5R3Rr
         j3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/QexIH/VTNKxOuVblouGzmBuPgjBWLL7wx7SLN7JtrI=;
        b=U0z5bjOeZcfqyB56+m2eo+tCcXEi0Rdy8AwnjYUpTQ/UiFtG68iNz+YlAv/DrwPWp/
         6Z11PDByl8fa/SYbYfJF9LISciaMMhWY3e8bAH3r9kotLyKCqt4vCKDIuhdL/KQvyUpp
         q9wY5iR8BYeV44dsOhBvOaQJYxtFBUSO/n2BHdNCDCnvhuVVz/ctJi0+mNwE3BRFmsN7
         uqPXdfEQQAf1NCMHnUwsjZPO+oMknCXiYJpGpRCJczLPFLujsQ6bMGmCH8Xao9y7/Gxb
         oiJUA+6vdz1W8OFWt1O6fe3vH/+1z4p7CEWqN9bD38gz7xrM4h06GWzsv3fvsQ2f1Bt0
         bfrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ENeYPdc6;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id a22si6562407ejg.414.2021.05.01.15.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 May 2021 15:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ENeYPdc6;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619908642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/QexIH/VTNKxOuVblouGzmBuPgjBWLL7wx7SLN7JtrI=;
	b=ENeYPdc6rba3mL2XulpWCMnx4Sv9AjHeBNZZE3hNeUjlgqGNUYHNoI4dfro68t4G/grBnt
	0jUh6jujOXZA6ChiJ+nu5npyZ2AIdV9ayxmwovwkBScp4TIfFlhQWoAA3orPdfAf88w4vU
	2Bj7bEP6AMzVN6LzcK62be11f9rqSrU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-d1dTNiJTOIuotm5-Vh05Hg-1; Sat, 01 May 2021 18:37:21 -0400
X-MC-Unique: d1dTNiJTOIuotm5-Vh05Hg-1
Received: by mail-wr1-f69.google.com with SMTP id 88-20020adf95610000b029010758d8d7e2so1266619wrs.19
        for <alex.bennee@linaro.org>; Sat, 01 May 2021 15:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/QexIH/VTNKxOuVblouGzmBuPgjBWLL7wx7SLN7JtrI=;
        b=pbtoMKhHDN0uqLJDL7xVafL9fFVXAtuof8r+tTRx6mfgdW8IQHAulueJRqRo+e2YGe
         FYJEW5RwvT/sKeWuzf7MJIa9nYAZpHWhxmyzGcZ1QwTHhTeQMxlBJAMmmoD5rrvsVwVo
         E6+TQZxHToDB39hYxTHgfj5xfWm/V1/Uq8Vzv++oDqMS4ei7R9uLfP1eYEp6ESBS+6EX
         chu/v6iX4A8xWHpwpt+F6EGj4lOqHnwS3O7XckqmyzOMKuClnycvL1m4vQbExh0pm0uI
         CHeX+lwqzfBgCYHjEd9uKHTy97O6ec5zpEHuBlNVJ3hvUP/miqacG0MyijwcXaurFYMg
         wnbA==
X-Gm-Message-State: AOAM533vx7IXw+e7x/3/y0wk33e/+H4JE40hREflgJejUSbyNiyWvTJK
	0aPJoQv30vCeCccla2KmIFBLnOjFbUp75ewGEPxlZzQFR57WyEWEHWh3Z4EVm9kj5m6BV2IV0Qx
	bVmNhPKK/ae6b7iRQ
X-Received: by 2002:a7b:c382:: with SMTP id s2mr9239104wmj.75.1619908640209;
        Sat, 01 May 2021 15:37:20 -0700 (PDT)
X-Received: by 2002:a7b:c382:: with SMTP id s2mr9239092wmj.75.1619908640083;
        Sat, 01 May 2021 15:37:20 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
        by smtp.gmail.com with ESMTPSA id t17sm6524586wmq.12.2021.05.01.15.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 15:37:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH v5 08/10] qtest/bios-tables-test: Make test build-independent from accelerator
Date: Sun,  2 May 2021 00:36:36 +0200
Message-Id: <20210501223638.510712-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4qz+lonZsTWh

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by an assertion.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 47 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 156d4174aa3..a4c7bddf6f3 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -97,6 +97,7 @@ typedef struct {
     QTestState *qts;
 } test_data;
 
+static bool tcg_accel_available;
 static char disk[] = "tests/acpi-test-disk-XXXXXX";
 static const char *data_dir = "tests/data/acpi";
 #ifdef CONFIG_IASL
@@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_data *data)
     char *args;
     bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
 
-#ifndef CONFIG_TCG
-    if (data->tcg_only) {
-        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
-        return;
-    }
-#endif /* CONFIG_TCG */
+    assert(!data->tcg_only || tcg_accel_available);
 
     args = test_acpi_create_args(data, params, use_uefi);
     data->qts = qtest_init(args);
+
     test_acpi_load_tables(data, use_uefi);
 
     if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
@@ -1504,6 +1501,8 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     int ret;
 
+    tcg_accel_available = qtest_has_accel("tcg");
+
     g_test_init(&argc, &argv, NULL);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
@@ -1512,56 +1511,62 @@ int main(int argc, char *argv[])
             return ret;
         }
         qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
-        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
-        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
         qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
-        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
+        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
                        test_acpi_piix4_no_root_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
                        test_acpi_piix4_no_bridge_hotplug);
         qtest_add_func("acpi/piix4/pci-hotplug/off",
                        test_acpi_piix4_no_acpi_pci_hotplug);
-        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
-        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
-        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
-        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
-        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
-        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
-        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
-        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
-        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
-        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
-        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
-        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
-        qtest_add_func("acpi/piix4/smm-compat",
-                       test_acpi_piix4_tcg_smm_compat);
-        qtest_add_func("acpi/piix4/smm-compat-nosmm",
-                       test_acpi_piix4_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
-        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
-        qtest_add_func("acpi/q35/smm-compat",
-                       test_acpi_q35_tcg_smm_compat);
-        qtest_add_func("acpi/q35/smm-compat-nosmm",
-                       test_acpi_q35_tcg_smm_compat_nosmm);
-        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
-        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
-        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
-        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
-        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
-        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
-        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
-        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
-        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
-        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
-        if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+        if (tcg_accel_available) {
+            qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
+            qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
+            qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
+            qtest_add_func("acpi/q35", test_acpi_q35_tcg);
+            qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
+            qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
+            qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
+            qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
+            qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
+            qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
+            qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
+            qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
+            qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
+            qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
+            qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
+            qtest_add_func("acpi/piix4/smm-compat",
+                           test_acpi_piix4_tcg_smm_compat);
+            qtest_add_func("acpi/piix4/smm-compat-nosmm",
+                           test_acpi_piix4_tcg_smm_compat_nosmm);
+            qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
+            qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
+            qtest_add_func("acpi/q35/smm-compat",
+                           test_acpi_q35_tcg_smm_compat);
+            qtest_add_func("acpi/q35/smm-compat-nosmm",
+                           test_acpi_q35_tcg_smm_compat_nosmm);
+            qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
+            qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
+            qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
+            qtest_add_func("acpi/piix4/acpihmat",
+                           test_acpi_piix4_tcg_acpi_hmat);
+            qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
+            qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
+            qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
+            qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
+            qtest_add_func("acpi/microvm/ioapic2",
+                           test_acpi_microvm_ioapic2_tcg);
+            if (strcmp(arch, "x86_64") == 0) {
+                qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
+            }
         }
     } else if (strcmp(arch, "aarch64") == 0) {
-        qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-        qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+        if (tcg_accel_available) {
+            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
+            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
+        }
         qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
     }
     ret = g_test_run();
-- 
2.26.3
