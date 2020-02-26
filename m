Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3545964lfg;
        Wed, 26 Feb 2020 13:06:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqwb3LvSfNkD+6ZnuULLt6rF//AJ/A3i85zfTaBHlnx3Y7SD8Ep0K6tHe7x7BEP6UDJxv+TB
X-Received: by 2002:ac8:4419:: with SMTP id j25mr876423qtn.378.1582751164704;
        Wed, 26 Feb 2020 13:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582751164; cv=none;
        d=google.com; s=arc-20160816;
        b=A2lKJEBm0En24s+cHV7E94gzT+UI88BZJsVQX49wIRhgyYLSTR9ja4cCFaYme6Pt2H
         N+JPszi6lrOukEC4h/25LeSJtlDkMzYm/xBdkvCV9DrVXAEEFwfV4d2w5Fi0Qq3Nj9Yy
         GtQsMdSgTUa2Zgrfa4ZefIATKrHhD7T67x2161n84rokq/dkJ2wtou7XgKa1m3Wd7F3E
         KS7fe7njpnsxl/+f9yylGF3YyqU5hbgmhdtBXyPQRFpA1gySMFZ5DVNrc4iB8zxGWVpz
         CC1utdUkgqInpiItotXV3z5eeIUVNxWpC3k8aP9lf68aadi4D3kHZbl7FaE2pVOh6SCc
         hsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xE5jsrMFKoz4Jm4BhG/H5KdS21jbi/S6sSPfBTDBqKc=;
        b=cdQAxkYUzc3NLVBaQI8JVRGBEpFJWatKoVyShDyF500+g/a0ObUGkSJ1YhJNioD+tw
         ydd5Q0cYyYW6HE6LagX9OgKEEKnTKjEdnhb7D6ckvu2Dpj9mwBsqWEudHXFwiDGxPzuG
         nHSbCWoQ1IDqGtDWPBKdJHNpBHkffduBxL5LgA2pGQKZy2c5EARVui5NSP8HEFgA/GkT
         Q/ztarFw50Pk5DPO7CzO9LlF+Ljd93HYN67SWblKryhjSvimsQXf9GWUvqwjz9i6ngLK
         2YPLuefHwsCZJ+846ZV+jpRjfZ0jrQdhn4lJU+bWjVuNgEiggwER3WlGo9mZI1L86CA9
         pXkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yx74ALcu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o24si337025qki.330.2020.02.26.13.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 13:06:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yx74ALcu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j73sZ-0006NM-VZ
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 16:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j73o2-00004q-RB
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:01:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j73o1-0004Fm-9Y
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:01:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55663
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j73o1-0004FF-4S
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 16:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582750880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xE5jsrMFKoz4Jm4BhG/H5KdS21jbi/S6sSPfBTDBqKc=;
 b=Yx74ALcui50Gfw7ckzgDTEiZlkCbVRXwloKO0ss/PGldGU9yma5ZWzbw+o3DwKJ0xubwwa
 qLCPXLxBABHkdUVVNL6ifp+gZpY5RfbAtubymq7HkiBxhTQKbRxI5gU4ir9WzdwAO9m5eh
 3WqtgStER7N3nIxCc6bOffAqswmZA+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-qX6RrZdTOb-yypDEfvMlUg-1; Wed, 26 Feb 2020 16:01:19 -0500
X-MC-Unique: qX6RrZdTOb-yypDEfvMlUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7FAE140B;
 Wed, 26 Feb 2020 21:01:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CA8A4D9E2;
 Wed, 26 Feb 2020 21:01:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 08/10] test: tpm: pass optional machine options to swtpm
 test functions
Date: Wed, 26 Feb 2020 21:59:40 +0100
Message-Id: <20200226205942.11424-9-eric.auger@redhat.com>
In-Reply-To: <20200226205942.11424-1-eric.auger@redhat.com>
References: <20200226205942.11424-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
X-TUID: vmVsQE7VVFD3

We plan to use swtpm test functions on ARM for testing the
sysbus TPM-TIS device. However on ARM there is no default machine
type. So we need to explictly pass some machine options on startup.
Let's allow this by adding a new parameter to both swtpm test
functions and update all call sites.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

