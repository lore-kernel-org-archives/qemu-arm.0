Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp161700wru;
        Fri, 3 Aug 2018 07:52:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdw+/eTComgv+t0RoCXJYXhT8StGGIevXUIhKiHYl9Qnzzk5gf4ZJrcOY3GgYoTW0rVNAkM
X-Received: by 2002:aed:3901:: with SMTP id l1-v6mr4171283qte.315.1533307942734;
        Fri, 03 Aug 2018 07:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533307942; cv=none;
        d=google.com; s=arc-20160816;
        b=RQy9l7a9CG5tWGXGZbVD1tvdbUS1A3GAWWqAvfgyt46NX0ywDWlYDnMuxIxyxaLYK2
         qK/2P0xpWZsxEMrCEfg9Rii/bdIsgeGe2r+8tA35tpQrXusAXXbsEVLNG1AkGqSrNCBc
         NuE7UlW8++sFWMpgckjxecS08gb9ydSomxsdsSrgaW5K/dKKKzEPPcovviY91YqD7dHh
         jBATeDaPyELU2fSodDGSh1RXvSyDSSwzehaplPxkODqCdqS+IeNxqfpABEdTewTm67an
         F+DbQzZvGeMjpzX/qr0ooAAN5S5HAtpEW/JGaFSdSj0Mt+uq3KjFJz2qYzA+DTDjzD4k
         AHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=EcTR1f/DWoV3VN/66pnW9YeTAaIqx4Fzzfnt4dfSHUk=;
        b=z6dfrKCwOG8GZpJx2QU/ZtBzIWkV99IbghGpm4pheoM6W8XqS258b5gxUzZTWxq7wo
         HZ4VdoZ2bgpKdMb4i01i8TG283amMZiCQHsdgCE68vI+Gx+4roQrFaAsfrSBDtwAvNqH
         xg89rdR5fBtKhOJ+OCKBUU/Imk3D/7bFT5d4WWBWkm91waSxZZyQwuX7Gc06ZAwgn92O
         a+os/l+jUZWrvmzJ8b4IlOwhWEOKylWcaoTyfyqLW5rZcTNJuU5lfdCAEs9f6DvN96Tj
         ndw4i5PuR9ctIvQuYBwdSoUYZ/u3DW4aUoKiS99n9jy6uD/8+jcNvB84ERJa04DOgDX4
         TM7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r4-v6si3554476qkc.173.2018.08.03.07.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 07:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flbRG-0006lv-80
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 10:52:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMm-0002mk-HX
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1flbMl-0007j0-1a
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 10:47:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56242 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1flbMk-0007ii-RC; Fri, 03 Aug 2018 10:47:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 313B840216F9;
	Fri,  3 Aug 2018 14:47:42 +0000 (UTC)
