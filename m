Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp848893wrg;
        Fri, 21 Jun 2019 09:34:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqznmCgeDZntHRPW98nzqon5NcoYXY0Cku8SehQqt5xx/PBb7S+IHWNus1oGdZ6eXBm8p4CR
X-Received: by 2002:ae9:c10c:: with SMTP id z12mr15516788qki.110.1561134884929;
        Fri, 21 Jun 2019 09:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561134884; cv=none;
        d=google.com; s=arc-20160816;
        b=VSW9+Hgwzq6Ex969IgW2O4M69dAMmaYvThUUREYqfPAjMTL34uLf9tdkqJFqbeg1e2
         +wehSn+E3E7IKtO6olkoDxkLX5kw/IVp5vBOjChVhBvSf2+ir6bZ6adKGl4/U2IcG8fM
         AfWuWqsy1EZaEgpOvgPfHeMWqVDTi10I2MnY+yQVRHUyXEpYI7ZcR1pmcoD7H2MXT3LP
         VV/aNabHHssIhnKnypBPqcrNiwGmb0EHVLTUDhR5eLdfMUaYvMnkCu0wPIEjYSMLv2Gl
         tH/eka+qdx/RJQlLZTl3gw2Y604fKJYaZgZvzTNOOj5OC8/FK80eZ44hoUxcckf336qO
         PTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vFzxVX6xn+l9RKEW+5hSqBSw/nLrKxE1uwjC5XphFg0=;
        b=wpHPtdLVyrDM14WbQPYU5uqphGZWlBDu/kowBpL4JPVHW60e5B824oZwnwEGz0LG/G
         fMO4b6MTiAhkwWoGNqjB1UsW1NyEBrzvRVZsxaXHP+LlCmSRXzHUP22InOHf4MZBeo2/
         HJUMadfSYmaCLym1D8GJV/qRhr3zRUZ+FnGUvJxq9hf9A4g98phHeOvy8qn4CvaQYBD8
         zBrNQVkA4BV9iLYW8hEjhB1wV2SNHSDIFSBuS4PSVNi4OSbSyZ115LpBrzHMnP6vscf+
         eobtqNYyoQIuMldURovkI34ySOoHsPE8xSmD4CW/n//+wWryDHSkVAVOSa3xj558QPkT
         L8Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w2si1879976qkf.216.2019.06.21.09.34.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDB9030C318F;
	Fri, 21 Jun 2019 16:34:43 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D3C8F1001DE0;
	Fri, 21 Jun 2019 16:34:40 +0000 (UTC)
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
Subject: [PATCH v2 04/14] tests: arm: Introduce cpu feature tests
Date: Fri, 21 Jun 2019 18:34:12 +0200
Message-Id: <20190621163422.6127-5-drjones@redhat.com>
In-Reply-To: <20190621163422.6127-1-drjones@redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 21 Jun 2019 16:34:44 +0000 (UTC)
X-TUID: mdI95/cgw0nf

Now that Arm CPUs have advertised features lets add tests to ensure
we maintain their expected availability with and without KVM.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 tests/Makefile.include   |   5 +-
 tests/arm-cpu-features.c | 221 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 tests/arm-cpu-features.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index db750dd6d09b..d5f43fe03067 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -255,13 +255,15 @@ check-qtest-sparc64-$(CONFIG_ISA_TESTDEV) = tests/endianness-test$(EXESUF)
 check-qtest-sparc64-y += tests/prom-env-test$(EXESUF)
 check-qtest-sparc64-y += tests/boot-serial-test$(EXESUF)
 
+check-qtest-arm-y += tests/arm-cpu-features$(EXESUF)
 check-qtest-arm-y += tests/microbit-test$(EXESUF)
 check-qtest-arm-y += tests/m25p80-test$(EXESUF)
 check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
 check-qtest-arm-y += tests/hexloader-test$(EXESUF)
 
