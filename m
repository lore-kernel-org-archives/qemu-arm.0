Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 92sm7893175wrp.88.2021.06.04.10.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BB9381FFD7;
	Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v16 66/99] tests: do not run qom-test on all machines for ARM KVM-only
Date: Fri,  4 Jun 2021 16:52:39 +0100
Message-Id: <20210604155312.15902-67-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GtgyZ+QBOlx7

From: Claudio Fontana <cfontana@suse.de>

on ARM we currently list and build all machines, even when
building KVM-only, without TCG.

Until we fix this (and we only list and build machines that are
compatible with KVM), only test specifically using the "virt"
machine in this case.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/qom-test.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
index eb34af843b..b0a6d10148 100644
--- a/tests/qtest/qom-test.c
+++ b/tests/qtest/qom-test.c
@@ -90,7 +90,27 @@ int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
+    /*
+     * XXX currently we build also boards for ARM that are incompatible with KVM.
+     * We therefore need to check this explicitly, and only test virt for kvm-only
+     * arm builds.
+     * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
+     * are built for the kvm-only build, we could remove this.
+     */
+#ifndef CONFIG_TCG
+    {
+        const char *arch = qtest_get_arch();
+
+        if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
+            add_machine_test_case("virt");
+            goto add_machine_test_done;
+        }
+    }
+#endif /* !CONFIG_TCG */
+
     qtest_cb_for_every_machine(add_machine_test_case, g_test_quick());
+    goto add_machine_test_done;
 
+ add_machine_test_done:
     return g_test_run();
 }
-- 
2.20.1
