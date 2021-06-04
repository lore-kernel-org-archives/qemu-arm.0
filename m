Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m37sm482577wms.46.2021.06.04.08.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:53:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A239D1FF8F;
	Fri,  4 Jun 2021 16:53:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH  v16 03/99] qtest: Add qtest_has_accel() method
Date: Fri,  4 Jun 2021 16:51:36 +0100
Message-Id: <20210604155312.15902-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AU8oIJ5sq/wi

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Introduce the qtest_has_accel() method which allows a runtime
query on whether a QEMU instance has an accelerator built-in.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-4-philmd@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d4..d80c618c18 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -763,6 +763,14 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
  */
 bool qtest_probe_child(QTestState *s);
 
+/**
+ * qtest_has_accel:
+ * @accel_name: Accelerator name to check for.
+ *
+ * Returns: true if the accelerator is built in.
+ */
+bool qtest_has_accel(const char *accel_name);
+
 /**
  * qtest_set_expected_status:
  * @s: QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 825b13a44c..6bda6e1f33 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -393,6 +393,35 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     return qts;
 }
 
+bool qtest_has_accel(const char *accel_name)
+{
+    bool has_accel = false;
+    QDict *response;
+    QList *accels;
+    QListEntry *accel;
+    QTestState *qts;
+
+    qts = qtest_initf("-accel qtest -machine none");
+    response = qtest_qmp(qts, "{'execute': 'query-accels'}");
+    accels = qdict_get_qlist(response, "return");
+
+    QLIST_FOREACH_ENTRY(accels, accel) {
+        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
+        const char *name = qdict_get_str(accel_dict, "name");
+
+        if (g_str_equal(name, accel_name)) {
+            has_accel = true;
+            break;
+        }
+    }
+    qobject_unref(response);
+
+    qtest_quit(qts);
+
+    return has_accel;
+}
+
+
 void qtest_quit(QTestState *s)
 {
     qtest_remove_abrt_handler(s);
-- 
2.20.1