---

v3 -> v4:
- added Stefan's R-b
---
 tests/qtest/tpm-crb-swtpm-test.c |  5 +++--
 tests/qtest/tpm-tests.c          | 10 ++++++----
 tests/qtest/tpm-tests.h          |  5 +++--
 tests/qtest/tpm-tis-swtpm-test.c |  5 +++--
 tests/qtest/tpm-util.c           |  8 ++++++--
 tests/qtest/tpm-util.h           |  3 ++-
 6 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/tpm-crb-swtpm-test.c b/tests/qtest/tpm-crb-swtpm-t=
est.c
index 2c4fb8ae29..5228cb7af4 100644
--- a/tests/qtest/tpm-crb-swtpm-test.c
+++ b/tests/qtest/tpm-crb-swtpm-test.c
@@ -29,7 +29,8 @@ static void tpm_crb_swtpm_test(const void *data)
 {
     const TestState *ts =3D data;
=20
-    tpm_test_swtpm_test(ts->src_tpm_path, tpm_util_crb_transfer, "tpm-crb"=
);
+    tpm_test_swtpm_test(ts->src_tpm_path, tpm_util_crb_transfer,
+                        "tpm-crb", NULL);
 }
=20
 static void tpm_crb_swtpm_migration_test(const void *data)
@@ -37,7 +38,7 @@ static void tpm_crb_swtpm_migration_test(const void *data=
)
     const TestState *ts =3D data;
=20
     tpm_test_swtpm_migration_test(ts->src_tpm_path, ts->dst_tpm_path, ts->=
uri,
-                                  tpm_util_crb_transfer, "tpm-crb");
+                                  tpm_util_crb_transfer, "tpm-crb", NULL);
 }
=20
 int main(int argc, char **argv)
diff --git a/tests/qtest/tpm-tests.c b/tests/qtest/tpm-tests.c
index 6e45a0ba85..a2f2838e15 100644
--- a/tests/qtest/tpm-tests.c
+++ b/tests/qtest/tpm-tests.c
@@ -30,7 +30,7 @@ tpm_test_swtpm_skip(void)
 }
=20
 void tpm_test_swtpm_test(const char *src_tpm_path, tx_func *tx,
-                         const char *ifmodel)
+                         const char *ifmodel, const char *machine_options)
 {
     char *args =3D NULL;
     QTestState *s;
@@ -47,10 +47,11 @@ void tpm_test_swtpm_test(const char *src_tpm_path, tx_f=
unc *tx,
     g_assert_true(succ);
=20
     args =3D g_strdup_printf(
+        "%s "
         "-chardev socket,id=3Dchr,path=3D%s "
         "-tpmdev emulator,id=3Ddev,chardev=3Dchr "
         "-device %s,tpmdev=3Ddev",
-        addr->u.q_unix.path, ifmodel);
+        machine_options ? : "", addr->u.q_unix.path, ifmodel);
=20
     s =3D qtest_start(args);
     g_free(args);
@@ -78,7 +79,8 @@ void tpm_test_swtpm_test(const char *src_tpm_path, tx_fun=
c *tx,
 void tpm_test_swtpm_migration_test(const char *src_tpm_path,
                                    const char *dst_tpm_path,
                                    const char *uri, tx_func *tx,
-                                   const char *ifmodel)
+                                   const char *ifmodel,
+                                   const char *machine_options)
 {
     gboolean succ;
     GPid src_tpm_pid, dst_tpm_pid;
@@ -100,7 +102,7 @@ void tpm_test_swtpm_migration_test(const char *src_tpm_=
path,
=20
     tpm_util_migration_start_qemu(&src_qemu, &dst_qemu,
                                   src_tpm_addr, dst_tpm_addr, uri,
-                                  ifmodel);
+                                  ifmodel, machine_options);
=20
     tpm_util_startup(src_qemu, tx);
     tpm_util_pcrextend(src_qemu, tx);
diff --git a/tests/qtest/tpm-tests.h b/tests/qtest/tpm-tests.h
index b97688fe75..a5df35ab5b 100644
--- a/tests/qtest/tpm-tests.h
+++ b/tests/qtest/tpm-tests.h
@@ -16,11 +16,12 @@
 #include "tpm-util.h"
=20
 void tpm_test_swtpm_test(const char *src_tpm_path, tx_func *tx,
-                         const char *ifmodel);
+                         const char *ifmodel, const char *machine_options)=
;
=20
 void tpm_test_swtpm_migration_test(const char *src_tpm_path,
                                    const char *dst_tpm_path,
                                    const char *uri, tx_func *tx,
-                                   const char *ifmodel);
+                                   const char *ifmodel,
+                                   const char *machine_options);
=20
 #endif /* TESTS_TPM_TESTS_H */
