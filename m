Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3250081wru;
        Mon, 13 Aug 2018 12:14:41 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyayxQqxLMwj23hX1WM4xqFvT2SDA1SnMmelyyycS7dEYJgKsKRbA+u8jAT/9dks5Dsncfp
X-Received: by 2002:a37:986:: with SMTP id 128-v6mr16382762qkj.437.1534187681608;
        Mon, 13 Aug 2018 12:14:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534187681; cv=none;
        d=google.com; s=arc-20160816;
        b=tOaNX1ChfAyjJekW/fx9yr1BEFVHWx4HgHM3Vjq3zVogwM52rRl2ylqA0PY+sFbid6
         N+sdjtZRNCDKDXP3LYcTtAFqSX6aCq7miTAGm9UkVml3ZPUfTJ3mSMF2mJ/lMcPMnNIH
         3x3zkurmx77k6v/ZbbpFK2y6HOUIGLZl63MDIMypPehU5vq0DIG15cJav9XyYE7wTEQL
         YFZ9qe6BpJk82TMoFdRdum5LRViVSKWsDOVOPKhZxZ59LG1BO4HKqNpmIGl+HXM5Scki
         0ihRHIbPz28hYwmsKhGMvWa76+InIjwtk+pprZJEQTea+bZ6EoRihpNPhLaETYVRM0qt
         OE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=V2HYfEeaWrlXmmlSZ4agenycgaobxRAoqsh2Py4qO+c=;
        b=QGkjVzYcg2BADF0pXcsTTbPZr5yUb+osPMsN+BLfESYbvqZJ/EBgOfSdEP0JOHBuzI
         Qik11hOE6Dx0i46M1vqcpkhT/YuByfzxiBC7PRgLoYJcf0LV+04ZGn46VjnrFNzMnAr/
         CbP8ni53vLPP0v3eMQ3clfIC9RkZ//XPQt78LTf67ktiuVAs9+ldxiJxdLgL64LYQMS6
         OW3NbJZ3uhf7MX9hUSWGe1dUBomkhiL+N8hc6NFls9fWuGFquODCXzv2a9SlisuN4DuR
         rK7CcNJo3H+TGTw4DkfK6VDmOsrY2QbfT2ili1ISMqn6mBc1qKvzhKsRh3+CmQG4pf7A
         iwHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c9-v6si1745964qtn.172.2018.08.13.12.14.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Aug 2018 12:14:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpIIb-0001mN-4b
	for alex.bennee@linaro.org; Mon, 13 Aug 2018 15:14:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHsw-000232-CC
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 14:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHsr-00041g-Qn
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 14:48:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41396 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpHsr-00041Q-Kb; Mon, 13 Aug 2018 14:48:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 20EC940241C5;
	Mon, 13 Aug 2018 18:48:05 +0000 (UTC)
Received: from localhost (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A818020389E0;
	Mon, 13 Aug 2018 18:48:04 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 13 Aug 2018 19:46:24 +0100
Message-Id: <20180813184624.12071-7-stefanha@redhat.com>
In-Reply-To: <20180813184624.12071-1-stefanha@redhat.com>
References: <20180813184624.12071-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 13 Aug 2018 18:48:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 13 Aug 2018 18:48:05 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v5 6/6] Add QTest testcase for the Intel
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
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n9wb7306Mix7

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
---
 MAINTAINERS                          |  6 ++++
 configure                            |  4 +++
 tests/Makefile.include               |  2 ++
 tests/hexloader-test.c               | 41 ++++++++++++++++++++++++++++
 tests/hex-loader-check-data/test.hex | 18 ++++++++++++
 5 files changed, 71 insertions(+)
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
index 0000000000..90e470e9db
--- /dev/null
+++ b/tests/hexloader-test.c
@@ -0,0 +1,41 @@
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
+/* success if no crash or abort */
+static void hex_loader_test(void)
+{
+    unsigned int i;
+    const unsigned int base_addr = 0x00010000;
+
+    QTestState *s = qtest_startf(
+        "-M vexpress-a9 -nographic -device loader,file=tests/hex-loader-check-data/test.hex");
+
+    for (i = 0; i < 256; ++i) {
+        uint8_t val = qtest_readb(s, base_addr + i);
+        g_assert_cmpuint(i, ==, val);
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
-- 
2.17.1

