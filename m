Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r4sm2614512wrt.26.2021.06.04.10.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A55A01FFD6;
	Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v16 65/99] tests: device-introspect-test: cope with ARM TCG-only devices
Date: Fri,  4 Jun 2021 16:52:38 +0100
Message-Id: <20210604155312.15902-66-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Kk9XxIT1HhFY

From: Claudio Fontana <cfontana@suse.de>

Skip the test_device_intro_concrete for now for ARM KVM-only build,
as on ARM we currently build devices for ARM that are not
compatible with a KVM-only build.

We can remove this workaround when we fix this in KConfig etc,
and we only list and build machines that are compatible with KVM
for KVM-only builds.

Alternative implementation provided by Alex.

Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/device-introspect-test.c | 32 +++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index bbec166dbc..cb8bf6e37d 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -305,6 +305,24 @@ static void test_abstract_interfaces(void)
     qtest_quit(qts);
 }
 
+/*
+ * XXX currently we build also boards for ARM that are incompatible with KVM.
+ * We therefore need to check this explicitly, and only test virt for kvm-only
+ * arm builds.
+ * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
+ * are built for the kvm-only build, we could remove this.
+ */
+static bool skip_machine_tests(void)
+{
+#ifndef CONFIG_TCG
+    const char *arch = qtest_get_arch();
+    if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
+        return true;
+    }
+#endif /* !CONFIG_TCG */
+    return false;
+}
+
 static void add_machine_test_case(const char *mname)
 {
     char *path, *args;
@@ -329,11 +347,15 @@ int main(int argc, char **argv)
     qtest_add_func("device/introspect/none", test_device_intro_none);
     qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
     qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
-    if (g_test_quick()) {
-        qtest_add_data_func("device/introspect/concrete/defaults/none",
-                            g_strdup(common_args), test_device_intro_concrete);
-    } else {
-        qtest_cb_for_every_machine(add_machine_test_case, true);
+
+    if (!skip_machine_tests()) {
+        if (g_test_quick()) {
+            qtest_add_data_func("device/introspect/concrete/defaults/none",
+                                g_strdup(common_args),
+                                test_device_intro_concrete);
+        } else {
+            qtest_cb_for_every_machine(add_machine_test_case, true);
+        }
     }
 
     return g_test_run();
-- 
2.20.1
