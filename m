Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp468752wru;
        Wed, 25 Jul 2018 02:03:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcm72+Xj2re/+H4ib3of2rgy4vgLFSVz3Jwyiu+T2eusZZJAdhBXjsGvm5WNh+KpTN1AXi2
X-Received: by 2002:ac8:359b:: with SMTP id k27-v6mr19316233qtb.15.1532509434030;
        Wed, 25 Jul 2018 02:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509434; cv=none;
        d=google.com; s=arc-20160816;
        b=jrpVcN6zx9rmkTwgnY7cnabFGvEm2sXX6BQiuQ/P9ps+55TssRiC7iG7El1ILJX0Nz
         0hMbm3QfnmpuNcRXcjxzGXtGlSwMmkEtlfHDNkdJmDahtp76KkLRK6ADhtPHXEYCb/xo
         QBDB8qKb+3bUQNn2yVXlYygDZgur0O03RT0YQJ0G/pfLsQViFoMZs1Ak37quGgImu2fC
         vaoSmxUgh6z3Ry+FbteXetefrKtHtbzOfONPCXwReOfyCbuO8ns7jKYRSwtOjb5ty3CU
         DBjUV0whogL4Nmw43AOti83PPFzuxr8MIr8LVXyPlMCENrfpIXK3uqAz8Qbo5Iz0rcOv
         mRkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1RjlHy6yR4t4XviUqesdt5b7/9E51d8IRQDZk0qzFDc=;
        b=bg4DnxsEX6NM17ugCBm3mpqIZAkZk+8kdZTo+towLLqocjZ8Kyua3v5ZUZ5UxX7Dv6
         1ZuW53QRbebqiCNsZyZb6psvrMoNsW/NQodAhTqLpvfm1SZVtV8nibgIyUwuJv5u0D50
         Jzx6sd1wFx0d9vVo7xqfN5DpfaieUyZWA47kRxKPE/2qvHQ2gI9DBv/PTcmFqJnS71Py
         4MH0gS6BlkUkbBDn3NV+RB/99ypMojDg5tg35++rrqsnbfcNMvtw5i/p+SH4yTYg1nXx
         dC+NUAz13LUSUPRo2eLQmw4cO+vX5L5fSHZ2+ygPoeTIveKzlGEe/Ma6rsV3NEDHkzFa
         cLnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4-v6si12331476qvn.211.2018.07.25.02.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 02:03:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiFi5-00034j-Ey
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 05:03:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeT-0008Ff-9t
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:00:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fiFeQ-0002LX-CG
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 05:00:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51854 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fiFeQ-0002L7-77; Wed, 25 Jul 2018 05:00:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74A9C401DEA9;
	Wed, 25 Jul 2018 09:00:05 +0000 (UTC)
Received: from localhost (ovpn-117-157.ams2.redhat.com [10.36.117.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 213E72026D68;
	Wed, 25 Jul 2018 09:00:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Jul 2018 09:59:44 +0100
Message-Id: <20180725085944.11856-8-stefanha@redhat.com>
In-Reply-To: <20180725085944.11856-1-stefanha@redhat.com>
References: <20180725085944.11856-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 25 Jul 2018 09:00:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 25 Jul 2018 09:00:05 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 7/7] Add QTest testcase for the Intel
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
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Rm093yWazvJ

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
 tests/hexloader-test.c               | 56 ++++++++++++++++++++++++++++
 tests/hex-loader-check-data/test.hex | 12 ++++++
 5 files changed, 80 insertions(+)
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
index 0000000000..78b566f8b1
--- /dev/null
+++ b/tests/hexloader-test.c
@@ -0,0 +1,56 @@
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
+    4,   208, 159, 229, 22,  0,   0,   235, 254, 255, 255, 234, 152, 16,  1,
+    0,   4,   176, 45,  229, 0,   176, 141, 226, 12,  208, 77,  226, 8,   0,
+    11,  229, 6,   0,   0,   234, 8,   48,  27,  229, 0,   32,  211, 229, 44,
+    48,  159, 229, 0,   32,  131, 229, 8,   48,  27,  229, 1,   48,  131, 226,
+    8,   48,  11,  229, 8,   48,  27,  229, 0,   48,  211, 229, 0,   0,   83,
+    227, 244, 255, 255, 26,  0,   0,   160, 225, 0,   208, 139, 226, 4,   176,
+    157, 228, 30,  255, 47,  225, 0,   16,  31,  16,  0,   72,  45,  233, 4,
+    176, 141, 226, 8,   0,   159, 229, 230, 255, 255, 235, 0,   0,   160, 225,
+    0,   136, 189, 232, 132, 0,   1,   0,   0,   16,  31,  16,  72,  101, 108,
+    108, 111, 32,  119, 111, 114, 108, 100, 33,  10,  0};
+
+/* success if no crash or abort */
+static void hex_loader_test(void)
+{
+    unsigned int i;
+    unsigned char memory_content[BIN_SIZE];
+    const unsigned int base_addr = 0x00010000;
+
+    QTestState *s = qtest_startf(
+        "-M emcraft-sf2 -nographic -kernel ./tests/hex-loader-check-data/test.hex");
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