diff --git a/tests/qtest/tpm-tis-swtpm-test.c b/tests/qtest/tpm-tis-swtpm-t=
est.c
index 9f58a3a92b..9470f15751 100644
--- a/tests/qtest/tpm-tis-swtpm-test.c
+++ b/tests/qtest/tpm-tis-swtpm-test.c
@@ -29,7 +29,8 @@ static void tpm_tis_swtpm_test(const void *data)
 {
     const TestState *ts =3D data;
=20
-    tpm_test_swtpm_test(ts->src_tpm_path, tpm_util_tis_transfer, "tpm-tis"=
);
+    tpm_test_swtpm_test(ts->src_tpm_path, tpm_util_tis_transfer,
+                        "tpm-tis", NULL);
 }
=20
 static void tpm_tis_swtpm_migration_test(const void *data)
@@ -37,7 +38,7 @@ static void tpm_tis_swtpm_migration_test(const void *data=
)
     const TestState *ts =3D data;
=20
     tpm_test_swtpm_migration_test(ts->src_tpm_path, ts->dst_tpm_path, ts->=
uri,
-                                  tpm_util_tis_transfer, "tpm-tis");
+                                  tpm_util_tis_transfer, "tpm-tis", NULL);
 }
=20
 int main(int argc, char **argv)
diff --git a/tests/qtest/tpm-util.c b/tests/qtest/tpm-util.c
index e08b137651..7ecdae2fc6 100644
--- a/tests/qtest/tpm-util.c
+++ b/tests/qtest/tpm-util.c
@@ -258,23 +258,27 @@ void tpm_util_migration_start_qemu(QTestState **src_q=
emu,
                                    SocketAddress *src_tpm_addr,
                                    SocketAddress *dst_tpm_addr,
                                    const char *miguri,
-                                   const char *ifmodel)
+                                   const char *ifmodel,
+                                   const char *machine_options)
 {
     char *src_qemu_args, *dst_qemu_args;
=20
     src_qemu_args =3D g_strdup_printf(
+        "%s "
         "-chardev socket,id=3Dchr,path=3D%s "
         "-tpmdev emulator,id=3Ddev,chardev=3Dchr "
         "-device %s,tpmdev=3Ddev ",
-        src_tpm_addr->u.q_unix.path, ifmodel);
+        machine_options ? : "", src_tpm_addr->u.q_unix.path, ifmodel);
=20
     *src_qemu =3D qtest_init(src_qemu_args);
=20
     dst_qemu_args =3D g_strdup_printf(
+        "%s "
         "-chardev socket,id=3Dchr,path=3D%s "
         "-tpmdev emulator,id=3Ddev,chardev=3Dchr "
         "-device %s,tpmdev=3Ddev "
         "-incoming %s",
+        machine_options ? : "",
         dst_tpm_addr->u.q_unix.path,
         ifmodel, miguri);
=20
diff --git a/tests/qtest/tpm-util.h b/tests/qtest/tpm-util.h
index 5755698ad2..15e3924942 100644
--- a/tests/qtest/tpm-util.h
+++ b/tests/qtest/tpm-util.h
@@ -44,7 +44,8 @@ void tpm_util_migration_start_qemu(QTestState **src_qemu,
                                    SocketAddress *src_tpm_addr,
                                    SocketAddress *dst_tpm_addr,
                                    const char *miguri,
-                                   const char *ifmodel);
+                                   const char *ifmodel,
+                                   const char *machine_options);
=20
 void tpm_util_wait_for_migration_complete(QTestState *who);
=20
--=20
2.20.1

