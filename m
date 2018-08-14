Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4349573wru;
        Tue, 14 Aug 2018 10:53:51 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwIavqZcfCmo+V1fn2JuSR0fvT0PlVcJL4e56Y1TiRFxYYiUNMjO+PIUJFH7RmHrBx6ZVNl
X-Received: by 2002:aed:3fa8:: with SMTP id s37-v6mr14596892qth.148.1534269231876;
        Tue, 14 Aug 2018 10:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534269231; cv=none;
        d=google.com; s=arc-20160816;
        b=wXiT4L4nTkoKToxoCPh/yM/YQmQ9pfzbcgI/4sk0YWvqV+qrTjb7qbUvXBMOpKVe0v
         gUsaV5RI5SJ+0gujKf6lcKMyTskcAy2C36CpsqqEGfLPRZOkXtNzR/3a579yND41Is+V
         e51TgNDv2wFCmK5X8e9tGwg5YQf+swW5/NRu5M+qdybFnw2Dg2UC+7IHccNTFFK9YyG4
         3/L0t8KvOq196NjJRSbekZydNl+W6PrcLkZ1d7h6GnOuqc+7QA+IDPWeBm5Gup1UDXAw
         hfYaaE2vgifexz+rz1ledBnluyIyHhiH3Upp3OzjYMZH+T7Orp5iMqLq8qbNS7q93gwS
         ckgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=73ILCcc0hCw6N1dlrVghfk0jJhFna5IwH1NvNb/vNMY=;
        b=Wdt95wSP4GKWzxUWwtYnEBni1nKrbqbwTr+Axqny/Pbe+Igw0uW4DqFC08Apl4y4AK
         yHH9pVClJnnWdKcLWNfylOLr0arJYzCLHZIDErRWviJINst0ouYjB3mucTyxr61LjAT5
         363+y0+x+ZyJGgS8gfSeUYhlDYTtA8R2f/SexUtQu2tEJxKzhf2LqzVf4PDFrSSRxjrQ
         KkdUq3iXAAkK1iOaQ3E/e945222nkNih8kKSZAO0zrg8Ioub3Xb6hFqaXsdnRCqyanVc
         ctRQR2o4KeT09gIbx+64XoOTSo13JdzIDL6Jtlp3V1sDFZ6F8pdg1jJOU1XbGOShAXoY
         CRQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k12-v6si3613774qti.3.2018.08.14.10.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 10:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpdVv-0005R1-AJ
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 13:53:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdQh-0008Nm-Sj
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:48:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpdQR-0004Wm-Pn
	for qemu-devel@nongnu.org; Tue, 14 Aug 2018 13:48:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34034 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpdPr-0004BJ-MA; Tue, 14 Aug 2018 13:47:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 791D840203F2;
	Tue, 14 Aug 2018 16:30:03 +0000 (UTC)
Received: from localhost (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DB7F2156712;
	Tue, 14 Aug 2018 16:30:02 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 14 Aug 2018 17:27:39 +0100
Message-Id: <20180814162739.11814-7-stefanha@redhat.com>
In-Reply-To: <20180814162739.11814-1-stefanha@redhat.com>
References: <20180814162739.11814-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 14 Aug 2018 16:30:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 14 Aug 2018 16:30:03 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v6 6/6] Add QTest testcase for the Intel
 Hexadecimal
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rK/ZHiHiE6rs

From: Su Hang <suhang16@mails.ucas.ac.cn>

'test.hex' file is a memory test pattern stored in Hexadecimal Object
Format.  It loads at 0x10000 in RAM and contains values from 0 through
255.

The test case verifies that the expected memory test pattern was loaded.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Suggested-by: Steffen Gortz <qemu.ml@steffen-goertz.de>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 MAINTAINERS                          |  6 ++++
 configure                            |  4 +++
 tests/Makefile.include               |  2 ++
 tests/hexloader-test.c               | 45 ++++++++++++++++++++++++++++
 tests/hex-loader-check-data/test.hex | 18 +++++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 tests/hexloader-test.c
 create mode 100644 tests/hex-loader-check-data/test.hex

diff --git a/MAINTAINERS b/MAINTAINERS
index 666e936812..c48d9271cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1323,6 +1323,12 @@ F: hw/core/generic-loader.c
 F: include/hw/core/generic-loader.h
 F: docs/generic-loader.txt
=20
+Intel Hexadecimal Object File Loader
+M: Su Hang <suhang16@mails.ucas.ac.cn>
+S: Maintained
+F: tests/hexloader-test.c
+F: tests/hex-loader-check-data/test.hex
+
 CHRP NVRAM
 M: Thomas Huth <thuth@redhat.com>
 S: Maintained
diff --git a/configure b/configure
index 2a7796ea80..db97930314 100755
--- a/configure
+++ b/configure
@@ -7382,6 +7382,10 @@ for test_file in $(find $source_path/tests/acpi-te=
st-data -type f)
 do
     FILES=3D"$FILES tests/acpi-test-data$(echo $test_file | sed -e 's/.*=
