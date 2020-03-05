Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3138759lfi;
        Thu, 5 Mar 2020 08:56:50 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu44J45beUG9CwrPzmZEQepIxZ7kllxlDO7Qs2e5hE8oYP1QLMKIn6W62mjm8RrjYygUu9R
X-Received: by 2002:a37:f511:: with SMTP id l17mr5846638qkk.479.1583427410242;
        Thu, 05 Mar 2020 08:56:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583427410; cv=none;
        d=google.com; s=arc-20160816;
        b=nSilGY6jTBxadAvVjjOnfQrWrMUwH6vfB6t++qwJE+XykBWslgmWROefD4klqlib8Z
         b5nyXKPM7bB6e4ZJolC9f7xAFBtjKWQu8Hu1GvMBcNQe9tZjSpYXv7s09eH5P8L78HbX
         ZMglhmfnb+fFNeo1Tl/Qwil+ewUykqzBIpZxulu6z2C8xZDoN2pwohayr2w4wYibNB06
         R2rA10MOgUEIhVmz2YNrSnQNgzY1VzTVk/kv0J9XfqwtRwlcexsSscle4uzCm8BvDI86
         2fdW0UhLWg4stneHmJRq3ixL+fPc+byui8HSHRiMZgcGW+yh0R/dfDmST5qk7yn/0OMZ
         ExRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0immg2BzSxXI+Xb1U+rxyX9y8uG9J8JHPRuSEl901ys=;
        b=kYMdt46rPx9CPq9yxS1D+1v8vK6i8wSJvNboAB73jnTElRJ+R6qfNx4Py2Yk8fxyAA
         bKqfmrqqUniE6MYWJInAGSr7GRxTXAsRrfuLUMWezxsjfTndzr8vNs70k0v2gnq1Yyv5
         VSGHqnL2PDzMNqNvMKu67RXylrsIn64z/xGfJqnmtuFqUx7MFy1nRFoBEiKu9m2MMeLQ
         nHbqeyDpvAdRlKVN499OZ2dgAO0SXX8EtTjchEab4+186MPKsd8DT77C9P0lDUACb1HW
         NnAm2EHfNEi5E85d7EuYH/qGJbKpooyWtQIgucHpz0AN+LzN1lgwCqdNhWzmCOpc1DhI
         xNog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aqixgZHW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si3251585qkl.122.2020.03.05.08.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 08:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aqixgZHW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9tnl-0004jw-KJ
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 11:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j9tjq-0005eg-R5
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 11:52:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j9tjm-0007i1-HR
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 11:52:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33546
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j9tjm-0007ha-CM
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 11:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583427162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0immg2BzSxXI+Xb1U+rxyX9y8uG9J8JHPRuSEl901ys=;
 b=aqixgZHWqKoO2mVQW6iD3WyItR+QFyS+DVZFhLJPD/QC4tAXVt6jRaiKfSziTFE8YlYq9B
 w2E1py0YS9+BbVQQyknyPBz6qq2SAAc4Z1VqIwSgSyJTZrD7nW+vLaJbc7tHi9bCDK5K4n
 wisbMyCQ/IiIq/eF/c+anU3rsq2Gy50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-5kp6NBxGMPOMertFuDoyQg-1; Thu, 05 Mar 2020 11:52:40 -0500
X-MC-Unique: 5kp6NBxGMPOMertFuDoyQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E31A18C35A4;
 Thu,  5 Mar 2020 16:52:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED804271BA;
 Thu,  5 Mar 2020 16:52:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v5 08/10] test: tpm: pass optional machine options to swtpm
 test functions
Date: Thu,  5 Mar 2020 17:51:47 +0100
Message-Id: <20200305165149.618-9-eric.auger@redhat.com>
In-Reply-To: <20200305165149.618-1-eric.auger@redhat.com>
References: <20200305165149.618-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: SM4+BsPtXIPu

We plan to use swtpm test functions on ARM for testing the
sysbus TPM-TIS device. However on ARM there is no default machine
type. So we need to explictly pass some machine options on startup.
Let's allow this by adding a new parameter to both swtpm test
functions and update all call sites.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 tests/qtest/tpm-tests.h          |  5 +++--
 tests/qtest/tpm-util.h           |  3 ++-
 tests/qtest/tpm-crb-swtpm-test.c |  5 +++--
 tests/qtest/tpm-tests.c          | 10 ++++++----
 tests/qtest/tpm-tis-swtpm-test.c |  5 +++--
 tests/qtest/tpm-util.c           |  8 ++++++--
 6 files changed, 23 insertions(+), 13 deletions(-)

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
--=20
2.20.1

