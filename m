Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s7sm22532wmh.38.2021.06.04.10.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 79E9F1FFD4;
	Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Subject: [PATCH  v16 63/99] tests/qtest: skip bios-tables-test test_acpi_oem_fields_virt for KVM
Date: Fri,  4 Jun 2021 16:52:36 +0100
Message-Id: <20210604155312.15902-64-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nQA0nEXetVQ8

From: Claudio Fontana <cfontana@suse.de>

test is TCG-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/bios-tables-test.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 762d154b34..f8fe4b8efe 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1484,6 +1484,13 @@ static void test_acpi_oem_fields_virt_tcg(void)
     };
     char *args;
 
+#ifndef CONFIG_TCG
+    if (data.tcg_only) {
+        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
+        return;
+    }
+#endif /* CONFIG_TCG */
+
     args = test_acpi_create_args(&data,
                                  "-cpu cortex-a57 "OEM_TEST_ARGS, true);
     data.qts = qtest_init(args);
-- 
2.20.1
