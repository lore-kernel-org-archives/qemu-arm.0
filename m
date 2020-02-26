Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3546323lfg;
        Wed, 26 Feb 2020 13:06:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwfKq/vT5jaYOopTuuNIkhg8dxD6bgNTK4VwwPjVW9zMx5BwEYDJwmr3fjfIfa1mX37aH6p
X-Received: by 2002:ac8:5419:: with SMTP id b25mr926651qtq.390.1582751185225;
        Wed, 26 Feb 2020 13:06:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582751185; cv=none;
        d=google.com; s=arc-20160816;
        b=YcQbJ1ObsXo6hf+J9GuByGlpw6qp8WevbAskkTqtgvmCDeERhgYOtt/4VELttneQI2
         EGOoxQ0g97O/ntnEEW1e1xml57549gzQtFM+NuGPnUh8Gq5PmoSPjIP3S/czQiZztPVh
         2d/4H724Rh4eMY5eB2AaeDffM01WduTST2lL5hruoCNeWmx2cSzEl1e1e//K7yHrYzAG
         NB8aqbcGdR3S6Ub27iV+4bMrdTTUuJWSti678antQykkLtlbfA0rsr0zKF+4eSlEsY1Z
         /sGJVMMpVchxyrcyUxLTwUi+bLBiML/fsEkUTbC+RrH3r45KLrUeADIIx2BKcjMffIC8
         ZBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eTozVkNl17YRM1j2wyiO5dkLR6R4+g7hL1r+mSEoj1U=;
        b=IIkw7fChBb8LtsiIEdFdj3m5Pengi72e5VfMcF4VAd3YlLht+PhaovLsmUZCt08apG
         mxqMIpgA8JH9nIaxETZnHILeaiyWAky/gmhzGd3mClOVNp0W3IyAfZyQycq6vDZD0GXq
         hdfl324Pag05b4IbUXIpZVwItnHedu5pboXzwA4exDtRFUn1kRBFZBRwtCaHbANzGrzf
         8JO7ppvoenQ5IKItpSvrpI2CUMERIleEPJMHKOF8Uo4JHfrpX3ycBUdQgdNRoNB7ef6P
         TGIXki6IEN7xghXrFMFA1J8Raq+0YN0OkHZg7742BZoDWfE7e5wqFNxQ/nwerEK1tU3Z
         hnxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NwxzSiDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w189si369536qkb.113.2020.02.26.13.06.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 13:06:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NwxzSiDV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j73st-0006e6-VF
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 16:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46421)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j73oL-0000Sz-Mk
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:01:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j73oJ-00054w-PX
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:01:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43125
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j73oJ-000525-7u
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582750898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTozVkNl17YRM1j2wyiO5dkLR6R4+g7hL1r+mSEoj1U=;
 b=NwxzSiDVNY0MQx6ypUoB74yH6DWBrQt9m9ycRuUipGXaM1uDqD66H8Inb0xFhPXuetYHMJ
 Nhpq47rkbFjfXpirV7Wl7FlHMX466cT9GvXxJSIi8kTtPZH0uLMnuF7AqwKRT09c6zBM6h
 2qQqTqZ7DjX7mZB3qUO1yMeFjmmHOb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-Kc3A3nMHOQ-KW5HBMBBhcQ-1; Wed, 26 Feb 2020 16:01:34 -0500
X-MC-Unique: Kc3A3nMHOQ-KW5HBMBBhcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72BD5109AEDE;
 Wed, 26 Feb 2020 21:01:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6815A5C545;
 Wed, 26 Feb 2020 21:01:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 10/10] test: tpm-tis: Add Sysbus TPM-TIS device test
Date: Wed, 26 Feb 2020 21:59:42 +0100
Message-Id: <20200226205942.11424-11-eric.auger@redhat.com>
In-Reply-To: <20200226205942.11424-1-eric.auger@redhat.com>
References: <20200226205942.11424-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OJyHbABxXP7B

The tests themselves are the same as the ISA device ones.
Only the main() changes as the "tpm-tis-device" device gets
instantiated. Also the base address of the device is not
0xFED40000 anymore but matches the base address of the
ARM virt platform bus.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/qtest/Makefile.include            |  5 ++
 tests/qtest/tpm-tis-device-swtpm-test.c | 76 +++++++++++++++++++++
 tests/qtest/tpm-tis-device-test.c       | 87 +++++++++++++++++++++++++
 3 files changed, 168 insertions(+)
 create mode 100644 tests/qtest/tpm-tis-device-swtpm-test.c
 create mode 100644 tests/qtest/tpm-tis-device-test.c

diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
index 44aac68b25..383b0ab217 100644
--- a/tests/qtest/Makefile.include
+++ b/tests/qtest/Makefile.include
@@ -130,6 +130,8 @@ check-qtest-arm-y +=3D hexloader-test
 check-qtest-arm-$(CONFIG_PFLASH_CFI02) +=3D pflash-cfi02-test
=20
 check-qtest-aarch64-y +=3D arm-cpu-features
+check-qtest-aarch64-$(CONFIG_TPM_TIS_SYSBUS) +=3D tpm-tis-device-test
+check-qtest-aarch64-$(CONFIG_TPM_TIS_SYSBUS) +=3D tpm-tis-device-swtpm-tes=
t
 check-qtest-aarch64-y +=3D numa-test
 check-qtest-aarch64-y +=3D boot-serial-test
 check-qtest-aarch64-y +=3D migration-test
@@ -302,7 +304,10 @@ tests/qtest/tpm-crb-swtpm-test$(EXESUF): tests/qtest/t=
pm-crb-swtpm-test.o tests/
 tests/qtest/tpm-crb-test$(EXESUF): tests/qtest/tpm-crb-test.o tests/qtest/=
tpm-emu.o $(test-io-obj-y)
 tests/qtest/tpm-tis-swtpm-test$(EXESUF): tests/qtest/tpm-tis-swtpm-test.o =
tests/qtest/tpm-emu.o \
 =09tests/qtest/tpm-util.o tests/qtest/tpm-tests.o $(test-io-obj-y)
+tests/qtest/tpm-tis-device-swtpm-test$(EXESUF): tests/qtest/tpm-tis-device=
-swtpm-test.o tests/qtest/tpm-emu.o \
+=09tests/qtest/tpm-util.o tests/qtest/tpm-tests.o $(test-io-obj-y)
 tests/qtest/tpm-tis-test$(EXESUF): tests/qtest/tpm-tis-test.o tests/qtest/=
tpm-tis-util.o tests/qtest/tpm-emu.o $(test-io-obj-y)
+tests/qtest/tpm-tis-device-test$(EXESUF): tests/qtest/tpm-tis-device-test.=
o tests/qtest/tpm-tis-util.o tests/qtest/tpm-emu.o $(test-io-obj-y)
=20
 # QTest rules
