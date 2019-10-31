Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1246889wri;
        Thu, 31 Oct 2019 07:32:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy68dflkIo3R5/WO1PV5LU+CW0mz8VRd7fPUU21A+daD4BQngcngboTtE1u4H+hvUJheZ2N
X-Received: by 2002:a0c:e6a6:: with SMTP id j6mr828885qvn.74.1572532341756;
        Thu, 31 Oct 2019 07:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572532341; cv=none;
        d=google.com; s=arc-20160816;
        b=DVc2k6HdC75sBw6vkCJ1MncdRDVTf1XhUc+CvXsgZRQ9xYwSGHFWcdPBcDinRJnwue
         uvzakOPVgIiNliP9Mt1xgpJ+wNLgrqBue1OSgAv9T+r0Xixu+6WnMKAwY/uE38dqjWpy
         Og+3lz5huj7pDRiBhF66KyVut1gPQMiGek1XvUOC2yCRb0Y0bSBjedY1CXLMxXbZdoRe
         QS3eXRT/RUsnx52Z6YzRyYhcFR6aeyKo8QJ7d1t4/H3qlfO7TwQvzXLxiuXCPqK1dvxz
         Ja8p5s2k4V9dYBfnAPbZQBmGqN1BfVBIsCkOkfsSg8JIeSLunbMJExTgDUs9RkdbsGv/
         PvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RF3bpFJgksa/o9KaTQGK5jUyGdJviwwTTLfHNgFhIWU=;
        b=BAa3jRpSH/bADDmvCmKXIOaZy7byRbq/nABLzWIUQRy1G0zuIwrbjomsb9dLm3mkaH
         6022uOJNWFaUwHV0I5y4/uX3T0UQZSVeb72ABlrtkF6wUKKTEluzXFAUJatqqK/q6Gf3
         3Ix9tYlSnw7XicBmeItV6+svQNpLzv57sLKwYDe98Kji6VDEAz6t9mla3kn9mnLxP9RE
         +rYogRSBBCF03Hc3LYZc0uS0bNgPWq4L7KpkG6wOfjn58I49WK1H9tzaIYfHtVwJqsec
         REIh1PHUFD1QDvKR+gff6JswhCyJzX/+HrnVIaWCPn7twyuDFd3CfR3d6/9myCZqiZek
         bwew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="R7m/FTsV";
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id eb6si4770190qvb.189.2019.10.31.07.32.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 07:32:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="R7m/FTsV";
       spf=pass (google.com: domain of drjones@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572532341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RF3bpFJgksa/o9KaTQGK5jUyGdJviwwTTLfHNgFhIWU=;
	b=R7m/FTsVpMRe56PqcV2UuxOjdc+8NNDu5goQUmedp7q+Vke16K+NKZs0twtZJQes87x9Jh
	r0mnb9o/MnAMKYfyWWoQ4S8NOwNbTkPKC0BZcEzvA5Hg9oVsptGBcSsXSDUkDxvQmKP7xQ
	HckuoswHVNejiG9MLGBPdzHqED2d3u8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-1VIaLSlbMl6mVPEFUUtyXg-1; Thu, 31 Oct 2019 10:32:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D28191800D6B;
	Thu, 31 Oct 2019 14:32:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-117-53.ams2.redhat.com [10.36.117.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7584860872;
	Thu, 31 Oct 2019 14:30:37 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	eric.auger@redhat.com,
	beata.michalska@linaro.org,
	m.mizuma@jp.fujitsu.com,
	alex.bennee@linaro.org,
	Dave.Martin@arm.com,
	armbru@redhat.com,
	eblake@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v8 2/9] tests: arm: Introduce cpu feature tests
Date: Thu, 31 Oct 2019 15:27:27 +0100
Message-Id: <20191031142734.8590-3-drjones@redhat.com>
In-Reply-To: <20191031142734.8590-1-drjones@redhat.com>
References: <20191031142734.8590-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 1VIaLSlbMl6mVPEFUUtyXg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: Tev+W5B4Ec06

Now that Arm CPUs have advertised features lets add tests to ensure
we maintain their expected availability with and without KVM.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 tests/Makefile.include   |   5 +-
 tests/arm-cpu-features.c | 253 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 257 insertions(+), 1 deletion(-)
 create mode 100644 tests/arm-cpu-features.c

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 7715d8cd63ad..55f7bf9eef7c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -262,6 +262,7 @@ check-qtest-sparc64-$(CONFIG_ISA_TESTDEV) =3D tests/end=
ianness-test$(EXESUF)
 check-qtest-sparc64-y +=3D tests/prom-env-test$(EXESUF)
 check-qtest-sparc64-y +=3D tests/boot-serial-test$(EXESUF)
=20
+check-qtest-arm-y +=3D tests/arm-cpu-features$(EXESUF)
 check-qtest-arm-y +=3D tests/microbit-test$(EXESUF)
 check-qtest-arm-y +=3D tests/m25p80-test$(EXESUF)
 check-qtest-arm-y +=3D tests/test-arm-mptimer$(EXESUF)
@@ -269,7 +270,8 @@ check-qtest-arm-y +=3D tests/boot-serial-test$(EXESUF)
 check-qtest-arm-y +=3D tests/hexloader-test$(EXESUF)
 check-qtest-arm-$(CONFIG_PFLASH_CFI02) +=3D tests/pflash-cfi02-test$(EXESU=
F)
=20
-check-qtest-aarch64-y =3D tests/numa-test$(EXESUF)
+check-qtest-aarch64-y +=3D tests/arm-cpu-features$(EXESUF)
+check-qtest-aarch64-y +=3D tests/numa-test$(EXESUF)
 check-qtest-aarch64-y +=3D tests/boot-serial-test$(EXESUF)
 check-qtest-aarch64-y +=3D tests/migration-test$(EXESUF)
 # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make test unconditio=
nal
@@ -841,6 +843,7 @@ tests/test-qapi-util$(EXESUF): tests/test-qapi-util.o $=
(test-util-obj-y)
 tests/numa-test$(EXESUF): tests/numa-test.o
 tests/vmgenid-test$(EXESUF): tests/vmgenid-test.o tests/boot-sector.o test=
s/acpi-utils.o
 tests/cdrom-test$(EXESUF): tests/cdrom-test.o tests/boot-sector.o $(libqos=
-obj-y)
+tests/arm-cpu-features$(EXESUF): tests/arm-cpu-features.o
=20
 tests/migration/stress$(EXESUF): tests/migration/stress.o
 =09$(call quiet-command, $(LINKPROG) -static -O3 $(PTHREAD_LIB) -o $@ $< ,=
"LINK","$(TARGET_DIR)$@")
diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
new file mode 100644
index 000000000000..6ebb03d7ad67
--- /dev/null
+++ b/tests/arm-cpu-features.c
@@ -0,0 +1,253 @@
+/*
+ * Arm CPU feature test cases
+ *
+ * Copyright (c) 2019 Red Hat Inc.
+ * Authors:
+ *  Andrew Jones <drjones@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "libqtest.h"
+#include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
+
+#define MACHINE     "-machine virt,gic-version=3Dmax,accel=3Dtcg "
+#define MACHINE_KVM "-machine virt,gic-version=3Dmax,accel=3Dkvm:tcg "
+#define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
+                    "  'arguments': { 'type': 'full', "
+#define QUERY_TAIL  "}}"
+
+static bool kvm_enabled(QTestState *qts)
+{
+    QDict *resp, *qdict;
+    bool enabled;
+
+    resp =3D qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
+    g_assert(qdict_haskey(resp, "return"));
+    qdict =3D qdict_get_qdict(resp, "return");
+    g_assert(qdict_haskey(qdict, "enabled"));
+    enabled =3D qdict_get_bool(qdict, "enabled");
+    qobject_unref(resp);
+
+    return enabled;
+}
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
+        args =3D qdict_from_vjsonf_nofail(fmt, ap);
+        va_end(ap);
+
+        resp =3D qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s, "
+                                                    "'props': %p }"
+                              QUERY_TAIL, cpu_type, args);
+    } else {
+        resp =3D do_query_no_props(qts, cpu_type);
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
+    qdict =3D qdict_get_qdict(resp, "error");
+    if (qdict) {
+        return qdict_get_str(qdict, "desc");
+    }
+
+    return NULL;
+}
+
+#define assert_error(qts, cpu_type, expected_error, fmt, ...)          \
+({                                                                     \
+    QDict *_resp;                                                      \
+    const char *_error;                                                \
+                                                                       \
+    _resp =3D do_query(qts, cpu_type, fmt, ##__VA_ARGS__);               \
+    g_assert(_resp);                                                   \
+    _error =3D resp_get_error(_resp);                                    \
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
+    qdict =3D qdict_get_qdict(resp, "return");
+
+    if (!qdict_haskey(qdict, "model")) {
+        return false;
+    }
+    qdict =3D qdict_get_qdict(qdict, "model");
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
+    qdict =3D qdict_get_qdict(resp, "return");
+    qdict =3D qdict_get_qdict(qdict, "model");
+    qdict =3D qdict_get_qdict(qdict, "props");
+
+    return qdict;
+}
+
+#define assert_has_feature(qts, cpu_type, feature)                     \
+({                                                                     \
+    QDict *_resp =3D do_query_no_props(qts, cpu_type);                   \
+    g_assert(_resp);                                                   \
+    g_assert(resp_has_props(_resp));                                   \
+    g_assert(qdict_get(resp_get_props(_resp), feature));               \
+    qobject_unref(_resp);                                              \
+})
+
+#define assert_has_not_feature(qts, cpu_type, feature)                 \
+({                                                                     \
+    QDict *_resp =3D do_query_no_props(qts, cpu_type);                   \
+    g_assert(_resp);                                                   \
+    g_assert(!resp_has_props(_resp) ||                                 \
+             !qdict_get(resp_get_props(_resp), feature));              \
+    qobject_unref(_resp);                                              \
+})
+
+static void assert_type_full(QTestState *qts)
+{
+    const char *error;
+    QDict *resp;
+
+    resp =3D qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
+                            "'arguments': { 'type': 'static', "
+                                           "'model': { 'name': 'foo' }}}")=
;
+    g_assert(resp);
+    error =3D resp_get_error(resp);
+    g_assert(error);
+    g_assert(g_str_equal(error,
+                         "The requested expansion type is not supported"))=
;
+    qobject_unref(resp);
+}
+
+static void assert_bad_props(QTestState *qts, const char *cpu_type)
+{
+    const char *error;
+    QDict *resp;
+
+    resp =3D qtest_qmp(qts, "{ 'execute': 'query-cpu-model-expansion', "
+                            "'arguments': { 'type': 'full', "
+                                           "'model': { 'name': %s, "
+                                                      "'props': false }}}"=
,
+                     cpu_type);
+    g_assert(resp);
+    error =3D resp_get_error(resp);
+    g_assert(error);
+    g_assert(g_str_equal(error,
+                         "Invalid parameter type for 'props', expected: di=
ct"));
+    qobject_unref(resp);
+}
+
+static void test_query_cpu_model_expansion(const void *data)
+{
+    QTestState *qts;
+
+    qts =3D qtest_init(MACHINE "-cpu max");
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
+        /* Test that features that depend on KVM generate errors without. =
*/
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
+    qts =3D qtest_init(MACHINE_KVM "-cpu max");
+
+    /*
+     * These tests target the 'host' CPU type, so KVM must be enabled.
+     */
+    if (!kvm_enabled(qts)) {
+        qtest_quit(qts);
+        return;
+    }
+
+    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+        assert_has_feature(qts, "host", "aarch64");
+        assert_has_feature(qts, "host", "pmu");
+
+        assert_error(qts, "cortex-a15",
+            "We cannot guarantee the CPU type 'cortex-a15' works "
+            "with KVM on this host", NULL);
+    } else {
+        assert_has_not_feature(qts, "host", "aarch64");
+        assert_has_not_feature(qts, "host", "pmu");
+    }
+
+    qtest_quit(qts);
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/arm/query-cpu-model-expansion",
+                        NULL, test_query_cpu_model_expansion);
+    qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
+                        NULL, test_query_cpu_model_expansion_kvm);
+
+    return g_test_run();
+}
--=20
2.21.0