acpi-test-data//')"
 done
+for test_file in $(find $source_path/tests/hex-loader-check-data -type f=
)
+do
+    FILES=3D"$FILES tests/hex-loader-check-data$(echo $test_file | sed -=
e 's/.*hex-loader-check-data//')"
+done
 mkdir -p $DIRS
 for f in $FILES ; do
     if [ -e "$source_path/$f" ] && [ "$pwd_is_source_path" !=3D "y" ]; t=
hen
diff --git a/tests/Makefile.include b/tests/Makefile.include
index a49282704e..760a0f18b6 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -386,6 +386,7 @@ check-qtest-arm-y +=3D tests/test-arm-mptimer$(EXESUF=
)
 gcov-files-arm-y +=3D hw/timer/arm_mptimer.c
 check-qtest-arm-y +=3D tests/boot-serial-test$(EXESUF)
 check-qtest-arm-y +=3D tests/sdhci-test$(EXESUF)
+check-qtest-arm-y +=3D tests/hexloader-test$(EXESUF)
=20
 check-qtest-aarch64-y =3D tests/numa-test$(EXESUF)
 check-qtest-aarch64-y +=3D tests/sdhci-test$(EXESUF)
@@ -773,6 +774,7 @@ tests/qmp-test$(EXESUF): tests/qmp-test.o
 tests/device-introspect-test$(EXESUF): tests/device-introspect-test.o
 tests/rtc-test$(EXESUF): tests/rtc-test.o
 tests/m48t59-test$(EXESUF): tests/m48t59-test.o
+tests/hexloader-test$(EXESUF): tests/hexloader-test.o
 tests/endianness-test$(EXESUF): tests/endianness-test.o
 tests/spapr-phb-test$(EXESUF): tests/spapr-phb-test.o $(libqos-obj-y)
 tests/prom-env-test$(EXESUF): tests/prom-env-test.o $(libqos-obj-y)
diff --git a/tests/hexloader-test.c b/tests/hexloader-test.c
new file mode 100644
index 0000000000..afb620694d
--- /dev/null
+++ b/tests/hexloader-test.c
@@ -0,0 +1,45 @@
+/*
+ * QTest testcase for the Intel Hexadecimal Object File Loader
+ *
+ * Authors:
+ *  Su Hang <suhang16@mails.ucas.ac.cn> 2018
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+/* Load 'test.hex' and verify that the in-memory contents are as expecte=
d.
+ * 'test.hex' is a memory test pattern stored in Hexadecimal Object
+ * format.  It loads at 0x10000 in RAM and contains values from 0 throug=
h
+ * 255.
+ */
+static void hex_loader_test(void)
+{
+    unsigned int i;
+    const unsigned int base_addr =3D 0x00010000;
+
+    QTestState *s =3D qtest_startf(
+        "-M vexpress-a9 -nographic -device loader,file=3Dtests/hex-loade=
r-check-data/test.hex");
+
+    for (i =3D 0; i < 256; ++i) {
+        uint8_t val =3D qtest_readb(s, base_addr + i);
+        g_assert_cmpuint(i, =3D=3D, val);
+    }
+    qtest_quit(s);
+}
+
+int main(int argc, char **argv)
+{
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    qtest_add_func("/tmp/hex_loader", hex_loader_test);
+    ret =3D g_test_run();
+
+    return ret;
+}
diff --git a/tests/hex-loader-check-data/test.hex b/tests/hex-loader-chec=
k-data/test.hex
new file mode 100644
index 0000000000..008a90bd4d
--- /dev/null
+++ b/tests/hex-loader-check-data/test.hex
@@ -0,0 +1,18 @@
+:020000040001F9
+:10000000000102030405060708090a0b0c0d0e0f78
+:10001000101112131415161718191a1b1c1d1e1f68
+:10002000202122232425262728292a2b2c2d2e2f58
+:10003000303132333435363738393a3b3c3d3e3f48
+:10004000404142434445464748494a4b4c4d4e4f38
+:10005000505152535455565758595a5b5c5d5e5f28
+:10006000606162636465666768696a6b6c6d6e6f18
+:10007000707172737475767778797a7b7c7d7e7f08
+:10008000808182838485868788898a8b8c8d8e8ff8
+:10009000909192939495969798999a9b9c9d9e9fe8
+:1000a000a0a1a2a3a4a5a6a7a8a9aaabacadaeafd8
+:1000b000b0b1b2b3b4b5b6b7b8b9babbbcbdbebfc8
+:1000c000c0c1c2c3c4c5c6c7c8c9cacbcccdcecfb8
+:1000d000d0d1d2d3d4d5d6d7d8d9dadbdcdddedfa8
+:1000e000e0e1e2e3e4e5e6e7e8e9eaebecedeeef98
+:1000f000f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff88
+:00000001FF
--=20
2.17.1