Received: from localhost (ovpn-117-231.ams2.redhat.com [10.36.117.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44AB01007087;
	Fri,  3 Aug 2018 14:47:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  3 Aug 2018 15:47:21 +0100
Message-Id: <20180803144721.17036-7-stefanha@redhat.com>
In-Reply-To: <20180803144721.17036-1-stefanha@redhat.com>
References: <20180803144721.17036-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 03 Aug 2018 14:47:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 03 Aug 2018 14:47:42 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 6/6] Add QTest testcase for the Intel
 Hexadecimal
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EuTcD/4/CH6A

From: Su Hang <suhang16@mails.ucas.ac.cn>

'test.hex' file is a bare metal ARM software stored in Hexadecimal
Object Format. When it's loaded by QEMU, it will print "Hello world!\n"
on console.

`pre_store` array in 'hexloader-test.c' file, stores the binary format
of 'test.hex' file, which is used to verify correctness.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Suggested-by: Steffen Gortz <qemu.ml@steffen-goertz.de>
Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS                          |  6 +++
 configure                            |  4 ++
 tests/Makefile.include               |  2 +
 tests/hexloader-test.c               | 60 ++++++++++++++++++++++++++++
 tests/hex-loader-check-data/test.hex | 12 ++++++
 5 files changed, 84 insertions(+)
 create mode 100644 tests/hexloader-test.c
 create mode 100644 tests/hex-loader-check-data/test.hex

diff --git a/MAINTAINERS b/MAINTAINERS
index 666e936812..c48d9271cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1323,6 +1323,12 @@ F: hw/core/generic-loader.c
 F: include/hw/core/generic-loader.h
 F: docs/generic-loader.txt
 
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
@@ -7382,6 +7382,10 @@ for test_file in $(find $source_path/tests/acpi-test-data -type f)
 do
     FILES="$FILES tests/acpi-test-data$(echo $test_file | sed -e 's/.*acpi-test-data//')"
 done
+for test_file in $(find $source_path/tests/hex-loader-check-data -type f)
+do
+    FILES="$FILES tests/hex-loader-check-data$(echo $test_file | sed -e 's/.*hex-loader-check-data//')"
+done
 mkdir -p $DIRS
 for f in $FILES ; do
     if [ -e "$source_path/$f" ] && [ "$pwd_is_source_path" != "y" ]; then
diff --git a/tests/Makefile.include b/tests/Makefile.include
index a49282704e..760a0f18b6 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -386,6 +386,7 @@ check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
 gcov-files-arm-y += hw/timer/arm_mptimer.c
 check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
 check-qtest-arm-y += tests/sdhci-test$(EXESUF)
+check-qtest-arm-y += tests/hexloader-test$(EXESUF)
 
 check-qtest-aarch64-y = tests/numa-test$(EXESUF)
 check-qtest-aarch64-y += tests/sdhci-test$(EXESUF)
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
index 0000000000..8818bd45f8
--- /dev/null
+++ b/tests/hexloader-test.c
@@ -0,0 +1,60 @@
+/*
+ * QTest testcase for the Intel Hexadecimal Object File Loader
+ *
+ * Authors:
+ *  Su Hang <suhang16@mails.ucas.ac.cn> 2018
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest.h"
+
+#define BIN_SIZE 146
+
+static unsigned char pre_store[BIN_SIZE] = {
+  0x04, 0xd0, 0x9f, 0xe5,   0x16, 0x00, 0x00, 0xeb,   0xfe, 0xff, 0xff, 0xea,
+  0x98, 0x10, 0x01, 0x00,   0x04, 0xb0, 0x2d, 0xe5,   0x00, 0xb0, 0x8d, 0xe2,
+  0x0c, 0xd0, 0x4d, 0xe2,   0x08, 0x00, 0x0b, 0xe5,   0x06, 0x00, 0x00, 0xea,
+  0x08, 0x30, 0x1b, 0xe5,   0x00, 0x20, 0xd3, 0xe5,   0x2c, 0x30, 0x9f, 0xe5,
+  0x00, 0x20, 0x83, 0xe5,   0x08, 0x30, 0x1b, 0xe5,   0x01, 0x30, 0x83, 0xe2,
+  0x08, 0x30, 0x0b, 0xe5,   0x08, 0x30, 0x1b, 0xe5,   0x00, 0x30, 0xd3, 0xe5,
+  0x00, 0x00, 0x53, 0xe3,   0xf4, 0xff, 0xff, 0x1a,   0x00, 0x00, 0xa0, 0xe1,
+  0x00, 0xd0, 0x8b, 0xe2,   0x04, 0xb0, 0x9d, 0xe4,   0x1e, 0xff, 0x2f, 0xe1,
+  0x00, 0x10, 0x1f, 0x10,   0x00, 0x48, 0x2d, 0xe9,   0x04, 0xb0, 0x8d, 0xe2,
+  0x08, 0x00, 0x9f, 0xe5,   0xe6, 0xff, 0xff, 0xeb,   0x00, 0x00, 0xa0, 0xe1,
+  0x00, 0x88, 0xbd, 0xe8,   0x84, 0x00, 0x01, 0x00,   0x00, 0x10, 0x1f, 0x10,
+  'H',  'e',  'l',  'l',    'o',  ' ',  'w',  'o',    'r',  'l',  'd',  '!',
+  '\n', '\0'
+};
+
+/* success if no crash or abort */
+static void hex_loader_test(void)
+{
+    unsigned int i;
+    unsigned char memory_content[BIN_SIZE];
+    const unsigned int base_addr = 0x00010000;
+
+    QTestState *s = qtest_startf(
+        "-M emcraft-sf2 -nographic -device loader,file=tests/hex-loader-check-data/test.hex");
+
+    for (i = 0; i < BIN_SIZE; ++i) {
+        memory_content[i] = qtest_readb(s, base_addr + i);
+        g_assert_cmpuint(memory_content[i], ==, pre_store[i]);
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
+    ret = g_test_run();
+
+    return ret;
+}
diff --git a/tests/hex-loader-check-data/test.hex b/tests/hex-loader-check-data/test.hex
new file mode 100644
index 0000000000..7e99b452f5
--- /dev/null
+++ b/tests/hex-loader-check-data/test.hex
@@ -0,0 +1,12 @@
+:020000040001F9
+:1000000004D09FE5160000EBFEFFFFEA9810010008
+:1000100004B02DE500B08DE20CD04DE208000BE5F8
+:10002000060000EA08301BE50020D3E52C309FE5F0
+:10003000002083E508301BE5013083E208300BE542
+:1000400008301BE50030D3E5000053E3F4FFFF1A4E
+:100050000000A0E100D08BE204B09DE41EFF2FE180
+:1000600000101F1000482DE904B08DE208009FE544
+:10007000E6FFFFEB0000A0E10088BDE8840001007E
+:1000800000101F1048656C6C6F20776F726C6421D4
+:020090000A0064
+:00000001FF
-- 
2.17.1

