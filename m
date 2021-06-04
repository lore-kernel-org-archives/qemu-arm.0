Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 32sm7976328wrs.5.2021.06.04.08.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:53:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 492161FF99;
	Fri,  4 Jun 2021 16:53:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH  v16 10/99] qtest/bios-tables-test: Rename TCG specific tests
Date: Fri,  4 Jun 2021 16:51:43 +0100
Message-Id: <20210604155312.15902-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0HOar1F7KYzn

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Some tests require TCG, but don't have '_tcg' in their name,
while others do. Unify the test names by adding 'tcg' to the
TCG specific tests.

Reported-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-11-philmd@redhat.com>
---
 tests/qtest/bios-tables-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ce498b3ff4..ad877baeb1 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc(void)
     free_test_data(&data);
 }
 
-static void test_acpi_microvm_pcie(void)
+static void test_acpi_microvm_pcie_tcg(void)
 {
     test_data data;
 
@@ -1475,7 +1475,7 @@ static void test_acpi_oem_fields_microvm(void)
     g_free(args);
 }
 
-static void test_acpi_oem_fields_virt(void)
+static void test_acpi_oem_fields_virt_tcg(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1555,14 +1555,14 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2);
         qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
         if (strcmp(arch, "x86_64") == 0) {
-            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie);
+            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
         qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
         qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt);
+        qtest_add_func("acpi/virt/oem-fields", test_acpi_oem_fields_virt_tcg);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.20.1
