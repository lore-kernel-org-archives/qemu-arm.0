Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3786366wrp;
        Tue, 24 Sep 2019 04:31:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzlzX7aLl4atMQ6Jpq+e3wXkjFmdZz4Fqu6VPdtevuVUGb+1+AWKWGl2lvx1KsqIZs4lpVD
X-Received: by 2002:a5d:9814:: with SMTP id a20mr3097872iol.19.1569324679890;
        Tue, 24 Sep 2019 04:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569324679; cv=none;
        d=google.com; s=arc-20160816;
        b=JkUiuOaZvx8M2FeIZb50p0qcUBdsQfbLDL48mfJwK8wq/NzcDTzhbVU7aVCQLZulRU
         HmGSjE0/uzlCKMJ8t9Omkgt6Nr8/5UHgm6UYNJiUUacM5/BHmG9cYHJ8ICcZu5mvmKwf
         swAVtbrdHB9SR5VwBw6hwrdl7KsnimZeWmiCZOSczt7rJRXat93CB/cOQq6KeWwswwFs
         kIo4d5gydOgNNhCaB+28CKUNAIxnix8uAl+qilEkF7V3J/zGTvbViJG4lKoZMcHusiEt
         Cqoq5+ZiaskHLMZMyCBPunl04i6hntjWsupoGcJn49E0dqBnvUIno/YZOXtK4Ouah6Ud
         NT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AcppsWWhaFr9Q5Jd65o6IJXOT/h534dO9lpRZIpElyU=;
        b=FgGr/idRxWFAx4RCjGh7qK7XQU2EZOlUBGv8CLVeNJ0c6FMFrUNK9/ta4aMscgziJV
         bOSrm+nL51sV+euw70rAjjJkiEkU94OgwyPu3u5VNk9oEqUs6O4vgRIV1C2vz/sx+aZj
         ZRrD6kqiKVgpbeN+dw0kM7GBrHJRqs2iPfbCV23wnmD9xCJVVKMOdvJ+uUYLlEi9fzGZ
         819Bbt/DPnhmCmflo+3zi5sV8MeTfpohSk301VGuz+Qbbdvu6D+c0XybG/MGjxpiTedQ
         /8whE0J6jEJo+ofIby6i1npg+vbHsb8d0b7NLdL+NE4J9ltgY9zpATIicHWFo6PfVxWt
         vy9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l123si2365113iof.38.2019.09.24.04.31.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 04:31:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D0A9806A5F;
	Tue, 24 Sep 2019 11:31:19 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0430661559;
	Tue, 24 Sep 2019 11:31:16 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	armbru@redhat.com,
	eblake@redhat.com,
	Dave.Martin@arm.com,
	eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 2/9] tests: arm: Introduce cpu feature tests
Date: Tue, 24 Sep 2019 13:30:58 +0200
Message-Id: <20190924113105.19076-3-drjones@redhat.com>
In-Reply-To: <20190924113105.19076-1-drjones@redhat.com>
References: <20190924113105.19076-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Tue, 24 Sep 2019 11:31:19 +0000 (UTC)
X-TUID: ex4zPHASj1uh

Now that Arm CPUs have advertised features lets add tests to ensure
we maintain their expected availability with and without KVM.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 tests/Makefile.include   |   5 +-
 tests/arm-cpu-features.c | 242 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 246 insertions(+), 1 deletion(-)
 create mode 100644 tests/arm-cpu-features.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 793632ca72a5..3eee8fdf9637 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -258,6 +258,7 @@ check-qtest-sparc64-$(CONFIG_ISA_TESTDEV) = tests/endianness-test$(EXESUF)
 check-qtest-sparc64-y += tests/prom-env-test$(EXESUF)
 check-qtest-sparc64-y += tests/boot-serial-test$(EXESUF)
 
+check-qtest-arm-y += tests/arm-cpu-features$(EXESUF)
 check-qtest-arm-y += tests/microbit-test$(EXESUF)
 check-qtest-arm-y += tests/m25p80-test$(EXESUF)
 check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