=20
diff --git a/tests/qtest/tpm-tis-device-swtpm-test.c b/tests/qtest/tpm-tis-=
device-swtpm-test.c
new file mode 100644
index 0000000000..7b20035142
--- /dev/null
+++ b/tests/qtest/tpm-tis-device-swtpm-test.c
@@ -0,0 +1,76 @@
+/*
+ * QTest testcase for Sysbus TPM TIS talking to external swtpm and swtpm
+ * migration
+ *
+ * Copyright (c) 2018 IBM Corporation
+ *  with parts borrowed from migration-test.c that is:
+ *     Copyright (c) 2016-2018 Red Hat, Inc. and/or its affiliates
+ *
+ * Authors:
+ *   Stefan Berger <stefanb@linux.vnet.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+
+#include "libqtest.h"
+#include "qemu/module.h"
+#include "tpm-tests.h"
+#include "hw/acpi/tpm.h"
+
+uint64_t tpm_tis_base_addr =3D 0xc000000;
+#define MACHINE_OPTIONS "-machine virt,gic-version=3Dmax -accel tcg"
+
+typedef struct TestState {
+    char *src_tpm_path;
+    char *dst_tpm_path;
+    char *uri;
+} TestState;
+
+static void tpm_tis_swtpm_test(const void *data)
+{
+    const TestState *ts =3D data;
+
+    tpm_test_swtpm_test(ts->src_tpm_path, tpm_util_tis_transfer,
+                        "tpm-tis-device", MACHINE_OPTIONS);
+}
+
+static void tpm_tis_swtpm_migration_test(const void *data)
+{
+    const TestState *ts =3D data;
+
+    tpm_test_swtpm_migration_test(ts->src_tpm_path, ts->dst_tpm_path, ts->=
uri,
+                                  tpm_util_tis_transfer, "tpm-tis-device",
+                                  MACHINE_OPTIONS);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+    TestState ts =3D { 0 };
+
+    ts.src_tpm_path =3D g_dir_make_tmp("qemu-tpm-tis-device-swtpm-test.XXX=
XXX",
+                                     NULL);
+    ts.dst_tpm_path =3D g_dir_make_tmp("qemu-tpm-tis-device-swtpm-test.XXX=
XXX",
+                                     NULL);
+    ts.uri =3D g_strdup_printf("unix:%s/migsocket", ts.src_tpm_path);
+
+    module_call_init(MODULE_INIT_QOM);
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_data_func("/tpm/tis-swtpm/test", &ts, tpm_tis_swtpm_test);
+    qtest_add_data_func("/tpm/tis-swtpm-migration/test", &ts,
+                        tpm_tis_swtpm_migration_test);
+    ret =3D g_test_run();
+
+    g_rmdir(ts.dst_tpm_path);
+    g_free(ts.dst_tpm_path);
+    g_rmdir(ts.src_tpm_path);
+    g_free(ts.src_tpm_path);
+    g_free(ts.uri);
+
+    return ret;
+}
diff --git a/tests/qtest/tpm-tis-device-test.c b/tests/qtest/tpm-tis-device=
-test.c
new file mode 100644
index 0000000000..63ed36440f
--- /dev/null
+++ b/tests/qtest/tpm-tis-device-test.c
@@ -0,0 +1,87 @@
+/*
+ * QTest testcase for SYSBUS TPM TIS
+ *
+ * Copyright (c) 2018 Red Hat, Inc.
+ * Copyright (c) 2018 IBM Corporation
+ *
+ * Authors:
+ *   Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+ *   Stefan Berger <stefanb@linux.vnet.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <glib/gstdio.h>
+
+#include "io/channel-socket.h"
+#include "libqtest-single.h"
+#include "qemu/module.h"
+#include "tpm-emu.h"
+#include "tpm-util.h"
+#include "tpm-tis-util.h"
+
+/*
+ * As the Sysbus tpm-tis-device is instantiated on the ARM virt
+ * platform bus and it is the only sysbus device dynamically
+ * instantiated, it gets plugged at its base address
+ */
+uint64_t tpm_tis_base_addr =3D 0xc000000;
+
+int main(int argc, char **argv)
+{
+    char *tmp_path =3D g_dir_make_tmp("qemu-tpm-tis-device-test.XXXXXX", N=
ULL);
+    GThread *thread;
+    TestState test;
+    char *args;
+    int ret;
+
+    module_call_init(MODULE_INIT_QOM);
+    g_test_init(&argc, &argv, NULL);
+
+    test.addr =3D g_new0(SocketAddress, 1);
+    test.addr->type =3D SOCKET_ADDRESS_TYPE_UNIX;
+    test.addr->u.q_unix.path =3D g_build_filename(tmp_path, "sock", NULL);
+    g_mutex_init(&test.data_mutex);
+    g_cond_init(&test.data_cond);
+    test.data_cond_signal =3D false;
+
+    thread =3D g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
+    tpm_emu_test_wait_cond(&test);
+
+    args =3D g_strdup_printf(
+        "-machine virt,gic-version=3Dmax -accel tcg "
+        "-chardev socket,id=3Dchr,path=3D%s "
+        "-tpmdev emulator,id=3Ddev,chardev=3Dchr "
+        "-device tpm-tis-device,tpmdev=3Ddev",
+        test.addr->u.q_unix.path);
+    qtest_start(args);
+
+    qtest_add_data_func("/tpm-tis/test_check_localities", &test,
+                        tpm_tis_test_check_localities);
+
+    qtest_add_data_func("/tpm-tis/test_check_access_reg", &test,
+                        tpm_tis_test_check_access_reg);
+
+    qtest_add_data_func("/tpm-tis/test_check_access_reg_seize", &test,
+                        tpm_tis_test_check_access_reg_seize);
+
+    qtest_add_data_func("/tpm-tis/test_check_access_reg_release", &test,
+                        tpm_tis_test_check_access_reg_release);
+
+    qtest_add_data_func("/tpm-tis/test_check_transmit", &test,
+                        tpm_tis_test_check_transmit);
+
+    ret =3D g_test_run();
+
+    qtest_end();
+
+    g_thread_join(thread);
+    g_unlink(test.addr->u.q_unix.path);
+    qapi_free_SocketAddress(test.addr);
+    g_rmdir(tmp_path);
+    g_free(tmp_path);
+    g_free(args);
+    return ret;
+}
--=20
2.20.1