-check-qtest-aarch64-y = tests/numa-test$(EXESUF)
+check-qtest-aarch64-y += tests/arm-cpu-features$(EXESUF)
+check-qtest-aarch64-y += tests/numa-test$(EXESUF)
 check-qtest-aarch64-y += tests/boot-serial-test$(EXESUF)
 check-qtest-aarch64-y += tests/migration-test$(EXESUF)
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditional
@@ -822,6 +824,7 @@ tests/test-qapi-util$(EXESUF): tests/test-qapi-util.o $(test-util-obj-y)
 tests/numa-test$(EXESUF): tests/numa-test.o
 tests/vmgenid-test$(EXESUF): tests/vmgenid-test.o tests/boot-sector.o tests/acpi-utils.o
 tests/cdrom-test$(EXESUF): tests/cdrom-test.o tests/boot-sector.o $(libqos-obj-y)
+tests/arm-cpu-features$(EXESUF): tests/arm-cpu-features.o
 
 tests/migration/stress$(EXESUF): tests/migration/stress.o
 	$(call quiet-command, $(LINKPROG) -static -O3 $(PTHREAD_LIB) -o $@ $< ,"LINK","$(TARGET_DIR)$@")
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
new file mode 100644
index 000000000000..31b1c15bb979
--- /dev/null
+++ b/tests/arm-cpu-features.c
@@ -0,0 +1,221 @@
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
+static const char *resp_get_error(QDict *resp)
+{
+    QDict *qdict;
+
+    g_assert(resp);
+    qdict = qdict_get_qdict(resp, "error");
+    if (qdict) {
+        return qdict_get_str(qdict, "desc");
+    }
+    return NULL;
+}
+
+static char *get_error(QTestState *qts, const char *cpu_type,
+                       const char *fmt, ...)
+{
+    QDict *resp;
+    char *error;
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
+    g_assert(resp);
+    error = g_strdup(resp_get_error(resp));
+    qobject_unref(resp);
+
+    return error;
+}
+
+#define assert_error(qts, cpu_type, expected_error, fmt, ...)          \
+({                                                                     \
+    char *_error = get_error(qts, cpu_type, fmt, ##__VA_ARGS__);       \
+    g_assert(_error);                                                  \
+    g_assert(g_str_equal(_error, expected_error));                     \
+    g_free(_error);                                                    \
+})
+
+static QDict *resp_get_props(QDict *resp)
+{
+    QDict *qdict;
+
+    g_assert(resp);
+    g_assert(qdict_haskey(resp, "return"));
+    qdict = qdict_get_qdict(resp, "return");
+    g_assert(qdict_haskey(qdict, "model"));
+    qdict = qdict_get_qdict(qdict, "model");
+    g_assert(qdict_haskey(qdict, "props"));
+    qdict = qdict_get_qdict(qdict, "props");
+    return qdict;
+}
+
+#define assert_has_feature(qts, cpu_type, feature)                     \
+({                                                                     \
+    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
+    g_assert(_resp);                                                   \
+    g_assert(qdict_get(resp_get_props(_resp), feature));               \
+    qobject_unref(_resp);                                              \
+})
+
+#define assert_has_not_feature(qts, cpu_type, feature)                 \
+({                                                                     \
+    QDict *_resp = do_query_no_props(qts, cpu_type);                   \
+    g_assert(_resp);                                                   \
+    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
+    qobject_unref(_resp);                                              \
+})
+
+static void assert_type_full(QTestState *qts, const char *cpu_type)
+{
+    const char *error;
+    QDict *resp;
+
+    resp = qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
+                            "'arguments': { 'type': 'static', "
+                                           "'model': { 'name': %s }}}",
+                     cpu_type);
+    g_assert(resp);
+    error = resp_get_error(resp);
+    g_assert(error);
+    g_assert(g_str_equal(error,
+                         "The requested expansion type is not supported."));
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
+    assert_type_full(qts, "foo");
+    assert_bad_props(qts, "max");
+    assert_error(qts, "foo", "The CPU definition 'foo' is unknown.", NULL);
+    assert_error(qts, "max", "Parameter 'not-a-prop' is unexpected",
+                 "{ 'not-a-prop': false }");
+    assert_error(qts, "host", "The CPU definition 'host' requires KVM", NULL);
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
+            "The CPU definition 'cortex-a15' cannot "
+            "be used with KVM on this host", NULL);
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