@@ -265,7 +266,8 @@ check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
 check-qtest-arm-y += tests/hexloader-test$(EXESUF)
 check-qtest-arm-$(CONFIG_PFLASH_CFI02) += tests/pflash-cfi02-test$(EXESUF)
 
-check-qtest-aarch64-y = tests/numa-test$(EXESUF)
+check-qtest-aarch64-y += tests/arm-cpu-features$(EXESUF)
+check-qtest-aarch64-y += tests/numa-test$(EXESUF)
 check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
 check-qtest-aarch64-y += tests/migration-test$(EXESUF)
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditional
@@ -828,6 +830,7 @@ tests/test-qapi-util$(EXESUF): tests/test-qapi-util.o $(test-util-obj-y)
 tests/numa-test$(EXESUF): tests/numa-test.o
 tests/vmgenid-test$(EXESUF): tests/vmgenid-test.o tests/boot-sector.o tests/acpi-utils.o
 tests/cdrom-test$(EXESUF): tests/cdrom-test.o tests/boot-sector.o $(libqos-obj-y)
+tests/arm-cpu-features$(EXESUF): tests/arm-cpu-features.o
 
 tests/migration/stress$(EXESUF): tests/migration/stress.o
 	$(call quiet-command, $(LINKPROG) -static -O3 $(PTHREAD_LIB) -o $@ $< ,"LINK","$(TARGET_DIR)$@")
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
new file mode 100644
index 000000000000..198ff6d6b495
--- /dev/null
+++ b/tests/arm-cpu-features.c
@@ -0,0 +1,242 @@
+/*
+ * Arm CPU feature test cases
+ *
+ * Copyright (c) 2019 Red Hat Inc.
+ * Authors:
+ *  Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
+
+#define MACHINE    "-machine virt,gic-version=max "
+#define QUERY_HEAD "{ 'execute': 'query-cpu-model-expansion', " \
+                     "'arguments': { 'type': 'full', "
+#define QUERY_TAIL "}}"
+
+static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
+{
+    return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
+                          QUERY_TAIL, cpu_type);
+}
+
+static QDict *do_query(QTestState *qts, const char *cpu_type,
+                       const char *fmt, ...)
+{
+    QDict *resp;
+
+    if (fmt) {
+        QDict *args;
+        va_list ap;
+
+        va_start(ap, fmt);
+        args = qdict_from_vjsonf_nofail(fmt, ap);
+        va_end(ap);
+
+        resp = qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s, "
+                                                    "'props': %p }"
+                              QUERY_TAIL, cpu_type, args);
+    } else {
+        resp = do_query_no_props(qts, cpu_type);
+    }
+
+    return resp;
+}
+
+static const char *resp_get_error(QDict *resp)
+{
+    QDict *qdict;
+
+    g_assert(resp);
+
+    qdict = qdict_get_qdict(resp, "error");
+    if (qdict) {
+        return qdict_get_str(qdict, "desc");
+    }
+    return NULL;
+}
+
+#define assert_error(qts, cpu_type, expected_error, fmt, ...)          \
+({                                                                     \
+    QDict *_resp;                                                      \
+    const char *_error;                                                \
+                                                                       \
+    _resp = do_query(qts, cpu_type, fmt, ##__VA_ARGS__);               \
+    g_assert(_resp);                                                   \
+    _error = resp_get_error(_resp);                                    \
+    g_assert(_error);                                                  \
+    g_assert(g_str_equal(_error, expected_error));                     \
+    qobject_unref(_resp);                                              \
+})
+
+static bool resp_has_props(QDict *resp)
+{
+    QDict *qdict;
+
+    g_assert(resp);
+
+    if (!qdict_haskey(resp, "return")) {
+        return false;
+    }
+    qdict = qdict_get_qdict(resp, "return");
+
+    if (!qdict_haskey(qdict, "model")) {
+        return false;
+    }
+    qdict = qdict_get_qdict(qdict, "model");
+
+    return qdict_haskey(qdict, "props");
+}
+
+static QDict *resp_get_props(QDict *resp)
+{
+    QDict *qdict;
+
+    g_assert(resp);
+    g_assert(resp_has_props(resp));
+
+    qdict = qdict_get_qdict(resp, "return");
+    qdict = qdict_get_qdict(qdict, "model");
+    qdict = qdict_get_qdict(qdict, "props");
+    return qdict;
+}
+
+#define assert_has_feature(qts, cpu_type, feature)                     \
+({                                                                     \
+    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    g_assert(qdict_get(resp_get_props(_resp), feature));               \
+    qobject_unref(_resp);                                              \
+})
+
+#define assert_has_not_feature(qts, cpu_type, feature)                 \
+({                                                                     \
+    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
+    qobject_unref(_resp);                                              \
+})
+
+static void assert_type_full(QTestState *qts)
+{
+    const char *error;
+    QDict *resp;
+
+    resp = qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
+                            "'arguments': { 'type': 'static', "
+                                           "'model': { 'name': 'foo' }}}");
+    g_assert(resp);
+    error = resp_get_error(resp);
+    g_assert(error);
+    g_assert(g_str_equal(error,
+                         "The requested expansion type is not supported"));
+    qobject_unref(resp);
+}
+
+static void assert_bad_props(QTestState *qts, const char *cpu_type)
+{
+    const char *error;
+    QDict *resp;
+
+    resp = qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
+                            "'arguments': { 'type': 'full', "
+                                           "'model': { 'name': %s, "
+                                                      "'props': false }}}",
+                     cpu_type);
+    g_assert(resp);
+    error = resp_get_error(resp);
+    g_assert(error);
+    g_assert(g_str_equal(error,
+                         "Invalid parameter type for 'props', expected: dict"));
+    qobject_unref(resp);
+}
+
+static void test_query_cpu_model_expansion(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE "-cpu max");
+
+    /* Test common query-cpu-model-expansion input validation */
+    assert_type_full(qts);
+    assert_bad_props(qts, "max");
+    assert_error(qts, "foo", "The CPU type 'foo' is not a recognized "
+                 "ARM CPU type", NULL);
+    assert_error(qts, "max", "Parameter 'not-a-prop' is unexpected",
+                 "{ 'not-a-prop': false }");
+    assert_error(qts, "host", "The CPU type 'host' requires KVM", NULL);
+
+    /* Test expected feature presence/absence for some cpu types */
+    assert_has_feature(qts, "max", "pmu");
+    assert_has_feature(qts, "cortex-a15", "pmu");
+    assert_has_not_feature(qts, "cortex-a15", "aarch64");
+
+    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+        assert_has_feature(qts, "max", "aarch64");
+        assert_has_feature(qts, "cortex-a57", "pmu");
+        assert_has_feature(qts, "cortex-a57", "aarch64");
+
+        /* Test that features that depend on KVM generate errors without. */
+        assert_error(qts, "max",
+                     "'aarch64' feature cannot be disabled "
+                     "unless KVM is enabled and 32-bit EL1 "
+                     "is supported",
+                     "{ 'aarch64': false }");
+    }
+
+    qtest_quit(qts);
+}
+
+static void test_query_cpu_model_expansion_kvm(const void *data)
+{
+    QTestState *qts;
+
+    qts = qtest_init(MACHINE "-accel kvm -cpu host");
+
+    assert_has_feature(qts, "host", "pmu");
+
+    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+        assert_has_feature(qts, "host", "aarch64");
+
+        assert_error(qts, "cortex-a15",
+            "We cannot guarantee the CPU type 'cortex-a15' works "
+            "with KVM on this host", NULL);
+    } else {
+        assert_error(qts, "host",
+                     "'pmu' feature not supported by KVM on this host",
+                     "{ 'pmu': true }");
+    }
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    bool kvm_available = false;
+
+    if (!access("/dev/kvm",  R_OK | W_OK)) {
+#if defined(HOST_AARCH64)
+        kvm_available = g_str_equal(qtest_get_arch(), "aarch64");
+#elif defined(HOST_ARM)
+        kvm_available = g_str_equal(qtest_get_arch(), "arm");
+#endif
+    }
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/arm/query-cpu-model-expansion",
+                        NULL, test_query_cpu_model_expansion);
+
+    if (kvm_available) {
+        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
+                            NULL, test_query_cpu_model_expansion_kvm);
+    }
+
+    return g_test_run();
+}
-- 
2.20.1
